Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46E828F77
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 23:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655EB10E4FA;
	Tue,  9 Jan 2024 22:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01olkn080c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::80c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2F10E49B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:18:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtA5dqtZgq7ajr2T0iz1CIbpa22h3WDSyRAAIaIiuPTZey8zj54UlXJb3gH6EfRFd570PVce0OzdA95OKiWIKmb0DKyz37b6TLCGcaq4oddWxXq4ETZPqJ8TQgfhmLoxbBKUm0aa7Q58ikZrFoK6uJa/X05ejWAUtCYT2f0uyXnYtOUJGcHDdtg7Y0Wo/wxydpSJ6Ks5v7GWod84xtoKayOFi6bJfHU8hfN2QQe/C1BRN4XgvdbpM8cfEZHdPoAuruPpemyWWW3Fguuq3EuWGkJtSnjauT7EKYRyGQyfYpBxPiJRHKlsQWTxleqbd/wtyDIGsArap1Tc93Ijulc60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+MqYObgcC5vVmPv40zmt82h/Dwi/fy4DAfvZnnOOTY=;
 b=E2Qk/+XB8D/Z6gdKfZXs0bxZ1wF33tPBV3ERiA0uuSlvNJ3CaUmMVE5g2m1D0LmLMKR0AIubm+SP9t695dbIa+JOhAOoq0gXik5Yhdpf4i/tAQtU2Wb0L2gqfnNhiWrtL5CUtTridpq1n5TtkBizBmGbiVZiFfOZY/1JYcYnU4dqv6zUYL7uUJ7sbDkLORhLRqiS6Qn+Ag+T2D095zmjyfUm4iHWN9BVg2O5y/ThnJgyJrtHtcl+tH0Og/TcLugT+UcqpwcJEm5A8XLftwRGkTxohsn0Qn1qx+Dzf/yZyYV03uuOK5rs2DowESLKmhSjwL85EA09AZ3FEVgfrMlJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VI1P195MB2460.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:1c6::11)
 by DU0P195MB1427.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:343::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 18:18:47 +0000
Received: from VI1P195MB2460.EURP195.PROD.OUTLOOK.COM
 ([fe80::64ea:5df0:b540:60eb]) by VI1P195MB2460.EURP195.PROD.OUTLOOK.COM
 ([fe80::64ea:5df0:b540:60eb%6]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 18:18:47 +0000
Date: Tue, 09 Jan 2024 19:18:45 +0100
From: f380cedric <ce-ce-mel@hotmail.fr>
To: dri-devel@lists.freedesktop.org
Subject: Lenovo b40-30 i915.invert_brightness 
Message-ID: <VI1P195MB24600B1096F3B65D68CD99C4DE6A2@VI1P195MB2460.EURP195.PROD.OUTLOOK.COM>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TMN: [gUCUt3L+kmX0YnMN4leD+dTXifK7ANZ7oDpjFC7MgQTFL1TxMLdxonX0FceR/WE8N+dDiIGBtsI=]
X-ClientProxiedBy: AM9P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::12) To VI1P195MB2460.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:1c6::11)
X-Microsoft-Original-Message-ID: <5EF77974-3552-47FF-B86A-464314CF8F80@hotmail.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P195MB2460:EE_|DU0P195MB1427:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e49cdf1-4b56-4f91-a525-08dc113f6bb8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zViwafR+9trYRhl8TAV3jjWEbuybSyacaljHEU7dBOOKTLEJKYvRQXfqAnmHUJ4wuAOjLfKuLuF9em3sieRDjd9Tgk/n12g46RNSXZInQuxj2vPUBwcf+XmdOI6MJVcD+TG7e1Ry7wDrzaSL2fomm6LY21nh0gxD97BVAH+GmEqFu0eGA3NjKi6cADYIfEn9gVzgbpy2P9re3CNGH1lHMh9W+z+Ie6bKiTC2+pvFjvYXv7gPTabdevLiuS8Uwi/3SMVrlON/GzGdENbmxmVesXVsAJqoJePnvnOu0GFYE3OiLdYjsC3obPpoVNfIBi81pz32O1FJTSPo1XSEcZt0YG9gSHgqUBYk7GFqfmWP/uk3YW+517fR7/MeYIM7KU2mKLGrLKfX8i9Pw05w/VzMHuHtOVzEMU631gXQRLN61ZLWNZRN7Fka3ebXv4BWSGcq/9qFSOGtdQjDMGLaqN+pqz+muYl/U+1fYwIarxCYdk/lsO05sIYK6QcFJjsOkXo/DbqzH42UDCIUZIIfp5YInG6wZvrQj8ZKrCWHidXu/1JpdOEHY3Ya4wHovwjiRwWl
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUc2VnBkV0JpZ2FJZlBYc28wMVlCSzJrNk5DSmd3dEtXamtFUFpLRHQzTE90?=
 =?utf-8?B?K1dUbThIbjByc0toR0J5OXBYK3VuU21adGFpTGswczBBeUpGbTNYZGVGbHor?=
 =?utf-8?B?YUVkT0JwZTZwZmdaTVNxQWI5R3ZrSzBRMjlkNlJpcDQ4SUNxdGQ1TWlwSGpT?=
 =?utf-8?B?dDlycGtDbmU3a0JMZTU3Z25ZUURucDdteGNUR29iQVdkcjJwTTJhTFlNeVl2?=
 =?utf-8?B?QXc1Tlh2bUNUbEtPN2prbk9kUW5STUhuUURhN0VsbUhSVU1KcllHRkhpVTBs?=
 =?utf-8?B?RmJzOGM0YW5qaUFhang3Vm1objY5ektNRDR4VDFoZ09MSXMyVGo4WWhXaUVY?=
 =?utf-8?B?U3ZMZEVaQThlTmp2U1I4eHR6ZE8wcmZaZDMzcXJVTmMrSTlFSDlGNVhQeUg0?=
 =?utf-8?B?bXUxUWZNaGtKaUlPM2R5U2w5MExMQ3BLOHBzS2dwSHBnaGVwYUhRejlRYTNn?=
 =?utf-8?B?eDVDQ2ZwYjJVb2dUdTNXQnZLS1FVSVcvL0JEdDR3TlQ2bmFiL0EvMjJMSndE?=
 =?utf-8?B?aGt5aHNmUE1QMEVHS05ZelJPR2pZV1Nmd0xFakdlR2dmeXgzMGx0OE1yZjdo?=
 =?utf-8?B?RlNEK25ZaUM3VmV2MEowYjVkaFVob3pjUkdieHI2NXBIN0lTNlQxQmFtdXBi?=
 =?utf-8?B?dlVmTmJRQThvb1RhWkVmZVVJd0Y3bVBreWpOd1ZEN0RGMXFuaVdYNkxsTkFU?=
 =?utf-8?B?RXZkc2lMMExHRjZoWjg4Rjd2TTNUUW9lZTNNVEowcG56bnlHTGd4dERadkgv?=
 =?utf-8?B?aXprcC94a2Z6aE1XcmhWUER6czQvd0ozR2FyT2pPaHFzVlg1VC9IZlljL3Vs?=
 =?utf-8?B?d3AyQ1k4dFgyYXFNQmxBeW9mbWpuQzc3Y2pnQnpsK1BudUdwUjNIalpLVkxj?=
 =?utf-8?B?S1hOaG4yelN0NTVTMmIySzJ2bU1GNFZrcUhaUDdweXBCdmo4TFZZdTM4WWNw?=
 =?utf-8?B?am5xQjNoMUNmandhU2IvcW1mODEwUjROamFHN2NxZHhBYWxaS3JNWVRycWdM?=
 =?utf-8?B?S1grNTIrd3A5d2RmeWllVjlOb09wdFo1MWtKVExEaGI5eU4zcDBLazU4NEhM?=
 =?utf-8?B?YjdYcmVtTEluM05vQkIwZkRUSmc1VnNPU0JORnMrdFp5WHZqa0lCTUJsblZr?=
 =?utf-8?B?SUVuVkV4WXhRRTNmcU9zd3BYTWJObWtWUGFHb1krZjM5UWRkbXVLUEZncVJo?=
 =?utf-8?B?L3dRaTRuS3VyWWJOM1NGUjlzenVxN0FnR3dKcGx6by94WGNndUk4eG1iNER0?=
 =?utf-8?B?U2tUL2txdXN0Qnowam9YQmMvQjFXZkpqSmdwUzNselV1cjJoaWxwUmhwWElB?=
 =?utf-8?B?Z2pOOVcrVXVHbFYxdE1DVFVGaXJYMXNoS1dmQTZrRVpENUhNMllDYm9YYjVU?=
 =?utf-8?B?NWF0WjZJQkdIQ3ZHa1ZmcGJiUndXcDZZZmtUaHRHWEVLYjZyUlJaS01qWENV?=
 =?utf-8?B?aEZVTnpDWDJvcDA2NHF2VktKRzhBRFJVUnBBWTVkRGYvMHo5WGo0NGRaUmNG?=
 =?utf-8?B?QXIwcUs3VjI1bU5jb0tHSkMzM2RXSk1peUsrb2dNTGprVWhYOFVJUVJNdzln?=
 =?utf-8?B?TDZaMmhscmNWVEVySXVHK255ckFkUkxsdkpENUJNNlplMXdpMlpUSUp3a2p6?=
 =?utf-8?B?VzRheVpibVEzdk9LUFNPaHAwQlIrMXNXRFdXOXYyWWdFUDBzYVBqUUkxZk9Y?=
 =?utf-8?B?dlZ4S1cyY1lKNUlHb2V2bStBd1FqaGVTN25EV3MwZktacyt6NEU3OGcvWGNC?=
 =?utf-8?Q?i4ea7Qrl/cTfiz00X4=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-49ed2.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e49cdf1-4b56-4f91-a525-08dc113f6bb8
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB2460.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 18:18:47.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1427
X-Mailman-Approved-At: Tue, 09 Jan 2024 22:13:19 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear maintainers,

I have a Lenovo b40-30 that I have been running with nomodeset for a while.
The issue was that it needed invert_brightness. Here are the requested IDs:=
 0f31, 17aa, 3986 :).

N.B.: I am not subscribed, please Cc me when replying.=20

Best regards,
C=C3=A9dric=20
