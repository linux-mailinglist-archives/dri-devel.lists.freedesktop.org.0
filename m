Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4D2FE579
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0628C6E8D9;
	Thu, 21 Jan 2021 08:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C1D6E450
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 20:57:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A50A5C0150;
 Wed, 20 Jan 2021 15:57:29 -0500 (EST)
Received: from imap36 ([10.202.2.86])
 by compute2.internal (MEProxy); Wed, 20 Jan 2021 15:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=expunge.us; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm2; bh=wiOxzmUwqEUdeCFgk0Dh39Mablud1PlGadAq0uz4k/k=; b=fZjzx5za
 SgiAk6acb0JK6+H0gdojP38JIbTOTDSFDpqZyp6p4tXl1UyG4uYNJeGoS+4MUSEy
 fHGnJ1hIhRRqW+j4OcU5Rt54CF8z/4wZzzI6FLY3/7Er3IwAmoPE0Tv8YdiUcAV9
 obG5UbxN+ZYAdXseJM69Bnk6oW47BGI6WxO6yToJv0LA/REkfwjAo4e1e6EyB+Ar
 TRX9nn0aOyr8DTt7GeqxyVxWImjaEmMIFnyOhDwkncijpCQVsqogJ9iYTK8PFF1c
 ZvA5sicxGNtOsI83J2idxc4adEGruNS1R7uUa3kslrqe4WgrB+sVhSStoogMPAK5
 CGeApVZ0Prx46g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=wiOxzmUwqEUdeCFgk0Dh39Mablud1
 PlGadAq0uz4k/k=; b=dOCnEIIcz8Tfkz7USRZsYihx4x2TjVuXHMfWtF4aMKFVU
 13xHY/qBqKNGT3hKFHT6/wyF/zg3hNP4ptQOhlwJjzqx5FYBcwwfqH0TaHzFqBD0
 TH11xa2MFHbABXk+g1EVuysjfFm+wWYGE869dTVfVDX0WeDebSwCyaWZhmKqE00O
 A4Hv3Y8N0vh8DtprYX0Sn4NH7dus2IDmNnHI5QOsbE0FGGq1Uk8MGINeAdock2fu
 SnQLnSRyWIY1wJlZUpoQvv48qL5/Pr6RrUFXQUQzDM0iQfdKKA24sSYJK/VZD1xx
 ulmvL65HnGJt1QAQTMp8d+Vf0ifR39Hql+fPC7JrA==
X-ME-Sender: <xms:OJkIYH9LJN1sTQKfPZBshsjWdO4uq-bdw4g8N_VNPpTaZx52HUbF2A>
 <xme:OJkIYDtbUsfadxjSElN2N9rDN5gryDyzjlGhvwAhlTS5Xf2aMQQaslFW00As9TL2v
 4YxA_h4A7gu5kP6ISk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgddugeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkfffhvffutgesthdtredtreertdenucfhrhhomhepfdflrghrvggu
 uceurghlughrihgughgvfdcuoehjrhgssegvgihpuhhnghgvrdhusheqnecuggftrfgrth
 htvghrnheptdekudehgedvvdeiieevhfegteegieegfffgfeeujefgudefhedvfefhudek
 leegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjh
 hrsgesvgigphhunhhgvgdruhhs
X-ME-Proxy: <xmx:OJkIYFAyzBe_NNjy6mA4nFRb0t9lATAKTeeQE6VDWe9JBK8KEeLT1A>
 <xmx:OJkIYDe4yJ0tPmi2etRc6yy5RBMbBGxVGv_v5_VredVEbOTkEmmENg>
 <xmx:OJkIYMOd70TboBH0CHwrT8LV1kmvxJldi6U35T2hXfQIen55qx9mbQ>
 <xmx:OZkIYL1jt5Z-NB54jPtUC2UdVIEzPZxdPJTDpsytmg9dxOi-GGMZvw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 380C4188009D; Wed, 20 Jan 2021 15:57:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e8-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <41288ccb-1012-486b-81c1-a24c31850c91@www.fastmail.com>
Date: Wed, 20 Jan 2021 12:56:26 -0800
From: "Jared Baldridge" <jrb@expunge.us>
To: linux-kernel@vger.kernel.org, "Hans de Goede" <hdegoede@redhat.com>
Subject: [PATCH] drm: Added orientation quirk for OneGX1 Pro
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OneGX1 Pro has a fairly unique combination of generic strings,
but we additionally match on the BIOS date just to be safe.

Signed-off-by: Jared Baldridge <jrb@expunge.us>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 58f5dc2f6dd5..f6bdec7fa925 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -84,6 +84,13 @@ static const struct drm_dmi_panel_orientation_data itworks_tw891 = {
        .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data onegx1_pro = {
+       .width = 1200,
+       .height = 1920,
+       .bios_dates = (const char * const []){ "12/17/2020", NULL },
+       .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
        .width = 720,
        .height = 1280,
@@ -211,6 +218,13 @@ static const struct dmi_system_id orientation_data[] = {
                  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
                },
                .driver_data = (void *)&lcd1200x1920_rightside_up,
+       }, {    /* OneGX1 Pro */
+               .matches = {
+                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SYSTEM_MANUFACTURER"),
+                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SYSTEM_PRODUCT_NAME"),
+                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
+               },
+               .driver_data = (void *)&onegx1_pro,
        }, {    /* VIOS LTH17 */
                .matches = {
                  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.29.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
