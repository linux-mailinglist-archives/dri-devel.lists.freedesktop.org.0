Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7233E7F7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C9D6E4B6;
	Wed, 17 Mar 2021 03:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923136E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:57:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0DTVu+UazcDzQMpZk3MGxiwU5NF0LMr5p1M3wvueNeH3H74eLUYuv9wlrhOXRARgxd0HVEZhrclydhi2DCkP3LJ4B16duyuK5mpV9uhGsNyBhIW1qo1SLm48CftNiTkmd+NFKHgRx5wEJom2SNLGugdtuPakmVhP9hjJ1Bg3HSHH0cl0RHNwVhE2MhaJ0oDb4uEeEqHf6D8PuM8cQW8Lklbkvv8ZpXLoOsi04ppDWCD1zjfLmwHEDqOa7xzFA/HFsyroa1W3WBb8qE2nGSGjUwgO/k4ecDTg4OANTytQwkB5A4pHSSmmVBGhMS4DybkFNM87M1jgbK3lPK/Zqdc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTFc8QR234I5rNEHOIn61/RV3xcv8F9EqsBbIWWUCGE=;
 b=mqOK9DMBoyxXN7qOLC4aEA/vemqWlYfF/4Ihp18+CqGxpfg2pHC+5KOitFFgCvP1uJLxnPL5elLmq8ivZMPz9UKWuNvIa2hUSTIp3ThRHh5j0detviSHCFkf4mDVIx/YjPh8bpJknpIreBjsCAj3f9kEomkJJ2CVhQxwI2FQd1YwCuLEbMg9Y+OcycxzsttXxetC9Fdp4Uti8mhvxG+fBoFP5lgx6xbAqSVZf9QFclKubBxW6Hl9WcJIyFhsuEeqeVGE0o66ex8U3d5jvFAG4AUaxioZNGXuOVy7YfBfrEPLiis33HaHfCsp6wCAybvRew051QmRnQEcMuu3bBqkcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTFc8QR234I5rNEHOIn61/RV3xcv8F9EqsBbIWWUCGE=;
 b=VRcggj/RxTjfX70aphYsX2WU7SxMf9nYyJxULwbg6O4QM1foVCb2JaTLFU3lDcr6AekqcHy6pDbFL+fhEQC+Vtr1tdglpWBNqAbtry9L3ZPVwlmPpTo+/OxDlZUYBNNRQSdtqu5hJZcI6fQqE+mtSCYVt0w/sL1bFJqiQeM0LWI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:57:07 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:57:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 08/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Wed, 17 Mar 2021 11:42:43 +0800
Message-Id: <1615952569-4711-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:57:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d01ddfbf-714c-46f4-e449-08d8e8f8bbb9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6141BDE06B2C7B28819E3EB4986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LT4L8HLRfqybUTU8UknpujOyojcPo1oclpSQiVHYVo0eZHBlzhQ/1X+Qyxq+c6G3eBJSSKKwWMZl5JqZ7WI25MuDgmyY4UtWm9Rxfl7bOlyXkcXfwcShF3xi6SpS4KJ8QTegj29jcL9DPI0ptbOZzdCFHOtdxdl7AyH+bGlFFOd0EMSKXDKUyt+T01M7Qxi1/6k4YCERqbspUSI/gB7iN3Jv42sSBd1A4Dsk4ZSCvpW8xcxELTSFLCHv2mpgCVdZg9t/lXCRrBGusFkPd8QRNREhfIKVDZn1KL+WURqTPgMxRJkXRgyq1+Jutg/WWDG5InUb8n5sv3y2atfX52n6GYe1bQQfeC9tUK1m5HG0PntJhh9fuBb2sWvOM+qepUd1Lois2/xSFoPYlPnKnUgUl9knfrTmM0C5wJk5laTVSK7pTWVQkDFqbiqvn4QBNAUyIeF9bDYNYuRqbB4/p0XDVXujc1a/cIGxI/5J77Em675pToT9rOCesjfQQs58ipZysF2ck91ZhSdfajD9u/T/OGSTwmUCwum37hnpJIiB1gzsoiddnEWTGYDg8gP7XEAjxvNV5KC+enwjkTKT/ZiWgBBWuGrK6xnjKd8rkFucdBVNfET4GNJgOTafIUA04Veo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(6666004)(478600001)(966005)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d2pSeFRVMS96RE1icDlDTkRLcms3TkVjNVBRWG5LWXRPdHhHTHJVVHFQWXoz?=
 =?utf-8?B?cEttbmdJai9LSURPU29aQ2c4ZURPQ05BR2JZL29kbEFFdmVhdTBLNEMwc0NM?=
 =?utf-8?B?Nk1XbU1TdG56aHNZeVhPR01WMXgvQUNlU3Q0VGdacWxhMW5DR2dncCt0T2pr?=
 =?utf-8?B?Tms2OVBiMy8rVW9hNDR6NzVNSkJneXRCUXY2VTFqUThjWHdqYnBraXZ2NFRE?=
 =?utf-8?B?RlVqK3VZd3RPWDR1VUNBMS9uQjlyYThFU1R2Snp2VDdPbi84NDZLOUFhRjdz?=
 =?utf-8?B?R242eFh0cUxDTHE3Zmg1L2JMVVVsVjBZVFcrMGhGVjVJVkg2MmtGd3NiN0JU?=
 =?utf-8?B?SEVSaGZKR3NNc0RESkRFN08ydVgrZUNweHBsdmxCSE9MbEpDcURCYVdYb09T?=
 =?utf-8?B?enRqT0luZllBM0x2VSs5ZWRFMkp0SHNQT0djd0wwTDJacWVoblhjOFZaMUJy?=
 =?utf-8?B?VG1uek52U1lkN2dIZGowN3V4L1NmRTRsdHVKWm5nbFpZWHE4N052dTVDOEdh?=
 =?utf-8?B?QUJoRjhvUUUyOE1FVW5ndHhXeDZldjFnRC9JbDZwR0tiR3NtV0NudExZNDk1?=
 =?utf-8?B?SWpaMUtIcVhuYmljbGhLTllTL3BxaUkxaElRb3dISlhuVWpaeHdZcFpJUW91?=
 =?utf-8?B?VWI0LzFTeEYwZ080Nk01YXNSKzV4MnVMRkpHdlBlckV1aWtteWNyWHdTZk51?=
 =?utf-8?B?M1FWWDkzWVd6TTUwQWhvTDZiQ3lzZytHWUdYWlEzdHU1K3pKQ3hPU2RNMGc3?=
 =?utf-8?B?UVJIanJPNXFhck1NSnExMXEvakJuTUlWY2ptQ3czWGhBeXN4bUlvbHFva3dl?=
 =?utf-8?B?V0ZQa082U3ZocUgwNEF2ajBEU3RKT2dXckxWT2xNSVNKdENDYWRTUXQ4YTBS?=
 =?utf-8?B?YkszUEI1SWhBQ25mZnRGQ0xYU0s0MEc5NHZUb0liMWhUZ0dKeUxoSXlUUEVP?=
 =?utf-8?B?Ujl0SVllMENJYU9tWURXQmZpRHVPb0NtR2w5a21xMlVQM1N0aTJwdWIvQnJx?=
 =?utf-8?B?YldyZXNWTjQ2MmpvNmwxRmpnUXNkQVFQajhGcm0yVUcvSC9JS3lNeVZlQXlB?=
 =?utf-8?B?U1ZjN3pGTGhXR2YrU2JjL2hUdy9NbktQcFR1MlR2Y0VrM0U4dDZ1UDh5YTQr?=
 =?utf-8?B?aFcrbjlZV3dMTEZpUmQzRFJ5QXg0V2kvNlROdkNFR2JYZHZYV2UrMWZyTjhN?=
 =?utf-8?B?aTJXcmRJalIrSXRZS2xtQU03RXprTlV1RndMZmxLYXNkOHArTGIxbE9lc3h4?=
 =?utf-8?B?UmMzYjBWTzFzaEhBc1dHaVZORjl5NlZLZEtXY0FLcW1wazdPSE1ucnRaVmJl?=
 =?utf-8?B?enFqeUo1M0V6d3RVejY3REVJQWMvREFYYmRGMFE3QUEzK0ZpL0x2amRvNWpo?=
 =?utf-8?B?TmhUd0xwR1p2VzloT3c4dyswcm5DeCtwYXJTV2prMU0wNDl0Y3JQalBFY1RE?=
 =?utf-8?B?a2xIYmttdWR2a1N3VjlBd201Y21kS1FiMzFBVzVyQVhwT0xRc3VBclgzWXN5?=
 =?utf-8?B?TWdtaWI0SSs0c293UC9kR09MU0lIUmFGZFhmTm9aZ0ZHeHI3U3pnVjBJbkFB?=
 =?utf-8?B?dzRkNWlpajYwdk5mQ2pLY3VQamZVSGRqb0wrL1FNOVZTM0pIMHNKa3QzTDd5?=
 =?utf-8?B?NkJkNVVZa1RDdWRUbUU2VWhmeDI5US9Kb0RicVJkdDNyOFFIMC8zblltK3Fa?=
 =?utf-8?B?Q1Y0UEJsNlBkSkR0NHB2SjRSZG41aThMaDNraDlzcE5Sb0doUGNNOC82Q1F0?=
 =?utf-8?Q?FT4TZgUGJWRlAWdkTo/L60yxreKMnNBVA6LmEOp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01ddfbf-714c-46f4-e449-08d8e8f8bbb9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:57:07.4109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3R8egXubhupK0HD06S40MoIrQLDa3lEXaA173HNbcz6Tz7+GY6B/fm9gqYOtwxx0ORW+PxzO5gFX+P7omDNNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
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
WEwyRFBJKS4KClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPgotLS0KdjUtPnY2OgoqIEFk
ZCBSb2IncyBSLWIgdGFnLgoKdjQtPnY1OgoqIE5vIGNoYW5nZS4KCnYzLT52NDoKKiBBZGQgJ2Zz
bCxzYy1yZXNvdXJjZScgcHJvcGVydHkuIChSb2IpCgp2Mi0+djM6CiogRHJvcCAnZnNsLHN5c2Nv
bicgcHJvcGVydHkuIChSb2IpCiogTWVudGlvbiB0aGUgQ1NSIG1vZHVsZSBjb250cm9scyBQWEwy
RFBJLgoKdjEtPnYyOgoqIFVzZSBncmFwaCBzY2hlbWEuIChMYXVyZW50KQoKIC4uLi9kaXNwbGF5
L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwgICAgICAgIHwgMTA4ICsrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwOCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZnNsLGlt
eDhxeHAtcHhsMmRwaS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwLi5l
NGU3N2ZhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2ZzbCxpbXg4cXhwLXB4bDJkcGkueWFtbApAQCAtMCwwICsxLDEw
OCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L2JyaWRnZS9mc2wsaW14OHF4cC1weGwyZHBpLnlhbWwjCiskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEZyZWVz
Y2FsZSBpLk1YOHF4cCBQaXhlbCBMaW5rIHRvIERpc3BsYXkgUGl4ZWwgSW50ZXJmYWNlCisKK21h
aW50YWluZXJzOgorICAtIExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+CisKK2Rlc2NyaXB0
aW9uOiB8CisgIFRoZSBGcmVlc2NhbGUgaS5NWDhxeHAgUGl4ZWwgTGluayB0byBEaXNwbGF5IFBp
eGVsIEludGVyZmFjZShQWEwyRFBJKQorICBpbnRlcmZhY2VzIHRoZSBwaXhlbCBsaW5rIDM2LWJp
dCBkYXRhIG91dHB1dCBhbmQgdGhlIERTSSBjb250cm9sbGVy4oCZcworICBNSVBJLURQSSAyNC1i
aXQgZGF0YSBpbnB1dCwgYW5kIGlucHV0cyBvZiBMVkRTIERpc3BsYXkgQnJpZGdlKExEQikgbW9k
dWxlCisgIHVzZWQgaW4gTFZEUyBtb2RlLCB0byByZW1hcCB0aGUgcGl4ZWwgY29sb3IgY29kaW5n
cyBiZXR3ZWVuIHRob3NlIG1vZHVsZXMuCisgIFRoaXMgbW9kdWxlIGlzIHB1cmVseSBjb21iaW5h
dG9yaWFsLgorCisgIFRoZSBpLk1YOHF4cCBQWEwyRFBJIGlzIGNvbnRyb2xsZWQgYnkgQ29udHJv
bCBhbmQgU3RhdHVzIFJlZ2lzdGVycyhDU1IpIG1vZHVsZS4KKyAgVGhlIENTUiBtb2R1bGUsIGFz
IGEgc3lzdGVtIGNvbnRyb2xsZXIsIGNvbnRhaW5zIHRoZSBQWEwyRFBJJ3MgY29uZmlndXJhdGlv
bgorICByZWdpc3Rlci4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDog
ZnNsLGlteDhxeHAtcHhsMmRwaQorCisgIGZzbCxzYy1yZXNvdXJjZToKKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBkZXNjcmlwdGlvbjogVGhl
IFNDVSByZXNvdXJjZSBJRCBhc3NvY2lhdGVkIHdpdGggdGhpcyBQWEwyRFBJIGluc3RhbmNlLgor
CisgIHBvd2VyLWRvbWFpbnM6CisgICAgbWF4SXRlbXM6IDEKKworICBmc2wsY29tcGFuaW9uLXB4
bDJkcGk6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRs
ZQorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBBIHBoYW5kbGUgd2hpY2ggcG9pbnRzIHRvIGNv
bXBhbmlvbiBQWEwyRFBJIHdoaWNoIGlzIHVzZWQgYnkgZG93bnN0cmVhbQorICAgICAgTFZEUyBE
aXNwbGF5IEJyaWRnZShMREIpIGluIHNwbGl0IG1vZGUuCisKKyAgcG9ydHM6CisgICAgJHJlZjog
L3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cworCisgICAgcHJvcGVydGllczoK
KyAgICAgIHBvcnRAMDoKKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVy
dGllcy9wb3J0CisgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgUFhMMkRQSSBpbnB1dCBwb3J0IG5v
ZGUgZnJvbSBwaXhlbCBsaW5rLgorCisgICAgICBwb3J0QDE6CisgICAgICAgICRyZWY6IC9zY2hl
bWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAorICAgICAgICBkZXNjcmlwdGlvbjogVGhl
IFBYTDJEUEkgb3V0cHV0IHBvcnQgbm9kZSB0byBkb3duc3RyZWFtIGJyaWRnZS4KKworICAgIHJl
cXVpcmVkOgorICAgICAgLSBwb3J0QDAKKyAgICAgIC0gcG9ydEAxCisKK3JlcXVpcmVkOgorICAt
IGNvbXBhdGlibGUKKyAgLSBmc2wsc2MtcmVzb3VyY2UKKyAgLSBwb3dlci1kb21haW5zCisgIC0g
cG9ydHMKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwK
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZmlybXdhcmUvaW14L3JzcmMuaD4KKyAgICBweGwy
ZHBpIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1weGwyZHBpIjsKKyAgICAg
ICAgZnNsLHNjLXJlc291cmNlID0gPElNWF9TQ19SX01JUElfMD47CisgICAgICAgIHBvd2VyLWRv
bWFpbnMgPSA8JnBkIElNWF9TQ19SX01JUElfMD47CisKKyAgICAgICAgcG9ydHMgeworICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsKKworICAgICAgICAgICAgcG9ydEAwIHsKKyAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgICAg
ICAgICByZWcgPSA8MD47CisKKyAgICAgICAgICAgICAgICBtaXBpX2x2ZHNfMF9weGwyZHBpX2Rj
X3BpeGVsX2xpbmswOiBlbmRwb2ludEAwIHsKKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+
OworICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRjX3BpeGVsX2xpbmsw
X21pcGlfbHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAgIH07CisKKyAgICAgICAgICAg
ICAgICBtaXBpX2x2ZHNfMF9weGwyZHBpX2RjX3BpeGVsX2xpbmsxOiBlbmRwb2ludEAxIHsKKyAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKKyAgICAgICAgICAgICAgICAgICAgIHJlbW90
ZS1lbmRwb2ludCA9IDwmZGNfcGl4ZWxfbGluazFfbWlwaV9sdmRzXzBfcHhsMmRwaT47CisgICAg
ICAgICAgICAgICAgfTsKKyAgICAgICAgICAgIH07CisKKyAgICAgICAgICAgIHBvcnRAMSB7Cisg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICAgI3Np
emUtY2VsbHMgPSA8MD47CisgICAgICAgICAgICAgICAgcmVnID0gPDE+OworCisgICAgICAgICAg
ICAgICAgbWlwaV9sdmRzXzBfcHhsMmRwaV9taXBpX2x2ZHNfMF9sZGJfY2gwOiBlbmRwb2ludEAw
IHsKKyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+OworICAgICAgICAgICAgICAgICAgICBy
ZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfbHZkc18wX2xkYl9jaDBfbWlwaV9sdmRzXzBfcHhsMmRw
aT47CisgICAgICAgICAgICAgICAgfTsKKworICAgICAgICAgICAgICAgIG1pcGlfbHZkc18wX3B4
bDJkcGlfbWlwaV9sdmRzXzBfbGRiX2NoMTogZW5kcG9pbnRAMSB7CisgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwxPjsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZt
aXBpX2x2ZHNfMF9sZGJfY2gxX21pcGlfbHZkc18wX3B4bDJkcGk+OworICAgICAgICAgICAgICAg
IH07CisgICAgICAgICAgICB9OworICAgICAgICB9OworICAgIH07Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
