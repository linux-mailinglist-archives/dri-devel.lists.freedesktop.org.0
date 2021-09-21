Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80296413028
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 10:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3E46E906;
	Tue, 21 Sep 2021 08:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C8E6E906
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 08:28:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d6so36558971wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 01:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T0XmoJFziofhO8Y+h0Rn94pKP5fmr2HqBsNSUgjyYvw=;
 b=5yroY8A5VZDD+FHjsZDG2Bp0VN/9NCmZ6ph34jSWwEsJDuCD1esKUGD45vE+WgS4Nx
 nLpmPK+HWxt4q0gKN2U73YMOnjSK+nmWRAOe5rrwvsVTm3YVJfv3Uk7Ft/ySqP8hex+L
 f1zgm40Kj0wD1HVJ/tqQEXWaO2g7jPTnpIsyC00BZBbdt1+5/r0+9IfMD8B0NR2OFV4N
 pz5rhxCmqkUUs9JHgj0UnqMfPvOUro47Byxx/qxy4BLAKotV6L/T/FwekBK8Wdm1LwTf
 IBIWoRX0nibMYi74t7oqbGH47mAj6G8IqCq4nOm+sVQjejoCmL+E3DfESpMyX7jXmi3L
 PQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T0XmoJFziofhO8Y+h0Rn94pKP5fmr2HqBsNSUgjyYvw=;
 b=yJEKz6Os0IPTX7835oSrgUZXJiQOztS9g9NWVNy8l65/rqJV1Sqp1mN47v952y9sc0
 KscKQGk22de+Urn/UEjSNg1tdcOHyaPCCpOYVZXrZH5DGFs00ivsApXnJMowicHCNwVJ
 LqdfQmLd/zwUmC4CBWClrPUIHSSZeTymZ5yRv2IOdmyyb+Wny/AjLWwsNxSygIlBsCD6
 s3QkXbBaVPt/KGOUaWJ2s0kTreTQfbJZNg8d5vKfNtZ+snrAi1QE3k2I561UdO/ynz73
 l0sdrV1o6i8GQWKRAKqDKztt+QBcmEdTG197dkEfrGCLE49Y3c5ol6OswB3e4rH0gnyi
 gx1Q==
X-Gm-Message-State: AOAM532Ocw4WxCBC/GstwoSyQZEd5win8STXlAUmqd2B1ao9OkvbM8RM
 0eednBz7EyxMAFlS3aH6skW0hQ==
X-Google-Smtp-Source: ABdhPJzdYtgEvUpitsO9NiVEWZkguYTXll2eKVobKG1pSehamwA8kyXtDfgNoQVbS8fawSppRasMdQ==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr3190466wmb.194.1632212879919; 
 Tue, 21 Sep 2021 01:27:59 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id m4sm22493531wrx.81.2021.09.21.01.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 01:27:59 -0700 (PDT)
Subject: Re: [PATCH] drm: bridge: it66121: Added it66121 chip external screen
 status judgment
To: Yunlongli <liyunlonga@uniontech.com>, ple@baylibre.com,
 a.hajda@samsung.com, robert.foss@linaro.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210921075401.24926-1-liyunlonga@uniontech.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <13a71cec-06ef-d4d1-948e-c62d4c91d80f@baylibre.com>
Date: Tue, 21 Sep 2021 10:27:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921075401.24926-1-liyunlonga@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 21/09/2021 09:54, Yunlongli wrote:
> In the actual tests,  the IT66121 chip sometimes misjudged whether
> it had an external screen, so, reference the it66121_user_guid.pdf
> about Audio/Video data is stable or not A typical initialization
> of HDMI link should be based on interrupt signal and appropriate
> register probing. Recommended flow is detailed in IT66121
> Programming Guide. Simply put, the microcontroller should monitor
> the HPD status first. Upon valid HPD event, move on to check
> RxSENDetect register to see if the receiver chip is ready for
> further handshaking. When RxSENDetect is asserted, start reading EDID
> data through DDC channels and carry on the rest of the handshaking
> subsequently.If the micro-controller makes no use of the interrupt
> signal as well as the above-mentioned status  registers, the link
> establishment might fail. Please do follow the suggested
> initialization flow recommended in IT66121 Programming Guide.
> So, I add the IT66121_SYS_STATUS_SENDECTECT register status detection.

Ok, the RxSENDetect is the "rx-sense" detection bit as described in the same doc:

Receiver detection circuit reports the presence or absence of an active termination at the TMDS Clock Channel (RxSENDetect)

The usage of the rx-sense signal in hpd_detect() is not clear because this would break detection of "Fake" EDID dongles or idle monitors.

The dw-hdmi handles the rx-sense, but only to power-on/off the HDMI TX, but only returns the HPD status to DRM without the RX SENSE state,
so it only saves power and doesn't change anything on DRM HPD detection.

So not sure if we should merge this as-is.

Neil

> 
> Signed-off-by: Yunlongli <liyunlonga@uniontech.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 2f2a09adb4bc..9ed4fa298d11 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -523,7 +523,7 @@ static bool it66121_is_hpd_detect(struct it66121_ctx *ctx)
>  	if (regmap_read(ctx->regmap, IT66121_SYS_STATUS_REG, &val))
>  		return false;
>  
> -	return val & IT66121_SYS_STATUS_HPDETECT;
> +	return ((val & IT66121_SYS_STATUS_HPDETECT) && (val & IT66121_SYS_STATUS_SENDECTECT));
>  }
>  
>  static int it66121_bridge_attach(struct drm_bridge *bridge,
> 

