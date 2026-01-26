Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOkrNC5xd2mqggEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:50:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA9289186
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354110E43F;
	Mon, 26 Jan 2026 13:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="qjsXMqCa";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CIvrON+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711D310E430
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 13:50:33 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q2ZWO0584839; Mon, 26 Jan 2026 13:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=ar65KoNmY83AyuY2o8
 vtvxgQNn2tj/xINPAA9UcK06k=; b=qjsXMqCakD8/zf2ZMgyt4vNGZMStgsDzzO
 x6i1nMMzfLYDXE4xmZdCZw7jGboOxdkF69bN8AQ4yixUP/ZOMIAg4lB4TyEKj+z6
 enZz92aRZj1NNchu/FgEFJQA51iFnpMypXqdqAS8CiZJ0MZeWq00f5Ol82RjFOal
 JMB2J+ngvy3iA0Y1dlDX5lUTnBfCUQjpEeiQGri1Mqf0hxF+7mNiq+auPtCAjyFv
 LqQVLYDRMqeWmcsmxokioMasgTgN7GK1Gi9EgfHlbL2N4wwOKhGQv03r29pdp65v
 HhvoC05S7VD1lxbNeOccPoBsAW2m6u0voET7yL9ZcnhWuGsA/LnA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmv2sv64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jan 2026 13:50:28 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 60QCW4wf036088; Mon, 26 Jan 2026 13:50:27 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4bvmhm7bmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jan 2026 13:50:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxaSh019pWnVNZaEFJ0hEXvZ/IzVISAsyPBmCX1Vooyj7LDjtXF7BaFM8loU9fsYu/kf3JxVa8qE8LEPN5h71VNAVBzaBydKWpgcfCwcqx3OrSNfGV0M2llbyGXUrEX5sYM9ugvSKn5RZov31Pe98yZIdccBXnKaFmFOjcBxPQWfN4MuYgnVRPZcuKBA0p0s/KyLg+vMvQXZwllKYd0x6o3TXFVOM5MvEf5zAEZXdsLqW3dqzSX4I990yQ2YeKVx9lsmz42RdspnVK2+y2wS74EWs/gnFB8r6D6w4WAtJtcAjjVqNKAIOKtk2pWAguCUCs+RrJyYQsxJWAyAlD/xYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar65KoNmY83AyuY2o8vtvxgQNn2tj/xINPAA9UcK06k=;
 b=gy6GG/rQCvcSOHW5blYaPftatnZjVb/OeMng5Fih0sj0isrUAhAKOs94B2PPkUq1Y0E/dCkj0wBatwrR6BGr4/NS6HbtTTTmd8PHuT8iiMrtAavr6KYRxXHP1Y2XqWa6n67O5Ofei88+SV5LahgdR3O75xfsphJOm2gHOqkpjUZAUzVWUMTT7dFaUnXKz547T9pBpAjU+nl9/dibEnXvAg2zmt8nkx+7Tv/lfeJyU1/yW0ZHGoHyKNx030bKs3xppFJYhyrnDF9armmWp2tBFLaPDBgt2uBcY4BxN0swU+bpDoI0YmuZ4qQqnWt/1AYJwktvWccwi12Rml2Vun9WUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar65KoNmY83AyuY2o8vtvxgQNn2tj/xINPAA9UcK06k=;
 b=CIvrON+IAroOExDW2o1xm/FM4Z2EmUZeV6zOi0pxjo+LcjCmN8xJgYmTRpNChEazRiLcZZr+yIhAB6wQ5W0dM4J19ONVYSJHymqp4SvSePF9drpD42LqU3K4rtQ3WJXubwZX8iKBYSMCEkZhsp9AgoGnTPx7TTfGrjO3jQAxAOw=
Received: from DS3PR10MB997700.namprd10.prod.outlook.com (2603:10b6:8:347::19)
 by SA1PR10MB7683.namprd10.prod.outlook.com (2603:10b6:806:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 13:50:15 +0000
Received: from DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a]) by DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:50:20 +0000
Content-Type: multipart/mixed; boundary="------------V2zheg0WWtioRTaAiSzxveBT"
Message-ID: <3def6af0-0e65-44e1-ab17-8bbf18d952f1@oracle.com>
Date: Mon, 26 Jan 2026 19:20:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Do not allow userspace to trigger kernel warnings
 in drm_gem_change_handle_ioctl()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Zhi Wang <wangzhi@stu.xidian.edu.cn>,
 David Francis <David.Francis@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
References: <9bde8c39-ba4c-49c5-a0bc-4e78338f055a@amd.com>
 <20260123141540.76540-1-tvrtko.ursulin@igalia.com>
 <0286a6fa-d767-41d3-8c61-c0b34e9a9b47@oracle.com>
 <1db24d1e-113e-4bbf-8785-b608f725afb5@igalia.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <1db24d1e-113e-4bbf-8785-b608f725afb5@igalia.com>
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To DS3PR10MB997700.namprd10.prod.outlook.com
 (2603:10b6:8:347::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR10MB997700:EE_|SA1PR10MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 9296fb66-81a3-48d5-0705-08de5ce1d8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4013099003|4053099003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2E0YmdkVWN2YWVyM0Q4YmM3V0lSTWNWdGVkeEtNeEhoTVQvKzl2eDNRei9T?=
 =?utf-8?B?cXNoMG54WSsxV2U1WStORDZQQ1l2bDd1M2ZiOExTUmpXSGg3WUZMSUpIalI1?=
 =?utf-8?B?em0zT2hpMk5JVWQ4VThCdTRVTlNMR1BZQ2pKNm5OY0hDb1Nwekp2akJGU290?=
 =?utf-8?B?QTQvZmNZVzNmMXhkdjlhNlFkc3JvYTdGUGtkV3gxUHdUUHpQVFo3UFRiSitR?=
 =?utf-8?B?UUFuWDlhUG51K3BvditvekVZb2xldmEzdXZMdzdIbEFPK1cvRXdHcHAxUmNZ?=
 =?utf-8?B?ZXJhYllCTUwrcEFPT3hGZzlWLzY1OTRmVW5rVUo3ZVRlY3BXY2c0THNrMHR4?=
 =?utf-8?B?WEkvOHJ2bjUwdnNXdTlDZ1dCYzM1OGNjMGs4T2NER0RnbVByTTBveTFVRGNK?=
 =?utf-8?B?V21Gb3graUtwUmNIV3NtQW9SRGNKemV3dURUUFh3MUE3NDcxbXZrZ3pORjV5?=
 =?utf-8?B?SUJyUnR1bi8rVFVtWEFGVy9YUlNGSHY5TURTaTRPREd1SGVQTHlHd1RrZ3h2?=
 =?utf-8?B?bjhYTVRCdmJ2MXBzNjBaTkM1VFlPRVZWRTJ0eWJQYjdTRFNJRWxhQmQzY2gx?=
 =?utf-8?B?WVFjdmNCeFlPR1RlRGhsUTk3RXpDbkl0ZzUyMzdjVXJ1U3hDRXdkZk84ZGZQ?=
 =?utf-8?B?eWhSam9qeGNzUStRakJvVTNVbk5yWHNHN044ak90YnBqT2c1USsyUEVNbGZV?=
 =?utf-8?B?RUdZNExUTHJBdmQ0dnAyL0s5aHd3REJxTEtJM3BXNkd3UTNoTWNUWGxNbk9Z?=
 =?utf-8?B?VDN3ZFJXWmk5ZmNFV1p1WUExQk1iRW1nN001YkFRbUJrQmJXbGl5akgxWEwr?=
 =?utf-8?B?UUxacmJBaEMrZk5EQTltZmNaRUZUTm9QUEllNm9HOWJ5aFJiLzZ0UW9nc2wz?=
 =?utf-8?B?ZmdjNWhDZVlIb1JybTVxZyttZ2NjU0lzcmNjdnp4eHh0WGxEUHdlcGl2Z05T?=
 =?utf-8?B?blNabHREbVNRaTJLcXAyZ2VpMm90MWJHRkh3aDYrc3JjOWRFZnkwWTZZQkwv?=
 =?utf-8?B?YTZJeE8yRTl2cjV6allvSDRXZGJKWWRHaW9ybFJXNDNPcGNxb1BENDJ5L3Mv?=
 =?utf-8?B?VTZCYUxvdU9GeVdQUkk5YWs5dmVnZEZjdWc5NzdJVXJRNnhISVdqMzJtb1p0?=
 =?utf-8?B?M284VDBCSnluZzVqOHNuSHB3U2hzamNMV1hMRWRXKzdJUmVRcnNJRk9XWHo4?=
 =?utf-8?B?RE5lV2hNS0xjMWtGT0VESGM5YjJsOHF5N1BKeTJ5ckJHemF2UjNGbGdxcHQ5?=
 =?utf-8?B?bnN6dytKb1FHeXd3YzNYVW5HOVBUeXZUL0VEcHBUU1lMWDg1NEtpWCtoVTJE?=
 =?utf-8?B?MHJ0WFZQdWllM2VRcXdOaWp1cTNCcTV2OE42dVk2RWFIeVB2ZHBrbzFQODBw?=
 =?utf-8?B?a0E0YVNCY3JvSzJ2ZFNSckV5VlNnUUVZRWJMSlBGS1hjL2JYTEV6QUFuMkxs?=
 =?utf-8?B?eHdLVVVObE84cDROVGgzWEljakRnNG14VjdqaUFJdHU2TjlnQUlxb2hvWHl5?=
 =?utf-8?B?UlJiTVZRNm1zYkRoT0dGeDVhYWVIbWpqL250cEowS01YU0tJbVJ2VCtTV2Fz?=
 =?utf-8?B?NGxsOFU1bDUwTW8vd0kvS0VJeEl5Q3ovMUxRTGVjU2tzYnFjbUlPakRudEdm?=
 =?utf-8?B?c2RCVklhVzZXeXFkTGNCZTN6YkVYWmJGUzFGMWlldlpxa3lPSXhEdzBpeGtk?=
 =?utf-8?B?VmJEOENMZkFFT0gvai9BUmNxMElqallTN2tQbXNIN09RVFR2bUJTY0w0ZllP?=
 =?utf-8?B?MkMxMHgvSHhBaDE5SnVtUi8vaXNBZkc4L2FFeG1sYVl0NFZSSGpPOWZiaXFl?=
 =?utf-8?B?Y3FMQVlnWFZ3SjhJeHpkVFlGTnp4eGZZQkJ5TlNJK21Fb1piSk5tTXc4cGM3?=
 =?utf-8?B?YklkU0lnUlczRHF1U0ZJNVRDYTBXRVlBeHQzSVF6c1dCamJhdWNGaTY1NEpq?=
 =?utf-8?B?TnhIZDdubnRjb0c2WXJveWZnSFdCV3dUOUxCRmtLRHIzbEtUVnUwbmNocFA5?=
 =?utf-8?B?UyswK2JMSm0zT01IejRFNzBhZ0xwKzZ1NUhSVzU3cDAyVFZIUUN5bjM0MlJI?=
 =?utf-8?Q?HmOuGp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR10MB997700.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4013099003)(4053099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2d3eURNakgzU3lKVVJiWE9admFVOEdTOVN4blR6cldWbGxwMmVid09WOHNC?=
 =?utf-8?B?L1ozQUVNTDdMTEFvelFxVXRRM09mOXE2Zkw4d1ZHUWxzSmNWRjN1bC9sa2NI?=
 =?utf-8?B?ODErL0RtMU5IQWt5NXdBenJJMEdDYWxxdUxMZ095SnpsS1dFRG1ETkRDbzZY?=
 =?utf-8?B?L1gvZ0FVRUFXekh1cTVqTUFVdXRhN3MwQVVDUllIZERLazMyZWNrVWM3QmhN?=
 =?utf-8?B?S1dVejZJMksvZ0s0VkVEQ2NsVkRETkZJNTB2bmNiaXRBa2hlekxud3c1RnY4?=
 =?utf-8?B?R2xJU1lmMm02aEpQZHJ4MjJiamtGdkJFNGNMN1dKV1Fnamo4L3didDlna0k5?=
 =?utf-8?B?VElYT0tqMGhmbmUwa1IwQy9lMEhLNENpREV4WlZybmNRNWsrdkFiSUtjNlBF?=
 =?utf-8?B?Qkd0WGZtdzkzRTVaQnZ0eVliS1lLdjdEUVpudjU5VHdlVHl0NkVQNzh3R0FR?=
 =?utf-8?B?WlROZys1YWVCVjJEMXd3a29EUkU3U0lOTlEzTUlEQkRranprS3hIZHdxY3JU?=
 =?utf-8?B?MlM1U0RYMDMrcWo5bklFOWxwQVdtSUppczJYQlF1NmJzbUpBTmxhS054dFFn?=
 =?utf-8?B?YTQ2ZEFGNTFHOFBRUnJBUnE1S2dYdXRPdjIycFloNWFqZXEva01ScHM1OE4r?=
 =?utf-8?B?ZWErNmdCVHFncUlEdFR3Y2Q3RmZpN0FyMzB6WkJhR1BQVU0vSmVlVjlnRXVP?=
 =?utf-8?B?REVNUHpDSEFDM3BxdnpIcEJhWjNnLzNsR2J6bzU0VENpN1lRTSsyWXM0dDNY?=
 =?utf-8?B?T0lkOVdmMVkza1JpRGx3dlphQll5bis1U0hzeE5vRDBpdThvaEVXWm4xSWlJ?=
 =?utf-8?B?bVdlUTliRGIxVlpNeUU2cjBBVFVzaWNXOGtPdXpOS2lPWmtoMGV4cmIwVEJ1?=
 =?utf-8?B?dDZ4TmRmVG93WFdOTVRHajV5TDhDcEZQM1FGVk1uaTMvLysvYlNMUXhJUnd3?=
 =?utf-8?B?WmxQOU9KZHlIU3hSREV3ajRkcXRNeDlEajZNME9KeEVMWlV5TUIxV1U1aWxO?=
 =?utf-8?B?YURrdG1hQXZUenRJOXJLS3VrTHZGNUFPTWlwVHZsKzMxL3hya3R4Q3lYK3VB?=
 =?utf-8?B?aHR5bWR6K1YrczlIOWd4RGROOURJa0xUbzNiUkNHRkhPN0pmSmZXcXcveW8y?=
 =?utf-8?B?eVRMclE1MFZRRGZmNkFGN1FXZmtJd1ArS2k1RmVEM3hSdlFQamVCcU05bkZI?=
 =?utf-8?B?blpwcEp2bkFmbitydDcya01RdUV0Ym1MS2FwVUhWaFNqS1RxVzNGVEltNjU0?=
 =?utf-8?B?cnIvbzNqcldFZVRoeE5XM0lFWHdMeGVFaXhTZEs0bDM2Rk1DamsrR2IvZDNF?=
 =?utf-8?B?azczKzF5UmZNOHhJbVNwZE5jY2l3dXMwV2NPZjEzZFZCMnBlcFNNU0NjcDM4?=
 =?utf-8?B?UlNoK1V0ZkhCMGJ2cFdROFNZT1FuaEZLTHlsTk1zOGdFRnpFK2RZcGo0SXBX?=
 =?utf-8?B?RFZoemJ0VU1aNWgrbW5VRWtlMHB6RDBkeUJ5RkNRY1RnRmRPZVV2KzNTQlBY?=
 =?utf-8?B?cHBpMWh0TVNOSE1VK1lMeHFLQ2h1ZUljUGcrc1Zka1N5eXhUQ29LUE1kRkRl?=
 =?utf-8?B?QUpnRlFjSHI4SDBrSkM1REF6NjVSWTVZT0tnaE5EWFFXdlZUWU92SCtaR3d0?=
 =?utf-8?B?aFZMRGlxZUR2RmJOS3p1ZWZkcktSd0lhcVhMNG1nYVhTV1BsUG9DSklGZnJ3?=
 =?utf-8?B?K1BDZDJacllGaFV0Ujc4ME84d1k1L3BLOWlObXNhMit3ckd3RjVKblFoeERX?=
 =?utf-8?B?QWtpRVhHMlZXZTY1MXJtSFRDY2s5V0MySk5MaytCSnlKYkV2ZWE0WXdQdVFy?=
 =?utf-8?B?Z3p5a083MWF2WEpaNXNOQ01mWFF6VWh5MWVvU2FOb0IxVlprNjJpa3p2RW5p?=
 =?utf-8?B?QWFaV25yWWhxaWhLc21sdEE0T3pVamMvYTZMMkt0TGd3YVZUZlRwa01OOXp6?=
 =?utf-8?B?NEQzV0RZVFlSaEw4bHgvblJicnBpd0ZHUmZUZDBMN1VMZzZVemZIVHRRaTln?=
 =?utf-8?B?b245SGNGcTJucVMrU0c2UDBwYkJjbU5LNUpzVGt6ZFFmYmV1R2RpU0FaaXdU?=
 =?utf-8?B?OXFxWnhJNnJBOWN5S1pUVHEzc0RCZi9LbFMxZ0QxenF2WVU0aHA5S0hyTXYz?=
 =?utf-8?B?Y3hkWWNobWc1MFpmcGJJYU1seWU1L2U0Q2p1dWRPL1hXOWhmWEczWG1iN013?=
 =?utf-8?B?ejFTQU5hQSt3Q3U4ZlZkYU1UckhPZ0U3UXhsdlFyb21lbjVHb3BhbEFJQSt0?=
 =?utf-8?B?Qk1wTnZ2TUl0LzVFc3FnVWQyVHozSjVTQWtTZE4vcjU5ZFFYUDlNNWJ1ZGdI?=
 =?utf-8?B?YWxsakpqSHkwa0RYeHZYaDJrMjVSblU0ekVtRWZCRU9Eb3lhWHVtQTMwS25D?=
 =?utf-8?Q?nJi2MlqlpBgfyxwbCs/HEjhnu2eogjcfTduUm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YsnIKju1CwSVslMnx3UbAM30yxx+3q/WEQ5QKXQLQ3RU2PBzqV22t51n6JGmRMrPsUYh4XQdfgfHSxyvM95SEQRocs94LlHGFaV7XprYdnGR4teMtmyc9ijzQE9qf3ClyCKrmwlH7FwzYK+tdPVd9S8imPBmgG/usbkVfwOrArAXRBWWfHbFzucFd8QkjmoOv3YOkrAtrhbg6uMuMgHi9q6LhQ/xLQ15yKPBCyyFTyuGCmRFpovkI7fHN08+WiSc7VglW/E6HXLO0f/2mpJN8qP3//FRv04/I6VvWvx+HAu1faeWlMEd8D4OuThjyo8OA0CIox5nvgbAkcZnGkPpjXMKmfPi41liSQskXGp2mbyKk98Ux5SxNdzm2jY2HXOrRROguXvecmDy8hwERwXAkxJ0nG7Sw26ELn5LLIBasYJtQ+mtF2PHo25Tx5KaqZWQ2aGUupN0AmKuYoRGs140b8bkUJ3+NZDBjWrU2j5PFqH4uBH48QUTUEQlzJ2jfKsJ5QOobcM4ViV6diDKfwTfnQKo2gpqUGMjx9USR/6LvtHas1HwjRrI0lttp48S9uu/7yyhmrZHMcK67w5m8DYR9giUHG5nLUluUmF0ywrwaSU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9296fb66-81a3-48d5-0705-08de5ce1d8b9
X-MS-Exchange-CrossTenant-AuthSource: DS3PR10MB997700.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:50:20.7502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCOLfUcYXGmPzzGkMGShXZGf+WR0q6uYp9GLcghP21lxYljQag3ZZJ/nmFsHsudRyf4kI8Yom+s/SjU8GrcZX9y8fHiwfYD3aT3Hr92H9eWaxKnGS994A3PW4dfuCSEj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7683
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601260118
X-Proofpoint-ORIG-GUID: JtrHL8hqU_y7dwP2RwGK9ppFFVCL3N0F
X-Proofpoint-GUID: JtrHL8hqU_y7dwP2RwGK9ppFFVCL3N0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNyBTYWx0ZWRfX95ONSKgR20yK
 y/psmpMA4RBaLTSF1hyOmQFqiThn3k9Mq1oX3YCRP1h1U+f0Qg4uSSQ8pJ9+0ITTdz6wMd98g1r
 dcpaBVhlcbAbQ5lO+tkgmZ3MhK2C2k368hu/+9P4SP6lboPh+hQpQ8uUgWicNbvr4zaWwZzwh6W
 qXMJF33F3TA3QTdOkfMX0nSx2cB3vHpakmmriBGHMwA5ioGf8+FzmyHFa6SONPfyJjmdpep7t5E
 s7aE+X/ln1mf1VAv0CSUPkekneYrfOfEn/rb52NiPP2D8iSl/MVL0iMtWZxnu+V8+lK+zct2Xyg
 1XL3DkYh8sxkFQSmZk2FnMJIbcDEEx8ts//Z8rFCK05S4r3dDc9hsOE/F7y+GK7Wrj3j1GTz7iE
 Wr8vkrYrJG7pAp4Gs1tQJtsgzlwjcaq0BgKTh/E/ewjkIn25QPLNmKE0D4l9RrrsSjcMmyHBAJC
 bOc75vKlgNsyKYBGeEwGzOZAdYp7hVy+RQEIYJdU=
X-Authority-Analysis: v=2.4 cv=cPLtc1eN c=1 sm=1 tr=0 ts=69777124 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117
 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=V2sgnzSHAAAA:8 a=zd2uoN0lAAAA:8
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=GN952BHwLkFkA3wxNx8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IN87OBt0QE9-ma0E50QA:9 a=bcQPZPpfNEcA:10
 a=JMNH9X61SiQA:10 a=Z31ocT7rh6aUJxSkT1EX:22 cc=ntf awl=host:12104
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:kernel-dev@igalia.com,m:wangzhi@stu.xidian.edu.cn,m:David.Francis@amd.com,m:felix.kuehling@amd.com,m:christian.koenig@amd.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harshit.m.mogalapalli@oracle.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,oracle.com:email,oracle.com:dkim,oracle.com:mid];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[harshit.m.mogalapalli@oracle.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3DA9289186
X-Rspamd-Action: no action

--------------V2zheg0WWtioRTaAiSzxveBT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


On 26/01/26 14:22, Tvrtko Ursulin wrote:
> 
> On 23/01/2026 23:42, Harshit Mogalapalli wrote:
>> Hi,
>>
>> On 23/01/26 19:45, Tvrtko Ursulin wrote:
>>> Since GEM bo handles are u32 in the uapi and the internal implementation
>>> uses idr_alloc() which uses int ranges, passing a new handle larger than
>>> INT_MAX trivially triggers a kernel warning:
>>>
>>> idr_alloc():
>>> ...
>>>     if (WARN_ON_ONCE(start < 0))
>>>         return -EINVAL;
>>> ...
>>>
>>> Fix it by rejecting new handles above INT_MAX and at the same time make
>>> the end limit calculation more obvious by moving into int domain.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Reported-by: Zhi Wang <wangzhi@stu.xidian.edu.cn>
>>> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM 
>>> handle")
>>> Cc: David Francis <David.Francis@amd.com>
>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: <stable@vger.kernel.org> # v6.18+
>>
>>
>> Thanks,
>>
>> I have seen this WARN_ON as well and I have tested the reproducer 
>> against your patch and it works.
>>
>> So:
>>
>> Tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> 
> Thank you! May I ask what test cases are you using to exercise it?
> 

I just tested with the attached reproducer(Syzkaller generated) before 
and after applying your patch.



>>
>> A question below:
>>
>>> ---
>>> v2:
>>>   * Rename local variable, re-position comment, drop the else block. 
>>> (Christian)
>>>   * Use local at more places.
>>> ---
>>>   drivers/gpu/drm/drm_gem.c | 18 ++++++++++++------
>>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 7ff6b7bbeb73..ffa7852c8f6c 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1001,16 +1001,21 @@ int drm_gem_change_handle_ioctl(struct 
>>> drm_device *dev, void *data,
>>>   {
>>>       struct drm_gem_change_handle *args = data;
>>>       struct drm_gem_object *obj;
>>> -    int ret;
>>> +    int handle, ret;
>>>       if (!drm_core_check_feature(dev, DRIVER_GEM))
>>>           return -EOPNOTSUPP;
>>> +    /* idr_alloc() limitation. */
>>> +    if (args->new_handle > INT_MAX)
>>> +        return -EINVAL;
>>
>> INT_MAX is allowed.
>>
>>> +    handle = args->new_handle;
>>> +
>>>       obj = drm_gem_object_lookup(file_priv, args->handle);
>>>       if (!obj)
>>>           return -ENOENT;
>>> -    if (args->handle == args->new_handle) {
>>> +    if (args->handle == handle) {
>>>           ret = 0;
>>>           goto out;
>>>       }
>>> @@ -1018,18 +1023,19 @@ int drm_gem_change_handle_ioctl(struct 
>>> drm_device *dev, void *data,
>>>       mutex_lock(&file_priv->prime.lock);
>>>       spin_lock(&file_priv->table_lock);
>>> -    ret = idr_alloc(&file_priv->object_idr, obj,
>>> -        args->new_handle, args->new_handle + 1, GFP_NOWAIT);
>>> +    ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
>>
>> handle + 1 here would cause a signed integer overflow ?
> 
> For the kernel it is fine due -fno-strict-overflow and idr_alloc() 
> explicitly handles it:
> 

Yes, thanks for explaining! More of a question on how UBSAN_INTEGER_WRAP 
config might treat this, but currently that's marked as BROKEN.

> ...
>   * Allocates an unused ID in the range specified by @start and @end.  If
>   * @end is <= 0, it is treated as one larger than %INT_MAX.  This allows
>   * callers to use @start + N as @end as long as N is within integer range.
> ...
>      ret = idr_alloc_u32(idr, ptr, &id, end > 0 ? end - 1 : INT_MAX, gfp);
> 
> So for start == INT_MAX it ends up passing end == INT_MAX to 
> idr_alloc_u32, which, contrary to idr_alloc(), has it's end range 
> parameter _inclusive_.
> 
> Simple huh? :))
> 


Thanks!!


Regards,
Harshit
> Regards,
> 
> Tvrtko
> 
>>
>>
>>
>> Thanks,
>> Harshit
>>> +            GFP_NOWAIT);
>>>       spin_unlock(&file_priv->table_lock);
>>>       if (ret < 0)
>>>           goto out_unlock;
>>>       if (obj->dma_buf) {
>>> -        ret = drm_prime_add_buf_handle(&file_priv->prime, obj- 
>>> >dma_buf, args->new_handle);
>>> +        ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
>>> +                           handle);
>>>           if (ret < 0) {
>>>               spin_lock(&file_priv->table_lock);
>>> -            idr_remove(&file_priv->object_idr, args->new_handle);
>>> +            idr_remove(&file_priv->object_idr, handle);
>>>               spin_unlock(&file_priv->table_lock);
>>>               goto out_unlock;
>>>           }
>>
> 

--------------V2zheg0WWtioRTaAiSzxveBT
Content-Type: text/plain; charset=UTF-8; name="idr_alloc_repro.c"
Content-Disposition: attachment; filename="idr_alloc_repro.c"
Content-Transfer-Encoding: base64

e1xydGYxXGFuc2lcYW5zaWNwZzEyNTJcY29jb2FydGYyODY3Clxjb2NvYXRleHRzY2FsaW5nMFxj
b2NvYXBsYXRmb3JtMHtcZm9udHRibFxmMFxmbW9kZXJuXGZjaGFyc2V0MCBDb3VyaWVyO30Ke1xj
b2xvcnRibDtccmVkMjU1XGdyZWVuMjU1XGJsdWUyNTU7XHJlZDBcZ3JlZW4wXGJsdWUwO30Ke1wq
XGV4cGFuZGVkY29sb3J0Ymw7O1xjc3NyZ2JcYzBcYzBcYzA7fQpccGFwZXJ3MTE5MDBccGFwZXJo
MTY4NDBcbWFyZ2wxNDQwXG1hcmdyMTQ0MFx2aWV3dzExNTIwXHZpZXdoODQwMFx2aWV3a2luZDAK
XGRlZnRhYjcyMApccGFyZFxwYXJkZWZ0YWI3MjBccGFydGlnaHRlbmZhY3RvcjAKClxmMFxmczI2
IFxjZjAgXGV4cG5kMFxleHBuZHR3MFxrZXJuaW5nMApcb3V0bDBcc3Ryb2tld2lkdGgwIFxzdHJv
a2VjMiAjZGVmaW5lIF9HTlVfU09VUkNFIFwKXAojaW5jbHVkZSA8ZW5kaWFuLmg+XAojaW5jbHVk
ZSA8ZmNudGwuaD5cCiNpbmNsdWRlIDxzdGRpbnQuaD5cCiNpbmNsdWRlIDxzdGRpby5oPlwKI2lu
Y2x1ZGUgPHN0ZGxpYi5oPlwKI2luY2x1ZGUgPHN0cmluZy5oPlwKI2luY2x1ZGUgPHN5cy9zdGF0
Lmg+XAojaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD5cCiNpbmNsdWRlIDxzeXMvdHlwZXMuaD5cCiNp
bmNsdWRlIDx1bmlzdGQuaD5cClwKI2lmbmRlZiBfX05SX2Nsb3NlX3JhbmdlXAojZGVmaW5lIF9f
TlJfY2xvc2VfcmFuZ2UgNDM2XAojZW5kaWZcClwKc3RhdGljIGxvbmcgc3l6X29wZW5fZGV2KHZv
bGF0aWxlIGxvbmcgYTAsIHZvbGF0aWxlIGxvbmcgYTEsIHZvbGF0aWxlIGxvbmcgYTIpXApce1wK
CWlmIChhMCA9PSAweGMgfHwgYTAgPT0gMHhiKSBce1wKCQljaGFyIGJ1ZlsxMjhdO1wKCQlzcHJp
bnRmKGJ1ZiwgIi9kZXYvJXMvJWQ6JWQiLCBhMCA9PSAweGMgPyAiY2hhciIgOiAiYmxvY2siLCAo
dWludDhfdClhMSwgKHVpbnQ4X3QpYTIpO1wKCQlyZXR1cm4gb3BlbihidWYsIE9fUkRXUiwgMCk7
XAoJXH0gZWxzZSBce1wKCQl1bnNpZ25lZCBsb25nIG5iID0gYTE7XAoJCWNoYXIgYnVmWzEwMjRd
O1wKCQljaGFyKiBoYXNoO1wKCQlzdHJuY3B5KGJ1ZiwgKGNoYXIqKWEwLCBzaXplb2YoYnVmKSAt
IDEpO1wKCQlidWZbc2l6ZW9mKGJ1ZikgLSAxXSA9IDA7XAoJCXdoaWxlICgoaGFzaCA9IHN0cmNo
cihidWYsICcjJykpKSBce1wKCQkJKmhhc2ggPSAnMCcgKyAoY2hhcikobmIgJSAxMCk7XAoJCQlu
YiAvPSAxMDtcCgkJXH1cCgkJcmV0dXJuIG9wZW4oYnVmLCBhMiAmIH5PX0NSRUFULCAwKTtcCglc
fVwKXH1cClwKdWludDY0X3Qgcls5XSA9IFx7MHhmZmZmZmZmZmZmZmZmZmZmLCAweGZmZmZmZmZm
ZmZmZmZmZmYsIDB4ZmZmZmZmZmZmZmZmZmZmZiwgMHhmZmZmZmZmZmZmZmZmZmZmLCAweGZmZmZm
ZmZmZmZmZmZmZmYsIDB4MCwgMHgwLCAweDAsIDB4ZmZmZmZmZmZmZmZmZmZmZlx9O1wKXAppbnQg
bWFpbih2b2lkKVwKXHtcCgkJc3lzY2FsbChfX05SX21tYXAsIC8qYWRkcj0qLzB4MWZmZmZmZmZm
MDAwdWwsIC8qbGVuPSovMHgxMDAwdWwsIC8qcHJvdD0qLzB1bCwgLypmbGFncz1NQVBfRklYRUR8
TUFQX0FOT05ZTU9VU3xNQVBfUFJJVkFURSovMHgzMnVsLCAvKmZkPSovKGludHB0cl90KS0xLCAv
Km9mZnNldD0qLzB1bCk7XAoJc3lzY2FsbChfX05SX21tYXAsIC8qYWRkcj0qLzB4MjAwMDAwMDAw
MDAwdWwsIC8qbGVuPSovMHgxMDAwMDAwdWwsIC8qcHJvdD1QUk9UX1dSSVRFfFBST1RfUkVBRHxQ
Uk9UX0VYRUMqLzd1bCwgLypmbGFncz1NQVBfRklYRUR8TUFQX0FOT05ZTU9VU3xNQVBfUFJJVkFU
RSovMHgzMnVsLCAvKmZkPSovKGludHB0cl90KS0xLCAvKm9mZnNldD0qLzB1bCk7XAoJc3lzY2Fs
bChfX05SX21tYXAsIC8qYWRkcj0qLzB4MjAwMDAxMDAwMDAwdWwsIC8qbGVuPSovMHgxMDAwdWws
IC8qcHJvdD0qLzB1bCwgLypmbGFncz1NQVBfRklYRUR8TUFQX0FOT05ZTU9VU3xNQVBfUFJJVkFU
RSovMHgzMnVsLCAvKmZkPSovKGludHB0cl90KS0xLCAvKm9mZnNldD0qLzB1bCk7XAoJY29uc3Qg
Y2hhciogcmVhc29uO1wKCSh2b2lkKXJlYXNvbjtcCgkJCQlpbnRwdHJfdCByZXMgPSAwO1wKCWlm
ICh3cml0ZSgxLCAiZXhlY3V0aW5nIHByb2dyYW1cXG4iLCBzaXplb2YoImV4ZWN1dGluZyBwcm9n
cmFtXFxuIikgLSAxKSkgXHtcfVwKLy8gIHN5el9vcGVuX2RldiRkcmkgYXJndW1lbnRzOiBbXAov
LyAgICBkZXY6IHB0cltpbiwgYnVmZmVyXSBce1wKLy8gICAgICBidWZmZXI6IFx7MmYgNjQgNjUg
NzYgMmYgNjQgNzIgNjkgMmYgNjMgNjEgNzIgNjQgMjMgMDBcfSAobGVuZ3RoIDB4ZilcCi8vICAg
IFx9XAovLyAgICBpZDogaW50cHRyID0gMHg1NWEgKDggYnl0ZXMpXAovLyAgICBmbGFnczogb3Bl
bl9mbGFncyA9IDB4MCAoOCBieXRlcylcCi8vICBdXAovLyAgcmV0dXJucyBmZF9kcmlcCm1lbWNw
eSgodm9pZCopMHgyMDAwMDAwMDAyNDAsICIvZGV2L2RyaS9jYXJkI1xcMDAwIiwgMTUpO1wKCXJl
cyA9IC0xO1wKcmVzID0gc3l6X29wZW5fZGV2KC8qZGV2PSovMHgyMDAwMDAwMDAyNDAsIC8qaWQ9
Ki8weDU1YSwgLypmbGFncz0qLzApO1wKCWlmIChyZXMgIT0gLTEpXAoJCXJbMF0gPSByZXM7XAov
LyAgaW9jdGwkRFJNX0lPQ1RMX01PREVfQ1JFQVRFX0RVTUIgYXJndW1lbnRzOiBbXAovLyAgICBm
ZDogZmRfZHJpIChyZXNvdXJjZSlcCi8vICAgIGNtZDogY29uc3QgPSAweGMwMjA2NGIyICg0IGJ5
dGVzKVwKLy8gICAgYXJnOiBwdHJbaW5vdXQsIGRybV9tb2RlX2NyZWF0ZV9kdW1iXSBce1wKLy8g
ICAgICBkcm1fbW9kZV9jcmVhdGVfZHVtYiBce1wKLy8gICAgICAgIGhlaWdodDogaW50MzIgPSAw
eGYgKDQgYnl0ZXMpXAovLyAgICAgICAgd2lkdGg6IGludDMyID0gMHg1ICg0IGJ5dGVzKVwKLy8g
ICAgICAgIGJwcDogaW50MzIgPSAweDggKDQgYnl0ZXMpXAovLyAgICAgICAgZmxhZ3M6IGNvbnN0
ID0gMHgwICg0IGJ5dGVzKVwKLy8gICAgICAgIGhhbmRsZTogZHJtX2R1bWJfaGFuZGxlIChyZXNv
dXJjZSlcCi8vICAgICAgICBwaXRjaDogaW50MzIgPSAweDAgKDQgYnl0ZXMpXAovLyAgICAgICAg
c2l6ZTogaW50NjQgPSAweDAgKDggYnl0ZXMpXAovLyAgICAgIFx9XAovLyAgICBcfVwKLy8gIF1c
CioodWludDMyX3QqKTB4MjAwMDAwMDAwMWMwID0gMHhmO1wKKih1aW50MzJfdCopMHgyMDAwMDAw
MDAxYzQgPSA1O1wKKih1aW50MzJfdCopMHgyMDAwMDAwMDAxYzggPSA4O1wKKih1aW50MzJfdCop
MHgyMDAwMDAwMDAxY2MgPSAwO1wKCXN5c2NhbGwoX19OUl9pb2N0bCwgLypmZD0qL3JbMF0sIC8q
Y21kPSovMHhjMDIwNjRiMiwgLyphcmc9Ki8weDIwMDAwMDAwMDFjMHVsKTtcCi8vICBwaXBlIGFy
Z3VtZW50czogW1wKLy8gICAgcGlwZWZkOiBwdHJbb3V0LCBwaXBlZmRdIFx7XAovLyAgICAgIHBp
cGVmZCBce1wKLy8gICAgICAgIHJmZDogZmQgKHJlc291cmNlKVwKLy8gICAgICAgIHdmZDogZmQg
KHJlc291cmNlKVwKLy8gICAgICBcfVwKLy8gICAgXH1cCi8vICBdXAoJcmVzID0gc3lzY2FsbChf
X05SX3BpcGUsIC8qcGlwZWZkPSovMHgyMDAwMDAwMDAwMDB1bCk7XAoJaWYgKHJlcyAhPSAtMSkg
XHtcCnJbMV0gPSAqKHVpbnQzMl90KikweDIwMDAwMDAwMDAwMDtcCnJbMl0gPSAqKHVpbnQzMl90
KikweDIwMDAwMDAwMDAwNDtcCglcfVwKLy8gIGNsb3NlX3JhbmdlIGFyZ3VtZW50czogW1wKLy8g
ICAgZmQ6IGZkIChyZXNvdXJjZSlcCi8vICAgIG1heF9mZDogZmQgKHJlc291cmNlKVwKLy8gICAg
ZmxhZ3M6IGNsb3NlX3JhbmdlX2ZsYWdzID0gMHgwICg4IGJ5dGVzKVwKLy8gIF1cCglzeXNjYWxs
KF9fTlJfY2xvc2VfcmFuZ2UsIC8qZmQ9Ki9yWzFdLCAvKm1heF9mZD0qL3JbMl0sIC8qZmxhZ3M9
Ki8wdWwpO1wKLy8gIHN5el9vcGVuX2RldiRkcmkgYXJndW1lbnRzOiBbXAovLyAgICBkZXY6IHB0
cltpbiwgYnVmZmVyXSBce1wKLy8gICAgICBidWZmZXI6IFx7MmYgNjQgNjUgNzYgMmYgNjQgNzIg
NjkgMmYgNjMgNjEgNzIgNjQgMjMgMDBcfSAobGVuZ3RoIDB4ZilcCi8vICAgIFx9XAovLyAgICBp
ZDogaW50cHRyID0gMHhkNDgyICg4IGJ5dGVzKVwKLy8gICAgZmxhZ3M6IG9wZW5fZmxhZ3MgPSAw
eDgwMDAwICg4IGJ5dGVzKVwKLy8gIF1cCi8vICByZXR1cm5zIGZkX2RyaVwKbWVtY3B5KCh2b2lk
KikweDIwMDAwMDAwMDEwMCwgIi9kZXYvZHJpL2NhcmQjXFwwMDAiLCAxNSk7XAoJcmVzID0gLTE7
XApyZXMgPSBzeXpfb3Blbl9kZXYoLypkZXY9Ki8weDIwMDAwMDAwMDEwMCwgLyppZD0qLzB4ZDQ4
MiwgLypmbGFncz1PX0NMT0VYRUMqLzB4ODAwMDApO1wKCWlmIChyZXMgIT0gLTEpXAoJCXJbM10g
PSByZXM7XAovLyAgc3l6X29wZW5fZGV2JGRyaSBhcmd1bWVudHM6IFtcCi8vICAgIGRldjogcHRy
W2luLCBidWZmZXJdIFx7XAovLyAgICAgIGJ1ZmZlcjogXHsyZiA2NCA2NSA3NiAyZiA2NCA3MiA2
OSAyZiA2MyA2MSA3MiA2NCAyMyAwMFx9IChsZW5ndGggMHhmKVwKLy8gICAgXH1cCi8vICAgIGlk
OiBpbnRwdHIgPSAweGQ0ODIgKDggYnl0ZXMpXAovLyAgICBmbGFnczogb3Blbl9mbGFncyA9IDB4
ODAwMDAgKDggYnl0ZXMpXAovLyAgXVwKLy8gIHJldHVybnMgZmRfZHJpXAptZW1jcHkoKHZvaWQq
KTB4MjAwMDAwMDAwMTAwLCAiL2Rldi9kcmkvY2FyZCNcXDAwMCIsIDE1KTtcCglyZXMgPSAtMTtc
CnJlcyA9IHN5el9vcGVuX2RldigvKmRldj0qLzB4MjAwMDAwMDAwMTAwLCAvKmlkPSovMHhkNDgy
LCAvKmZsYWdzPU9fQ0xPRVhFQyovMHg4MDAwMCk7XAoJaWYgKHJlcyAhPSAtMSlcCgkJcls0XSA9
IHJlcztcCi8vICBpb2N0bCREUk1fSU9DVExfTU9ERV9HRVRSRVNPVVJDRVMgYXJndW1lbnRzOiBb
XAovLyAgICBmZDogZmRfZHJpIChyZXNvdXJjZSlcCi8vICAgIGNtZDogY29uc3QgPSAweGMwNDA2
NGEwICg0IGJ5dGVzKVwKLy8gICAgYXJnOiBwdHJbaW5vdXQsIGRybV9tb2RlX2NhcmRfcmVzXSBc
e1wKLy8gICAgICBkcm1fbW9kZV9jYXJkX3JlcyBce1wKLy8gICAgICAgIGZiaWQ6IG5pbFwKLy8g
ICAgICAgIGNydGNpZDogcHRyW291dCwgYXJyYXlbZHJtX2NydGNfaWRdXSBce1wKLy8gICAgICAg
ICAgYXJyYXlbZHJtX2NydGNfaWRdIFx7XAovLyAgICAgICAgICAgIGRybV9jcnRjX2lkIChyZXNv
dXJjZSlcCi8vICAgICAgICAgIFx9XAovLyAgICAgICAgXH1cCi8vICAgICAgICBjb25uaWQ6IG5p
bFwKLy8gICAgICAgIGVuY2lkOiBuaWxcCi8vICAgICAgICBuZmJpZDogbGVuID0gMHgwICg0IGJ5
dGVzKVwKLy8gICAgICAgIG5jcnRjaWQ6IGxlbiA9IDB4MSAoNCBieXRlcylcCi8vICAgICAgICBu
Y29ubmlkOiBsZW4gPSAweDAgKDQgYnl0ZXMpXAovLyAgICAgICAgbmVuY2lkOiBsZW4gPSAweDAg
KDQgYnl0ZXMpXAovLyAgICAgICAgbWF4dzogY29uc3QgPSAweDAgKDQgYnl0ZXMpXAovLyAgICAg
ICAgbWF4aDogY29uc3QgPSAweDAgKDQgYnl0ZXMpXAovLyAgICAgICAgbWludzogY29uc3QgPSAw
eDAgKDQgYnl0ZXMpXAovLyAgICAgICAgbWluaDogY29uc3QgPSAweDAgKDQgYnl0ZXMpXAovLyAg
ICAgIFx9XAovLyAgICBcfVwKLy8gIF1cCioodWludDY0X3QqKTB4MjAwMDAwMDAwMmMwID0gMDtc
CioodWludDY0X3QqKTB4MjAwMDAwMDAwMmM4ID0gMHgyMDAwMDAwMDAxYzA7XAoqKHVpbnQ2NF90
KikweDIwMDAwMDAwMDJkMCA9IDA7XAoqKHVpbnQ2NF90KikweDIwMDAwMDAwMDJkOCA9IDA7XAoq
KHVpbnQzMl90KikweDIwMDAwMDAwMDJlMCA9IDA7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDJl
NCA9IDE7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDJlOCA9IDA7XAoqKHVpbnQzMl90KikweDIw
MDAwMDAwMDJlYyA9IDA7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDJmMCA9IDA7XAoqKHVpbnQz
Ml90KikweDIwMDAwMDAwMDJmNCA9IDA7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDJmOCA9IDA7
XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDJmYyA9IDA7XAoJcmVzID0gc3lzY2FsbChfX05SX2lv
Y3RsLCAvKmZkPSovcls0XSwgLypjbWQ9Ki8weGMwNDA2NGEwLCAvKmFyZz0qLzB4MjAwMDAwMDAw
MmMwdWwpO1wKCWlmIChyZXMgIT0gLTEpXApyWzVdID0gKih1aW50MzJfdCopMHgyMDAwMDAwMDAx
YzA7XAovLyAgaW9jdGwkRFJNX0lPQ1RMX01PREVfR0VUQ1JUQyBhcmd1bWVudHM6IFtcCi8vICAg
IGZkOiBmZF9kcmkgKHJlc291cmNlKVwKLy8gICAgY21kOiBjb25zdCA9IDB4YzA2ODY0YTEgKDQg
Ynl0ZXMpXAovLyAgICBhcmc6IHB0cltpbm91dCwgZHJtX21vZGVfY3J0YyREUk1fSU9DVExfTU9E
RV9HRVRDUlRDXSBce1wKLy8gICAgICBkcm1fbW9kZV9jcnRjJERSTV9JT0NUTF9NT0RFX0dFVENS
VEMgXHtcCi8vICAgICAgICBzZXRfY29ubmVjdG9yc19wdHI6IG5pbFwKLy8gICAgICAgIGNvdW50
X2Nvbm5lY3RvcnM6IGxlbiA9IDB4MCAoNCBieXRlcylcCi8vICAgICAgICBjcnRjX2lkOiBkcm1f
Y3J0Y19pZCAocmVzb3VyY2UpXAovLyAgICAgICAgZmJfaWQ6IGRybV9mYl9pZCAocmVzb3VyY2Up
XAovLyAgICAgICAgeDogaW50MzIgPSAweDAgKDQgYnl0ZXMpXAovLyAgICAgICAgeTogaW50MzIg
PSAweDAgKDQgYnl0ZXMpXAovLyAgICAgICAgZ2FtbWFfc2l6ZTogaW50MzIgPSAweDAgKDQgYnl0
ZXMpXAovLyAgICAgICAgbW9kZV92YWxpZDogaW50MzIgPSAweDAgKDQgYnl0ZXMpXAovLyAgICAg
ICAgbW9kZTogZHJtX21vZGVfbW9kZWluZm8gXHtcCi8vICAgICAgICAgIGNsb2NrOiBpbnQzMiA9
IDB4MCAoNCBieXRlcylcCi8vICAgICAgICAgIGhkaXNwbGF5OiBpbnQxNiA9IDB4MCAoMiBieXRl
cylcCi8vICAgICAgICAgIGhzeW5jX3N0YXJ0OiBpbnQxNiA9IDB4MCAoMiBieXRlcylcCi8vICAg
ICAgICAgIGhzeW5jX2VuZDogaW50MTYgPSAweDAgKDIgYnl0ZXMpXAovLyAgICAgICAgICBodG90
YWw6IGludDE2ID0gMHgwICgyIGJ5dGVzKVwKLy8gICAgICAgICAgaHNrZXc6IGludDE2ID0gMHgw
ICgyIGJ5dGVzKVwKLy8gICAgICAgICAgdmRpc3BsYXk6IGludDE2ID0gMHgwICgyIGJ5dGVzKVwK
Ly8gICAgICAgICAgdnN5bmNfc3RhcnQ6IGludDE2ID0gMHgwICgyIGJ5dGVzKVwKLy8gICAgICAg
ICAgdnN5bmNfZW5kOiBpbnQxNiA9IDB4MCAoMiBieXRlcylcCi8vICAgICAgICAgIHZ0b3RhbDog
aW50MTYgPSAweDAgKDIgYnl0ZXMpXAovLyAgICAgICAgICB2c2NhbjogaW50MTYgPSAweDAgKDIg
Ynl0ZXMpXAovLyAgICAgICAgICB2cmVmcmVzaDogaW50MzIgPSAweDAgKDQgYnl0ZXMpXAovLyAg
ICAgICAgICBmbGFnczogaW50MzIgPSAweDAgKDQgYnl0ZXMpXAovLyAgICAgICAgICB0eXBlOiBp
bnQzMiA9IDB4MCAoNCBieXRlcylcCi8vICAgICAgICAgIG5hbWU6IGJ1ZmZlcjogKERpck91dClc
Ci8vICAgICAgICBcfVwKLy8gICAgICBcfVwKLy8gICAgXH1cCi8vICBdXAoqKHVpbnQ2NF90Kikw
eDIwMDAwMDAwMDIwMCA9IDA7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDIwOCA9IDA7XAoqKHVp
bnQzMl90KikweDIwMDAwMDAwMDIwYyA9IHJbNV07XAoJcmVzID0gc3lzY2FsbChfX05SX2lvY3Rs
LCAvKmZkPSovclsyXSwgLypjbWQ9Ki8weGMwNjg2NGExLCAvKmFyZz0qLzB4MjAwMDAwMDAwMjAw
dWwpO1wKCWlmIChyZXMgIT0gLTEpXApyWzZdID0gKih1aW50MzJfdCopMHgyMDAwMDAwMDAyMTA7
XAovLyAgaW9jdGwkRFJNX0lPQ1RMX01PREVfR0VURkIyIGFyZ3VtZW50czogW1wKLy8gICAgZmQ6
IGZkX2RyaSAocmVzb3VyY2UpXAovLyAgICBjbWQ6IGNvbnN0ID0gMHhjMDY4NjRjZSAoNCBieXRl
cylcCi8vICAgIGFyZzogcHRyW2lub3V0LCBkcm1fbW9kZV9mYl9jbWQyJERSTV9JT0NUTF9NT0RF
X0dFVEZCMl0gXHtcCi8vICAgICAgZHJtX21vZGVfZmJfY21kMiREUk1fSU9DVExfTU9ERV9HRVRG
QjIgXHtcCi8vICAgICAgICBmYl9pZDogZHJtX2ZiX2lkIChyZXNvdXJjZSlcCi8vICAgICAgICB3
aWR0aDogaW50MzIgPSAweDggKDQgYnl0ZXMpXAovLyAgICAgICAgaGVpZ2h0OiBpbnQzMiA9IDB4
NiAoNCBieXRlcylcCi8vICAgICAgICBwaXhlbF9mb3JtYXQ6IGludDMyID0gMHg1ICg0IGJ5dGVz
KVwKLy8gICAgICAgIGZsYWdzOiBkcm1fbW9kZV9mYl9mbGFncyA9IDB4MSAoNCBieXRlcylcCi8v
ICAgICAgICBoYW5kbGVzOiBhcnJheVtkcm1fZ2VtX2hhbmRsZV0gXHtcCi8vICAgICAgICAgIGRy
bV9nZW1faGFuZGxlIChyZXNvdXJjZSlcCi8vICAgICAgICAgIGRybV9nZW1faGFuZGxlIChyZXNv
dXJjZSlcCi8vICAgICAgICAgIGRybV9nZW1faGFuZGxlIChyZXNvdXJjZSlcCi8vICAgICAgICAg
IGRybV9nZW1faGFuZGxlIChyZXNvdXJjZSlcCi8vICAgICAgICBcfVwKLy8gICAgICAgIHBpdGNo
ZXM6IGFycmF5W2ludDMyXSBce1wKLy8gICAgICAgICAgaW50MzIgPSAweDg3OGIgKDQgYnl0ZXMp
XAovLyAgICAgICAgICBpbnQzMiA9IDB4MWZmICg0IGJ5dGVzKVwKLy8gICAgICAgICAgaW50MzIg
PSAweDkgKDQgYnl0ZXMpXAovLyAgICAgICAgICBpbnQzMiA9IDB4NCAoNCBieXRlcylcCi8vICAg
ICAgICBcfVwKLy8gICAgICAgIG9mZnNldHM6IGFycmF5W2ludDMyXSBce1wKLy8gICAgICAgICAg
aW50MzIgPSAweGYgKDQgYnl0ZXMpXAovLyAgICAgICAgICBpbnQzMiA9IDB4OSAoNCBieXRlcylc
Ci8vICAgICAgICAgIGludDMyID0gMHg4ICg0IGJ5dGVzKVwKLy8gICAgICAgICAgaW50MzIgPSAw
eDggKDQgYnl0ZXMpXAovLyAgICAgICAgXH1cCi8vICAgICAgICBwYWQgPSAweDAgKDQgYnl0ZXMp
XAovLyAgICAgICAgbW9kaWZpZXI6IGFycmF5W2ludDY0XSBce1wKLy8gICAgICAgICAgaW50NjQg
PSAweGYxZmQgKDggYnl0ZXMpXAovLyAgICAgICAgICBpbnQ2NCA9IDB4OSAoOCBieXRlcylcCi8v
ICAgICAgICAgIGludDY0ID0gMHg0ICg4IGJ5dGVzKVwKLy8gICAgICAgICAgaW50NjQgPSAweDIg
KDggYnl0ZXMpXAovLyAgICAgICAgXH1cCi8vICAgICAgXH1cCi8vICAgIFx9XAovLyAgXVwKKih1
aW50MzJfdCopMHgyMDAwMDAwMDAwODAgPSByWzZdO1wKKih1aW50MzJfdCopMHgyMDAwMDAwMDAw
ODQgPSA4O1wKKih1aW50MzJfdCopMHgyMDAwMDAwMDAwODggPSA2O1wKKih1aW50MzJfdCopMHgy
MDAwMDAwMDAwOGMgPSA1O1wKKih1aW50MzJfdCopMHgyMDAwMDAwMDAwOTAgPSAxO1wKKih1aW50
MzJfdCopMHgyMDAwMDAwMDAwYTQgPSAweDg3OGI7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDBh
OCA9IDB4MWZmO1wKKih1aW50MzJfdCopMHgyMDAwMDAwMDAwYWMgPSA5O1wKKih1aW50MzJfdCop
MHgyMDAwMDAwMDAwYjAgPSA0O1wKKih1aW50MzJfdCopMHgyMDAwMDAwMDAwYjQgPSAweGY7XAoq
KHVpbnQzMl90KikweDIwMDAwMDAwMDBiOCA9IDk7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDBi
YyA9IDg7XAoqKHVpbnQzMl90KikweDIwMDAwMDAwMDBjMCA9IDg7XAoqKHVpbnQ2NF90KikweDIw
MDAwMDAwMDBjOCA9IDB4ZjFmZDtcCioodWludDY0X3QqKTB4MjAwMDAwMDAwMGQwID0gOTtcCioo
dWludDY0X3QqKTB4MjAwMDAwMDAwMGQ4ID0gNDtcCioodWludDY0X3QqKTB4MjAwMDAwMDAwMGUw
ID0gMjtcCglyZXMgPSBzeXNjYWxsKF9fTlJfaW9jdGwsIC8qZmQ9Ki9yWzNdLCAvKmNtZD0qLzB4
YzA2ODY0Y2UsIC8qYXJnPSovMHgyMDAwMDAwMDAwODB1bCk7XAoJaWYgKHJlcyAhPSAtMSlcCnJb
N10gPSAqKHVpbnQzMl90KikweDIwMDAwMDAwMDA5NDtcCi8vICBzb2NrZXQkaXNkbl9iYXNlIGFy
Z3VtZW50czogW1wKLy8gICAgZG9tYWluOiBjb25zdCA9IDB4MjIgKDggYnl0ZXMpXAovLyAgICB0
eXBlOiBjb25zdCA9IDB4MyAoOCBieXRlcylcCi8vICAgIHByb3RvOiBjb25zdCA9IDB4MCAoNCBi
eXRlcylcCi8vICBdXAovLyAgcmV0dXJucyBzb2NrX2lzZG5fYmFzZVwKCXJlcyA9IHN5c2NhbGwo
X19OUl9zb2NrZXQsIC8qZG9tYWluPSovMHgyMnVsLCAvKnR5cGU9Ki8zdWwsIC8qcHJvdG89Ki8w
KTtcCglpZiAocmVzICE9IC0xKVwKCQlyWzhdID0gcmVzO1wKLy8gIGdldHNvY2tvcHQkc29ja19j
cmVkIGFyZ3VtZW50czogW1wKLy8gICAgZmQ6IHNvY2sgKHJlc291cmNlKVwKLy8gICAgbGV2ZWw6
IGNvbnN0ID0gMHgxICg0IGJ5dGVzKVwKLy8gICAgb3B0bmFtZTogY29uc3QgPSAweDExICg0IGJ5
dGVzKVwKLy8gICAgb3B0dmFsOiBwdHJbb3V0LCB1Y3JlZF0gXHtcCi8vICAgICAgdWNyZWQgXHtc
Ci8vICAgICAgICBwaWQ6IHBpZCAocmVzb3VyY2UpXAovLyAgICAgICAgdWlkOiB1aWQgKHJlc291
cmNlKVwKLy8gICAgICAgIGdpZDogZ2lkIChyZXNvdXJjZSlcCi8vICAgICAgXH1cCi8vICAgIFx9
XAovLyAgICBvcHRsZW46IHB0cltpbm91dCwgbGVuXSBce1wKLy8gICAgICBsZW4gPSAweGMgKDQg
Ynl0ZXMpXAovLyAgICBcfVwKLy8gIF1cCioodWludDMyX3QqKTB4MjAwMDAwMDAwMGMwID0gMHhj
O1wKCXN5c2NhbGwoX19OUl9nZXRzb2Nrb3B0LCAvKmZkPSovcls4XSwgLypsZXZlbD0qLzEsIC8q
b3B0bmFtZT0qLzB4MTEsIC8qb3B0dmFsPSovMHgyMDAwMDAwMDAwODB1bCwgLypvcHRsZW49Ki8w
eDIwMDAwMDAwMDBjMHVsKTtcCi8vICBpb2N0bCREUk1fSU9DVExfR0VNX0ZMSU5LIGFyZ3VtZW50
czogW1wKLy8gICAgZmQ6IGZkX2RyaSAocmVzb3VyY2UpXAovLyAgICBjbWQ6IGNvbnN0ID0gMHhj
MDA4NjRkMiAoNCBieXRlcylcCi8vICAgIGFyZzogcHRyW2lub3V0LCBkcm1fZ2VtX2ZsaW5rXSBc
e1wKLy8gICAgICBkcm1fZ2VtX2ZsaW5rIFx7XAovLyAgICAgICAgaGFuZGxlOiBkcm1fZ2VtX2hh
bmRsZSAocmVzb3VyY2UpXAovLyAgICAgICAgbmFtZTogZHJtX2dlbV9uYW1lIChyZXNvdXJjZSlc
Ci8vICAgICAgXH1cCi8vICAgIFx9XAovLyAgXVwKKih1aW50MzJfdCopMHgyMDAwMDAwMDAwODAg
PSByWzddO1wKCXN5c2NhbGwoX19OUl9pb2N0bCwgLypmZD0qL3JbMF0sIC8qY21kPSovMHhjMDA4
NjRkMiwgLyphcmc9Ki8weDIwMDAwMDAwMDA4MHVsKTtcCglyZXR1cm4gMDtcClx9XApcClwKfQ==

--------------V2zheg0WWtioRTaAiSzxveBT--
