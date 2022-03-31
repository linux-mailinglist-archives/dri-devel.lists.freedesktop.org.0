Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E54EDBCA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B71C10EEFE;
	Thu, 31 Mar 2022 14:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6DB10EEE0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:37:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BF1AD5C0051;
 Thu, 31 Mar 2022 10:37:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 31 Mar 2022 10:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=FarpExqdhSGlDvSiIqjonlfl5mX58kv1NNmOS8
 exobo=; b=PFjFXCmyDNWGMCANzSCIR4RFtEjQacP7hMc4cR/hoLX5wf+0sbhO8e
 wfhGH0KtMTDflJjL9jbBo68IIwpi9apR8DwiaGgIvNgWm7wozJ5Yr+b5FdOm9mnd
 nsOFI5VQkFmHmydOO2JjwanOnCu6Lrw66eIOkk6M3qvHKSuY7eIe2qqqxeSH0F74
 x2Rb1nWWWDM/i5uCnvZbCi427+PLmu4Dt4QJGjoBbe4wHL4fR1cD61Hrs+zCww23
 qpe49qyeyttgVuGDgjDszqdjwyWnmQqY8cux5C2NQht2JNpb6fB9d0aryo33eMXF
 gq5XluRhcKeCRwPDxFCYcu5Dp9sLd4Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FarpEx
 qdhSGlDvSiIqjonlfl5mX58kv1NNmOS8exobo=; b=BysjH7kmpfEdqZbvQv5tYM
 9RXESu5ryYhGTSigNOO1DX0NhG3WNT1SWnMn3Fiqx7gzYetWD/g66wu41Rison1m
 yoVdcPxLLGH/fMzHvKRfBfLbblt5ThR4hg0kxcrRm5NwKjrWDp60pxkCR1fVO/u8
 jy75RunXkeyY4Tnxf8RH28aOIhSUmL1ujQLpysYCe9LX7UL27BgeM1qBM6g/QNd0
 3IyZgckz4NdLQhE1pWJBOwlkGjS07DmcIi1CLXFTXg5Z9YHZ0s3fCj3q/RAJTejT
 nTa5321hc2VsXN1aYS3zshbKtj8/NH7UL2iI3+pELWobFLMaAf46EJ3BQEp6xfRg
 ==
X-ME-Sender: <xms:u7xFYsRaXCIbZxXQZRv5VH8pYRmCzLpgNVSH6GTq6MyiF0GJtJXiyQ>
 <xme:u7xFYpzZhIdy33KNYkDEppgzYSn8B0Dp2Qi3Ysj5bAkTyrU8Ued_OaMsr-QCOp5bo
 nnyqYYZ0OaUomt5I8E>
X-ME-Received: <xmr:u7xFYp0nQ-opWt_3Un2M96sBQinT6hsk6Ky5HNVTZRz8YIdL4s0F-rZTfhXOXLdsoiKGQLvHgn-0Iqf2olc5WWJrFgv4-dQQIPB0T08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetteeltddujefhffdtuefgudffleelleehjeeggeffuddvvdfgvdfhhfelgfet
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:u7xFYgBYzgMN9js7LCxkpnyczOSPnDFXAGrPT0mDVzXYtgIVaXg_ZA>
 <xmx:u7xFYlg8L17ZyyEOmpCxgbvMAaN3RcmZVUvAlD0pCF4v7bkp2CnNMQ>
 <xmx:u7xFYspdWvy4xdLd68loKEKkFzYWSzG5CXLyZ6e83d2aQ4M8QuG_Zw>
 <xmx:vLxFYleUZEG1ejqNZ9xYW6RvJFsk2bmGyhgMaYhQ--PfxbqD22KosA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 10:37:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/vc4: hvs: Various improvements
Date: Thu, 31 Mar 2022 16:37:37 +0200
Message-Id: <20220331143744.777652-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
These patches used to be part of the series:=0D
https://lore.kernel.org/all/20220221134155.125447-1-maxime@cerno.tech/=0D
=0D
but since the main patch got superseded by another core patch, I've split t=
he=0D
cleanup patches out into their own series.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Used DRM_PLANE_COMMIT_ACTIVE_ONLY to skip atomic_flush=0D
=0D
Maxime Ripard (7):=0D
  drm/vc4: kms: Take old state core clock rate into account=0D
  drm/vc4: hvs: Fix frame count register readout=0D
  drm/vc4: hvs: Store channel in variable=0D
  drm/vc4: hvs: Remove dlist setup duplication=0D
  drm/vc4: hvs: Move the dlist setup to its own function=0D
  drm/vc4: kms: Ignore atomic_flush if we're disabled=0D
  drm/vc4: hvs: Use pointer to HVS in HVS_READ and HVS_WRITE macros=0D
=0D
 drivers/gpu/drm/vc4/vc4_crtc.c |  14 ++--=0D
 drivers/gpu/drm/vc4/vc4_drv.h  |  15 ++--=0D
 drivers/gpu/drm/vc4/vc4_hvs.c  | 127 ++++++++++++++++++++-------------=0D
 drivers/gpu/drm/vc4/vc4_kms.c  |  13 ++--=0D
 drivers/gpu/drm/vc4/vc4_regs.h |  12 +++-=0D
 5 files changed, 115 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
