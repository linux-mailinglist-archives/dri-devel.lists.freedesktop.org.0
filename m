Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0DCA04DE8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 00:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F48110E415;
	Tue,  7 Jan 2025 23:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CyAyjVAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40EB10E40D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 23:51:51 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401fb9fa03so259507e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 15:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736293850; x=1736898650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzA8ULDWK+L6lzlTxbv+SOWG/fbWpGETGTXU33lZ5cE=;
 b=CyAyjVAuGwJKg30IBkalmua9yue2ZKRpznAkCtVsWY/tSNKQlOSKkB6m92mDGIcVhV
 jAYcVhclNKu5Qm6r3aI9IeY71Dl581o7l6QzN9KV0YES5pcX4jtI825Y9IavFcFzhcoN
 nRUro9CLREzxK6J9nnpQvbY8zS7xJs1xbmrgfPn6Pvl/86g/7MXfrTk/LxvEvSTisOzF
 Az4Wxpt6CCnUtkpzv2Sa+vOK8PgnniqeZp+/O9+8+EOIrOlKpQE0H7UiiR0hBYeg/J5F
 bSOwkz51cO7MSEESkFS7yXEAVIF3jX8araioEiSvb+wkQQ1KasPpT2yU/HeTKqZoD5vc
 EerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736293850; x=1736898650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzA8ULDWK+L6lzlTxbv+SOWG/fbWpGETGTXU33lZ5cE=;
 b=v9OsoluJuFeDja6V2UWS5FCqAtLjTp0S8YUJ+daLgmSHHVEdW3uTOp9wmkRjpva8QC
 /OJLUD23inyKsa2sY7ckqsYhXbEahMklPtrPPv2XtVlbaneUxidpTdPcfdpDCHhPleEN
 hyvXj8Tx3Soi4T+UmNjVHF2HCTpuhJsUYZDOBUcoyGX5ZwxFxfSHlFw8TgvEGRtTVuv5
 ojoNlHksgRjwkAkweBbVq4DENNPN4+AOwTL8JrO6wBzfzrecWCwdNW1CSuMCZgE7bLhu
 yz9OdZqyeeXzHvTd1WyMuhOe8YdiFs2hC1nedhbRTe8PVDMV/yHmZBoZoWSxKr0Ci1SD
 YB+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuXnqRm6uftZslJ2htENqrl5/yVuwowJKS4xLMj9qo8rTLu4sKya4ZrfcqhGRZ/MQN87TDgYumD8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNCX/uLHg7qjDxJ9wcpJrlU0erQ94oQtEUkwKxq7kA/2HYCQPY
 ZfpQVbAsNm48m7RclVHRTQ1xdQavEHwwcluY+XRLvceYFNPp99JZ11fPNYpiqHs=
X-Gm-Gg: ASbGncs/dRtx8gCZW3hr6nRRWXna+M65jXIs3s1MXUYwc40e3Su+rIQymnYnQO8f2V0
 4ZHsgMxrVYMLRL4BWRBiQkEyeFvx9VuE5/fRpVvwt0Pk1BR4Ej8iaCfDfFXMmoK/RJwGvaupd7w
 70EhhHQnQOMaKePkhAbGcsjBFoP7VZ3PZGwsp6mlGU/+drlIYH51lYHEz92mhIMKanFdP3jOsAF
 2jNs0XGMLC/M8MEKQ7ztbKxqT1BTyMe5Wu6FYikQvT5hQpsX6ln59b2sSNgZnIvxcFdrBjQ0TFM
 quaTNJqsBCoKQ1yBgb6eqXaH
X-Google-Smtp-Source: AGHT+IEq/n/Tfq7aT4FpmCEZdmi1g3GO0mqtL7fWEuY6dUSLlQYwrreN3n6ytarFegj9TLUJkrf0bw==
X-Received: by 2002:a05:6512:334e:b0:542:7fb2:4098 with SMTP id
 2adb3069b0e04-5427fb240dbmr964465e87.26.1736293850322; 
 Tue, 07 Jan 2025 15:50:50 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5d5asm5409976e87.45.2025.01.07.15.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 15:50:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: (subset) [PATCH v4 00/25] drm/msm/dpu: Add Concurrent Writeback
 Support for DPU 10.x+
Date: Wed,  8 Jan 2025 01:50:46 +0200
Message-ID: <173629378661.1569938.10235663597211043453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 16 Dec 2024 16:43:11 -0800, Jessica Zhang wrote:
> DPU supports a single writeback session running concurrently with primary
> display when the CWB mux is configured properly. This series enables
> clone mode for DPU driver and adds support for programming the CWB mux
> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> the CWB hardware blocks have only been added to the SM8650
> hardware catalog and only DSI has been exposed as a possible_clone of WB.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/25] drm: add clone mode check for CRTC
        commit: eee0912a7185d5dc0a700d48f7ff620bb7f5389b
[02/25] drm/tests: Add test for drm_crtc_in_clone_mode()
        commit: 5a6e8c369486a79493ab300a1987cc6aad16cf6a
[03/25] drm: Add valid clones check
        commit: 41b4b11da02157c7474caf41d56baae0e941d01a
[04/25] drm/tests: Add test for drm_atomic_helper_check_modeset()
        commit: 88849f24e2abba8a8951aa76ea60a72fba916afe

Best regards,
-- 
With best wishes
Dmitry

