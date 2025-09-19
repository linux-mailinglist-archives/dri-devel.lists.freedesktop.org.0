Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C98B8C607
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44C910E2AF;
	Sat, 20 Sep 2025 10:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redadmin.org header.i=@redadmin.org header.b="tieApSWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3184 seconds by postgrey-1.36 at gabe;
 Fri, 19 Sep 2025 21:23:54 UTC
Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6454610E25C;
 Fri, 19 Sep 2025 21:23:54 +0000 (UTC)
Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
 (authenticated bits=0)
 by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58JKUIWj010955
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 20 Sep 2025 05:30:19 +0900 (JST)
 (envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
 by www.redadmin.org (Postfix) with ESMTP id ACC4D10E4CA7F;
 Sat, 20 Sep 2025 05:30:18 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwR7-27my8yB; Sat, 20 Sep 2025 05:30:14 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
 id 5A21110D40E91; Sat, 20 Sep 2025 05:30:14 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1758313814;
 cv=none;
 b=PlNXfeku8oj2EzYy6qYuLEKpe9FCHDw+GjVqXYUwlc+eSrwIU/mt/B3WUVwsyKvKyTYwMoRMl1QFgFgPj21J4PBKJe8hK5IFAhfo++YZ04dZ6G4BZ0TRvv0kAE/MdO5CcAQNOucxKou63jDyEjeDkN3PIFds90KRKahX2CRZxhM=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
 t=1758313814; c=relaxed/relaxed;
 bh=hDlAW6pRlmwzieurJae1TG24O8nAZARlUukhneCZTXc=;
 h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 b=LvRY3ZAWbrVz9fLC9v49hiB0JC5zIE09E0ou9SrqexR81ahtilQZdLQNIi70pV2tG36Cko+P0tTUzNZta5diINbYuqR486zoSA0lRfxgCcneWyGGWnfUmXpBw4kvyL3XwKTxWX6vyemCU5f8cnfu67gpxWSztFfdOfRLVNowUdk=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 5A21110D40E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
 s=20231208space; t=1758313814;
 bh=hDlAW6pRlmwzieurJae1TG24O8nAZARlUukhneCZTXc=;
 h=From:To:Cc:Subject:Date:From;
 b=tieApSWw4uiEgzi1g7jJwH8/OsEKYzXnSD4Oo/JsVGVJ5P7aspkZtjlw3c+u02eYj
 b2HjpiO7knfd3DvJYNfqBt7maQU/TpB+kvM5KVUjtryx82Xkyjj7twluagBab0VHrA
 R0CAKYRgS4HOIVPvJbPIL0ZmtYHxfxmyYg8JTYfs=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] drm/amd/display: kernel-doc: document
 mpc_color_caps.num_rmcm_3dluts
Date: Sat, 20 Sep 2025 05:30:11 +0900
Message-ID: <20250919203011.1833355-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:49 +0000
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

Add the missing @num_rmcm_3dluts field description to silence a
kernel-doc warning. While here, fix a typo in the same block
("pre-definied" -> "pre-defined") and clarify the oGAM description.

No functional change.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/disp=
lay/dc/dc.h
index f24e1da68269..144de7b3ed49 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -231,12 +231,12 @@ struct lut3d_caps {
  * plane combined blocks
  *
  * @gamut_remap: color transformation matrix
- * @ogam_ram: programmable out gamma LUT
+ * @ogam_ram: programmable output gamma (oGAM) LUT
  * @ocsc: output color space conversion matrix
  * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
- * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but single
- * instance
- * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
+ * @num_rmcm_3dluts: number of RMCM 3D LUT instances supported by MPC (0 i=
f unsupported)
+ * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but singl=
e instance
+ * @ogam_rom_caps: pre-defined curve caps for regamma 1D LUT
  * @mcm_3d_lut_caps: HW support cap for MCM LUT memory
  * @rmcm_3d_lut_caps: HW support cap for RMCM LUT memory
  * @preblend: whether color manager supports preblend with MPC
--=20
2.47.3

