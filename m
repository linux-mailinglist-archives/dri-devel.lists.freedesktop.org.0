Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DEC86C301
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2D010E15A;
	Thu, 29 Feb 2024 08:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=falconsigh.net header.i=@falconsigh.net header.b="g2KTl6PC";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="lm9iFBIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 820 seconds by postgrey-1.36 at gabe;
 Thu, 29 Feb 2024 08:03:08 UTC
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF0910E15A;
 Thu, 29 Feb 2024 08:03:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 093713200B01;
 Thu, 29 Feb 2024 02:49:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 29 Feb 2024 02:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=falconsigh.net;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm1; t=1709192966; x=1709279366; bh=YJlyQmihHg
 WJB+zxbV0YUoaP1zY3ZZHgqMVC82I85a8=; b=g2KTl6PCYMkLzkhypU8vv+BSo8
 m1CVyp+oGcun1DDow0e0w5GL0oPiqCX9NKrlPoFJe0FKrqvxfdmZ2Sv+jduZRCcN
 ZFRx25dQwiPAamSai55Z2qplgk7tieStdjwKHSmf4/hrAaPWtFAEWQAQpUPmclfN
 6f7obUZiFUaCqz6visYoHFoD/wfgQJ8bar0VdU00zdbkIOcR6MOFM/sPAk6cZjKD
 +mjsLXSvMt5rrIOgMh3Zfs2IFWngykTqL0O8hxijLwnrXQYs6mp+JfbvZZ9OWtW0
 Czock65HDoZs+R5tf1o4TVXq6hHBtaANzctIHRAuWeVSOdCBCBpbwEMmgyPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709192966; x=1709279366; bh=YJlyQmihHgWJB+zxbV0YUoaP1zY3
 ZZHgqMVC82I85a8=; b=lm9iFBIrvq3kidi5Pv/mKd/C+ekOeVd2Za6PaZyoA5+N
 yiApJ/DzjorRMToY2UQFWYHwRToW8qt6a0xpW8rqjhGqcVsud/xg86nxKieUUnlS
 awcPPhm1Ekg2KlEwL1CV8TBYg9LcgTe8rqCQLphyoo35Gm+t/oCr7EevJlE/cwqv
 xHYhTM7xjxk66DGPZqZC/bvkaBAlr9mr4glOuzi+v12fF7sjeWkAfwRVW9oSUk/7
 MByjL1aFZqyZJy1DbJMFivZtWUqZSSX1b4pjFCIxs0ktF1yHdyqd8Q/FZhJARsbj
 HCzrArfEExsluLWC/4q0SIPRMZtapI/kpexk3tolug==
X-ME-Sender: <xms:BjfgZVjtIJU5cYA5pj2lULXXCq8Roby4mOqpd4BxRntrLpxHYrrK3A>
 <xme:BjfgZaA6WHkg4o5leX08UK-6Y8AfAITXSs9qu06e2jwHxxcKpi6SRGd5KAVUsQbyB
 zi2MnezjUNk1sa62Q>
X-ME-Received: <xmr:BjfgZVEOHbKl8Md5Q0tSLJj-Sq-DzftJX1vXgsTayCP9j4KRqy0XQjt1uPGeQNZskrkhtZjfCzWflU02Qn8HLfi2m7T2mwE6DUDQ0IAXx1L6aZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeekgdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepiigrnhesfhgr
 lhgtohhnshhighhhrdhnvghtnecuggftrfgrthhtvghrnhepueeuieegueehieetveehge
 dukeffteeuffdtjeeuteetjeeigeekgeetudffhfdtnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepiigrnhesfhgrlhgtohhnshhighhhrdhnvg
 ht
X-ME-Proxy: <xmx:BjfgZaRKy6bVmURTnQ_tT5dO0x2t1fQD39aSMcWrA1xel_IXujqFKA>
 <xmx:BjfgZSzkEe2_c8DZyZ8Iso3DA2yFUFcZe07HEozmj2Y6BA7Uxvildw>
 <xmx:BjfgZQ5LFAXzZpyRqm89bFRuiuhJ_G4AMaPJpXW652cGw6Z9p3czeg>
 <xmx:BjfgZXqGm4S_OnCIQgCOy7jmbq01iSsc-upMIAJtYW4IbLI7sgqEJQ>
Feedback-ID: i9d3c4088:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Feb 2024 02:49:25 -0500 (EST)
From: zan@falconsigh.net
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, robdclark@gmail.com,
 Zan Dobersek <zdobersek@igalia.com>
Subject: [PATCH] drm/msm/a7xx: allow writing to CP_BV counter selection
 registers
Date: Thu, 29 Feb 2024 08:49:11 +0100
Message-ID: <20240229074913.3463365-1-zan@falconsigh.net>
X-Mailer: git-send-email 2.43.0
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

From: Zan Dobersek <zdobersek@igalia.com>

In addition to the CP_PERFCTR_CP_SEL register range, allow writes to the
CP_BV_PERFCTR_CP_SEL registers in the 0x8e0-0x8e6 range for profiling
purposes of tools like fdperf and perfetto.

Signed-off-by: Zan Dobersek <zdobersek@igalia.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..09c554f2fcf6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1175,8 +1175,9 @@ static const u32 a730_protect[] = {
 	A6XX_PROTECT_NORDWR(0x00699, 0x01e9),
 	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
 	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	/* 0x008d0-0x008dd are unprotected on purpose for tools like perfetto */
-	A6XX_PROTECT_RDONLY(0x008de, 0x0154),
+	/* 0x008d0-0x008dd and 0x008e0-0x008e6 are unprotected on purpose for tools like perfetto */
+	A6XX_PROTECT_NORDWR(0x008de, 0x0001),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x014b),
 	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
 	A6XX_PROTECT_NORDWR(0x0098d, 0x00b2),
 	A6XX_PROTECT_NORDWR(0x00a41, 0x01be),
-- 
2.43.0

