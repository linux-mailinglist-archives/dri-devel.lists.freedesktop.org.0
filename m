Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946181A2931
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC146E02E;
	Wed,  8 Apr 2020 19:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10027 seconds by postgrey-1.36 at gabe;
 Wed, 08 Apr 2020 19:13:11 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B656E02E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:13:11 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MirfG-1iqWM210J2-00es0G; Wed, 08 Apr 2020 21:13:06 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu/display: avoid unused-variable warning
Date: Wed,  8 Apr 2020 21:12:46 +0200
Message-Id: <20200408191305.1179310-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Hy3BKs9II3tOW07ZNAGp8CLbYOcHoW2PZhpkKmnkAWBjgtzXcnZ
 GrpGlVQEy43nUw6umYZpAwb8VQbjG+Nw1zkXIIAf20xcGD1u+J2Ojm0A0deCH+DfMNYPzVy
 eGoterPP18DDEKX5fN6riyV+w6An/VDD/gLRj1Mz19Dhum4hxWbMrk/3Q0fre++Dr2Wgyhk
 iBFRYQxl3ZW4CPmkUJaTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7HDqPb3T1x0=:nLpDjp+Y9C2YWIHls6X9ts
 7DGPPL6rk/uIWXUkW5bMHlMhDyw+PVgWmfmAkdBHz0kb35UgQFCUY7ooqNpYNuKbfDQh5QqcA
 otKsr9ANVh0balBUEip8oX1x402NwIkoqk6qltHNn+VG+++mK3qp4yMqL1yYru9wxM6fb3MAl
 rsT7zOa0RbgRWCbxGGxc5rWRFAAVC31vtPWqoEyNAMEdey2wzEjTUbjb1kBgJ9h7EA18S/cAg
 PU9Skvs1KQa2GfnCRPKTR3bJeN0OhBBmv9ZKw1lZZkHyAFoiLND5wSqWIbOyy8CN0y70OCu99
 G6eRg7ZqVsWj0zukkO9XTAWB5PY+c/rTzxZStnUXPPvV6U/Q540Cmz+9QPQCSk4+i1eJymZ22
 PEtkW6Vfl2v4QCAyEPyGioJl0ZodR0u1KLDIaNnbiKhpRdsOCSkNkDzP0Rju6xsTvooemjYoI
 Kox6uuX1yN2YuhjAaGnVXaswErXBDow2TopEoEEJoJrtrViIvUEzEGOrJqjh4Z48z4DAZiKRW
 BjmSt6HWMYUfQPXTRboDyuYvfA5EmAmdrJT2DUG/lSyqHOLOoSMUt1D9NjxbTCVX83qZXzxp0
 basaLWD1XLK4Rpv2q+HJnbUGceQMtVHWRdhCDuONODLvZz64X7URoPJlC+0Tn4+JxNJcxKlJi
 GooR51nMTOFHtWEjGZVZxTm/uN5Hu0cXPJ+estsTYe/alSADMW2hH3UPD0GkIfd8WTSic5PWd
 /qkYVT9nBriEn+YQ2RxXyk9uOKMzaz+jRoYq6NrXyldJUyt8XXH3Je3OKehC1fTMTKGehRyqk
 D3U5mV/6ImFVjDk3Kqvoc4Y9Erepzdq2WnbdCZ0q6+nLIjtAto=
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
Cc: Arnd Bergmann <arnd@arndb.de>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without CONFIG_DEBUG_FS, this newly added function causes a harmless
warning:

amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_connector_late_register':
amdgpu_dm/amdgpu_dm.c:4723:30: error: unused variable 'amdgpu_dm_connector' [-Werror=unused-variable]
 4723 |  struct amdgpu_dm_connector *amdgpu_dm_connector =
      |                              ^~~~~~~~~~~~~~~~~~~

Use an IS_ENABLED() check instead to let the compiler see what
is going on.

Fixes: 14f04fa4834a ("drm/amdgpu/display: add a late register connector callback")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3674d805a0a..8ab23fe98059 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -51,9 +51,7 @@
 #include "amdgpu_dm_irq.h"
 #include "dm_helpers.h"
 #include "amdgpu_dm_mst_types.h"
-#if defined(CONFIG_DEBUG_FS)
 #include "amdgpu_dm_debugfs.h"
-#endif
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
@@ -4723,9 +4721,8 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 		to_amdgpu_dm_connector(connector);
 
-#if defined(CONFIG_DEBUG_FS)
-	connector_debugfs_init(amdgpu_dm_connector);
-#endif
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		connector_debugfs_init(amdgpu_dm_connector);
 
 	return 0;
 }
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
