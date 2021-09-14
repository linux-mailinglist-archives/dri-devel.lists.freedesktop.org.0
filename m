Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5240AB82
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 12:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5546F6E459;
	Tue, 14 Sep 2021 10:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0096E459
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 10:17:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 801A62B01316;
 Tue, 14 Sep 2021 06:17:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 06:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=bnGYLXrV9YaQNC5g2IoDOcF7sb
 E6WkaRQc/kOvZhUkE=; b=r5J+VZWsXznrOjS+R81gxPTyUwHJ3AuGkk2pv9PiUE
 KqiEC1esneCcXHXDggSx9ndncpiQniBkdwdlJxkg1c9YreovJhym5VGCs+6WTadb
 zTBwsS1dIlf7QyeHQXVhncY+6xuGDalobibZtXhOn6YEGqQaUCCTauXZNoy+GynK
 zoEVW3eoaAq1iPpQFLBRwDX/Uz8b4hywnqeqKHe+neOSi+6zm/6TqcNX3TCSpXWQ
 FVx8VqOVaW56FsaYIK3s3CF41mEakMupnLr96Zcl9ZOzqZaVPGrtOdoI5EGQGQ2h
 ueVNOhje334q4HQTT05pwPx22KCeIGZrhoq4fMH6XirQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bnGYLXrV9YaQNC5g2
 IoDOcF7sbE6WkaRQc/kOvZhUkE=; b=tM73tuCNXsPI6gSn5vCyMHnak2lNBmzUa
 ATJP6qt8ekyMYCbVzKBTOay6Yx7B1Yw2DY0BBhEUOF3o35TV+xBEhPmtndgcp4gy
 SkblU37N5sphYriuDOB3mP6JStfYRvhXTLJ2LbV6kNGwLZax/6FTpNWTcpVowfyu
 vBneXQ8gZLxqAA2QUWfLjaoQ3DONYUKfPvqVGxKu7UwuHnJ7tD3TWfeV8bHtjnqI
 E6OyzWyuwgu0BrM9XDq82ETX14qJ4S+i9g1a/l1NjZ1ZwBwKGHazL+9DLoQgjUfd
 kwCIPkhsEABdsoncv97ocLOhVbF5/6WHFB9d3JO3KJs44akz0jpow==
X-ME-Sender: <xms:tXZAYYa0T-NKzs3uz38qN_zizEvD7cAFgdMKJuCay_oHxnUOvlGS2A>
 <xme:tXZAYTZdnkxCpv0vja7CMzD3kdiTT0Z-VmjXhdDaQUB2LRv3LmpZFFHKlnW8O4BqD
 r-swmjy9c4xXz4EogA>
X-ME-Received: <xmr:tXZAYS-MVKCas7JIgU5gimiY6WCJyXtwDPObNw6my-Ct639YMIx6Ij-LemGDZEGjq-qmq7A-X2cHdIMiwH_Ef8bcsxGksWO8CraW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tXZAYSpWKXz2e2d9Zz9uERMoVKXboqVYN3C5pXDexXmpP3zC2iSw_g>
 <xmx:tXZAYTow_xcRcQSCZ4ltfFwhKE7U-E-T76ZMOAPQafiHEWZfvUBvnQ>
 <xmx:tXZAYQRBWr9BSfDsYAYMvVYJydTAH2evBXdoswfIJIVr3wGA0sQKVQ>
 <xmx:uHZAYeAwr70Hpc14nqVP8EfGRq2VqGzpGvKllEdqYXF5XLcfd0D_-Xji5kA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 06:17:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/probe-helper: Document drm_helper_hpd_irq_event()
 return value
Date: Tue, 14 Sep 2021 12:17:22 +0200
Message-Id: <20210914101724.266570-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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

The documentation of the drm_helper_hpd_irq_event() function didn't
document the value that function was returning. Add that part as well.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v2:
  - new patch
---
 drivers/gpu/drm/drm_probe_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 5606bca3caa8..5b77fb5c1a32 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -817,6 +817,9 @@ EXPORT_SYMBOL(drm_kms_helper_poll_fini);
  *
  * Note that a connector can be both polled and probed from the hotplug handler,
  * in case the hotplug interrupt is known to be unreliable.
+ *
+ * Returns:
+ * A boolean indicating whether the connector status changed or not
  */
 bool drm_helper_hpd_irq_event(struct drm_device *dev)
 {
-- 
2.31.1

