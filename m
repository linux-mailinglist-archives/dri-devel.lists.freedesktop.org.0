Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C086B9EDA70
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398089D9A;
	Wed, 11 Dec 2024 22:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V/l0xqYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291F189D9A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:54:23 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30227c56b11so32963061fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733957661; x=1734562461; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wFlcrcuOuJge6epCV9BrB4p6q6J+XOMRFHObrsI8uJk=;
 b=V/l0xqYN0jfpdvayzu8MOjuQQ/YLA3XqHwL7/d5hB8XomRXeTxPfvYgjheigSW789H
 2K1sg5skuU2X236gEOU+M8mPpiThuPjS7O5yAFCYbP2U0uJPjMZ/vm0rz9yHDLcInMsw
 ZF9LrQtz9jNNjrWj/BRLc2TRIZYrdp9KE4+JbCGbRvKaKJu8m4HdgTAG5B07UamcCx5o
 SIjmc+5tlnfhT5y5Pen8QZ5xR9ts+6aVRZoHh4xlft0I2CKsiYox6uL9F/DykXElS9DI
 77+r3QlcJjowWzXEz4pDuJ6EKidp5nqzPw7eLjx/0/BA0jrtePZhp3ct29Fx9Q9S8rqT
 xoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957661; x=1734562461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFlcrcuOuJge6epCV9BrB4p6q6J+XOMRFHObrsI8uJk=;
 b=WzZPl3Hl7OkTvXKJygirpqXwsSIKn7Vp0Qj03tr2PdlqPQCP3dxJfkT6d/Rbtb+ViK
 IOSk4nKddmZabJ7F6BPj5EQ9gV6ydd9Ksezngrr2cx12UvdBo7m8DxHtU3IKoN9E1AnG
 Ofr4SZOZxHEQS+M8gk4EISfJBeF5kidg7Cqm6pKMF4X4ar3ntr1BPObVdDW3HtdiqRel
 R/4CZ0sTbMst4udyfz1thNg6rrOvwGXxNGtk4mqgGWeVtk4ip5aJk1RGPVCPfp6M5A+z
 3VMoJEV2y2HQTzr+ArP9IgtJOVM+04NoDhSai/WvmR8JeMj8WxM0qgKJNjJ8Qkbs90vE
 Ch8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdiDjcAu9gWLlEPFLaZ7f8vU0My8Ds8Vn+6vmAum4XjrCxMmrNn5PTGohQddS+yKY3OErCJw8pZRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0sdzKOLB7FZo4yaPOOTl25w/k385j68UI7NbJl6EIkiw6QAZa
 9KvNkto57QJ+gSyl4Kn8P9ypUppQWIeHgOxc5tz0yu86Lrzb3l821ki+VKt5y5Y=
X-Gm-Gg: ASbGncv5Bmu4n6XQzvpBq317tym2+NNR84UWRdGJmr9orOFFTVVM/vZpR+3OOHb2tRY
 nw+BdTvKYMPhh1QHqkG1e/+hdpAsgN5iComf4sNiJEOfy4oJR3bTk7ID0FASj6JaB6IB7JAJzXF
 hmF4Hw/n9hF+HGQl8by76+FzzN0y8ZPWFgLDmE7urNWr94xdM/PwGU1g1BKKTuQgm6LNkOZyPB/
 GV1Zd8lgMhAZOXwBenvF2yh5JCUqdmBs8vNsMr/Fd1AM9ZM1MBDDhwzQmXvZ3SJUUz0I4mlZ0Pc
 G1HWmMnoGrNuIjOiVBnMhHLWFMd/JSKaUA==
X-Google-Smtp-Source: AGHT+IF2beMPPMfOHzFimzjUPxZBuU5TVMSgXepIkr14Wvtkhl9EzlpO//mQAjLbZ5PlDOZrQQhhMg==
X-Received: by 2002:a05:6512:4022:b0:540:2122:faeb with SMTP id
 2adb3069b0e04-5402a605bc8mr1358587e87.50.1733957661382; 
 Wed, 11 Dec 2024 14:54:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401a5360bcsm1378389e87.174.2024.12.11.14.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 14:54:20 -0800 (PST)
Date: Thu, 12 Dec 2024 00:54:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm: bridge: adv7511: remove s32 format from i2s
 capabilities
Message-ID: <ctecu2iqn4nsm2wy45ca7vt6bdj5334wafnyq32quaydjs7yf6@x4avipho6xcf>
References: <20241210134254.2967524-1-olivier.moysan@foss.st.com>
 <20241210134254.2967524-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210134254.2967524-3-olivier.moysan@foss.st.com>
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

On Tue, Dec 10, 2024 at 02:42:53PM +0100, Olivier Moysan wrote:
> The ADV7511 chip allows 24 bits samples max in I2S mode, excepted for
> direct AES3 mode (SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE format).
> However the HDMI codec exposes S32_LE format as supported.
> Adapt ADV7511 HDMI I2S format list to expose formats actually supported.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> index 28ae81ca3651..ce6eda87bfe0 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> @@ -232,6 +232,9 @@ static const struct hdmi_codec_ops adv7511_codec_ops = {
>  
>  static const struct hdmi_codec_pdata codec_data = {
>  	.ops = &adv7511_codec_ops,
> +	.i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |
> +			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |
> +			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),

This will break w/o patch 3. Please change the order of the patches so
that after each commit the kernel can still be built and work correctly.

>  	.max_i2s_channels = 2,
>  	.i2s = 1,
>  	.no_i2s_capture = 1,
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
