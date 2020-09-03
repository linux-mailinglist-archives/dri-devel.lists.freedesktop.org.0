Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86F325D1E9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0676EAB2;
	Fri,  4 Sep 2020 07:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6D6E195
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A67DFC88;
 Thu,  3 Sep 2020 04:02:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=VQCRUyPO71jHm
 4tPu/mGDPw0qADlrf66ZnceVVw2jzU=; b=gB91F0tWOMc4ilSm2BtQ5+PW7L0Z3
 xsJWFo6dYxOJj0FVSnHaUbnAmcjRNlWaJXIo1H5ya78bxx07lQ16//yj7dpk59R1
 wwvz9642H7wNf4fb0tTQ8z8stzd6Qn5VHQ73bjMhVlK05IQzlAxgkYXT5uE0ifOp
 wFAzTJ/ENczjN7+vx1eWs9cwJu9KEiUSki8zy+CyH1NW7SSeodkj6ejov/LlZV5e
 Mj5LXio1DT7DQzoSvfeox9J90h6joTDgGePcWGc7mwcTKLihPQlt+/990af+BEAG
 Ke5uXLbUXw3YbP0qsryN1zjQXyI6JdXqOyAlaglrZKFy8AnbwZRo+4/LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VQCRUyPO71jHm4tPu/mGDPw0qADlrf66ZnceVVw2jzU=; b=HKWLd+xO
 a78a9ujQVzVbEiyZObIBS+AhbJwk70hMmQfqnR0/ts613Cs30sXqq9hEMTTiGtkJ
 w/gusOpyeQm4cCha+W3d3yizYkOz0zAkpNfOiGVbbruWcwOkK/sLtbRtapvpPftp
 sqNEN/2GTejbeQcT+jrTiFIBJOm/IVZeMRhbbRoePDVuCd1/DBXtlh//knzA04FD
 UYNke/G0Rn5B+UwDBUkJX45gCq34IOC+cr3hnncg3V5Xu9U1LuiCvDpNMEA9qcKV
 Uvk4ycD/9AG4vxaF1UKsD/oIHZEb4igMpO7hg8frFn1zLHoMJgmwXbWgX9MQP81h
 B9Lfzl9GMFwHTQ==
X-ME-Sender: <xms:JqNQX_kdgDZyKvhTYPSx3BQKDXiwZh_R8El1KSxpf5U8UUrKr6sQ1A>
 <xme:JqNQXy2V_CbE5LhI_s_LM268mZTzTf_Yz-s1HSCUudZ2U95zTPLSR-06aKmOB3SG2
 m2zkwweQkC8Rhhaefs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefie
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JqNQX1pKbgoaQvTJLdUHJlFtqNvLOWVggZv3kZ0gDx_OS6asDBn5lw>
 <xmx:JqNQX3nwnWMNjzDpCAtB0d5XJSDbRZ6ZCVsQQhEv-8TR36VgOBO7XQ>
 <xmx:JqNQX93dGypZ7YDu16yRyqlVVG_5Vp-CG5tMvEvJum0rIuqjKHFIAg>
 <xmx:J6NQX-vkUUfpadEhWsB6b7PeoyZIg19B390aso_m9Th_lGEKwa5Gv15iTCY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 964C4328005E;
 Thu,  3 Sep 2020 04:02:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 38/80] drm/vc4: hdmi: Use debugfs private field
Date: Thu,  3 Sep 2020 10:01:10 +0200
Message-Id: <24028dc06c379dbc71f98e027cce2839fdd446ce.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're calling vc4_debugfs_add_file with our struct vc4_hdmi pointer set
in the private field, but we don't use that field and go through the
main struct vc4_dev to get it.

Let's use the private field directly, that will save us some trouble
later on.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ec34c08b16df..ae8c4d53e239 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -183,9 +183,7 @@ static const struct debugfs_reg32 hd_regs[] = {
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_hdmi *hdmi = vc4->hdmi;
+	struct vc4_hdmi *hdmi = node->info_ent->data;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_print_regset32(&p, &hdmi->hdmi_regset);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
