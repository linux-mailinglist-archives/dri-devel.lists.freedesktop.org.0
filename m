Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D89917F7B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDFD10E849;
	Wed, 26 Jun 2024 11:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="tdr8Ywv3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="WcGmq1KP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D89C10E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:20:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 8BA5611403C3;
 Wed, 26 Jun 2024 07:20:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Jun 2024 07:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1719400830; x=
 1719487230; bh=aLn59QhRXUuT6Aw0/Zt6YArZWBd79gc64XUXjB64Wq8=; b=t
 dr8Ywv3jkiSXZvTRl2d4P7MJGUM1wag9fYaWo4gaZJTnIiN/UzU0QR9V8oOfW+6z
 unUI6R88J6Zm0cbDT6IU5RPtep9Iii24CD3B4O1zb5hy7uXoKWTbDO5BEljTOlhH
 fjXcBponDbGe7x6kE1Bqd1CIQsmIeXGwc+T9mDxXvLHYhzMkuf5GiPzSWmUGbLAl
 3olBNOvYi0WQi+zErWsOpe0aPgskEsvg/1cFbGxhO8y5phtZwMaYdx5zuvWKAikX
 fxMA4/XOCt3bTVSuLIel452YiGVY4YWKlKDzoaPK33hQKZYnWCcybT3rDBrvsW0x
 qDiPY9Z16tfOzVsxmwmvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719400830; x=
 1719487230; bh=aLn59QhRXUuT6Aw0/Zt6YArZWBd79gc64XUXjB64Wq8=; b=W
 cGmq1KPpjv6FQUL3YsLNIQyX+lJfaZuZReNeUbuvMzYtG4SNvriPBoWT/MgSR3cs
 IUCnlxkPmb/JMr8fyFmr1eaVQQgML3XJHunKPUb67TlZr3gUYSkWehpFWoAcPlSv
 8R2Lgx3cBJZebqPgd9xxL54ir44zmIOOYY1atLJDf+tL894mKVAEq6L0+1mCS2yu
 gpntUa1HfL4KB3UzX5q5kQcwTgJLXiIQKPWWmGotLLMZaww3+6a+5J5cWjELHuXb
 PkpoSE9HjDV9X4T89xSdhlMsmuWSNxJ1GEgblKDIT/3DC/ZbUVZgFJ+PGVrlEhpt
 ofQzFa/LfUsJTO/Ba5Y9Q==
X-ME-Sender: <xms:fvl7Zsje6Yckcy5JM7lHxDOtdiKeYJURC_AwxwFJRb5EWCOWV7uiTA>
 <xme:fvl7ZlCnERXEomJNRIq72CNIbR_ku0AosFIwEPfoQH1BXSvQMtmmNmAsQRvMpwKWv
 v5MjYlWSws-z6qVHw>
X-ME-Received: <xmr:fvl7ZkF19mkBq6cwRBjqPAsm15Z8hdj8_yRGccp8Tm0mNHF9VejRINghQWif1JMSD3CHMOwmsWjrG-N4SC0IjiNnXm1eXgmi5ToIIn5cdmbQlAdW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddvgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:fvl7ZtS-F0ZFVZVAudAAZBqOLo24sV6yjrfh-HvrDt5Imdvr2GqkVA>
 <xmx:fvl7Zpx8Qi28DW3sJ69oiwNYoX1USUO_F8f9T39qDnRCaOhBTa39Zw>
 <xmx:fvl7Zr7S-amRdV7o2Bk_hnMR2OVETpFvw1TviTbbYzeV9x0_HcTZLA>
 <xmx:fvl7ZmwAe1Cdt31YpmjdtNkL2oP7kXC2gW6Oad8sJEzpiZVwc8mKRg>
 <xmx:fvl7ZmgykEgS4ajgzFeaReif3qwxrDWw9M6XXIXvqTea2dRLHc2iqTuF>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jun 2024 07:20:25 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 3/3] dt-bindings: display: panel: correct Anbernic RG35XX
 panel example
Date: Wed, 26 Jun 2024 23:17:50 +1200
Message-ID: <20240626112005.248576-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626112005.248576-1-ryan@testtoast.com>
References: <20240626112005.248576-1-ryan@testtoast.com>
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

make dt_bindings_check reports that sck-gpios and num-chipselects are
required for spi nodes, therefore add these to the example.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../bindings/display/panel/anbernic,rg35xx-panel.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-panel.yaml
index a7d5ad0f29389..610601c1594f3 100644
--- a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-panel.yaml
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-panel.yaml
@@ -40,6 +40,9 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;

+        sck-gpios = <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
+        num-chipselects = <1>;
+
         panel@0 {
             compatible = "anbernic,rg35xx-panel";
             reg = <0>;
-- 
2.45.2

