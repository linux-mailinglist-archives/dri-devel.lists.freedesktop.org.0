Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766C82DDFC9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E78289C83;
	Fri, 18 Dec 2020 08:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4C6E235
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKGskBHPUbuFnz3PFdZCpdaq1wxeIlgMHIcz22SyOnu7fIQYO5W7YTY4KJE/8z+fL3HSIIVTABGap8ysZqPH+OZmm3w+hA5Y/zRuG5zz3h3vH2X1vpHC66lX74W2hA8h3fiW60lLgr0sYRBNo6OGtcEtHRWrHKXSwyHT09wVRZr8VmxoZinL+fIZCBGH6szrpglmiOITgNAs1VvHdWzafAovSaGTsVE89YDu7MX6U2j3TtXL7COwj+jvPkdEOHKltLCcPf+M4x1/zihCom3accVXq0G+HRyn+F/96lFN6E8Ov3fDIt9dTyBfgFaSsX789qg8PQxjFWfT/tmLIc03Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO88+r3w5wQcNVeJAOyeWfVCPvoyyC9zE3uIT7B2XzI=;
 b=eqPLCOjpyK/+eGrpq1Lu6DpELhpy3Du+S8FWsX8xiUD2kuj+w+lNa+BsBQ828EAJ0ptviBpgW3ErRR6PrJlYzIEm37DeyLpfkVoE8aPgFaoU/gvaiN7n+rsvDAmwjMj8UslRfWLfaYY5ZjBzAHWai/U5rrF3ku4juuP2nEKY8aGeEMWzOS8+kSRsXNWM5azwcCH8jKHK2vCzwWIeyHZ3bk2RRt3jyBFkD9XjOAT6JaiPBupOOpHqwlkh0+24wgmXtEZCzwwEbKiTg7yn+dDneRN6HbkssdnX7+jZqgHK9Sq69OJ2kIXVpMImuCHPuDFrRgmofWbtpdqxxmxOoQ1RWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO88+r3w5wQcNVeJAOyeWfVCPvoyyC9zE3uIT7B2XzI=;
 b=UrjZ4b0I5AVlI1E7xvP/gJ6n+PUCrognUzKo8zvcOR0TLxrlhmJFCK5ODqrPa8nkSdVvoBjFN3eu7AkbPMAb2m9fFS0vCY2xn1bdEHmMJDBuLFFKfv5N8zTl8M1+DIrIKRBVrxodYh6Ks+LsPnX1N4C26VmfkpO2L7KJ149vd2c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:09:09 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:09:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel link
 to DPI binding
Date: Thu, 17 Dec 2020 17:59:27 +0800
Message-Id: <1608199173-28760-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:09:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d68a29b-3f97-4bf7-e180-08d8a273cbad
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB731233099914E707D019A2D098C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ccfAcUWFo+gkBO+0jT7L7KsnN4gs6NVl4ZkzEGL5g2mWyd7utIOaWm7D/2yp1+iDcHItCnFBIFD9mSiI/B8VKjT4f6WyRtkNp0qKrmFUEbNSE9Bv0xfU5Ze8o6oxfiW6cJ3pvyIki3rayly3QvSNqzFXLXLlUL0ffQmp/ZTheL+fOPhY9suoyuCftYEEoGcOwPOJd15rbv/xzrgzF12Zn/5a0zRbV/bAQuwdc5JEDv+4Fx/hICEjLkdUGYYqUX6dv8KgvhcF2fVKAiPNJ1ULgCk2rrCNbtZWLUPAIWqiIw4He1JqOUUZg6n3JNz74vfzJxZFteLW85HYWPlCmhGOVWdNLigaT0vhGaHXB6UL3+LFjT5b6oPF8/A/fehuezMcbi7nClTtvICJNLEVNF8IMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(966005)(66946007)(5660300002)(6512007)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0pMWEFOeFpYUEYwZGlMV2ZXUEVLeGpoT3JmeEp6bjFqN1V2Um5IUEJRYlpo?=
 =?utf-8?B?b3FsNS9aT0JPQlBOcmFwUUtXY3pKS2pPU3FaeVRwaEZOWGUxM296L01OMTJm?=
 =?utf-8?B?cFBCRGRhNUd5UmxkS1preE5iK3VabmJ3Nm92U0lzSFluT3ljbE1yMDNYNG1K?=
 =?utf-8?B?TnJ0YklHS2tjVjFWc0FQNDVMWGJxTTRFejUwd25aa0pDam5yZUlyd1p6bmJz?=
 =?utf-8?B?aGtScEZlVmNtS0drUjEwRnRRWldCU2RnVjBzbENTNzhUQmt6T3F0ZC9ucTdP?=
 =?utf-8?B?cXBTTjU5SWVoYTVIL1ExMm5vZGNubWExSy83L2IxWlpNRVp0TUQyV1ZCWFNr?=
 =?utf-8?B?Q0Z6MDY2VVdvUVVOSEY0ekpieVNxR0RydjBZM1g4OThPV0hRVDZRUEZZR29R?=
 =?utf-8?B?L1puQnZ0Um9HOVN5WVFocFpTb25TY2RZZFVXaUFudGo2NERYUmJiUzllSWs0?=
 =?utf-8?B?YUJNbzQwT1d5VDRwOTErSlp4MTliSVFhMDdhVlUyV2drUUdBSnl6QURYZzRT?=
 =?utf-8?B?R08ybjloOCtnNW5FYlhHekZsUjlLVElndW1oYjBveUJjNXVXdlFOdWpYY1pZ?=
 =?utf-8?B?V3VsaFlNd2ZiUU1rRWM1c0FxUjZNRkk2ZmkwdzVXdG1LamtPRDd2bGk4T0N3?=
 =?utf-8?B?cXRsRURlV2FQNW5OWElIUXZEdEdGNmVKUVBtTHMvb1NwVGgwWm1wQy9RNVhM?=
 =?utf-8?B?SjUzUVJaMFM3YW1UMG9XeWxwZ3BnMW9YRldJR3QwQ2VtaXFQeWN1TndUM1Ns?=
 =?utf-8?B?aEFyR1U2MFpNNWw4cUFWSFRuY1oxblI3RUVFa0YybVlIa09MRUlPMk5HUlBE?=
 =?utf-8?B?enR4UUdMRGN2RnNERXUraVY3dVJIUmtnZkM0UHVkQXpvUnkzQ1VQTFM4MHNF?=
 =?utf-8?B?NlNteXFjckpBSncvUnNLRXFHUG5JYkpVYnBINHJBeWVhMmhJVXMvVjQ5RnZ2?=
 =?utf-8?B?U1hiSGVtdTREa2VTTldvL2tUcmxwdU12eFI5cURzZkVLSmRXMlphMUFpNTZO?=
 =?utf-8?B?MzVCY1BBWFhiMjVMbGdYcGJOcldsNTFnSzhYNi9odDFEbUVzbjJTUFRSWUxp?=
 =?utf-8?B?S1EzSVR6WUZZZWdOVW80ODZiT3NvaDY0Q3hkVFo5emc5NEU5MEwyQ2tDT3dL?=
 =?utf-8?B?bnJlbThtOExVNjV3bEpzdEc2VFdGQ2pEbkhDbmxCMXhwdExKaGRENEVBcmND?=
 =?utf-8?B?eHN4MEg2OUprUFd2NEUvUnJuL1ZGQ0lFakFkUTJuVCs3RDM2VFhIc3pvZ2pi?=
 =?utf-8?B?T08rM1Rwb2xOQTBaVThGYXZEazFBakE5VzZUbUdtNzlXQmlMcGZCVXFpTndL?=
 =?utf-8?Q?VGQ70BdGxSCUAWZKRlCW+EKXt3Bpe/q59L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:09:09.4074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d68a29b-3f97-4bf7-e180-08d8a273cbad
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szXd8oXmIyDwGRVwriGQ+l1toeDguwbtiZ3lVWYvyI4KXHKGKX5KJ1rt3Oc7HjzPUmyoybyilXaa67uOK3+I8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGJpbmRpbmdzIGZvciBpLk1YOHF4cCBwaXhlbCBsaW5rIHRvIERQSShQ
WEwyRFBJKS4KClNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+Ci0t
LQogLi4uL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCAgICAgICAgfCAx
MzQgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTM0IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhw
LXB4bDJkcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAuLjE2NDk2MjIKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55YW1s
CkBAIC0wLDAgKzEsMTM0IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCMK
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwor
Cit0aXRsZTogRnJlZXNjYWxlIGkuTVg4cXhwIFBpeGVsIExpbmsgdG8gRGlzcGxheSBQaXhlbCBJ
bnRlcmZhY2UKKworbWFpbnRhaW5lcnM6CisgIC0gTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNv
bT4KKworZGVzY3JpcHRpb246IHwKKyAgVGhlIEZyZWVzY2FsZSBpLk1YOHF4cCBQaXhlbCBMaW5r
IHRvIERpc3BsYXkgUGl4ZWwgSW50ZXJmYWNlKFBYTDJEUEkpCisgIGludGVyZmFjZXMgdGhlIHBp
eGVsIGxpbmsgMzYtYml0IGRhdGEgb3V0cHV0IGFuZCB0aGUgRFNJIGNvbnRyb2xsZXLigJlzCisg
IE1JUEktRFBJIDI0LWJpdCBkYXRhIGlucHV0LCBhbmQgaW5wdXRzIG9mIExWRFMgRGlzcGxheSBC
cmlkZ2UoTERCKSBtb2R1bGUKKyAgdXNlZCBpbiBMVkRTIG1vZGUsIHRvIHJlbWFwIHRoZSBwaXhl
bCBjb2xvciBjb2RpbmdzIGJldHdlZW4gdGhvc2UgbW9kdWxlcy4KKyAgVGhpcyBtb2R1bGUgaXMg
cHVyZWx5IGNvbWJpbmF0b3JpYWwuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAg
Y29uc3Q6IGZzbCxpbXg4cXhwLXB4bDJkcGkKKworICBwb3dlci1kb21haW5zOgorICAgIG1heEl0
ZW1zOiAxCisKKyAgZnNsLHN5c2NvbjoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy9waGFuZGxlCisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgIEEgcGhhbmRsZSB3
aGljaCBwb2ludHMgdG8gQ29udHJvbCBhbmQgU3RhdHVzIFJlZ2lzdGVycyhDU1IpIG1vZHVsZS4K
KworICBmc2wsY29tcGFuaW9uLXB4bDJkcGk6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvcGhhbmRsZQorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBBIHBoYW5k
bGUgd2hpY2ggcG9pbnRzIHRvIGNvbXBhbmlvbiBQWEwyRFBJIHdoaWNoIGlzIHVzZWQgYnkgZG93
bnN0cmVhbQorICAgICAgTFZEUyBEaXNwbGF5IEJyaWRnZShMREIpIGluIHNwbGl0IG1vZGUuCisK
KyAgcG9ydHM6CisgICAgdHlwZTogb2JqZWN0CisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgIEEg
bm9kZSBjb250YWluaW5nIFBYTDJEUEkgaW5wdXQgJiBvdXRwdXQgcG9ydCBub2RlcyB3aXRoIGVu
ZHBvaW50CisgICAgICBkZWZpbml0aW9ucyBhcyBkb2N1bWVudGVkIGluCisgICAgICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQKKyAg
ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50eHQKKworICAgIHBy
b3BlcnRpZXM6CisgICAgICAnI2FkZHJlc3MtY2VsbHMnOgorICAgICAgICBjb25zdDogMQorCisg
ICAgICAnI3NpemUtY2VsbHMnOgorICAgICAgICBjb25zdDogMAorCisgICAgICBwb3J0QDA6Cisg
ICAgICAgIHR5cGU6IG9iamVjdAorICAgICAgICBkZXNjcmlwdGlvbjogVGhlIFBYTDJEUEkgaW5w
dXQgcG9ydCBub2RlIGZyb20gcGl4ZWwgbGluay4KKworICAgICAgICBwcm9wZXJ0aWVzOgorICAg
ICAgICAgIHJlZzoKKyAgICAgICAgICAgIGNvbnN0OiAwCisKKyAgICAgICAgcmVxdWlyZWQ6Cisg
ICAgICAgICAgLSByZWcKKworICAgICAgcG9ydEAxOgorICAgICAgICB0eXBlOiBvYmplY3QKKyAg
ICAgICAgZGVzY3JpcHRpb246IFRoZSBQWEwyRFBJIG91dHB1dCBwb3J0IG5vZGUgdG8gZG93bnN0
cmVhbSBicmlkZ2UuCisKKyAgICAgICAgcHJvcGVydGllczoKKyAgICAgICAgICByZWc6CisgICAg
ICAgICAgICBjb25zdDogMQorCisgICAgICAgIHJlcXVpcmVkOgorICAgICAgICAgIC0gcmVnCisK
KyAgICByZXF1aXJlZDoKKyAgICAgIC0gIiNhZGRyZXNzLWNlbGxzIgorICAgICAgLSAiI3NpemUt
Y2VsbHMiCisgICAgICAtIHBvcnRAMAorICAgICAgLSBwb3J0QDEKKworICAgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcG93ZXIt
ZG9tYWlucworICAtIGZzbCxzeXNjb24KKyAgLSBwb3J0cworCithZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9m
aXJtd2FyZS9pbXgvcnNyYy5oPgorICAgIHB4bDJkcGkgeworICAgICAgICBjb21wYXRpYmxlID0g
ImZzbCxpbXg4cXhwLXB4bDJkcGkiOworICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZCBJTVhf
U0NfUl9NSVBJXzA+OworICAgICAgICBmc2wsc3lzY29uID0gPCZtaXBpX2x2ZHNfMF9jc3I+Owor
CisgICAgICAgIHBvcnRzIHsKKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgICAgIHBvcnRAMCB7CisgICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47CisgICAgICAgICAgICAgICAgcmVnID0gPDA+OworCisgICAgICAgICAgICAg
ICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9kY19waXhlbF9saW5rMDogZW5kcG9pbnRAMCB7CisgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVu
ZHBvaW50ID0gPCZkY19waXhlbF9saW5rMF9taXBpX2x2ZHNfMF9weGwyZHBpPjsKKyAgICAgICAg
ICAgICAgICB9OworCisgICAgICAgICAgICAgICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9kY19waXhl
bF9saW5rMTogZW5kcG9pbnRAMSB7CisgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47Cisg
ICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRjX3BpeGVsX2xpbmsxX21p
cGlfbHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICB9Owor
CisgICAgICAgICAgICBwb3J0QDEgeworICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+OworICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICAgICAgICAg
IHJlZyA9IDwxPjsKKworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfbWlwaV9s
dmRzXzBfbGRiX2NoMDogZW5kcG9pbnRAMCB7CisgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
PjsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2x2ZHNfMF9s
ZGJfY2gwX21pcGlfbHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisKKyAgICAg
ICAgICAgICAgICBtaXBpX2x2ZHNfMF9weGwyZHBpX21pcGlfbHZkc18wX2xkYl9jaDE6IGVuZHBv
aW50QDEgeworICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47CisgICAgICAgICAgICAgICAg
ICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9sdmRzXzBfbGRiX2NoMV9taXBpX2x2ZHNfMF9w
eGwyZHBpPjsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAgfTsKKyAgICAgICAgfTsK
KyAgICB9OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
