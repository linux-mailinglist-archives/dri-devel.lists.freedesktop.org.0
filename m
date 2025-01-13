Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F79A0B284
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661CF10E454;
	Mon, 13 Jan 2025 09:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m9DYNWA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0E710E5CE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:16:36 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30036310158so31635861fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736759795; x=1737364595; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YB6pdNSdvkS8YOBvFf87bQaTfCC2fNkB8oJYu3+8Cgg=;
 b=m9DYNWA3sMdkN7A3Q0eN7WY8hIneU+mVeygHYPF79DjGg6KxbEA+cg7udFypkXTuk6
 bdpPUrn/jLtFUxHdkP4u/Rk8KKgBlSyr/qnai/s1KzDuxFqPy4xAWLTBL+sX5gnQNNxh
 bI75stME2frBLduqDT5TRLOp6Tz/aZ7idRngGJan+whQXYsk0SPHhBtF+Z+5LlUYGOQr
 LMEfr6XEtzMTZal85c8luredr8GDHcRfG1x9FDX72GbNIAIRoA7qA53VVFeB3fklYbpL
 MjXukreYKtE8ZtWDjeR/S1iFLuNRuxUUVLOWqerfJkZ5eAPQyaLk6LBXtcTClFYu/tpE
 +6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736759795; x=1737364595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YB6pdNSdvkS8YOBvFf87bQaTfCC2fNkB8oJYu3+8Cgg=;
 b=LcfS11KWRudsCxHwP4dl88Je8jcG8jEtx5IiL18bMzDbCZBl925hMLh06I7VkfZlvh
 bv9NquUV7XxXT7I6XjChQ5Q3UlvKKsHPYJj7Yxnn57WNVa5n88gpABm/FfcoaoT/xiAG
 pbHUjX9ESc4/FQ9lFsgxzSWLtYpOFYTVCP74jFOCt6mSehsonka+oWbBfskf0JDCyMFW
 fi9LJUirPiBRQdSjy3JNyBVfhKVQ870WSK1zCl8lLxgY/vSITbuJbIcU6WAqCQXL6cgq
 nONGKX6yQCfaaT16kRY1LiWqOC7iBdH1/L058oGIYLWG/56h7eIyWcC/oWcp0LHhuxcS
 sDhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8c/U9c3+yz4W8Z0xb+Td0JwLVbigM3D8Hwmzei/W0T+vDfak+s+EpFRmmJDSnzY85aiuGq5El0lU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw47wOa+Djy/4zY4D6SpJIDmcx+0+aWNB1Z6yGbX7LX0QU1haI4
 yFr1lB4CMMHpWgvDpRcEuLa77qf0AUlP26OVJMtx0W42YnfkX7Rd7I8qkOsyNGY=
X-Gm-Gg: ASbGncuI0wgaa7JgtwsNvYQKTxtCjK1OjErY8etJ44xR65kU34Hb2QgNLgeaSakrDp+
 wogRy7Pu0hJ6o7npPVU14KEl1bblKQCcF32I2gaZl60kPME+I8yVoPmR2gP9fPzCdH84hCJYQyc
 Xp9KG9irsgbA2ArX601eATDOKMdVCNVsNz198pUf8HxmhGu1JTTH5Tru6whjMPpwF6NfXWP7w9k
 a/A7yJ6eLqLF9+x2qAY8+29flU4Ph9GtSq8/VMw7itm3Ruv55reJ7Et3V5o8BpwubNy9sYPmkOk
 HeKtMJ5DA16dqSIKp6qQBqsW9U1Q4aDQUb3x
X-Google-Smtp-Source: AGHT+IHpKyOtdKCWYirB/X94nnRJMK7VwXXOP10bzDaQC1FmckQwfW0mXd0EBOgBKKD5vjxlB+ZbeA==
X-Received: by 2002:a2e:be8b:0:b0:302:40ee:4c2e with SMTP id
 38308e7fff4ca-305f4530b49mr59810211fa.2.1736759795143; 
 Mon, 13 Jan 2025 01:16:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0ad150sm14297331fa.14.2025.01.13.01.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:16:33 -0800 (PST)
Date: Mon, 13 Jan 2025 11:16:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/display: hdmi: Do not read EDID on disconnected
 connectors
Message-ID: <2df6xkxqpljeowlqad6s5pxujefx6iw2a2caqlgljrgpmxlqqz@lark6bpzexca>
References: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
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

On Sat, Jan 11, 2025 at 12:04:09AM +0200, Cristian Ciocaltea wrote:
> The recently introduced hotplug event handler in the HDMI Connector
> framework attempts to unconditionally read the EDID data, leading to a
> bunch of non-harmful, yet quite annoying DDC/I2C related errors being
> reported.
> 
> Ensure the operation is performed only for connectors having the status
> connected or unknown.
> 
> Fixes: ab716b74dc9d ("drm/display/hdmi: implement hotplug functions")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 2691e8b3e480131ac6e4e4b74b24947be55694bd..8e4b30e09b53b84cfd36199d56db3221a00085b0 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -786,8 +786,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
>  	const struct drm_edid *drm_edid;
>  
>  	if (status == connector_status_disconnected) {
> +		drm_edid_connector_update(connector, NULL);
>  		// TODO: also handle CEC and scramber, HDMI sink disconnected.
>  		drm_connector_hdmi_audio_plugged_notify(connector, false);
> +		return;

I think, it should be other way around: plugged_notify before
drm_edid_connector_update(). At least that would follow current logic of
the function.

>  	}
>  
>  	if (connector->hdmi.funcs->read_edid)
> 
> ---
> base-commit: 1854df7087be70ad54e24b2e308d7558ebea9f27
> change-id: 20250110-hdmi-conn-edid-read-fix-178513c2b7ea
> 

-- 
With best wishes
Dmitry
