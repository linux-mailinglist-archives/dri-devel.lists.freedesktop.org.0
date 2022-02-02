Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D974A6E00
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1310EA29;
	Wed,  2 Feb 2022 09:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BD210EA29
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:43:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E28123200911;
 Wed,  2 Feb 2022 04:43:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 02 Feb 2022 04:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=XVdHvaCwL26wYdjQjd8muXZ/T56qJ6vLR6jhlah6Sq4=; b=ouPyT
 GyRblr76px6+C+U40Nnn0AmxH8i+1OECY/dXVhjiEry+LeXBb3BMDfR2Fn3jb7lD
 IJslG/UsmYqfnSZAOzSykQ6DNxQmgI29FTBE/BxN1mkiwoxbqVCtn8bxbPTW50Zl
 79uTsr9AmvRM1L+dtKOqGf9naOJdGUe1YocFnjxB3Cn/xTgffRafC5xmXBqDhqq0
 0vhdVsJmIoXlRwOfrTG1w+mLM25qTi9AqTQlukhWrwIYsAWFLog1Cpd9+PsDmpPz
 ci5N/Dcrx7vCeMc6/do4nH6Arib4duZXsE37C5Y6eN7eNzq7Ie+6DzM+V5CcW9RI
 qvCkxLIcv2kL1Pu/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=XVdHvaCwL26wYdjQjd8muXZ/T56qJ
 6vLR6jhlah6Sq4=; b=eF5Et407+qmB6vKz2g3VbdoSpu3tx/pBA5++1fS2qd4jV
 ZatlfHIgBG9NvrXpuN85Uin3Sb3uvwLl/751HyuhZfRlki3M+UvAlG56R/wz0S9F
 aIsPYpHeI6Vlw7giDQHzPdzzXngsBr+tdxIxTxg1PRz3CRlFjJo615UeZcYU48jm
 eAyFWuBwWYTqbGEFIMCxCFSdLNhkN33Aj07iZu8cSHGO7peZSSkopyMZ381xR9Ls
 HW570gKgne2VeY/9PR9RVfhNcCsGC+WKSy/wf2hXhgFDWAveiUzqT/i5jxaUnKF9
 H0KqwLFVOISqebMI/GhyBmEOlkYR4gMk0LyX3WOng==
X-ME-Sender: <xms:UFL6YdhRwIXEVK4osiTsk3spP_4Ju5HwHNcVG1cMBjwHKA_pTu6CKg>
 <xme:UFL6YSAFgcfV1_MUiA4UF0TLFhTxrcE0MdoEZwghg2O00dzVijNVjHzRPKYNLnudk
 KxN4KC-YEM820er05A>
X-ME-Received: <xmr:UFL6YdFGak3K95B1QR5J0nH-wkvL18HCcvFh0smt5ZR5bgFecnOWXFXu0BZ1ZM1qJC2gF-9ris8AplRFw1UgZ6GrsIirNnAzLA-OSK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UFL6YSRZbz3PR-KtEjf4pvJv3Ss9E8zkalBXiyIawtkSzW0J3ZAa4A>
 <xmx:UFL6YawQ89OruHOA7RjGvtLkiQUp4pJ2kJE2cZM3e7AmMziIJuQEdw>
 <xmx:UFL6YY4976ZQxYNnd3U49Uh21LuTG48GtkwWCmAT6QKlT5EMhh_qKQ>
 <xmx:UFL6YRrBNJSXdqnxrbCk5e9vK5CvK9WIPNR3HVVnwQT37JpSLG9xJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 04:43:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/connector: Fix typo in documentation
Date: Wed,  2 Feb 2022 10:43:40 +0100
Message-Id: <20220202094340.875190-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 4adc33f36d80 ("drm/edid: Split deep color modes between RGB and
YUV444") introduced two new variables in struct drm_display_info and
their documentation, but the documentation part had a typo resulting in
a doc build warning.

Fixes: 4adc33f36d80 ("drm/edid: Split deep color modes between RGB and YUV444")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/drm/drm_connector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 64cf5f88c05b..5e36eb3df66f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -592,13 +592,13 @@ struct drm_display_info {
 	bool rgb_quant_range_selectable;
 
 	/**
-	 * @edid_hdmi_dc_rgb444_modes: Mask of supported hdmi deep color modes
+	 * @edid_hdmi_rgb444_dc_modes: Mask of supported hdmi deep color modes
 	 * in RGB 4:4:4. Even more stuff redundant with @bus_formats.
 	 */
 	u8 edid_hdmi_rgb444_dc_modes;
 
 	/**
-	 * @edid_hdmi_dc_ycbcr444_modes: Mask of supported hdmi deep color
+	 * @edid_hdmi_ycbcr444_dc_modes: Mask of supported hdmi deep color
 	 * modes in YCbCr 4:4:4. Even more stuff redundant with @bus_formats.
 	 */
 	u8 edid_hdmi_ycbcr444_dc_modes;
-- 
2.34.1

