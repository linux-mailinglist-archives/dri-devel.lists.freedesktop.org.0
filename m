Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145994560F0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 17:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACD36EB56;
	Thu, 18 Nov 2021 16:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984726EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 16:52:06 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id r26so15565891oiw.5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 08:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Md/3/5JKM+oVwuA7MgVwTq9uvS3LFmGmmFvpu2uaZik=;
 b=fj/+3S7DMb744W00SwXLVIK5nOQSESv3guuqih+RelIQ/bpTyiWCAyLOQSOjwPi/42
 zQlujAW2Yge8V1MDhzPhZND2RhySDzxgd3FZctXrbSjoOncX7Eu73soKd9at7zHyHjwm
 xoZjGgmnkJrwyVnCBkhB7gjkaoA2tPI8f88jiFyvcOh838rqQllNhTaelZxEv5BqTouD
 X/HExseYUpwzu9BqrHElSVUdv8AMTKVH6Xf27g4w+DEt8qyqGUmhkdhHkNVnrNc2FVKS
 mv8gMEayxVE8RsihX1eCkg58nZOB/R63S4SMp2uanplrtKZ0Mgn7hOpFlPjYzQ7uj/dB
 p8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Md/3/5JKM+oVwuA7MgVwTq9uvS3LFmGmmFvpu2uaZik=;
 b=IXFVLRQ+1RfFvB6K2g+J6gLlLLw4pbDLq3l1r/C+jI8p3tXN5ep7FZT/4IO6n3dF6u
 AsarNLlyBOSnfEI/TSZsfqH5YnlijkfbCG8btT4tfwau2fLvH/RUalT+EWH9XPSiOxkD
 0fmmjuVDf0C5Yc/Sz/h5z+8IeNG7IG3RZLYMoSpKKgPeBw6ee4v2uiPHLonp0Iefu6uf
 BK5uq4wfV8LdrtUhyvL6e7ToAHp1xy/YaZVQV3GI3vT5AzQgNN51UqHxEjZceHRvxZeX
 n08oxOZ/pyNCAw4SxVHW6AQLKXxUemV8vyGH0Cj7kp4xg2y8f5XoKYngy0aYlhA9Ot83
 sKUQ==
X-Gm-Message-State: AOAM532P9Ip1XsN50RKgiu3RI6vZOMsq63fQ25IW4vu9G6pbLPpcqXbD
 MK6U3nt1hT3mLxzzH1mnVTs=
X-Google-Smtp-Source: ABdhPJwuRuQAtJTKuR72U4ZLce/J4haR8WuBB/b4O9pQAxD8GnIG++dPDeEtMkI3GrP+bTLzTeC9Xw==
X-Received: by 2002:a05:6808:1482:: with SMTP id
 e2mr8654698oiw.45.1637254325830; 
 Thu, 18 Nov 2021 08:52:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h3sm60851ooe.13.2021.11.18.08.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 08:52:05 -0800 (PST)
Date: Thu, 18 Nov 2021 08:52:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix edid_read break case in
 sp_tx_edid_read()
Message-ID: <20211118165203.GA1721588@roeck-us.net>
References: <20211112112433.942075-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112112433.942075-1-hsinyi@chromium.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org,
 Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 07:24:33PM +0800, Hsin-Yi Wang wrote:
> edid_read() was assumed to return 0 on success. After
> 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()"),
> the function can return >= 0 for successful case. Fix the g_edid_break
> condition in sp_tx_edid_read().
> 
> Fixes: 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 1a871f6b6822ee..392203b576042b 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -826,7 +826,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>  				g_edid_break = edid_read(ctx, offset,
>  							 pblock_buf);
>  
> -				if (g_edid_break)
> +				if (g_edid_break < 0)
>  					break;

g_edid_break is declared u8 and thus never < 0. The break; statement
doesn't indicate an error but that a break was encountered, and the
value of g_edid_break == 1 is used elsewhere in the function to indicate
that condition.  It also doesn't break out of the outer loop, but only
out of the switch statement.

With this patch in place, g_edid_break will have a more or less random
value after an error, and the behavior of this function will be undefined.

Guenter
