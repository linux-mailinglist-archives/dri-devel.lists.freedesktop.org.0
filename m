Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D015119149
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 20:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C22F6E920;
	Tue, 10 Dec 2019 19:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DD46E920
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 19:59:48 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MjSPq-1htqK43Row-00l1Jv; Tue, 10 Dec 2019 20:59:42 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: include linux/slab.h where needed
Date: Tue, 10 Dec 2019 20:59:24 +0100
Message-Id: <20191210195941.931745-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OrcnEQHu5wIVElyPLtj9cM/U8i3tJsEHQqMgWD9iAttxajBL+4Y
 PRozQipVEPM78uWvddh6kjFJP0m9W7Xl2iyfwMr6le8zEOqtUcR3YqBbcY0m8NmbwLj4gij
 nH91rockYuPliucDJPwxBaK0+/s8ZLF4ilxO0+TiyEzKKY8itGLkPD8DVvHiCm1DACaRXts
 wksFhEsGXgNsaguRsbwew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BEiflWA01l4=:gpxzEPPROCuBYSCdglCxHL
 0FQH6OkxWAbdkjhBtOL2AOW8TAzyUHTAwzR5AHHK34sofuin6RguUUZM4C2xfxlzS6CZOZCKz
 Vo+yFJMGQ1BhPWdJG9soTTJrBPbwWOmI/bekCgki/MyU1It2Zx5Gne0YZaduSKHuAb0c+6YuY
 UpL90RraaJFqofxod1WlkAjNmht7gW1xPfTQwcufejGVJFhtrWOnrLcB5PyA76aPi9FHFVzvA
 kPjqEaWQGpM3xe9qkwf6ZjNXogUw5NkQhhqsndAXeH8kpKKt4hcLquS3mPWNqCQ6aZVcLcqbZ
 tfJHLO/WK7A4/jNQ1gNjssnSHMqomjQE73RqgmN+a9WwtA2tbrdfl5KOjDkoU8YrmhJACYK+W
 q36JztMtUCneNEZ6LNdXgahuwkkodb9RTyIIacI8L5lwUPUZRC3k33OCFOn24mdnsx5UL86tC
 PPbls88S0p6zUPMMN1zOFF3uP0TMZaNPetFeEdCwKosDt57VVWEHpFE9t/JCIFFofQjpB/BpA
 7JAubHz0yx4UUIeL6yol4IjXh1+EOCsjo+kZYaCUsVJL8zceWjEt4ZAUZjNLEW+7andvWqIyh
 w7oh5ezTHSn1BoCiCPguMWISCoPlAxEvaMCRimn3oR127JBQHa+H9DlG5f1LtOvIO9hXE2Zos
 5eSy9+iqpnSZhzGhTLuPx1nhkoO+rpRsUtZijJ8uPTvjoXouQJkXKrN9o9H5Bvx1lyPKI0mU+
 /EFS1hkKQ0TdUH7AOlhi1Ni9JD6z30oze1Ep4dCICmtrQsf4ZKsCI7vMCb9p7gawwP5k19GoT
 B8adXghoLkZL9WVo+ogipbYaq0Q5KN1jqMyHeq5myaaI/2CQF6K3IJzktAZ4hi80CVBLrDliv
 p91ZckwO07jrR8qPb+Fw==
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
Cc: Eric Yang <Eric.Yang2@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Michael Strauss <michael.strauss@amd.com>,
 dri-devel@lists.freedesktop.org, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling kzalloc() and related functions requires the
linux/slab.h header to be included:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c: In function 'dcn21_ipp_create':
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:679:3: error: implicit declaration of function 'kzalloc'; did you mean 'd_alloc'? [-Werror=implicit-function-declaration]
   kzalloc(sizeof(struct dcn10_ipp), GFP_KERNEL);

A lot of other headers also miss a direct include in this file,
but this is the only one that causes a problem for now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 906c84e6b49b..af57885bbff2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -23,6 +23,8 @@
  *
  */
 
+#include <linux/slab.h>
+
 #include "dm_services.h"
 #include "dc.h"
 
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
