Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD52D7180
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E1E6ECD2;
	Fri, 11 Dec 2020 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35B16E7E5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 01:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeqa9t6cyyLs1h0UsNZieskfIMQXCO53tZa4u7moS1DenvX8zUkY8YuxQb4eWWzSHE33UHTvMXe/Q4l9kluEnkvRhnyxHBXkIE9g6tdIWC88IE56MlMyNDicKpi7Oe/Y7Yeyg1jncZhm1dl/y5D1vbkUu9ZG/30EouFnx4HyWfm6sKGGQ56zT6+xVW4xJIxeyYw3b10gSK5NuBz6Edr04lHJExBcPmqFYpO3aLTUNBvsqFYVSpwyWjaFZ/NMNA/vurgvfkGXOpO071FlMj6YUAWtzCPCEoZ6dN7rAyCY1+g08jnpC/i2rsTDhh3XF6hlWv0aMc5BZM1YvzSq4AA99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTQt44M7XtQAFncnJe3Nu7zGVUbs8IkzfxqUDT1dzsg=;
 b=Vcw52Zhk2FOJ0Entnd+oazF8ImRTKO35cr/n+4Q1yQqJ8zP+qp2f4P+JIWgFUjyDUOnukVjwQFiodqZkM11OfHpJpLRnmgXBPPId7iphyfPoY508s5i/6AgHEVUl6Y83qbcRIoBKVcegVxnKv/1vXrJQ4Ak46PZxuLjTHY//Of3XpY2JNWSeO0djiUtQXY+JiiuLpR98pttnRtJWEGBaX72po8Rvv/sq+LfOson8o6P7GZ+U913uLtV7pLJr/OTJngFayM+mPh+YNarV02WQ5BV85KoVIly9wvc+c7hGQTTF1VEqgGSjA78kDJsEWfZ5JC8T4a4PyklEnwGn1o+AvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTQt44M7XtQAFncnJe3Nu7zGVUbs8IkzfxqUDT1dzsg=;
 b=XRIF0+BqoDxUf6es3/7+2p6xUV3dHlQp+CAbmjgXG0nzdIFmn5jQ4A6xAsAsuA2urVs87Wg8Fs43t98wA38vfyTio995Iykp1GSWvUJZUUFrlU1g2yKOve3etqkNbgxMQA2FGZ1P3M3Tbq+CoEvelyiQWCN5yenTSU0vFA7fJ2M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3952.eurprd04.prod.outlook.com (2603:10a6:803:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 01:55:00 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 01:55:00 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Fri, 11 Dec 2020 09:46:20 +0800
Message-Id: <1607651182-12307-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.5 via Frontend Transport; Fri, 11 Dec 2020 01:54:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37b54dbb-0972-4232-5a68-08d89d77c4f8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3952EE6F7EC4F47DF010EF6C98CA0@VI1PR0402MB3952.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HqGe4yEyb95kbPCMzzwXCTNT5wu5zZz4KhXxHYrRmMyZc6ZifTY4Va/3DlFFHUyrgTPIRkh+XNryBXaiu+3/SI7hxGr3I3xypRiAMPLqqHo1M7hKCw0YULkaKarPBdnZa4Aw5jS88p8iTWgHn6N21fqq4tuNIBGYIvvVrNX8pecwC9rw9Wz+u0Na5fPlgBHCiQLCulF1Ke0B5lrfB+1PYqXW/BHAzNt81DZloapHzGMxEEGa7hWasJCwIvOQbljxVzYmC3G+xnZn9NZg4RoS2MjHg583LCcRGg9RhINIESgSSRS5C2YuLJJxwT4oWiOcJ7CRDJooL9Kl5jBSDOLbGxuPpBwBQWBMKA+sBUUeaEEm3b4FjRQ11RGk5pBbgEK9wpZVsdHe4Otq8f8SDWbFEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(52116002)(316002)(956004)(2616005)(5660300002)(66556008)(4326008)(66476007)(2906002)(66946007)(6512007)(7416002)(8676002)(16526019)(26005)(186003)(8936002)(6486002)(36756003)(478600001)(966005)(86362001)(6666004)(6506007)(83380400001)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c0VqaUtUYThCd3RjNmJnU2lVeUtSMDFQRE9mdGtzS3NCTWhjNjRWdWVDcVZs?=
 =?utf-8?B?YzVtNkpYdDFrZjZ0cjA5SlFRN2lBMW03N3VaM2I2NDdjeWM4RHBlb0swKytG?=
 =?utf-8?B?ZlFzSjQ2bHY3NXNQU0FNSy9XWnlUcVJ4azJxbEVQdi9kMC9VV1RFSTIyU0d0?=
 =?utf-8?B?eU11Q05iTjI2dXpnbXlCQVVyeGdrWjBvR1BWN3YwQTlBUGdkODlmckMvQlJL?=
 =?utf-8?B?dGV4TTF2ck9Md05rU1VSditLSTB5YXVKR3E1NWdYOVl1MEJ3M3dXMitnaCt4?=
 =?utf-8?B?dy96bGxlYUFjOWx4cndReVRqNjdzQUQwUVJ6R0NJcVZGSGo2MTR0QTU4VFVF?=
 =?utf-8?B?Q2xpZ1k2bFRvSDRGeUh2YnNsZVR3aE11a25nQVpFa0JtYythK0pFMFJRZjl5?=
 =?utf-8?B?U05MRm5xcHJSbzV2ekV3RnkzemRLbmc3S3BtWlJrcWs0Umx4Qjk2R3NmRk9E?=
 =?utf-8?B?aVlmK3I4ZFV6RExmcFIwZit5MVFsMnRNbWt3Y0VReGZjamQ1YVArelJRRUcz?=
 =?utf-8?B?c0c3N1NBQnpPeTNURkRCR2VPTTJqRlRYWGtqaTY3YTYwa1F4VmU3eFVhd25E?=
 =?utf-8?B?OUZXeVpJZFErSWliREpGanNQZTBqcnAwODliaklRQWNoTUlZVjdRYVBNdFdI?=
 =?utf-8?B?eW10YU8yalY3SmNidzVTcWMvZzBqYXRIRmZBMlcra29pQXhzemx6b1diYUpU?=
 =?utf-8?B?ZlY5REcxQmU1SWttejBvMEVjMERCZmd0L0RwYlB3WHRMZEI3NGhEaDZoRFhV?=
 =?utf-8?B?ZEI4TmpzZWZneDQzbnM0cnZpYTNlZGhmc1JYYWJUOFJWSHY4dmJ2dDBwRERV?=
 =?utf-8?B?ZWRVbFVadjRmeUFlNEM1alN2aXBlUncxaGRxOTFadGtSSnhSTklyVUM0ekc3?=
 =?utf-8?B?T0pUT01jdzNRblh1RE50QS84bjdxMmR6Q2Z5cG1xYS9Mbm8zTCt6ams5dDN6?=
 =?utf-8?B?UmdZY2pSc1FwbVhZZ29KOTFKbGNHTEtsd2lTM2VPSDMzQlFHV3B3dTRYVFFx?=
 =?utf-8?B?SHZ2ci9GRzEydE8xODZlbDFnZlFSY3k1TFVlSVRndW9mOHErRnlQY01nNG1u?=
 =?utf-8?B?Z2FiaUFKTml4VDRud1B5cG1aNmltREdtU0ZzaGNHeTE5aGhQWGtoSjlmMDJt?=
 =?utf-8?B?ZVZpR2V0VW5BYUhDSEd3OE1uMU9jdEQya3lzdEFjdGM1SlhrWW5IVm1Sa0tL?=
 =?utf-8?B?M0RVS29Ob1VVcnhzb0hyeWNMWTlUSzhmK2pFcS95Y2xzeVVkNWszYml6aHhL?=
 =?utf-8?B?WXVHay90SlpBOTdKUkFhUzA0QXhDMlg0bHFaUVpTK0VCL1Z0Z2pVaFBtUnEy?=
 =?utf-8?Q?/83tZXoh8+a4xMj0hwFMNGW4K5Ixl1tWCG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 01:55:00.2885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b54dbb-0972-4232-5a68-08d89d77c4f8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xr1zB7tatXcVZIsVsDzWPvJ17BHqe/GpkUeYAQVaQCFpd2WLdjby0z8s7ENxPAAv770PNsQQ0qJTbswgD58ahA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3952
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBjb252ZXJ0cyB0aGUgbWl4ZWwsbWlwaS1kc2ktcGh5IGJpbmRpbmcgdG8KRFQg
c2NoZW1hIGZvcm1hdCB1c2luZyBqc29uLXNjaGVtYS4KCkNvbXBhcmluZyB0byB0aGUgcGxhaW4g
dGV4dCB2ZXJzaW9uLCB0aGUgbmV3IGJpbmRpbmcgYWRkcwp0aGUgJ2Fzc2lnbmVkLWNsb2Nrcycs
ICdhc3NpZ25lZC1jbG9jay1wYXJlbnRzJyBhbmQKJ2Fzc2lnbmVkLWNsb2NrLXJhdGVzJyBwcm9w
ZXJpdGVzLCBvdGhlcndpc2UgJ21ha2UgZHRic19jaGVjaycKd291bGQgY29tcGxhaW4gdGhhdCB0
aGVyZSBhcmUgbWlzLW1hdGNoZXMuICBBbHNvLCB0aGUgbmV3CmJpbmRpbmcgcmVxdWlyZXMgdGhl
ICdwb3dlci1kb21haW5zJyBwcm9wZXJ0eSBzaW5jZSBhbGwgcG90ZW50aWFsClNvQ3MgdGhhdCBl
bWJlZCB0aGlzIFBIWSB3b3VsZCBwcm92aWRlIGEgcG93ZXIgZG9tYWluIGZvciBpdC4KVGhlIGV4
YW1wbGUgb2YgdGhlIG5ldyBiaW5kaW5nIHRha2VzIHJlZmVyZW5jZSB0byB0aGUgbGF0ZXN0CmRw
aHkgbm9kZSBpbiBpbXg4bXEuZHRzaS4KCkNjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUu
b3JnPgpDYzogS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4KQ2M6IFZpbm9k
IEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwu
b3JnPgpDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgpTaWduZWQtb2ZmLWJ5
OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPgotLS0KdjItPnYzOgoqIEltcHJvdmUgdGhl
ICdjbG9jay1uYW1lcycgcHJvcGVydHkgYnkgZHJvcHBpbmcgJ2l0ZW1zOicuCgp2MS0+djI6Ciog
TmV3bHkgaW50cm9kdWNlZCBpbiB2Mi4gIChHdWlkbykKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4dCB8IDI5IC0tLS0tLS0tLQogLi4uL2JpbmRpbmdz
L3BoeS9taXhlbCxtaXBpLWRzaS1waHkueWFtbCAgICAgICAgICAgfCA3MiArKysrKysrKysrKysr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1p
cGktZHNpLXBoeS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21p
eGVsLG1pcGktZHNpLXBoeS50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDliMjM0
MDcuLjAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
bWl4ZWwsbWlwaS1kc2ktcGh5LnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDI5ICswLDAgQEAKLU1p
eGVsIERTSSBQSFkgZm9yIGkuTVg4Ci0KLVRoZSBNaXhlbCBNSVBJLURTSSBQSFkgSVAgYmxvY2sg
aXMgZS5nLiBmb3VuZCBvbiBpLk1YOCBwbGF0Zm9ybXMgKGFsb25nIHRoZQotTUlQSS1EU0kgSVAg
ZnJvbSBOb3J0aHdlc3QgTG9naWMpLiBJdCByZXByZXNlbnRzIHRoZSBwaHlzaWNhbCBsYXllciBm
b3IgdGhlCi1lbGVjdHJpY2FsIHNpZ25hbHMgZm9yIERTSS4KLQotUmVxdWlyZWQgcHJvcGVydGll
czoKLS0gY29tcGF0aWJsZTogTXVzdCBiZToKLSAgLSAiZnNsLGlteDhtcS1taXBpLWRwaHkiCi0t
IGNsb2NrczogTXVzdCBjb250YWluIGFuIGVudHJ5IGZvciBlYWNoIGVudHJ5IGluIGNsb2NrLW5h
bWVzLgotLSBjbG9jay1uYW1lczogTXVzdCBjb250YWluIHRoZSBmb2xsb3dpbmcgZW50cmllczoK
LSAgLSAicGh5X3JlZiI6IHBoYW5kbGUgYW5kIHNwZWNpZmllciByZWZlcnJpbmcgdG8gdGhlIERQ
SFkgcmVmIGNsb2NrCi0tIHJlZzogdGhlIHJlZ2lzdGVyIHJhbmdlIG9mIHRoZSBQSFkgY29udHJv
bGxlcgotLSAjcGh5LWNlbGxzOiBudW1iZXIgb2YgY2VsbHMgaW4gUEhZLCBhcyBkZWZpbmVkIGlu
Ci0gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWJpbmRpbmdzLnR4
dAotICB0aGlzIG11c3QgYmUgPDA+Ci0KLU9wdGlvbmFsIHByb3BlcnRpZXM6Ci0tIHBvd2VyLWRv
bWFpbnM6IHBoYW5kbGUgdG8gcG93ZXIgZG9tYWluCi0KLUV4YW1wbGU6Ci0JZHBoeTogZHBoeUAz
MGEwMDMwIHsKLQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OG1xLW1pcGktZHBoeSI7Ci0JCWNsb2Nr
cyA9IDwmY2xrIElNWDhNUV9DTEtfRFNJX1BIWV9SRUY+OwotCQljbG9jay1uYW1lcyA9ICJwaHlf
cmVmIjsKLQkJcmVnID0gPDB4MzBhMDAzMDAgMHgxMDA+OwotCQlwb3dlci1kb21haW5zID0gPCZw
ZF9taXBpMD47Ci0JCSNwaHktY2VsbHMgPSA8MD47Ci0gICAgICAgIH07CmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRz
aS1waHkueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uYzM0ZjJlNgot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
bWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwKQEAgLTAsMCArMSw3MiBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0t
LQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waHkvbWl4ZWwsbWlwaS1kc2kt
cGh5LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKKwordGl0bGU6IE1peGVsIERTSSBQSFkgZm9yIGkuTVg4CisKK21haW50YWluZXJz
OgorICAtIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CisKK2Rlc2NyaXB0aW9uOiB8
CisgIFRoZSBNaXhlbCBNSVBJLURTSSBQSFkgSVAgYmxvY2sgaXMgZS5nLiBmb3VuZCBvbiBpLk1Y
OCBwbGF0Zm9ybXMgKGFsb25nIHRoZQorICBNSVBJLURTSSBJUCBmcm9tIE5vcnRod2VzdCBMb2dp
YykuIEl0IHJlcHJlc2VudHMgdGhlIHBoeXNpY2FsIGxheWVyIGZvciB0aGUKKyAgZWxlY3RyaWNh
bCBzaWduYWxzIGZvciBEU0kuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51
bToKKyAgICAgIC0gZnNsLGlteDhtcS1taXBpLWRwaHkKKworICByZWc6CisgICAgbWF4SXRlbXM6
IDEKKworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9jay1uYW1lczoKKyAgICBj
b25zdDogcGh5X3JlZgorCisgIGFzc2lnbmVkLWNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisg
IGFzc2lnbmVkLWNsb2NrLXBhcmVudHM6CisgICAgbWF4SXRlbXM6IDEKKworICBhc3NpZ25lZC1j
bG9jay1yYXRlczoKKyAgICBtYXhJdGVtczogMQorCisgICIjcGh5LWNlbGxzIjoKKyAgICBjb25z
dDogMAorCisgIHBvd2VyLWRvbWFpbnM6CisgICAgbWF4SXRlbXM6IDEKKworcmVxdWlyZWQ6Cisg
IC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGNsb2NrcworICAtIGNsb2NrLW5hbWVzCisgIC0g
YXNzaWduZWQtY2xvY2tzCisgIC0gYXNzaWduZWQtY2xvY2stcGFyZW50cworICAtIGFzc2lnbmVk
LWNsb2NrLXJhdGVzCisgIC0gIiNwaHktY2VsbHMiCisgIC0gcG93ZXItZG9tYWlucworCithZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay9pbXg4bXEtY2xvY2suaD4KKyAgICBkcGh5OiBkcGh5QDMwYTAw
MzAgeworICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4bXEtbWlwaS1kcGh5IjsKKyAgICAg
ICAgcmVnID0gPDB4MzBhMDAzMDAgMHgxMDA+OworICAgICAgICBjbG9ja3MgPSA8JmNsayBJTVg4
TVFfQ0xLX0RTSV9QSFlfUkVGPjsKKyAgICAgICAgY2xvY2stbmFtZXMgPSAicGh5X3JlZiI7Cisg
ICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElNWDhNUV9DTEtfRFNJX1BIWV9SRUY+Owor
ICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGsgSU1YOE1RX1ZJREVPX1BMTDFf
T1VUPjsKKyAgICAgICAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjQwMDAwMDA+OworICAgICAg
ICAjcGh5LWNlbGxzID0gPDA+OworICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZ2NfbWlwaT47
CisgICAgfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
