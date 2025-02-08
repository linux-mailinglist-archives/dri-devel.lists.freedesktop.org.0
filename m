Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD16A2D2E0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 03:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF11710E067;
	Sat,  8 Feb 2025 02:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YgJDQWP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FEB10EBB8
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 02:04:31 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30613802a04so28201721fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 18:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738980270; x=1739585070; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d/9UIs3hl18V/afdeYOvtkMcOtx0lTq0XewA1h2xuiE=;
 b=YgJDQWP9sA5pZ/LnRQM4t6gKn4IpqV7hcrMpNq+kK+tkzaruzYM9d+08lpST9MiNzC
 C8YvAk7bXRkVGdYvVHCmzuuwmxFZTMNtImd+eQ8m4DxDUkCAQpx1aSSk2rDYqq44Bnya
 LWxw5V7oqc0xMzvbSNxDEkDIqDxYU+wGgNetanJrCbqXAqPjhuXA1GPhL1VqTr4z+ban
 ijvOWsyE7JjL7JQCChSaMtcR4hL8X1B5E5c4qhOOTUD7QlKAr/ddWQwLq6MRX1vbnm5P
 wOU2NfNeQjuhZhI9hrdr8QZc5i9RUNxbpgwTa6iKRim8jt6C+BQly0rYigqQwDUwlNsb
 2zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738980270; x=1739585070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/9UIs3hl18V/afdeYOvtkMcOtx0lTq0XewA1h2xuiE=;
 b=hIDa1wZEMWr49gMw7MoFANwB4G4194m8uHPOvMGj5iW4CyuMNkie93RwaIa7HWrXhF
 3tr4LdWEkO07YFO9G/S8C5RVF5M7IQ8AVXPCXR7fzpOiFpy1dRIDI2RxZX+PTAd+/JJh
 GApZqG0NNz9kwQr97bTfyraVUz4HGuFrIeKS+ztFe7oNUaq9rDkTZz4S7xb835Ar7YTU
 AGLmrhQ1qMxbaYzIaPtH/oCp4gzugbFPxR98ZGnhkby80qvVYwtox8axGV4frPhn3Gku
 h+QwqLj5Bb+5vrZNf6BMin1c4QBZQv59tfoOrsFQOu2edLkZnDmLkDblzcv5Q7oGWokG
 bwEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU99onZVH7q/H17/IyWV81SfWXfSuIUoHdZOuvytL2ww+JZtNcYT2mYz2+WthDnvWSzVXZZOoO5Y54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzju9ZaFoxN52w1VankTswatnH9dx3y/QaDli62oOJ/6lI9OJiA
 t5NbRXmYDsGvnCyTsin0Ud+S9B6CL/zlHr9gDTyS4l1Q6Z2LLaTFQ8aT1RNxZUY=
X-Gm-Gg: ASbGncuijUJRC8TzzL89xI1/+TS/01+wZX8iGMRJ9/BtLYrg9dsHEBdTgsqangET7cP
 Ei5plUJb3mnNGN9FRET59nBXIaGJDYnbIZa0n6G9AyM+Ufb0WDOLoCmFdDQM3litdLWVokj3Iah
 66uRwugFlNvjjHzRmf4wZ1TT7h63bERsHvNbGJpnfB9H6thO+NhgsxDtml2sn+RyYvj0uMmu//J
 q860yQqEcGAoEXYb/hsQ+a7qEOTEXVzqpzlDOO5KBxm3CXS29hjyNSM4uw7N8yYDsT1B/gV3T8e
 yDwxP3wCwk7Elxt7herf0Ffw05kywHvPhnV275TF3VTXCZZPGonFbr6UW9Zb+AdcFtj4qJ4=
X-Google-Smtp-Source: AGHT+IG8gRmZag/jkGsALd2FPTjuqUbLGEBG0tbQs302+BUmUper3a9l47TJWJqQdmkiXOJueXM6yA==
X-Received: by 2002:a05:651c:2227:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-307e5a8dc66mr19195551fa.32.1738980269771; 
 Fri, 07 Feb 2025 18:04:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de177c54sm5904121fa.14.2025.02.07.18.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 18:04:28 -0800 (PST)
Date: Sat, 8 Feb 2025 04:04:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Message-ID: <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
 <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
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

On Fri, Feb 07, 2025 at 05:31:20PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> > 
> > While the HDMI block has special block to send HVS InfoFrame, use
> > GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> > that requires manual repacking in the driver, while GENERIC0 doesn't
> > have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
> > HDR InfoFrame which we do not at this point anyway.
> > 
> 
> True that GENERIC_0/1 packets can be used for any infoframe. But because we
> have so many of them, thats why when there are dedicated registers for some
> of them, we use them to save the GENERIC0 ones for others.

True

> Lets take a case where we want to send HVSIF, SPD and HDR together for the
> same frame, then we run out as there are no HDR specific infoframe registers
> we can use. Is the expectation that we will migrate to VENSPEC_INFO regs for
> HVSIF when we add HDR support?

Most likely, yes. That would be a part of the HDR support. At the same
time note, we can use GENERIC0 to send new HFVS InfoFrames defined in
HDMI 2.x (once Linux gets support for that). At the same time we can not
use VENSPEC_INFO to send those.

I can imagine that the driver will have to switch GENERIC1 between HDR
(if required) and SPD (in all other cases).

> 
> Also from a validation standpoint, I guess to really validate this change
> you need an analyzer which decodes the HVSIF. So was this mostly sanity
> tested at this pointed to make sure that the sink just comes up?

Vertex 2 dumps received HVS InfoFrame, so the InfoFrame contents has
been validated (validated SPD, AUD, HVS and AVI frames).

> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 93 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 15ab0858105328c2f774ec1f79423614bbbaeb41..aee75eee3d4244cd95e44df46d65b8e3e53de735 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -69,6 +69,8 @@ static void power_off(struct drm_bridge *bridge)
> >   }
> >   #define AVI_IFRAME_LINE_NUMBER 1
> > +#define SPD_IFRAME_LINE_NUMBER 1
> > +#define VENSPEC_IFRAME_LINE_NUMBER 3
> >   static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
> >   					 const u8 *buffer, size_t len)
> > @@ -142,6 +144,74 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
> >   	return 0;
> >   }
> > +static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
> > +					 const u8 *buffer, size_t len)
> > +{
> > +	u32 buf[7] = {};
> > +	u32 val;
> > +	int i;
> > +
> > +	if (len != HDMI_INFOFRAME_SIZE(SPD) || len - 3 > sizeof(buf)) {
> > +		DRM_DEV_ERROR(&hdmi->pdev->dev,
> > +			"failed to configure SPD infoframe\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* checksum gets written together with the body of the frame */
> > +	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
> > +		   buffer[0] |
> > +		   buffer[1] << 8 |
> > +		   buffer[2] << 16);
> > +
> > +	memcpy(buf, &buffer[3], len - 3);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(buf); i++)
> > +		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
> > +
> > +	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
> > +	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
> > +		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
> > +		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
> > +	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
> > +					  const u8 *buffer, size_t len)
> 
> msm_hdmi_config_hvsif_infoframe() to be more clear?

Well, all DRM Connector callback uses just 'hdmi' here, so there is no
reason to deviate from that.


-- 
With best wishes
Dmitry
