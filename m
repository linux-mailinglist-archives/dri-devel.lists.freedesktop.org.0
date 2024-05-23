Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344B8CD03F
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5D110E0F7;
	Thu, 23 May 2024 10:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TMz2Wtv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EF110E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:23:00 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e716e3030aso55823331fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716459778; x=1717064578; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yHQzcgh+wt+86lDxNvmMSEbfCa2z01pUSJ+bgewkqHY=;
 b=TMz2Wtv3kPBNwfHQ//odxskrvvslJGdiHhH+xLc77f9emJaCDyuX99XCcb8sKauVrA
 5fkNQ/o9OpTz43uz/tksoPwX8ifdhktveQGlR+UbCpZUIMyqDdFPrYQFq6qg41uoR/wT
 XHpLWJt9KeqjYcOaztezFGHEDUPvGQS8FI2Z6/+l9igb4+0+VDlIZ2aTYxNDCxhL9TXt
 b6X+0gDpB48fWJobgvhjWTHOcyOjH3a459m6Dl7CXqWGWE+3AynXlc91+PoicN4cv4nR
 pwYnQtJKdRLiHhdPIMEFWADoY3KwODpGjSdEStRhulpUi6DuPlN9yacPBZSsuc9IyKvk
 baEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716459778; x=1717064578;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHQzcgh+wt+86lDxNvmMSEbfCa2z01pUSJ+bgewkqHY=;
 b=DXvfYH6LS5XOF98f8J5wdLYEFQsZHFICK8sIYBKxOafdGl61Qeu3rlHG48xey8SS3A
 N/YMdFui0cI7hRZi8ARQjaRpf1TPbHxO1n7zHj/gd/EyNHcBpdL5qw9QPX71JxOzGUAo
 IMQ+qGP18T35kaWYAPXJjVfkr0aP8UYW8RPZBqOdQETXY8u5rNk3/Hn7t1ruJQH++Sbg
 rNZZePKqRfJRwiJ2oJMD4XM28XnmsEDiyvmswMalbrtMUeM7/yULEA8uguNgxPHdba55
 BGiGk7XhNtzbnzjX9qVZ8WZ97Vhd7a6Z7C6xGXgu+hvSBVRtbZ7puClE6Y7Vy4lePjLH
 I8xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9QpygzyxJm6S0MmfzuCBerR1mnGHMii6PdZ4OQyCJCjfkvMzTyVhaU6pgM85bL5v6jMhseHz+QYzSd48FmgtwjLh+38Xx+dK91ejm5ZTH
X-Gm-Message-State: AOJu0YxTDhE6U4WaoKLadJeoS97DatfaL1Gd7U3fHiXyx4SzQye/t/4B
 3UfyZFU9YWWJ0zjvrQsNPScUfS9bn2CLnLbGuuAc1442cbEkCDzy6mtjTNGgzDs=
X-Google-Smtp-Source: AGHT+IGaIAjJQzrs40kJxNB7OiB13JCw7thzg4cpmesH+f4K6m+C9dDIXqqPiTDnb/PD63DiDWKJ5Q==
X-Received: by 2002:a05:6512:4cd:b0:51a:cc00:951b with SMTP id
 2adb3069b0e04-526c0c544abmr2482181e87.49.1716459778462; 
 Thu, 23 May 2024 03:22:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d90b2sm5326325e87.242.2024.05.23.03.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:22:57 -0700 (PDT)
Date: Thu, 23 May 2024 13:22:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> The i915 driver has a property to force the RGB range of an HDMI output.
> The vc4 driver then implemented the same property with the same
> semantics. KWin has support for it, and a PR for mutter is also there to
> support it.
> 
> Both drivers implementing the same property with the same semantics,
> plus the userspace having support for it, is proof enough that it's
> pretty much a de-facto standard now and we can provide helpers for it.
> 
> Let's plumb it into the newly created HDMI connector.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv            |  1 -
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
>  drivers/gpu/drm/drm_atomic.c                    |  2 +
>  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
>  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++++++++++++++++
>  include/drm/drm_connector.h                     | 36 ++++++++++
>  6 files changed, 133 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> index 0f9590834829..caef14c532d4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
>  ,,“saturation”,RANGE,"Min=0, Max=100",Connector,TBD
>  ,,“hue”,RANGE,"Min=0, Max=100",Connector,TBD
>  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
>  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."

Should it still be defined as a generic property?

>  ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
>  ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
>  ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
>  ,,"""right_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
>  ,,"""top_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 93cb30dba86e..888fe1fe9594 100644


[the rest LGTM]

-- 
With best wishes
Dmitry
