Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D4BAF648
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03DF10E69F;
	Wed,  1 Oct 2025 07:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XoX2WPrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018B510E674
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:24:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-46e3af7889fso41156055e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759303465; x=1759908265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JtxRzMZeL9v17nXRs0wb3R8qd1EOkfb8vMoEKaK0eQ=;
 b=XoX2WPrUea26d80BW4XFvFDtFdYVjBPFvbyXkbhrkMwgnr2vhdaonWmxiGJBQvAEnM
 4Tphlr8fIw80OEGphII4uxQvrrnEbiBHSTzKhzuWKq2XCC0EtP9vq3wPeR7D6OunxgU3
 07WXWTX5qONXJvO5v5snCnYcvtbXCj8/kipUMAIAimchV/raYl9CSP/g8BA/omhL83sL
 Ul19SrRaYjbOEwQnFnuq3V7AdVKnGQFe+3ykMuydB9IOprGppc0oLLK5H5SUYllpz/EU
 ni/nRWVGUO0h/O4ejyB42i4Yn4Dbaejw8hapCGiUNAT5Xa9qytQMtQFRP2y0Dib9Y6CH
 eGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759303465; x=1759908265;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JtxRzMZeL9v17nXRs0wb3R8qd1EOkfb8vMoEKaK0eQ=;
 b=WbhvLOVlQfjH5/dDVPzQoSgk/uZU1113lvbS0POmCrlIbgVKvq4uToVev1npRgvJvN
 +yk1spKfOG7WG7k1kjboZtHrottyjwsbQ+CPsk2d0R3MOjYQ5+Jq4kzIu0My5Tbj6iZl
 o8GkSbdh9ufp1P26VzaznJXY4gpoRH3UZScIsur54xehhgef2PmtiZxkcZHezzIduk2B
 gSQQ1SYYZsOsDW7h++O65vLTU6rSwVcoYN2BkiDRJAQMgI6Vvdc+gYe71O1gmVMjBT34
 ccZqF+rgFT0G9bLTslc13ybxSVNgOCO+hURjKJLVv2tGQTpRvX/CIjRj+EAGd84NSpwH
 Hf3Q==
X-Gm-Message-State: AOJu0Ywh2gKYvQPCnpFy852VBX3Xr1CUAFHfpxZi8U82aaiic4KzN+jh
 sB/jRKwBIXGNrwukEel/4gVzIPyeWZ2dcHGfiCZ7PVlzKCkyuzJY/Wz/LjvslnMfYQ0=
X-Gm-Gg: ASbGncshkH07Ob11E0ia1xyMfpV0/eik8Ws5wJgkStGA/EPcZtwXtwmLWP5ZtdT2w9E
 snTtFJ16Ifz5YWSh7/0Z0ay/tq77I9M7keS5fWFbJw3pPsWBBsvPhzuXhwKop3Jab6JMN4oVcM9
 L20c80yHJQ0rXbgUPxHjl7B3xl93yhoX+0R6JWM8lqFTNYH6ll0cOcQpCJn3XYAjb5+Yt29YchY
 dAvlTcgsAiK28Z8Lt/a7jd2VruBXpvmZ6gGcFqUIB8mUzGGnheqMJ+NqNecWhn7ZO8WfzFJ+ysp
 EliQJzo8V/qBtYl/cIyBrMMLWLyNSckMi80J6BWjDHxiM6FcePfEyk+EDC3MaQMFGszlOoN0F2S
 xFTS68th9bqysGP6FAF6lb2ozcYAf2Cjz89RJdad32AuVaepfftp0sF7cKnBJ8kRGzXo=
X-Google-Smtp-Source: AGHT+IE6yluUbRPj1Xf82URTt49n1XA+WrKyrXfFL4dmGKEG9ksoSO6w24jNnMA9btnzpoe9DeDppw==
X-Received: by 2002:a05:600c:3b08:b0:46e:4704:b01e with SMTP id
 5b1f17b1804b1-46e612652d1mr22649105e9.8.1759303465411; 
 Wed, 01 Oct 2025 00:24:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-410f2007372sm25047153f8f.16.2025.10.01.00.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:24:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250919153839.236241-1-clamor95@gmail.com>
References: <20250919153839.236241-1-clamor95@gmail.com>
Subject: Re: [PATCH v3 0/2] DRM: panel: add support for Sharp LQ079L1SX01 panel
Message-Id: <175930346477.470940.4121513970812142140.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:24:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 19 Sep 2025 18:38:37 +0300, Svyatoslav Ryhel wrote:
> Sharp LQ079L1SX01 panel is a LCD panel working in dual video mode found in
> Xiaomi Mi Pad (A0101).
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document Sharp LQ079L1SX01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/16c5b1a63623da251ae842b45fe10263d33bf71c
[2/2] gpu/drm: panel: Add Sharp LQ079L1SX01 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/306e6407ed96ca3dcae5e3dbec8cf207ea33fbee

-- 
Neil

