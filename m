Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EF33397C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6409D6E9F4;
	Wed, 10 Mar 2021 10:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30079.outbound.protection.outlook.com [40.107.3.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84926E9F4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1BkNUsJHgy360PU8luNxuZUbMZFU9puSIYz1CgMOPdPZG9HyefQbjdDHK+ZXZhQjYGPpqjidoiXVRTvK8pgswXXll08iPco7hk1mZPu1OfFub9TBRi4hSZl0spiS0gd2AWMI1XS9zaInu6cJx9WG9EFgOW9atk+/8DFh9kuk6jbyMelsDi0rooeUDXh2pB2hLPnAaAQZRg95jbemVQm1rifpWU2Q81DPhiJFNxuHqQqoHyMsDeGds7qIate+pFyVYiHNzrHc3nfbQ+OMKecm5pVfjkovkC7DOMiL10XJdyQQ9l8f7sSzI0RpyECdqi995e0OD2eSbhOe9WIcfd8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdKhDbmlg5Za0j6h1Gnm33l4N/AIyHSMNJq5P72b+jo=;
 b=kR2uqAZs92/1L+d9ABwwBeZQnqqve1R1ElXIWhSwY0nw82alMxxNBDxRkM6Qaa3uJXBXVyfZQyLxH/gYj3kRwJuCNiJAerDJlwrsmcthvZ2wM86pn8GWWYRcbG0DIIwbJ9x/Pa5TpFN5dBXdIPP0WW8P7O6M3HxIknHVcR62YADfchWFNghmQ/aLbIHP2IrgJocjspy7kUEhURChDcM4IioUJxmXVpzZvcnQmdld+zMa7FF7esyedR7PJaCthfyPKSFQuCxMx0sLZ3DYd3dN4saHNKm9c2NZB/EbPoxUoiecw5Q7rE3+kOpX6jgJkh8gDfB7+8MfXdquoHsaSR515Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdKhDbmlg5Za0j6h1Gnm33l4N/AIyHSMNJq5P72b+jo=;
 b=iFP8D2k0iHt2BVu63QpCDep2V7dQmeTAeQjxTseqtAdXBbc9Ni3+UeNnt1HKyjmD5usWU/n5pqBwDDxYGAec/MiDmz/1vUGHOsnKed8ay0hj/Hj4oqxSAWbqlcsu25UQd4SCKzlUzTiSCW3b94dPKPeYKO9O2fDIGIpxpqwGql8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2813.eurprd04.prod.outlook.com (2603:10a6:800:b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 10:09:49 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:49 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Wed, 10 Mar 2021 17:55:32 +0800
Message-Id: <1615370138-5673-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:09:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e19c7a1-646f-467d-6e4f-08d8e3aca3b3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB281348D86F8790F831D3FC1198919@VI1PR0402MB2813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fX+QTWDAthLxY9Zk8HxACuRx148niDOVy3CJIHY4gvnr+3j9hkbiyQB9bRkUWW+NW0j5p/VvObCgzxAXKA3S7uw4e5XGCO/b4XR/11/STfyQpDOnKRpA+bZUiDqsTNGTpr8bWM8frZPvXVgA554d2wpqhx7dO7IOB/WvwEI2EWdNW2FqDL05Ru+hhNmN11l9mrFgI8pjnM5W6LGPaXLz9iXrPmcE/bR7GW/UX7We1WrBbn4QVPIvkfz358LrbtoROkCZEMWDC9frXNepVioEiObZugFY/243vz8Xv6qETxleJmOU5WMmC+djG+UXsEXCufqJHDudBc7w+ieDUogZqVW0Ji+F8g5SsIf0tsNQm4BaHlnB0MzcR9RAwZ/gPMU2v9lKh+fkRAMEbuNGZ3L8Pl8h0aX8m0LCQiES30XvSYYYsvVQTdl4fKYjyuD0GM4eC6ZG1L6liC9zSYrR8P97AdgTzymkt5xUGREYBHt0J6j+R5Mfb429/JMyqOTARirc+wwxStfQfZ77NQWwlWvwL4Stm7kRu6J60QxUF9f493B6N4wY+i8iDd25cIxQMEZcV5YIAU9SQwtHh27M25zRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(8936002)(6512007)(6666004)(26005)(36756003)(6506007)(956004)(8676002)(2616005)(5660300002)(52116002)(6486002)(316002)(7416002)(478600001)(966005)(186003)(66946007)(2906002)(66476007)(66556008)(16526019)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S3oxcDhhV2tYa01pYXVFM0VOOUtYRjlaZmYvNzAwSEs4Um93d3I5UlJYZTg1?=
 =?utf-8?B?alJKUW1hd1hjMWptSlJ6NHl2MHZpQ2hDVCt1OUNnUlh1RkJQOUpXNEQ5anJ4?=
 =?utf-8?B?Y01mRXplZmV1VW1UUWk3eCtLK3R0VDZCOER6NUZiT0RlaCtuNUwwT2pXUWty?=
 =?utf-8?B?NlVaayt1eDNpd2pMUE9PYXcyVVZOb3BmQTNCY2dMR0FvdlJBVTNVdTRkdjUy?=
 =?utf-8?B?NFpOZFA1SnFRK3JVbVM0cFdWSEtNbU5lYlRiT2EzNXpUTkI1K3MyTk5hN2ZL?=
 =?utf-8?B?bGVpSDIzZE9KMUY3clkvSXpyZ0ppcFJrbUxtdUIwcnNxOWUxNnFaRER0eGM5?=
 =?utf-8?B?YUpaMVY1akVlRHZ0K0hmWFZKYUhYZ2gxeTJVUTd6anIveUZQR2JoTis4WnFH?=
 =?utf-8?B?TzhnL0tKTkJNaHJBd3p3cjcxY1J2VW9POThWbnN3UE5aOGJSYjNoMi8rcVBr?=
 =?utf-8?B?THc0SUJKSDVmS2FsaGoyd0tvNXNabUgyTDI4Nm12L3ZlbWNqNDc1Q2hTZXB3?=
 =?utf-8?B?U240SExOQWhGOWcrSnhHd1Z1aC9sU3I0SW1NQVIzZlVGTDdCTmJFWmpFQ1Q1?=
 =?utf-8?B?MTcyQ0RtcHJxaUxLOC9tVTJtSnE2MlJFb3E3WStQOWNTWkxXQlFRNmJPUVkx?=
 =?utf-8?B?bGZYZjdwNWYxbDFyd25vd0pLM1lYMzhYNUhieEVsQjUyMkNZTjEyMXZTNHBq?=
 =?utf-8?B?N3hrRHVPdFVYamhldFBOL2JkS1lMQ01hYnB6S3ZGaGR5bXEwc0xtK0tVRkZ6?=
 =?utf-8?B?bHRFampraXRRQUhjU0xteDNxaGQrTG9KR0NaeGtmWU03RTY4U21CZmRDNFJL?=
 =?utf-8?B?UHlzeG8xVEtiMmp5NDgzZzJhcXlsQmo5K3hmaXlCcWxGbEQ5bk1yR0NZZzQx?=
 =?utf-8?B?ZmN3VjJ1eWV0NnZLZHIxL0NQTk81Sm9yRmR2RGk2MHI4M1pnR2VZUUc2eTBp?=
 =?utf-8?B?NTZ4Z201R3B2VGhOYmNZbGwwa1pja1VuS3lqamRhWE5RU2Rkb1RLVG9rSlpP?=
 =?utf-8?B?MWRmcG1Ta2dhMWMwTHE1Nm5UTGhWcWxra0pId0lGSEJUSFJyZW1Ld0NOVHdS?=
 =?utf-8?B?OFh5bk82RWgxNmtMM0Y2c2pPVWdiVFhPam5QVGRGRnhVOUNzK1RGUnVpZkNa?=
 =?utf-8?B?UjQxam81K01yRzJDZytLNXh6WDQ1blloT0N5YXRaam44SFIrb1lleHJESytu?=
 =?utf-8?B?T0FWN1hTRy92Y1dRNHdEWElBTys2SGdYZzhKNzhNV3I4YTVEMDBBZ3VTTndR?=
 =?utf-8?B?RjhLMS9XcnhZQTI2OGlWMU8wRWlrR0pZeDRKZkZvL0dJMnBXbDgxVXB0ZWZn?=
 =?utf-8?B?WUEyRFpuMHorMTIvSzVEWHdtWWJNb1hETEJZemU1NEdhQU9HbE01OTkrbXBx?=
 =?utf-8?B?Y0d5UjVWd3R2NmdHNTZlWDBMSW5JSkphQXR6b1lsWWdQTTM5VFhxWHdEamtY?=
 =?utf-8?B?UEplbVZhK1RmcSthNW9tSmJIdjF4c0tjbW1ha1NoRGVrQVFSMTluMGJVUnBF?=
 =?utf-8?B?NitlRE9ndXVUUGdGSXdZYW14RTA2U2JvVFJvS2lHeVliejZGOUpqRkVWVUR4?=
 =?utf-8?B?ZEZtRWFqQWlQRS9ZSEVBOVZxRUhMRDVpQzFJWE1saWNia1V5TEtFc0RXU3d0?=
 =?utf-8?B?Ky92cVppZlExR2R6ZWd2eDBYZmU0Z3ZRMzZJd1lkUkhZNTIwblk1bWRVYlpQ?=
 =?utf-8?B?cmZZQlJubGNHODRpV3F0RmVWNmViVjhsbWhyNWVNTkxsU2dseU10RThIbUlE?=
 =?utf-8?Q?5v1qwuCk49fzASxzOowR2c2mMn7skQah4YeQFkc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e19c7a1-646f-467d-6e4f-08d8e3aca3b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:49.5909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVZ+ESb6F/tG2Wtl5Eb2Naqjl5+N3xgrhQiLsSJazq+Jq6/b3csYAKTV1kKCDuCSmGl5eRjLDDWRFPqb7pHeVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2813
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
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGJpbmRpbmdzIGZvciBpLk1YOHF4cCBwaXhlbCBsaW5rIHRvIERQSShQ
WEwyRFBJKS4KClNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+Ci0t
LQp2NC0+djU6CiogTm8gY2hhbmdlLgoKdjMtPnY0OgoqIEFkZCAnZnNsLHNjLXJlc291cmNlJyBw
cm9wZXJ0eS4gKFJvYikKCnYyLT52MzoKKiBEcm9wICdmc2wsc3lzY29uJyBwcm9wZXJ0eS4gKFJv
YikKKiBNZW50aW9uIHRoZSBDU1IgbW9kdWxlIGNvbnRyb2xzIFBYTDJEUEkuCgp2MS0+djI6Ciog
VXNlIGdyYXBoIHNjaGVtYS4gKExhdXJlbnQpCgogLi4uL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4
cXhwLXB4bDJkcGkueWFtbCAgICAgICAgfCAxMDggKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhs
MmRwaS55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlh
bWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLmU0ZTc3ZmEKLS0tIC9kZXYv
bnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvZnNsLGlteDhxeHAtcHhsMmRwaS55YW1sCkBAIC0wLDAgKzEsMTA4IEBACisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEu
MgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdl
L2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRnJlZXNjYWxlIGkuTVg4cXhwIFBp
eGVsIExpbmsgdG8gRGlzcGxheSBQaXhlbCBJbnRlcmZhY2UKKworbWFpbnRhaW5lcnM6CisgIC0g
TGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KKworZGVzY3JpcHRpb246IHwKKyAgVGhlIEZy
ZWVzY2FsZSBpLk1YOHF4cCBQaXhlbCBMaW5rIHRvIERpc3BsYXkgUGl4ZWwgSW50ZXJmYWNlKFBY
TDJEUEkpCisgIGludGVyZmFjZXMgdGhlIHBpeGVsIGxpbmsgMzYtYml0IGRhdGEgb3V0cHV0IGFu
ZCB0aGUgRFNJIGNvbnRyb2xsZXLigJlzCisgIE1JUEktRFBJIDI0LWJpdCBkYXRhIGlucHV0LCBh
bmQgaW5wdXRzIG9mIExWRFMgRGlzcGxheSBCcmlkZ2UoTERCKSBtb2R1bGUKKyAgdXNlZCBpbiBM
VkRTIG1vZGUsIHRvIHJlbWFwIHRoZSBwaXhlbCBjb2xvciBjb2RpbmdzIGJldHdlZW4gdGhvc2Ug
bW9kdWxlcy4KKyAgVGhpcyBtb2R1bGUgaXMgcHVyZWx5IGNvbWJpbmF0b3JpYWwuCisKKyAgVGhl
IGkuTVg4cXhwIFBYTDJEUEkgaXMgY29udHJvbGxlZCBieSBDb250cm9sIGFuZCBTdGF0dXMgUmVn
aXN0ZXJzKENTUikgbW9kdWxlLgorICBUaGUgQ1NSIG1vZHVsZSwgYXMgYSBzeXN0ZW0gY29udHJv
bGxlciwgY29udGFpbnMgdGhlIFBYTDJEUEkncyBjb25maWd1cmF0aW9uCisgIHJlZ2lzdGVyLgor
Citwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBmc2wsaW14OHF4cC1weGwy
ZHBpCisKKyAgZnNsLHNjLXJlc291cmNlOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOiBUaGUgU0NVIHJlc291cmNlIElE
IGFzc29jaWF0ZWQgd2l0aCB0aGlzIFBYTDJEUEkgaW5zdGFuY2UuCisKKyAgcG93ZXItZG9tYWlu
czoKKyAgICBtYXhJdGVtczogMQorCisgIGZzbCxjb21wYW5pb24tcHhsMmRwaToKKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCisgICAgZGVzY3JpcHRp
b246IHwKKyAgICAgIEEgcGhhbmRsZSB3aGljaCBwb2ludHMgdG8gY29tcGFuaW9uIFBYTDJEUEkg
d2hpY2ggaXMgdXNlZCBieSBkb3duc3RyZWFtCisgICAgICBMVkRTIERpc3BsYXkgQnJpZGdlKExE
QikgaW4gc3BsaXQgbW9kZS4KKworICBwb3J0czoKKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55
YW1sIy9wcm9wZXJ0aWVzL3BvcnRzCisKKyAgICBwcm9wZXJ0aWVzOgorICAgICAgcG9ydEAwOgor
ICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKKyAgICAg
ICAgZGVzY3JpcHRpb246IFRoZSBQWEwyRFBJIGlucHV0IHBvcnQgbm9kZSBmcm9tIHBpeGVsIGxp
bmsuCisKKyAgICAgIHBvcnRAMToKKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMv
cHJvcGVydGllcy9wb3J0CisgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgUFhMMkRQSSBvdXRwdXQg
cG9ydCBub2RlIHRvIGRvd25zdHJlYW0gYnJpZGdlLgorCisgICAgcmVxdWlyZWQ6CisgICAgICAt
IHBvcnRAMAorICAgICAgLSBwb3J0QDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAt
IGZzbCxzYy1yZXNvdXJjZQorICAtIHBvd2VyLWRvbWFpbnMKKyAgLSBwb3J0cworCithZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oPgorICAgIHB4bDJkcGkgeworICAgICAgICBj
b21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXB4bDJkcGkiOworICAgICAgICBmc2wsc2MtcmVzb3Vy
Y2UgPSA8SU1YX1NDX1JfTUlQSV8wPjsKKyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmcGQgSU1Y
X1NDX1JfTUlQSV8wPjsKKworICAgICAgICBwb3J0cyB7CisgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworCisgICAgICAgICAg
ICBwb3J0QDAgeworICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAg
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsK
KworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfZGNfcGl4ZWxfbGluazA6IGVu
ZHBvaW50QDAgeworICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47CisgICAgICAgICAgICAg
ICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZGNfcGl4ZWxfbGluazBfbWlwaV9sdmRzXzBfcHhs
MmRwaT47CisgICAgICAgICAgICAgICAgfTsKKworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18w
X3B4bDJkcGlfZGNfcGl4ZWxfbGluazE6IGVuZHBvaW50QDEgeworICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDE+OworICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZk
Y19waXhlbF9saW5rMV9taXBpX2x2ZHNfMF9weGwyZHBpPjsKKyAgICAgICAgICAgICAgICB9Owor
ICAgICAgICAgICAgfTsKKworICAgICAgICAgICAgcG9ydEAxIHsKKyAgICAgICAgICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsK
KyAgICAgICAgICAgICAgICByZWcgPSA8MT47CisKKyAgICAgICAgICAgICAgICBtaXBpX2x2ZHNf
MF9weGwyZHBpX21pcGlfbHZkc18wX2xkYl9jaDA6IGVuZHBvaW50QDAgeworICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MD47CisgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmbWlwaV9sdmRzXzBfbGRiX2NoMF9taXBpX2x2ZHNfMF9weGwyZHBpPjsKKyAgICAgICAgICAg
ICAgICB9OworCisgICAgICAgICAgICAgICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9taXBpX2x2ZHNf
MF9sZGJfY2gxOiBlbmRwb2ludEAxIHsKKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+Owor
ICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfbHZkc18wX2xkYl9j
aDFfbWlwaV9sdmRzXzBfcHhsMmRwaT47CisgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAg
IH07CisgICAgICAgIH07CisgICAgfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
