Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87038A5DE30
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FB810E15F;
	Wed, 12 Mar 2025 13:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h4Ix+MnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043C210E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 13:39:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5CF945C555A;
 Wed, 12 Mar 2025 13:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76ED3C4CEE3;
 Wed, 12 Mar 2025 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741786762;
 bh=9q9pTFFDp0VqclePp1DPC4Aqwa4kz8lpmBphXdxkMW0=;
 h=From:Subject:Date:To:Cc:From;
 b=h4Ix+MnN5Alq2Q/xvt3sYssB1OcAbSfSozxyt8JWssMb2o1XrJF3OP1yrP/QTNT59
 TEgRv4Vg+SCTMoEUVONzdUudAR5nKq1VIZB886zyYfdmnq6lzX3VMqpheaTcPXAM9G
 fkTDFMSarHUlyk3+/H8/UipqDayY+mg3720cof846fHa0ClVgI/iomKzyQYhDdiJYD
 4T2Lbs8BsX0KoTZ3IfusI9mAk9s1m7uJ8Fui/0q5UOoyJwJNYscKhe281h8zpBxjOF
 YuaBda3mCuoEFu8gbZLIA0+o4UrFiGxc+rw1cAItIWVUSDVEHyt+tVWmi0bdSbl7zn
 FkuKLnUWeXYJw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/2] drm/display: HDMI documentation improvements
Date: Wed, 12 Mar 2025 14:39:15 +0100
Message-Id: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOO0WcC/32NQQ6CMBBFr0Jm7Zi2CAIr72FYFDrARGnNlBAN4
 e5WDuDyveS/v0EkYYrQZBsIrRw5+ATmlEE/WT8SsksMRplC5apEJzNObmaMi10IXegjVvVV5Z0
 2l64bIC1fQgO/j+q9TTxxXIJ8jpNV/+z/3qpRYVFaXbu8UoXVtweJp+c5yAjtvu9fxdhSzLcAA
 AA=
X-Change-ID: 20250306-drm-hdmi-state-docs-89703b124bbf
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9q9pTFFDp0VqclePp1DPC4Aqwa4kz8lpmBphXdxkMW0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOkX+9pCddZuWGmU/OahT1GX0NFYlZj1EWXzMt4xlriZr
 BfeyH+0o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPZfoPhn62I8OpbR076FR14
 sEfNhP81z8t5u1/UJVi1mS0/4nrdPJCRYVLhXyW9HQGHCg3csxzXZl1mFvaYkmzzq5U5m5EjwnU
 fAwA=
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

Hi,

These patches improve the HDMI infrastructure documentation, in
particular to mention that edid-decode can help debug and check
infoframes issues.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Put a link to the v4l-utils repo
- Used a newer edid-decode version
- Link to v1: https://lore.kernel.org/r/20250306-drm-hdmi-state-docs-v1-0-56a19d3805a1@kernel.org

---
Maxime Ripard (2):
      drm/display: hdmi: Create documentation section
      drm/display: hdmi: Mention Infoframes testing with edid-decode

 Documentation/gpu/drm-kms-helpers.rst           |  15 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 292 ++++++++++++++++++++++++
 2 files changed, 307 insertions(+)
---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250306-drm-hdmi-state-docs-89703b124bbf

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

