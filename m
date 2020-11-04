Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92942A5F92
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA14D6F3E4;
	Wed,  4 Nov 2020 08:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904898913D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 08:09:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BodiwkWvA47CRmDvJJlyJnOO8oc412N+rz7zzDs1GJzQ0aR013OLx/8bZ96vv9T4kc/JVfla/SElpmIh5ot5dxB+hZF120oC8llwRjuHL27RKmn55MnwHw2CtoCFN2o+vRSEu8h18/t42klu3S2iitBLX8Ys4DQVxFn7Ng+V6ChGR69CpR9bmPBWT5PW/m8C1ko38tUo+aXgL69Idikyxy6/bAKB74ZJmUUInKsQ+qy0pv2dPmhKIxPrwgD2LIn0QPOAKNzLUo3ko7jlsAux7g5+QrL1s+BrBUt4QPKIviRTnRbvgLTruUdAuUHtqCSjsYQjIO3QmKzxBVimysIdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD7HLGOEVvHtEzS/Umpfulkyd5BGLMBy5MS5Ys7WrqU=;
 b=FWo/8+SDKf1gK8K/3WRD5H04DGlfcoJ7Ym3cVFYpJZ9IOK+KBgdBRJYbegl9BOtz9P/URFcUSvPGJK88WgYDXl5aldnZvyu8EwFZqDuEEu2DWGq3MnYLncWpeazNylq9285/P6944m+jl3IKKrsbIk1osY2vccKRONSLPWAC3X5aeJQEhaBY6UBJmYZHab51+rn9NokLLMioU49qqBwYCMQRGZ6uqsP3WUZ1/NS1+wrozFpLMRO8dfC8SXWZ8fyH5ol4k/20PY8oyd0CGuTwLu3En1lbsikWqCnckp/SIE/033g5sR+mM8gXDO1fmtg/764iUzTnZ56+F9eQPr3klA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD7HLGOEVvHtEzS/Umpfulkyd5BGLMBy5MS5Ys7WrqU=;
 b=A+bpkmTsOYaOrtSivLMpXhj8v7QIAG4q4+nFF4m9OPbqf+A7hX1jVtYAarFiqq4bovwUAIAU86t2gWedxC/eMyWebhY9EIP7Nz1tPBShCFqcpUPwj4G6D9dU/kOZaNrYmPwpFlu60jjUdeV5k4tjh/C3miHgcc+zSrrhoL5YPw0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 4 Nov
 2020 08:09:52 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 08:09:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: panel-simple: Allow optional 'ports'
 property
Date: Wed,  4 Nov 2020 16:03:37 +0800
Message-Id: <1604477017-17642-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0143.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::23) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0143.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 08:09:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95670477-12a2-436f-a509-08d88099019d
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-Microsoft-Antispam-PRVS: <VI1PR04MB2975488652CAE3D93E2D046E98EF0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bzzvWuXLmY4uzP3GM3YVX8gZGH4s7dOJeGvID3PWHTEDHuYeaNy/Hp1elHeLYxp96VIyeWjFWaogX2htC97++t2quNPXSaZyxXRZkN5I6ahNYM3C98bBInr6qhXDsYQyE9m5um4KVIgqTrhwr8WrqGYWffdVnWR0qYsC2ZjOcgRwvo56kobjUiSJ0S7UZofGDPyNhaljZ/S2I4K/y2NkGUGDDNYy9UlyfxSSaMie628eApmA/HF/cCi7paEm3kLOPu89sJw+S/mmo56SC5VM9ZzDRLG2nu79MkyvkUlTzMrC3wsNlXGdiZBRm+2ncO9i7knGiwJt+G+qowUTgGVP/78IWeI/9pytp4iWeszvQOGIcuysQeg4nF1yJLsUDfUW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(5660300002)(86362001)(69590400008)(26005)(66946007)(186003)(66476007)(6506007)(66556008)(16526019)(4326008)(478600001)(54906003)(36756003)(8936002)(52116002)(2906002)(6512007)(6666004)(956004)(6486002)(8676002)(83380400001)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /X0nQ6HmA0iEGl6OWWeT+hDyAOQjx6yzh57sSeygbzZe+Wv8ZIGi74dPHYGMGfFo7ncFRH9+v7ERyroagfOG6TssL5EXdL1iJNq9QCmi7O5TVODb0ZURtd0TaJeaooh3OlzTN+T03Y5aRe1267KjJxD+yJsciQuI1szjx/LwUcuBDwi8sHyqrRT7wGJb2IuGKJ92F25GVZITeYhz1CpPJdReRw5Yi1ux/Oo0kk8MCQZZTntWr86ucC9EUJK+5rkPiAz8BRLQK0q3x3iSwyYK0sXoxU/2OJiI89TQdwgNVrjLvaHs0Cfv8d1wtprc5Z2e6XwdZuQabv3xoJ91X0hMMn/783jA1nROSJeksKxO+IEFIgQzxtxDOMee2j7Ye0/cfN1Uq9hus7R2YvNKGvcrDvBqyjSTI9QYAyfkal8x5iTJXl3MYmrGhbO0Esc9jvwz06qEEfW4RneV3b/T6cFkwA+5XHwuCBiLCOrHOp36LtAViyzBJKuuis3jsFSvzwJsjo0nnOb+mgXPvaLn1wHLcL+Xq6B11rlvw+gRTXiZXJfS60M/q0WqusxDW2CypDtA1xxZrSLVfQ+hKlNoZSwEVB25S2Y66orhPgmmUKVigPNxyJ0LMoeDt7pYWR0KLBmX/XA0bMAxJV/5d5Xym6SSWw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95670477-12a2-436f-a509-08d88099019d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 08:09:52.2153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kv248lZOWdTC3HQJzXaOugxgDtX/BR/6W5LMjdIfrb1IxDamVpgWSosy3cS4nngkIp8QjD1g9e6v6q/EFezI0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some simple panels have dual LVDS interfaces which receive even and odd
pixels respectively, like 'nlt,nl192108ac18-02d' and 'koe,tx26d202vm0bwa'.
So, let's allow optional 'ports' property so that pixel order can be got
via drm_of_lvds_get_dual_link_pixel_order() if it's child nodes 'port@0'
and 'port@1' contain 'dual-lvds-even-pixels' and 'dual-lvds-odd-pixels'
properties respectively.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f9750b0..5ccb22b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -288,6 +288,7 @@ properties:
   backlight: true
   enable-gpios: true
   port: true
+  ports: true
   power-supply: true
 
 additionalProperties: false
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
