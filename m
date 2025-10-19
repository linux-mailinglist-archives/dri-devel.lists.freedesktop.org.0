Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8FBBEE6E9
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028CE10E163;
	Sun, 19 Oct 2025 14:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Jv55izMV";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lTMjyQLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6877110E163;
 Sun, 19 Oct 2025 14:22:32 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J9hm42011050;
 Sun, 19 Oct 2025 14:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2025-04-25; bh=lutSZzv8Dos3FqjE
 b3rT4308gocF7Tir9mdGzYVdVsQ=; b=Jv55izMVA4/8xRjPAb+Z6xn4nJffgamt
 tDgawbLKhIjjecMEyqREt8/D0Y0dLIMxc6vx08EKluf8OUJJ0BY+5okm+ZeUlZwJ
 V4RdjGonAIlXVcfHDcLdgV/QoKdIebLNAieebsZ/nNvq37XMQhF/0dKxBHUyDx9Y
 0sj3lZ+6G6lR4cHYwayoRa0EjpPKJBitiP97iI5Ig1J0qGY01gvRi3vktS00r2c1
 yinW+FQj0pTUohQZUk3al/iKdPkDO6IBFSNdBABgi5t4UOaBLF7gf77PxQtYAfMZ
 ETLnjr3EA15SyQ+Vw/8jCXf1o4h+mMlP93ZWOA3+I7sUJNN1WIXIog==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2yps1sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Oct 2025 14:22:27 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 59J8nSN6013648; Sun, 19 Oct 2025 14:22:26 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 49v1b9wx9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Oct 2025 14:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnI/UBjg+4MocfBqy+Sp0Lw21ConoMVirwhMFlfTebVir4JMVQLv6E1sK/JIw0DfIJvD29eJl4v76U/MsN9UMW/HG+TFmlhbjmALwyD9veK3MkZlh+BJQOi1UDQeh1pEV26dE9WRBMmxcr7MyAknjzWb6/98SE+io7rbd++voys5Y1zHH4sDZ9L6+JknqiRGCgpDy7tgTcm5kWlQ9WPRUUzdJHggO2sAKDPt3hd+DrSRKIcw/gwXVpXsZunMx7P7F5B6+G2C/pnSQyNTjE6gSq7Qkp1KC1Ngi1T7MPbpPy7NVsSM8DSDNxblgIykRipwX3RfMiznYAMzECfOlIqsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lutSZzv8Dos3FqjEb3rT4308gocF7Tir9mdGzYVdVsQ=;
 b=FH/c7HIedmyNa2yWdNh6MFM3HaaKvW2Pq0Pu/a2gq4iAjO8GwhxfVFFnfSXyDd43CZMcvJtEfYRNM117HRLPZpu8M+HPz7rw0HX39sok/qUhblJvVN+08robv6elutmjbNYuzeijaRVsW8nXeuSBgjCai+a9IILjC60xx1tY/c39V2H+RmiibSAbb1sHFih4lYGBYeVBg632n+GVyKbcz8axIPf7sNfmKeiVgnANPVVk7lpXX7rDj51yAXWrRLA5Njbgwg7YxyXqnaOJYAlK0tpRUSD2r+Qizwl5z+wzVbjuSF5PSR32nGbMg6Cn7V+nFTmVBi/rAqwAiQcXLRiXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lutSZzv8Dos3FqjEb3rT4308gocF7Tir9mdGzYVdVsQ=;
 b=lTMjyQLqTir4Vgs7FLudCdw0yI3Im+myAwgDLwV3dTwBy+nUyXVE5F9AA1FgcNnWoYlg8LK50LdIVBIsIcrHadRvASgSQ5EpAux62lrJ68iarQLyNM9wnguu1CO4x3kL5LBaL+YtFPPoF0RWTabChNRo7RWD/WT4oA+mPd4HqII=
Received: from DS4PR10MB997647.namprd10.prod.outlook.com (2603:10b6:8:31f::12)
 by SN7PR10MB6548.namprd10.prod.outlook.com (2603:10b6:806:2ab::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sun, 19 Oct
 2025 14:22:18 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::34a0:967d:4555:35fc]) by DS4PR10MB997647.namprd10.prod.outlook.com
 ([fe80::34a0:967d:4555:35fc%4]) with mapi id 15.20.9228.014; Sun, 19 Oct 2025
 14:22:17 +0000
Message-ID: <33db45cc-c007-4a72-9303-7690d6818e73@oracle.com>
Date: Sun, 19 Oct 2025 19:51:08 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, tursulin@ursulin.net,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Subject: [bug-report] i915 DMC assert crash on HDMI hotplug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::34) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR10MB997647:EE_|SN7PR10MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: d62d556f-92d2-48c8-eb09-08de0f1ac430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEszaC9JZFQwMzh5S2RGdUhLOHY0WC9VWG5MTDJDNVJqUUFaSzJVOXBEWWRl?=
 =?utf-8?B?N1U4b1ZiL2FEQWcxcjIrcHpvZFcrWVMrUXVDd1FlNDQwbmtvODZ1R1NBRDIw?=
 =?utf-8?B?RXB0UU1zNExrY21oMGQxelRRTm5NMHB6emZDczFORlJWT0g3VW5GOUU0aE9P?=
 =?utf-8?B?ek0zVFRBajlDN1Mwd0JyTWZueGNGY2NhN0tjNXI2K3lQYmxDUzh4RjdQcVFI?=
 =?utf-8?B?SkNGa3lkZmp3bEEwWXBxRWJhakJGdEhnUU1BVmZ0TmZTcTZPQ04yUS91V25N?=
 =?utf-8?B?SG9nV1ExZmtXbWxkT3NVTWNjdkdzcnBYbXJ6Qy9ocXlVK3Y0cFVGMEduVWJZ?=
 =?utf-8?B?ZXZFRUdtVTdlQWJXemxnUGd3M1R3MFhjb1FldGovSUt5TE53ZjNjK2ZvTmxK?=
 =?utf-8?B?R2YwRTQrNlZZSzZ1VkV6T24yQ0lrVFFENm1OejVoU1lFRER0VG5IRFp1c0I3?=
 =?utf-8?B?NFV2YU5nWTc2UDhCNmMraWt0c3BKMmh0bnpkdStaUEptdDBrSWY4NXV4ZWRk?=
 =?utf-8?B?NiswaUNIdkEyRVNzb3VwdDBlQUp0ejZSUURpSmNRWjMwbXFFMGhiVVpWblJW?=
 =?utf-8?B?ejdFcSt1OWdnTjJKMWI2NFAwaUZLRzY4ajdOWFdzTEdkYVJ6ckYva3dzMzZ2?=
 =?utf-8?B?bEJPbytudVZhMVlmdTEyMkg2WFZqOE5yMU8zaE81bmhhNWxaN3hPR1ZqbTI3?=
 =?utf-8?B?K3VBS0plK0V4S1djSUtYS2EwM3dDMTNpeVc2UEVHSHdmNk9KaXJsSk9jZFI3?=
 =?utf-8?B?MnJpYVN1Y0VsUnBQQmN1ajVnM1NUODZsYmVWbVFqTU1rVE53V2tDK0dMcGFn?=
 =?utf-8?B?eWxvaUtUQ1JRL2xKbk14WGxIUWM5L0t0UVNhVVFPektMMlZaMHNGc25RcW82?=
 =?utf-8?B?TzNiUVRQRE9jNTJraXBsbTdvSUhFL2htZERpSVZPSzFIT0ZsUzNaRUpURFRh?=
 =?utf-8?B?dGlYdno5Y2NEVVJUamZhOGJ0MmZFTzVCZUt0MHVVdENUenBJVXdidXNpczJ2?=
 =?utf-8?B?cDRDNWxxL051TEhwYlJGRmtsSzFGUWpXRDNWcDRtY3JEd083NHJQT1VNUXFn?=
 =?utf-8?B?NjhkMFY5M1BjVFVSNmlpdmpDaTFDc3VRb2dsa0tRY2QrUVJQSEY3NkcyaUta?=
 =?utf-8?B?MHFFRkd1OXM4ZVRrenRyUFVZcjlUNTFoZ3ByNHlXZnBERlZ3Q0NhMzVmZCtL?=
 =?utf-8?B?T085SzA5K1RqUmdHeThlVkk0Q2pNejZtdUI1TmtFcEZ1S1EyYXZ0dDcwSXRT?=
 =?utf-8?B?NUJTdjF0a3ZJWDBzdzlITVFKYjNRUU9VcmkwTDg4TWcwL2RIaWY2eG93SXdL?=
 =?utf-8?B?a2NFdXk4NENuNW1PWTYzY1k1anJ4MjBEY0NRdjMzTVZqL1BsZlcreXN0d213?=
 =?utf-8?B?TU5iRDJ6cWlKdCt4eG12RlVEVWkzN3ZtUXVpaHJqSXJOU04rZmxva0JUOXMw?=
 =?utf-8?B?aExpQTM4dGcyUVJjMlB1ZDdxemZra1NiWC9ydEFTYUFoM2tENWtQcW41QzNR?=
 =?utf-8?B?VEgxbDBWZTVmdWdoeXBxRHpLcy9ZU3JkaXhSMHZCK2hxWkE2MHpId2pDcFpM?=
 =?utf-8?B?MzE3akNGU09oZ09ZVVZ4dzZtTllzWUtHZmNway9IZ012TVFJa2RoeDVsUVJu?=
 =?utf-8?B?bmgwbElqNXluWUlIQ0ZlVzgrbEdKQThFVTAyYURHUzkzQndKVnRQRWtGREYz?=
 =?utf-8?B?UVN3b2tvS0VyTnVLQU44VVdxcSs0Yit3MVBOUTZNK3dwVVU2SWVFZytiaGY2?=
 =?utf-8?B?cmFBRnQzUkwrc3lCOUFFdmNySkVmNXlHUTdLNmdPVXNoS081aTJ4cThod1Y5?=
 =?utf-8?B?WkRjc0Q0akdjSHpWUEF0M2JLcTVOaGd2TWRwa3dUMk5hbnUxTlI1em1sQ0dh?=
 =?utf-8?B?VVhQcmJUNmRJNTJPNTAyeWRXczU0S2ZmYzZlellKNjIySDloZEg5UnM2dUw1?=
 =?utf-8?Q?JBTDT+aQcaXEbxnTCKgK/L1DoOUrwNqK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR10MB997647.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUZNZnJmSkdhUlEvSG9aYXZxWEhkRzMvT2VoSVVab1VCZjl6VnhLazdsUVFK?=
 =?utf-8?B?QUtxdCs3YlZ3OTM2S25pQURjNEU3SjhlSGFZZSt1U2M4UEoyc3BzSEdST3g3?=
 =?utf-8?B?UHNNbFNQNHNxY2FwTnhJc1l1WC9MY1p1RmZwSitRcWZ1ekk1dm9VSHAyZ2I0?=
 =?utf-8?B?L2V5TnZTeVZ2Y1hPWDRJODZTMy9kOXQ0VkYybzhWemtVY1IzcmtMNjVjYk1z?=
 =?utf-8?B?Tmk5OVRvV3lzNkdoMTFOZkQweFVkMC9KeCtZNGxoa1RsdFFCdkVUYXRPaXAr?=
 =?utf-8?B?RnRqRUlsMW1ocjhPNSsxbjBvd3pudEFEQmJ0Z0FBUHZ5WnBlVG4zTDVWMFN5?=
 =?utf-8?B?QmxrM3FjR3lQRmJhQXc2UTBuOUVLdEREcGswd0NYb2h4alQxNHlkanB6WG5q?=
 =?utf-8?B?Q1ZjM0RYWERKaUpNclNMSDdRN0Y0S0F5bUpRSzN3RGVVZDNPZm1PQVNERDgr?=
 =?utf-8?B?K2R2TmhwYWpBRnh6UEs4akxGdStBMjFxa2RjUFZEMzhwSEtudVlaenBicUYx?=
 =?utf-8?B?TkdRRmV3SVpidDlFOEhmeFNESUhOMXhpWVh3RjhraEdyc3dCeWFCWERJbDRP?=
 =?utf-8?B?bmdUa1haY2J1aUZXbUxJWU9FUk1DcklKazBIK3h2YXA0YVNpaERWWUNhTTE1?=
 =?utf-8?B?WWFGVElXYWQxaFkwamN6MXZkdWl6VGJkZ01wUW1GYnArSUNZK2ZtaVNwWXFq?=
 =?utf-8?B?d0Z6LzZNbTFUdUVRTVo2VEphbGVZdkxGKzI4WGVvenc1NU50NHlTdE1SS1lX?=
 =?utf-8?B?NmdnUzcwM1lPeThFYytvc2ZSOTgxSDhnZVZ0NkNHajl4dHdXc2t4NlNQcE1P?=
 =?utf-8?B?TmhoSkQybEhHa05adzNxdUlwSHRaZ1k3UUUwSDRXZnhpU3FsU3dsZkZzSWlF?=
 =?utf-8?B?LzNrdkZEVVM1azZ0YXQrMkI2L1VEVmJ4V0lwaUZuSFhWT1JGNUpHZWUva296?=
 =?utf-8?B?QytHZ3Z6S0lQQTVNUWp5b0VwVlFLT1B2TkFqU240Q1VEdzQ1aEpDNVM4blBu?=
 =?utf-8?B?SkJLVVR3Wlp2dG1ZZVNiM3RramFBei9aYnpjVXBiclBLMlg3MFcwRHdJMmc4?=
 =?utf-8?B?SFA2ZStGOG1ON293M215cUtNMExldkoyTnNiLzF3b1AwUnBKU0F4REQ1NHNM?=
 =?utf-8?B?Q1JCV2ZzazluWEJHZHEwVEpzSFRoRG9XZzlUdjQwVktMVEhka3JSNm5HTVlj?=
 =?utf-8?B?djR0Q0RZTGNhbE5XVEdod1hQdVlmUUpqN1lKN3hFNU8rYlR4VUFWZzFsZmJK?=
 =?utf-8?B?V0NKaFhCdVlTSnhqVkIyRVBjeVhDTGs3cW1XZ0JmZjZXUk5ZOE9qRGJNK1Rh?=
 =?utf-8?B?aHJWc2ZXeGRMeHFsUWwwU3RDbmFYMW5ySVJMUldHdHhxdHBBcHVMdWlxcmZp?=
 =?utf-8?B?ZWpaNWhtWm5DUG04YkRrNGhBTHBBQVFYUVlUa01BcWh3cFY1dDVkTXcwbEZp?=
 =?utf-8?B?aUlROUhycnVvRHBkOHExZGlpRUw3QVFIc1lvSmdpRGxmS0VRbXAxYWFMaENH?=
 =?utf-8?B?K1hNVVhaMU5wejBYcHhhNGVpUDhiQUlRdTF4TWk3c2p5TWd2ZWRaY2xCMkRG?=
 =?utf-8?B?WThySTV3K0hBUi9JenI3dTJ2QjhWQlQ0VG5Pdnlxend1NWEzcHlVMElJMmM3?=
 =?utf-8?B?Y01rZ3RROWNDNkJwbDVxQ1NNRGU3clNVT2xzSE1uNnJia05zK0IyeWpTSG9R?=
 =?utf-8?B?YWROSXNzYnUvQ2VhWTZiV25WV3pzUDBXalZraStXMFJJbWFVeHJvbFNuT3lw?=
 =?utf-8?B?dmxuNDJNanFOK2l0MTNIQm1pRGNrWEp2WVJ1L1hleXNzYW5yRVpUdThsYlJl?=
 =?utf-8?B?ZXQ0RlpjYTRlSnBqbTNVWXZxR2I1NiszeFBoYWdneFJNMTlwdkY5NmEvWHRq?=
 =?utf-8?B?QTY3SnYxdjIva1lwK1NHZXo4Ny9BeXVwUFh0alpkUUFoTnlNbEdVN00xZXZ6?=
 =?utf-8?B?RE9adVNJUzdUWmV2MzcyY09xQnRwVVJoQURPMGxUdkpybDB0ZjlOa3pEYnYw?=
 =?utf-8?B?MFF2Ris0ZHhnd011OXE1clRJdVh6dkJ6NTQ3OXpqZEZsVlRhVmd4ajZQYlda?=
 =?utf-8?B?bWUraEpRUlRZd3FpT05sYkFFemtlOFY2alEyZHNpYVlWZ1ppTGhDM3BQbzh5?=
 =?utf-8?B?ZFdvQjQyZFJaWHIxZCtYV3VMYmxMRTNQMU8xSkxOV0dHYTBVNlJmN0xEd3Ir?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0/qUHag7TuhCl/xygiFG5jxKvi85tzSvI7WTyrsx3hyAkYGZd+JVQy7ux7uPXPjgzlPtx8dLKbrFs9t18S2h/1TNvn+5cJHzvL7P193JlUh3BybsXhAZT7pUvIn/n4M39FZJ8eO98BNqrJcy80OxTPrjaRt3pLthEtsy/Na9rWKXDuXnbbva9HyzhKB1J0QmJfBEMMoyaiPA8o3e7FJgvK5ap+mnAY0ftQ+fjImjea3IB4qjJIU6Mc9ImyxyXoFCEru7cLhh+Y3vDmP1tiZPN+yhY+zGqp4GInPxQpTwMImVUIcXfqzT7Ma9qJE4nNvA9NZoIsBU6KMlZZPmrqAnraSpRRccrng8fJR07vRYd6KFm7HrTNQGsVbttwXItMgImaBH2GF9epodfJIl6p0ewxjlBcxcjqVCD/Wl75U1H3iXL4S/Q2F9EyfSakyrhszj4GbYNDYlBlZ/WK0tfNTfa6jjY79jXyUQtKnsqLnTHKjqrSosAT3YOGYwhK65nhI/9xLJdJa5xVvcWzT2xxINHxBSnJid87keNLnp24clUKB/mMSSvpimy/Iq1bYrzTIs6rWLi0qoPtofH81tiLuGXRrhSrfUgBXShGKT55VfLW0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62d556f-92d2-48c8-eb09-08de0f1ac430
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2025 14:21:16.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRHWaPyOS+RW2IXWXGUr1Vq/7GQoueOXHtNVbiOFTq9gPHT0NpibRsB66pGMTV9QLlRT8JPHbU4kNh26WabU4p4/wYpAVdrI0Qfx0ZSbCAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6548
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510190103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX+kNQEMyEJ+85
 DwuJ+QDUCMAAWu6iGGgtdM/2AhZsTsMt92MTlDBeF3IzHDIPiiWAFIZGetFplf37qlCdYst3XaS
 R/fQXEQRqu3cCjKHIcU8eK2Ij56x5JGVNaMMxFIlDUHzHQ+fuPy6eI7XKeSPiP8AZJbNd9cubRk
 z0J6jY+Wd1PsCfyd6ypVGj5bw1kjo5KLiQWh4v0ftbw1INz9fpaioRDpiScuyWhJdMxFJb33Upx
 8x8AKUAFR9E3mps88N6jGVVNtMV59WId7thTpG7NHCFWaFZFqxsOCXsKQlC0B8GZawQltkxYl5C
 4W20WhdW+ydR0UZX/NdnTLMzmJiUFD2XqRRZJXwHgujbVeiBYYdSkMyCLW/ofSA4BUdAmRleuLu
 rqdJPkhVfLDP0gHdM2tWh5SugEPUDA==
X-Proofpoint-GUID: 2gUTt-dbhGg8hqw2uXIvS7lFLUheYSXZ
X-Authority-Analysis: v=2.4 cv=Db8aa/tW c=1 sm=1 tr=0 ts=68f4f423 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p-AZ_irS1pRGNWHL4FAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2gUTt-dbhGg8hqw2uXIvS7lFLUheYSXZ
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

Hi,

On a Lenovo 12TECTO1WW HW (BIOS M5HKT1DA), the i915 DRM driver triggers 
a DMC firmware assertion
when connecting or disconnecting an HDMI display. The GPU firmware (DMC) 
registers show incorrect
values, causing assert_dmc_loaded() to warn in intel_dmc.c.

This occurs on kernel 6.18-rc1 and appears related to DMC power and 
hotplug handling.

Kernel: 6.18.0-rc1

---

[  130.665424] audit: type=1326 audit(1760882657.655:78): auid=1001 
uid=1001 gid=1001 ses=3 
subj=snap.snapd-desktop-integration.snapd-desktop-integration pid=2408 
comm="snapd-desktop-i" 
exe="/snap/snapd-desktop-integration/315/usr/bin/snapd-desktop-integration" 
sig=0 arch=c000003e syscall=203 compat=0 ip=0x7e4ba6bc4531 code=0x50000
[  131.287051] nvme nvme0: using unchecked data buffer
intel_dmcintel_dmc[  218.492264] ------------[ cut here ]------------
[  218.492268] i915 0000:00:02.0: [drm] DMC 0 mmio[5]/0x8f03c incorrect 
(expected 0x30100, current 0x0)
[  218.492292] WARNING: CPU: 6 PID: 409 at 
drivers/gpu/drm/i915/display/intel_dmc.c:645 
assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.492455] Modules linked in: rfcomm ccm cmac algif_hash 
algif_skcipher af_alg xe snd_hda_codec_intelhdmi drm_gpuvm 
drm_gpusvm_helper snd_hda_codec_alc269 gpu_sched 
snd_hda_scodec_component drm_ttm_helper snd_hda_codec_realtek_lib 
drm_exec snd_hda_codec_generic drm_suballoc_helper 
intel_uncore_frequency intel_uncore_frequency_common i915 snd_hda_intel 
snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic 
soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common 
snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda 
snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp 
snd_sof iwlmvm snd_sof_utils snd_soc_acpi_intel_match bnep 
snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi 
soundwire_bus x86_pkg_temp_thermal snd_soc_sdca intel_powerclamp 
mac80211 crc8 snd_soc_avs snd_soc_hda_codec snd_hda_ext_core 
snd_hda_codec coretemp kvm_intel snd_hda_core snd_intel_dspcfg 
snd_intel_sdw_acpi snd_hwdep snd_soc_core kvm libarc4 snd_compress 
iwlwifi ac97_bus
[  218.492496]  snd_pcm_dmaengine snd_pcm snd_seq_midi 
snd_seq_midi_event snd_rawmidi binfmt_misc snd_seq cmdlinepart 
processor_thermal_device_pci btusb processor_thermal_device spi_nor 
snd_seq_device btmtk processor_thermal_wt_hint drm_buddy 
platform_temperature_control snd_timer btrtl irqbypass ttm 
processor_thermal_soc_slider polyval_clmulni nls_iso8859_1 
ghash_clmulni_intel platform_profile btbcm aesni_intel mei_hdcp 
think_lmi processor_thermal_rfim btintel mei_pxp rapl snd intel_rapl_msr 
processor_thermal_rapl cfg80211 bluetooth firmware_attributes_class 
input_leds drm_display_helper intel_cstate mtd mei_me joydev wmi_bmof 
intel_rapl_common soundcore cec ecdh_generic processor_thermal_wt_req 
ecc mei rc_core processor_thermal_power_floor intel_pmc_core 
i2c_algo_bit processor_thermal_mbox pmt_telemetry pmt_discovery 
pmt_class intel_pmc_ssram_telemetry int3400_thermal int3403_thermal 
intel_vsec acpi_thermal_rel int340x_thermal_zone acpi_pad acpi_tad 
mac_hid sch_fq_codel msr parport_pc ppdev lp parport efi_pstore
[  218.492543]  autofs4 btrfs blake2b_generic raid10 raid456 
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq 
raid1 raid0 hid_generic usbhid nvme i2c_i801 e1000e nvme_core hid 
i2c_mux nvme_keyring i2c_smbus ahci spi_intel_pci nvme_auth spi_intel 
libahci hkdf video wmi
[  218.492563] CPU: 6 UID: 0 PID: 409 Comm: kworker/u32:8 Not tainted 
6.18.0-rc1 #3 PREEMPT(voluntary)
[  218.492566] Hardware name: LENOVO 12TECTO1WW/3355, BIOS M5HKT1DA 
06/17/2025
[  218.492568] Workqueue: events_unbound 
intel_display_power_put_async_work [i915]
[  218.492706] RIP: 0010:assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.492840] Code: 55 a8 e8 52 2d 9c cf 44 8b 45 cc 8b 4d bc 45 89 e9 
48 89 c6 8b 45 c8 48 8b 55 a8 48 c7 c7 28 7e db c1 50 41 56 e8 9f 19 e4 
ce <0f> 0b 58 5a e9 92 fe ff ff 48 8b 17 eb c6 48 8b 3b 48 85 ff 74 04
[  218.492842] RSP: 0018:ffffd04682ff7c48 EFLAGS: 00010246
[  218.492844] RAX: 0000000000000000 RBX: ffff8ef885a22000 RCX: 
0000000000000000
[  218.492845] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
[  218.492846] RBP: ffffd04682ff7cb0 R08: 0000000000000000 R09: 
0000000000000000
[  218.492847] R10: 0000000000000000 R11: 0000000000000000 R12: 
0000000000000000
[  218.492848] R13: 000000000008f03c R14: 0000000000030100 R15: 
0000000000000005
[  218.492850] FS:  0000000000000000(0000) GS:ffff8efc32794000(0000) 
knlGS:0000000000000000
[  218.492851] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  218.492852] CR2: 000075deec01b098 CR3: 00000001fba40006 CR4: 
0000000000f72ef0
[  218.492854] PKRU: 55555554
[  218.492855] Call Trace:
[  218.492856]  <TASK>
[  218.492860]  assert_main_dmc_loaded+0x10/0x20 [i915]
[  218.492990]  skl_enable_dc6+0xad/0x230 [i915]
[  218.493113]  gen9_dc_off_power_well_disable+0xb8/0xd0 [i915]
[  218.493244]  intel_power_well_disable+0x67/0x80 [i915]
[  218.493394]  intel_power_well_put+0x4b/0xc0 [i915]
[  218.493523]  __intel_display_power_put_domain+0xc7/0x1d0 [i915]
[  218.493649]  release_async_put_domains+0x5b/0x90 [i915]
[  218.493774]  intel_display_power_put_async_work+0x6b/0x170 [i915]
[  218.493896]  process_one_work+0x1a1/0x3f0
[  218.493901]  worker_thread+0x2ba/0x3d0
[  218.493904]  kthread+0x107/0x220
[  218.493906]  ? __pfx_worker_thread+0x10/0x10
[  218.493908]  ? __pfx_kthread+0x10/0x10
[  218.493910]  ret_from_fork+0x202/0x230
[  218.493912]  ? __pfx_kthread+0x10/0x10
[  218.493914]  ret_from_fork_asm+0x1a/0x30
[  218.493918]  </TASK>
[  218.493919] ---[ end trace 0000000000000000 ]---
[  218.493921] ------------[ cut here ]------------
[  218.493921] i915 0000:00:02.0: [drm] DMC 0 mmio[6]/0x8f00c incorrect 
(expected 0x40b8408c, current 0x0)
[  218.493937] WARNING: CPU: 6 PID: 409 at 
drivers/gpu/drm/i915/display/intel_dmc.c:645 
assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.494063] Modules linked in: rfcomm ccm cmac algif_hash 
algif_skcipher af_alg xe snd_hda_codec_intelhdmi drm_gpuvm 
drm_gpusvm_helper snd_hda_codec_alc269 gpu_sched 
snd_hda_scodec_component drm_ttm_helper snd_hda_codec_realtek_lib 
drm_exec snd_hda_codec_generic drm_suballoc_helper 
intel_uncore_frequency intel_uncore_frequency_common i915 snd_hda_intel 
snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic 
soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common 
snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda 
snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp 
snd_sof iwlmvm snd_sof_utils snd_soc_acpi_intel_match bnep 
snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi 
soundwire_bus x86_pkg_temp_thermal snd_soc_sdca intel_powerclamp 
mac80211 crc8 snd_soc_avs snd_soc_hda_codec snd_hda_ext_core 
snd_hda_codec coretemp kvm_intel snd_hda_core snd_intel_dspcfg 
snd_intel_sdw_acpi snd_hwdep snd_soc_core kvm libarc4 snd_compress 
iwlwifi ac97_bus
[  218.494101]  snd_pcm_dmaengine snd_pcm snd_seq_midi 
snd_seq_midi_event snd_rawmidi binfmt_misc snd_seq cmdlinepart 
processor_thermal_device_pci btusb processor_thermal_device spi_nor 
snd_seq_device btmtk processor_thermal_wt_hint drm_buddy 
platform_temperature_control snd_timer btrtl irqbypass ttm 
processor_thermal_soc_slider polyval_clmulni nls_iso8859_1 
ghash_clmulni_intel platform_profile btbcm aesni_intel mei_hdcp 
think_lmi processor_thermal_rfim btintel mei_pxp rapl snd intel_rapl_msr 
processor_thermal_rapl cfg80211 bluetooth firmware_attributes_class 
input_leds drm_display_helper intel_cstate mtd mei_me joydev wmi_bmof 
intel_rapl_common soundcore cec ecdh_generic processor_thermal_wt_req 
ecc mei rc_core processor_thermal_power_floor intel_pmc_core 
i2c_algo_bit processor_thermal_mbox pmt_telemetry pmt_discovery 
pmt_class intel_pmc_ssram_telemetry int3400_thermal int3403_thermal 
intel_vsec acpi_thermal_rel int340x_thermal_zone acpi_pad acpi_tad 
mac_hid sch_fq_codel msr parport_pc ppdev lp parport efi_pstore
[  218.494145]  autofs4 btrfs blake2b_generic raid10 raid456 
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq 
raid1 raid0 hid_generic usbhid nvme i2c_i801 e1000e nvme_core hid 
i2c_mux nvme_keyring i2c_smbus ahci spi_intel_pci nvme_auth spi_intel 
libahci hkdf video wmi
[  218.494165] CPU: 6 UID: 0 PID: 409 Comm: kworker/u32:8 Tainted: G 
    W           6.18.0-rc1 #3 PREEMPT(voluntary)
[  218.494168] Tainted: [W]=WARN
[  218.494169] Hardware name: LENOVO 12TECTO1WW/3355, BIOS M5HKT1DA 
06/17/2025
[  218.494170] Workqueue: events_unbound 
intel_display_power_put_async_work [i915]
[  218.494309] RIP: 0010:assert_dmc_loaded+0x2c1/0x420 [i915]
[  218.494435] Code: 55 a8 e8 52 2d 9c cf 44 8b 45 cc 8b 4d bc 45 89 e9 
48 89 c6 8b 45 c8 48 8b 55 a8 48 c7 c7 28 7e db c1 50 41 56 e8 9f 19 e4 
ce <0f> 0b 58 5a e9 92 fe ff ff 48 8b 17 eb c6 48 8b 3b 48 85 ff 74 04
[  218.494437] RSP: 0018:ffffd04682ff7c48 EFLAGS: 00010246
[  218.494439] RAX: 0000000000000000 RBX: ffff8ef885a22000 RCX: 
0000000000000000
[  218.494440] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
[  218.494441] RBP: ffffd04682ff7cb0 R08: 0000000000000000 R09: 
0000000000000000
[  218.494442] R10: 0000000000000000 R11: 0000000000000000 R12: 
0000000000000000
[  218.494443] R13: 000000000008f00c R14: 0000000040b8408c R15: 
0000000000000006
[  218.494444] FS:  0000000000000000(0000) GS:ffff8efc32794000(0000) 
knlGS:0000000000000000
[  218.494446] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  218.494447] CR2: 000075deec01b098 CR3: 00000001fba40006 CR4: 
0000000000f72ef0
[  218.494448] PKRU: 55555554
[  218.494449] Call Trace:
[  218.494450]  <TASK>
[  218.494452]  assert_main_dmc_loaded+0x10/0x20 [i915]
[  218.494572]  skl_enable_dc6+0xad/0x230 [i915]
[  218.494667]  gen9_dc_off_power_well_disable+0xb8/0xd0 [i915]
[  218.494757]  intel_power_well_disable+0x67/0x80 [i915]
[  218.494845]  intel_power_well_put+0x4b/0xc0 [i915]
[  218.494930]  __intel_display_power_put_domain+0xc7/0x1d0 [i915]
[  218.495015]  release_async_put_domains+0x5b/0x90 [i915]
[  218.495099]  intel_display_power_put_async_work+0x6b/0x170 [i915]
[  218.495181]  process_one_work+0x1a1/0x3f0
[  218.495184]  worker_thread+0x2ba/0x3d0
[  218.495185]  kthread+0x107/0x220
[  218.495187]  ? __pfx_worker_thread+0x10/0x10
[  218.495189]  ? __pfx_kthread+0x10/0x10
[  218.495190]  ret_from_fork+0x202/0x230
[  218.495191]  ? __pfx_kthread+0x10/0x10
[  218.495192]  ret_from_fork_asm+0x1a/0x30
[  218.495195]  </TASK>
[  218.495195] ---[ end trace 0000000000000000 ]---


Thanks,
Alok
