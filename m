Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9FA3D7FE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D6A10E94B;
	Thu, 20 Feb 2025 11:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rKw1BR+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD2A10E948
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:06 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-545fed4642aso898363e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050105; x=1740654905; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KX85e3cYE0QI6HqN7XA+DGsKC7NKCz4a8QkfcGXFNn0=;
 b=rKw1BR+doGDPBYiFPDKxUeqp7D/+4bnXsZxA/BP/69c5sylUIvr3fi6L4gj28PiRmc
 rLzdUXC0z567K18F8HsMjDYJa4cZz6OvuYPPk+CjNWUNbHqudDszA/+qnV4zTtGIln4w
 I/bI3iIMUnOqrJxZPByaune3m/l6fufFbGctptgbHluKxcybQ9jUBH4qt//B8EcwOaQQ
 SOTn89jBKpQztmAjRbGnEZw28QwayW9iyr5E+/I+KPX2F+dgZ64kyNbvQoj1YMNJ2xyb
 7gV5/AftybzIetJMO2ZlMvnhoG5m7XNOXvfhgpUgYQZBycRWfrGqAhKNSQVR949nKx6v
 VS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050105; x=1740654905;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KX85e3cYE0QI6HqN7XA+DGsKC7NKCz4a8QkfcGXFNn0=;
 b=MnhUDOVtjrOjGCwFeAtT42EJBEktNt8tkZWMo9vzKqL6E5aoYWUmowbBHKChgEEhW0
 rTL3hIsCf9fABaTe12GvROf4Q1cIHDFNbA9/YmiDrmNu4lNtDys47XcqO198wdYz9GM2
 h7AcVgE4luqYW3Rhm+JgrTeGynK+drB5kRRPaW+O3BtS6VQSQxCBFgJFrl8c7KZQzv6N
 cXAVvbuMC6SFi2FktcaTdDsfbEORsgvDV4+us90++koK7dLkzKi7duUhr7eSguif3sSS
 v83ZJ8d8Y+3eoFwAuqOVPjZXl+BPDeR7fPiT1Ol8HDdR7dPrhmzBjvEUgWxps41zMSr0
 Ys/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1/0Jxx508V7Kw+J1xz0eomGDxbuyG8EQ9wBJk+ClafKm00g709mCctGiKaSce3n2Lsaoc9DxzxFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx39AiM1aulg4CwZ+IGSKPjSKP+t29T+xVzJBQXvHg2L+twNJI
 oM0LF8kkH+BRi2eVFR/ifpytvVHfQuRmHwKWPbvPv2gwwtfhXjEiuv9xAiNpVF0=
X-Gm-Gg: ASbGnctTWnmmhpxYYL9WhEKikKBfoc1vGWVQwkIjytpXHwU/FE4OOWD4/CszkxMGg9/
 uVV3uDTGuMlqrFqjoHdOHE8rboXs1CoNkwdRjTFgjIShbxBMe/r1zVw3kViDvV7ItNL7BLhKa+V
 JA/jx4PDGBjo+V6ODOlduC+ki+Gv893sYxd5aiBCwwYHFZ27kKovoIRlnMlwKdZZI25o80bPBey
 +B0Fo3wLgdE67lBI1PGXXbhpX3qdu0O7/MnXuUNJ9oyq8ppWjvBhPbPN2LJ00ehrcF/YC5SDknr
 7GepZOcN08yIdFAB4007KRk=
X-Google-Smtp-Source: AGHT+IG5EZ3MbgXrnnf2FkcjlwzeGF14xhIhWRQXhiEeQQCNYMIhTxtVaUCFD3nFrIpgoLw26AvRGg==
X-Received: by 2002:a05:6512:224e:b0:544:c36:3333 with SMTP id
 2adb3069b0e04-54724a7b447mr799283e87.30.1740050104821; 
 Thu, 20 Feb 2025 03:15:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:15:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:46 +0200
Subject: [PATCH v2 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-4-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gCK+JqgYnCP01PtEyqufWSc/n0zhfsQsxdJ+Ud3negE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rEbJHBbORbIefZc6iISdAFhieGQ33v4LyZ
 TdCorO1c32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1fjdCACP6GLXiufCQ9UEpsNvSB7qNK9i1JDaj/ntqy8bB6XhsyXItB4E00m3PRNBAO32QhZ/WnX
 nktwAb2tH1j0Sg2HKU0CW0Y9y8l5jTX3oLQoKh+wVAXrXdpUum4qRBndE88/7xaSa3x+p85OzzL
 xWXcDJkFVKUPuNj//5AF0s9+33Pyfp2sgqUbSKltUCjoNEvj/5XSvD45MaEfhAfp3k7I1skaPE9
 a1SwxoaY4Sx44nleZaJ7xvx4VAThvuBbUtyQix1OGjk5hqBlK7y0cW/iDzLKf30qxM9lvBY0Jk8
 fOYobntzAK8ViKS88/mj+MvhbEgHl+1nuplkxzdDW0tswKXM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Instead of using .parent_names, use .parent_data, which binds parent
clocks by using relative names specified in DT rather than using global
system clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index cbd154c72e44c848fa65fe01d848879b9f6735fb..a99bf482ba2c02e27a76341ae454930a13c8dd92 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -122,14 +122,14 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 
-static const char *mpd4_lvds_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "mpd4_lvds_pll",
 	.ops = &mpd4_lvds_pll_ops,
-	.parent_names = mpd4_lvds_pll_parents,
+	.parent_data = mpd4_lvds_pll_parents,
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 

-- 
2.39.5

