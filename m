Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B222A2F651
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2610E5D6;
	Mon, 10 Feb 2025 18:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="nDUijihn";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rXCBFfK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5660610E099
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:08:21 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A7tbVl026392;
 Mon, 10 Feb 2025 15:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=7gBwuTq/z0iQ1lA0SiT+14ylDlCDTx39utVkGPga864=; b=
 nDUijihnGUV12mgbtQ4IVXx5M8E5HnWRy8mDXhh44nDmxYwzY3bhOslBsLq06SmF
 zgcNVg6sMaf0dmNV1OUXTDS0I3uQVqvuWVSoSnYrbtaR1QHoPZahlCFm8C5RDpVe
 XVjl8w6ZWKoeLdcxe8uBvGbq0ZCnhtPjHpd1OZxmf8Qwg39E6ku+UkxjmPtCYXjJ
 5JrBM54On0TTO84bi0D7nJo8rYhuhvq6qpCYmBq+bcebXhFe9r+/rrZBD36DTBg7
 ZI4mH547r8c0SYBF6hqPyol4OTDur7MLtO8d/6YKHsFX6lYcV7+fDPF8B9LRM+is
 4BP68OxMpvBGpSbaInn4Dw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0t433rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Feb 2025 15:08:13 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 51AEg56T009739; Mon, 10 Feb 2025 15:08:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44nwqdrvp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Feb 2025 15:08:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZHy5jcYp/aiOZoMVid6O+hZZhPxglb5LuGwrHmN9GXvENw+ErWani0pAVOFPawnKBpPEGDwrEs46kBqO7zwFA9o7KsH1rWKiiofHxnHVblo/THupDDo5GVZWObMnRUhlCwfdC/pKy8LH2GBMkoo0GVJxh6yRSgeVdQCAYNYJohvT6Xd8EqAf4Iet5WdC9zH8BQ95f8lZX3foL+VFtT4K78dk/IAxTc0/ZrQJLIxAejJayHS4f2ienRy1js7g6QoqJGv76zTVk7Ow6g4f5wryww0NoqH0JeuTXyeJeoXBn6U5H8bPuy3QurY0SR+/wJndVrpBtU9AWm18QJtMwhEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gBwuTq/z0iQ1lA0SiT+14ylDlCDTx39utVkGPga864=;
 b=snoQAFKTh73na8uMsduDUZVzbIvPEc+1ilyrG6wCFUzj8jhGRawBiX4fN4CVa+rt2Xk98UiGX3b6NGzmbXeShJuxrqIn+82Aygxk+1zg26yFn/rZ4awQS/16hKBWIz0sXp0UWqGIO17f/qnRLfW083Tf6yO0HbX3gcywITElqv4Wd36UXayjORSdGibVQm+VKJAjSf+3JjiZx8wqYCz2UgZ3L6TXDUl0iw3K3Sa+7qbrUGz5SY3CU/EzdRUrQml3kBSEURoPS+ba32Ro6XPbcE7seIvKPVC9X0rRoO51V+JhXTqtBFUOcMvJFfA/++HbmM0pcl5Y/8mOZYAeuyZb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gBwuTq/z0iQ1lA0SiT+14ylDlCDTx39utVkGPga864=;
 b=rXCBFfK3LcNSj8ti0liQWGWcW/V4KbRWvr3J8RPPv/JMSekgXTouCeaPKJz1Roxx9TS3amPrTuQm9kGUIoo/CSGf6lmRTKwAK0YDOVgNCORwnDpmIXhgqNlaE9GZrZ//kxl3y34WYFqnqhbtjjJo7T6ksdR77NYAB4MvfjvOTEs=
Received: from BLAPR10MB5217.namprd10.prod.outlook.com (2603:10b6:208:327::10)
 by DM6PR10MB4348.namprd10.prod.outlook.com (2603:10b6:5:21e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 15:08:08 +0000
Received: from BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be]) by BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 15:08:08 +0000
Message-ID: <edf0e21a-db9f-42a8-ae0f-76a9d93713fb@oracle.com>
Date: Mon, 10 Feb 2025 10:08:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
To: Michael Kelley <mhklinux@outlook.com>,
 "mhkelley58@gmail.com" <mhkelley58@gmail.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41572155B6D139C499814EB7D4F12@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: thomas.tai@oracle.com
In-Reply-To: <SN6PR02MB41572155B6D139C499814EB7D4F12@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0032.prod.exchangelabs.com
 (2603:10b6:207:18::45) To BLAPR10MB5217.namprd10.prod.outlook.com
 (2603:10b6:208:327::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5217:EE_|DM6PR10MB4348:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce2bc3c-1bc9-4365-39bf-08dd49e4ba7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWg2cTVqUTIyNXFUb3h0Y0t2bTloY3J0UDhSMHpNcXZmM2Foc2tsVGFueW4r?=
 =?utf-8?B?bEpGVVMwOGVqNGZoZkIvYXNjbXA1eVJ5UWhVRng1Y1hzdlgyTStpcFRlMnFE?=
 =?utf-8?B?T0JoWSt5Y296TUhlYXBqK01CMmVOaWE5djhUTHlHaDRhQjlhWEpzMDN0V2lx?=
 =?utf-8?B?Z1g4REQveHcyTlhUdHJ2c2FPM0JmYTJSVHFmRGV2UnZxL2xETHdKcjhldUxD?=
 =?utf-8?B?RExqWWVzMnh4K0FxaGFJQXIrNldDeFUyVHlxUExWL0VDUisxOGVmc2ZFdjFD?=
 =?utf-8?B?WE02VlBnLzVlTSs4YnQ2WXBBRndlekh5cHpKZTI4aytabVIvb0Q5ODhJdVd1?=
 =?utf-8?B?RGh2aTdIeGdxREd5M09iUHdlZGhEQzNQTy91V0NtNThVT3ZiOUxaRnlvTzNp?=
 =?utf-8?B?WVVaZ01BNEY1Sk05RkJ5M2ZHS3lJc29iV3drUVZBVGlrWmRQUWJLOUZGNzVl?=
 =?utf-8?B?bGtpNnh3OURRZzEwYnRqR3hpc1RzckM4NllVSDBFNmEvUTNaMVYzYmhDRXhl?=
 =?utf-8?B?K1k2YWQzQ1l2RTd6anNhTVkvWnNHNU1EM0xJNXNvQ1JrT2tWK3JiQTBRQ3Jt?=
 =?utf-8?B?bi9iSHlkUTRRU3o4OXJiOEQxd1dHWjdtMllSR0UwWXdCajM0TWRhRW1IeVQy?=
 =?utf-8?B?SjAyeVNqRGo2eTc4UjNNdFlYeWUxMko5ai9jYzZiVmFxa0lSZ2liY1B0SVhn?=
 =?utf-8?B?eS9yVklnUWRvZnNBeFE3eHZCN0dxcEI5YzJSYkJnQmlVR3F5ckdtbEhZQytQ?=
 =?utf-8?B?MG05dDYzMXdYUVJuSWlzUmw0U2xiTE1KT2ZaNitzMFluKzVCU0h5MjJub3FT?=
 =?utf-8?B?cVh4ckM5OUpUYzBEbDVNdmZDbnhqTFVYdW5YVlJxMXkwRy9GSjVkTFd5MEVK?=
 =?utf-8?B?SkdPVlcwWmFUMk5ZdFdwQUtkVzVxSEgzNDd4WG40V1hvaHA1bkQzRDA1b08x?=
 =?utf-8?B?RFVDQnlWT2NsRU82ZnpXTDAxSUtsbzh5aWhPaDJaajBGdFdQbFR3dUkzcGk0?=
 =?utf-8?B?bVNCbUZzTDEvSm15OWV2dTN3cTNsQ3dYMCtJQ1pnbC9nTkxNMFFoU0pXYVhX?=
 =?utf-8?B?RlF1MEJjdk1Da2tlOUNkcGJwZXVDcTVBNEFJYzRLUkkwQk5XQ3JLdHFKYVRY?=
 =?utf-8?B?bFlYd1B1N3FCQ05ZMklaemFPcDQwQ1lRYXdJRU1LTUl2YVVNUUdra0xna1k1?=
 =?utf-8?B?NVpYN3BNV2ZlOHM1T0prcVJ4RFNYQlkxZjBvWDg1dGJNTTlVOGNQYUJVYXNj?=
 =?utf-8?B?L1M5YW9maU1NUGhnUEVOR2ttUmRLcjRmOGc2dzZYVlNIeTkzMUZlT0pKTVlz?=
 =?utf-8?B?MTYwKzFDTE40eHlmRHY3U3pZaWl0aERBWTU0SlVvbU80MVFkWGk1R2hLdmM0?=
 =?utf-8?B?aTdOeXAvVSsybmFDUVVjbC9TVjVOdzNSQUJ2YmNvekNqaWZCUWZPamhFZ1dO?=
 =?utf-8?B?NzhlbG5JYjNNb0NnSFdCS1M4MHRLU0FaNE9WM0dTbEZoWVN1M3IxSVlGN3A3?=
 =?utf-8?B?d1pEa0F6N2NjWVQ2TlJCS2FxVU9YUVZodm90QWFNSUh5SVpUbzhsdGppM29j?=
 =?utf-8?B?My9rWHdsT3J6SCsvS1BDbCtCYnpiRmtwUkpQYU9paURFMWVOS2I3SXpIYUs0?=
 =?utf-8?B?Zi9OZk55eGRQN3hRV2Y4WjY1L0ZuTkhiMFZuU21ZM1RuNXlLdkpYNFJOQXlO?=
 =?utf-8?B?K1Y1VENGcEFUR0hiUUIrQ3RocGZlWnM5d2tmNlRjRmNjam5jNnJkRFg4UEtu?=
 =?utf-8?B?V3ptV0F5UmpnMU5uZ2JuQVpDZ3dQckFBZEdoUjdlOEVRTmM2bVRnRkh2eHNZ?=
 =?utf-8?B?bnBhNHJzZnFTSjNST3Q4bmd4SXpPVUUwM21GTlNTaHpsODFxTkdTenp2ei94?=
 =?utf-8?B?ak5hNUFReXFvZmpvKzZxZDF4Nm85dHZJY2ZpaXBXNEVGelVxSUxpaXpwMVdB?=
 =?utf-8?Q?rGO2xYMIREE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5217.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2djUXBYTWVNYmFOWG1xSmRBZUU1cWhlS2hFTXpjZkJFTjFZZUZGVzlsb01T?=
 =?utf-8?B?OGRlMDdsQkRoUTRyT3ozenNaZ2pDZ1BET2tTQmFIajRoYjlMZzdic0VRajJI?=
 =?utf-8?B?UVhyZkUyNXUxMWdLbXhFSXI2TlkzVHpGZkloY05OT1p0N092L3VZVVQyMTZO?=
 =?utf-8?B?blFBdS9PN0d3WEhraEpXR1F3bjU1N0N2OHFXWDlzMXp3ZnNFWldka0p2eFgx?=
 =?utf-8?B?ZlF6WTcvR0xJeGNZRzF3bGtLdFZpZ1lwUHNLRTlWdlRXU0RkUzVWS3JCV2gz?=
 =?utf-8?B?UEQ5cU0yNWtYL09wWmREUTNmTGZma2QrbkJTUHIrSVdFSnBCQ011dk90akRT?=
 =?utf-8?B?ZFRiRERESzBzRlVBSXpGQ0dHcCs3TzR6a1NBVmNkL3RQdHcycFBwQVp1L2RS?=
 =?utf-8?B?WCsxN1FvQTFhdE1CSVppZUttaVplZWZ1dnVIMm96akQwWWdSL250czNmL3Zn?=
 =?utf-8?B?MTlUVGRjVHlkMzcxbzBRY29qVEZHWjg5S0t2a0wyREZjMlFrcDk4QTNPRnpx?=
 =?utf-8?B?OHRYM0RLYXkxUUQwTmhyV2hKOWNKazZLTVB1UEtjSnFWencxSmZUNU9Fc0ww?=
 =?utf-8?B?SjA4RXRudTZnTnE2TUFTM2RXNmpvRzdZOXZlNXBTSVZwa24xWHFLYjl3ZFh2?=
 =?utf-8?B?YXp2Tjk3bzR3VTVFdjk4aDJRNHlZZFZGRUxoU3hWWWVNVzZYcnd0UlhDMHNy?=
 =?utf-8?B?UGNncXc2WmhEdWJrUUFNbGNqMDFXSkZIYnU2UHFWWXpJWXBlakRrSTJQMS9O?=
 =?utf-8?B?VFJYVFFIQk83K0kyVEVpRnN5MEIyZkc2VG9nRmlJUHVQMzVNUUFudElIRDRV?=
 =?utf-8?B?SzVoWHRQOVFyQ0hYR1UxRTcxbTdxM08yYndTZ050dE5jSGdKbzg1OGJ6ZUM1?=
 =?utf-8?B?cWpwR1FoNEx4Y0NmQjVGSllGRElNcHEwelZDSWpQTmxsMkluL29va2M4N1Vv?=
 =?utf-8?B?SXhEZ3Q2UjRWNjdCdE1vQVZHTENTcVNsSDllK3R1a1c0cXNRS1F2UjA1UjBW?=
 =?utf-8?B?MFF6eXU3bmI1ZzJsSmhCcGwxeEVTZzVmZGcvNTl0NEl6Y3F5cDlzYXp2cU1t?=
 =?utf-8?B?SEhwZVpvWjNvZEovK09SRFpjZk1QZ2tFZ0VGZnpMamE2UlZhWDY3UkJ3czVp?=
 =?utf-8?B?cHJJaDAwWWY4SW03Zk5WYkV0L2pBaXVBMEF0WW5QS2lZVUNJUnZOUzQraGE2?=
 =?utf-8?B?WkFlcDF4S25lKys3YzE1SXRtYjFFM2JsM29sRmprSUNyM1EvblZObXZMM21V?=
 =?utf-8?B?b0RnVmpFZDhJYVI2aU93cldFWVpJc1RkNHFPL2tXanBKZ2srbUx0amNPcTk5?=
 =?utf-8?B?MDVoZVo4UmhpTGRZUThtWHdqbmdGbWpLTFNzWVhhL2w2OFRXVXc4djZCWWlT?=
 =?utf-8?B?eWxtNWpJR2hlNjBBOWkwRUlUa0V1dXE4RFozbzR2dUVpMFNwUUFmdHl0dXo5?=
 =?utf-8?B?VVpiUkFaN3JoUEE4cWdtekRZZzdXQ0VvcUNvc0NHNjJLYnpNdXRwNE9PbkxV?=
 =?utf-8?B?Vk1HQnJlK2FZMFFsa3FrcWhMR2doTlovKzlHZTdVRzFRYTQ2QVpBNFZSR2Vi?=
 =?utf-8?B?TE10bFd2RURydmpFb1c2K1JuZDJoNEh5K2kvN3hjNldFdDJDeGoxUXlIMDlT?=
 =?utf-8?B?dTBCL21TdE5DdTFTd2JNSW41ZTh4S0drRkttNjdHaThEZlZJQ3RDb2JPUkp5?=
 =?utf-8?B?U3VoWXQxTkdDWk55Y1pqWDZYb3FtSytueXpjYXBxTVJsVStDZ3VrR3kzbDQz?=
 =?utf-8?B?QmJ5cHVXUXRlZHpmNkNsU2NmNzd3RWFscFMvVERlc0UwVElSeTZCM01ZZzMr?=
 =?utf-8?B?R3lNTHFZVkxXTW9rQjFRUDB0RU4xWG1ma0dEWUZXRjBYYmRPYlJmOXJnTFF5?=
 =?utf-8?B?VVpxY2o3L1pnQU8vQ1lydUxGaGZucGc5NHM2OXoxcGdoQW1pbGRJUVd1UmFq?=
 =?utf-8?B?c3BId0pzSWRHTjNrbFJ0OUFLREJvTVBCRTlDcDFCTVNrclJzK3liSTRkNkE0?=
 =?utf-8?B?a0RmZ0hyVGR3SFBpcldMUjhTekJualowMUM3TkorRWxtWnRhejVvQ2l1SXI1?=
 =?utf-8?B?RUp5MU1xdGMyem1Hb3ZFNUtSODgreHNhS3diSVZVbW5UbGw4enlneXNpUHJT?=
 =?utf-8?Q?MO8j7JN0RXPewCdU3rEmWVbL7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +7LyYJRoSpaigvkBLM0jGqm2hL38zu7DvoYv+D1SxhZLyZKOqPg30FRt3/7pFT9q5npPb7KnCSpay4V2rY1CA/d4q1P+AdlOaxwNAZ3alJGfBgq2D+AINlqBysDxJg4E88Jzhs0yVu7JWP+mVJr/UAX3ZFCTe86sMzFYDLRHX39jWYBvCJmjqWd1y6T3x9r+9QJvpLnwmAOi3mSSh6pyBwZQuAy17gaX7fv+qRq6lg8OrtuvJVmg9oR39brOiVfA3I90bfBEZauBNr54l5SUrKYkeIDXumGns9HgrH67r267SCII8K+QN8KEYBqrtEmtpIJm3i9VtzGPBT/Eu1XnYFbHXzYxULoAgBzVCM8UiOgwyTH+54kPdoHgv8cX9Bv/S64KeuSiwd+cPgx2HEWUmcJ7ZCIlhbs745euN+5aTNswnszqKdqnx4xsZM2/Y3vwEMGksbRinOAH16vuLJMsQdliDjXj3wcLG9EETKGEwSq3NvjZHxjHnjPlPVdwlYoznVoMSEFuqm8PhirC1yjkAXcuj97PHsLyGj6++akhxaC4g/jPT3zKXkL4tbWRM4p3ah77ibkJRmr9F6dnid+EOH+zmZBU/DylCEndr6lnuuE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce2bc3c-1bc9-4365-39bf-08dd49e4ba7a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5217.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 15:08:08.7480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuPXQ63mdAqgg3kSn9ik+0OQC937LN7x6qhHeROFoGEpJU2OA3uY0Xq1huFjH2+noHNcpO9d7dzxiVcRGx7ICA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4348
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502100125
X-Proofpoint-ORIG-GUID: RaGMHbpa-_cgv20zdrR3j_ZRuJgAJNCX
X-Proofpoint-GUID: RaGMHbpa-_cgv20zdrR3j_ZRuJgAJNCX
X-Mailman-Approved-At: Mon, 10 Feb 2025 18:03:28 +0000
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

<snip>

>> Then the question is why the efifb driver doesn't work in the kdump
>> kernel. Actually, it *does* work in many cases. I built the 6.13.0 kernel
>> on the Oracle Linux 9.4 system, and transferred the kernel image binary
>> and module binaries to an Ubuntu 20.04 VM in Azure. In that VM, the
>> efifb driver is loaded as part of the kdump kernel, and it doesn't cause
>> any problems. But there's an interesting difference. In the Oracle Linux
>> 9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on
>> the Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This
>> difference is due to differences in how the screen_info variable gets
>> setup in the two VMs.
>>
>> When the normal kernel starts in a freshly booted VM, Hyper-V provides
>> the EFI framebuffer at 0x40000000, and it works. But after the Hyper-V
>> FB driver or Hyper-V DRM driver has initialized, Linux has picked a
>> different MMIO address range and told Hyper-V to use the new
>> address range (which often starts at 0x40900000). A kexec does *not*
>> reset Hyper-V's transition to the new range, so when the efifb driver
>> tries to use the framebuffer at 0x40000000, the accesses trap to
>> Hyper-V and probably fail or timeout (I'm not sure of the details). After
>> the guest does some number of these bad references, Hyper-V considers
>> itself to be under attack from an ill-behaving guest, and throttles the
>> guest so that it doesn't run for a few seconds. The throttling repeats,
>> and results in extremely slow running in the kdump kernel.
>>
>> Somehow in the Ubuntu 20.04 VM, the location of the frame buffer
>> as stored in screen_info.lfb_base gets updated to be 0x40900000. I
>> haven't fully debugged how that happens. But with that update, the
>> efifb driver is using the updated framebuffer address and it works. On
>> the Oracle Linux 9.4 system, that update doesn't appear to happen,
>> and the problem occurs.
>>
>> This in an interim update on the problem. I'm still investigating how
>> screen_info.lfb_base is set in the kdump kernel, and why it is different
>> in the Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is
>> well understood, we can contemplate how to fix the problem. Undoing
>> the revert that is commit 2bebc3cd4870 doesn't seem like the solution
>> since the original code there was reported to cause many other issues.
>> The solution focus will likely be on how to ensure the kdump kernel gets
>> the correct framebuffer address so the efifb driver works, since the
>> framebuffer address changing is a quirk of Hyper-V behavior.
>>
>> If anyone else has insight into what's going on here, please chime in.
>> What I've learned so far is still somewhat tentative.
>>
> Here's what is happening. On Ubuntu 20.04, the kdump image is
> loaded into crash memory using the kexec command. Ubuntu 20.04
> has kexec from the kexec-tools package version 2.0.18-1ubuntu1.1,
> and per the kexec man page, it defaults to using the older kexec_load()
> system call. When using kexec_load(), the contents to be loaded into
> crash memory is constructed in user space by the kexec command.
> The kexec command gets the "screen_info" settings, including the
> physical address of the frame buffer, via the FBIOGET_FSCREENINFO
> ioctl against /dev/fb0. The Hyper-V FB or DRM driver registers itself
> with the fbdev subsystem so that it is /dev/fb0, and the ioctl returns
> the updated framebuffer address. So the efifb driver loads and runs
> correctly.
>
> On Oracle Linux 9.4, the kdump image is also loaded with the
> kexec command, but from kexec-tools package version
> kexec-tools-2.0.28-1.0.10.el9_5.x86_64, which is slightly later than
> the version on Ubuntu 20.04. This newer kexec defaults to using the
> newer kexec_file_load() system call. This system call gets the
> framebuffer address from the screen_info variable in the kernel, which
> has not been updated to reflect the new framebuffer address. Hence
> in the kdump kernel, the efifb driver uses the old framebuffer address,
> and hence the problem.
>
> To further complicate matters, the kexec on Oracle Linux 9.4 seems to
> have a bug when the -c option forces the use of kexec_load() instead
> of kexec_file_load(). As an experiment, I modified the kdumpctl shell
> script to add the "-c" option to kexec, but in that case the value "0x0"
> is passed as the framebuffer address, which is wrong. Furthermore,
> the " screen_info.orig_video_isVGA" value (which I mentioned earlier
> in connection with commit 2bebc3cd4870) is also set to 0, so the
> kdump kernel no longer thinks it has an EFI framebuffer. Hence the
> efifb driver isn't loaded, and the kdump works, though for the wrong
> reasons. If kexec 2.0.18 from Ubuntu is copied onto the Oracle Linux 9.4
> VM, then kdump works as expected, with the efifb driver being loaded
> and using the correct framebuffer address. So something is going wrong
> with kexec 2.0.28 in how it sets up the screen_info when the -c option
> is used. I'll leave the debugging of the kexec bug to someone else.
Hi Michael,

Do you think we need to handle Azure Gen2 VM differently in the kexec?

Or should we change the kexec_file_load() system call to

retrieve the correct framebuffer address?


Thank you,
Thomas
> I'm still thinking about alternatives to fix this mess. Please chime
> in if you have suggestions.
>
> Michael
