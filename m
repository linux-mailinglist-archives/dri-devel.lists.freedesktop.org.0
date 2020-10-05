Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23733283754
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D1B89CD3;
	Mon,  5 Oct 2020 14:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE39689CD3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:07:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so8942287wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZldILGuVy9unlOOxU0H1hIH1gJzlU8+mS56ImbM+ZQ8=;
 b=CJGccaFA76/tlfY2+H8drZvwvp7lpfcLqG9vrSqs0SWJ/O/oNPHEFK6IA305zHWR/n
 S9JBCFSoBbOQQ4tlidWqvqsJxhWniQwa5tEA/4gN8U6iGoqiDfwpB2vdOIHOETyqqEKK
 Nu3iSAlkMt1N86xOeLibgRMgeklh/kZiYX4iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ZldILGuVy9unlOOxU0H1hIH1gJzlU8+mS56ImbM+ZQ8=;
 b=iMEP/GUNpr9EfCHiMdFHGoE8/zoyOC/1sf9aPUd+Rkp27wej9ORo2S06XKlDoqdOnF
 I+qyy7DhEB/HClA+2JJgx1ohcaaU/JfelKChQTbR3LgPWLFgw1pSRxo/tkq7mICAcTG3
 KN7izx/eqwJjWkAlBRApLZZER5c2/trjpBTLo6ZjjU4Hd1X7njYIcyR0ptUMcmOLpi8b
 d7jbgCDxHAbSPDF9UKeO2mfj/1J2IEE7pm0DDn9TUPW6/EwvJPGLNRzfBWb7jbZw8KPb
 sUQd4BVXwabEwlMKTHP9TeSgTNlOz5h1A84lSt1nsxiJuOgTB6rr3J8QUTozkEVbqJII
 X9qg==
X-Gm-Message-State: AOAM530O0U4L4hDysHnaEMX6fSUm120WFN8WWAgPhp+SWb/WOXTBO8iD
 Me3buIRKAvgwI9U/7FbWBlN3WSxsgZQHP2/g
X-Google-Smtp-Source: ABdhPJyxdZ2mcLmnrUnQgng992VSWkng0jYBV8uCV805lCE/hWFcvl7aOou5BxcHapS8phDJHWQk8g==
X-Received: by 2002:a1c:5685:: with SMTP id
 k127mr17861625wmb.135.1601906844392; 
 Mon, 05 Oct 2020 07:07:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm81907wrt.53.2020.10.05.07.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 07:07:23 -0700 (PDT)
Date: Mon, 5 Oct 2020 16:07:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Constify dw_hdmi_i2s_ops
Message-ID: <20201005140721.GU438822@phenom.ffwll.local>
Mail-Followup-To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>
References: <20201004200653.14702-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004200653.14702-1-rikard.falkeborn@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 10:06:53PM +0200, Rikard Falkeborn wrote:
> The only usage of dw_hdmi_i2s_ops is to assign its address to the ops
> field in the hdmi_codec_pdata struct, which is a const pointer. Make it
> const to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Queued up in drm-misc-next for 5.11, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index 9fef6413741d..feb04f127b55 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -170,7 +170,7 @@ static int dw_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
>  	return dw_hdmi_set_plugged_cb(hdmi, fn, codec_dev);
>  }
>  
> -static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
> +static const struct hdmi_codec_ops dw_hdmi_i2s_ops = {
>  	.hw_params	= dw_hdmi_i2s_hw_params,
>  	.audio_startup  = dw_hdmi_i2s_audio_startup,
>  	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
