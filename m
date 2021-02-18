Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F030B31E4A6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7026E821;
	Thu, 18 Feb 2021 03:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200486E821
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGtqkyBA/uNVD6ojXSj/XV22CRzjbA94byL+r4oLb79jhPK/QT6ayIPx8v5a8nspgPsx2u2bxx9zgZT0nsMxfZoOtANat5nA+NJjqfx0a42qUZLekw2f7b5VXKQlAoHOi779dsscAqdlLAEkQVfGUIMBGuT9y28/zj/XZ04bREIT9CJdmmyDMILOmCqgAOkBgLPwnZlJWBeuT0Ll5+EWPNgJBjiQwOtAXz99j1qOVqK9a2tNnPk5uI7CisSqakVQiiJ2b14bm2f+dcdLMdhIsm3oaBfDzMmDooJhZHNAcoMaGtGZvKvR4onjxtv8blXQaIOg8hblYU4+4VKMpGRWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5uVWVH6Z6t73/1mhIW228y8iiZYig0nvPY/B2Ajp8E=;
 b=DNPH4U4qF0yj4DMF5hRlVkpivhSyePS952IhwgPE5FJm6f8LtOa4DacKBFMMfNolPSkSdKn48+Og15XLHLeoUZa0lINYa/TBtOGUT94d3Y61izgB9TxP/WUufB4u3EJwGJij/jBv/q+6uEvXNxFs3yEpr9b6c9aCALuuKlK4KAopuhtf7OKagRU5tuP2oWqe5BVjMzHsDXoyXq8qn4Mj3i46IFw1wW3dHBS4/fxeindY5bfLSBgq1rMWNWatO2t04nMyKs3r/84HhIsaSgiDM7mVyxhSXRlnA0s3vrt+No8WysCK9WFzKqEyfmFQ7ZJVyli4xJ/ziEkpz6m+QBTtlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5uVWVH6Z6t73/1mhIW228y8iiZYig0nvPY/B2Ajp8E=;
 b=W1kr7bVN2bOKFQjANSWMi2145SWxAFEp8FcqspldA+Tg6vfeWUHmzdYhYfo0xeV327dSV3Uu6/6GHwHcgTaqku+WQ7XRyDswBRkIz4TD8nq5tczP8356b3u/+zWBInqUeEju6CjFGEmLs28JkDanKoAaOAXbO/FrSvWvAPSDndw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Thu, 18 Feb 2021 11:41:49 +0800
Message-Id: <1613619715-28785-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bda27f97-e68b-419a-b537-08d8d3c0f3b0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3421DB44EEB51F42CE6E444D98859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K2K21gH9kGfQdEOAGar4W9jfCK3eeMq6WkJ/LXsNggylotUlvC1T7itxraJNjwV1WQIXWd1hGU/2QWqW/a8yEQCHXLbs/KiWR0vOs9bIWj1HQsXl2A4bDWdrgsDlY0mq60M0FpSbrUt981rcNlRnDD4YkeTP4ynUvhT9vnFI+0TtgXjHpnUJZUjahd0O5+YLLan3fO7yMTgCyUXUOFkdOGcdXuMqhptTih4zd4uUQnbI9tMv2Dm8pZZFfHSA9/HqqdKnMqxkSwGqXYJzu5RsfxcYqaUtkTtmf3+/BKyVNkcJeanzXhdHRCbCS3nhExGX7z6JzkGL1AIa1DhUlUzwZrDoPfrurEuzQTlGzlLnkEoiIhCjlsu/PPgzxvYzP3dAcOjQZEp7YwZntt5QXMM4ws7oYHtB8xABQT93JQTX+E/Tw71xoArKLr27FXMWxOOCO91YlsMmjusbwndMaV56327P3YWztnsWesd+qLcA64QYaomO0cQ1kQYVBso7zXvuNXy1uiGFKQO6aYq09f0dKGrv+G298dJlI1AV8IZyyJC/hirVHEhzbR6mbCuKvaaUFNr+Mrzii/3PBeyGjedN7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(52116002)(478600001)(86362001)(5660300002)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(966005)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDVTM3R5OEdVZk9KNnVneXhsV3hFRWU2WjV6RjJkemZTays3ZG9lMFhWS3dM?=
 =?utf-8?B?Y2hVOHpvNkNNS2U5Nk9LdDBaV29iNGMzOHFnbmRTKzN4OVB3eTdKVXdIL05x?=
 =?utf-8?B?dFY3cXlrM2JENVhGVjAxcnVyVXlQSmtDQlBxNnBTTk1QaGxrbE56M01DUUVT?=
 =?utf-8?B?a1JkeWpIWnA4QlYzTncrNnBsdDFZbWJScXV4bmZQcUNscGk3RktvcWZTblV4?=
 =?utf-8?B?SXpaY0hZS3RWa2dQOUo3RENLL2hSV0tDT2JEZVFESWt3dkVBZUcxNzdLeGd3?=
 =?utf-8?B?bG9mYk00SmJRZStvK0VML0JrdDE2YitmeDR6STRPY29BU3p6dW1VTEw0Qlc5?=
 =?utf-8?B?dkNSMkhnNnZoTUhaZURoRmRLTXZKa2pRdHNKODBnRE9jQ1ZOWHRaUk1YMmVI?=
 =?utf-8?B?MmpPYUVnS2VLQ245TEtOM1lXbmtZcXRKZ1l3VmpJVndMamhSUTBkaE1LY3dw?=
 =?utf-8?B?OUdkT3ZaVnprZmdqQXFWa3prcC9GSW1uSjBTQ1pLNGxaL0RWWmNlQ1pRNHRv?=
 =?utf-8?B?dytDUG5XOTFBdEdoakpOZitFTTh5THlwRmhkSW93bTg3MUowaTRnM3ZSOHdD?=
 =?utf-8?B?dHVLWVNmUVN4RUVReDFralpxejhVVWNnT3JaR0FPVkJQNFc1aFNHOStnczN5?=
 =?utf-8?B?cE03T1kzSFh6ZkEvTUJGdVQvYWxUeWhBdUx5YUNoekJGdFlQZThWeUN1VUZv?=
 =?utf-8?B?ajBqZFBUL1RQT1BYaURNZ09LUHlFQmg3V0RKbDV1OXk0czgrTlhLOGViMHBj?=
 =?utf-8?B?M3NFVmkyMHJYcldFUmUvRk5Lek16azM0SlhqUUlKYWJNV2FPQ2kwZHVFZ083?=
 =?utf-8?B?RG9BVWg3MWYrSGJVQVBnb3ZqMEZUeVd1RmVoVTJlU2RLVXR6ck5MUTY2RXpG?=
 =?utf-8?B?Y0lkSGNsZjRlN1FkV1FpUnFsUGV0TkJob2tzcVl0c2twcDI4eERoNkkzamNp?=
 =?utf-8?B?Z3Q3SU13cWQ5ZXdwbHB1RFNmbW5DQkFRZ1dxaXAwcHBCUGVDUXlNOTMweFB1?=
 =?utf-8?B?NzUxK0w0VUpFMEgyZFlyYkNld3EvY2R0Q29ydVpPQThYWmFJYTh5STZhdGE4?=
 =?utf-8?B?dGtpeW9vRVdjYzJINU53S0JIVEJrT2lWdVd2QXlJQkVUdmt4UnVCT2piT1lG?=
 =?utf-8?B?SlpPdzdLZnE4MTZxdFRQUVVydlVERnJWV2p4UWZoVlh4YlZrQnhldGxmU0FU?=
 =?utf-8?B?NFI3bFBpVzIyNGpILytxdnZ5dEdnRHBFQlJaQ1IrYjE5WkdNMmthVGFRaDFQ?=
 =?utf-8?B?YXh0N2N6aVMvR1FkWnBuNGdvbHptL3BrNnNtS2RjbFpVUDFvU3d4c0JGRnRh?=
 =?utf-8?B?NDAzUFBQTWRhQ1NsY2RMNVFlU3FqUGQrOWhWeFc1TDFNT3NJT0RIbHpZQmdx?=
 =?utf-8?B?YXNXVDFRc2NSYUVVRjJiVEdFRG1VTldyOVhIaXJmbjZYcVRxUnBOWWpGTmow?=
 =?utf-8?B?Tnh5RmdLTFZNY1UvcFNaNmRKSkxFWUh4bWk0a2x6U3dkSWtyZmY0K0NMZDlq?=
 =?utf-8?B?M0xTaHNjeEhhaFp4clVzcmFaOWw5WEtBbm5xRHJPZ0dnRXpKQTFueG9UcllO?=
 =?utf-8?B?Y0pFSjhkU0JTaGgxY1BuMCtLTzlHMEpzejFYRXRvZGFQYnJJRm5sbjVKc29W?=
 =?utf-8?B?WlduaEY1RGYvR2h6N2N1d001ZkJ5TmYxSEFMcDQ5S3F2WmRhdGw5NFVyYUlm?=
 =?utf-8?B?cnlTVmRFMk5Mc3Fpd0FmRWRsVHRJaGVodG1CUWRYcXQxeXlJOEhQUXhRa1pQ?=
 =?utf-8?Q?SDqYS5gXQAvQ+P84xJlJPq7x4mP+twTNGhawc2l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda27f97-e68b-419a-b537-08d8d3c0f3b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:55.1549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIVOokAddse2j2hgAnbn52YnykUrahxdr76syd9VlQDQ0o6/Zoozk3MuQqQ7WS6WfLZGLmItIrIaifNP43Q5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
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
LQp2My0+djQ6CiogQWRkICdmc2wsc2MtcmVzb3VyY2UnIHByb3BlcnR5LiAoUm9iKQoKdjItPnYz
OgoqIERyb3AgJ2ZzbCxzeXNjb24nIHByb3BlcnR5LiAoUm9iKQoqIE1lbnRpb24gdGhlIENTUiBt
b2R1bGUgY29udHJvbHMgUFhMMkRQSS4KCnYxLT52MjoKKiBVc2UgZ3JhcGggc2NoZW1hLiAoTGF1
cmVudCkKCiAuLi4vZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55YW1sICAgICAg
ICB8IDEwOCArKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMDggaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNsLGlt
eDhxeHAtcHhsMmRwaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMC4uZTRlNzdmYQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBp
LnlhbWwKQEAgLTAsMCArMSwxMDggQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55
YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCisKK3RpdGxlOiBGcmVlc2NhbGUgaS5NWDhxeHAgUGl4ZWwgTGluayB0byBEaXNwbGF5IFBp
eGVsIEludGVyZmFjZQorCittYWludGFpbmVyczoKKyAgLSBMaXUgWWluZyA8dmljdG9yLmxpdUBu
eHAuY29tPgorCitkZXNjcmlwdGlvbjogfAorICBUaGUgRnJlZXNjYWxlIGkuTVg4cXhwIFBpeGVs
IExpbmsgdG8gRGlzcGxheSBQaXhlbCBJbnRlcmZhY2UoUFhMMkRQSSkKKyAgaW50ZXJmYWNlcyB0
aGUgcGl4ZWwgbGluayAzNi1iaXQgZGF0YSBvdXRwdXQgYW5kIHRoZSBEU0kgY29udHJvbGxlcuKA
mXMKKyAgTUlQSS1EUEkgMjQtYml0IGRhdGEgaW5wdXQsIGFuZCBpbnB1dHMgb2YgTFZEUyBEaXNw
bGF5IEJyaWRnZShMREIpIG1vZHVsZQorICB1c2VkIGluIExWRFMgbW9kZSwgdG8gcmVtYXAgdGhl
IHBpeGVsIGNvbG9yIGNvZGluZ3MgYmV0d2VlbiB0aG9zZSBtb2R1bGVzLgorICBUaGlzIG1vZHVs
ZSBpcyBwdXJlbHkgY29tYmluYXRvcmlhbC4KKworICBUaGUgaS5NWDhxeHAgUFhMMkRQSSBpcyBj
b250cm9sbGVkIGJ5IENvbnRyb2wgYW5kIFN0YXR1cyBSZWdpc3RlcnMoQ1NSKSBtb2R1bGUuCisg
IFRoZSBDU1IgbW9kdWxlLCBhcyBhIHN5c3RlbSBjb250cm9sbGVyLCBjb250YWlucyB0aGUgUFhM
MkRQSSdzIGNvbmZpZ3VyYXRpb24KKyAgcmVnaXN0ZXIuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBh
dGlibGU6CisgICAgY29uc3Q6IGZzbCxpbXg4cXhwLXB4bDJkcGkKKworICBmc2wsc2MtcmVzb3Vy
Y2U6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisg
ICAgZGVzY3JpcHRpb246IFRoZSBTQ1UgcmVzb3VyY2UgSUQgYXNzb2NpYXRlZCB3aXRoIHRoaXMg
UFhMMkRQSSBpbnN0YW5jZS4KKworICBwb3dlci1kb21haW5zOgorICAgIG1heEl0ZW1zOiAxCisK
KyAgZnNsLGNvbXBhbmlvbi1weGwyZHBpOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3BoYW5kbGUKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgQSBwaGFuZGxl
IHdoaWNoIHBvaW50cyB0byBjb21wYW5pb24gUFhMMkRQSSB3aGljaCBpcyB1c2VkIGJ5IGRvd25z
dHJlYW0KKyAgICAgIExWRFMgRGlzcGxheSBCcmlkZ2UoTERCKSBpbiBzcGxpdCBtb2RlLgorCisg
IHBvcnRzOgorICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydHMK
KworICAgIHByb3BlcnRpZXM6CisgICAgICBwb3J0QDA6CisgICAgICAgICRyZWY6IC9zY2hlbWFz
L2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAorICAgICAgICBkZXNjcmlwdGlvbjogVGhlIFBY
TDJEUEkgaW5wdXQgcG9ydCBub2RlIGZyb20gcGl4ZWwgbGluay4KKworICAgICAgcG9ydEAxOgor
ICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKKyAgICAg
ICAgZGVzY3JpcHRpb246IFRoZSBQWEwyRFBJIG91dHB1dCBwb3J0IG5vZGUgdG8gZG93bnN0cmVh
bSBicmlkZ2UuCisKKyAgICByZXF1aXJlZDoKKyAgICAgIC0gcG9ydEAwCisgICAgICAtIHBvcnRA
MQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gZnNsLHNjLXJlc291cmNlCisgIC0g
cG93ZXItZG9tYWlucworICAtIHBvcnRzCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQor
CitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Zpcm13YXJlL2lt
eC9yc3JjLmg+CisgICAgcHhsMmRwaSB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDhx
eHAtcHhsMmRwaSI7CisgICAgICAgIGZzbCxzYy1yZXNvdXJjZSA9IDxJTVhfU0NfUl9NSVBJXzA+
OworICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSVBJXzA+OworCisgICAg
ICAgIHBvcnRzIHsKKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgICAgIHBvcnRAMCB7CisgICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMg
PSA8MD47CisgICAgICAgICAgICAgICAgcmVnID0gPDA+OworCisgICAgICAgICAgICAgICAgbWlw
aV9sdmRzXzBfcHhsMmRwaV9kY19waXhlbF9saW5rMDogZW5kcG9pbnRAMCB7CisgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZkY19waXhlbF9saW5rMF9taXBpX2x2ZHNfMF9weGwyZHBpPjsKKyAgICAgICAgICAgICAg
ICB9OworCisgICAgICAgICAgICAgICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9kY19waXhlbF9saW5r
MTogZW5kcG9pbnRAMSB7CisgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47CisgICAgICAg
ICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRjX3BpeGVsX2xpbmsxX21pcGlfbHZk
c18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICB9OworCisgICAg
ICAgICAgICBwb3J0QDEgeworICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owor
ICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICAgICAgICAgIHJlZyA9
IDwxPjsKKworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfbWlwaV9sdmRzXzBf
bGRiX2NoMDogZW5kcG9pbnRAMCB7CisgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKKyAg
ICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2x2ZHNfMF9sZGJfY2gw
X21pcGlfbHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisKKyAgICAgICAgICAg
ICAgICBtaXBpX2x2ZHNfMF9weGwyZHBpX21pcGlfbHZkc18wX2xkYl9jaDE6IGVuZHBvaW50QDEg
eworICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47CisgICAgICAgICAgICAgICAgICAgIHJl
bW90ZS1lbmRwb2ludCA9IDwmbWlwaV9sdmRzXzBfbGRiX2NoMV9taXBpX2x2ZHNfMF9weGwyZHBp
PjsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAgfTsKKyAgICAgICAgfTsKKyAgICB9
OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
