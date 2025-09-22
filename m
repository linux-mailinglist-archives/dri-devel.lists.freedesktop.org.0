Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A5B9275A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 19:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47610E4D4;
	Mon, 22 Sep 2025 17:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="sPonckK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD7210E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1758562743; bh=afoF5nMhlLZhXbZpamZnqmBeoVaJ8tKK2im/sug6gBY=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=sPonckK8+HkQlBgeLyifLuvPewbKLEkpDONYNNS/zpqdn19f5cQRQh5C6xKXSycajrL7vkS1us95I1JcXmptqMvEEpjJnIuYsvj40JlsY/f3d1xPz/9v6xeTL42CZQshuLK3ztI4nnB/EcIqN5fENtS4FZYwPWeqIS9vls2o3PpyoPvGFTFmdNlQPNq7WJkV0OcrbhcTkD1rcrbKw34YnTtCniLKnAEBAEc0zZS7DCdbMIWeAw/zryndHxXnvuaM0SSNxZwkdr0W5mwtg1O1qkD+2pVPtKhnieAuj53IEeyweD8M0x+OC87FE00q71n5j98n53VEG3yCR8lh03ozFA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1758562743; bh=xunUDxhixHF95y2MjnU7Y6c0CT0GefVYQfAI4Of/+XS=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=psKP/RQLbzppNoHzi8W/PJcDV7bRzUHMZ/kQCts1eA47HKXztxkvroKDgON+nZQHiqSZTQQEAxgxnruQczkLvRfagu/v4XylKLgflw7CWAqz0Tv6UgO6nIkZpdXLxsTU1ERX0D0wmcllHunYcc/PPctjuhjK73q4qHSBRrYyJkoqQDFCFmeN0aHvPsmiEuWpjfQU5RfNBLcc2SvZ4i5lvpaXyHSXdJSpvuStaEHKI7fPor9eUYHCvphLGAFwwj4UDltl86J+3iwwryfS4GsyXag3nds8GMi9gHi1rhhrXLCsjJZwNwakY491Nctj4IWaQwcLSxlmeOVYlGhrqGjxLg==
X-YMail-OSG: .nG7lXsVM1nUdpmsxeAf3qecBRY6dUpaBGyRAnZdpjHfXcYBB98rbeNNkgnTqA2
 CoiUiWRp6agl25dc9GrJ9E1m6cuOE87fLoGtshqVsVS46VkGnKhKoQo5v2A3TvDhm8x0GEfRKvyj
 cvZC_OT..2FXT7qoNuAx1lOO11hvxc_2zGRPCyWBSJTRvGvQnieuyMqM2dS1NAjhHuT4h.58a1MI
 5QExiYaOvCQj15bNW6O7rCdisp39bSY2NNJ2eBNO0UXKhUq4cQ5bIhqh9UFy1KghPL3BSLA9PgoC
 8HdH7afKhMl4QSZkEERdE2._9MnijwdWh6FgUA.oKqykgPNXBfURxtbx9YqojLw3rcUU.W4vitbn
 42cwv1KezARzsMxig_lNJuxC5xnB8SCa5CYfthzhrqeqWnrFdN_2tIoFSm7MuwHkyjSlsQtupNfS
 XU0OqP1gLPrRJ1ih4T1.M3j4gHaXrLDAPnjuC6eGRVSGMn4E6ZAQN6OXs6E9rAY2oyhOPZsgbuEx
 UHRwESLj_Vt6x_F.WNUM1hfufR4ddYAWPMPJoSGUTuNI.EDWrzOWT2za5VaQN94t66HeyGecNuac
 pdMVihRW_5yerSgRYfirPPkGO4qcUv6mz5KNv_CGhODjXeTuK.UYnqGVX9yW6aZ5YKwLpswfKQRC
 m_of1a2PK.mAEJIGwYvslYJFifix0oM19ll3R_b2sYmRA5kMKh7BoSIQz4ePPOlsSphdaGh0pQ0A
 IfsZPjjERTltGJLbLJw5W48FecA.QKt9vVmKuOTCr1wZGVupPuAPepcWcPRT0oXENMxYu4OjufIV
 UP_JIHhaf8kd_xECPn_32pLp399RxIKOsDo7V5QdlnXITId1msCy4hOhqRIUxOc1NhkdxYDmE85T
 TEJgfR9vCYx_rMyaccr.JNbfjZx80B5dizmeY.YhaaFjkfI54dwdsy2lJD1O.5O5bJ1kFyF_MLqr
 1OkPxhhxdNAou6kMYT2v2M0NTlWF.wF8klutxdhpMMtDMcdVnmzUZkaqFAltg8fRf8rsuU8oGxCd
 8yXbvrIbHwlcxgJLNmb5Is3rEwEXGuNbd4goGpkf74YQv.scVpGHSYHdpIaNLYpSubgCeE2gR0wY
 xDJuXlA4Bl_e5LDMlhAqMrvW6J5z6SIVjv6Ecb_g9LiOiKGN6tEzG1XP.NsoRx1HYSv_3Y6YdovV
 whLNHhuwqmk9cXa3O.aK1p4Pv0qOlqv8o_.eooNqlO7cqmOZT7gtjURnrbYGmCd2I7m90qPu7xPQ
 I1dJh_AAh5to8lPEB8cSD5legYj7dYuUFrSf1T3RlSal9nXTPyv.IqwFIbn8vul6dE_hAMq4H3Fi
 7H0zGtVLfTzyjBkbeACIp1NaBrbzTKafMZbbaOuI6BqAwjesdrU2dcCALcbv6RQyxnRMpX1OHmMO
 .OZR5udycewEHXnHd_wziKA8M0rQfcJhTSAgNGpLioi501tunDczt5EZoIf68YkCY4y0xKDhryIj
 m0JyuexMGLP_3ah9KFBMR.dtyqhMNyjUKgQhV_b0wBNmga_gr4RO4S3qf3o8mJ_yB8330ArVZ56N
 bJQeZ308Bf1AN0ueiIqO9yrfcO33LQuIukvKJxdNuSuDo6Lbh0n11c2QGG8rTyqxhVvhN.YNZ4N9
 EoOCcT1hhZOKRYDpDKJ7JxPikYRVyPhgnuY4fFepA83uhMJie7xouI.gx_SIBrPw_tRk3BT9GWP6
 CBLy5sNqPhFa3ttFwcioA8Gabq.IxyTo5_kfsrnUxVp2i1XzF_yjHlqjkpmZQ7c5fmkJ5PwSgP63
 1CoOPqXokBaroVCpnsE9IP56xPP7cy274TH1YSYbpI8GTYq5Vq14ZAS893d7XdPN_fpfYSuSwpBV
 oI9dh7T_hTVA7uiL0p96KQquUL5AEgxGlk8Npgpp3_BFRZSwZNuqh8NgzGOINX2X3FZJyV7adfar
 x5peWZLdjBfpq50nsdf5x5eOT6CFSPUssXExupdaOEq6i3xVnqCAndsvcZ91Oew_dVZBpiv4i.X8
 jlKJIfKCYVc94zam0q8hnn13LbSJ0gPJXaw3706ADZojzyRXT.HdLO0dEZk59dd4t5tIhNDqH_38
 88g1mJ5ic9hGElMEqSMAy.kIEZzGKt7i_kpb5PjGvei96TEM0clhy7Ma.SeHuGTXK35CMB6mUcVv
 GFdIH1nX1TTRD4LCdxnVHnN_E.pv11p8NlBwhxVVIuFyK_cfStR4pEHwwpC9sXQAP0hcQZMQABxz
 WTlHvTdAOVfUtKuS978mddMKfohoFtPab7itW9YFxt0oo6RoFjDq2IXox7SVcQiPMftB1C2zGzw-
 -
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 9889f305-044a-4afa-b991-986de320d98f
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Mon, 22 Sep 2025 17:39:03 +0000
Received: by hermes--production-ir2-74585cff4f-rnp2l (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID cba2189803ffa623b252fa2c4c38f413; 
 Mon, 22 Sep 2025 17:38:56 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, lkp@intel.com,
 oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: fix accidentally deleted IS_ERR() check
Date: Mon, 22 Sep 2025 18:32:20 +0100
Message-ID: <20250922173836.5608-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250922173836.5608-1-rubenru09.ref@aol.com>
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

During conversion of WARN_ON_ONCE to drm_WARN_ON_ONCE in commit
2d2f1dc74cfb ("drm: gud: replace WARN_ON/WARN_ON_ONCE with drm
versions"), the IS_ERR check was accidentally removed, breaking the
gud_connector_add_properties() function, as any valid pointer in
state_val would produce an error.

The warning was reported by kernel test robot, and is fixed in this patch.

Fixes: 2d2f1dc74cfb ("drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202509212215.c8v3RKmL-lkp@intel.com/
Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 drivers/gpu/drm/gud/gud_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 62e349b06dbe..1726a3fadff8 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -593,7 +593,7 @@ int gud_connector_fill_properties(struct drm_connector_state *connector_state,
 			unsigned int *state_val;
 
 			state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
-			if (drm_WARN_ON_ONCE(connector_state->connector->dev, state_val))
+			if (drm_WARN_ON_ONCE(connector_state->connector->dev, IS_ERR(state_val)))
 				return PTR_ERR(state_val);
 
 			val = *state_val;
-- 
2.49.1

