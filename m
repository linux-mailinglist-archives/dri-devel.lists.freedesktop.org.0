Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF023CA48
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FB089DA9;
	Wed,  5 Aug 2020 11:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB71F89DA9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=J08654X7H3kbc58/m2gL+bfcL2jyb0HzXVeKBQozN18=; b=DC8aYJFt9cO5OYGZXYZ4pk5oxV
 +8JcsbVbK3VPyo8Rqa1zrayMTV25RJIgCiEFVYdntVbNcbl/W/L8yxfEDBIZxqO7ExarM07ZZLIXF
 /DfydtCqSvavDLR0MTVFO/RKveDDydmsL67zqd02pXJf1i6lK0XPCNARjPP5QG1lVKPo/nOZgIiXH
 kKto+7OnkDAbfE6fGtfntJiJslatSVyIfBpqIqW0R6ofjAhlbBppIAqr/Xu5JC9b/3WP3jyY21ACY
 DFd0XOgngt31L6mWcqKubsxBwHcyGopOuxQzNlWx02B8ygbE/ejNAP/7nr3ygleS1IJbek2tw+PiA
 OYbmVQSg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Hcc-0007nH-4c; Wed, 05 Aug 2020 11:30:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1k3Hcb-00BavU-NB; Wed, 05 Aug 2020 12:30:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 1/3] arm: dts: remove stray /dts-v1/ from mt7623a.dtsi
Date: Wed,  5 Aug 2020 12:30:11 +0100
Message-Id: <20200805113013.2763510-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <8ef96e4d02ef82e171409945ee6cc0348c4fe594.camel@infradead.org>
References: <8ef96e4d02ef82e171409945ee6cc0348c4fe594.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Woodhouse <dwmw@amazon.co.uk>

This isn't needed in dtsi files.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm/boot/dts/mt7623a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index 0735a1fb8ad9..a96075206cce 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -5,7 +5,6 @@
  *
  */
 
-/dts-v1/;
 #include <dt-bindings/power/mt7623a-power.h>
 #include "mt7623.dtsi"
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
