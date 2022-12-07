Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE864596E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7F810E39A;
	Wed,  7 Dec 2022 11:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A416810E38E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 08FCF5C01F3;
 Wed,  7 Dec 2022 06:55:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 06:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414127; x=
 1670500527; bh=ZWVkqHVOQFKLI4IZL/T9xqCrBqZyvRPBzXa9RyXGtbE=; b=Y
 rtiQCdRCy+089coWBgM8ErPg628haYCSwYGtT4MbZBb9yB804A3zp7ULk+flRhIC
 PDN/9jsLMatTEGB0nblBnnSzJ9NsM7eFmHIrZ6VYj+uhIH2ksq0zRYGZnemQWNPX
 fzGsQlvIFj7yr8ldD9UipfJreeKDG37vQPiH3/iigLAqnsfvPP/vHq9qjMhVIs42
 se7jIfoWzFNXPv7L7kCTvrzagtwOG/geMKUZnUBYN6Ef6ON7nlr7jaOud+n/ad9x
 QgP6l50ARM7N2O5u+xfQAgiOWrlfMVUuUgXDXOqNepjXraI8kPMgagXADwE4lC7A
 QRXME2T54VsoiO1Q0mgWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414127; x=
 1670500527; bh=ZWVkqHVOQFKLI4IZL/T9xqCrBqZyvRPBzXa9RyXGtbE=; b=O
 i+2n8NryPCdFR3EygG7iyKn158U6xyvRwL4tLh4LO5BJ805Ips+Y9F1ZpXtJGCbN
 u9XLe+kq0ayUY7ewAaGAydqsvi93myl/aE7kPpdI8C7UjX30TE6leRjq+17uZtZ8
 QpjkVgufPIyIm8YLE5MJyX83LsvskGVOU8CvqIoTZ3yYQqMZeggvk2bjfHJSSFTX
 PeTFzP6rgzjGsDQx+1L7cFwybB48cIKVUXETYSZczZkfflWcv7JYfgmXlvaLjre0
 uxxAgwD4mus0UxMYY84AozDBSV9Kb89Uc8tbeT5iCf1XTA+Oll5M96dr5J+xX/2z
 HbpvPnKbtisdJ8QLONnFw==
X-ME-Sender: <xms:Ln-QY0Nk2Dtl46Jy0r9Eq8ip-Isuk9vq7rMHFMlEumu9Xfqvoa6NYQ>
 <xme:Ln-QY6_-8LT4JwjKYiM-NX5oP3QIDeVF5BggVOh_auyhfZepi7JqIliBmVvn18d-G
 I_ZlEBlqc_e9zVCxnM>
X-ME-Received: <xmr:Ln-QY7QCIhIxSMDn9oeOpe4FAaVE7yjpFki1fN1lSoxFeamglU7FjPxUJI3IVR0WfCDlgHNIB2l6OnQeFyrI1T4hdT3ZdG7BxwPhiDbf0RnkBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ln-QY8tKvCEwkMvEvn-7_FHjz-y_hwDLpy9VHBnWPYaFJKsT6OGwrg>
 <xmx:Ln-QY8f-xcEezXd2yVQoYM73DKkZaCNSb2dVfLLwKl-S_elKJig1Dw>
 <xmx:Ln-QYw3hjlYJenW__hTgLREyjaMdcI00_2wQmHq7p_qYfeKlAv760A>
 <xmx:L3-QY_Un0kNd6XhAMij5R_CA_zhidPqg9b4yzfcYFEJLRuo0D_FlWA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:19 +0100
Subject: [PATCH 08/15] drm/vc4: hvs: Ignore atomic_flush if we're disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-8-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=835; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pe2k0BPbXfvS6CAIBcCwRojjO6EKVGqS5JbuGrVO1bk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lb+n1NfmPCRocrEi/Mb+8oQE42VCou9k5bMFMpoYsg/
 LtnaUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIls4Wf4n/u1PvWO6ZnrtvrZgSs5tg
 WoNtS1efDtm/pjYmb7ySZGS4Z/OpN0PtyddOFGduO5CsGLzlPezA+0dNvZrLfqY9nfpVd/cQEA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

atomic_flush will be called for each CRTC even if they aren't enabled.

The whole code we have there will thus run without a properly affected
channel, which can then result in all sorts of weird behaviour.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 3582ede1a0aa..5fadbf219542 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -579,6 +579,9 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		return;
 	}
 
+	if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+		return;
+
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
 		vc4_hvs_dump_state(hvs);

-- 
2.38.1
