Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCEF9DFBD9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 09:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6EA10E1AC;
	Mon,  2 Dec 2024 08:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="YGK4xra9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazolkn19013083.outbound.protection.outlook.com
 [52.103.74.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC8E10E172;
 Mon,  2 Dec 2024 04:09:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMXefdZEOPfI2eGa3VpJY6ACUyDgUjHz7gGId+NQHDSiSfucZeMKL5EWeiyKWMnSlLsxJIKOeURjtxCsU9XvvVT+txVT1ZsxZbU81KUJs6S7HpPeehaQ4s/aEx1drZ47zWmjFikt1Lb0SKB87JCe5zKo+j+TZGYbGXiT2JnQ3l7Ar2a2/g7R3MbvownxmzXvpZISnQrCW75F1VhwB8VSWlvbXK5TU5ySoTZ47n5eTXnlAfDy830pbgtqBc7HyaOv+P/gAhMdfTN0VPxFzyRn1Uc5ULlO3oePfCpK3O8NLCYIS0xoPHvJjFa3TWlegxG32BlER6cPmde1659G5hwNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY+oQhCUOLAG0/zPoYfsYoaG/fKqkZWHJPmkUUcE0/Y=;
 b=qQw27v0UwkNuKDs45aqVRQSBP/j12lqzpAyVqBavE0p3XDT/JeI0eeTzgyzEXzBdG/JBpzpJseO59/dmFjV+xHUrv6izHcYJ5WEBiIHrtHd4JasnrXp+wrhzhA2UQSpKHHdFZ8CkMWeNAUJkHAskCK2gZ827z9zU0yfh4ttdLzvh0759/egpWtODTBgw9Ys6OnCrP+bym/64mH8CliRoQIpj/z67d4yyDlfNTLOBxJ1aX4/USeR15gTEz8sBH1SzxddHiDZ4/p6inKeX8mYWGU1e8eQ4ZZVblJx1EkiVgfTOuH2xJ1lOobjvEHIg8BT3wu0epW3hyZanGS8KAjmNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY+oQhCUOLAG0/zPoYfsYoaG/fKqkZWHJPmkUUcE0/Y=;
 b=YGK4xra96UquEK14XknCqLyPm+bb7WALxv+rAU3GLJ/6oCdUTu7R/bFpPxigpTSUVQkE51w/dvxEOR410we4doBzqq6o9+4WeTajhVWkSeb0bF/A8BNcCkohKPWk+E0gaITg7k1M724uf2PDgPbqmF9llpZEoj6Z8WdY3nUPgI8lHiTG+TWiBrmrKed8Dx8i4uFELHKGctchSbT8ZQ+3pZMjV19CT/yKVg3vpHUVpaYGS5Xj6DPHG/c3VCXY5LfiGhFDBsMj1F8/CLiAnMe9LAjSEwNhnlmqgwmMIXQT2ccPSIwQd7XjIzzCFPSUjQavP4UZPXll0Uy3WogBXKumIA==
Received: from SI6PR01MB6400.apcprd01.prod.exchangelabs.com
 (2603:1096:4:24a::10) by KL1PR01MB5229.apcprd01.prod.exchangelabs.com
 (2603:1096:820:d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Mon, 2 Dec
 2024 04:09:53 +0000
Received: from SI6PR01MB6400.apcprd01.prod.exchangelabs.com
 ([fe80::4f02:7128:dc01:e200]) by SI6PR01MB6400.apcprd01.prod.exchangelabs.com
 ([fe80::4f02:7128:dc01:e200%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 04:09:53 +0000
Message-ID: <SI6PR01MB640016FCF41E2602D05808C6FD352@SI6PR01MB6400.apcprd01.prod.exchangelabs.com>
Date: Mon, 2 Dec 2024 12:09:12 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US, en-US-large
To: cyrozap@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Li Jiajun <wlmqljj_lkml@hotmail.com>
Subject: Re: Kernel warning in dcn30_dpp.c; short freezing, crashes in KWin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To SI6PR01MB6400.apcprd01.prod.exchangelabs.com
 (2603:1096:4:24a::10)
X-Microsoft-Original-Message-ID: <abcb78b1-7893-4410-94a0-927442edf0d4@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI6PR01MB6400:EE_|KL1PR01MB5229:EE_
X-MS-Office365-Filtering-Correlation-Id: eda78b78-6aea-4fb5-dc8f-08dd12872be2
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8040799003|461199028|6090799003|19110799003|5072599009|9112599006|8060799006|3430499032|3420499032|10035399004|440099028|3412199025|4295299021|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDJHcnVLSVczMmJxVGxKcEVjSlJpbUhXMjZCM2RueExyZEtzY1hBNFNjMkY3?=
 =?utf-8?B?a2J0THdLc3NDMmVDV1JteU9IY3FJMTFkdlZFZ0NiQi9xZDgwTzFJSDdyS0to?=
 =?utf-8?B?NUpuallxMkp3QkcxOU81ZXdWVVdQTi9PcENhcWxKTWZWWlVCYWRGYU42ZldV?=
 =?utf-8?B?Y0FCQUpObm1ibGJadExVN0laRXdNZ2Zhb0VpRWlpY0IvWEJ1a1VxQjVDL29h?=
 =?utf-8?B?REtZK3hnN3o2ZWh0YjFqRkI2c3huZFl5ZXNSRm5rbU9zd0JWaEpDMDJ3WkxF?=
 =?utf-8?B?MTg0bW9tNDNjeDgyRGhiWUdacGtBTkR1KzlZMEJTcnVacHYyVFoydktWQ1M0?=
 =?utf-8?B?RW5NTStIVDBWS3RPdEhBTTBVUUVnWnc1eXJhemw1U0gxY3R1d0R1T0pkekJU?=
 =?utf-8?B?SXNZZWYwbVppMkMwa1MxenpBNnpHNkVubTFPamR5ME5CcXVTVE8zY1hRYlYv?=
 =?utf-8?B?THVCd2NPM0VJSHV0WkIvaG82dTFSajhkbUloaTNSbVRZYStiUm15eEx6cTVi?=
 =?utf-8?B?d3NuUGlValg3N0NSUzJJUjBjbXNBdk5rVHpUZ1Fuc0ovUW8vME1UeVNRNGRu?=
 =?utf-8?B?M2tXeWlLN2VWdWpIekpEdUpkZ1FMblJpODVwdGFZTElqbTVjRVppMEVmbGMx?=
 =?utf-8?B?L3Naemw1dXhMNjV3SzM3c05DQlgzZndaZG9SV1lMQk8yRjdiQXcvV2RodkVo?=
 =?utf-8?B?NzY5Q21ySEhUZUFkZ01SNjB1RXQyWFFQWUlmVFZvRjF0SFJHZFNydWgwTVZV?=
 =?utf-8?B?R0JvNXE0blpqQjVhNVdlSWxzYjhTMitubkZLQlRGS2JYU3ZyUks1a3N3aWls?=
 =?utf-8?B?cnFHT0xuR21wSFlJcjFFTEl3NXhmSFZndUxLc3dzYkhtUnphQmdLVnA3bzZk?=
 =?utf-8?B?b0VxMTFSRHR0Uk10L2ZucDdvaWR5SzRRQ3NpcmxMaUxONG5QakxmRk1FWXhF?=
 =?utf-8?B?dzdIT243K1lXd21aUDdaZVMrOFdkcHJ0c3J2NzhEOUVreFFoVU9BYUc4YXpi?=
 =?utf-8?B?SXNabVVyT0pad2YwWndJa1I0Yk1hZ1liZmpteWwwWjB6OHpjZENTWnBucnRa?=
 =?utf-8?B?ZlduWjBPMnV3VmZScU5yRnUvM01CNVBsQzNGUStQd2V0MmFUNE1CN0tudEZ0?=
 =?utf-8?B?dXVCbWFlMFhmN0hsT2VQTkJBWGl1c3g2dVhvcVV4bjhlMFFEd3NVRDh6Wlli?=
 =?utf-8?B?Z1RBV2sweVpkVUpVaUZ1c1dZV3ZnRTE2UlA3Znh2QWp5dWJOVEhQNHBzV1lO?=
 =?utf-8?B?L3AwKzJ4SDdtKzhUM1Y4SEEzb3puVXFPMFM1YUtqdVlhaFBHNTU5Ni9SZi9N?=
 =?utf-8?B?OWFyaG13bSttclJ2Ykw0cFlrSG10dWlOaE1pNmpJRlV5eHluc25XYkU1ZXFr?=
 =?utf-8?B?ME9NbnVVNmdpdWt6MWYxakt3NGI5dGh2cS9DT2ZHOXpwWEhJaWtObGxTQmFJ?=
 =?utf-8?B?dGRxdlRmTXRaczNaUzA5Z2RkZUZ1SzlDU00yNVVsb29DSXRRVGtWUW9SbU8z?=
 =?utf-8?B?akI0Ym5qVUhaSWR1RUJsOWd1UzNadHpnb0MrU0FZcGhzZ1R5SUtvYVpUSUhy?=
 =?utf-8?Q?DDJTlpJzcmpkd5q+gzP+uxdPU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWplRDNTYlA4ZDMwcG5OK0pvNTRWQnJBWjRQNGsxbWxnaGNvZTV4bTd0VHAx?=
 =?utf-8?B?Z3pCTmdHdmkrdC82MEk2bFJHK21aRmFEYkpsZzlYQzRvclhYdE1zbkJndzU0?=
 =?utf-8?B?UjBaVjdrV3dHZm9lSFNkSlkrNmNscC9hdmNoanBDd3hTcjZrTUZhYmovM29p?=
 =?utf-8?B?WEUzMEVGSWZTeUQ1VDF5UFh6MjFSVzNvNHRPYzczcHRMeG1IQ0dqVW5KbGdP?=
 =?utf-8?B?WU9vRUUzVkQ5cWR5RUpMRkNiZXFWZks5dkhTOFdQL3NZeWNGRmh4NmN5QjVq?=
 =?utf-8?B?Nm1jWjlHU3JVN2V6SlpMNHkyVlV6ZDhuZFdGam9RaTVJRGRUcFdrMkNaY0s1?=
 =?utf-8?B?VWY4RTY0YnZRNXZGSWwxZk9GcFd5N0FQYm0yMWtibnFzbFhhMVQwYW1pOTJN?=
 =?utf-8?B?eHJIMzl5WjZXWTlZQ1MwVi9LVVRLVFZwV1RZNnZSdWVMbi9oeStRMUtsMVlw?=
 =?utf-8?B?S2g4SW85ZE9QVTBNUUl1YmJCZ0ZXTnVyZXNpYmZFM2c1c1g3Q295NHV5L3RM?=
 =?utf-8?B?WHU2VC9hb3dkV0dVcmVqcFk4K0ZjRFVaajJNdlpoYTMzODJEU3RyazVIOFVZ?=
 =?utf-8?B?eWM2Q3oyZUM1bXBFb0J4YnZyakQwMUpuazU3NVlia0Q1MzViZFlvNEhCR0Vy?=
 =?utf-8?B?OElnOWNJTDhMU0NkZ2FldjJ1dHN6ZmEyWlluYzJBeUQzQi9CRks0YnExTFRD?=
 =?utf-8?B?TkkvUS9rZU5Gb0FuSTlGa09IVks0eW5tYmdrU0VDY3BGZkdTRmJhbzNnSE1G?=
 =?utf-8?B?VXdGS0dnZ0plclgwa0FDTTUvWitKU256S0FncEpPQklxUW9BMlhJYURmdHM0?=
 =?utf-8?B?MnI3VTQ5VU1uVmlvODJOWVFiNzJvT0g0TXJzV1BVSCtoemdoRmpCL2h0SGNj?=
 =?utf-8?B?VFZ6dEh5bjZHUncwMDM0aFNoNDJkZ2p4c000NHZpTUR0eU5MZ1FIeFBaNTd0?=
 =?utf-8?B?bk5XVUpnMFZMMS9EdUNyYXdkaWtQQXdLNE9YdE9nQ29iYzcrNTF2NEYwNy9F?=
 =?utf-8?B?TWtMUEl5eGI1NGhrRnBiOG91V2dTb1pjd0FLaFM2Y0RoeVlJVTd2clFGeEN6?=
 =?utf-8?B?R2pLRXJIRFlMVXlweUpXTHpQRExyWnNsK3JNbmVqSGwxV2FmUFJpVllqWDFH?=
 =?utf-8?B?ajBiZnpWOVowV1pOTW1TL2J6bkw2dHFwUlF0QnZ4TmRudjAvZGxwYzZOMHNm?=
 =?utf-8?B?RkRhNXlxTDREVWpGQWIvdWZ4ZGVVZG41dmEwaTdORUJZM1dhMlJnTSsyUENv?=
 =?utf-8?B?S05rOFdudFIyd3dSYWZsYXl1OVltaCtlUGxwUVFoQ2hyWC9UaTRWemJDUDBO?=
 =?utf-8?B?OWNxaERMcHNkSXVHN2JROERwRTVqeG5mN0lkdVZibE5MWXRMYnJDemdUdVBo?=
 =?utf-8?B?S2FpZEluZGtWVVhnZWV2bi9sNUhZZTV6MHVzd3hxK2duWXVkVkNpTVpzWmR6?=
 =?utf-8?B?NDMrMWp4dmNWeldsTGNkdGwrelBXdUt3NkRDZXFIOGVFOFhWL3dQbTZ2UEpk?=
 =?utf-8?B?MUgzSURBL3Erdjd3eTlSSmkrR1Z4ZkpBL2c2UExNRDVYU3ZwdVJ1ZVNyYXZm?=
 =?utf-8?B?a1d2LzZYa0FvQ0FIUWU0Z0I2bUt3U3FqT1oyUjk3aHFONnpnTHprdWU1Z1F0?=
 =?utf-8?B?bTJ4d2pLSHJBVDg2M0xLVVVUbXhUV0I5L2g2NTJ1K3l5SVppYkVERkpCeG50?=
 =?utf-8?Q?jfrzhKMqBRnPvdSmmBgx?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-b4c57.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: eda78b78-6aea-4fb5-dc8f-08dd12872be2
X-MS-Exchange-CrossTenant-AuthSource: SI6PR01MB6400.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 04:09:53.0007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5229
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:27:09 +0000
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
Reply-To: CAO3ALPyC20qhCV4J93gxsiaovgXY_DWh7D2=mVK-YKAV=9sXQA@mail.gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have the exact same issue with you. I'm using a laptop with 7840hs.
I encountered this warning after upgrading the kerne to 6.11.10.
Maybe some back-port patches break something, I think there is no 
warning when I got into kernel 6.11.0.
And the warning also exists in 6.13-rc1.
Maybe you can post this issue to 
https://gitlab.freedesktop.org/drm/amd/-/issues
AMD employees are working there to address amdgpu driver issue.

