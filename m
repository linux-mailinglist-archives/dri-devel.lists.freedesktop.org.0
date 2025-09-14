Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89DAB56744
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 09:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044B110E081;
	Sun, 14 Sep 2025 07:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="Up1nD9Ai";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="nEJc20XW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Sun, 14 Sep 2025 07:46:09 UTC
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F4A10E054
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 07:46:09 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 6A4861D00061;
 Sun, 14 Sep 2025 03:38:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sun, 14 Sep 2025 03:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm1; t=1757835533; x=1757921933; bh=pE+XOXk7N+a4D+lu9qx7F
 n9DI70/ulxFLNqin2buoME=; b=Up1nD9AiDPfPKDBqzFGM7gBWk0aO+3FduGdTZ
 c2bu/mYjRMfdEo1xpNIyHyWWoMmb4faQXlezDXAB3PnkjRY5uq6bwBI0fH7bCvAv
 /oHRC8sx+Kin7tRU7z/aFEMU2qi4P1+20ZvP2f1Xf9bijWe1df2fvyoYSBMitlT3
 xZvPKjjqH1iSG4/5zqnsom/uX2T2ipz4e3sxJJlGIKgUhyHpS9RvfigmMb5mD+rA
 z36y1jtwxbbKzVPq9wLuy7z56rUEUDQkja24PiHnlWVpYTeFK2y3FRw6L6qnCmXL
 ufbLJWqgxWqsnFOnJRsFeZHcx/eliHbRwEktMXlrfl6AOrbGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1757835533; x=1757921933; bh=pE+XOXk7N+a4D+lu9qx7Fn9DI70/ulxFLNq
 in2buoME=; b=nEJc20XW1W/0Sr3RSzPKo+h+9V4LLykcHO3q8SNl3XqHGeGA0du
 GWGzphVY+jhaTUezL61+1yriqY0YU4UC8V2JuDVwS19ApB3Taup+qnDvX44nvevH
 QjQUcuBbsFRppLgrvBlpCK/yGjYjD3FeMZ+bxai0HRnD3F3csxmhPFK/JCrEtD8s
 Xae4KbAyJj9FXjdfaaEqm0QY+qGF2RIBLwBluiCI16GywJr2BUl9j9B9n6vWs186
 +AijweJTGTDyeM0e8Rkywn/rhidiztynHQ/n1NRM1mRaJW8nmDf7X8zJ6M5MeV19
 HkZfDsZSewqrcQDRimOm2OCHuy3gdz1DFPg==
X-ME-Sender: <xms:DHHGaANkm1nkLzx19Nh4th4t1Co9ytJjQ7U-Go1hcBK9nU_Pkx6Lvw>
 <xme:DHHGaLWAGVia_YsHSauXfNz2IpNN4vN9Gs8OlSR8S2Fx5POY1BKrSMrVSt-T7JU2W
 ejxoASBKsK9v-C8bH8>
X-ME-Received: <xmr:DHHGaFKoCDzKZS6C3OgxTc5_qqAReMzOo3oE7u74FyPDTPmaS_TjAZN6eFw04uWrLdzQuc5L96_onrDisQtf7oudO8O16Sw3RChQZOc6YyIWwM_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefgedvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomheplfgrmhgvshcuhfhlohifvghrshcuoegsohhlugdriihonhgvvdefjeef
 sehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfevgfekiedutdduhf
 eggfeivdeuhfehtdffjedttdefkeeifeeijeevtefhgeehnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsgholhgurdiiohhnvgdvfeejfeesfh
 grshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphho
 uhhtpdhrtghpthhtohepjhgrvhhivghrmhesrhgvughhrghtrdgtohhmpdhrtghpthhtoh
 epmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdp
 rhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtii
 himhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhm
 rghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpth
 htohepshhkhhgrnheslhhinhhugihfohhunhgurghtihhonhdrtghomhdprhgtphhtthho
 pegsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomhdprhgtphhtthhope
 gurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:DHHGaGrtC-U0Y3pG4tNAyf_u7ZhB-cJ3vvn5r3FACq9wd_oRL4R1OA>
 <xmx:DHHGaMwjGDLyXs_9tNnfkMtICJoklACr1ARrYIJ8RBuwR-W5YaBM9w>
 <xmx:DHHGaKuTGbb1E-tA3kkkHcJqUanoIiBXetpJaQbh-U7YvNgTxPt9Ng>
 <xmx:DHHGaF0AnkFkH1qvU1YgA0MzrUHlI3efvaP0sO8bpYI-QwHpHHO62A>
 <xmx:DXHGaFUr8QUpoAW9rGGs4er_DV6tdbrT4buZGMus2YfltxKKNyETshq4>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 03:38:50 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.com
Cc: James Flowers <bold.zone2373@fastmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/ssd130x: Use kmalloc_array() instead of kmalloc()
Date: Sun, 14 Sep 2025 00:38:22 -0700
Message-ID: <20250914073841.69582-1-bold.zone2373@fastmail.com>
X-Mailer: git-send-email 2.51.0
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

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.
kmalloc_array avoids this issue.

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
Note: this has only been compile tested.

 drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index eec43d1a5595..8368f0ffbe1e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(columns, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
-- 
2.51.0

