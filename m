Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8BC7DDCB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 08:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F5610E04A;
	Sun, 23 Nov 2025 07:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="ERUIQYWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2303 seconds by postgrey-1.36 at gabe;
 Sun, 23 Nov 2025 07:57:46 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FE010E04A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 07:57:45 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AN6iWT63127148; Sat, 22 Nov 2025 23:19:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 PPS06212021; bh=4/Id7A+FsgkXuNn+Zb3Ta8baas4hBheDCguMwjqYs3M=; b=
 ERUIQYWobjokVu84swGtYI0pk7FF/ifvZ0tru6mdXbpAvSZcbD1xdylMV384PDyS
 Qpc2/1tqvOqvp6oqdPQmNwLxu+V5dd6KJyRo0oFYZB9ZHA2MWHtQEugL87P+GbCa
 Xt3junhhyJs+ONHS+kZZJizjSE4LL6ifg7hYRs2LzVsh99qEwolkdzVJRpzynFqo
 BddWuVP27aX4aNmO6zq7tbpCYRyNnZjw6n3W5lPSdK3CrZSF8FumFBByISbOq96n
 trxJtR4Pq80onSeLN9taEUlJkdAvb9130E45YFyxgyVs3AkivcyuiyAc38v8yTy2
 ojwkZU0dpmmBeFrin7bHsA==
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b58q3j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 22 Nov 2025 23:19:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6O/ZLeIBUBiy2ra2lzY2/mcoDiMFO1qYat/Ah/iXLLE9vWmMpHDcahgQ/87ySBIbu9GWaLo5GdCRhXI2PorpWds8nrdMOPYBOYFf5mQYPytKDo7cDfZV4u1MkXfVVFpl1JCEAR5DS4qpOUL6UzBZIdmIXWTLE5Wyvf8hTM4LUl19TM+XJRMJzT7llETOmM9ABljJNISLQo+tXyNT5Sjk2tCN5DSaVnJfzW9Zys6aci5xADTCjHEVOuMKzTC0G9+Gb+B1CLz7ivqm8Ra3kWVxoLTycbUwifBP3wsAZLiuPhpVzseee/SxTT5UCw3NI0ip6e7PKL5s3/bTrVCWRILSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/Id7A+FsgkXuNn+Zb3Ta8baas4hBheDCguMwjqYs3M=;
 b=wl4WJBeCvqB7iTu6UAa0yx0AZJLz15NPwIoezfs0hKqFQxj1XKl193mVKcic86VxUbuxQeNFKt5J1ERx8zDHWbeiZZlc72JtxXB9Jay4bAygB1u4FZV7URJRsyB95Rq8ZDGHT5oHXO3C3FuMNEYG+fB3AtyfJ2ujVwS7FjH7TYIb6sOdzKPoMIQ1ScC5xn3d82LZeTyuy0U0/+QtKGKM2WCALpIIiktQcATXFW6Qzxo9ozIQExWh+rtl/VFwYKgwH1bcs0Frj/X98AibItHMmp24IBiJQsrs5SJ17aDnZQGC9d6SUYnu+ElnfveY0AUZTo1ful6AneyjGJNmjOE8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9201.namprd11.prod.outlook.com (2603:10b6:208:561::16)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 07:19:02 +0000
Received: from IA4PR11MB9201.namprd11.prod.outlook.com
 ([fe80::a51c:d456:b4dc:d6f6]) by IA4PR11MB9201.namprd11.prod.outlook.com
 ([fe80::a51c:d456:b4dc:d6f6%7]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 07:19:02 +0000
Message-ID: <73c60aee-5a87-43f2-bec5-e09f7871bf79@windriver.com>
Date: Sun, 23 Nov 2025 15:18:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: set the V3D GPU sg segment limitation
To: mwen@igalia.com, mcanal@igalia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251113092538.1971286-1-xiaolei.wang@windriver.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20251113092538.1971286-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::8) To IA4PR11MB9201.namprd11.prod.outlook.com
 (2603:10b6:208:561::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9201:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 55464634-246a-424b-c06c-08de2a609351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm9GQjZrUVk1a0dqd1M3bE1mZnk4cWpTcHUwNmZIWFYzbHZpUUtIMEJWQmdl?=
 =?utf-8?B?MjZwZmM5VytXV3Q4Q0YwTWVORzVqWDBBL09XYnlHZ2NoUHcyaXRIQXVPTDZE?=
 =?utf-8?B?YW5NRW5laUVzVXBhbzBETWs0TWRNNVhZMVI4dnFWVkhabVNRcUdpUWNRaHlL?=
 =?utf-8?B?YWZsVCt1cjlheXlJazNkSDRBRzFkeE5oUjZ4U1d4TkU0cjVkRkJWNWEwbGxl?=
 =?utf-8?B?ZEZjNitVdEZzeGxaaldCTXVGTkp4UGFpZ2dJMjhHSnlvQklEYzBjL0V5TDRz?=
 =?utf-8?B?RHlOU1V4NTVZSnBEd1krSnkvVVZ0aXZ0SXQ1TDBUNStRejJZdjR6bkcrKzdS?=
 =?utf-8?B?MmxTTjdkTnRpeDhweTNuZkwrd25IelVPc2t3d1BmMzFvaEY4MjBtYk5PazNN?=
 =?utf-8?B?TWp5S0tFTW1ObjMwY3hXa0ZET3BnRlVzVDEzMXFISUhiOWlYdC95RWpta0Zm?=
 =?utf-8?B?dWw2bFFsSG5jTVZXeDVRYUlOU1lIc29xVkpDcGpZUnR4KzhkZ1FzdTBNcWxQ?=
 =?utf-8?B?WGlqSFVFQlVzaEFBVEdVL2I4dDNvR05kRjV0RE1nc1IyY2RSOTNPcW9keWxM?=
 =?utf-8?B?QWFTbjFSTVlOZjJIRFlHOThjRGFZTktHWlozWExrd3dTSnBsU1d4T3B6enJP?=
 =?utf-8?B?L0JJR0xDZmhQbmVZR1lld0tOMis4U1czZS9oNEhZNFlMTlcvS1I4V2MrVVgw?=
 =?utf-8?B?dEdZZkp5U0piTHI3aWM1ZnJoTHljNUZmcGZCVGc5Vi9MU1ZmYlFXN1FGNktJ?=
 =?utf-8?B?Ni8zdDdLc0VoVGNqOVVuaXRiR0N1R0g4WlEycEJMNURNMEo5YnRHWkZSRzJO?=
 =?utf-8?B?TUdPcnJHTjNINHhoYTBsWW9zdGFSWHNzZGUzWlpEK2xVak5IV1cvWURQNmtZ?=
 =?utf-8?B?NnNsRXFkNmxlbHV6OGxYNDdPVndqNzJqSFBIckNvY3p3UTFPMTJxci9pY3c5?=
 =?utf-8?B?THpnTTBmYXBTZUppaTVVK3g2ZTF2RklMdi9YRVR0eWRXK1dmWXErME9WcEdv?=
 =?utf-8?B?TWFDTm1Nd0UxU2NDVTRNOGtQNURCMHgwQnZvQnFldVJYNTNQQ0VoazVlN1Rw?=
 =?utf-8?B?VlB2YWhSQ29MUnIyeDhzbk9iTmtYa0YwRk13c1lzRGdzbWN0TlJPQUJOMDBQ?=
 =?utf-8?B?b2FCdU1MSm5RZlN2SkRBMXBGaS9aeWR3N0Y1L2ZxaXBKTENjZ2xoV0hPR0ZK?=
 =?utf-8?B?ejV6VDhaWjlPL2UzSkJrd0U2L0pZOVQ5R3pVN1RxQWx2bTVGTFRidmZ5TXVY?=
 =?utf-8?B?Q2NoYWY0a1RlRHZCYkhrREZ0K09DVTZGb3hZM0VSVnFCRGVodUJLbmR4UHFY?=
 =?utf-8?B?cHJkelZJK3R5anpCdEdVSW5TVWxCMDIrVHZ4TWdseDBrejlyNkVXZllqYmFs?=
 =?utf-8?B?MjR1eE80ajRrVGZYS3BqbVJzMTZqM2JpTzRZQ1B3MFEwNjJoUTJMVitGN2tO?=
 =?utf-8?B?VUp0cStLd08rY1F0WHh2eEVuSzVQd0JJMCtycWpGM0Jsa3AxaXhLN2F5dk9N?=
 =?utf-8?B?SXBuMGRLWFFuZytaYVRBVzJqdW9HaVMwdUh4YlRsTmM5NWtxbjVnL01JTzJt?=
 =?utf-8?B?a3ZUcUQ2ejBaYjR3dlRpeXdnNWVHNTN1UjBGQ2RWcW1LQXlSSzdRN2V6Qm1k?=
 =?utf-8?B?TEtGWkNBbVZOVXVybHUxVmNVM2paZ1k4Z0xock02OUJTNnRybkJOWmZSeE9I?=
 =?utf-8?B?ZDlaWWpQRDV3cFNXNmpZQmxxWHdTVDh2MEJDdVdSaUYvNThYKzVVTTliV01T?=
 =?utf-8?B?NDV2TWo4YmhRbTgyZVlhZ0dkQWw3dktCSGNFNTFrYXRkeVV0WnJsVWF2bndX?=
 =?utf-8?B?aHR0cWtxQXZ1d2ppRUZVRHNSWWRLZDZueG1lMUdGOWhDOVd2STdKaCtuSzVm?=
 =?utf-8?B?VDJ1bTNJa2l3Y2MyMHJnWmprelZOOUNUem0zZHJzNk1vdjRyWVVxSFpFMnFY?=
 =?utf-8?Q?dkeYkhizONJnH8E3v5CjkYbJOGKx911G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9201.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFlaR0tQejNGOFcxY1VqWm90VzJXTFdzMmJ4and1dW9raGJHNW1QYjdXd0pV?=
 =?utf-8?B?K3VNVmJlaHZEZEp2K0pySlVnNVB4WDBpa1dMNVhaOFh1RktMZklXN2FHY2FB?=
 =?utf-8?B?VjVIaW05dG9tMDZBSnNsTTRySXh0RlFzbXdXNjd1WW1MRkN5WVRVbmVvOFlW?=
 =?utf-8?B?Nk5pU0V4RUczQjZoa2NKbit6WUJEK1lyOHczclkyTzhkZlptQ0xuZ2JFWVJI?=
 =?utf-8?B?NEtBeHNQV3hnRndGZ2hQTlZpbnQyRmVvcnFXdDBXRVZCZmF1SDVkbkx0UHFx?=
 =?utf-8?B?ekNQU01Jc2d3VEI3VnZkTThra0w0OENzVnNVYWp4ZHp5b3hmek9MNndNZ3BC?=
 =?utf-8?B?MFQwMVdMSVMwazNwNTF3WVZSWFo5WjN1UlI0dGtNcmVBRTJXc0d3L3FEajlE?=
 =?utf-8?B?Z3NPT08wT1J5RlVNYzhmUHZlT3ZRRDg5aU9WZTExS1kwYW9NaEtrSVAxYi9j?=
 =?utf-8?B?Z2cvMnVCU1FuZFhFeWxDUUZrY3NuSjVWcktsRVpxUmkybnFEeEFtTVBvVjNV?=
 =?utf-8?B?ZEpmTHhONzJMdmRZQWh4eXIxc3pZOWY1RnhCNUpxT2ppSlM2TndMVCtCSTRq?=
 =?utf-8?B?MnltNUVWakkwRnR0Qkl2UUZONlRscGVHb2dNVlU5akVDVWo4dkJkZytvOTdq?=
 =?utf-8?B?WURaQVVrYnJDdUtqRzRmaS9FNlFuSmRieVpEQk5wN0RCYnFTYytiOVhhcEQ3?=
 =?utf-8?B?bFFXY0NUR05ML1poZEprc1g0Vjl1VkhUNVA2cUx5NFkwbTE4NURlb3ZPaVI3?=
 =?utf-8?B?WXJCbUE4ellXMGxneTBKdmZIeDhWZW5EczFnOVlod1llSk42UThLUjhFNjZr?=
 =?utf-8?B?WWc1WWk4b1Q3clZZMW1hRXpZYXp2MGVoaEo5ZWRneTBlWXNmSmZIUTFEbERs?=
 =?utf-8?B?Vkgzakk0elgySW9CK1VlK0JTOUhFaDRBT3pGdVRncVJvS0FrVEFDNko4bUgw?=
 =?utf-8?B?eENkMVVjbjFxOW5vWDZaOWtIaFQ3d2tycm9jYWFvR0Uxd0hvUlV2YzBsbDN1?=
 =?utf-8?B?SFhkRjh5ZnhYT0tuSS9iY3o4M3B2RDc0QkIzQVJScXphbU5GeVpPTnVJNEh2?=
 =?utf-8?B?a1NGMzA1Yld0cEh5aUZGWmJDQ2hQM2k5bS9YdGJ3N3pYczRKSkRCdEpreFc0?=
 =?utf-8?B?TlpuQ2R4clBSeEFFaldWN3dFajZCcEh1M3I1TUdlVkI1NUFidGhsYVlNL090?=
 =?utf-8?B?VmRlNUgwdFJnUEdMNDdwNUs1RjBteVp5L1JYeGVFVU5nVWQ3eUp2THVpNmdT?=
 =?utf-8?B?Qm9qTWxRSDVEZzN5U2dyTSs0Qk9xMFlyTXh3UnhIWHpqVVU4TWsxSVlDRkVs?=
 =?utf-8?B?TjdTOFFvN25RakhEcldFL3ZYK1ppWmFLbzd2bFRZalVqa1M5U0U1djRkNU5K?=
 =?utf-8?B?dUIzNUViREtlVEJnRTEyMEhoN2R3RnVuWWYwQStRSjhzYmgzRjdzSkllOFQ1?=
 =?utf-8?B?aStsQ3VqL0ZRT1kxN2JLMWJCa3d3VlhLLzE4SGJqSTEvYVQySTRWZzM0Rmtp?=
 =?utf-8?B?aUdKSEZQZkZHVjdWcEw3cTZ1V1JhMDhuS2YxYWxvaldQOUdRa0FWSjFxQVVE?=
 =?utf-8?B?U1pWNlJ1KzBKSWIzaDgwRklkZUJFMHZWakV4ZXJSUUJLK0gyWXJjbGZYV3or?=
 =?utf-8?B?YlRuemtxdEU0Z29QaEozOTExSFEzSzBMdk9wa2JrSjN6a0hKUlVWT0FKSGNZ?=
 =?utf-8?B?bGpyQ0F5Zm1wVUI5dzNvWWN4R2JnR0thSG1NSnBrbW5zbEl4cVNEa3BIT1Y4?=
 =?utf-8?B?bW83dGFmei90K3pDaGlhSUZRK3FwT1pnc3dTRGxFcUhBVWNoVGRCWVlFeGEw?=
 =?utf-8?B?eDFLa3pBRGVhWEI5NXowNjBPcGcrVHhXYjV4czRRR1NrelllZFVjekpod0p6?=
 =?utf-8?B?cTdsM09IVzd5ekVKa2dwaFlyQUk3ZWdwWE5OQ2luVnFsUHluZ25ocGloU1FI?=
 =?utf-8?B?V05XZEZ6K0hFMXdsM2s4ck55dkwrMnJ2QWlIeWUwNjFiL3l4UFZTODBMTnU3?=
 =?utf-8?B?MlNGa25hRHI2eVlCNVdwS29LM1MyZXVJemppUzhndDJaUEsyVldBbm45TDZK?=
 =?utf-8?B?Q013VG1HTE0yT3BTaml6NDV2VzB1OTU5VXZYOXJHMjladjk4cmx3TktGbzV6?=
 =?utf-8?B?Y0hTQjNtU0ovVmx3MURVdVI2SEpTbkk4R2UrdWYwcVBQSjlQT2x3WDN0R0w3?=
 =?utf-8?B?WUVIY2xRZGtETFI4dXB4SXFPdHFjMGsxc1JNWWhDSHg1RXdPY3RRcSt2bE44?=
 =?utf-8?B?dkRXL1RKb1lFbEpmTjdET3llK2t3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55464634-246a-424b-c06c-08de2a609351
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 07:19:02.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21Od0ia18LgqUEiJtrsdPmIgwiJSc1iciNI+GWepSm6H6J+pM9pTmLMqbQJCKgWksxRBaRp1CDWCvQ4/7yJSXIXsCXdK7An+u7cGEnMuGFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=6922b569 cx=c_pps
 a=2g0TT6LSTZPcbpz8VOOaeA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=QKxsKQNywXYTIxyLhEsA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDA2NCBTYWx0ZWRfXzelO/GpzR9S6
 nfmOjl3pOZosimpZapuGMVfDbmDaWuikkazSsJNrIaEecGoxZBMcPYlgomfmCa90bpt1z48B0zV
 jXlzIXZiHRE8Fo/iXRX/1bihLjUf1MIq+UEiOEK12i4ufK3qKRoK5RdhmEuf7U2VUNmTI2YrpBf
 KltsmRuYjY00SLtFk5x6t/CFOwtBCbBlJntFXT9ewYvrxjHJUfeiq6r3gKE9ApOO1EnS8xdBpck
 XWa68ZPmtso7mGoIhMe+As3yKmjAGua96oau/avAsRqjBWLDO3nh6OW+qFQU3tC+64WYvrjIGg5
 8avTK5lsFDGClp/TIHtsNukG3+2hXi7uTHH2Idi89mzo46DiO6Cc5dmdvb1P5WvYvmRtAg3TH5m
 m3y5SR2HEVC6PT0CrAchOH9oUZ9wFg==
X-Proofpoint-GUID: pELs3to2WEhfWZJ-359M1VJBjsFLx_io
X-Proofpoint-ORIG-GUID: pELs3to2WEhfWZJ-359M1VJBjsFLx_io
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_02,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511230064
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

Humble ping...

thanks

xiaolei

On 11/13/25 17:25, Xiaolei Wang wrote:
> When using V3D rendering, the kernel occasionally reports a
> segment size mismatch. This is because 'max_seg_size' is not
> set. The kernel defaults to 64K. Based on V3D's addressing
> capabilities, setting 'max_seg_size' to the maximum will
> prevent 'debug_dma_map_sg()' from complaining about the
> over-mapping of the V3D segment length.
>
> DMA-API: v3d 1002000000.v3d: mapping sg segment longer than device
>   claims to support [len=8290304] [max=65536]
> WARNING: CPU: 0 PID: 493 at kernel/dma/debug.c:1179 debug_dma_map_sg+0x330/0x388
> CPU: 0 UID: 0 PID: 493 Comm: Xorg Not tainted 6.12.53-yocto-standard #1
> Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : debug_dma_map_sg+0x330/0x388
> lr : debug_dma_map_sg+0x330/0x388
> sp : ffff8000829a3ac0
> x29: ffff8000829a3ac0 x28: 0000000000000001 x27: ffff8000813fe000
> x26: ffffc1ffc0000000 x25: ffff00010fdeb760 x24: 0000000000000000
> x23: ffff8000816a9bf0 x22: 0000000000000001 x21: 0000000000000002
> x20: 0000000000000002 x19: ffff00010185e810 x18: ffffffffffffffff
> x17: 69766564206e6168 x16: 74207265676e6f6c x15: 20746e656d676573
> x14: 20677320676e6970 x13: 5d34303334393134 x12: 0000000000000000
> x11: 00000000000000c0 x10: 00000000000009c0 x9 : ffff8000800e0b7c
> x8 : ffff00010a315ca0 x7 : ffff8000816a5110 x6 : 0000000000000001
> x5 : 000000000000002b x4 : 0000000000000002 x3 : 0000000000000008
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010a315280
> Call trace:
>   debug_dma_map_sg+0x330/0x388
>   __dma_map_sg_attrs+0xc0/0x278
>   dma_map_sgtable+0x30/0x58
>   drm_gem_shmem_get_pages_sgt+0xb4/0x140
>   v3d_bo_create_finish+0x28/0x130 [v3d]
>   v3d_create_bo_ioctl+0x54/0x180 [v3d]
>   drm_ioctl_kernel+0xc8/0x140
>   drm_ioctl+0x2d4/0x4d8
>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index c5a3bbbc74c5..f4da7a94e401 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -377,6 +377,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto clk_disable;
>   
> +	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +
>   	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
>   
>   	ident1 = V3D_READ(V3D_HUB_IDENT1);
