Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399559143A2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A76A10E399;
	Mon, 24 Jun 2024 07:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZS0SMJsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D9710E396
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:25:13 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-70670fb3860so871593b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 00:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719213912; x=1719818712; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3mSs2Q/thCXn7CZtQ9R0HaQ060/rkLZsvicCCKzHqYQ=;
 b=ZS0SMJsfFoWSC6G2MP2V4BBuLtOKt4xZUOFc1EIrUeEMAriDCb1mnc8lJG1HJR7hkB
 4D2ZF1bGswvxzO9eypSrsM65WL9o870Ah/IEv2NDOIvN9GfF01dL1b3SGjz4OBSD/bdH
 x+a5rBG+9CgOBYHcn7wWC8tta5Lp0U+bcgBO3Jw9ohhK9i+YnRijrF8vQ65Kp95UchCP
 lX8vGhSMK4Ezq7Bl2yjZ0EpuI+u4Ha/36Xz7Bp9gbEAcVP3HYV53kvvj7YyiyNWK3An5
 9mBaUszRp3/1xS+dpinRmOc+pFwWT1wN6x8ZY5Fgd++Nj8cPURIZXnIcAd4URs4YsG8X
 xANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719213912; x=1719818712;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mSs2Q/thCXn7CZtQ9R0HaQ060/rkLZsvicCCKzHqYQ=;
 b=Gvf7jPVPMG+dHh71U0jcLaTZ/ic0kcf6aNyqT1rJ9ZDZe+UCBleGbPrLxPY4yqKO6s
 NbXzaY+Y3vtUGX9PDCXjGbviZpCvgnhi39+ouSCVb211jAoR7l+PE6o463pB7CpFWxpZ
 rMXEIT/1V/y1qvDjcapqev9lBJFyvrTzJZHhp/purJ3CGB1nOLZ9OI/Z64NjXHFH11vD
 Ecc1tx2OJrAEkg3gXhISwVIwFCRU8K9stYvutnq1Lcfg7zMswzsOtsa+h5DQG2lfGz9c
 aQ8SJgwWbc8iTJiKdzA707PFO9O5a8qcZQO8atuUnXNajwkoqugPEuN0bWq6/DuJFqAR
 b7Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYUTFHnGqzOBg36kP+wX0dXfNZzIwEW0SaR9Ps1xQkTdQZYMLfLsgAtHGjGciebbk3LvqV55WBWc+2aqhbmKdICnIeoT4S5l8w+Q/kdkgO
X-Gm-Message-State: AOJu0Yw4jcFFJzsQ1CcG5tY0oXZFgkJ7usXJsDx0N3zZ7M5JJACDvBcu
 kS18n8WPIrtE1SpyT+szt4GAqevIUd8ivifz2QlM1hGF448j8esSJJ+WcQ==
X-Google-Smtp-Source: AGHT+IFiCVrArsa0Bx/ya8QGwBsiPkad+1xSUrOwFexpwk3z5tMCE19i5IDBQKKNGn8u5ZyzgJPVvQ==
X-Received: by 2002:a05:6a21:2720:b0:1b5:3ffc:b3c2 with SMTP id
 adf61e73a8af0-1bcee66c9b3mr3673280637.12.1719213912369; 
 Mon, 24 Jun 2024 00:25:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eba1:6f76:e2d7:7858])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7067ce3670asm1866079b3a.76.2024.06.24.00.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:25:11 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:25:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/7] dt-bindings: input: touchscreen: document synaptics
 TCM oncell
Message-ID: <ZnkfVAfubwFFydpt@google.com>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org>
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

Hi Caleb,

On Mon, Jun 24, 2024 at 03:30:26AM +0200, Caleb Connolly wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      clock-frequency = <400000>;
> +      status = "okay";
> +
> +      touchscreen@4b {
> +        compatible = "syna,s3908";
> +        reg = <0x4B>;
> +
> +        interrupts-extended = <&tlmm 39 0x2008>;
> +
> +        reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;

This shows wrong default polarity. It should be GPIO_ACTIVE_LOW.

Thanks.

-- 
Dmitry
