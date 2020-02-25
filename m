Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA116F928
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4CA6E228;
	Wed, 26 Feb 2020 08:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2116E8FD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 19:28:00 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id n7so77230pfn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 11:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=4tK5dhNanRBX4RJaY81MXL5uMw9VPzyZ3UaipGWjTeA=;
 b=ER4Hn5y39DsTdFq4OIFR/dyYBA/md+YMiH6Vlftw5sX/8I8svVtJwDWrl+hIbHDMI+
 9DIcp5qY/z7utP3Wlsfmi7SD9FiFgaz3JqHR/5d8KjPWEgJS68eSS/70DaFi0VVUDqjx
 qsRNASKUBSfoa6zYDICVI1jWv5RUSbtgDxLeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=4tK5dhNanRBX4RJaY81MXL5uMw9VPzyZ3UaipGWjTeA=;
 b=JTo/ECgIoaczdzwaZAqQ4Ka+TDT0ZGUCGpYVBtGtuhrB8BNuN3865hnzjqnGh+TVkT
 TZp68RnLtzwYce/lYGpRUuTZQqrmfK49nAyhx+BBRE3uaKkm0/lI3M5qVIxGGofzG0rL
 wKE50MxSQ4IdSpA/g8Z35aQW4+Xz4TeUyVUVi8hiTcBO7VDQKVSGhY84bXgdH0kqfpS/
 bIRZm0zsgWjQxuzbKJMbSVQjQ2Qomtd56mXk9XJTTfc3LNvoI6uLbiZUqZ/78jyrcmnE
 KrXKZjYLwG2roybk2VotTickVwuFzOqc1MYj/iNYLIFh/K/lbsbtr6g5RXwGe3k3dmz5
 KqmQ==
X-Gm-Message-State: APjAAAUPlLNP0YP/dA6y6kzIpvgk1K6tvokaKHBPjwpjPpMqLkQTcx4h
 HUaWKnkaFMCaYIMzdQ9gI1iXoQ==
X-Google-Smtp-Source: APXvYqx/CuR9tWXGTo9ivBHMqDj/j7Gy5ChN3CDCAyQZMV9kpz8TazoKp8muVVv6CLf1YgtUt+g7UA==
X-Received: by 2002:aa7:9808:: with SMTP id e8mr299103pfl.32.1582658880299;
 Tue, 25 Feb 2020 11:28:00 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id c26sm18406262pfj.8.2020.02.25.11.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 11:27:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
Subject: Re: [PATCH 1/4] drm/msm/dpu: Remove unused function arguments
From: Stephen Boyd <swboyd@chromium.org>
To: Drew Davenport <ddavenport@chromium.org>, dri-devel@lists.freedesktop.org
Date: Tue, 25 Feb 2020 11:27:58 -0800
Message-ID: <158265887882.177367.3011043098001339741@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, linux-arm-msm@vger.kernel.org,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Drew Davenport (2020-02-19 09:42:24)
> Several functions arguments in the resource manager are unused, so
> remove them.
> 
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 37 ++++++++++----------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 23f5b1433b357..dea1dba441fe7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -144,8 +144,7 @@ static int _dpu_rm_hw_blk_create(
>                 const struct dpu_mdss_cfg *cat,
>                 void __iomem *mmio,
>                 enum dpu_hw_blk_type type,
> -               uint32_t id,
> -               const void *hw_catalog_info)
> +               uint32_t id)

It would be good to use u32 instead of uint32_t in this code too. The
kernel style is to use the shorter name for that type.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
