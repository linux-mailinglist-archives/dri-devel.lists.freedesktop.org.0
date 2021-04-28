Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F336D844
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FE86EB3F;
	Wed, 28 Apr 2021 13:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79F6EB38
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:25:52 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id bkCIlVh38k1MGbkCMlOQ2U; Wed, 28 Apr 2021 15:25:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619616351; bh=KLcMtNu/PFd88iBei8ARghAUq5qJBNqCP6cfIKCdetU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=GRr6xbBVTR6rrfZ6enGaYHDrmngDyvrjrrfsobfUBlMPeOMza/4XBYqmIsS/HfXqC
 VRWZuQrlk+x7nptnNer1Yop7+nXr4Dbsh2wdG7M+2yd8pbg0WZy9yMpKCGnVrMrJjt
 3KA4MP0Ug6On3XzpL2XLKbipzIwl5mntzvJ772zDSzzfFQO9rmAE87M0nJhiG0U6yn
 lVAJYsM2evzwBoo/sOEzyf2fgjgpCsOhfMt0AGebeC+qOiQ1eI35nLhnp9QmLUDrv4
 l5laTCvEasHljvYun/0OCu+hPyVshd0cWUlmwroMTY2/ZCmvRlmGdvpim5jtMB82fK
 +tGtL/KWjUYwg==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv3 4/6] dt-bindings: display: ti: ti,
 omap5-dss.txt: add cec clock
Date: Wed, 28 Apr 2021 15:25:43 +0200
Message-Id: <20210428132545.1205162-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNLevcGa/vJcvtKdvEIiHy92QMBtnAfp4gJ5oaF5BD04x2mRHL2FhkBxrDLGL/QF5SPbt8HI0K+xfQ1Qw3yCultLrCTAHCKvOnCJ77XntJwkqGsYDCER
 sMdKdN4TwFN5jWYmh59ASlv4AsdunMo/Tw/wcTMkv1VviAxbNdZRIVtizp5q+ii3T7AUEzGTXdU9LyWXPfQwTk7PwC78VhJvefNWXf96Cqh1H9ykgmGJIAMk
 UFKKwhowjHKq3M+V4NTGQ+/coSmdnDKFW6T3bwipMS5TOp/mXHgslRevRPpMEIKIsv3/vOKo/2kbnxNQhiaFT2/olOcfVL6jpmeti3N+siiZ0CD3IkUsLCO/
 mwL2SzB/3v6y1mNLbY+IPOUtPq9wbku7jKsmbgOUHCUhg3gUf2SgLZCUcE8D6C8VqsctMHXhVQwhcD9VdDZE8QKXsLbNRA==
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
Cc: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cec clock is required as well in order to support HDMI CEC,
document this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
