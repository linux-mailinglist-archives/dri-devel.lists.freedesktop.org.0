Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E849AFD7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0232A10E7E1;
	Tue, 25 Jan 2022 09:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FE110E7E1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:32:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B48A5C00F2;
 Tue, 25 Jan 2022 04:32:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 25 Jan 2022 04:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=a/uVFTPv5bh8QJAVufBWyK+KuL/PbIsfTTtRg7
 n39N4=; b=TRe/TdJGJ/CugsZgLJpiYTpbXFKRyK0vn3cUd68jE/wwjVmFVnTzIH
 jzJjlhzAdcMxNW0txtKvFyOLKKUGwrnTj48OLTgm0ceueNjsViHYripHhuWQPC1l
 4CopUTDaNRcTDL+iZ2+6CkapRFhWiMskkMgXVAx4RqeEjnjwzMgNBAO04qwOaN+n
 7KqB/XdFthlbmoDDzrEaRfkm+Mr0u7mA96tH/Blm8uqv3Q/HcwX6sJpakz8NbpYh
 D96oh6IQzPZ8PWeqZtUlUBc7l+GwLz/Vlttur8Fi6cQmmdxoZDOHOAeuvPUlz6Kz
 9DwbytFeYZ9/2360Pk7Hjdg2VoFUpwmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=a/uVFT
 Pv5bh8QJAVufBWyK+KuL/PbIsfTTtRg7n39N4=; b=QAT+F9pVVmtBUM91TU3YM6
 79kUjQZ4ajELMGUq/bfvnVZADpiQyjahqfJDn2xsaoJD7kWKuplotXcVoFObIXVT
 uZDeqwHgU3soNnfLTKCSBjVdj8sUkkWra6HqIR8IdKrqMpG69z7j47MIXt5GzQan
 r3+nO2/OL0ftyrGMEnNZ12WMNLCWXpMoZ7dpz//AZXqGgMr9fMsSBR0jecljGboK
 oT636+nC3/0mviLotM9tUzudkGsiRYvCBqBG+Sym8Si8aJGHwPgpeLyReeHO9ZAv
 pKJvYgSINadsCx00YS9njFPcPyu1dfhEWSdlIvXxZJWSQKd4cysyAYSEEnFtmMBQ
 ==
X-ME-Sender: <xms:xsPvYZpMPpxYGj9qT0ka6TxeKlPOd09pOrKvY0_6-a1YnHD1nJneoA>
 <xme:xsPvYboVR_EDwGdOmPZ1ppYlE4ci9vqguFizwv4NIdyEF7bykRDnrG_3qPZuhQapR
 DQXFu0duNhPtSRB72w>
X-ME-Received: <xmr:xsPvYWO0oeOUlpq9-GtKtNTsIhRhlGTkNxcU6XxBqVd2xykDnJ0yuJFBAqMkfW8jMn7bMnOpMsLUbxZtvQeJUZ9bUmkhBp6c_nWCACI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephedvgfeujefgfefhleefjedtteduvdfftdetgffgfedtgfffkeelfeejvdegiefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xsPvYU4sEp6f4T_yTciY6xfqOzEXNSm9mfZU3aWOZIWgCYB-0fH9MQ>
 <xmx:xsPvYY61tlnn92FwvN2VQ1qMBOkgQPY6UAZSy09fYWQHNv3KGk-WgA>
 <xmx:xsPvYch9t11A9ahMPjpbrSbNNmt15GN9l8WtMQ9eU_GKLWASJKnGRA>
 <xmx:x8PvYSRMIcC-PqTSaALqngbd2xJqEE68Nc7SsEdeC1G_lwp2-RYgNg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:32:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/edid: Clear EDID Deep Color Modes in
 drm_reset_display_info()
Date: Tue, 25 Jan 2022 10:32:51 +0100
Message-Id: <20220125093251.594772-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though we have the other drm_display_info fields reset, the DC
modes are missing.

This shouldn't be an issue since it's explicitely reset every time a new
EDID is parsed.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5251925e3b92..a76224653e6f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5340,6 +5340,9 @@ drm_reset_display_info(struct drm_connector *connector)
 	info->rgb_quant_range_selectable = false;
 	memset(&info->hdmi, 0, sizeof(info->hdmi));
 
+	info->edid_hdmi_rgb444_dc_modes = 0;
+	info->edid_hdmi_ycbcr444_dc_modes = 0;
+
 	info->non_desktop = 0;
 	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
 
-- 
2.34.1

