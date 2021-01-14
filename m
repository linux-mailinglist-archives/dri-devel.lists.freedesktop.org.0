Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38522F74B6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75B6E175;
	Fri, 15 Jan 2021 08:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30061.outbound.protection.outlook.com [40.107.3.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7842A6E151
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzga4Xhgaymg6drRoGZHaTA/6FY4Tc/c6hlzaBATf90Zo61MMzRmx5CbN3+CbLn/FJuM3pwm4w+6Vt+FuSV0pHZfP7l9EzCbD57Nx3vCMWmYpkKbv5odMvDhzRuYG/YAzCfErf/bXZ+/H7XsvR3yAJ91u41Qp6VTMaCIvZ14HkcIH9c7UxYKGEPodZFuYMDBiJiZvbjSg2ay6xeK7sNpKuqYp1zxr8IdQIJrlLs7BoGw6Eqeb8tDCT+OwUebZQJ1C0ueOUOrio+gunZIc1zJgEjM4KCy4qUMRLylh1klCLx+Av3v/WoUxHggQOqTU+Jn14ghspsEiN7GL9qzyjhrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTOzNP8NBExAJRfNou1dF7hyS83k/IpoZqyxOlBCWhc=;
 b=WEf5MiNeDUGtM6JMHC24tKIJygDPBHfPlJhoQ3U8xJpLIIImeNSbmn+BgxihlOgJ9gSgf6KoL4W0E0Z5oqXsmuLPg26KS5LB8BpItFME/CnyGWeQIR5HNrx7kfixqT4e1cCEV47cEEQz0P0NwO8zNTvaVESfe/1PvL1g+POOW9/zV7A6rdsTHFGQeNSqWFsecVBg7WChHt6EjH9y92+DRaf8goGKH1//SEznSk0wrqqkF86dN3vYYRv4Qot5yDbzZPkLEFpem0Js0fM70b/aWxxSc2k12wYC1b7I9Ek5XwAdxXYRT6fUp5hf5Q2PwEp+FvFBKl8/IUsXoVXrvy/JLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTOzNP8NBExAJRfNou1dF7hyS83k/IpoZqyxOlBCWhc=;
 b=plx973pv5Zkuc2YPmXQGBUYN0srfmkJ5c/nSznpQ8RGkgiwJ7vQit5zFtAPVEMjvo7NEKfveowIORt1bxvZgaONkE5pfleTGImglYqOP2hd97UFjly4LqRcAzEoatzgnB0QQKjZLidvoPw+mopPx9jUSfelNxUnPKtnzz2SB6YM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:33:17 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Thu, 14 Jan 2021 17:22:06 +0800
Message-Id: <1610616132-8220-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:33:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78001afa-c39e-466f-420c-08d8b86f6cac
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB571033407E2D82439A738B2F98A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dAcbznybTU/XoNpgfJggpq3E0Dl+FoPI1KOPUbK4/SDV3+JjcHdc+mNsKUlmTQY49EOtIuKLIkGCEdvXN4CLg3Bd1XEb830m7eS8J1nXncwpDUjm6WcSNAVvuuNS64K0Y5vK+gBqFQdMpcAF4i25cNIPlvCZCcQxtway73EYoATBQkxmm4uCokfloNlQUIxnC5znMiuGPymcxbq4X2ll/l8wisd3i3iU2Q3DVcQ/6ppiWgrIFCd4b9Rt3CMzLvwQgHNYS9yu6XQoWN++527gfHXb292eA9mb+nvc1eSsBabPwXOrrmQEF0dhpUZV/f7ehJ6Y9ByAoQMYhbMgjj7kfrTsVfpjm28NJSBIm73TSrg6Dh2mcIUdS8dVll683z8Y/GRxaScAXs1q5kXP/P6T7bdCIBd9qWYDik4ZHaymEsbFI1xrSVPOkKbvolAwphyHPwm3yj9bA2ROXL28jyUuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(2616005)(7416002)(86362001)(4326008)(316002)(966005)(5660300002)(186003)(52116002)(2906002)(66946007)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SlVKS2hNRnBZVUFWamZGQ1FtaVdIdTVQMlZISHRsMlR2U0Fia01IRW1YM1do?=
 =?utf-8?B?U0RtM21rKytyUURHYkJnTVdsdGdST3F2NHBrZXNkejRHeTFNenoyaUxVaUZH?=
 =?utf-8?B?L2FtZUhmTWxya3owSmMyZHlhYmhOVFBQKzFrck1SaGYwb0JTdkpZMm5xY1NC?=
 =?utf-8?B?eCtwZDBsSER4dTdyTkhCNVZpRzk4ZTdQTWxkWm91Nk51SEp1VFRIUWhnNUNY?=
 =?utf-8?B?RXFaYTJqWEFIQWRDUEY4a1p3NWZTNUNlYVJuSFRVU1p3RjJwS08rRStmQWJ2?=
 =?utf-8?B?RHViNldNUmd3dnREbFRHSE5WbjN2dVZRSnNXYTI0eTNEaW1GVGJHRjNiZ2lF?=
 =?utf-8?B?VmpJMVc3QVNIS1VZTDhFSGgwT1F2dy9xNFN5MVk2QmZiSlZCR1RBT0wzejV4?=
 =?utf-8?B?eWpjd2J4UDNqbTQzdDVCNXZkQnRRNnBrWnpKYmhBQlZvT2NrTC90Kzh3dUE0?=
 =?utf-8?B?UTRIcExRenVqNzNFNFdiYkpxN29JZkhCeElZa0hMUXE2emxlL0JpbjI4UmVp?=
 =?utf-8?B?VDRMdm4wdzJ2Z293dGxTcDlOaEdjWjNUcFRFTTF5QXh2UW85SVkvVm5qNld4?=
 =?utf-8?B?R1ZWazMyY1VZVklGeWlaTm5yM3NjeFhmZGZZYVVNU0VVeC8zdG95NmlTR0tH?=
 =?utf-8?B?R01iVGtiWjUwaXRXN1hobWIvTE5CSjhUOXZpSWljd0pyL003cnhydnZERHN1?=
 =?utf-8?B?bjV3Rm9oSFdSR0R5WHcvWlFDc0hHb1V2U21yNU5wUFFlWWh3SUYvL0VSVFZu?=
 =?utf-8?B?UEI4enZDM1pjV0NYYmpCS28wV1RNcFZRRlpRTnoxaHFhT1c3MzB5ZENaU2N6?=
 =?utf-8?B?blNsQlJpUjRTNDdCYkw2RWdIWitDOExMai9IamtXU0NtaFE1OHZWN3I0VU9m?=
 =?utf-8?B?OFRpTVJCaVE1N3pIYzdodVRNU2V3d2R3NmZSVk05c3AzOXhadUdzcmhVeFRQ?=
 =?utf-8?B?N1FEL0RWYUJhZXhlNGxDKzY4WDBpNTlrN2dRRGoydjJvRVVxSnVFdGtsOFVw?=
 =?utf-8?B?Ylg5bEEyTFNlOHN3TG1HU2VvRzVPSmdubWVOemI1ampLWmJtTXJ1MmprRHZi?=
 =?utf-8?B?OGJONUJlQWtpZkNjZ3owS1ZObzJQWEdPOWJuTklDeHpEbkVkbXFPTFhBSU5i?=
 =?utf-8?B?TzRSYnFVZ01udUZaVWt5ZVdLRktlenkzemg1STBuUnhUQis2NEhVT0tNSUJB?=
 =?utf-8?B?TXQxeFhQTlFqbnJYL2piNzBqNzh0MHZuZ0ZGNmU4ektEL0xVMXpZVCt0ZVZ4?=
 =?utf-8?B?YTlmNHZ6Z0hPdzdQeGNBK0RwVFlKYzlUMG1uRUtQQVQvRWgrU3ptaGI4WFJW?=
 =?utf-8?Q?iCHOL4goIZr4g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:17.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 78001afa-c39e-466f-420c-08d8b86f6cac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+gVc6I2CTiL7TIN5njHJXr98zQsuDw8tpKAFJbC5NETdS0QGz+m31XbSmALpIOpd194UfnV4oLFC1PIvvGGDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
LQp2MS0+djI6CiogVXNlIGdyYXBoIHNjaGVtYS4gKExhdXJlbnQpCgogLi4uL2Rpc3BsYXkvYnJp
ZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCAgICAgICAgfCAxMDUgKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNs
LGlteDhxeHAtcHhsMmRwaS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4
cC1weGwyZHBpLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLjE4Nzgy
NGUKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55YW1sCkBAIC0wLDAgKzEsMTA1IEBA
CisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rp
c3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRnJlZXNjYWxl
IGkuTVg4cXhwIFBpeGVsIExpbmsgdG8gRGlzcGxheSBQaXhlbCBJbnRlcmZhY2UKKworbWFpbnRh
aW5lcnM6CisgIC0gTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KKworZGVzY3JpcHRpb246
IHwKKyAgVGhlIEZyZWVzY2FsZSBpLk1YOHF4cCBQaXhlbCBMaW5rIHRvIERpc3BsYXkgUGl4ZWwg
SW50ZXJmYWNlKFBYTDJEUEkpCisgIGludGVyZmFjZXMgdGhlIHBpeGVsIGxpbmsgMzYtYml0IGRh
dGEgb3V0cHV0IGFuZCB0aGUgRFNJIGNvbnRyb2xsZXLigJlzCisgIE1JUEktRFBJIDI0LWJpdCBk
YXRhIGlucHV0LCBhbmQgaW5wdXRzIG9mIExWRFMgRGlzcGxheSBCcmlkZ2UoTERCKSBtb2R1bGUK
KyAgdXNlZCBpbiBMVkRTIG1vZGUsIHRvIHJlbWFwIHRoZSBwaXhlbCBjb2xvciBjb2RpbmdzIGJl
dHdlZW4gdGhvc2UgbW9kdWxlcy4KKyAgVGhpcyBtb2R1bGUgaXMgcHVyZWx5IGNvbWJpbmF0b3Jp
YWwuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGZzbCxpbXg4cXhw
LXB4bDJkcGkKKworICBwb3dlci1kb21haW5zOgorICAgIG1heEl0ZW1zOiAxCisKKyAgZnNsLHN5
c2NvbjoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxl
CisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgIEEgcGhhbmRsZSB3aGljaCBwb2ludHMgdG8gQ29u
dHJvbCBhbmQgU3RhdHVzIFJlZ2lzdGVycyhDU1IpIG1vZHVsZS4KKworICBmc2wsY29tcGFuaW9u
LXB4bDJkcGk6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhh
bmRsZQorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBBIHBoYW5kbGUgd2hpY2ggcG9pbnRzIHRv
IGNvbXBhbmlvbiBQWEwyRFBJIHdoaWNoIGlzIHVzZWQgYnkgZG93bnN0cmVhbQorICAgICAgTFZE
UyBEaXNwbGF5IEJyaWRnZShMREIpIGluIHNwbGl0IG1vZGUuCisKKyAgcG9ydHM6CisgICAgJHJl
ZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cworCisgICAgcHJvcGVydGll
czoKKyAgICAgIHBvcnRAMDoKKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJv
cGVydGllcy9wb3J0CisgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgUFhMMkRQSSBpbnB1dCBwb3J0
IG5vZGUgZnJvbSBwaXhlbCBsaW5rLgorCisgICAgICBwb3J0QDE6CisgICAgICAgICRyZWY6IC9z
Y2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAorICAgICAgICBkZXNjcmlwdGlvbjog
VGhlIFBYTDJEUEkgb3V0cHV0IHBvcnQgbm9kZSB0byBkb3duc3RyZWFtIGJyaWRnZS4KKworICAg
IHJlcXVpcmVkOgorICAgICAgLSBwb3J0QDAKKyAgICAgIC0gcG9ydEAxCisKK3JlcXVpcmVkOgor
ICAtIGNvbXBhdGlibGUKKyAgLSBwb3dlci1kb21haW5zCisgIC0gZnNsLHN5c2NvbgorICAtIHBv
cnRzCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8Cisg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Zpcm13YXJlL2lteC9yc3JjLmg+CisgICAgcHhsMmRw
aSB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtcHhsMmRwaSI7CisgICAgICAg
IHBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01JUElfMD47CisgICAgICAgIGZzbCxzeXNj
b24gPSA8Jm1pcGlfbHZkc18wX2Nzcj47CisKKyAgICAgICAgcG9ydHMgeworICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKwor
ICAgICAgICAgICAgcG9ydEAwIHsKKyAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsKKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgICAgICAgICBy
ZWcgPSA8MD47CisKKyAgICAgICAgICAgICAgICBtaXBpX2x2ZHNfMF9weGwyZHBpX2RjX3BpeGVs
X2xpbmswOiBlbmRwb2ludEAwIHsKKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+OworICAg
ICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRjX3BpeGVsX2xpbmswX21pcGlf
bHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisKKyAgICAgICAgICAgICAgICBt
aXBpX2x2ZHNfMF9weGwyZHBpX2RjX3BpeGVsX2xpbmsxOiBlbmRwb2ludEAxIHsKKyAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwxPjsKKyAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRw
b2ludCA9IDwmZGNfcGl4ZWxfbGluazFfbWlwaV9sdmRzXzBfcHhsMmRwaT47CisgICAgICAgICAg
ICAgICAgfTsKKyAgICAgICAgICAgIH07CisKKyAgICAgICAgICAgIHBvcnRAMSB7CisgICAgICAg
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47CisgICAgICAgICAgICAgICAgcmVnID0gPDE+OworCisgICAgICAgICAgICAgICAg
bWlwaV9sdmRzXzBfcHhsMmRwaV9taXBpX2x2ZHNfMF9sZGJfY2gwOiBlbmRwb2ludEAwIHsKKyAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDA+OworICAgICAgICAgICAgICAgICAgICByZW1vdGUt
ZW5kcG9pbnQgPSA8Jm1pcGlfbHZkc18wX2xkYl9jaDBfbWlwaV9sdmRzXzBfcHhsMmRwaT47Cisg
ICAgICAgICAgICAgICAgfTsKKworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlf
bWlwaV9sdmRzXzBfbGRiX2NoMTogZW5kcG9pbnRAMSB7CisgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwxPjsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2x2
ZHNfMF9sZGJfY2gxX21pcGlfbHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07Cisg
ICAgICAgICAgICB9OworICAgICAgICB9OworICAgIH07Ci0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
