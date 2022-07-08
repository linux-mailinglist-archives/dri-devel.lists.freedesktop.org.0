Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599656B6C3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AE11138D4;
	Fri,  8 Jul 2022 10:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D181138D4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8CEAB32009EA;
 Fri,  8 Jul 2022 06:00:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 06:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274426; x=1657360826; bh=yk
 Jw2SEo4XpqErhqLa15PfxvMmjlMgg0/ajy7y8+cdI=; b=fj8+u8s3a2arZG0Rrk
 lThifzTcpYrIJLEA5CHuFFQkFCq/QMhfsPB45PzglsO/aWj4Q0COTFLCbMidjMeB
 J+trMkYuWCS1cHc642PgRe/c7RiktIDzYpqq6YelYYgyXJvIAyGcY2189FobZViG
 YrpkhNAmAyOWUDLrs043ftRC+INIKWY+aQFIEYFMCu9Pcav9zgzVAdWDpRB8mOnB
 KLCysFF3prDpdw1omYa8D4f0SRas/iDqs7It2Sdq89JICRS6RHbjnh55kZLSsmG9
 nyPfvUgksTi1WyLX8YDkbW77CigNDqweZJClNMBfV15/n1nGM+WoU2A4PuDopv3V
 SfvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274426; x=1657360826; bh=ykJw2SEo4XpqE
 rhqLa15PfxvMmjlMgg0/ajy7y8+cdI=; b=Quz8AvNGCzBKWF3auIc6yxFABPEIt
 YAul/MiE4SFJNxBeyWW6tyl+NTOcrn2rgTmT4C8IUiHz3Z0fPkyxD7nqNk5H5zTb
 ScyB1SxcNqNfM0atNhy690kjnVR2qGao5baYS7FvRnE7HSpfVVbNno+y5H0D1AHC
 Qqyy+9NBPyVwgRm7W1TglVRbAjA98jZqwslCXLBuHjz5Zk+gZQ4pzdVxVK3Yyb8Z
 hF8DyA69v5guHJuSGFlKS5qLMPsrucBMxsBSNmwg+QgQjt90hPl2z3A8u4aPAkHz
 9CQJ3VD6i3HnC0hCrkKb6vTZAEaxQmbZl5iVp0euPQIpXIqWjk7VtXg8Q==
X-ME-Sender: <xms:OQDIYuJHs7qIS1dr6dsdaB4GzpNVrAygfAFeFBpzYtFSgm7xN7iZ0g>
 <xme:OQDIYmLDOBlfIWxFV_oX6gADJoJvef5wDid8wUW2ITn1UA6gSPh1jlsluGGzs2BUI
 j9lfEZbYequqsVnNY0>
X-ME-Received: <xmr:OQDIYuuUbc4yeOBG81wRasX13Eo--kUqEzvor52tdoUl-aNnojPeJoqhEnPaiU664fyIdfBpOQSqimbCBpEIKt9-c6tw_HJL_dl4sn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OQDIYjb2-q-kRO5AngAfADOJ94C_lNJjaR7YPvWFNOk6SinasxEsuA>
 <xmx:OQDIYlYdG3FLhmjddbylCcXZnq5dB4GAd89wBLptBysXqmamlWHK1g>
 <xmx:OQDIYvBdFaVhFMwcY0ETOakzOSSMvlV4d8PtqZHDKOIetCrhSc5lAg>
 <xmx:OgDIYkXgYl_1jRsEse7Rt4zP9AxVk0xUWPlVVDi0dfJD5ao1_Jb_IQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 66/69] drm/vc4: perfmon: Add missing mutex_destroy
Date: Fri,  8 Jul 2022 11:57:04 +0200
Message-Id: <20220708095707.257937-67-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_perfmon_open_file() will instantiate a mutex for that file instance,
but we never call mutex_destroy () in vc4_perfmon_close_file().

Let's add that missing call.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index 79a74184d732..c4ac2c946238 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -133,6 +133,7 @@ void vc4_perfmon_close_file(struct vc4_file *vc4file)
 	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del, NULL);
 	idr_destroy(&vc4file->perfmon.idr);
 	mutex_unlock(&vc4file->perfmon.lock);
+	mutex_destroy(&vc4file->perfmon.lock);
 }
 
 int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
-- 
2.36.1

