Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE2577D02
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DF4AC399;
	Mon, 18 Jul 2022 08:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252C5AC396
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:01:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D7C2C32006F5;
 Mon, 18 Jul 2022 04:01:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jul 2022 04:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1658131312; x=
 1658217712; bh=nwowOzEwwSHAOeivVs+Wt3cPeoVpox6uPbedn30TqoE=; b=v
 Yb5VEGEeilso+r238ifMbKKRP8DlfdryBtGOWPNAf+/bYr9ckw3g6iklClKdFjoE
 8QTgEH0LFCP8Ylmwxz7vUAYDMMNGefzTO3J5HRFsUFuGUtI6u02Wjy+zk2YNoP9N
 jJByGFfmXlGAOuMKj2+fI6SepIz31m4pV9ke2T6+wCE0M67laBjbu27hUqUmWXHA
 NTH2WSbkBWBeVU2K913B7fbmtSryqhUvb1Aqiib9+UNXzaqGBp1st9QGpMS+Z37Y
 zbBzszwswqeGxJV5z5BUjtkvldcvV3+N5a3dQULv8+PqvUWJX+ZhvdctVS3v8ZNV
 6999ytZSvxRjMJJ3BZUnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658131312; x=
 1658217712; bh=nwowOzEwwSHAOeivVs+Wt3cPeoVpox6uPbedn30TqoE=; b=Y
 611Nn3oIhlQfDek27k0k4b8waVgfXQQQNtVuoBH8MrFiSkAvXt7EHrZmtZwIlCPG
 x2Qje2mmYOvfWwyfE/5kKNOLI0wGLK+XEs/4WnTce5LqM2gKOdVgGCXlLB0DGuKL
 1ytOxOgnucdyrS4c/HPPLVEILzGJiQnR/gT3ZbqYr4J6ZU89mm3DZ0eCmxG82jvK
 s0FAs91l2hYq4z3xVZhLlZZs39V2VuVp64FARQvGRK8VxtYGul+cnHSt+5+pK5rO
 qGndnxc6gD2NXXbyGhH1TQWfgxckAgDL9D4JfJkIB463lnkH5W4A9RZL3Sg0Obe8
 6nRJHeqQSUXSG+Z8Zqr4Q==
X-ME-Sender: <xms:bxPVYm5IsNv_o-AwePLsh2PewcjuH5AeYkXq1vwSIm_f8Mnam6VS3A>
 <xme:bxPVYv7Gf1yIu1f4UQezx_QzdwuAh25KIbu0WfDljb_Tg27XSHDD5bUHyoXqixlnQ
 c2fV-M1oxmwZK2KOYw>
X-ME-Received: <xmr:bxPVYldGuNzzq7ocMApBt61UwTrdWJ3p7OMRSDv35slZZfEMxSKXb7IwsVM3fWTnxipPb22WLhWvC4eSpJgg1PasTlYKxEUObsl6O-o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekjedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
 htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
 segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
 eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bxPVYjKJvxiaDXW7lVl0No7rJz2uAO5GidIB0IaYhjbM0vDDtkXYdw>
 <xmx:bxPVYqIaLLEro4qdXpsAGsJYk_WqllGAomJlw_DE7_V0Ek6iXh8MvA>
 <xmx:bxPVYkx_85koRju-vje9gPC8TQHsRL8lyFjPFB-KBWH0hWIcQU_4hw>
 <xmx:cBPVYhUab2_WoWlP4c4ZlbMjC43wYWslQNUOovBzg-eD629pITWizw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 04:01:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] drm/fourcc: Add formats for packed YUV 4:4:4 AVUY and
 XVUY permutations
Date: Mon, 18 Jul 2022 10:01:48 +0200
Message-Id: <165813130653.292326.2960913361041359479.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616185210.22018-1-laurent.pinchart@ideasonboard.com>
References: <20220616185210.22018-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Maxime Ripard <maxime@cerno.tech>, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 21:52:10 +0300, Laurent Pinchart wrote:
> Add FourCCs for two missing permutations of the packed YUV 4:4:4 color
> components, namely AVUY and XVUY.
> 
> These formats are needed by the NXP i.MX8 ISI. While the ISI is
> supported by a V4L2 device (corresponding formats have been submitted to
> V4L2), it is handled in userspace by libcamera, which uses DRM FourCCs
> for pixel formats.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
