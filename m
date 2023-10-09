Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2667BE745
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6FA10E18E;
	Mon,  9 Oct 2023 17:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA4310E18E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:01:54 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.nyi.internal (Postfix) with ESMTP id B2B455C0299;
 Mon,  9 Oct 2023 13:01:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 09 Oct 2023 13:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:sender:subject:subject:to:to; s=
 fm2; t=1696870913; x=1696957313; bh=paQJjbygAS4XBnXnJFWs7p6ECYxU
 FTJsVerqLkMEtno=; b=FBP9qBAoxYDHKgim3D9rx/5CT5xpCssCT7l/uvAlDvF4
 KKNN8HoQnmALj81ZYA3UdH1c47iehuAXtqSz6+NphnIo5FX/rfYV7OoiIQGjBFZo
 ACHBTtBc/2J7VRhujUYtXvZMaVJH9lVGSkch7tLhFQiLmKhRMmICPpq/JiTBlTYj
 LjBtJRPcErkq98U2EzgCN5pQ6X0N1uUOr81hTj88FE2NydF7MgYs+a9/6aHlyFRP
 hTe9BlT6zViIEJOpyDPk1kM5RtmvipYoGcHNrqI7ih1NaSXy/C8L7z7PDvNxzha3
 7MG6x3sFOmt+k1f0uerz8h7TbszkXmzJl7xIoPxePA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1696870913; x=1696957313; bh=paQJjbygAS4XBnXnJFWs7p6ECYxU
 FTJsVerqLkMEtno=; b=clszmevcpDzdHOf7miCL8rpNnob8zD1z/djjAnsrUtrg
 h4iUr45vrVb0cR366Hf3Z/70bMXFBNRBZ6hPP8L2w/2R8V68Xvrw+kUKXMfO1kk6
 uycaxeUcaz0Sbe2xetjiueLxyyMqIgTolxYwHcvd5vYvwOsbS+tMtkjb0WLfH9d6
 mlyYx0e6H7vEJG7oCRE4aJM4V/GApvFJ8Tp8ycAwToQYqXHbfMryKw4f1LFUrW7n
 ic9I3iK7qdCJ7etgxywluZGuzsUX73HHtoovtM549Cwxa2IOr8HnnBMuZij6gzBq
 sifCPhHn2Gn05dBdxmW8mMgQ5EAPk5i4QA0iFimcpQ==
X-ME-Sender: <xms:ATIkZcpaZJknlfcjKwNzH22vNzbtOZ8XIlT1Bw6lPCncu9X1abR95w>
 <xme:ATIkZSpAep-lPtW5SobfSA3P5314X9-rv348VBWtsB88zEn3u65HFxh4KSlWYWj75
 add8OBy8g2u3feMOqg>
X-ME-Received: <xmr:ATIkZRNmy0ZVmLGPtqVtFANqarB38D6xSr8hsjLYW4iEqlulwiDvugmehdj5Hz65DNiTZAfOKgMCJxDyO8dibz7C_2RjsjSJ-gh1Mn-Kz9RO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhhrgggtgfesthekredtredtjeenucfhrhhomhepfdfo
 rggriicuofhomhgsrghsrgifrghlrgculdggofifrghrvgdmfdcuoehmrggriihmsehfrg
 hsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepfeekheduleetkeduiefhffdv
 udefhfffgeeujefggeeiuedvtddugfekudetheefnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ATIkZT70trrYxcHrZbIgSzMIXtVH-wyqcV7VQ10S31L_wyxW082nxQ>
 <xmx:ATIkZb52wQgaokBuZYtyeMtftJyxrckBQjfGrqi15GXwgyt68Syz-w>
 <xmx:ATIkZTjfHEev24UCARrasTaVsrI1e-QuP4gp-A5mpNszo3UcaDGsrQ>
 <xmx:ATIkZe1oCCQmMqVr-P8imZuZUuXFZYceJZzg2NO773BgZ7D27ZBNYg>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 13:01:52 -0400 (EDT)
From: "Maaz Mombasawala (VMware)" <maazm@fastmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/vmwgfx: Add SPDX header to vmwgfx_drm.h
Date: Mon,  9 Oct 2023 09:59:58 -0700
Message-Id: <20231009165958.2507668-2-maazm@fastmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009165958.2507668-1-maazm@fastmail.com>
References: <20231009165958.2507668-1-maazm@fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Maaz Mombasawala <mombasawalam@vmware.com>
Cc: Maaz Mombasawala <maazm@fastmail.com>, krastevm@vmware.com,
 iforbes@vmware.com, Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maaz Mombasawala <mombasawalam@vmware.com>

Update vmwgfx_drm.h with SPDX-License-Identifier:
(GPL-2.0 WITH Linux-syscall-note) OR MIT

Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Maaz Mombasawala (VMware) <maazm@fastmail.com>
---
 include/uapi/drm/vmwgfx_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 26d96fecb902..7d786a0cc835 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
 /**************************************************************************
  *
  * Copyright © 2009-2023 VMware, Inc., Palo Alto, CA., USA
-- 
2.34.1

