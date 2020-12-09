Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953F12D3D5E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B29E6E221;
	Wed,  9 Dec 2020 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130906E10B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 06:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR2B5zcl5I+q8O5wQnu6Wdz/x8ROf6IY5YzHz88iDMPG8N19y6kf70lBR1Akl4oKJE1Rvc3OveJACd9dndIVWNExjXbwJ0z1QIDgV1/uk2GYXPS5Ect15EcoL2uuhsXVQI+kheNN+nJ98r32tqKD6peRK7um54MwBER+VtUsaWhvxIUN6xEHoOPqV6gT5oLRk0b0uk/InmWdCEM52NGahCahQLLg49M182tI+pE80med7i0P4oRK6xE0UdPydpu98QdWvQMx5ue3083gZ35Kb9x4OhSg0OlQBsenj6MofgotVIwNNRPXJyvox2UgKwxUs4i1efTjtzoC4Y/lOtETng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlVIqCF3ResnuFKj8jDnBInEWttMi/afewLrFoCzYy4=;
 b=D7FOnCQ8qjzcYs2Mc9k+xOeu5TZH+2VSEVIqNiOtq2tFome2DueVuEs5ySH5j+934bgYCr+70l6WpqYPCkuhzMYm68NFHU/PC1pkYTP3uAeOj1kuHt2e3OiNGPbLE0al4o3geDZ4lDWGL8TCP7Gyc3BLJ7EB8Dmcpis+auKTJIXX1IGcu3j+h2VvFp/APEF0Vd2AWgYTUQxPgbtF50m3xxse1bFL3Z2rL11A+Ra63Dolfl3O8XWmwk/KlwqexFffWe4Gd5vtRwtwUnoi1WWtFNVF+fzueMDqz2NNRVeK0oxOvZBLMn6+F1IFd+Lu1PPvbitI+3zDvDJSJ854yL+VLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlVIqCF3ResnuFKj8jDnBInEWttMi/afewLrFoCzYy4=;
 b=fEUQU7RQI+WArBmlZ/GNwvM0GZV/4wfiMMe4KYdyJKfL527lCGriBfz6JhFGDwWSYiGHR1dXwhVpQ7C49aJ89mPwp+yiB/Cq5gnrKKmDNQTgk4zpgebcb+TlkHE5ZQ/nKCquvuPHEwZ2Nb5CSxI6P0VJO/pqeSw/uFCzrKERvAs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 06:33:12 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 06:33:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Wed,  9 Dec 2020 14:24:26 +0800
Message-Id: <1607495069-10946-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
References: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0148.apcprd06.prod.outlook.com
 (2603:1096:1:1f::26) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0148.apcprd06.prod.outlook.com (2603:1096:1:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 06:33:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa97d772-ec87-404b-5f87-08d89c0c4da5
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6144A1CD0F2072BB52382B5F98CC0@VI1PR04MB6144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ckiPI9h8cplZwygdNyDWwmzuNIvMKcthP3hxpFsxSW55Nd82vHYjDfk4fjmKpt+8BCyycF3D06cw77kkOCMvEAJLkYCLGTkhYtjBsHfmS3qhM4qaTaPWJ9LwUP/yxEWIhF5mhJVTYIChDpdAPPA6aaGDWvxYggplrGHcpVkzG3mAcqssY0VVtYqQhTy0QlLDJbvxlOlA7dhMog3FJvoW2yMfy6WRLC8D9Jjx67f87JFQVB1tpleLRTzA8K98D5gwR96wlaFuRkORQ0E06ERtCSDBuQYGVjTuSs7vo/Mvc/SAu+ON2D5nBv885lUiB4aJ+nuYMBF2nfZhEMjsWO4vS1ODuycHytwzhlVfb+PBJUmoC5gAjpZS6HQRQso9zd3i5KjvFIc8tWEDkKoY0p11naRv4yoAQFxAGEqOZFGBKt+TYog5Vsz5577CnYC53AttJEsSO8PCLsao5YDvfoywpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(2616005)(26005)(52116002)(5660300002)(186003)(16526019)(34490700003)(8936002)(8676002)(6486002)(66574015)(6666004)(66476007)(2906002)(7416002)(956004)(36756003)(6512007)(508600001)(66946007)(83380400001)(4326008)(6506007)(86362001)(66556008)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d2htanFNTUZGWm8rU0pjYUIrZUJORWV5THlQSnFXQ0J2c3AxQlE3N0llYlo2?=
 =?utf-8?B?NmhoL3ZjRXprME5WMmhTRkpIdXF2d25makhyNVI4L3FTbGRibTY2Lyt0NDE0?=
 =?utf-8?B?eWk1c2llTXA2NXQ3TzkrRU5MUUVROUwweDlha2RtNUJrWFJQb05HRGRQTng4?=
 =?utf-8?B?NHNnQkVhbFl2bmlxcDFFMFFja0ZkdW8wRXE0RFgrOXpKc0ZueU5wVVJzbXg5?=
 =?utf-8?B?ZmZvT25rN0oveklZdUx5bGdZU0pFTENGN2ZLQS9PVE5rdkNFNkloUnFwdmwy?=
 =?utf-8?B?WDFYamZ5U2FrVk90eW9mYXRkcHRVWVB1dDlKV1F5U0tqOC84L2kwSUxKbjEv?=
 =?utf-8?B?dXBSTUZVTHBuTHVVbzNrM1lOVkFRWXpnT0hZcWVRSU4xTHVQcHJXMU9xUVRo?=
 =?utf-8?B?WDl4WkUwYVFTQlIyNWtjRjJJZG9rSVRDNmJVZDBjOUppdjB6d1F2ckpMcHNO?=
 =?utf-8?B?ODFxUlB1M1NuY21Ga2dmM3hGMmtWUTN4YXJaTmlmbXpXTlliVmtNMUh5L2tw?=
 =?utf-8?B?WDZVY0FtRUNsRFg5bjZQdzBLSVJYcFNhZ3RtcGdOYmVJUHZ3SWxBKzg3clg2?=
 =?utf-8?B?dTdjT3U3REhHUXU0OE9CZTZ5TjkwUlkvWGwxR2pBZnFWWVpJMTlLcDNyZ3JW?=
 =?utf-8?B?T2xER0hTRjRQVWZUQ3J0TnJEcTI0OFpvVzZFNzNPWmJEc0JiYWxCeGg2SXZ3?=
 =?utf-8?B?aExLTEwyUGhwc0RqbFU4ck5mZEN0K0Yrc3VsdTE3UUhaWlBRdVZHZEdmUHBx?=
 =?utf-8?B?K1BVOWRMYlFEeUE3Z3R2bGNmajFheXJaNTBFZDcrSC9YTzdhVEJHU2Z4bnlI?=
 =?utf-8?B?eTU3bXpDeGRZZHVCTkE0bFNUWFFkOGhnS1dCQ3BqTVpFUXdMV1FTWHBkZXk1?=
 =?utf-8?B?Si94YzF2YzVKeVdMWGRDcTN2R3BpZTNrbE1IaS8vNjNBSEN3UUJOdUFNVG5x?=
 =?utf-8?B?Z1ZrU1RRdzQ4REdJYkwreTJEaEgyMHNERnU0UWl4bVJyZTlwS2s0RUxvZHRq?=
 =?utf-8?B?VjNqYmovT1lrTzB6VkdHRUR4TTZaMTVMOUtGaGV4VTlDaXYvNkYzam1YSzNU?=
 =?utf-8?B?OG9vTkZJT0FEWnQzSUZUbWk2QUJ3Qis4aHhaNzdJbmdCT3pFTUV5ajY3WENX?=
 =?utf-8?B?cmVIT3ZCSzRPNE14UjRzY3pnRmgvakJGUEJaQ1ViZTU4RGdLbDZpQ3FMWGdD?=
 =?utf-8?B?RWNSTmxrVnFON1MxQTRXTzVPeXErdzRTeHJucXdMdEREbVpPNVRJVkl0M2JK?=
 =?utf-8?B?Mi8rdTNRQXBHVU56cklleWdieGZkUEx2UkpCUHFPT2dLd2pJNkx4djZ3Q1Jk?=
 =?utf-8?Q?g/2XC/huPaUHhiyyau+zzrLoCrqZZ/oSz8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 06:33:12.7900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: aa97d772-ec87-404b-5f87-08d89c0c4da5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgTEC7ApeNUlHaFBAwqMfGR+avdiS/zROMyKI7rsCKbxrC9VXlpeu7fxySebPeBBb3T4DFaLiaWwcCO4D4MM/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPgotLS0KdjEtPnYyOgoqIE5ld2x5IGludHJv
ZHVjZWQgaW4gdjIuICAoR3VpZG8pCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVs
LG1pcGktZHNpLXBoeS50eHQgfCAyOSAtLS0tLS0tLS0KIC4uLi9iaW5kaW5ncy9waHkvbWl4ZWws
bWlwaS1kc2ktcGh5LnlhbWwgICAgICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVs
LG1pcGktZHNpLXBoeS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS55YW1sCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHku
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRz
aS1waHkudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5YjIzNDA3Li4wMDAwMDAw
MAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGkt
ZHNpLXBoeS50eHQKKysrIC9kZXYvbnVsbApAQCAtMSwyOSArMCwwIEBACi1NaXhlbCBEU0kgUEhZ
IGZvciBpLk1YOAotCi1UaGUgTWl4ZWwgTUlQSS1EU0kgUEhZIElQIGJsb2NrIGlzIGUuZy4gZm91
bmQgb24gaS5NWDggcGxhdGZvcm1zIChhbG9uZyB0aGUKLU1JUEktRFNJIElQIGZyb20gTm9ydGh3
ZXN0IExvZ2ljKS4gSXQgcmVwcmVzZW50cyB0aGUgcGh5c2ljYWwgbGF5ZXIgZm9yIHRoZQotZWxl
Y3RyaWNhbCBzaWduYWxzIGZvciBEU0kuCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBh
dGlibGU6IE11c3QgYmU6Ci0gIC0gImZzbCxpbXg4bXEtbWlwaS1kcGh5IgotLSBjbG9ja3M6IE11
c3QgY29udGFpbiBhbiBlbnRyeSBmb3IgZWFjaCBlbnRyeSBpbiBjbG9jay1uYW1lcy4KLS0gY2xv
Y2stbmFtZXM6IE11c3QgY29udGFpbiB0aGUgZm9sbG93aW5nIGVudHJpZXM6Ci0gIC0gInBoeV9y
ZWYiOiBwaGFuZGxlIGFuZCBzcGVjaWZpZXIgcmVmZXJyaW5nIHRvIHRoZSBEUEhZIHJlZiBjbG9j
awotLSByZWc6IHRoZSByZWdpc3RlciByYW5nZSBvZiB0aGUgUEhZIGNvbnRyb2xsZXIKLS0gI3Bo
eS1jZWxsczogbnVtYmVyIG9mIGNlbGxzIGluIFBIWSwgYXMgZGVmaW5lZCBpbgotICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3BoeS1iaW5kaW5ncy50eHQKLSAgdGhpcyBt
dXN0IGJlIDwwPgotCi1PcHRpb25hbCBwcm9wZXJ0aWVzOgotLSBwb3dlci1kb21haW5zOiBwaGFu
ZGxlIHRvIHBvd2VyIGRvbWFpbgotCi1FeGFtcGxlOgotCWRwaHk6IGRwaHlAMzBhMDAzMCB7Ci0J
CWNvbXBhdGlibGUgPSAiZnNsLGlteDhtcS1taXBpLWRwaHkiOwotCQljbG9ja3MgPSA8JmNsayBJ
TVg4TVFfQ0xLX0RTSV9QSFlfUkVGPjsKLQkJY2xvY2stbmFtZXMgPSAicGh5X3JlZiI7Ci0JCXJl
ZyA9IDwweDMwYTAwMzAwIDB4MTAwPjsKLQkJcG93ZXItZG9tYWlucyA9IDwmcGRfbWlwaTA+Owot
CQkjcGh5LWNlbGxzID0gPDA+OwotICAgICAgICB9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLmY4NjlmZDIKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGkt
ZHNpLXBoeS55YW1sCkBAIC0wLDAgKzEsNzMgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGh5L21peGVsLG1pcGktZHNpLXBoeS55YW1sIwor
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisK
K3RpdGxlOiBNaXhlbCBEU0kgUEhZIGZvciBpLk1YOAorCittYWludGFpbmVyczoKKyAgLSBHdWlk
byBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgorCitkZXNjcmlwdGlvbjogfAorICBUaGUgTWl4
ZWwgTUlQSS1EU0kgUEhZIElQIGJsb2NrIGlzIGUuZy4gZm91bmQgb24gaS5NWDggcGxhdGZvcm1z
IChhbG9uZyB0aGUKKyAgTUlQSS1EU0kgSVAgZnJvbSBOb3J0aHdlc3QgTG9naWMpLiBJdCByZXBy
ZXNlbnRzIHRoZSBwaHlzaWNhbCBsYXllciBmb3IgdGhlCisgIGVsZWN0cmljYWwgc2lnbmFscyBm
b3IgRFNJLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAt
IGZzbCxpbXg4bXEtbWlwaS1kcGh5CisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xv
Y2tzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2stbmFtZXM6CisgICAgaXRlbXM6CisgICAg
ICAtIGNvbnN0OiBwaHlfcmVmCisKKyAgYXNzaWduZWQtY2xvY2tzOgorICAgIG1heEl0ZW1zOiAx
CisKKyAgYXNzaWduZWQtY2xvY2stcGFyZW50czoKKyAgICBtYXhJdGVtczogMQorCisgIGFzc2ln
bmVkLWNsb2NrLXJhdGVzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgIiNwaHktY2VsbHMiOgorICAg
IGNvbnN0OiAwCisKKyAgcG93ZXItZG9tYWluczoKKyAgICBtYXhJdGVtczogMQorCityZXF1aXJl
ZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gY2xvY2tzCisgIC0gY2xvY2stbmFtZXMK
KyAgLSBhc3NpZ25lZC1jbG9ja3MKKyAgLSBhc3NpZ25lZC1jbG9jay1wYXJlbnRzCisgIC0gYXNz
aWduZWQtY2xvY2stcmF0ZXMKKyAgLSAiI3BoeS1jZWxscyIKKyAgLSBwb3dlci1kb21haW5zCisK
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2lteDhtcS1jbG9jay5oPgorICAgIGRwaHk6IGRwaHlA
MzBhMDAzMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDhtcS1taXBpLWRwaHkiOwor
ICAgICAgICByZWcgPSA8MHgzMGEwMDMwMCAweDEwMD47CisgICAgICAgIGNsb2NrcyA9IDwmY2xr
IElNWDhNUV9DTEtfRFNJX1BIWV9SRUY+OworICAgICAgICBjbG9jay1uYW1lcyA9ICJwaHlfcmVm
IjsKKyAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZjbGsgSU1YOE1RX0NMS19EU0lfUEhZX1JF
Rj47CisgICAgICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsayBJTVg4TVFfVklERU9f
UExMMV9PVVQ+OworICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyNDAwMDAwMD47Cisg
ICAgICAgICNwaHktY2VsbHMgPSA8MD47CisgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBnY19t
aXBpPjsKKyAgICB9OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
