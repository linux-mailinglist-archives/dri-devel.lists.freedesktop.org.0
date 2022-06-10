Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7D546269
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61C612B5E6;
	Fri, 10 Jun 2022 09:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564DA12B227
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AD69C5C0061;
 Fri, 10 Jun 2022 05:31:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853474; x=1654939874; bh=fB
 1vCTEe4pNuAubp5/iqGuc2S2GY0D48ZvzVNFH8eY0=; b=oG2RqC5xX51QpqKJb1
 TVb8f9/EVYHEfvG9I0bf//Px6MrK+56VcCQnpQTklCIPyoyT3NTZ5zftpxYyslC0
 5Q1AU/KuB43ItdcSnDjqrUGv8pw9pr/PuEykxpnV96BPDIOg8UGlIApARknH9pl0
 g1x0AT34wHKdlUhctD80njUL/0pxfEp4cMOgJGZrMIj07eJ1VyssO98pJmzISgFv
 S26QhqBk4UxAc3qc5muFOR0tN9rj4fI9I8mm6bsGRueOTTcFWC2KPMf12pBm7Utg
 TohNTuOYZVxL7AVtEWG1cFFhPi7sKR8s0Fzof6VbWsPK2dybdBVpI25vewTcO92S
 uCVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853474; x=1654939874; bh=fB1vCTEe4pNuA
 ubp5/iqGuc2S2GY0D48ZvzVNFH8eY0=; b=QsdkWmp+Ef6iPGHGIV3d1mBsrPpLs
 SyTH34yP5SmPkzWd3+6j7Qnynna6fZb+Rr+OqKGNZUn/XnUtExlllb3Ctnie8HgX
 aiLSjZSwbWq/Y0bNZJI5yiTKcSF6bvSihHqWOy9SCt2DDHJkOyocC0pB4w59rNGo
 w7UTfuf91G4ZL7SenU+offk+4cya+jeWZ85hikCzfNxJyFjsC4ZGffTt5JE4FfZ4
 Hjy0c3s3My0gLZyT/uZtpsJlT32OptXbskFuZPNthdDxgqWJMTk3JLFPZZrg9wJB
 T/W5A+1Dy3tQoq9jbfMJZUoiz1PRSdd3RRmcSs6m0TEgDuSzPSZT4a4/w==
X-ME-Sender: <xms:Yg-jYnzjp05nyhqWsFzBDwtkrd4gNKvDef7x9pu2mQU7fNg0o6HAdw>
 <xme:Yg-jYvRfI9oEH5CWArHlDNWLUTh_9RCYNkJ_Tr1sPoh4oEbeybspYh_EmowdvlzaL
 _xXQKZztr6ieMOFClY>
X-ME-Received: <xmr:Yg-jYhVrla01K1f8_LQ1q4syBeaZeSdESewh0hCqo-1QYz6g_sFyt_1wZMDllKNwGs8JOj_ih47sd1m9oS4yPynRZklY8oWpAj59ZUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvtdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Yg-jYhjiEll77I1egq9_VyZW-1GWWyPCFaAkogrDUivdcfmLYaIo2A>
 <xmx:Yg-jYpCYj16C0Sya6BBoO2X1Azp-Ubve7_OUTanhwsuxNLN4xLoBuA>
 <xmx:Yg-jYqLx20tarjV37K-_3k_iVJJ1iYSTrkdAUzodXwPnaZnEv5llYw>
 <xmx:Yg-jYk_-NH16l08UDfaFUpZEf2B8CLcwXIs8mPscctJ4djLAaDepCw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 61/64] drm/vc4: perfmon: Add missing mutex_destroy
Date: Fri, 10 Jun 2022 11:29:21 +0200
Message-Id: <20220610092924.754942-62-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index 18abc06335c1..531b0e7ba035 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -95,6 +95,7 @@ void vc4_perfmon_close_file(struct vc4_file *vc4file)
 	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del, NULL);
 	idr_destroy(&vc4file->perfmon.idr);
 	mutex_unlock(&vc4file->perfmon.lock);
+	mutex_destroy(&vc4file->perfmon.lock);
 }
 
 int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
-- 
2.36.1

