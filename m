Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AA11922D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2716D6E92F;
	Tue, 10 Dec 2019 20:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE56B6E92F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:36:19 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mw8gc-1hpI030rKO-00s44T; Tue, 10 Dec 2019 21:31:03 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Zhan Liu <zhan.liu@amd.com>
Subject: [PATCH] drm/amd/display: fix undefined struct member reference
Date: Tue, 10 Dec 2019 21:30:46 +0100
Message-Id: <20191210203101.2663341-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:6Y2/uQlFVUAl2FLpNaMIEOkGmiPd6/841XgCPxFoFzLNddBwEXH
 Gv0mA5U4F2XyfY5t7Irv9sGvE7omtf7B7anfrVJBcEa6nJh0oGgFa3a8TjQPfIv9chsmwPT
 jvm00bAGb9IDmiVsEt/HDimufrl4EuajG0pezWC+Cd9W5Z3cXKjNuVPnbUu6xNF5mo57oYn
 vjtK9SqzVDqza+VajFYtg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nUCT4AGSbt0=:GtLA8NfJI8V/5FpLgu6FDN
 0GWnhC47LM7i0xJDSuKrI2pgwypyDZZVdfiXcE0tagEQ+IBEjd1QPsKtJfoXvnA9VLmEeJCPD
 wyaFQLSiCzSDT+TTCtrxzMW2JSyjsY6kCZkhXltjIxiKpgs/xvcbU6xCvRupJcGnPnDEVKySE
 +MefHaC7DOqZ51Kg+H/lb/1jK/xC6YBZWVQxygixc8GFZHT52n6R8Wk+XWSYkj/lFDYiwizP1
 fhJsKZoQb6FHskOf4iAGsxniiZ7Ej6a+J3On1G37KNf+B21qsxW8dzDhUJSpu97G2qer6oWqI
 dvgbaGCLIAnYMsbb8rngG9LUjtIjQLC4pnFMkPS6QDv8MI046eHA9+WqbUBTGs3jWoM8avzaA
 XkhTh7wWAbN709w+vKRXNMB+Ujf6Dt4RzCXUGRSJ43IibCFimt+hhDqRDyXC6tk64Ro1TYt+K
 bgqdktlDzrohU7J61mNIGCntILFDDVJfU9MHxsINPzz+Ad+n6TJxe1hCOT5bSvCE3Nf7CXsgh
 H3HPlJaO2Ug+SCc7CIEDgy3CQBDts1wO5QCLZlSgOJ78DPOmaKO6STb6TcOLAlSud/AC3e8G/
 2KfpmQFknX/ESEF+1iTd72TSOqhoI1A0u+7uw91IcghJuftDvlzg2iwJamdKovO5CydyAZzW0
 QxtXp5HXot4ATK1pzlwSooSSg48g5fR7KfCG2Tm1eyNf4xWSzVeMljHNHv36d7s6Uaw2oiGod
 AcRHHdW82EFu7O3yGepgUiDBMszdSt8QzwK8RI95VLAIJQA8sodVaDwGrfaUYxWR7g2Bvm0o7
 rLSbAFEIosgmr6MMU6eXfXswea/sjMeCEsCjakehElx4jdbyhcCzp59tPhwBS8XTEPiO/rJKz
 4CU7gcgMhl/AFHfbrWBg==
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
Cc: Charlene Liu <charlene.liu@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An initialization was added for two optional struct members.  One of
these is always present in the dcn20_resource file, but the other one
depends on CONFIG_DRM_AMD_DC_DSC_SUPPORT and causes a build failure if
that is missing:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:926:14: error: excess elements in struct initializer [-Werror]
   .num_dsc = 5,

Add another #ifdef around the assignment.

Fixes: c3d03c5a196f ("drm/amd/display: Include num_vmid and num_dsc within NV14's resource caps")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index faab89d1e694..fdf93e6edf43 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -923,7 +923,9 @@ static const struct resource_caps res_cap_nv14 = {
 		.num_dwb = 1,
 		.num_ddc = 5,
 		.num_vmid = 16,
+#ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT
 		.num_dsc = 5,
+#endif
 };
 
 static const struct dc_debug_options debug_defaults_drv = {
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
