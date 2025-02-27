Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84076A47497
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8A310EA30;
	Thu, 27 Feb 2025 04:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ed6PyEAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381C10EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:47 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5462a2b9dedso490739e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631066; x=1741235866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
 b=Ed6PyEAtZRllE9/zC06Gy4dZzsOpk//BbU6aheob4OAQTh7D3s32FDGcFKym4VimTW
 NezlKNOtFsg1diMpsvRPnMRsH2swz98UiL5q3Tz3Q8j72xoCQOFXoMYEacIupTaLUTFZ
 KPNtA6zuqQRva0dLPuSRzubIxNCLM1hX3SLO0EqC0giPBBULgI/zKBhcVh//hNFd09WX
 OBl+baWUFxxGFhyWTtwc6wyy/4uXXh3XHK58oDUaa1gCSc9tMdggiV9vu8hUNtK7ERPm
 sMdgOZxbSlWDWtrjJGfFHArqmT5bSxu35pKa18+yoYiCF57Jr2H23yrsVJWwS+c2xLss
 8lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631066; x=1741235866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
 b=H9nSelMuliG1aGRf1k2xuQXiEMzyGv+9HBiPUWWkOsg3KjpceL+bFziBz15m20q8UC
 taKKPq45cqfCJzAUQH1l0StaECgfhxkTKVUdgc/mGnHKxMAY4PrvbEMQ9xFMMRbL53zg
 75XeVHXTezxS3wVjwKhQXkkPYXnapmkaJyQ/v2nXRCLMpaSDKSuliyDaTFLYYKckLTZ7
 o1ueRv6atyR6e5Td5ekfDTK3k6AsJnedAw0LdNyZidNzB8JsK2eoX/JS4cfTmlfCICrZ
 q0q0Cp7ToE5waGeqWdB0YZDI1mLwKAVrASlqfFTSX1wb+STgghvPusr82VgFi38s2NOv
 kCHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAVjtMvztME6XaAhlbiNF0a2espKMR/YNm7PY0/cI1wm11RtZHQ5iBpbXp0ldT99uP5l9HsyJXI4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCgzXZklyM0wp4Cw8Znv9IIQh/43F98WgvT8j7yrFvm+K/NT7Y
 W+ItVlSubAktZ4bNfsc2FQV6m2kR+tqmRAuM02Etw0EB+MvxakDALF+vHoXGfLY=
X-Gm-Gg: ASbGnctp9IeyP2ppc98fox/pCoWu19vcuE9BorsYGCOdFae28+EO1HiqP7VbiYuKNWd
 TYV10sN1L/tBVYi9eVRIRzsi2dGeH15P6P5qw8HoZo+H7lC7SFuLWXwwNn2CSSRCr4YSE8oBuzx
 RFZVBTBie1sIKk508tU5/IWZfvG644zoMD8kj2s6/J370fyA3i4wh3PRtvTZFIpmqSHkhfyxD+R
 lKYBEdrIGqxlD2AuVhQ4y3LTWCt4q/O2NpDb3GD/q14xIrgf0HycMe8MCTatokRuv9/7Z5ey6p8
 iMR7BNRl84l7cVxF6VHciDjVoEiiMnoufrNRtpEhIQ==
X-Google-Smtp-Source: AGHT+IGd2rBcbdDnOO9mUn66I/dFLYCzyc1GlDdtB8pQVwoJ0TBIn1SVa4Lymy/rEO+PlXQ6q8GIig==
X-Received: by 2002:a05:6512:3d0b:b0:545:aaf:13fd with SMTP id
 2adb3069b0e04-548392717d1mr11821826e87.51.1740631066310; 
 Wed, 26 Feb 2025 20:37:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Date: Thu, 27 Feb 2025 06:37:25 +0200
Message-Id: <174063096233.3733075.8120055678466952428.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
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


On Mon, 27 Jan 2025 14:21:04 +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d1f28e30a525
[2/2] drm/msm/dsi/phy: Use the header with clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5100ae76b5ab

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
