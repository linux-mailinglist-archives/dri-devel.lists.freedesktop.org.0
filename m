Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F378D0260
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 15:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8445710FAEB;
	Mon, 27 May 2024 13:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RNbGkyXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834E710EBE5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 13:58:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D870761880;
 Mon, 27 May 2024 13:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFA3C32781;
 Mon, 27 May 2024 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716818335;
 bh=t+4tNe/umflmWgZ9tpden00ukHA1rdRt/ITJ6p1TW8s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RNbGkyXtb4H6+4mzgkkYQwFQHpNqqD9eRb43S66c8rotmMFoQd+jNDqvmyW7HEEvD
 0qRn1qcX7eYZC4eV/3tbIT2pNgPGB0dk1iUl24JRTE803o8X33QK+RBI7FWHQDaskE
 jTHOTmprtWEEZTUWSxiZ3uynV/A0dOP3xPW85AvplL7MD0j2LwRA6gD8KT+tUtWBPE
 MPyGpvbZ/6fx2rc8dQQHdHDSCAHUdTxoYmsNQf6SvdlahLbS9wzaV0lTT1x3JrK7bc
 uX4aa/tWmbC7zHuLvwuZR1Dv9VP4COsbmUbpNsj0rKnz+OHzFs9R1UBP4vxyVYvzyx
 7YRx75OXGJkJg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:58:06 +0200
Subject: [PATCH v15 17/29] drm/doc: Remove unused Broadcast RGB Property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-17-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734; i=mripard@kernel.org;
 h=from:subject:message-id; bh=t+4tNe/umflmWgZ9tpden00ukHA1rdRt/ITJ6p1TW8s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhE9NfiDvOVpixl2/WynfmwcL5dfLh8smfxY312dbaT
 p2QwG3fMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaiyM/YcN0h4ey6VOm58faa
 CdXra39UpD28OaH9oia/3yIVzUXpqgu+8Vk1x80uXsDMrS6YtuIeY33YtXbpmxU/D93ecqwmzuW
 j21Gdnv9/f/bueatedNJr+vnWqOD8/zPYN++0uXnrcK5Ky0cA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Broadcast RGB property has been documented as three separate entries
so far, each with a different set of values.

The first one is pretty much the generic one: it's used by i915 and vc4,
and is the one used by all the compositors.

The second one is used by the gma500 driver, and is a subset of the
first one: it can have the values "Full" or "Limited 16:235", but lack
the "Automatic" value.

The third one however isn't used by any driver and documents the values
"off", "auto" and "on".

It's unclear where the last one comes from. It was first documented in
commit 6c6a3996f2c5 ("Documentation: drm: describing drm properties
exposed by various drivers") which adds a number of properties used by
drivers, but without mentioning which driver was using what property.

Grepping at the 6c6a3996f2c5 commit however, it looks like no driver is
actually using it, and a quick look at the entire kernel history doesn't
show any match either.

At the time though, gma500 had an "audio" property used right next to
Broadcast RGB that did have the "off", "auto" and "on" values in the
same order.

As such, it was probably a copy/paste or scripting error back then, and
there's never been such property used in the kernel.

Either way, it certainly hasn't been used in a decade or two so we can
just get rid of it.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/kms-properties.csv | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
index 0f9590834829..c3c50a277cc9 100644
--- a/Documentation/gpu/kms-properties.csv
+++ b/Documentation/gpu/kms-properties.csv
@@ -36,11 +36,10 @@ i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:2
 ,,“tv_chroma_filter”,RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
 ,,“tv_luma_filter”,RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
 ,,“dot_crawl”,RANGE,"Min=0, Max=1",Connector,TBD
 ,SDVO-TV/LVDS,“brightness”,RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
 CDV gma-500,Generic,"""Broadcast RGB""",ENUM,"{ “Full”, “Limited 16:235” }",Connector,TBD
-,,"""Broadcast RGB""",ENUM,"{ “off”, “auto”, “on” }",Connector,TBD
 Poulsbo,Generic,“backlight”,RANGE,"Min=0, Max=100",Connector,TBD
 ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
 ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
 ,,"""right_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
 ,,"""top_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD

-- 
2.45.0

