Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2C3070F6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036D897C5;
	Thu, 28 Jan 2021 08:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2050.outbound.protection.outlook.com [40.107.21.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28BC6E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:03:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsA5SxkuE+VkKhQTVJVHYYLIH0W9QPTn3Tbx+mK9gs9s+I8SZ6fyIlXsbYA/YiDjg++L5I5n6dbegTVZAvQMfJkDGU3pquVXHEaBEEu4Ih6onQmuysfnFGU5he/yBtfrEyO5JAnLf79HALDwdGv5ZdTo5Fniyxg7LGsqSnrNx9R3KuCu6eKVUsRnf+bMqrKnN+TRCWNRB9HoXarnARHvxilmZ/p4yRD4G+yZ15SLAdN/xyiV0DL4t1ehPpuD5QdB54UHhpsKClv3wGrYvZf5PmyKS/2jIXTY/BEgKcPJ7vNR9CQeU6uWfNpQ7LJtv6uHx/pZxFsYm/9HodY8Q0JEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hct4ijw9X88b6E0jStJEhqwk4xp8hiy+XmdL7nSEPUk=;
 b=FcudkcGNhR3SDWtyFHbb04T4DTVCjdAU+h33ydV5L2cVEEJ7j3HDKlKEZjvBe+rTU5bCFKEs1nvGQi23h+NL7qNAgBUu+nCusqAkd8cvhKYzs/UXEa2gZ0UxRcjse4C2nPJZLlUL0EOQ/aPf8it+QpcjNkVqicC6gQu+8H1VPKLrmdeSydzFfsfAcB510uOuO1BgJY8/Hd95/eOLD54BdEddcOwJ0OB7OJZgpflvhQdjgVFRmb0/IudQKOMMDggs3PZNPrhHXy1c/pywOzUjdXGyyw9eKDSKQeO7jZfxPWMYyeQMJ3t8GoOv2err0rOEjxTLJM+lBlOvSiJehTa8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hct4ijw9X88b6E0jStJEhqwk4xp8hiy+XmdL7nSEPUk=;
 b=YxHY0NLIKYZDEdhnodaxdwHssm9Rwyz9ZJNAKi8mFSWX26NXMpGkIonMV9p4eiQpW+MDVqoONw000pZ14mY0XIPatOck/zWZDUxEIjzRyZuW2+1WMeQBdBY+IZTE3khk84hxbu1V61zR4HcBDYSQWnf3jjN1UjWp42sC8f5BHpA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:03:09 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:03:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Wed, 27 Jan 2021 16:51:22 +0800
Message-Id: <1611737488-2791-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:03:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4601a30-c0e9-4966-5021-08d8c2a25dc2
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297543142274D45D6B191C6A98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JaN351EA1uIDhLKGNZVYSS4BoB3nU19IwIhLBK7f3mf46bj/ugGXI6pERQcD6LZDIR/bNmHOdkct6Dbb28iuWRyBqkvXC/HSXMxwAC7WKLUwmc0+sQAVFnJfmvjFr0Xn0psVh7D2729shlb9NRKZY8c751Djs8BmG0UTjSZ+HJ6zN56NDqtH78gN7aJ/8/tBptFdyKGfogRX1bOl3NMb9wB/1J1dXKmZjOk7TpAnYLXuo/cKxRvKSfkRv3rm/1SkFAKryvarCYo/be53OKQy7Aa0i1ieYsdHA0kgzgtD6BKO2DEDBcpKP9moBvrytcSVxcJWtJWB8A2Ya4Bj/2ikJjwRMPgZxUWDjeIEoxD36WPB62pbcwMCN8vJVAeweYWz1adOEHFTF9QdvxniUHDVods6NAXXCoG4jSBBn9qLcLYp6QsN5eHd6RFmSv7+eNi51rkhYKSNBbQDGQEqLMnF0ZaJXhLp4V/1I5L6MMBczmYzd/8Oazs/bt15SUiqn4i+LlMoSlKGZICP8aT876Pcs03wSfhOSm6PgjTgUEdVEZGGy5HDtP9x483+cioOmLlYfHiBXQUDicJ0TsswSe+y8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(66556008)(966005)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUJMRisrVUxFR1p2cmk3MDVCd1UrbENOdVBpU0RZTEFhU2ozcmpJSUpnN0Fa?=
 =?utf-8?B?Qmx3OXN5THVjdjlNR1VLbDB5Y2FMUWtkU0lmSFRRMDFKSlJrMGFIcDFORHJS?=
 =?utf-8?B?ZWt4c3JkL3dnM0VnWkRPNVpaSFhiRll3eTQ1MHRyNFFNbkNWcE1WMzM4Tk1Z?=
 =?utf-8?B?QjN6aHBpZlF6K0tWRXRhOE1oQ3U1MGxJUk5LNFBOb3RjZ1htVVFzVUpJVzJn?=
 =?utf-8?B?ZVh2Wjl0aFBHUXl3c3JpUlE1dmJMK291UHdMVzRUekJMbTRiTEI3aWdZQjBR?=
 =?utf-8?B?SGJqMjlkRGU5ZEpoRXJqdUUyNW5KZHVRcHFBSVkzRUFWOEtzQUtNK3F5TFRi?=
 =?utf-8?B?Z21yM25QVXB0US9rRnBQK2l3ZVdqOGUwMUx4c0RVT1FYTlRVRFFOMEl4NnJP?=
 =?utf-8?B?aDdQVDhnbUZvbVNweU5ROXU5Yk5WZk4zdEt1SUVYSDFNZVdzQkN6NG1vWlhO?=
 =?utf-8?B?SlFBRXptZVZDOVQxTlIvUVV3WldjajhUcUU3aDI3aXl5blFTTnU0UDBnaC9W?=
 =?utf-8?B?SXRxSEdNTzF6RTBRU2pvQjlwTm5xVHNSWEhicU5ibklSbnM0L1RXOFdQQXhD?=
 =?utf-8?B?Zmp6QWlRYjU5bWtIek82YWJDWjFiVTJYd2VIdTFMMjgwdFprRXdVR1p6blVE?=
 =?utf-8?B?bTcrdDB0MUxGSUdZQllxVHFlZ1YyZ21paEdDaHBzT04xZ25QNFF3MktFYjgz?=
 =?utf-8?B?THphWlpreGtOVG1sVlYxYVp2RUt3aDZOOU1LTUVndldBa2lKMnBaZnBTM2xx?=
 =?utf-8?B?dm1ibWhxZVFtK1Z3VDM3dXpzN0RJK3U5dVNyZmNRQmJTWitaZldFNVFQYjFF?=
 =?utf-8?B?Z0dnMWNLZDA5YmtsMVpSSzlEbzFLY2tKT2JtU2FlRFZQT0NaZjZFdnc1Qkgv?=
 =?utf-8?B?WXpzN2VuejI2L1BMVWw1Zlc1SGRCWUJMWWwyZ3Z5eWNqcW9CSVhUcVhlcC8z?=
 =?utf-8?B?YkpnY054TWJUeDkwQUlHaVlQZmpTb1VMQnRPd09KUys5aWlDTXBybURhTExh?=
 =?utf-8?B?UEgveUsvWHEzMUsybm5yZ2FvYUhhWnU0ektxZTdtcHA2OEo2Y1BsUSsxeHh3?=
 =?utf-8?B?amVxN3ZoN1o4RkR6c0tJdzV1YThOajJiNTRianJUMVUxYVBCZExDWnBNU3pn?=
 =?utf-8?B?SVRnc1gyQWkxbHkzbU1wSmpWT0tlc1QzMVEySFoxL2NlaVYxUG82d2VKLzhw?=
 =?utf-8?B?SkllSEtHREo1QWdidys2V0dnUWVvaXc3RWdncDJoeW8wY0ZtRjNUbCtWZTdx?=
 =?utf-8?B?LzZqbkw5bWFOaXkreUgyYzFQdUZ3YVNKL0hMMUxlY1JjSDVBTUh2ektLclJt?=
 =?utf-8?B?NGlSdlBmY2daTXdwcDhwMjdUMG9MeEtQbzZtdEVkM0E4Nmx4aVdJakFwdEpq?=
 =?utf-8?B?MkM4eHYycm5GRXJic1d4NksvcHRxd2Z3RTJNVnZid255YnNsWHpFQnp4Ujlu?=
 =?utf-8?Q?Zk8bX6Zv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4601a30-c0e9-4966-5021-08d8c2a25dc2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:03:09.5605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYr5X6dObeUtS7+y0BHXLB6+3evJYQaD4ybs6FiekQf18qhu9QfG9y5ZrHgqTEJ6pxcJT2Z6rgjSBnQsS2iPNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
LQp2Mi0+djM6CiogRHJvcCAnZnNsLHN5c2NvbicgcHJvcGVydHkuIChSb2IpCiogTWVudGlvbiB0
aGUgQ1NSIG1vZHVsZSBjb250cm9scyBQWEwyRFBJLgoKdjEtPnYyOgoqIFVzZSBncmFwaCBzY2hl
bWEuIChMYXVyZW50KQoKIC4uLi9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlh
bWwgICAgICAgIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEw
MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55YW1sCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwLi42MTEyMDk1Ci0tLSAvZGV2L251bGwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhw
LXB4bDJkcGkueWFtbApAQCAtMCwwICsxLDEwMiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1w
eGwyZHBpLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKKwordGl0bGU6IEZyZWVzY2FsZSBpLk1YOHF4cCBQaXhlbCBMaW5rIHRvIERp
c3BsYXkgUGl4ZWwgSW50ZXJmYWNlCisKK21haW50YWluZXJzOgorICAtIExpdSBZaW5nIDx2aWN0
b3IubGl1QG54cC5jb20+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoZSBGcmVlc2NhbGUgaS5NWDhx
eHAgUGl4ZWwgTGluayB0byBEaXNwbGF5IFBpeGVsIEludGVyZmFjZShQWEwyRFBJKQorICBpbnRl
cmZhY2VzIHRoZSBwaXhlbCBsaW5rIDM2LWJpdCBkYXRhIG91dHB1dCBhbmQgdGhlIERTSSBjb250
cm9sbGVy4oCZcworICBNSVBJLURQSSAyNC1iaXQgZGF0YSBpbnB1dCwgYW5kIGlucHV0cyBvZiBM
VkRTIERpc3BsYXkgQnJpZGdlKExEQikgbW9kdWxlCisgIHVzZWQgaW4gTFZEUyBtb2RlLCB0byBy
ZW1hcCB0aGUgcGl4ZWwgY29sb3IgY29kaW5ncyBiZXR3ZWVuIHRob3NlIG1vZHVsZXMuCisgIFRo
aXMgbW9kdWxlIGlzIHB1cmVseSBjb21iaW5hdG9yaWFsLgorCisgIFRoZSBpLk1YOHF4cCBQWEwy
RFBJIGlzIGNvbnRyb2xsZWQgYnkgQ29udHJvbCBhbmQgU3RhdHVzIFJlZ2lzdGVycyhDU1IpIG1v
ZHVsZS4KKyAgVGhlIENTUiBtb2R1bGUsIGFzIGEgc3lzdGVtIGNvbnRyb2xsZXIsIGNvbnRhaW5z
IHRoZSBQWEwyRFBJJ3MgY29uZmlndXJhdGlvbgorICByZWdpc3Rlci4KKworcHJvcGVydGllczoK
KyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogZnNsLGlteDhxeHAtcHhsMmRwaQorCisgIHBvd2Vy
LWRvbWFpbnM6CisgICAgbWF4SXRlbXM6IDEKKworICBmc2wsY29tcGFuaW9uLXB4bDJkcGk6Cisg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQorICAgIGRl
c2NyaXB0aW9uOiB8CisgICAgICBBIHBoYW5kbGUgd2hpY2ggcG9pbnRzIHRvIGNvbXBhbmlvbiBQ
WEwyRFBJIHdoaWNoIGlzIHVzZWQgYnkgZG93bnN0cmVhbQorICAgICAgTFZEUyBEaXNwbGF5IEJy
aWRnZShMREIpIGluIHNwbGl0IG1vZGUuCisKKyAgcG9ydHM6CisgICAgJHJlZjogL3NjaGVtYXMv
Z3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cworCisgICAgcHJvcGVydGllczoKKyAgICAgIHBv
cnRAMDoKKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0
CisgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgUFhMMkRQSSBpbnB1dCBwb3J0IG5vZGUgZnJvbSBw
aXhlbCBsaW5rLgorCisgICAgICBwb3J0QDE6CisgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBo
LnlhbWwjL3Byb3BlcnRpZXMvcG9ydAorICAgICAgICBkZXNjcmlwdGlvbjogVGhlIFBYTDJEUEkg
b3V0cHV0IHBvcnQgbm9kZSB0byBkb3duc3RyZWFtIGJyaWRnZS4KKworICAgIHJlcXVpcmVkOgor
ICAgICAgLSBwb3J0QDAKKyAgICAgIC0gcG9ydEAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGli
bGUKKyAgLSBwb3dlci1kb21haW5zCisgIC0gcG9ydHMKKworYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZmly
bXdhcmUvaW14L3JzcmMuaD4KKyAgICBweGwyZHBpIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJm
c2wsaW14OHF4cC1weGwyZHBpIjsKKyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1ND
X1JfTUlQSV8wPjsKKworICAgICAgICBwb3J0cyB7CisgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworCisgICAgICAgICAgICBw
b3J0QDAgeworICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKKwor
ICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfZGNfcGl4ZWxfbGluazA6IGVuZHBv
aW50QDAgeworICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47CisgICAgICAgICAgICAgICAg
ICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZGNfcGl4ZWxfbGluazBfbWlwaV9sdmRzXzBfcHhsMmRw
aT47CisgICAgICAgICAgICAgICAgfTsKKworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4
bDJkcGlfZGNfcGl4ZWxfbGluazE6IGVuZHBvaW50QDEgeworICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDE+OworICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkY19w
aXhlbF9saW5rMV9taXBpX2x2ZHNfMF9weGwyZHBpPjsKKyAgICAgICAgICAgICAgICB9OworICAg
ICAgICAgICAgfTsKKworICAgICAgICAgICAgcG9ydEAxIHsKKyAgICAgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAg
ICAgICAgICAgICAgICByZWcgPSA8MT47CisKKyAgICAgICAgICAgICAgICBtaXBpX2x2ZHNfMF9w
eGwyZHBpX21pcGlfbHZkc18wX2xkYl9jaDA6IGVuZHBvaW50QDAgeworICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MD47CisgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwm
bWlwaV9sdmRzXzBfbGRiX2NoMF9taXBpX2x2ZHNfMF9weGwyZHBpPjsKKyAgICAgICAgICAgICAg
ICB9OworCisgICAgICAgICAgICAgICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9taXBpX2x2ZHNfMF9s
ZGJfY2gxOiBlbmRwb2ludEAxIHsKKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+OworICAg
ICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfbHZkc18wX2xkYl9jaDFf
bWlwaV9sdmRzXzBfcHhsMmRwaT47CisgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgIH07
CisgICAgICAgIH07CisgICAgfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
