Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15DBA43E6C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D27510E660;
	Tue, 25 Feb 2025 11:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IBdMDVpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6261010E65F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:57:39 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54622e97753so5050301e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 03:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740484657; x=1741089457; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BJdxb9d2Qc7/mEkgivvxiQHCCJjZY2RUEpoG9MQvZUI=;
 b=IBdMDVpRLn2OkN8HjkQveh5CH623p7bgSTaBlgdqKhDTG7i3goQOYHbotUKWFKgKau
 71ucXMEkobaDl9bewRcs3rWeuvxXvzUKKtfig2pKgjXmu364IN1cFTCAih/5y+bDnFnr
 1mfbXVhUCLS0H/cOxTLRwPZ13TVo6dnsSxVQAT/ob3C71Myi1mYJh/wyQ6/iAvDZZFTm
 l/11iPMhsFwLrxaRz/vJRnt6qrzkLqiygNXdUUz9wJBTSu30dY0pupVgM2BRg0aD6gUB
 TDzAM0158HoqsafwAP6R6kOVrpk0IifXLkMXfyvzCxdanT9FXIaSm/pc3his9N8iaipI
 KbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740484657; x=1741089457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJdxb9d2Qc7/mEkgivvxiQHCCJjZY2RUEpoG9MQvZUI=;
 b=N0QlnVy76d8D4+n3g+1uuZA8T5PTGtjjf4qDLEC4ER2lWL4lDFo6KSRRZsEJ+nelOe
 +r20mUMYIbJdlYAzB1durJnYyEmjnnCt/hkMc/2vFvi2/uah92Hs6ieYV4SYZ+fLpx4R
 NBpKEQ/EucPl4njxabrsBn+vI1LHi7yRlQs8x7h8W37dJocNQKVwwJPejh1Fiw2eIJQS
 zP8x97GKBgqaSDWTow1MNJaYQ0baqlABhdKlRzoomQ4LjWGlt8OSjxRhieW3yl9a3/aj
 bnwCyeXKY/8POdRAPp0/595VehIBcwnHOymTZAP5ql+KgTAagV7U5nPDWmPQ4xuzCwR4
 xvjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXZyzUjAyWfoYi29EmabU4hwlypfICzqn4DTZZy5UiTVVaSkkOCfNvrkredclrEppdN/3YnwGM6mU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMPi/jaV4GfxwAo21fqCXUuqTC3wlGhb5isGacb7MUauSNxYfz
 ErSCPhhtAKQLuxgtoPVqx2SVOCcu3yQOqtXIaOBSM+pOCLYcOu0UdYTaO3+B0Kw=
X-Gm-Gg: ASbGncv2zS7jn6lS8s1x1SMQTx7cx8rYOKefRar3mEvtpJL3UxXulQZrTGe9glkidVO
 MiUbRFZDcHBeD6sCuss17wDCTj5uoVn8GbP4a0sml38Xt+4xbooyelQOMCDH+/4nk4fCXenSajB
 mgzgd58bP/p7SSpflOG/7HzcG4IqxdbPMpYNvUMQxYkTmkMM1T76vOTo5Jn1ItR7zCS+KRlivgq
 p6PNr+WMYJZuBxhizIn1Q9kjqa2OEMDK5wfbVfBStvu4ttDS/wDQQ7ySKQnHHj+GnZVVwxnfYWB
 wZXKohYkFpppGkbfrP+C7Gkn8cSzfNuR9zTBxbzlR2/xKGF90OO5b3JvFY+sz3LgJAjqnhmznfD
 zTk3uHg==
X-Google-Smtp-Source: AGHT+IFbqdYh8fwBrlR0bY7/Z36QCpnKteDFdIRRsnwu1FwaNfeJZqynpnHdLJr5tV947+xq6nGVtQ==
X-Received: by 2002:a05:6512:280a:b0:545:8f7:8596 with SMTP id
 2adb3069b0e04-54838cb6287mr5705354e87.17.1740484657548; 
 Tue, 25 Feb 2025 03:57:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548794c6a73sm95082e87.250.2025.02.25.03.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 03:57:36 -0800 (PST)
Date: Tue, 25 Feb 2025 13:57:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
Message-ID: <lkfxsq3daspjxdw43dofch3nulprpmg4soxsgflsypu3kem4ok@utt6rfdtbg7j>
References: <20250225083344.13195-1-clamor95@gmail.com>
 <20250225083344.13195-4-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225083344.13195-4-clamor95@gmail.com>
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

On Tue, Feb 25, 2025 at 10:33:44AM +0200, Svyatoslav Ryhel wrote:
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> A simple HDMI bridge used in ASUS Transformer AiO P1801-T.
> 
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index ab0b0e36e97a..c0f1f7baaa37 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -277,6 +277,11 @@ static const struct of_device_id simple_bridge_match[] = {
>  			.timings = &ti_ths8134_bridge_timings,
>  			.connector_type = DRM_MODE_CONNECTOR_VGA,
>  		},
> +	}, {
> +		.compatible = "mstar,tsumu88adt3-lf-1",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},

This entry should also come between adi,adv7123 and ti,opa362.

>  	},
>  	{},
>  };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
