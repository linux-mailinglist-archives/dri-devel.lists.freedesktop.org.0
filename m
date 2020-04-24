Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3051B800A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678BC6EB5C;
	Fri, 24 Apr 2020 20:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66998979E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B2F4F143F;
 Fri, 24 Apr 2020 11:36:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vQCG19Ii3NUG8
 qgHnGg4pvS2ow7VxpnXBTmaUCIAX5w=; b=pjcOJvXCgG1SCU4sKxqq7g/YBTTfA
 3gGm+4ti6EEqF7ORYaU/fWNw6gEORKzdnK1J7ySyNY5gkIc2a66QuhFrjfkkoji2
 UTF37qbJhdAeTn3fbx+ZRIlKzM/UQhblTNY85i5BGJQpy0mZqx4nzEJd9yceCuKa
 J+Ujz4lGjjTjQrnmj/fAgomAnwKkFiU5cP+QC4bNhMPHzLnqzs6W9E/prYK6bPt2
 hFSMAH+H2knpVa8Wm/gRcv9tZvxv4RCyqYSGyhZuyfiGKm+gmjH6z/uehv5Z6Z6v
 87HHxxeMj990BPMlIFOdIzO1/AYyCuqKE4CRAv4HwguBTyWjcXrMvUvNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vQCG19Ii3NUG8qgHnGg4pvS2ow7VxpnXBTmaUCIAX5w=; b=eDyDPsy4
 fdNPu+BKDpnpin9bvV8hrMsZ5sDl7LnOD9yNkRGWjFcB61E3MjLsWdxBhuS0tIXp
 i8qaQemi1DOr12kvV4W7kiCY6aJge+ReIdlVQfvJnMYcdJmjg5aroYeXgeM29N7z
 ipkYz0dn57ASZ7i/c/2m1Ar8zKvNfFHcwjorMlKGlRZaSlUu+qoPSQGzVmB+w/p4
 AaUJAfEmjrinIXhVq4YjJkTvcEJw7VMyPzOraQH2KvM9XyZFu30uMrawXCCGw4nW
 AIWL9eC3G8OnQTtEc5wJYeWxhfDceuAPFaUq0bLsiNUtSlhDIlVE9tDbK7uipPi/
 rBHuwkLeiykQeg==
X-ME-Sender: <xms:gAejXnMjEWecvYTrEukGSXzYkJCIEQHha1ND12PgGdpV_sVSO0Pf-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegvdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gAejXoSykkMaXrW0Y5JgT5nm7XiTTB5XwLGsP-Yub9Z3AtZymFoTqg>
 <xmx:gAejXsQPFY2lPeH6ecX_dZl42Tup-PDa4OspT5VGwQwlkOTUPtWojA>
 <xmx:gAejXpBvzt20AAXG0sWQmUP1En2dOaiynI5G4ECxeq2mOFFx5vgyug>
 <xmx:gAejXoDarQ1pWEV25w-ONHmcZeXKmu-wgUqPAUuVW_lih0JVB7Imb9qGFB8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF2383280068;
 Fri, 24 Apr 2020 11:36:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 50/91] drm/vc4: crtc: Use local chan variable
Date: Fri, 24 Apr 2020 17:34:31 +0200
Message-Id: <02cdaf45d556fdde750856aa75d0b214f61edb0c.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

The vc4_crtc_handle_page_flip already has a local variable holding the
value of vc4_crtc->channel, so let's use it instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e6d8f7656dd3..3a15d711ff55 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -815,7 +815,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 		 * the CRTC and encoder already reconfigured, leading to
 		 * underruns. This can be seen when reconfiguring the CRTC.
 		 */
-		vc4_hvs_unmask_underrun(dev, vc4_crtc->channel);
+		vc4_hvs_unmask_underrun(dev, chan);
 	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
