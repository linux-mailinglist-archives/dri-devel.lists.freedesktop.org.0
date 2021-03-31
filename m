Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD1034F909
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823C16E9EC;
	Wed, 31 Mar 2021 06:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E226E9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOFBBsx93Nr5lKrGAmM5Vd0RSs621s0hq0PAAJ01xG7kav62mJcUhao6wpQ9lBZFFG7R2UlXj2Pux/+gsPup04YsMrunyNU4n+c3wKkDGcU4+Q7WOaOFMDwxqwImwYr9kUcXRFH1WU28PoMieFDqcwr62cxSFD/alH3UJFJEWw1VW/n6r2m06EduHD48RUcCGEOwVRy8xDeZXHV+4XH1nSmA6l9X6X1aJ6IUOgyfG1upaYnUNAen/SDQOJ78Z9CmlQSrc5xrUV8szh/oDa2h4d+KLrhYoU+nYiB1YVlz/x0fkM87pTWrOCtWxO3W8lmP04jEY6MPExpqX4nSSTVl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLTGvSsFUIGytzOZ+vKY3syhSDxCzbKula7lrr7jotQ=;
 b=mrTu04HBI5LmT7XgY4Apwe47+fHvQAqTZF/WDvRjRwlN2roQeYgaVx3ZJtoqDFoOv66zZEiA3lcl0EOi1ZTrX8u9DZu3laZvEtj2DWyksm+BpKfpPh+cSX1xfS/PVrSUZ1KqOtsSZMGHdImrTO6gECG/GkbrIg4Bmes0LOmAV+7+Cv7xVKteNkn55U/sdAgFi/Ub5P4um3v4Coj4inaZnuKwiojOiXczyVEQMzFgw8BnpKEypMwrw/VA7xxgeyyNGFS9bsHh6zpscbdwoRqST3YA33NuGr1obrhlpsexB7X3jWhUsqDFzuF+UZYsUEnase7ydQGijh2sSqGGVIFj8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLTGvSsFUIGytzOZ+vKY3syhSDxCzbKula7lrr7jotQ=;
 b=jbWPJZraLroZ9ZOX+4lwCHPk5h7PfiDdZAxI+VG/YjNR2eCtOxG2yRy5ma950CVSPZt+i7zHFvQ/zC1jzh8ZVOc73VWdmE8ePvFmRnJb5oyVVstOOhmM3xaVI2DwEtdK5HN8oEsMjuAuz6Gw4CrDpI7ffFF/+L1G8n/2hhOLXPY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:49:22 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:49:22 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Wed, 31 Mar 2021 14:33:19 +0800
Message-Id: <1617172405-12962-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:49:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 651f3b43-1337-427b-ee25-08d8f4111d9b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB63494941CE4A17171306F574987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PATS8ObErPAmE8B6HY8WWIzBsUTADSGsotIwo0PSjHvJw0zgsW4anwgU4S1cSm6pNJl1GHlRJ6E3Pxpn48jgTl5kO30zUSC7kJOb9IqFpcmzAvHSUi7KsbDkOfJ21/FQJLlB8WpzdT6qG848EDnibKgXnk06zYdOtPvGHwJHHXdMgWyN+d3EgHqUR5xuf5mNkDbeBc1iCWilsal4/ganU2v1/mhJXnUUdZIBJ5ZC9+XWzHa4QGqkigdobdoIxKO/zA8kwxDoCAvSaid8SkAyxiRgSyaTAQ8KDW4VE7XbBVmNFa1mbWQTneOZCob1k/fFFlwXAqkO5vxOtelH2fJ3/SvUfemLKLXpxo34GH0wgfsisgNBKCCAP0R/JORmj3MQ3RgajvfMnlW1gwV7guM07NpZ3o8Tmqe/KA+W4/tWYc3NRinoSOL2MUzII1ey7h8Er76vTYhKsZ/bshS8HW1Bqma54eL3XwXCWGN+sNVDK5/Kktz8/4TC8ddpcHmYVuBa2IBZ4MI5wl0D8zdmABuClpEfx35yW3kmKY+YtyOHdRW1vQr/wZ2YJZXWVAi+5F5TIWHiVW0zfe9CjEmWzq/MlFLnMugCdsdGsVkIn6g8uriQnRqBYVa7cN7BVEUq+y8RWOvyL26FGlKnBbUh6y6JQe+2M7B/+TLAjSqtGyFl7tFXhORXp8Xn0c1XCwE3AAb9WEEI76BpX7bLJYkf8z0+fzQnuTxEs/dN1GyIMpHlEYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(7416002)(52116002)(966005)(86362001)(6512007)(8676002)(6506007)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(36756003)(2906002)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NHBGM0V2SFlJQmpDUDl6K0IrRXpFa1RVLyt6UEJJdS9pQXQxYWNPR3gyTjM5?=
 =?utf-8?B?cE1tU3JVYjg2UmFUUXlUSUw4MkhTbTNTOEtaTGkzcldzK0w0TC8xR1ZWS0dz?=
 =?utf-8?B?dCtPK3dYVTNublgyd3JQOUQzVmxSd0VYR0FleUZ1dERlWlV4TEorL0RNdzBN?=
 =?utf-8?B?QlRVUlFSWHJrdDQyeURzOGh4S2M4V1dBVFBmRTNqV04rWHRmSmx4MWpZdnU5?=
 =?utf-8?B?TDhacWUvRTRUQnZmT3QwYmtOSnRMN2ZNcUJjWDdUK1dvZ3Q3U3Buakluc0h0?=
 =?utf-8?B?QjZFWm4zaVhSRG5ZaTM1TE5RN1BYWmgxcXJOVTlvaVFxTDJsMHVwRjgyempB?=
 =?utf-8?B?UTZZcnpFNkJMdlNPZjJvbWlqcmxPbkY1V1BhM1BkTzlJNWorQ01jMUF6Q3FL?=
 =?utf-8?B?VFkwT0cvM0RDVVRuUmp2aGpsblV3aG1vcVFjeEJjcWFsMWtCUTVUZVA3Q3Zi?=
 =?utf-8?B?UXpXbGV4cUlnZHViMFM3Yzkya1pSTVgxNWdCci93TkF2ODgwWCtWVkpEc3JS?=
 =?utf-8?B?azlEa2ZmWWxFRnRoNUljaElXdEVrT0xzUG1ZVi92RkI4dE5XdFVrc0JmdmJN?=
 =?utf-8?B?MDl5TXE1WE5VelBZRFI0TFBHbGdXTlZmUXdsMGwxbk42L00wd25qTldpdEgr?=
 =?utf-8?B?b3laQ0J4Z09ZMzRlKzRkdzlXN2Q0NGhjM1VndXNxanhKNXBBQzRUclR6VHVu?=
 =?utf-8?B?ZHAra24rTjE4Slk5RlhLejlVUWN5TkRiVkFkRlp2SDhFWTdod1Z2bHNEMHBX?=
 =?utf-8?B?QWF0OExvclZhQ0FQT3ZBUk83bDBCdGhhUEs1TUNXaSthRE9hWmY0cE9wamZO?=
 =?utf-8?B?TjZKRlZNcFlibHJQczVrb0Y3UVZPcTMvbm1yTk1SK0ZQR0dTc2JDdlZIZHkv?=
 =?utf-8?B?dVRJZW5uelk3WnF6MzdmSXZOTE1xeGc3MGtGUlZIaHkyd1dvQVBpaFNuZnlS?=
 =?utf-8?B?WC9UZG1oZk02QWM1SWhLeUpFN0JwNDV4L2ZHOGl0YXhhYVQ5TWllYlhYWDJT?=
 =?utf-8?B?OWc1am40YUxWTXA0cFI3eERZLzZWL3RSMC8rbTV6bmV1NkY2Mm5zQ2ZjcC9y?=
 =?utf-8?B?TW4wUm5EeUVobXo1WTRUL2hHOVpYOG9lKzdSQjNzK0ROT0thZENaam9OeDNo?=
 =?utf-8?B?bE43Q2RkUnlvdi9Ib08rQmE4UUFpbFFBZHRCTzVxL21nd2hWY1dpa2RCTHhG?=
 =?utf-8?B?dE5xeVh3bERCbUt2eWZhYm9Zc2U0aHZkajRLelI2dVNlazA5cVFPaGFmUHBK?=
 =?utf-8?B?RjlTaUFtSDJHTXNLcHBPNllYTkZnZkF1aVN1M3cvMlQyNkdkMTRlVWJoK1JY?=
 =?utf-8?B?R3c0YnZ4T2lCQzhtOEFqWlRWOE5IekRaK3BBZXBDa2lzNWJoOUwxM1MxcVBk?=
 =?utf-8?B?WVNISGpMVHFyeU1RS2pyRkhzc0hJNXZ6QURpMW9pYy8ySXVQWmFmUHFsWHda?=
 =?utf-8?B?bEg1dWJLaHJtYi8rWndZVlR4TWpCRmNVeENqYWw3dmk5V3dTRzlaaVVKOVhY?=
 =?utf-8?B?K0J6VXNDd1k3cFFKYThSRWlva3BMZU9EZ2EyQTVFR3NQM2d0ams3cndEV014?=
 =?utf-8?B?NEJ2NWxZVStSNVgyYlE1cmhzVXVwc1o5RFlxZFBlSE9iWHFWUytTanJoTzRE?=
 =?utf-8?B?RFZ1WkowTFZtUmFoMk1sR21MTkswajhialBrdHJickg0N2pmSzBFaWs3V0xP?=
 =?utf-8?B?akRyb0trODBSTVYvRU9ncU5rWDZ0ZTFISnEzdkloMjUrOFVIa1VIN2x1Y09j?=
 =?utf-8?Q?ed0d840rWywyf0amXmGus912zfAkDdnjB3UAhPw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651f3b43-1337-427b-ee25-08d8f4111d9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:49:22.3643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78kMQYt902XTwaqUEYmZFVz1uMP9Dzy3z+X8/k6f0eS+usJXex3FcOkfL7PRio0miCqjUiHqjXJtvkN+hilADQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGJpbmRpbmdzIGZvciBpLk1YOHF4cCBwaXhlbCBsaW5rIHRvIERQSShQ
WEwyRFBJKS4KClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPgotLS0KdjYtPnY3OgoqIE5v
IGNoYW5nZS4KCnY1LT52NjoKKiBBZGQgUm9iJ3MgUi1iIHRhZy4KCnY0LT52NToKKiBObyBjaGFu
Z2UuCgp2My0+djQ6CiogQWRkICdmc2wsc2MtcmVzb3VyY2UnIHByb3BlcnR5LiAoUm9iKQoKdjIt
PnYzOgoqIERyb3AgJ2ZzbCxzeXNjb24nIHByb3BlcnR5LiAoUm9iKQoqIE1lbnRpb24gdGhlIENT
UiBtb2R1bGUgY29udHJvbHMgUFhMMkRQSS4KCnYxLT52MjoKKiBVc2UgZ3JhcGggc2NoZW1hLiAo
TGF1cmVudCkKCiAuLi4vZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRwaS55YW1sICAg
ICAgICB8IDEwOCArKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMDggaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNs
LGlteDhxeHAtcHhsMmRwaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMC4uZTRlNzdmYQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwy
ZHBpLnlhbWwKQEAgLTAsMCArMSwxMDggQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvZnNsLGlteDhxeHAtcHhsMmRw
aS55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCisKK3RpdGxlOiBGcmVlc2NhbGUgaS5NWDhxeHAgUGl4ZWwgTGluayB0byBEaXNwbGF5
IFBpeGVsIEludGVyZmFjZQorCittYWludGFpbmVyczoKKyAgLSBMaXUgWWluZyA8dmljdG9yLmxp
dUBueHAuY29tPgorCitkZXNjcmlwdGlvbjogfAorICBUaGUgRnJlZXNjYWxlIGkuTVg4cXhwIFBp
eGVsIExpbmsgdG8gRGlzcGxheSBQaXhlbCBJbnRlcmZhY2UoUFhMMkRQSSkKKyAgaW50ZXJmYWNl
cyB0aGUgcGl4ZWwgbGluayAzNi1iaXQgZGF0YSBvdXRwdXQgYW5kIHRoZSBEU0kgY29udHJvbGxl
cuKAmXMKKyAgTUlQSS1EUEkgMjQtYml0IGRhdGEgaW5wdXQsIGFuZCBpbnB1dHMgb2YgTFZEUyBE
aXNwbGF5IEJyaWRnZShMREIpIG1vZHVsZQorICB1c2VkIGluIExWRFMgbW9kZSwgdG8gcmVtYXAg
dGhlIHBpeGVsIGNvbG9yIGNvZGluZ3MgYmV0d2VlbiB0aG9zZSBtb2R1bGVzLgorICBUaGlzIG1v
ZHVsZSBpcyBwdXJlbHkgY29tYmluYXRvcmlhbC4KKworICBUaGUgaS5NWDhxeHAgUFhMMkRQSSBp
cyBjb250cm9sbGVkIGJ5IENvbnRyb2wgYW5kIFN0YXR1cyBSZWdpc3RlcnMoQ1NSKSBtb2R1bGUu
CisgIFRoZSBDU1IgbW9kdWxlLCBhcyBhIHN5c3RlbSBjb250cm9sbGVyLCBjb250YWlucyB0aGUg
UFhMMkRQSSdzIGNvbmZpZ3VyYXRpb24KKyAgcmVnaXN0ZXIuCisKK3Byb3BlcnRpZXM6CisgIGNv
bXBhdGlibGU6CisgICAgY29uc3Q6IGZzbCxpbXg4cXhwLXB4bDJkcGkKKworICBmc2wsc2MtcmVz
b3VyY2U6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
CisgICAgZGVzY3JpcHRpb246IFRoZSBTQ1UgcmVzb3VyY2UgSUQgYXNzb2NpYXRlZCB3aXRoIHRo
aXMgUFhMMkRQSSBpbnN0YW5jZS4KKworICBwb3dlci1kb21haW5zOgorICAgIG1heEl0ZW1zOiAx
CisKKyAgZnNsLGNvbXBhbmlvbi1weGwyZHBpOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3BoYW5kbGUKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgQSBwaGFu
ZGxlIHdoaWNoIHBvaW50cyB0byBjb21wYW5pb24gUFhMMkRQSSB3aGljaCBpcyB1c2VkIGJ5IGRv
d25zdHJlYW0KKyAgICAgIExWRFMgRGlzcGxheSBCcmlkZ2UoTERCKSBpbiBzcGxpdCBtb2RlLgor
CisgIHBvcnRzOgorICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9y
dHMKKworICAgIHByb3BlcnRpZXM6CisgICAgICBwb3J0QDA6CisgICAgICAgICRyZWY6IC9zY2hl
bWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAorICAgICAgICBkZXNjcmlwdGlvbjogVGhl
IFBYTDJEUEkgaW5wdXQgcG9ydCBub2RlIGZyb20gcGl4ZWwgbGluay4KKworICAgICAgcG9ydEAx
OgorICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKKyAg
ICAgICAgZGVzY3JpcHRpb246IFRoZSBQWEwyRFBJIG91dHB1dCBwb3J0IG5vZGUgdG8gZG93bnN0
cmVhbSBicmlkZ2UuCisKKyAgICByZXF1aXJlZDoKKyAgICAgIC0gcG9ydEAwCisgICAgICAtIHBv
cnRAMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gZnNsLHNjLXJlc291cmNlCisg
IC0gcG93ZXItZG9tYWlucworICAtIHBvcnRzCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Zpcm13YXJl
L2lteC9yc3JjLmg+CisgICAgcHhsMmRwaSB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlt
eDhxeHAtcHhsMmRwaSI7CisgICAgICAgIGZzbCxzYy1yZXNvdXJjZSA9IDxJTVhfU0NfUl9NSVBJ
XzA+OworICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSVBJXzA+OworCisg
ICAgICAgIHBvcnRzIHsKKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgICAgIHBvcnRAMCB7CisgICAgICAg
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47CisgICAgICAgICAgICAgICAgcmVnID0gPDA+OworCisgICAgICAgICAgICAgICAg
bWlwaV9sdmRzXzBfcHhsMmRwaV9kY19waXhlbF9saW5rMDogZW5kcG9pbnRAMCB7CisgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZkY19waXhlbF9saW5rMF9taXBpX2x2ZHNfMF9weGwyZHBpPjsKKyAgICAgICAgICAg
ICAgICB9OworCisgICAgICAgICAgICAgICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9kY19waXhlbF9s
aW5rMTogZW5kcG9pbnRAMSB7CisgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47CisgICAg
ICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRjX3BpeGVsX2xpbmsxX21pcGlf
bHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICB9OworCisg
ICAgICAgICAgICBwb3J0QDEgeworICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
OworICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICAgICAgICAgIHJl
ZyA9IDwxPjsKKworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4bDJkcGlfbWlwaV9sdmRz
XzBfbGRiX2NoMDogZW5kcG9pbnRAMCB7CisgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsK
KyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2x2ZHNfMF9sZGJf
Y2gwX21pcGlfbHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisKKyAgICAgICAg
ICAgICAgICBtaXBpX2x2ZHNfMF9weGwyZHBpX21pcGlfbHZkc18wX2xkYl9jaDE6IGVuZHBvaW50
QDEgeworICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47CisgICAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9sdmRzXzBfbGRiX2NoMV9taXBpX2x2ZHNfMF9weGwy
ZHBpPjsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAgfTsKKyAgICAgICAgfTsKKyAg
ICB9OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
