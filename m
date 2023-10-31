Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14107DD2FA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EF710E58B;
	Tue, 31 Oct 2023 16:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CB110E587
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:49:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 170F2CE0ABE;
 Tue, 31 Oct 2023 16:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E943EC433CA;
 Tue, 31 Oct 2023 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770983;
 bh=49oNkv+eu8/9sfrO1BY+OxAGBqGgL52MLLkCN1HQuy0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=k/KIonANQlo6ca4Cgkmo6WzCNt9BjXoNVmgpNgqkbvmep6rcThrZAH9b1Mj2kgywH
 6ZIsO3YnB6JRBFNRgpP3DyTlrLCuZuHqqk5yNP6UGBxxSY0xOJ+GX1SDrkmT1tGO/1
 grxuoU/vR4pCARX9TjdsMkdVjmDVgkEvPpdSEUPRfYgYtOnUwF3uXee8BPkBwFC2fo
 97Gut++B04qvrHXELIj3UKO6rp5bNFfpLE18aHOM2EQK33cFdCQP+tKJUrXfMy1WaX
 bhFOHhJT01yGihknAULLnugDzKJRQkPesJK484d2syLPwFtAEk6uoYFhnVjo0M1MQ2
 3ueDwWrkcEgQQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:37 +0100
Subject: [PATCH RFC v3 24/37] drm/rockchip: inno_hdmi: Remove useless enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-24-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=mripard@kernel.org;
 h=from:subject:message-id; bh=49oNkv+eu8/9sfrO1BY+OxAGBqGgL52MLLkCN1HQuy0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+veV+v/fVHz0v+Uce23uLmmHZkY/Uf1b2p82LroR/
 Prsi46ujlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwku4/hf8qGVevn9zqsT762
 b8qPy8eSV6o2HrPjnmpzT/al66sOUylGhqOHixKqjdsePJnsJi9y/oEF5xS3/vo/dhUzFFMvT/5
 vxQUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CSC_* enum has no users left, so let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index c342bc8b3a23..f05417c6b637 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -66,15 +66,6 @@ static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
 	return container_of(connector, struct inno_hdmi, connector);
 }
 
-enum {
-	CSC_ITU601_16_235_TO_RGB_0_255_8BIT,
-	CSC_ITU601_0_255_TO_RGB_0_255_8BIT,
-	CSC_ITU709_16_235_TO_RGB_0_255_8BIT,
-	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
-	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
-	CSC_RGB_0_255_TO_RGB_16_235_8BIT,
-};
-
 static const char coeff_csc[][24] = {
 	/*
 	 * YUV2RGB:601 SD mode(Y[16:235], UV[16:240], RGB[0:255]):

-- 
2.41.0

