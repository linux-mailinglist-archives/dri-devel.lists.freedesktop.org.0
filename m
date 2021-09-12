Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70F408499
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E9E6E0E4;
	Mon, 13 Sep 2021 06:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6AB89B98
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 22:05:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h17so1215351edj.6
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 15:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gsw3HQI/E9TwC/JC/Uvpmt4Q2Sj6/F4ssD+a1Ax5o1c=;
 b=ZrtCTyWOlbUMMilXz4T9VaOiEfDBfjm9kGmxyUOa2O2LQf39uG17LNE9zCc2atDxi8
 D3Sz+MwEM1Rlukt//Fxfv+iryk/O3ZjZeqfncbsslGQpUHmi2yOr4H+xulK+pxNz8WfV
 RQ2eRqzwELA6VeHUS44ZaDld3LyxJhwSA/w+RJa780ReYP2U3GArJwARZtG6PWgo/dfX
 niuCmlXwgyp5flO3xgM5PDp/O7BKPmuJCI8GFoezE621MKAE4KxBm5Uohkh/D4PleE0B
 h7NkE4KUyHKT2Qsj4vJBO9jkY1CdB9WYOoYV95OAMpwS5EmuqUxvUetxrBHEb9vo6+W8
 /HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gsw3HQI/E9TwC/JC/Uvpmt4Q2Sj6/F4ssD+a1Ax5o1c=;
 b=0pW9YzMEl8TvA5KNwczE3CKGjr/xks31j+MNH86FuEDTuJVWxiM81tKdtxA+9y0N6m
 /wEInDYe1Zz/ChryHSFpEIZsso5bnMgeE/3rf+vCMvqKEoXBUysk+7gj7+S3JVGiC9gB
 itDINMlpGun3W5OzFZ7QrALt8CMdx61uRNX48Omcs5L1rhKR8bCnZG4K28D741ZkRdHB
 7zLG1TMVtM4uzWaRZAFHyU6H6ycA7vL6EsCy619PDYg2LynLt3d8lcHdFN4TsTKuRGRE
 Rhp1cXhFQ+OJah9ws62jtZ9t095vJi2iSOUhY1MIVHs0m6QNlxAiFBUYJg+0sOG/xQDl
 IGaw==
X-Gm-Message-State: AOAM531VzkGwmeWKiLUlDkQ1cafhyqSQ2nzBxIiTj8gtSIlJhfxFRToZ
 CKWngbeQmUg/NtevAz3N/Uw=
X-Google-Smtp-Source: ABdhPJwY79Py82Co2FO620xbNi6IqrncYa7AumskksivIbO7qrmf+1r924bxxpyuDRGx6VBEwQmuuw==
X-Received: by 2002:a05:6402:3487:: with SMTP id
 v7mr9815129edc.102.1631484331039; 
 Sun, 12 Sep 2021 15:05:31 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id q11sm2896077edv.73.2021.09.12.15.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 15:05:30 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Cc: Adam Borowski <kilobyte@angband.pl>, Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH] drm/rockchip: fix a -Werror fail on !CONFIG_PM_SLEEP
Date: Mon, 13 Sep 2021 00:05:29 +0200
Message-ID: <6944260.REve3BRNNo@archbook>
In-Reply-To: <20210912212935.11965-1-kilobyte@angband.pl>
References: <20210912212935.11965-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Mon, 13 Sep 2021 06:21:14 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On Sonntag, 12. September 2021 23:29:35 CEST Adam Borowski wrote:
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
>  With Linus suddenly loving -Werror, let's get clean.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> b/drivers/gpu/drm/rockchip/cdn-dp-core.c index 8ab3247dbc4a..bee0f2d2a9be
> 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -1123,6 +1123,7 @@ static int cdn_dp_suspend(struct device *dev)
>  	return ret;
>  }
> 
> +#ifdef CONFIG_PM_SLEEP

I think we prefer the function attribute __maybe_unused here, because it also 
makes sure to get rid of the warning for any functions it references.

>  static int cdn_dp_resume(struct device *dev)
>  {
>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
> @@ -1135,6 +1136,7 @@ static int cdn_dp_resume(struct device *dev)
> 
>  	return 0;
>  }
> +#endif
> 
>  static int cdn_dp_probe(struct platform_device *pdev)
>  {

Regards,
Nicolas Frattaroli


