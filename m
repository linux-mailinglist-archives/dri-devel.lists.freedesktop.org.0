Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751B3A2B901
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803F10E9FE;
	Fri,  7 Feb 2025 02:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DunAnU1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F710E9FA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:21:05 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3061f1e534bso15233851fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738894863; x=1739499663; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
 b=DunAnU1hUIrmBw1l+752GoJmnZWhcqDlrUg3KXNlVqRufFWr/nGEpVSD2PxpEp217A
 h/iKUEDIwFr8evy5ga+EEBieogaamP4Rxe+YCKbTox7In/g5oC0fm4kRX8AnOVtu1JIf
 vpTB0u+P3scChRBUzNO0A+5sWKgw4PRS8qTfoYH3UF6eRux6o7ElIR088nlsp4g301+v
 URDjBbdjQudozbH3JoRUx2LVLss17wRWNswSsQzPLZ5d/Sr3XtnmO4STRWh+OfUSgaOD
 6H5Igp8mQolEByM/+lngembL16JkCtk2LFC+i0hgGk00N0fa2gxa/xTIVlii+x6intZC
 caRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738894863; x=1739499663;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
 b=sX1U1+CbDerbMx9SntiaeOouKcGVJdJcVj5+i/L0le6iq17IZPVt6SMZfGb60lMyXi
 cNp7fq4PylC96xwR6UinH9hCaDj2EC/vRkHD2ly84xEegVUXmIhl9oMR2AMZVqXqa93X
 vjSret7MAy+JzaBk8k5GB+HZU352QgmE4h3APlEM7r0TRk2LLX4guCrLeLikMXcwXULM
 AS8YpSAKiAInHne7TlNZAXmgTEBaZ3YwtpMtdsvbb3GH8RDbxp0atqACjAJqUUa0mfxy
 ed4DsSqJinwmgBz5eVDGC9BHAahIE/ny//9XeZUcbgQIj+4uDjE2wEc0al7NQS2EDiho
 jG2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpuS9uFPZrRV3Q2jFf2uUU8lG/a7t/0nI9iHTBfCqsHUOK++YDXFapf0cOYNan0vyzgTS5dXyvQn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3bQ2WKfm/d/if4cPgWF9UCH14Tdm2sLBVavf+pv+UZyJjWxx0
 6T2fPHHy3ZsfvKbSi9TRh0pBZ3wZx0vx6p/VDhZ6Bko56jcTpceq1SSAbEIFheg=
X-Gm-Gg: ASbGncshnYrH60qpo48cD9NUhyykzJ9F1BEekwSwFweR0eUCXphOijM0M9FoLNVyRXz
 biLdq9KYQg9VnzlXfDxwCy/SFmV/U2qcakXkv0YVXD1J3RsTcTsDMwTySIVlmzv+gqx95WSLC7y
 6Sc9cjdySHNNfAzuLc5YUKp4eJWblx71FaK21dsC7OmCSUFj+hpqjF6ObgPBtJwgUiV5HwpySNA
 DluZEewMFPq9GiajwcuBwNfKVcAfs6hHsdwigBFCU2TNtw/Drd84UjCzltapkiiaOIUoQU2HoXU
 8f3lndjz41V5vW37/MFkNOOBfZevXcVmvFhNQ3lZxEydACWUAf/RxWpaK0W7wNX4OZe2Wgg=
X-Google-Smtp-Source: AGHT+IHRDTBhlu8pAlsQ3oP0N0FtT5qdWC2jNVUTMMclmHpLd2GBk+UOaDGiKoBFjKCmUJyp2r/OWA==
X-Received: by 2002:a2e:a913:0:b0:300:3a15:8f22 with SMTP id
 38308e7fff4ca-307e581b0bdmr3526211fa.21.1738894862959; 
 Thu, 06 Feb 2025 18:21:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de177d22sm2841571fa.2.2025.02.06.18.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:21:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:20:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 02/26] drm: of: drm_of_find_panel_or_bridge: move
 misplaced comment
Message-ID: <w4iufoohajidadw6s6qwaa6uo4qna2yepieb4qe3thkk5terwe@m2b6wogduiiz>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:17PM +0100, Luca Ceresoli wrote:
> This comment is misleading as it refers to one of the inner if() branches
> only, not the whole outer if(). Move it to the branch it refers to.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
