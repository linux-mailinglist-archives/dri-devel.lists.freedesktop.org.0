Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4A736C99
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 15:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C3C10E184;
	Tue, 20 Jun 2023 13:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E8D10E184
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 13:01:04 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso6131874e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687266062; x=1689858062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WP5vpynYgNMXy8TaoMzt2xjr96MBAbBOAmB71QFroMo=;
 b=j/mm2xaykap2KR0u/lkGswya0XJZf7Cwz+3donGqSzF3lZjQxbSkCPJCkKFd+5Oazh
 0C1zt8jSSrfzfT44oKzfGxQN/HsNnc6VvSVVB4MV/CdYjvoMR+hkKVPvBunJYUyjcqEZ
 IlGYQOBxX6kQMbNve5XwkqqmwZJ6ETkNDDUtyGQ/f9l02nGpwkjGza0Gzn0o4Z1SiMgv
 mNDYJWg6PO8cOd25V/dQxqMxIfIKGLUSSAn3gsc09vdhWx2QV7405O51IR/B3YHu0SgA
 6oEB6g0f56xWsZyyTq7QN2/yoyNH8fnczeoGZuKvQvL6CMGzvPnjLejpnnUEzM6TpVrX
 ueRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687266062; x=1689858062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WP5vpynYgNMXy8TaoMzt2xjr96MBAbBOAmB71QFroMo=;
 b=NLqb6ZY78lkfce9i1a252DFJAIP5yVqXGPEWQ3MZ2PM2Gf/zCsfUrB+6rnwyUXAqXW
 xZrvfCJeXd3/lNkRYP3bc5xHJmw0cLD/U8NbjSdjCQZ7Bu5fPx9pOO0zeSN2vimm8K5m
 1H4sssbIXAVJQM8csCViw5w6EgDyKXelO4vgODt3I+5vwK56tjEcHUR2dafRqkTllPtP
 GBV25KmZFfPsyniMe3uO+1BhYcpwlPqZY3zfB+FsYwdoWA+voB8Pu8pRYiz11eXClApK
 hOZCYtYfCejLS0TTj1snpOxGezSJ3ocQPeoqMef2vOqrpXHUDrWccFsqnboT47VdQKNE
 AWdw==
X-Gm-Message-State: AC+VfDyhRwqkROYjk9fUrwsPIAsGaP/61iVAX0sWcr+Xdean8I22vxiO
 WjRvIMP2+GF8sfcatvDSU0I=
X-Google-Smtp-Source: ACHHUZ5RZklLoxiYrBsJGz4Y7/hRtqLQMLNOq1dWXSnvJ3TXtvVT5SAQ8CYFLM6UQjcsgkz465BcVw==
X-Received: by 2002:ac2:5b1e:0:b0:4f8:5d15:99e5 with SMTP id
 v30-20020ac25b1e000000b004f85d1599e5mr5660162lfn.32.1687266061915; 
 Tue, 20 Jun 2023 06:01:01 -0700 (PDT)
Received: from [192.168.50.244] (83.8.116.77.ipv4.supernova.orange.pl.
 [83.8.116.77]) by smtp.gmail.com with ESMTPSA id
 ep8-20020a056512484800b004f26f437ad8sm358976lfb.53.2023.06.20.06.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 06:01:01 -0700 (PDT)
Message-ID: <52d0771d-b184-8154-6a1a-3f7bc223ac3a@gmail.com>
Date: Tue, 20 Jun 2023 15:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] gpu: drm: Optimize the unused variable ret
To: Li Dong <lidong@vivo.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230619113154.1980-1-lidong@vivo.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230619113154.1980-1-lidong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/06/2023 13:31, Li Dong wrote:
> Use zero as the return value instead of the unused variable ret
> 
> Signed-off-by: Li Dong <lidong@vivo.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 102e1fc7ee38..fec0d014fd0e 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -66,7 +66,6 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
>  static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>  {
>  	struct mipi_dsi_device *dsi = ctx->dsi;
> -	int ret = 0;
>  
>  	if (lock) {
>  		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> @@ -80,7 +79,7 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>  			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int s6d7aa0_on(struct s6d7aa0 *ctx)

Commit "drm/panel: s6d7aa0: remove the unneeded variable in
s6d7aa0_lock"[1] already does this.

Best regards
Artur

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c?id=c5dacfe2e6c1251276e29b4cdac771f504593523
