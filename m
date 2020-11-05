Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8B2A9191
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48CE6EE37;
	Fri,  6 Nov 2020 08:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CA46ED74
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:57:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4EF7D58034D;
 Thu,  5 Nov 2020 08:57:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 08:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=lGJJsCc/xA29q
 3wq8xPxyJ7pKm1qHScZ2yaE24iFS6Q=; b=ScUUcKLWk4dEVPOTRww0kxJzAUqnf
 JUZXpr1VTC4PTitmEIk3rR/cKULsxZjz5UAoVc30zySZ6vM2Vcd/L0I6+L44QWr0
 dQScE1k2YzBmBMJzRVxos2EH/YMMCuYIf+aYfnwimjluBK6SoRKGnZ6GJbgsoloE
 aYjBBvXYxJbNyzxLA0HdbD8h4QAdqTOIPOy/ooIwDeU2zBb5dR00ymhqGlDx/alK
 Yj5uRt5ZXH4vLAMpAcZUlZ6MFP+cFQYxA6UhMp1qp4yyqlSqFvX8zqIRzJvVEkjr
 DrbpNyN7spMUvGDQ2MXXZhdePgakW5jrufPQpbdfE/NLM4ms1PgeR+O8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=lGJJsCc/xA29q3wq8xPxyJ7pKm1qHScZ2yaE24iFS6Q=; b=St4HTO6q
 bIWRqqDk4Y4mWvtRCmhq43yGC0cyV6LEFzsuKl1DYEPtwS7wvhFkFGUyFcwnJOdd
 yWrLjh8R0e7hrUzn6k2DSnKitT6NZgCZNzmFg0zPM58pk6/eM5E03MQCbDwI/0Np
 LPEHVCH0DkRh0VWhU3cyHFjNwLtbFpQZWRbWs5+m8hU0IUoFkn7wdUBPQPn9TxFV
 c+mrqVbhZsPVuK+lP3ttPqyszpTe3tL0sNJ2DuoK4ooj+9Rm/KzhTSIq00Vho1vi
 6bFQ29uqj1WbBOUJqA+8BEZQUNXvy4cJsT7JjhOsJ4aIu62NnrfaPXf8ep8t9FjA
 R/7pnyvKYVnHCg==
X-ME-Sender: <xms:rgSkXyE12udQiUdAJhmu5puCrR34zzV6i3x2FB9oAPOIMwFKyDV_KQ>
 <xme:rgSkXzVhBqQpyTnOHDkVIjavHZWN55PPf2_qZmx-WmIFVVDMVRedX2fC_8nvDqA2a
 fGBBxnPHiMcQpLa_W8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rgSkX8JZSRxz61_rXieYShwjqEn6GFq2O4sXBuWPicUy3TN4WOEojw>
 <xmx:rgSkX8HvmjFrrv6UhDN3Voa-n6reA5_PxKraDFFJlam6d5sYoxFDHg>
 <xmx:rgSkX4U_j_KV7PRBRAxxY7nxrJSOEyc4zS3LZNKwRcxe6U9zHsrR6w>
 <xmx:rgSkX9XzIXzY23TAgD28riaR4Ziqi0fSZnisB1vlvAa6JM83kOn8Cg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBCC13060064;
 Thu,  5 Nov 2020 08:57:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 2/7] drm/vc4: kms: Remove useless define
Date: Thu,  5 Nov 2020 14:56:51 +0100
Message-Id: <20201105135656.383350-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105135656.383350-1-maxime@cerno.tech>
References: <20201105135656.383350-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NUM_OUTPUTS isn't used anymore, let's remove it.

Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 44db31e16e91..4b558ccb18fe 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -660,7 +660,6 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
-#define NUM_OUTPUTS  6
 #define NUM_CHANNELS 3
 
 static int
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
