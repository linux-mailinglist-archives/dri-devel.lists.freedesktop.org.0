Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE3C6915D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9BB10E351;
	Tue, 18 Nov 2025 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fl3TONNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B118489CA4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F779601D0;
 Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D0EDC4AF48;
 Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763465444;
 bh=AK6BcBpco0zrDLs6yFA7LN08SizzfSM6DcS8jocisPc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=fl3TONNYmapCcstJ+2JZdflzPFkgTv2u3tloHyvqkG3JAUvzd8dJn+CRtyIEaK92n
 /fk+dxMOTp7RS8yDH7LGGgI6PyUPM6D5E6nillcJKi0WfH6xQw29VU1JMqqtPOoxt0
 lOncd/nSVv7KrMK5tpVXZH1qDvLrpp3xZ5ftxr8LPkitWw01s+c7k5TOsnAkSjs4ZX
 5dkT3+FhE2ivAErnbJCOo0aRcL5cUxRyq+EFZUX6mUTYgOAXUVA2Iv6MGoYnhQafS/
 W3ebT06WUO/D6vp5/ejcJSsyP6ecKrTjqWB0NDAwwxnM+//JH2sWjIonihmiovPFO+
 zcNaWOGbrUrQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 39DE5CED62A;
 Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:42 +0100
Subject: [PATCH v3 7/8] drm/panel: sw43408: Improve wording when
 reset-gpios aren't available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-7-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8fVwgWqCGU7w+oJi2TYX9Izrr0MTwJdRKSSnkPCDAys=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjgUmW12FFOQu2z9uADlg6NtyR+JOBgxeGUs
 8Wuexd0XUWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 ckRxD/kBWDXfBnu+s/6DqmpwnnqSlPRFdU7CPa13G24FFu8JnT3hqzP/Bo0GSuCUkO7WGxNdisH
 FQFFZqfjq8KuO5txNGNrOgFCfQUlqNjP/WuTCDwWcleJxXj6I7plpYbD1dSpFiVzDBcCpr/Dw40
 nA/HlE/BIwkiTKvw2uukXOKSA2cEgffyPfLNmoTtp4Ecs+w/f6Px7Ulacz+/zwWC/KmYwsDwptK
 iSI/bBa4qyxEuUDLnTrWf57/fa1GXpkBugpCi5PTGIiigiTJPNb7SR52CTxYovCTGc2YTqCt6Dp
 XywKGJEPA6ygBUUJuThluNMWAoOO5u1YuBiqaq9wbRZpZGnnMMKStRK706/VyTejPwRNik7MuYN
 fTNHfaA2b+V4yz0VbQXzd6UQU0khyI2LlHhReIguG2il+7EZmb0oJHcrW/c5ph31vhkDGIaIaEV
 X1o/tMb2Kg9SE5uJjsyekKB98X1mWCmDetLWPcWAHen2zLiuMWhsSJ2KjI/G8Z6UBR6HqY58MJ3
 GEvpiJhOYEKf3c6V8QcA6i4/I5HjOc9RrtJoRGfI150K0Q7en4oHQRj/EUR83tEAkYBOofNdl/2
 xsrbnyQGnk7H9aw7tw06ZpdBI55yO+RREHT45aARIGxlvp08z5dVFP7HOQVc8s1JjoVGIywgSTK
 fa7l2FyVhqKntMw==
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

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 0a902470e03fa..5f5f013a4da75 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -263,8 +263,8 @@ static int sw43408_add(struct sw43408_panel *ctx)
 
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


