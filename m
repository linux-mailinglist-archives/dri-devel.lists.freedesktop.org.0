Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93D9F90E6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1CA10EF83;
	Fri, 20 Dec 2024 11:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gp15GiI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38A10E376
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:08:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3863703258fso1794785f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 03:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734692901; x=1735297701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2DrhlfxHBds/4kHdRY9eVwoEqBd4q+1/KO6/J4NzLC4=;
 b=gp15GiI9aHeN938a8urgWNnT88mRMYJYhTwYFU93RYiLYyvJbfwEyuk+mSzWK+3fG2
 zGLqjXLdsaHlMgY+jOThJ7eNmCnFWBVLDcs1IKHwfu9GedQoPQoWSrLt1A4JIdG97i5i
 qgOUD/+SXlamQ+Mqm4M4UvbN4ewMeLKfpJYC8yfx0SOgoTIaVqZ+DVuxAGXuXKJpNzb9
 Z69FAfHu8DhaYNXKKv3nGc5GL1b82/1pVyNIQExKsSZb/uQUjPR4UTRLFGbl3dGhJtLY
 ehTZFknY5gx1W5z17TZGuVmsZ/MRRQnlUCry4r4EdI2R6cd0uCId0P2xa1gk7+n4pbv5
 urCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734692901; x=1735297701;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DrhlfxHBds/4kHdRY9eVwoEqBd4q+1/KO6/J4NzLC4=;
 b=cgp3EOLwuQ5QbZbbNuMO7lx8+xHaI5DoLvGNcVjAp218d2WLwB6xa09zbFLHFW75WY
 FAZrLq/U3QwP8OqCa/E82RZ6Pi/zWMd2ae6NI8q81eQZ03CNzeQXvDyAvgCW5W8IngMW
 FdxJu7vRw36Iu3mqKweFFlsLmMuJxxAqSyP9obOosfQ27aUILT0vD2KdLmQE69kXwabv
 OyTDHyKN58CHzPY39o7Vz95ZJ190Pj5EeCduQ7G+YLJtSdDcOWDtdLuvBTCx69LANWSC
 5alC8I6V6oV5B3l/23irj4pDcIMkhsA7dd5RrHbmGIjMaPzam5KdFDiFijlvibe3AZ5B
 ZUWQ==
X-Gm-Message-State: AOJu0Yy/m7UeweoTofJHCsjJbV1LnAfRdfiFU4aVHV2c2Tq8EuqISacF
 +kXGYOooN8+kYLlaC9bvwFQfpiZ1QRVvw3Z4/IkVLAtercaURuXkrhOWTmFRrQQ=
X-Gm-Gg: ASbGncsjvx3DLT3cy7+PVHSO2fRYWvsPenDRbRzcGlYGHRBpzmO7JgIKC7OYkiUZlqG
 dCVFtAYqQDlq3gby/VqphYxCeUwQ5XL1pREv0pFkCSJskRz8XuoOVq2QL9geWW2mu+gaqKYKCX3
 mWlweDc72Ffot4ldcaX/Y/hvyz3fIL/E+spwK1/v+Z3+r+dc8ABmFl0MSM/D4mCDQrpxT3HYNFO
 t1T2rwfHkMF40YNzwwLech+nn5VUWC/jkgELfNq6BxzbgFgkx9u9/KD3NrGkmqe56qEWprlyZqM
 5w==
X-Google-Smtp-Source: AGHT+IEB7a8tH/v2XKGRI0qm0/TRo+vlgcznIz1c6YytgDs0BPdvJdltFiv4LIql3Ji9Bik3awd9nA==
X-Received: by 2002:a05:6000:1faf:b0:385:e95b:bb46 with SMTP id
 ffacd0b85a97d-38a22a4c153mr1849082f8f.22.1734692901140; 
 Fri, 20 Dec 2024 03:08:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474b6sm3790616f8f.51.2024.12.20.03.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 03:08:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: mripard@kernel.org, cristian.ciocaltea@collabora.com, 
 Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20241216101015.3726517-1-andyshrk@163.com>
References: <20241216101015.3726517-1-andyshrk@163.com>
Subject: Re: [PATCH v2] drm/bridge: synopsys: Fix Copyright Writing Style
 of dw-hdmi-qp
Message-Id: <173469289986.3312755.2084072456136446331.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 12:08:19 +0100
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

On Mon, 16 Dec 2024 18:10:03 +0800, Andy Yan wrote:
> The standard writing style should be: Co., Ltd.
> This fix the mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: synopsys: Fix Copyright Writing Style of dw-hdmi-qp
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1e93f594285faef57651a0c89f61a7d976db7def

-- 
Neil

