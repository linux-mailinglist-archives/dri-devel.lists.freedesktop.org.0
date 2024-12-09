Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D19E8B5D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 07:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B52B10E29B;
	Mon,  9 Dec 2024 06:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="UodOGWTz";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zJlURkc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D48B10E29B;
 Mon,  9 Dec 2024 06:13:50 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NNCYU025031;
 Mon, 9 Dec 2024 06:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=k+IMN54UVpAPMOnRFcUOIHQb3gDXMAlS6Bgq2dCxlMk=; b=
 UodOGWTzkosoV4ibbSITUbx6YHKPmVCVDRpHSPovQaq1AiwnZglMmbDaBALdWl8o
 u33y5DC0jpC1N+/COZ6Wq0Mbo2++4mRnvRwq4t8C8vor38jqbisi9E/6eF4P6qnY
 r9Y20JxL7gYvcFmMLiHadT3PVogDEWi6/UwIt9uqE2dblZ85lI8iwvQd6GpMj9f7
 p8c/hY7MTd0qILdz0bSgRrvcV5zq8dAiJ6kQYqw8dU/OQ9yGvJFY45p58GJ5nYo+
 WUA64NhdNDeoIi7I0ibgsuQ+6NNcP/JRJITr88XtkF2MIbwcpVivCB/Mp+DWzz6E
 ageL4KDBdDhsPfBWTRV4OQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ddr60mes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Dec 2024 06:13:46 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 4B95go6Y008679; Mon, 9 Dec 2024 06:13:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 43cct6metw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Dec 2024 06:13:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMyirjcLAx4oyilxWPgVyBLTnteEcuUKNQcWOGKVQxTkmKw4pIXKkw5pGXV3uDzOVItohfme9V1oCihpDHJgj+DnxTVdX7FeLAWjbUoADDB7CSbaUhK/L+4tij+K464nJ0cjKOnNWpbi/RMFI/yUyNVfnN/KrpMNUm4wyv8pjfHK5zcHR9EwBLRgpcItWneXKn3hb2APCjO4LpUzuuoGfjgjmQ+qXLutqb3HX12TVwqgQttOOw/nxubp1+SRSpR1lmykfhIRyJsZC3v7PzDb1XnfrZI9Qkji3JgDiNc7Tlpw301SeMR3cMqykbFE1byQfZH6/SDoEX7lkrbf+AA03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+IMN54UVpAPMOnRFcUOIHQb3gDXMAlS6Bgq2dCxlMk=;
 b=W6Odejv36lmrM48Uc7djEezYxeJ0Uh+dvTyHb1t3/7hWw4rCbXqITwcMq4QtPouI0VerLHV/Z3GQ6VtgC+bMKeBXrRrOAX+j51K/mZaS4FgpQYGtY0r9FJ8ZmhLmhaIbkEkZNR4U9kBOKciKInOqeOUJbGUtSVkJjQQk5XsIWNs2Fay7q5ldDEA5iykPTJKCiDD17D+vbF7SaQzASAr5yPwezGiRZ/DlVlgW6dP9EnFKgY13Z2507gPLnDEYStyZZJKlhLVKjNHTBy6q17XDs45bgHq8sJQtZpJ9M8r7i/21EeLVUDGNA4rcMhcyfc7Mr+Ut9ZWVTRcg5JOK3d/NWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+IMN54UVpAPMOnRFcUOIHQb3gDXMAlS6Bgq2dCxlMk=;
 b=zJlURkc2cL0Mzp4Obw9QtJZ/u9RIuS2eCeGPig7y4SUAuyGRt59A3WkwPVZy/xNpDBGZSIt8ShRxZ+vXaK1I/uNnGL82K/RKGOvxBzocjcV2UfEOmik/ti6BfFxqTMwfSmXTyEsyNnYfaWDT6vA5o+K8eJUUaBZCrMEIIAjKPSw=
Received: from DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10)
 by MW4PR10MB5677.namprd10.prod.outlook.com (2603:10b6:303:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 9 Dec
 2024 06:13:42 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38]) by DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38%6]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 06:13:42 +0000
Message-ID: <82d8db95-2f62-4124-aff8-424252f505df@oracle.com>
Date: Mon, 9 Dec 2024 11:43:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1.y] drm/amd/display: Don't refer to dc_sink in
 is_dsc_need_re_compute
To: jianqi.ren.cn@windriver.com, wayne.lin@amd.com, gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Jerry.Zuo@amd.com, zaeem.mohamed@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
References: <20241209063637.3427088-1-jianqi.ren.cn@windriver.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20241209063637.3427088-1-jianqi.ren.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To DM4PR10MB6886.namprd10.prod.outlook.com
 (2603:10b6:8:102::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6886:EE_|MW4PR10MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bd4ab4-625e-41f1-a813-08dd1818a10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFQxUTRrZnBOVlpDMzQ2YlRlTVQ5d29nQjFpSHY5TG5ZTmJEcThPSlI3cFNP?=
 =?utf-8?B?K1ByK3lGTnlzUE00TU1KOUw5ZTY3OHZjY2ZHWlBMeFM0d3RvQy9acXBwWXdz?=
 =?utf-8?B?RDd3bkJhZzBpd3VTb0N2NzNtMmhlT0dHRFg2Q3hWbkxJNWxaNFZvclljdUw0?=
 =?utf-8?B?YkZtV1F4Wm95em8za1c5OURnTEV5TTZrb3lYajdDRS85RFhOUTNwVW9MUTl2?=
 =?utf-8?B?cVVNbHlOODAxNk9CNjlqY1VpK2lidHdqVEFsbVI3NW5vOGhkcnBCRDQxeUN2?=
 =?utf-8?B?a0NWV1RxQXkwZnl5T3YrQkhub2VKdmFnS3VmcTZXNHhHZytOdVRodXJxdEV5?=
 =?utf-8?B?SmYycDQxRGtPc1ZKM05BVllISlRmc1dvZVBVUjc0UE1ISGtIelg2VVlzM2pq?=
 =?utf-8?B?QkhFYS9QdHMrS2xla3hRSXFzL0hIb2UwSkJuNUwyc3JkeE1Yc25zbk5GUUc5?=
 =?utf-8?B?aTN6djk0Um5tNGJ3elh3a2xXOVFNRnVKK0hJOVlrMVkxOUpMQ1lxeVQ3M2Y5?=
 =?utf-8?B?aFd3K2hVdXhJUmp3VHkwSXVydnpKYnBtNTVZaVFHQmI3cWd0NlA0Q0U0MFFF?=
 =?utf-8?B?ZnFLTk9kTXRHN0F6N2p1RDBHMFluVzJvc1E0c0tWU3IrT1JBcCtucm1Yb1N4?=
 =?utf-8?B?cSszWEd1dUsxZG9VZWRLSy9sVmk5L3ZGS0Z1SzZ2c0FXUjIwK25IL3N0dTZ5?=
 =?utf-8?B?SDlXaTVkNDFocUYvZVA2K0V5NGQ1T2Y3WkxVQVFGSzlXYTZpSi9HTjlaQngx?=
 =?utf-8?B?TWwxMTFSTUQ4Wm9NSU9NZ3hvc2hjOEpXQm9aOUY4RUVsSTQwZGtEV3AxdVJK?=
 =?utf-8?B?MENBUXFXa3JsQWF4UC9KcFlMVlBZSzBqWDBKMkxBZ25lTTFRMXF2UGN1clFG?=
 =?utf-8?B?c0JjTC9vTTJzeUJPTUxnRld0TlFaK0xLSm04Vkp5MzVYdlFlL2wvZkwxYlcw?=
 =?utf-8?B?c1BCZ256ZjRWdjBBbk0wSzBJV2hha0ljWko1WTBkcnJnUFVxaVhucFg2b1Iy?=
 =?utf-8?B?ZTd5WUlqUzRST3lHSS9sbWcwSEFVZFBoeWZuZXVRL2hHZ0VvbFNoV0lrbEs3?=
 =?utf-8?B?TG4xWEZmMzFGZmsvKzcxNWttRjBTQ2g0ZFpJTXBlVUV4eWtEb3dBWWFzbjVI?=
 =?utf-8?B?OXVaSDVvVnBNVDhrTWdjclVjblhiTHVOUWxKSFNNd0xPNFhoSkx3UXdRSFpz?=
 =?utf-8?B?Um5pZ3hUK2hJU1hCeHBhaFNjVVgreStEMlc4Q0szelo0U1V3djlkSlNuck13?=
 =?utf-8?B?K0d5RUxEL3h3OGNNcS9MM29NVFMzWUpDTXZUQzJ2OGZJRzFuS1dzS21wdjc5?=
 =?utf-8?B?aU9aL2k1N3lldDhPT3Rmcm11cjNUZ0p1V3NsMFk2eEZyM0REelJCWkJWaTdL?=
 =?utf-8?B?a04wME1DenhlekI2NjQzN2RoQmpJQzdqZXAvVGNSNzRkZnpKZGVmN0Rxd01u?=
 =?utf-8?B?WXhhMTEzVXF0M2N0UDMxWGg4Rm5rOXRPQno5VWxsYm9LZ2t6SHRCNmdvTlJs?=
 =?utf-8?B?S3RiUTZRSDNxNlM2UUdIbkRkdnZsYWQzekhHWG9XZ1RMay9QcEtrNWlNcXZS?=
 =?utf-8?B?eGtha0E3YU5XR1NUbVdNZ3dGQTh0S2NZUjVBVmR1U3l3dG1ZWHdaclFrc25m?=
 =?utf-8?B?WDFyUFZOc3lvR0hrNVFQRUhzbHRsMno4RHA1U0h5RUZJRlI4U3lJRDFJYkc1?=
 =?utf-8?B?Tlk2YS9yb3l0dmpkOUJFZUJrQmNpUGVqRU5GdFVjbmVCNHJ6YW5NWGwxbHFW?=
 =?utf-8?B?b0laUWc5U3hKQmxwVGJqenNrSGxVRy9pdDd0RVR5ZFdZejRpQ1FPWGtrRFVh?=
 =?utf-8?B?TmF3RVZTZEM3MGlMSDJDQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB6886.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KytiNjZMVkt2VytweDVsWnRUTmNVd09hZ1E5dDZlNzZIM3FZTmlkY1dIS3Fm?=
 =?utf-8?B?dnd2dDkzOE9HZzg2anFjNDNlRjFCc2p6dXZZZWdzWTd1c1UybGc2NTI2MndD?=
 =?utf-8?B?TDBaS2JBZnk2T2FmenhRSXdZaW5zUnFwd004NlhqcTlBRldiRTF1RkVZTjI3?=
 =?utf-8?B?R2JDN2NYNWF4SmdMZTFWa0pBNlkwc1BCNE5qSlF6d09Sd0pUT296V28vbHhn?=
 =?utf-8?B?bzdwYVdJanJPUTloR3o5cFNPak5BNXpTdFdBazdLZGJLaEZHTVdSOUdzSFpj?=
 =?utf-8?B?bFB0YnhPZkg4V2ZocFZNQ0pxclpUNkZXN1V0M0I3Mk5IR1o5QVRCbzdmK2k0?=
 =?utf-8?B?V0xPTGlURXhVN3JQSzhyL1lmTGpOTzcvNnd6VG9rcTA4d2NoNEFCOWV5V2JP?=
 =?utf-8?B?WVlWRFp5UzlxWXYxVld5M3dUMWRKYkp3ZlF5Umt6MmNnL0JGc1BpTi9rVWNv?=
 =?utf-8?B?NjU3VWxHSnRNOVpHbkgxQmNQZ2dmRzFybmFhMmkvVlBsdUc1YUNuTm5SQkZH?=
 =?utf-8?B?MFRvYU1nZ3ZTR0R6YUF5UDlvcjMyeGFlZ3UzZDdEL0tXQi9vam0zeE9tWTMr?=
 =?utf-8?B?TUtUMEVXUkhRU3V3dGtTMGk4UU53dGJ3Qi9CRCt1RGJ5azRmUStldVgzMnIv?=
 =?utf-8?B?emhYU3pRYlByKzlJVjNKck5HSHNKMXNVZVdnOFFTT2g1K2Y5eVBNM2Y0dkNX?=
 =?utf-8?B?SXgrKytPdnBjN0xnSkxwdkhDU0RUS3ZQMkt1RUZ1MkJKR1NJRVNOZ2JkOEU0?=
 =?utf-8?B?aUxTaWxLUVpBQVIxKzJyOGlBS3ROb3hZSWZJeEgyVk1wOU1iS0tJWmlxcU1v?=
 =?utf-8?B?NVR4SmxIMzZBUk1QM2syMjQ1ZFhRNWQrTkNLUDJnREF0OWZnM0RtN0xrY2ZJ?=
 =?utf-8?B?ZWtvV1dRL01hMmlTMWFCMGtPU2xWOFpmQkc0cHF3QkIxQWdWWm9uVjByUVNR?=
 =?utf-8?B?VDhwRVRHZjZoYWh3M0cxV1BPcFJDK3hJQ1ptRFBqSVZLY2VvVHBIaStnRUxU?=
 =?utf-8?B?SWw3UTQ2a3ovemxtZWIwTW5wNHZVdUZoUTJobFN4V3lyK3JGQnVLSmFwYmpQ?=
 =?utf-8?B?YTl4b3hyS09xSU0rZkM0aWJsZ2pKa2czTmNWVTZhNXN6Y09Qblo0K1U5bzVN?=
 =?utf-8?B?eStrbzBMMGpNZkJjc3lVeG5LbFRLRzJlbm45L3dTMjR5RWdDMG5kekVEWExm?=
 =?utf-8?B?cnkwNStsS05VaU14RElZcks2KzFwRHBuNGc5SzZqSnZJYkpybkd5Vnc0a3Aw?=
 =?utf-8?B?L0IxRWcySEFmOTZzdUZzc1FDTXJzd0hNcEZ4Mkc5MkY0QWZqSTBsKy91V1k0?=
 =?utf-8?B?NC8zZlAzVkpyVkdQYnhlV09uVXBuS0c5bDNUZk9XZytnMjFWOGZJNDJrOGVB?=
 =?utf-8?B?cjRFcDhSMlllWGFHM1BFSXpIZU5OVVFLSzh6YmpGdWprM0crbktoOWV1NmZa?=
 =?utf-8?B?S3p0QXVQNkYyYnI2UlpucFFQL25vS042ay9qN01JNlNzRUpQQTB5dVEyOHds?=
 =?utf-8?B?K05Jc2FsTVh1dzkrelNCcFhOQWJURlJyTEhMVE5BNG9tWG1CYktvMU1MSDZa?=
 =?utf-8?B?cWJGSzI3KzVhQndVZC9lREJreHRXdFpNWElFendPZ05hM0JOWVVRWVNldkdo?=
 =?utf-8?B?aVd3QkdlcndWVGVuRHhnWE5KL3JabEFvQldjZWFsL1RZcGFYeURqbUlCUU9R?=
 =?utf-8?B?VkgrUjFUczlMRWZwOTlpSElRTlM5bW9SeU9hcitnUGtlQ0RPZDJCMTU2bzBz?=
 =?utf-8?B?eVZQN2xOSEk1dlFBUkhuNGNjbUNMZW9KNC9mZjVJR3JMc3poWHVTZjFzbmVq?=
 =?utf-8?B?UnN5cCtPckdLL2czTUJhTnVJODg2STgyeExidkh5eVBqQkNhdzJCMmpyNkNT?=
 =?utf-8?B?QUVFejBnZVBwckJaT3lKN1hOcXB0Q2d2S0REaThHTzVjTm5oWEVPVFRHUTMx?=
 =?utf-8?B?YlcveFFBZkEzSWdHcjhrT3BBbFdIVmZKUTJkR0RGMjlJUlQvNHBwc0lXdEZO?=
 =?utf-8?B?bzA2cmRCR0RGQWIyTFdTWGtIV3ZmT2d1bm51WTA4Y3JWRnpGeVp1eCtCdTg0?=
 =?utf-8?B?ZXJNbzV1SHZVdkNOaFFSTUJVT2hic09YYUNqMFRUd0JVamZFTWNhWlFKWDRP?=
 =?utf-8?B?K3o4ZUIyb0xYVHRJYzNRSWU2elhKd0VqdnNxRnp5TVdFbXhMbWdjWVdmTWda?=
 =?utf-8?Q?usmRXv2QG6Enj0lrZz0yqhA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: k0OzxaazbJxKONJsGmnfpebikZwqE+ps+E4SjAItwCGZKExpwF34Hvt0sIUO0j377AIWerMuNYoLSK3wrVx7O/t+HJISGe4e4AquDB8TT7ZQEM99jDYV41oLoGnHm+M983a9aVlTCIEkOb7PrwYD/Y64xX97c0yrFradBJld/19Aco7sfDqoNg85vjkypVHby9Mx0sxwmG0uxKhO+xOdZ6PUQ9pvLMh7RS8DaofCwpwLS3yG1hlxyVAoMs/DuNFWN75h1k9hn1xKCqS0LE1GsvV7wKwaUkjTwYzlV5c8BlAyt8GEBW41vDnvkqsHR/j+jOojpSsv9ZAOMNL80adIU0yMEwZkmj3g/mY7TV2qURq4j4g3KKqWASf1wyUN6U9UWdiCLHbb81LI5b98K5m8oyjQZDIJFETy0vQlqLzEgL1SIuKNnag/pSWOIPgvTrPCJB0TB3daugpswj5XVFZYUP7HWk9Jok7QAjWQVfdXxcV9G6W5C2y/lKf/dIPN6ClHd/MeXS5L/rP+Wo5lOkQwr5A9YeDycvnTcLZJijzEEtnddSvhDqtyUzjFXYBxti//tKaL8nKDkQ/hcwY2co1HnjKWj+31KzGiaeIXMIbD8H8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bd4ab4-625e-41f1-a813-08dd1818a10a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6886.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 06:13:41.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2P2nzc4b2DhqQu2N0fDkUAy+31ms0nBmJI3fESmkv8G54VK1d2eWb10F6irRe6RrmWTxkHZ8F4p9LOLwot88OKD4p8FVMWQDFKQ1icFMJ3Id4kalLWkNXIWWx87o4/N3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_02,2024-12-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412090050
X-Proofpoint-GUID: N7L1bf2A2ONT2X_wpJWBkzZnxKTqQKpu
X-Proofpoint-ORIG-GUID: N7L1bf2A2ONT2X_wpJWBkzZnxKTqQKpu
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

Hi Jianqi,

On 09/12/24 12:06, jianqi.ren.cn@windriver.com wrote:
> From: Wayne Lin <wayne.lin@amd.com>
> 
> [ Upstream commit fcf6a49d79923a234844b8efe830a61f3f0584e4 ]
> 
> [Why]
> When unplug one of monitors connected after mst hub, encounter null pointer dereference.
> 
> It's due to dc_sink get released immediately in early_unregister() or detect_ctx(). When
> commit new state which directly referring to info stored in dc_sink will cause null pointer
> dereference.
> 
> [how]
> Remove redundant checking condition. Relevant condition should already be covered by checking
> if dsc_aux is null or not. Also reset dsc_aux to NULL when the connector is disconnected.
> 
> Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
> Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 1acef5f3838f..a1619f4569cf 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -183,6 +183,8 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
>   		dc_sink_release(dc_sink);
>   		aconnector->dc_sink = NULL;
>   		aconnector->edid = NULL;
> +		aconnector->dsc_aux = NULL;
> +		port->passthrough_aux = NULL;
>   	}
>   
>   	aconnector->mst_status = MST_STATUS_DEFAULT;
> @@ -487,6 +489,8 @@ dm_dp_mst_detect(struct drm_connector *connector,
>   		dc_sink_release(aconnector->dc_sink);
>   		aconnector->dc_sink = NULL;
>   		aconnector->edid = NULL;
> +		aconnector->dsc_aux = NULL;
> +		port->passthrough_aux = NULL;
>   
>   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>   			MST_REMOTE_EDID | MST_ALLOCATE_NEW_PAYLOAD | MST_CLEAR_ALLOCATED_PAYLOAD,

This backport doesn't look right to me, can you please clarify these.

1.  I think it is worth documenting in commit message just before your 
SOB on why you don't need this hunk:

                         MST_REMOTE_EDID | MST_ALLOCATE_NEW_PAYLOAD | 
MST_CLEAR_ALLOCATED_PAYLOAD,
@@ -1238,14 +1242,6 @@ static bool is_dsc_need_re_compute(
                 if (!aconnector || !aconnector->dsc_aux)
                         continue;

-               /*
-                *      check if cached virtual MST DSC caps are 
available and DSC is supported
-                *      as per specifications in their Virtual DPCD 
registers.
-               */
-               if 
(!(aconnector->dc_sink->dsc_caps.dsc_dec_caps.is_dsc_supported ||
- 
aconnector->dc_link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_PASSTHROUGH_SUPPORT))
-                       continue;
-
                 stream_on_link[new_stream_on_link_num] = aconnector;
                 new_stream_on_link_num++;


which is part of upstream, I understand that this is not in 6.1.y code, 
if so is it even affected ?

2. Also commit message says:

""
Remove redundant checking condition. Relevant condition should already 
be covered by checking if dsc_aux is null or not. Also reset dsc_aux to 
NULL when the connector is disconnected.
""

but the if(!aconnector->dsc_aux) is not in 6.1.y, so something is 
missing. Maybe 6.1.y is not affected or we need more backports to 6.1.y 
to make them clean cherry-picks ?

Thanks,
Harshit


