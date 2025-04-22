Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5625BA95FA5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1965B10E181;
	Tue, 22 Apr 2025 07:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nN7oFrMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEF510E181
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:38:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so70341f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745307529; x=1745912329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVMMGMfgUXdmB0Rj0WANJNXEPV7LIhyKRwGDEdU8v2Q=;
 b=nN7oFrMRTA5ephWl4wG7HinqOKg070S/pn/EsUqFXNcXUsaHJ+Txo3yCtKznCu0eh/
 p0LcOl5fT/fAH4+K/kXPJN3tDZqf502tHlEpoO7uCrrN3B17jrv/H3CND1cV9x6HvDKm
 y23V/sYFgBEhkxO9vCckMsGXTv7zrKWWotd3oeBye8yKZpHpkT2OmLi+nCcoOygpzOgs
 +0EIEsu4gLu3yUzcALPqsdahfPmKOUe/uqX0XhaeL6TsprgmSIprQRmIZn54FOHbOh+5
 u/wIi/E6vuXcHrJ58W2ONlFmpETtdrEto8qgIeHMgmDC0/gmAC6uqW+pm7F4+3D2tpPc
 PWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745307529; x=1745912329;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVMMGMfgUXdmB0Rj0WANJNXEPV7LIhyKRwGDEdU8v2Q=;
 b=g0+nn+aBC5UdBCANsvFwrrmLrhGrbpBPw1xnZKHpgS/911XafXYuQw2z3pcuo4k/X7
 qAIpL3lALwtBddUgcNkoopEIjLndNaSIWVn38mUijoSlsEqYNN6+Tj6NAK0ZO3zi//1Q
 F6nlV/UP1OhsAo/UCZ2sAf4X/aP3cisKhDAB/MOmxExkV5kh5QSWOz154MG0KSOziUbR
 I2+QoamiqSNWrLAnZ+ueKMBYP5XxCIuEx0smSYIoctdjLUuX/9awtbjhqTT5tgBfhNHb
 BBk07ohXRHbuBszXrDK/OuRwpPwoTmVIJo6tG3QLBKS1RBTWKHLXCt4c+nbyAZSVVtVK
 7kYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSp1rUjP1pPoY7FFQIgsit5VSefO4j7FhKJgeT7BdBEIBwxNL8sB4sGJzQZafBn5iLNBq69UvD6xY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg/PPoIi+2+jDEXuppMRH00uoefqV4tSnU1AIwxn2gJVzATRN7
 ELFrHJ+jWJHb8Ddoaqz4mbfevbMffn+u2LW9N9vtb4NKk/7buI7MnSs6yG3y2u4=
X-Gm-Gg: ASbGncvVwdK8G8Wy76mWfnxY/2bMpNsB9OfxkzxStZxR4BDcluzI1iIR0QU++Sjrwcr
 KJ6LT1ygv/JLQMu0geqtubwkmQ/B5uJWhwgIrLCC2GiAj8w1QTfjRi/YizvhrtGmwreinhrglBq
 gxdwgJ8X5Aj5LMPiWVJa39ViCvWt2RbXddOypgmgJdj2m4sPok2U5LnXt/qUVq2Au80Es0AeUO/
 Xhl7OIhNQ5eHGLybDZ4FHGOkiew/oV2Fc69j3JyYMWbICw+7DAUqgpVOC22PyiOOdE1dKmcX20l
 gqA608nfu1Y03/s1EpiNSY7O03mSO0Rz8kaKgp/ggE94DzXVI7VPyWYfsEgU0w==
X-Google-Smtp-Source: AGHT+IGbeBQWRwaG2m6asWCEaYAvSZ4R6pE85vu6K4eY1q3+0LoQ37s73egNVq4Bc9Ij+D9CGjhy6Q==
X-Received: by 2002:a05:6000:2905:b0:390:f460:77b0 with SMTP id
 ffacd0b85a97d-39efba5bfe5mr10738632f8f.26.1745307528651; 
 Tue, 22 Apr 2025 00:38:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5cf3a7sm163029115e9.32.2025.04.22.00.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:38:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
In-Reply-To: <20250419041210.515517-1-tejasvipin76@gmail.com>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH 0/2] Transition remaining mipi_dsi_dcs_write_seq
 commands and remove it
Message-Id: <174530752803.2829662.5162219952732867940.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:38:48 +0200
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

On Sat, 19 Apr 2025 09:42:08 +0530, Tejas Vipin wrote:
> panel-samsung-sofef00 is the last remaining user of
> mipi_dsi_dcs_write_seq, so mipi_dsi_dcs_write_seq can be removed after
> the panel has been changed to use mipi_dsi_*_multi functions.
> 
> Tejas Vipin (2):
>   drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped
>     functions
>   drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d6a4da523deba1814a45a593c271c32efedc39f3
[2/2] drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/61a0fc33b8538169eb30365b1598eaf33895c34f

-- 
Neil

