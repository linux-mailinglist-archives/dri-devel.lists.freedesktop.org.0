Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292CE8333BF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 12:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CDA10E23A;
	Sat, 20 Jan 2024 11:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2039.outbound.protection.outlook.com [40.92.99.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9C910E24E
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 10:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EK2YUNbRP193HtTi6B8vygyJ702j+w+M+TMHvcbdZz9djy9sZflvUbqSxJ0jMYvJXY763SqTdt/90wp+S5VLNYJ1x1xZA6us8SXwQGbyzvuckl5xY9wGXJDD3h0xazHGFxdhRIymI9zfTFHa8hr2gUVOuIQiVxZcVHvTTjq6q9KTxi+cOgfkfCG1BX5/HQQCwMsXlSi8dSYPWHyuT6UpBYv6wYAromvcZ5ez4/ogElUB9uWkL3f1+BlfRch8lNslqPmNnvlkerjZwSUh4O4Eoi/C509QZAKEjZhH3qmUSL21lSK3TPpqYcK63RjV+YIZX6mEA9c/xUeBRRRt1z6ung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWH0ZBvXbgnUQBP33r4EumNhoOwnYsMUkHm5Reu8L1Q=;
 b=RnIzv8ch6fG4rF5LkUkNsl+IDx1hKb0YNcY7tqCB3rP8amwFAQUO6j2MDvi4YasgKZzW0TuCc9iUvWWsw0NDRH5iN3oESN4C2vaM5dYR+CkHi1xHe+8bYcTkF7E20cnj/bNyzsF4EhGjpW8KsJjEh+6xKup28BWdapg+2efI4/XgUw/ZgaTrGCGKvQqqhoAJqMrVTn5MQsPypwDJpQgSAca67Z50Vjo3Sy/zAjVwBPJibJJGP57StDneG/inXjhnvqlM/vsL9akbokM+gIlPsvgHsPb4YIo6A+HgnWXdGfnbaXH7SFVn+Zx/x5FV3hiCha/MF6mDPud+XPhg2ihCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWH0ZBvXbgnUQBP33r4EumNhoOwnYsMUkHm5Reu8L1Q=;
 b=pNKcKn9GL9NrejF0bvQAAcNOaTxzYT63am8yDR2Jrqe+w4RcjdPNAgSxW65h0PMeqGx0NqRS+1I0lZdnIZOOu116IJXFOm/a5nenCPhts6L1uQYulnApWDf7PW1TWbFkaCO0vwDHWxt4uTzvnmrOWAJ6SG9B/EYpmBfyOUxxoK3rjEWcL/y7IKh8fYGJnArCQQITZCayRlnq06ZKFpHcHztj6ms7VT66TCgl1MYEgF/29VQjcjagLksPcthyL0JTLK4+/ojO956y6wnFQ94eF8Z759jf9I6MDnacU5ilBAJOxWPohYphmalh8cyeKWt4q2UsfBNMaR1gHHOn7B8vyQ==
Received: from TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:309::9)
 by TYVP286MB3714.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:36b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Sat, 20 Jan
 2024 10:15:45 +0000
Received: from TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a820:660b:bc07:c568]) by TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a820:660b:bc07:c568%3]) with mapi id 15.20.7202.024; Sat, 20 Jan 2024
 10:15:45 +0000
Content-Type: multipart/alternative;
 boundary="------------6gelaRrTpPrf341FBf7ETL78"
Message-ID: <TYCP286MB298943C0E6A504C4840643E9AA772@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
Date: Sat, 20 Jan 2024 18:15:42 +0800
User-Agent: Mozilla Thunderbird
To: sui.jingfeng@linux.dev
References: <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
Subject: Re: drm/loongson: Error out if no VRAM detected
Content-Language: en-GB
From: Katyusha <KatyushaScarlet@Outlook.com>
In-Reply-To: <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
X-TMN: [JD1toghUv5KH8y5et90RSO8C84UjATGPLiZZE82PBtQ=]
X-ClientProxiedBy: TY2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:404:42::19) To TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:309::9)
X-Microsoft-Original-Message-ID: <cf53cd1c-6c8f-40a1-b39d-0d71af9707a4@Outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2989:EE_|TYVP286MB3714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e95d331-b717-4505-84af-08dc19a0c333
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoQRyIZ01nzOwS2WsyX/2zq1BjicC5axkkyQi036nYXMAB3KB+tC7d21EINKJvmvgEIiARGvn+XWtbZaQBD4xkQvR2U9A557+ZjYvKSBxYu+653S8xYIsivbENn7GU2iKUieDG50tZ+nxfBaShD5bzOzJzpKTacAl1K/vuvrzVf50kFqMAAvL6u6e9I6AbSPueAjbP5yn3dk9KOigp1o5eE+dqOUDOE7hHyk7B85rpoCNk2cGD+ZmYhZbEn2CGro9KGjoG700G8IyzdBU1UGYHRNyfMbV0g0h8VPqxdBqdqlxJldrEKRQiAcn9jLr8VWlPnVMXZZXv0MJkx2A0JYJGru3l0bbqxRB+1N0+R4YjyMFa7uGip31RccSxNTZyVq0R2xTBoth73EIHhi3FlbpmIZB3Pm5SRzfn/M48Dw8xr9LNiOISuoHPpJRLYFJdVRK0SfvJi1/2booH8OeotzYn8g6lIVBjuBAT4CE/uyO6tMUHmOF/KyBm4x5n8lo96bayn2hVBxqoyabTOQvxkd65xMyXFHEVzh2N3RMxCrPKhpxnXLNIOuKt0WrKCRlvLG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGI4QWphLyttY3hYeFRUeHJ6S2NDSyt3SEtzVEpkbFZ5RlUvRzc5R2I0NWhQ?=
 =?utf-8?B?STFiQTdTc1gzdVVvdHFZVlhRLzhMaG8rUjVrMS9LYVVEZXkzWHdkTm1VNk1r?=
 =?utf-8?B?NlgvTncyNnRzWmVLYlVxblBXMWJaaUN0V3lmU1pVcm1BSVdOWkpSQm4wSTA5?=
 =?utf-8?B?aGxoV3d0V1JNNkg0TjBFSFJ4UjVFeVFRZjd3OGNtNi9JQkI2RlRTLzlxM1J3?=
 =?utf-8?B?YXR5MnJWS3ZSRFdGREZ1WWJkQzFzaTlBUkd6d2VpV0xGSXNmdUU4Y1lKS25w?=
 =?utf-8?B?WDZmQnBnKzRiVmt4TlJUbzJxM0hPZ2xCem4wNjIzYVNxVURxV0lDZDViYTgw?=
 =?utf-8?B?ek42S3Z1aUJ4MSsvR3cwVkJ6Z1RkeFEyalpVczRGbG9oWVE5VXJTTGhzSzJS?=
 =?utf-8?B?QjBvTTV6bGsvbTNNeERHOU03SXdLbFNoQ3JWZFVyWEkxbHVPQ0QxTnB6Y3FQ?=
 =?utf-8?B?OVd3ZHVwOXY1a2NjejZ3K3lXWVFpdzZSMzZCQzFLTmxoM3d4RW1UT1ZSb0tt?=
 =?utf-8?B?RFlIVldnWjEwVzJOeDV2OVdvTDhhMUJqQno1R1RpZkV5OU5NZkNJb1ZVS0JH?=
 =?utf-8?B?VEoyd1NwbUtxRElsZDNoZlBEbFZsNUYzV1BZSWg2MkszT1lyYnlqOHhna3Bh?=
 =?utf-8?B?NjJwTVFsdTV5TWwxUjV0UlhKQlpNNCttNHRJeEdjbnRicmZUeXpOajFkTEJQ?=
 =?utf-8?B?NnZhUjJob2VCZUNFY0VVZklqQUZ4bDVTZFNiaklWdUNYNW9hME1uR0Q2NTJS?=
 =?utf-8?B?eXFmTDJhcmZzV3JXSXpwN21DZnhaUm84N1JhWWtkT2crek9vU1JiTG1IMURW?=
 =?utf-8?B?akVhR0ZlanNLNjRQaFdRenJxUksvSURFdi85V2JMbDJhZXlQTlZEbUpWeDlq?=
 =?utf-8?B?R1FLd0Qrakw1ODlwNko4d05lbUk3QUxOUU9qem1NNmtJdXVHVTh6RUxPcmUx?=
 =?utf-8?B?cXloc1RLRVREV2hMbXkxNlZ1ZGlkYWo3dDF1ZG02OTg1UTJIZ3Joa1o2OWRk?=
 =?utf-8?B?R2hoWWt0Zmt6Szg3Zjc3c2hLTjNoWW1JbzJqYnRDNlJwWllhcnFvaU11NWZY?=
 =?utf-8?B?c3dzK280ZFdNRTRhVFlGR3dIeUJGUUlXYzJwVTA1Wk53dksrQ21XNVVuV2h5?=
 =?utf-8?B?QlBlbFpmUkNDL3ZZakROOEJFbnBFTXp0OFFZQklsYzNOcWpsSWpEVks0am1y?=
 =?utf-8?B?c0NkSXgvUUhqcTJEL1RDc3AzaXlZYXdhT29rVGhDUnRjZXRyRkJjV1lmczR5?=
 =?utf-8?B?Zk5wZTd1NDBmcW1peDlSNGZNTzN1QWFid015bHU4ZnZIM0IwT21JNVV3cVU4?=
 =?utf-8?B?MCtmeWZ0YnQrUW5vVWpjcWNRMCtMVlRpL1gxTGdnYmlIVDhlMVNYZW1sNWdW?=
 =?utf-8?B?RThLa2VlRlBvY2IxL25tbUNtUnZiVk1UQ2hscGdzUnJxQkVvRENtbzlYZ1Np?=
 =?utf-8?B?UzArbDh1Y1ArSVhMSEVJSkxwVnhjdml2bmQwb2o1cUo3MUFJUE9ZaGJaWTdy?=
 =?utf-8?B?MnMrc2JKU0U2R0NWN2luQVMxZ05nZElmc2taT01zWnhCVkNweDRJc0Z3Z2ZD?=
 =?utf-8?B?TisxNkI1ZHZwQTAySVBoZHBWK05ISVJPRDNUU3lJRWlRWkY2alN1UlJUZG81?=
 =?utf-8?B?eWRBcXgxS08zSzlMdFE3MlBoUnpneDZ0MWdCUGFuZzA1aFhqeHdMYXZ2K1Vs?=
 =?utf-8?Q?BuucWlZx0xTF18OktsQ+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e95d331-b717-4505-84af-08dc19a0c333
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 10:15:44.3435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVP286MB3714
X-Mailman-Approved-At: Sat, 20 Jan 2024 11:09:20 +0000
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
Cc: daniel.vetter@ffwll.ch, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 airlied@gmail.com, chenhuacai@loongson.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------6gelaRrTpPrf341FBf7ETL78
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch works fine with my Loongson 3A5000M laptop (L71), which has a 
7A1000 chipset without VRAM.

--------------6gelaRrTpPrf341FBf7ETL78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="Times New Roman">Hi,</font></p>
    <p><font face="Times New Roman"><span style="color: rgb(55, 65, 81); font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">This patch works fine with my Loongson 3A5000M laptop (L71), which has a 7A1000 chipset without VRAM.</span></font></p>
    <p><font face="Times New Roman"><span style="color: rgb(55, 65, 81); font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></font></p>
  </body>
</html>

--------------6gelaRrTpPrf341FBf7ETL78--
