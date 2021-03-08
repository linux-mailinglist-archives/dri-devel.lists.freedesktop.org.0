Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C09E3306BD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 05:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D6B6E311;
	Mon,  8 Mar 2021 04:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E168A6E311
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 04:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1qNoYLWSrmxjvZkvspkj52/giTsYCr0KBz8Hc37gMawvKdA/ZkT5zSIGU0rG/TKJMdWFOH5ZKzVj4D0H4vyjXMjqIPbnrTdz8s94mG2ICxJpS2Krco7VpkcTPZgdTSrBND0nB9nuNBKv7suURZQGnNWS4BSRu8GNwTS/yu4awE2q9NzW2AOtjSCHgWQwzf2Chtmbo9mGGWOeMGJ9Vk6z93/QLhPswpVW+iWlNCeWFfFm3tK+jy41Nfo2eZvqXr1VcrBq6i5CZ82XDh8euv0PsNxlkvSZ+oL5moFDC1irxF5GYYcdyVKvgEgrwPT58Xyi7LhhSfWlAWFSGxzC8LR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmm40p51s6caJ6CzKnCIXNbh+ZLkxm0me6fSvaEnsTE=;
 b=UmE7vU47tls5gmUZpv9JDBfYKoTbpT1kG5gKXEjOUTsyHysLfeDKLQTw1zGC1TkBsXdJuOQ41JSfe+OURWtHslNJXLg/W9nzoFO3KcEiVwVnjS+PU2fpTpJ2dsnVG3DV1PZ4/zwjvH3vbHhYvDkCrtrl0TcsK+kkIsq3IE/cWBaWICy4XyHEnhS2nVKbOc1aHY+tPWCoMfKTiDAyhMQo0uT3+uHJo1TARVaKZ8J6vtdUx18hQxjmIOVzH+1tfZtSxwGHpMJxNS48R2A583jP9ufw5IztjGxI4m4g4wTnWuVQlpe0QFtvlAgTvhc7flr5Eo4U9IOKviksW9sBGJFkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmm40p51s6caJ6CzKnCIXNbh+ZLkxm0me6fSvaEnsTE=;
 b=Iuf9m75L5gcq+FEj0KE5nbtd3zhCWM2/BbHTuB4UmoyZKwGSXOkteiciobUisKWGnAr5Nef4qO/xULwx+Zxv7fMsB6KxudnOH8YwEhbwrcHWeoTQfcYiOQZonE1gQeqCGT2fRDCeuphRdXN1/Aj4hcPXBEsFY9i9I9aJbJIoL9Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3310.eurprd04.prod.outlook.com (2603:10a6:802:11::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Mon, 8 Mar
 2021 04:06:02 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 04:06:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Mon,  8 Mar 2021 11:52:19 +0800
Message-Id: <1615175541-29009-4-git-send-email-victor.liu@nxp.com>
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
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 04:05:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e58561e-8edf-4de5-07af-08d8e1e77cbc
X-MS-TrafficTypeDiagnostic: VI1PR04MB3310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB331071C299D7A850FF615F8498939@VI1PR04MB3310.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8Wk3SQyrEx3LqZcphdxHCbeTx0/svDOa4x+m4qoHw/09T8wyRXGP5kyTUQAJx6g/FM6zy7YSsT+INJwB+m5971NgSWwfeOceUTgUS9i4N46uwwEIXIo+KPlPyHWdML1imUBaHPMC039+NXB8FEfPrGhjJ/U5HH9u26dbYliCluXegrUXg6VyP851mQtodmUpynkfH9sUM1CELEFGZbbBLJyfO7+cMY/OJpcei3d6gdBUlfJrWKehHCODaOw+ZBfHaYiKqH20fALvmgAnwBsIAWzjS6cn/ydfYvuDhtXYSzglRqUoeIYSFyDrBHeDpuvGWRNhSpVaE/ZPj/ECJT9QZWezytzlC1i4k0en7BYtCvydm+tW2h02irJOCKDeFw+P5lMHkNUuiJDJkT+pI3Oajs3KcFuKykN/7GQCLNFryxeAokInetdMgL4b/lr7cIfAbth6N3NvVeUKXOKDVLyVpRkQXgMSUllBm/izFIOGx2wHJphOKmAkvzcEnKzuYGT6/n6kYZoDswOYs4p9PEVyzQQ0PTQ42zS8RSNrSo6tdK3ObPrkKCtRum+RnTSz6Gciu+iqIed2iiC6c/mdXvVKRoPi/HjzI5PYswlSYRt6Fc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(66556008)(186003)(16526019)(478600001)(66946007)(2906002)(316002)(966005)(66476007)(26005)(5660300002)(52116002)(8936002)(6666004)(6486002)(36756003)(8676002)(6512007)(7416002)(4326008)(956004)(6506007)(83380400001)(2616005)(66574015)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YmZQK1dLYW1RT0FVak1WV2V2ZklXUUhCSmsrY2NwL21yQ2RRZ0NHTHRrTmZT?=
 =?utf-8?B?N2pGbEhjMVFuZnlFTi9senU5bDA2KzN2R0NKY3UzOXdVdnBQalJ5VmJIV1Y0?=
 =?utf-8?B?cDdRaFhQNTVHVzFOTnkvYW1udlRWbThUcVJDV3hwWUNielFxZmljRnloR1hP?=
 =?utf-8?B?NS9sZ1A2SkFBQVJzcjN2WUNvMXpZVFB2ZEhBVnRpMU9IZ3VpV3R1WGh0dWg4?=
 =?utf-8?B?UitCT1NpOWZoMGVJRTFMV0g1RDZZOFRKUjA0eng1cDZiVFhSS2NEcm9ERnVt?=
 =?utf-8?B?cGlhV2xaQzNZbVhpb2VSVEVDMTdmU2o2SG9VaU9jaU5XQ0lGOHMrdXhacWRE?=
 =?utf-8?B?TlhZU1FGTkF4ckVZT0oxWndFWG85dGhzc21NVktiY2wzMVBIRE9LUnBUcWdn?=
 =?utf-8?B?aGw2VittbUVpQmZsMTl6QWNQQVY4emxuRGFWVlh1QnJjVXh4R0pYQTlNN0Z0?=
 =?utf-8?B?UXhnQWlhKzJYMjRvbXhNZ1o2VzE5cWJhbWxyOVdydy9Lc2I3a1Fqamx3NWpv?=
 =?utf-8?B?azhjWE1ZRTRCTkYyeWt0ajdTWVFqak5QQ1VGa3ZpbThYN0F5SXBQbE12NC9K?=
 =?utf-8?B?RHk4Mktpblg5TTMyQlEvQWJaaVBMMXI4cU83a01pMHk3ai9xUjFzOHJablYw?=
 =?utf-8?B?RGVZTldGY2haTnpwVVZrOGlWTjFUWlZLaTNxYmtGNHdWZ2lmN0Q5aUdLcTdm?=
 =?utf-8?B?V1JwZXYrQmFRRXR3dzdRRld4WDBqSGpyQW9ZYTBnY3hWaC9NdWo0bEhqcEtm?=
 =?utf-8?B?THFjR0ttY0ltUUJPYjBscnJqYkxXNWV1aGtCMllwTmhVeWpkV1ZmNGhUY2Zw?=
 =?utf-8?B?dzA4dW1OcVpmczZwV2I1VUlhV01TTW41cTJkTmllc25zb25qbU5EcVRxbkRH?=
 =?utf-8?B?VUNCbUpMTytoNW1KRnd1THg4MHNnWjRzVS9zR2hSTWY1d2cyMTg1Z0pzRmU1?=
 =?utf-8?B?bzRQc2QyVHBmK3JoQlZ2OEpyMGxNaW1RRUNOdHV1MU1yRTl5SmpGVWduZWpt?=
 =?utf-8?B?SUFFZWQ2T0lnd28vMGVTYUd2SnNweG5JYVpYQkxRLzlEMHljemVFRHVRK0NL?=
 =?utf-8?B?anhzTmpOejhQZnNUM1FQZmdnak1BR3pWaHluNHlyL1pLdC9icFJMcTFHaWJ1?=
 =?utf-8?B?ZnVwb0IrUXA4SUVHcFFNa3NjcVVKUFVEdW9OTzdiaUk1VmxhRGJPb1Y4SjBJ?=
 =?utf-8?B?dkZRQmZPZTluYjAzaXJlclNCenU5bldDbit2QjVMRjc1U3pLU0JEdHhaOVpp?=
 =?utf-8?B?M3BtcmY2VVNSWWk5THJNb1A0TlU0aXNsZlhCdngwQ3haR3N6TWNGWVlOUWNN?=
 =?utf-8?B?d3lFNFI2VXdwYkdEa2k1Y2grUUtOY25ZczN5RmRGMDZWa0VLN3Zacnp3R2Qz?=
 =?utf-8?B?MUR4NjVydHduLzJQSGM5WFFkQ0I4V3hueHhUVTNHbW5jWjBFeXFCUmhmZUtz?=
 =?utf-8?B?dWV0K21WVUlOQUV3ekFjRFJibmQxbXRTMUtsSWppRjZ3L0tiSUNXUFpoeUE2?=
 =?utf-8?B?WjNiYlkrS2pxbmFSWWlvK0V5ZmtxUjFacEFoT29QdG1JK0Ewb2prWUhEcUh6?=
 =?utf-8?B?S1dPTGVZOUJRa0RWNEZDS0hLUExnRU4zMjY5dnhDT29xKzhFcEJSU1h4S2Q0?=
 =?utf-8?B?T1Z6RDRYS2h2UFdvUnRyMG9WMHhPOVNJSHNaTnVaSldYdGJ6NWF1NDVSTjJ6?=
 =?utf-8?B?ODFvU0l0UEhPM2JpZmJUYk9oL0dqZmhXdjFhdVRDdTdsaERKZ3dhRDBqMnRP?=
 =?utf-8?Q?od2TzcDptamPTCtpHK4WGyC2uPKjPKXPNhACzM8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e58561e-8edf-4de5-07af-08d8e1e77cbc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 04:06:02.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vR0QbPlmKaOzLcz2YT3FEr8S1EWHLbPUOtUTlqgdw/37DvjfBOgRZ3/CzKjEiuzRz5ZhM65wJ/eEWUY3t2AKMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3310
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
b3JnPgpDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgpSZXZpZXdlZC1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEd1aWRvIEfDvG50aGVy
IDxhZ3hAc2lneGNwdS5vcmc+ClNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1QG54
cC5jb20+Ci0tLQp2My0+djQ6CiogQWRkIFJvYidzIGFuZCBHdWlkbydzIFItYiB0YWdzLgoKdjIt
PnYzOgoqIEltcHJvdmUgdGhlICdjbG9jay1uYW1lcycgcHJvcGVydHkgYnkgZHJvcHBpbmcgJ2l0
ZW1zOicuCgp2MS0+djI6CiogTmV3bHkgaW50cm9kdWNlZCBpbiB2Mi4gIChHdWlkbykKCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4dCB8IDI5IC0tLS0t
LS0tLQogLi4uL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkueWFtbCAgICAgICAgICAg
fCA3MiArKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlv
bnMoKyksIDI5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4dAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlw
aS1kc2ktcGh5LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L21peGVsLG1pcGktZHNpLXBoeS50eHQKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDliMjM0MDcuLjAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnR4dAorKysgL2Rldi9udWxsCkBA
IC0xLDI5ICswLDAgQEAKLU1peGVsIERTSSBQSFkgZm9yIGkuTVg4Ci0KLVRoZSBNaXhlbCBNSVBJ
LURTSSBQSFkgSVAgYmxvY2sgaXMgZS5nLiBmb3VuZCBvbiBpLk1YOCBwbGF0Zm9ybXMgKGFsb25n
IHRoZQotTUlQSS1EU0kgSVAgZnJvbSBOb3J0aHdlc3QgTG9naWMpLiBJdCByZXByZXNlbnRzIHRo
ZSBwaHlzaWNhbCBsYXllciBmb3IgdGhlCi1lbGVjdHJpY2FsIHNpZ25hbHMgZm9yIERTSS4KLQot
UmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogTXVzdCBiZToKLSAgLSAiZnNsLGlt
eDhtcS1taXBpLWRwaHkiCi0tIGNsb2NrczogTXVzdCBjb250YWluIGFuIGVudHJ5IGZvciBlYWNo
IGVudHJ5IGluIGNsb2NrLW5hbWVzLgotLSBjbG9jay1uYW1lczogTXVzdCBjb250YWluIHRoZSBm
b2xsb3dpbmcgZW50cmllczoKLSAgLSAicGh5X3JlZiI6IHBoYW5kbGUgYW5kIHNwZWNpZmllciBy
ZWZlcnJpbmcgdG8gdGhlIERQSFkgcmVmIGNsb2NrCi0tIHJlZzogdGhlIHJlZ2lzdGVyIHJhbmdl
IG9mIHRoZSBQSFkgY29udHJvbGxlcgotLSAjcGh5LWNlbGxzOiBudW1iZXIgb2YgY2VsbHMgaW4g
UEhZLCBhcyBkZWZpbmVkIGluCi0gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aHkvcGh5LWJpbmRpbmdzLnR4dAotICB0aGlzIG11c3QgYmUgPDA+Ci0KLU9wdGlvbmFsIHByb3Bl
cnRpZXM6Ci0tIHBvd2VyLWRvbWFpbnM6IHBoYW5kbGUgdG8gcG93ZXIgZG9tYWluCi0KLUV4YW1w
bGU6Ci0JZHBoeTogZHBoeUAzMGEwMDMwIHsKLQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OG1xLW1p
cGktZHBoeSI7Ci0JCWNsb2NrcyA9IDwmY2xrIElNWDhNUV9DTEtfRFNJX1BIWV9SRUY+OwotCQlj
bG9jay1uYW1lcyA9ICJwaHlfcmVmIjsKLQkJcmVnID0gPDB4MzBhMDAzMDAgMHgxMDA+OwotCQlw
b3dlci1kb21haW5zID0gPCZwZF9taXBpMD47Ci0JCSNwaHktY2VsbHMgPSA8MD47Ci0gICAgICAg
IH07CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21p
eGVsLG1pcGktZHNpLXBoeS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BoeS9taXhlbCxtaXBpLWRzaS1waHkueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMC4uYzM0ZjJlNgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwKQEAgLTAsMCArMSw3MiBA
QAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9w
aHkvbWl4ZWwsbWlwaS1kc2ktcGh5LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IE1peGVsIERTSSBQSFkgZm9yIGku
TVg4CisKK21haW50YWluZXJzOgorICAtIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+
CisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoZSBNaXhlbCBNSVBJLURTSSBQSFkgSVAgYmxvY2sgaXMg
ZS5nLiBmb3VuZCBvbiBpLk1YOCBwbGF0Zm9ybXMgKGFsb25nIHRoZQorICBNSVBJLURTSSBJUCBm
cm9tIE5vcnRod2VzdCBMb2dpYykuIEl0IHJlcHJlc2VudHMgdGhlIHBoeXNpY2FsIGxheWVyIGZv
ciB0aGUKKyAgZWxlY3RyaWNhbCBzaWduYWxzIGZvciBEU0kuCisKK3Byb3BlcnRpZXM6CisgIGNv
bXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gZnNsLGlteDhtcS1taXBpLWRwaHkKKworICBy
ZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICBj
bG9jay1uYW1lczoKKyAgICBjb25zdDogcGh5X3JlZgorCisgIGFzc2lnbmVkLWNsb2NrczoKKyAg
ICBtYXhJdGVtczogMQorCisgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHM6CisgICAgbWF4SXRlbXM6
IDEKKworICBhc3NpZ25lZC1jbG9jay1yYXRlczoKKyAgICBtYXhJdGVtczogMQorCisgICIjcGh5
LWNlbGxzIjoKKyAgICBjb25zdDogMAorCisgIHBvd2VyLWRvbWFpbnM6CisgICAgbWF4SXRlbXM6
IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGNsb2NrcworICAt
IGNsb2NrLW5hbWVzCisgIC0gYXNzaWduZWQtY2xvY2tzCisgIC0gYXNzaWduZWQtY2xvY2stcGFy
ZW50cworICAtIGFzc2lnbmVkLWNsb2NrLXJhdGVzCisgIC0gIiNwaHktY2VsbHMiCisgIC0gcG93
ZXItZG9tYWlucworCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6Cisg
IC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9pbXg4bXEtY2xvY2suaD4KKyAg
ICBkcGh5OiBkcGh5QDMwYTAwMzAgeworICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4bXEt
bWlwaS1kcGh5IjsKKyAgICAgICAgcmVnID0gPDB4MzBhMDAzMDAgMHgxMDA+OworICAgICAgICBj
bG9ja3MgPSA8JmNsayBJTVg4TVFfQ0xLX0RTSV9QSFlfUkVGPjsKKyAgICAgICAgY2xvY2stbmFt
ZXMgPSAicGh5X3JlZiI7CisgICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElNWDhNUV9D
TEtfRFNJX1BIWV9SRUY+OworICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGsg
SU1YOE1RX1ZJREVPX1BMTDFfT1VUPjsKKyAgICAgICAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8
MjQwMDAwMDA+OworICAgICAgICAjcGh5LWNlbGxzID0gPDA+OworICAgICAgICBwb3dlci1kb21h
aW5zID0gPCZwZ2NfbWlwaT47CisgICAgfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
