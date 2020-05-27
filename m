Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CC1E5973
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF2F6E484;
	Thu, 28 May 2020 07:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F726E340
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9139D581518;
 Wed, 27 May 2020 11:51:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Hsd8JQOKXqqad
 N9HnqexX4egl8EjW+cY6nFdDegziVM=; b=dEs6sji+it2ZXHG8WYplk+ElCqypR
 7f6YbJHc52sSBDtdllmRFe4t1AftH69jcdN9BduIlV5SYH1Bn5nGk9VcOTItgENr
 psGkZ3nbXqK5MuwL+GMpDXtF/5uD7WENtwYVHxAms9LfpoRK16H/4ZwxXI2hYFEV
 TULzEC5aiLXNdNrFaxb7C4XVNhWO/olCEui1kf5++xYO4q+j1clJgbvCmjPxzRHG
 UKc+BzlfcszWm7D+UKCuvx6CEwEoh42jA+I+YZZu95SCV0qc5Cm5Dbnt0wlkXfqi
 fRdi8NbsGn3/OIrTThEnUtwRqc1vXIcV+pAwh0hm3CpHRefS7KDkyzSOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Hsd8JQOKXqqadN9HnqexX4egl8EjW+cY6nFdDegziVM=; b=fqP6XMUW
 y3gBzLXMEY5ZRdGOje4ECtWXxvIsqmqy+oZPl8bbK9U1svzXamIzZ+kvz4MVUX6t
 2Ml5WXFG5To9tfdn/SCBVc6W7MdibibSljuybpstJbtpxDHPXybW1Y1RWb19+ZQe
 /ZkP2eNOHPQkJKxWzi4pFvQGk5Dh+I985yD2DdC9mW2AnuKSElpuF10vw47vDmvJ
 abCCFkvc4Dwou6BN8qE8sxYDPkVJyUy7F11psaxiyVkH7s4WV5KZ29EPD03VS4mw
 b+ENhJ8XL1S3hGPyuDYpOsf2rs4OLZuApDLaEJJviuaVutztVtkEUSPnorse7UYt
 CFV/6mU+JBtoUg==
X-ME-Sender: <xms:iYzOXpyiBsTFpIJjAMF5o8VXHDcwv9Njoc00UmEaMgg3s0kA55l8eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iYzOXpSAseRgG1ESpsNfuZGXxM9ygo2n9Npp-hxkKTSKYZQUvk3E6g>
 <xmx:iYzOXjUP6bBrfqf8doch-6KDGVZlsMmJTBpAbdpXZAxzGA8j7d0XKw>
 <xmx:iYzOXriDpPa8MKsCeAAP4ZFTuZPFaZHGx4y0CdTkoZW_KYo95bqXlg>
 <xmx:iYzOXtBXjCnzGm-rvyl4c6t0CYyB9VZa4w6KYmTZEhZI_EuOT40q-g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 352773061CCB;
 Wed, 27 May 2020 11:51:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 089/105] drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
Date: Wed, 27 May 2020 17:48:59 +0200
Message-Id: <45917004243e1d8a060a9932bd5348143718fb5b.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CEC_CLOCK_DIV define is not used anywhere in the driver, let's remove
it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 27cfcf38edb4..f62b488c5bdb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -55,7 +55,6 @@
 
 #define HSM_CLOCK_FREQ 163682864
 #define CEC_CLOCK_FREQ 40000
-#define CEC_CLOCK_DIV  (HSM_CLOCK_FREQ / CEC_CLOCK_FREQ)
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
