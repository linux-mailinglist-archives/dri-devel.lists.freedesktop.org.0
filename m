Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C65E917F78
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE7C10E847;
	Wed, 26 Jun 2024 11:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="GCrS5zcG";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lp/amTog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365D210E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:20:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 816C7138064C;
 Wed, 26 Jun 2024 07:20:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Jun 2024 07:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1719400825; x=
 1719487225; bh=fLdvwwcsYb9JRo3Q4xJ9d/5JJI6LAb+qSfIJ5GbyH9Y=; b=G
 CrS5zcGRCpASvIpEnepR0tjpkxqEK75Ozye7AsAOwRRLnhmvxLtw1dI0gXn5NS8e
 DkGeFkDnaLbXdcISlLsNrRNWGi0OprnPQyEYC5PjpDSNNbrNNeLSNUrHpZ4O+Yfl
 tEuXCeG+0iNOugE+rNcz/iZbqq7bxX70pu4R3sD+4/CDDP7Z1CI5MTTjDbroxpDI
 h4yDf5edZKJLU1AFMERQkh61hCT1M+7MuGsgl30iJyyKcvE6JAvnuypljkwWHV96
 bSVZS2kcaOL9N2PVmHq29jF1jfI3UTM8fAKbsWc8Spg+2GuMZK0xe93nvuuffLQt
 lNGGxbF9kbQrODWEXBoaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719400825; x=
 1719487225; bh=fLdvwwcsYb9JRo3Q4xJ9d/5JJI6LAb+qSfIJ5GbyH9Y=; b=L
 p/amTogvbHZ04JwwMLo9OSDjM5/23YDwYDHi+9LWjkGKxr9yHXOcQzuwUAR3n850
 WlinSmcQOF4SFvundxTPrn+oubiZ5alnuSzJ1LUfLAMu8qPTbzWCtZdIVvG7qFEz
 KAJWplZVkUt9w9ycO6IaxnX0ClY6aycsNMqkWBxHkwo5kMnfA4unCDUMDVOO4jEg
 6b+ETGDlUN7bwocXv/aNQf9i+bVWCT4w7pwRmGw46o6BAfUNHkIzODkVOkiRqc0k
 0l4XsRaW89hAAUr4EPX3gvDSDBMmUmR2Qw7dTh58Hc5GBd0RPe3xbWLFE9bu49ru
 yB/gzWxPxcaNLpTbjKW4A==
X-ME-Sender: <xms:efl7Zj-BxGDRWonQjo-9gO2wXl5HmtNXMI4TSfbvlnwlkiGTSO2XJQ>
 <xme:efl7Zvu908_-LTZeTiMoHF3WDD20a__KtQt_TlJerCpc_lA80EUUODCfB58ydXaGd
 i9zyqFofUHe5AIvqQ>
X-ME-Received: <xmr:efl7ZhC-m37tPFsu3NKUebA6fBQtJub78OUxlx597rj9fBAEwp0f_LzidLZBw8kaG10z3dPpjwog5Nrx1KC6ISb79ncCVyDrudG8o1LyGEpB1mIk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddvgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:efl7Zve4tTCKWJZXj6-eV97Gz4NFTIv3a0u9o0nmi_6zYixahgKO5A>
 <xmx:efl7ZoNvhfPEF7UOOupfUXKG2Bugpb8kbgovhId_hD6wU0mTXbBe3g>
 <xmx:efl7ZhnJqnmMmAv_XM3xs2BfBRnsUQBue2CYUVhh1ZRJMPmaVMCrOg>
 <xmx:efl7ZiunDcKWTzIoQ24xbW7vb_Aq2iPDt4ctCcFcYYhSKGPaoTEACA>
 <xmx:efl7ZtdvsrzO0UHe86y6SmVcBBW04dXE4YLXO9_Pj7kWiBmZOPe9MoW1>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jun 2024 07:20:20 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 2/3] drm: panel: nv3052c: Correct WL-355608-A8 panel compatible
Date: Wed, 26 Jun 2024 23:17:49 +1200
Message-ID: <20240626112005.248576-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626112005.248576-1-ryan@testtoast.com>
References: <20240626112005.248576-1-ryan@testtoast.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the previous dt-binding commit, update the WL-355608-A8 panel
compatible to reflect the the integrating device vendor and name.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index ee0ce271205e3..cee40269d9bb8 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -925,7 +925,7 @@ MODULE_DEVICE_TABLE(spi, nv3052c_ids);
 static const struct of_device_id nv3052c_of_match[] = {
 	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
 	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
-	{ .compatible = "wl-355608-a8", .data = &wl_355608_a8_panel_info },
+	{ .compatible = "anbernic,rg35xx-panel", .data = &wl_355608_a8_panel_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, nv3052c_of_match);
-- 
2.45.2

