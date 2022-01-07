Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB46487524
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 11:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEB111B91C;
	Fri,  7 Jan 2022 10:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 07 Jan 2022 10:03:10 UTC
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC75411B91B;
 Fri,  7 Jan 2022 10:03:10 +0000 (UTC)
X-UUID: 51f8efc21ea04903991e1abefbd59d34-20220107
X-CPASD-INFO: b29efc9df7c3401f828f9506db65018e@q4JzhZOVZ5SSV6V_g3N8oFhjaJZqYVC
 FppxWZV5hZIWVhH5xTWJsXVKBfG5QZWNdYVN_eGpQY19gZFB5i3-XblBgXoZgUZB3sXRzhZaRaQ==
X-CPASD-FEATURE: 0.0
X-CLOUD-ID: b29efc9df7c3401f828f9506db65018e
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, EXT:0.0, OB:0.0,
 URL:-5, T
 VAL:187.0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:1.0, CUTS:130.0, IP:-2.0, MAL:0.0,
 ATTNUM:0
 .0, PHF:-5.0, PHC:-5.0, SPF:4.0, EDMS:-3, IPLABEL:4480.0, FROMTO:0, AD:0,
 FFOB:0.0, CF
 OB:0.0, SPC:0.0, SIG:-5, AUF:12, DUF:29770, ACD:157, DCD:259, SL:0, AG:0,
 CFC:0.168, CF SR:0.366,UAT:0,RAF:0,VERSION:2.3.4
X-CPASD-ID: 51f8efc21ea04903991e1abefbd59d34-20220107
X-CPASD-BLOCK: 1001
X-CPASD-STAGE: 1, 1
X-UUID: 51f8efc21ea04903991e1abefbd59d34-20220107
X-User: lizhenneng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by nksmu.kylinos.cn
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 1687336020; Fri, 07 Jan 2022 18:11:04 +0800
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 0/2]
Date: Fri,  7 Jan 2022 17:57:30 +0800
Message-Id: <20220107095732.982194-1-lizhenneng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zhenneng Li <lizhenneng@kylinos.cn>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For adapting radeon rx6600 xt on arm64 platform,
there report some compile errors.

Zhenneng Li (2):
  drm/amdgpu: fix compile error for dcn on arm64
  drm/amdgpu: enable dcn support on arm64

 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 drivers/gpu/drm/amd/display/dc/calcs/Makefile |  6 +++++
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  7 ++++++
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile |  4 +++
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile |  4 +++
 .../gpu/drm/amd/display/dc/dcn201/Makefile    |  6 +++++
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile |  4 +++
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile |  6 +++++
 .../gpu/drm/amd/display/dc/dcn302/Makefile    |  6 +++++
 .../gpu/drm/amd/display/dc/dcn303/Makefile    |  6 +++++
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile |  6 +++++
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 25 +++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dsc/Makefile   |  7 ++++++
 13 files changed, 88 insertions(+), 1 deletion(-)

-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
