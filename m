Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9805997BD4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 06:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556D810E855;
	Thu, 10 Oct 2024 04:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ljones.dev header.i=@ljones.dev header.b="QBXpqMv6";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="VOzbJrRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 572 seconds by postgrey-1.36 at gabe;
 Thu, 10 Oct 2024 04:31:12 UTC
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21E910E855
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 04:31:12 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 708F711401AE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 00:21:39 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
 by phl-compute-08.internal (MEProxy); Thu, 10 Oct 2024 00:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1728534099; x=1728620499; bh=JCd5txqFjU
 Kl5OH+CWoc1ou9pa+OO6bc8CoFbaJz9gU=; b=QBXpqMv6750tyUh7tDbwSxGqq0
 K3RcSQLKuobYFzYQjKPDzuuOD4a6sVDi2+r1rkKKvHu61etZ1MXZnhrJh/3/qCNd
 E38dMALeQQH9zPfsWpBYl9J6x+9jzIUMR5w+N1y2d2dyShcG9q4esl5NOSdTdY5R
 RuKNXG9Lrn+wPJ1e7IxRCL4XsZgHIUHVxnKI5euAgxnGy12/sHDTKCjKE1pLu6nF
 bC942FQ/kDJqXlcse5GBn1nJEJt7W84REWutuFPbIwJjNNp9L7I6U+GmVtBnHvyS
 MYQ7XlD8EhDCJc9vT2qmHCFjhq0009bUcWblgITaF/jdiugXjStv4ltWJkag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1728534099; x=1728620499; bh=JCd5txqFjUKl5OH+CWoc1ou9pa+O
 O6bc8CoFbaJz9gU=; b=VOzbJrRq3PVLuVjPEmHuEky9XerUfT7UYslcKkv3Z9NQ
 QTVX6dh2HJaGuP6bAU05roc21CmS/9iA9OsFFf2FMVbk7I892vWcE2rxbeI/gvhv
 uwoKi3EG660PMrxL27CD/+stoao/sG1+j42dBZFVQUhpznzjpXSAiKdGy68pYMSO
 zfkI4fxyfV4kHtCnDdvOOovpLSYVi4A71N6yT4NHU23QzdNvRqVQKz2oVu/hvka5
 DJKYCEc9ClwSlxEGJ75NM6QWOeFbDqwy2S6QHOI9ZI7KqiXzBpUH0wbiJ6WLU9Ot
 G1u618iRfA1Ku0ZL6kdzf+07a1hfcapx9kk5Oih5rw==
X-ME-Sender: <xms:U1YHZyiG-O2jJ3vVz4SdHX_yfb1xCfGZwoRA9p5oujuNvEMC1s4vAw>
 <xme:U1YHZzArL0BFjZO2Qoq3HAun_VOgqmL05uWP-ok9Sn2yYm8fcB9ci4SN_Iy3MoNxf
 pljWI2tDV0f89BzPMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefoggffhf
 fvkffutgfgsehtjeertdertddtnecuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehl
 uhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeejtedtffehheejge
 etvdehvdejgefhhfdthfefgffhjeekjeeglefftefgfffhleenucffohhmrghinhepfhhr
 vggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthho
 pedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurhhiqdguvghvvghlsehlih
 hsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:U1YHZ6HbghyHGkb6zamxXYDshBourZJg1ioBv1KwJHQsgqmKncY96A>
 <xmx:U1YHZ7SVWRAAGs6xfRDVg8JqdfHttrbTwZd4UPA8QVOYBZ4KayzfXQ>
 <xmx:U1YHZ_w52MhD2RN22qkB8dMn85UCQgLUYZlx5wbV3w5SV7ODShWcKQ>
 <xmx:U1YHZ560X0UNybzXCBO0ZqNHXqfi3GW7MbMQx3GXR42txasrsYVyrA>
 <xmx:U1YHZwuUmw9Q2ZLboWl5qwuGSCUzY4pvN0ocnbCoRM5ip5P4xX035v33>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 2B1FB336007C; Thu, 10 Oct 2024 00:21:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 17:21:17 +1300
From: "Luke Jones" <luke@ljones.dev>
To: dri-devel@lists.freedesktop.org
Message-Id: <464b458c-4f07-4167-acf7-d523a7f851e5@app.fastmail.com>
Subject: Reversed order of iGPU and dGPU causing primary selection issues
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi all,

I'll attempt to summarise this as best as I can:

I have an ASUS GA605W laptop, this has an AMD APU, and NVIDIA dGPU. The dGPU comes before AMD on the PCI bus, making it /dev/dri/card0, and /dev/dri/renderD128.

Additionally the attribute `boot_vga` is set for the NVIDIA gpu.

This means that most desktops and even applications will select the wrong GPU as primary, it should of course be the lower power iGPU.

On my machine:
65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce RTX 4070 Max-Q / Mobile] (rev a1)
66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Strix [Radeon 880M / 890M] (rev c1)

Various desktops and compositors have some workarounds to select the right GPU but in general it still causes issues if you haven't set all the various env vars or what have you.

I've seen that this is not the only laptop to do this either so it might be pertinent to fix this at the kernel level. I'm willing to put in the elbow grease but I honestly have little idea where to start with graphics things.

Further information and data available here:
https://gitlab.freedesktop.org/drm/amd/-/issues/3673

Kind regards,
Luke
