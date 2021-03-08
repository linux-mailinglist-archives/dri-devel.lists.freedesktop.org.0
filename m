Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFD3306BE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 05:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8916E334;
	Mon,  8 Mar 2021 04:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60045.outbound.protection.outlook.com [40.107.6.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D0F6E334
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 04:06:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi4RXcM3Gol2iKZ1RZS3shmtxBBsQHzk+CLkVxEyTaVDEMYoe1oRCQWAieQkh0/OsvVeelNOqil7Dz79KEfw+ZrpCDkYmquYlwl879jZf4OWrA02n9OY/dp6x5hBSY6EQpdPLPFmoLtMZz9QM9QmSOosl75WOMXDdPLezG0pjfBlAzMsrbN7loGuCWdsaxtk6qNZD9YYg9S8gHCx5XOKAJqLwW7xV6H4BR9yNRP0mqRENsMJkw6nsDyMyUv5R3Md5ur+nS6ZYMehhXO3ZYszzHFUrNlEJ23es6xlvE1j0s7p2ItCdCdL+bvTdNsP3AW8uIFgDUDnQPgIsDgIJQF44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ejl6By0anWBMcx8dIAnvM+cP0pB66r5TAY6zdfq5Jc=;
 b=EavBYzx92QzO8P1MbLTP26Ed8erCl5j0MSxQvTmtYXQodNEIRCJdpdg+rd0WAio9HRBLPyurbFUixdNBmg+4zUKPOClqczG4ueg/xd9YZq9Ier2UpBEDio5Cx7jFA//48Uu+zr+te0PtHuu3cJy2ECKXcgZYyRHhQ0jHNoXxaLkPAqRWzkVrEjJYvhTBVTgfqP5yOi85RD7H49YPRE+JTERC/0rw96ujRWvrnsYCknpEm96aDteSUhCRQilHd9gBBf/x/10uDEFkeGRrffZycfK7DQsQE9/skGVWNrZppf21NRtkiFcNsmDCauybHP13xKhnG8WLlCseuM+oYK3DSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ejl6By0anWBMcx8dIAnvM+cP0pB66r5TAY6zdfq5Jc=;
 b=EIgLvnohM7r348bvKf0oyUk9Wcl6tTiMxE6gZHn+mch/3j8ReXfvt8K9rC3S+FG+fJAB2cxu98aUKITr55UfFokFbqeRG27WgiYjQyOzWZAemsVmcWqY103OlhkV+cZfRj0BdyF+bUeFBLK8TdnJhcBzZAMFT3gpOwrCvqFBZvc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5184.eurprd04.prod.outlook.com (2603:10a6:803:5d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Mon, 8 Mar
 2021 04:06:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 04:06:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo
 PHY support for i.MX8qxp
Date: Mon,  8 Mar 2021 11:52:20 +0800
Message-Id: <1615175541-29009-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
References: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0088.apcprd04.prod.outlook.com (2603:1096:202:15::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 04:06:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4415ffa0-d3b2-4edf-0699-08d8e1e7809e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB51840A1D25B1D2F278CB659A98939@VI1PR04MB5184.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZz0UkzH7I0Tdzm0a1hVd9OqJzrMiTKVfradCOnb8C9c1Nb9qvyKL4p8Bb8vJLFlOi4KNVRFmzoLCGWACX+ub4UEaR8gjUv+TwVFLtkJPszt5mhZFVZIUdk1QjXSZpe6Zb68uSkHVCYd+CqZuzI94/IXKS/Jkldj4eQs5zCYpf+3qZNiCiF137SUVoda6LN/TpgxMwgVQKBuS1mlpcJcP45VrFJ38uPeAf/2Y+QI1rey3KQcwn6YhxGC1jap82uQTedm8N7TWyGIQdseigrgkV2Acx1+yV3qz1Y+f/dopFqracVSy0jQER0dkE1NOgQklcHgZPk9lDrb4Vna0Y3BwoVNIy3MVXk3uQLDGDPcpeSNup7fjEb/bo1+frT11K6Isjlvwh8OmKbmQGLov8aJ4h+Jy5DqyYEt+/lhAhWLVImX9EuqG7Le+J8SDfeGJntg9+/MEYTFuG8J5IH/3okH1ho4+Qv/F59UYxghgxDp1Tb6mDZKGr/c8mZOrhytOinzYLgFgo82cnridQ7yT75rcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(956004)(66946007)(478600001)(26005)(2616005)(4326008)(2906002)(6666004)(86362001)(36756003)(83380400001)(66476007)(186003)(8676002)(52116002)(16526019)(5660300002)(316002)(6486002)(6512007)(8936002)(6506007)(7416002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3drZFBYRlE4SjZGWjlic2pnREM2dmdHd0x2RzJ4UGpoL0x4Ri9UdUxESjhj?=
 =?utf-8?B?OS9XaWR1WGJoRVlFajFTRHh6T05nS1dyNVF0QStuYWI2d1FQUk15VjJTUWg5?=
 =?utf-8?B?Qi80NHZTd2d3Z0lWUm9sZ0xmWDNtR0ZENjJuR28rQVRtN2lXaWtPam92ckds?=
 =?utf-8?B?Z3FPajlzTnMvejVMMDdOeHd3RFhCOHQzQkVPMFk1UUFJT0hkTzBzczNSRHI0?=
 =?utf-8?B?bWVoSzVCUlMzVEJpZ0ZIU2Y2M0JjYUUvbUJTcHZSOGxiRWd1NzZrSnRoMGlW?=
 =?utf-8?B?Z2lMNlBQb2hIdEdIOXBvMHIwb3hPRDRKVUlkVDZxM2xqcVgvNXkwUEU0YmNV?=
 =?utf-8?B?cW84T01uOHJDb1A4bmxwbUhRTjQ3cEN0Q2xZN1FkTk5IcFQwMnRodStScG51?=
 =?utf-8?B?M1pUaVEzTWE1RSsyMWo2bGhaZE1rb0VlUzhEa3lZcGxwbFc2TDJCUExqMmhM?=
 =?utf-8?B?SCtUdXJtN2M5K0RSV2YxWmN1SkFOWG1EM3R0MUgrV0ZBa3NIL09MMFY3WDl6?=
 =?utf-8?B?S085WVZjazNPajRjMzFGVVZNK3orWk1yZWRkMTdEK2MyZUp3UHlBT3RIS2tq?=
 =?utf-8?B?OFZ4UEREVk1XWVdUdUM4YkltZHRURGEzc0dpbWFRVytiUnFHbmVpc0ZsZlJ5?=
 =?utf-8?B?bmlTblQ1bkttSkVYSHNFMEluNzVDVlZMSHNVcndmUGlRWWVPdm5aMU95blAz?=
 =?utf-8?B?TnJoQVRKMm45UVRlQk1odUtJVitFMnRNeUdCbmdLNlZJT2ZZLytsemM2Y29r?=
 =?utf-8?B?dFpySjl0VDVGc2p3cUZlSVRlVnZpb0J4cVU5T2M3Q2taQXIyZzlLMmxhb3RZ?=
 =?utf-8?B?MnBVaWFmU1dvb1NzYnFlY3BnMEdKcHVyTzBFU2tjRFIrWVdQdXp6RktLYVNJ?=
 =?utf-8?B?WjhYcGNpRWhYL3dNVXNhSGc3aGFNUDFQY2VyK1Y1ZDZXYjgzWm14dU5tdjVI?=
 =?utf-8?B?ZkpwTUpFeTl0R0V3d29ReWFBRDNBRjhEcExDNU5IbFE3anFyQkx5Z283ZVZD?=
 =?utf-8?B?YkpZSE0yZWgyelp2b2VEQTI4UDFIQnU1T1ZRMlJ6YW56bGRoKysyM0hsbG9D?=
 =?utf-8?B?NHpYR1FpMzVDbkdGYUY3cFlPKzRWWG5DTGVxamN6WUh2MXVsNFRrdU5Td2xU?=
 =?utf-8?B?Z3lRZlpyWlVhMVRUMTN3VEZLM2VNK3lJc0dkR3dSWjAvR1VqYVFNRU1ZMmc2?=
 =?utf-8?B?aS8rNkxTaGl4dUpDNS82cms1QmF0N3h3QWE0YVcxWnhhMkxnRHQxL00zRm5v?=
 =?utf-8?B?UUdpU05mTnhYUlVtY2VsTG5RcUdMcGEwYzVwczJKTVhWMUtDRmFlY2VuTVN2?=
 =?utf-8?B?Rk92SWdPd2hpcFdrTWtpeE5UbTdtazZKc3lodzJjWDJHSUhGN1M2OHBnM2li?=
 =?utf-8?B?TUxpMmVjTEowR2Z1bldaakx2Nk8wN0RkaGZGY2xFaE1NT2JuSlp4NElDNEl4?=
 =?utf-8?B?cDdobFJrQnk0dGUycUZ3TWFzdHY4RmgyT01xQ01RbU4vMFRPT0ZVaHZxK3NV?=
 =?utf-8?B?dVArN1lUbnRtcUpLZ2xhZU1hWWVBMkl3eHpYeDh2TG03ZlpYSVEwemZLTndF?=
 =?utf-8?B?UWtQdWFrUTdIZ0lvYkpJN25CN3VmN28rOEt2ekludmJQdXErUGp1WGVXSFdK?=
 =?utf-8?B?bnlvTkhMd28wUTk3VGpSYzJUMVB1M2U3MzlyTDFGcklBZlBiRTJMLzVrTDRs?=
 =?utf-8?B?SXBlSm9jWXVtNlpvYzNaOGhIQUZuaUhwdzBaNU5JOWJSeE9sRUU2b216SGkv?=
 =?utf-8?Q?MAowb/EBQ6RbS2HusrvY9RM5toMxblsun+zslSs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4415ffa0-d3b2-4edf-0699-08d8e1e7809e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 04:06:08.6389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkDkW4NmiDuSfuJHF+I5n2QI1x0kd7cK0PN4oepJmFcIzRlqBZZs9n/0mWYAbVDURLkozXSzSVIXCs4Q9jvbeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5184
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
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIE1peGVsIE1JUEkgRFBIWSArIExWRFMgUEhZIGNvbWJvIElQCmFzIGZv
dW5kIG9uIEZyZWVzY2FsZSBpLk1YOHF4cCBTb0MuCgpDYzogR3VpZG8gR8O8bnRoZXIgPGFneEBz
aWd4Y3B1Lm9yZz4KQ2M6IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+CkNj
OiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBHdWlkbyBH
w7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9y
LmxpdUBueHAuY29tPgotLS0KdjMtPnY0OgoqIEFkZCBSb2IncyBhbmQgR3VpZG8ncyBSLWIgdGFn
cy4KCnYyLT52MzoKKiBObyBjaGFuZ2UuCgp2MS0+djI6CiogQWRkIHRoZSBiaW5kaW5nIGZvciBp
Lk1YOHF4cCBNaXhlbCBjb21ibyBQSFkgYmFzZWQgb24gdGhlIGNvbnZlcnRlZCBiaW5kaW5nLgog
IChHdWlkbykKCiAuLi4vYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS55YW1sICAgICAg
ICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS55YW1sCmluZGV4
IGMzNGYyZTYuLjc4NmNmZDcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkueWFtbApAQCAtMTQsMTAg
KzE0LDE0IEBAIGRlc2NyaXB0aW9uOiB8CiAgIE1JUEktRFNJIElQIGZyb20gTm9ydGh3ZXN0IExv
Z2ljKS4gSXQgcmVwcmVzZW50cyB0aGUgcGh5c2ljYWwgbGF5ZXIgZm9yIHRoZQogICBlbGVjdHJp
Y2FsIHNpZ25hbHMgZm9yIERTSS4KIAorICBUaGUgTWl4ZWwgUEhZIElQIGJsb2NrIGZvdW5kIG9u
IGkuTVg4cXhwIGlzIGEgY29tYm8gUEhZIHRoYXQgY2FuIHdvcmsKKyAgaW4gZWl0aGVyIE1JUEkt
RFNJIFBIWSBtb2RlIG9yIExWRFMgUEhZIG1vZGUuCisKIHByb3BlcnRpZXM6CiAgIGNvbXBhdGli
bGU6CiAgICAgZW51bToKICAgICAgIC0gZnNsLGlteDhtcS1taXBpLWRwaHkKKyAgICAgIC0gZnNs
LGlteDhxeHAtbWlwaS1kcGh5CiAKICAgcmVnOgogICAgIG1heEl0ZW1zOiAxCkBAIC00MCw2ICs0
NCwxMSBAQCBwcm9wZXJ0aWVzOgogICAiI3BoeS1jZWxscyI6CiAgICAgY29uc3Q6IDAKIAorICBm
c2wsc3lzY29uOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Bo
YW5kbGUKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgQSBwaGFuZGxlIHdoaWNoIHBvaW50cyB0
byBDb250cm9sIGFuZCBTdGF0dXMgUmVnaXN0ZXJzKENTUikgbW9kdWxlLgorCiAgIHBvd2VyLWRv
bWFpbnM6CiAgICAgbWF4SXRlbXM6IDEKIApAQCAtNDgsMTIgKzU3LDM4IEBAIHJlcXVpcmVkOgog
ICAtIHJlZwogICAtIGNsb2NrcwogICAtIGNsb2NrLW5hbWVzCi0gIC0gYXNzaWduZWQtY2xvY2tz
Ci0gIC0gYXNzaWduZWQtY2xvY2stcGFyZW50cwotICAtIGFzc2lnbmVkLWNsb2NrLXJhdGVzCiAg
IC0gIiNwaHktY2VsbHMiCiAgIC0gcG93ZXItZG9tYWlucwogCithbGxPZjoKKyAgLSBpZjoKKyAg
ICAgIHByb3BlcnRpZXM6CisgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgY29udGFpbnM6
CisgICAgICAgICAgICBjb25zdDogZnNsLGlteDhtcS1taXBpLWRwaHkKKyAgICB0aGVuOgorICAg
ICAgcHJvcGVydGllczoKKyAgICAgICAgZnNsLHN5c2NvbjogZmFsc2UKKworICAgICAgcmVxdWly
ZWQ6CisgICAgICAgIC0gYXNzaWduZWQtY2xvY2tzCisgICAgICAgIC0gYXNzaWduZWQtY2xvY2st
cGFyZW50cworICAgICAgICAtIGFzc2lnbmVkLWNsb2NrLXJhdGVzCisKKyAgLSBpZjoKKyAgICAg
IHByb3BlcnRpZXM6CisgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgY29udGFpbnM6Cisg
ICAgICAgICAgICBjb25zdDogZnNsLGlteDhxeHAtbWlwaS1kcGh5CisgICAgdGhlbjoKKyAgICAg
IHByb3BlcnRpZXM6CisgICAgICAgIGFzc2lnbmVkLWNsb2NrczogZmFsc2UKKyAgICAgICAgYXNz
aWduZWQtY2xvY2stcGFyZW50czogZmFsc2UKKyAgICAgICAgYXNzaWduZWQtY2xvY2stcmF0ZXM6
IGZhbHNlCisKKyAgICAgIHJlcXVpcmVkOgorICAgICAgICAtIGZzbCxzeXNjb24KKwogYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
