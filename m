Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED77BF8F66
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A84C10E643;
	Tue, 21 Oct 2025 21:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redadmin.org header.i=@redadmin.org header.b="WzCL/I7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6C910E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:42:16 +0000 (UTC)
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
 (authenticated bits=0)
 by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 59LKItHM026350
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 22 Oct 2025 05:18:55 +0900 (JST)
 (envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
 by www.redadmin.org (Postfix) with ESMTP id 05D5F10A0ECCF;
 Wed, 22 Oct 2025 05:18:55 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMCxPa58udCL; Wed, 22 Oct 2025 05:18:51 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
 id 2410F10A0ECCD; Wed, 22 Oct 2025 05:18:51 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1761077931;
 cv=none;
 b=lfeThg3CYsn4JXjwm32xuTZQMVpQCont5vtfXxOtgnt0qUfdOSiTBnkmnq75FDUI66hRzJsQ736sReOATElhL3Q6lnuTX3sRI1q0J18NbDoRb71ChCGqHdhS/GcsCqJIBbiY059PEGXKpwYK08EgVTia965a1jNkgKew/NW9600=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
 t=1761077931; c=relaxed/relaxed;
 bh=TgHTh1zsRTUhGnDg2RPXn7vAWeAZ5MWHXT2jf02tKlo=;
 h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 b=FKsjsewgw0weHhfPMcPCbE8tXr+YPMVJHeVItzdwhGmmV6Aj9PzV3IvZk2qrIIOge4MxeDxQQpqbMwBqUjY4QnT+dQZbjlWJwh/34AuTrZSuEIPZGDg9hkrPfpass33EcovPmwnkmfkfRKq8UY1uszIv4kHDhYrTxRB50oPRNkE=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 2410F10A0ECCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
 s=20231208space; t=1761077931;
 bh=TgHTh1zsRTUhGnDg2RPXn7vAWeAZ5MWHXT2jf02tKlo=;
 h=From:To:Cc:Subject:Date:From;
 b=WzCL/I7IYMPKkSSrAOW+I3bR5AWBkKufQCLydGSIJssrcHraazEPNIuDzGcAd+3uS
 qvW7G3igJ4wlnK9RtbfMSEndKjBgvBSb5WJ2aWWdfQSRXrnuSpuVDmgpM7z8DL//yX
 T/1yermfrTUABhKjdkd4nT74EUDq4e1a1umkCvmo=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] drm/amd/display: Fix typo and incorrect function name in
 dmub_srv.h comments
Date: Wed, 22 Oct 2025 05:18:48 +0900
Message-ID: <20251021201848.311586-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Fixes two instances of the typo "retreives" -> "retrieves"
in documentation comments (for dmub_srv_calc_region_info()
and dmub_srv_calc_mem_info()).

Additionally, fixes a copy-paste error where the comment for
dmub_srv_calc_mem_info() incorrectly listed the function name
as dmub_srv_calc_region_info().

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/=
amd/display/dmub/dmub_srv.h
index 338fdc651f2c..a6f794ef2203 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -637,7 +637,7 @@ enum dmub_status dmub_srv_create(struct dmub_srv *dmub,
 void dmub_srv_destroy(struct dmub_srv *dmub);
=20
 /**
- * dmub_srv_calc_region_info() - retreives region info from the dmub servi=
ce
+ * dmub_srv_calc_region_info() - retrieves region info from the dmub servi=
ce
  * @dmub: the dmub service
  * @params: parameters used to calculate region locations
  * @info_out: the output region info from dmub
@@ -655,7 +655,7 @@ dmub_srv_calc_region_info(struct dmub_srv *dmub,
 			  struct dmub_srv_region_info *out);
=20
 /**
- * dmub_srv_calc_region_info() - retreives fb info from the dmub service
+ * dmub_srv_calc_mem_info() - retrieves fb info from the dmub service
  * @dmub: the dmub service
  * @params: parameters used to calculate fb locations
  * @info_out: the output fb info from dmub
--=20
2.47.3

