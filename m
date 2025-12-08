Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09268CACB53
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2458F10E401;
	Mon,  8 Dec 2025 09:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kX+y6vh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D7B10E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4678F444C3;
 Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1CBBC19423;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765186946;
 bh=VU4ncZYAaVV7r9VtJ7Ny0njR6XxnJnIWgd77T2EV1hM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=kX+y6vh+sIpjKq8dwlZcOfMNwdig+6SsF+b/103KoOzAoKPWRTKGgBV0H1Iy4YNBF
 +Xw94NlbMGZxDoWEP4Vz2ZfM4IqBO646kNdhfXmPIXOVngTBthaCtdWiDLEgbOw36E
 MbLsYKqnA2Z/lTHVVb6csKUOgqukbPmPKObivx2z9PRtBjV+ikoXEHt3802YHQj6GZ
 /jeUl7cO0ErNwtwF6m9hoBXpPaSjtwQ80UoN/313YkgWOhX90u0gLo0iwJm+gI7Ztx
 DqVjhx79rusG/AKAysWKurt1t7SVNyugmd/77oQZDTo9YC+yv3wnDkCvXRyl00qpP7
 +IlsP5YZwCxXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E8F7BD3B7DE;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:42:00 +0100
Subject: [PATCH v6 7/8] drm/panel: sw43408: Improve wording when
 reset-gpios aren't available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-7-e9e559d6f412@ixit.cz>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
In-Reply-To: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dZWtlEK2SHiGGTwbkLjudIbRYRyXhSNsD11k1PpY920=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/LGupKmLwTHUbdE6Mi+rzMOjDQPVev4qCi
 mgH9TAz/uyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 ctjJD/0bKiC9ji2CvVmOnM+ywdGjn+QPwD42c2H6AvGxTEfob7IUszojjuZW03ruHecKGE294zl
 3SBIw5S7sFxHhsMFuD/fz60PJ9CoPesyprWbeh7WAvimi7yRP9W9365CwnOkyBXCW1AozYia/sc
 LVBd8fPJ8qMbuFpvzRPnD76TcyLsQElLEqzJrpDWgEuyTSlUcUJNRYNqPxPuxiN5W34MZ2mfrU6
 nYlCE9Ya2eOYL6CexaA9eCoip9herkSAiALZYUh4YiDsuKXydZTrmrjPzqLQq/kynBm2F1ORTNq
 ksLUHv3pvTFswoCBfIcVX0tGdnkxbd8g6Y9/f4bD2DZDkopv17DbuAqEeivBgj5+8nkPgc5VwIp
 nX+i9dLexMfY+K22SjFNV0cBWgTykTJZ9m0fJpLRmFuKZDFkhPXiwDacq3CF6wLTG0AbFge+oD+
 /gy+UCfY55iJWHioZTiPi3+uwV53l4WHi28oqe3WW7I0lY2zuOa2lFg2tD7gXFt3dwDHquZO9W/
 uq/hd73uVDMIP4PTYL2/tiHHnhTYaELqz90T60mSbASzWO3lZfpygFTrncQ/DoF1an7j9ZOwvhL
 v/nq/gVWMnk+KwHWJaz7JwcFV8D7Hwwk4obpgTR+yiU9D/uTGd/9JWaOl4ogOCQh3gY27FghiAz
 5Hk4PI2REPwmDXQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Choose better wording.

Cosmetic: also inline PTR_ERR.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index e8a970b53d873..edc7749d98d71 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -262,8 +262,8 @@ static int sw43408_add(struct sw43408_panel *ctx)
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio)) {
-		ret = PTR_ERR(ctx->reset_gpio);
-		return dev_err_probe(dev, ret, "cannot get reset gpio\n");
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
 	}
 
 	ret = sw43408_backlight_init(ctx);

-- 
2.51.0


