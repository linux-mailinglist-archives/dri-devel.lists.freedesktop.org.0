Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40932A5D0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 17:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAF56E1F2;
	Tue,  2 Mar 2021 16:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2D06E1F2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 16:24:15 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id H7oZlNjwSOruFH7oklAWO9; Tue, 02 Mar 2021 17:24:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614702254; bh=g4EqIicwlsCbluUsMLX/Juo9LDEWnCrvsgtLgDt/ZM8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=gmfWZKXxuct/TEtQ+b/UxHaeImqgniSdszKj9DFEFz9ouzzAmU7S2LVtUJkc1kwLL
 Yf9AHFOgiEDhWr1xI84Ohcwzb32klIpYYRsZw3hjtSuXOgCYMMeXxHXjgF8MXQld2G
 rH0nuprxBdF/ZNv2sZWnhJRgoRy6ahOaxKmeEnynJ4O3qif+4yB4w/E4WsFcAgNrgV
 u9nzYcPPt5axjTrvVkJpEcChrRvOagarPoTRsolk3dSMarGy08bUH+8qXHni+Ch++L
 PCYdtY9DQIFXaJnDizV9Z7uqFtuxXNa7eJfBcZMz3n22L6xfJz45KonjB0/QmnHkDZ
 fllPQehCiokiw==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 4/6] dt-bindings: display: ti: ti,
 omap5-dss.txt: add cec clock
Date: Tue,  2 Mar 2021 17:24:01 +0100
Message-Id: <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC3izUHoGEhUuhakLv2+dkIjeIDtYHJO1pPfWD8nhP0CbF8pP8lcKrrDjdGvxaxHQng+R8j+ekxirIIpQGQ0/8Le44tj2HOvxPeBSA/oVA8c20A3KlJI
 qAwivk7ksrQFTk/ZGgDyWVboNo5Z3fy0f0Wcwgmrx1yeumIeRb9Ce3enmtGjOTVvYH9h3nnfjAzMEgPSXPOfVnMBMKXJaghj0zC1k/IgBSL57TXssDv7kADO
 x7B0m73iHBAZJmlGeQOYVeauXwHYL0oGnIShi+kdnpkD/dLpOSM0VKOLRXOT1cufIH8REhhe0Py/sC9HHl+q12wS5a07+4bNz1CSD25AhU5Ik3ebj2swsi7U
 xqEC/NeO80+yW2FWOFbj0vnkTPAUXH+BYT2UmY1t5qHG8s2S6w+QGwl+1008KMedN4h+Gu1Oc6M6nf1//gQvD6slMVqeQIJJonHCwaij0rcCr6SRQ43KDPBw
 1mYZXqz1cq+oZzKWp+p7gx5Mhhc80hGfiS0vJrua2C6Dy5XjG++fKgZ2bSw=
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cec clock is required as well in order to support HDMI CEC,
document this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
index 20861218649f..c321c67472f0 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
@@ -89,8 +89,8 @@ Required properties:
 - interrupts: the HDMI interrupt line
 - ti,hwmods: "dss_hdmi"
 - vdda-supply: vdda power supply
-- clocks: handles to fclk and pll clock
-- clock-names: "fck", "sys_clk"
+- clocks: handles to fclk, pll and cec clock
+- clock-names: "fck", "sys_clk", "cec"
 
 Optional nodes:
 - Video port for HDMI output
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
