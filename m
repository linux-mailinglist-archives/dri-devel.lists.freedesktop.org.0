Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D71A4C119
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F8610E21D;
	Mon,  3 Mar 2025 12:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Troe6fnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6255210E21D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:58:37 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30bb2fdbb09so12757161fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741006716; x=1741611516; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t9K00D1mbPg0O7fwqBDLehnfCBwcxsod2sCrbwMiTn0=;
 b=Troe6fnvnOeRSmsCz5jzm0dDzGpIfJtSVvosn7mfkDHwuzDafXWtNSATS1fBB/BJU/
 WB/zQ7I/I6p3Tw1TZthzkyXhlJStJqozhlmyxKTmXHIvKGFGxK+CcpTDZN8UZWpVaBUx
 JvPbB1k4M9FE1ICKNY8xgpdy5AHaZdcCrc4ZVmJ2fxDalJbU3d7C41F/M/ZiOO3u6UQg
 oTJNafOVJQn3elX2PcKcB2+p9I9rJ/c9xhvTXRruGnaJ5IvX2OvJo0O0FDHuzTqao5bH
 ofc6iJ+HjkbMu7ylsWYmyxq2wwEhO0TMsGh277dlApw/2EP7mYy63/ruGi6HAg/np77x
 oAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741006716; x=1741611516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9K00D1mbPg0O7fwqBDLehnfCBwcxsod2sCrbwMiTn0=;
 b=SWhD6chGYTrY1R1E6l8PsXD+kZoGd8tleEDE27PseKFpTA3zI9HHv5p1tk6FZtl+E7
 nEtwyRajimSLM1HNll70ZSQtIxTYq8A/5nWnXUzCgUdm1YUuvxYlP3lAv0oa1AKg3UGK
 HYQX3LnMZsuSnGdbmBldfL1mqZwzipFgHer/3fU4ZV7YzP6RZGtol/t6qRmCzIIsraA1
 vq9TGpLZ29bvbyoQ6d+nejVddNSrXHz9dajWoEkZUt1q9fJ49AwZnI8kTlGg3Ts54hzS
 Oi27x8p5vWtXDqpDn5kyrLg6BfS9A0HLMkhbOrUyNFqIKt+Uqyedd1LxPHGz/4dsmIWF
 UMoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcu519ANz+N4yQRSXtbp54TKdbv4wOGztgP/z528rwsMJvk7AUsWq69KPMrKg2dBJf2Z6V5cb9/KI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwqYQ5jKZf60zT4QBfkUlYB49eq7aOIvEOVpIs3phku/h4Olua
 ty6APhp/Lxam7LzpZpdB6NRBTz3ixniHBZPe+w1zXb0SFHyCT8gWRF3K9D1GPKM=
X-Gm-Gg: ASbGnct53QUz9bTL8runXaKG/0ylRbUUWuwsafE3XmRRQGj4OCm6M3DyMb5vKYz6Ch7
 plgzfwpPDTfkgU9YIU5MqGnnUMM1j4SzB2TQgRzbzOnSjz8b82rJQsX8C+Zy3Nl9fQunPWbeLPq
 mp3rqwnl1X22jvVf2l9inu0NGe+KyVpzDqHkm7SPZDdtFv2hVdV0/YsP5NBFPXXVsTyEz+ujN8V
 fG2uCPEeDBow4F09gS4yTofnND/j67FW6ZApQOS4yfXMMBxL87tHsEQP1ER2nj3z2cZnU5Okdz8
 O+JZBsbxa1oGLhkD/deVcGfBstrx5VJw6f3SsashcHq+KRmvoyu9kNl986sClJjAaGgBL1DDOZV
 exnMD6BNbDU6Ad03/+mIPge8+
X-Google-Smtp-Source: AGHT+IGrJX6ekzVKqLcPRZ01UFLx2a7uloXdJSM8f49czEh5+lmhOXtfFrm34jcL+5QAtr3YhP3waA==
X-Received: by 2002:a05:651c:503:b0:30b:b204:6b70 with SMTP id
 38308e7fff4ca-30bb2047363mr21288591fa.10.1741006715695; 
 Mon, 03 Mar 2025 04:58:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30ba6070838sm7283581fa.44.2025.03.03.04.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:58:35 -0800 (PST)
Date: Mon, 3 Mar 2025 14:58:33 +0200
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
Subject: Re: [PATCH v3 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
Message-ID: <ptyvn34i377pdu7mqital6v2bqe36oy3yprxb5c3hztni7h52j@6eo64gzxvgg3>
References: <20250303120455.90156-1-clamor95@gmail.com>
 <20250303120455.90156-4-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303120455.90156-4-clamor95@gmail.com>
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

On Mon, Mar 03, 2025 at 02:04:55PM +0200, Svyatoslav Ryhel wrote:
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
