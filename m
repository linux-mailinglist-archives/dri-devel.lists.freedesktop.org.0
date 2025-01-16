Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C6DA13D5A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D811110E9AA;
	Thu, 16 Jan 2025 15:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yDLocEsr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFCB10E9BE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:13:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MThkU9+xApNlQZbAk7Odc5VwhHu/lYX15/JGFmaQjHD8cC4b3HXkE4W0Agc1HTMAqQk8bHRMSmPsWpoac7emqnr1TAqXEGeSrgDH0YanKD+OmRNRaoXCBCD/pacYsJYjuxyHy3iAAxXUaU9jUUGgTUkHEYIX/R8G6dKxnqiGf8X8fN4M3I/14xpWv5W2xMfcd2lvzAG8z6xR9BbpNYskVAS9eYwpBNqYcE5HOYTy/m+fOudLAbwOinNrFyI3bZ6+qZuegYfBhArZjEcDwK0JrvEZeaCR5e+EMPuZV6RhQ1H9Up0GJl6DEltcyNARhNgEBKQjopZtv1VRuipPTinDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQe8DQCmaKUR51cClzvBfb9rxTZyj76K/pOj/O528gA=;
 b=bGN3VRv7dpO41Rhv+ZW2r5AQMZ0RtFEEDiSv6V3M7E8F7FmwXnXahuO62dg4afNAAf/W/RkBABHror10z+jOYyVQ2slWrQSWPePHnYLPISyNn/E76tP7WMah/mg+mgIMckYt273beQJjoM0m2hjFgSdE2L1pVaRf0J8QnJdgSMwmGoYysxWB0nx8rTOLdMCsoZBL/00AdWaOnhKYD7ihM2dZiUL66N/Ts9a+l0UPXAL9j3dZR9JYWVFtAezdbFY9VnLr8hj20bW/m79UmoAivF2sRsmFXu9SvaUN0ccLss2zl/KZ9P6UcEjiUOyLpuf8cSxL04KuhTowHNi7P8s2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQe8DQCmaKUR51cClzvBfb9rxTZyj76K/pOj/O528gA=;
 b=yDLocEsr980+T9u4NcrahsotlItueIAS1eD5VoNDKofHY7DIPXRMNfYUCigWmYEB4n2tVhz3OJTMIpITLmYodQcEdqQfUYcv1tq15zm4dWYdFbj1KxElG46/LPnIogZrDmEyZ1YYbfTSE8Sl51g4Y9Jh39d9CwmZ/KPiGHCMtlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 15:13:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 15:13:21 +0000
Content-Type: multipart/alternative;
 boundary="------------3JcRMxo117jEQBwiUqnybST5"
Message-ID: <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
Date: Thu, 16 Jan 2025 16:13:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
 <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
 <20250115170942.GT5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250115170942.GT5556@nvidia.com>
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 93277e9e-108f-453f-8f8e-08dd3640509e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N29YK05QRGtlcnpVRkp3WnQ5UUZvNXd0My96MFRuTXp1ZEtzZjQxY005YU92?=
 =?utf-8?B?WXJJa294dEx5WlJVZlpBUW5Mbk5vL25DVG9BN2NpcE1DSkQydkN4YytBNE5V?=
 =?utf-8?B?em9sdVM2dEkxZnFNVkk4dUp6b2FSSmxSRFBLTFFicGJ2eEVVbE14Q2dQNWNB?=
 =?utf-8?B?N2J0R3NJeFllQURnaUpSQytZdjRoSlhaWjdjanFSNytpaUxQaUIyeE9meTBa?=
 =?utf-8?B?dmFCdVF2KzducFZIaG1QRWFlRlZpV1huaWplQmlLWFN0R0lFZ3B1ZnAzS0xF?=
 =?utf-8?B?MEIvM2MyYTdVQUhlSGZ1TjFTTmRlVGFYNjhjM1pHZ09pR2drQUtYTmRiSDRT?=
 =?utf-8?B?Yi9qMUR1dnNIVmZ3dnhhUE83R0N2QXRwK2xtQUQ5RDFubGt5QVpxNDloRGZL?=
 =?utf-8?B?OGUxM2p5TFROY0MzcFVVVWNZc3NMenVDT1A2N214dTFNWmdJTWRZQXJMcXJ0?=
 =?utf-8?B?THRwNFd4MFJzTmRwa0N4MXdZaHFoQnFHVjVnWFdHaEF3M296bE8yNTNKNGY0?=
 =?utf-8?B?M2t5UHZCWHdROStTZnlHQUQ0Snh5QUppWDlzcVFFSUVFZTN5WWpqNzVoZnAx?=
 =?utf-8?B?L1ZRS2pFMHdRL2hlZDdMUzZPWWFTVkszSDR5OVZWZ2RjOXM4d1VteVkwTjlV?=
 =?utf-8?B?MHJmL3pKYlptWWFJTTlMMkR5RVBrMWxnUjJpM3UwcHJvMnpJL2FPVzBpeThR?=
 =?utf-8?B?eTlZVTNNVlcva0lZcWZCSkt2TGUvVXFkdmFyVEx5SnJBYkNLQ2Z3ckFtcU8y?=
 =?utf-8?B?TUJzRHFva01ncDdTZXpZak5OTFp4QTZ4ckFjU1JaSlM4a0RIU2V3U1RPVEFI?=
 =?utf-8?B?OHJsM3VkZW1sMHFCdVlzNDhmOS8yanl1QnN5a1pFaE1IM3VpY1FHdFkyaTNz?=
 =?utf-8?B?eGNUWTZybklZZkJDSm5SOUJsRUwvNXBtdytYOUhXY3NnRksyTGJHYllBWXJq?=
 =?utf-8?B?YzFvSjRwQklyRlFxOUpHek5lc2Y4SnY0MlFDK2ttMXYrWXAwbVBwaldLWFJC?=
 =?utf-8?B?TG5NaytlbHR4Zmt1ZnAvdnZOYVhsMHlUOExxVDc1OFY4WUNOV1RzdFFSODJh?=
 =?utf-8?B?dmhtMXRjK1J0WXJqNFhuL3VPQ2syaXRkK2MrV2orblYrelRvQU1KQmZpblRQ?=
 =?utf-8?B?a2VlYU94THdDNnlZVXI4aG5yNVZlaDIveDFYaVVvbUZoQ0U4dUxlT3ZnVkc4?=
 =?utf-8?B?bnFBU0ZwRHh2R0VBZUZ2RjF3WVNSdEswM1JlWVp3T1Q3K1dXY3k4QW9rWExx?=
 =?utf-8?B?UnM3RFplQUt6UmdNNzh4S0IyRGUyU0s3anhrdUEvN3VOQlFDY1dObURIZjJz?=
 =?utf-8?B?czYrWlp1SmdrYUlPUlczcjlIem1rY29lK21BRmthSFRFUkEyZUFqNXZocDRi?=
 =?utf-8?B?d1pJcXBuSkh5Q2tNYVgwSW44WFNVRTRhbjhPck9jVnJWdTE4a1RHeUVENzlt?=
 =?utf-8?B?OUt2R2pST2M4SnYwaFZjUkUxS1B1TEhQUTFGbU4zMVBKMGFDWXpXQVMxWE1h?=
 =?utf-8?B?TlFQUzRzUTdTY0p5VmhDYW90ZGszQ3RlMzhrL20rWExhdks0MzlEQzUvam82?=
 =?utf-8?B?NVhTWTNlZkJmZk9Wc1hoOUdSTjcwamRnQWtFa2UySUpjOEdqS3dqdkpZQzgx?=
 =?utf-8?B?N21tTWJzZmkyY1hHeS81Q1lLeTRSOWtJNHkrQW5SdHNkVkE5blpwbjVsMkVV?=
 =?utf-8?B?b0ZINmY4d2RmdEVEcEtEZzVTWG56V3JrSDJhMnRHdlhjdzJqL3MzbE50VGVi?=
 =?utf-8?B?TjVHL281MUpYWnVkb0VOSENrNDgyU0RyYVdtaFg1MjVBa2xlRitrc0srMjhO?=
 =?utf-8?B?dFVTQmhhWHFCOXpWMG5aWVBadHhpYjgxMEt2Y05jUHkrV2M4ODArY09TNDE2?=
 =?utf-8?Q?oy4/2s+uwaJlm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJveC93UzJGZ0RCeExUZlZFeTQ0TEVPZHliTHlYVFNXV1FzMG1wOG1nNTZK?=
 =?utf-8?B?Q2ZYNUI0eGQ3M2NHNUdIcWoxQW1ydW9KVC9kZFE0TitSbGtSQ3dza1lpaDk1?=
 =?utf-8?B?UDYyWlpHZDlHUUF6cVU5UWxmMmZLd0dGaUhJSTRwaXR1dkxCaFJiOUdrcm42?=
 =?utf-8?B?RXd3eWF5U0NQWWFhQUkzcDFvaHlNRXJRamROaWZxSUh2WnJGSDZmRnByaFcv?=
 =?utf-8?B?bGg4WElqSHFVZlpxWTVJOHJ5U2xvcm1jaE1nQzhNYTZIQno5NkFoRWZ0Kzhs?=
 =?utf-8?B?Z1RSMzY4dUxiQ0IvRUVJeGZYOGRpWTJyQllBdHFtUWpxTUYrQnRTY1JCbjFW?=
 =?utf-8?B?MCs4aFBYVktjTEZmRlNhRDkzbVJaZFJLMHJsTmFMdjM0WGtNRjBGbGNlTlNv?=
 =?utf-8?B?NG5Wb1RCVmZWZkpaWFh2WkhGemorMFNrLzZ2dldwZmRrZlVreG1iVUtaUmZn?=
 =?utf-8?B?UXkyMitoY1piMGJjSkUvQjQ4cXRDZmRGWWhXbjlnWnFtaXA5RFA1U2tYaDE3?=
 =?utf-8?B?S2gzekl5OFVNenE5ZnNmRFhRUFNHbzAzTC9vTlZBTkw2ZkVDS3o4YkpFTnE3?=
 =?utf-8?B?VExVQ3FXeVNpQ2ZMQUcvOVRHeXlGSzBjd0Nmcm1nZmlDKzV3RnFqeFRWOG1H?=
 =?utf-8?B?OUc5MmdueGk2VWFvS3p4QnVEdTZGQjNpVUdCVDdpRXkxZkY3eUI2V0pBZ2U0?=
 =?utf-8?B?UVVXTDN6TDR0UUcyc0VyT3IwQzVTd0dDTWNJaDhOT0NYREpBcXpaakpZVTdo?=
 =?utf-8?B?YjBDeFg3a1R0OU1JNXBkY0ZtT2hXSDBFdXNqYUpTTFZXdmQ3dnFtblF5d0l6?=
 =?utf-8?B?bGppYkYzcFN5dFgvNzd1RVZNU1Q0ZzV5cU9VM2hYZHJMaHNHTGgxbmhHTUxx?=
 =?utf-8?B?MjdIeDNuQkw5bVpDYmx0TXZENTJvZkxkQmMxSkF2VEk4MmNRb3RpVXl3c2RY?=
 =?utf-8?B?NXlHWTdoNENqcDNTNzlCczNEMmdoL3VxVWcwcFNkZWVZRFhlWDVqbjB5dnZI?=
 =?utf-8?B?Q21pS0UrZGtPU2d1djZpMURycHdzdmUxQkQ1ajdrYWU2RGpyUFRKcDBkK2lo?=
 =?utf-8?B?c0dzUVowV3hZRmRZdVYxUjcvcVNiMDE4djVrdk5QTXh2aitmTjRiMHQzTEJI?=
 =?utf-8?B?MmVXNDNabElIbDBFcTVrbGZ3NlA5RUVkcTlMNnJmTmYrQXNKZVFMNmZKcjc2?=
 =?utf-8?B?R0N1cnJrUnVIcDJSbTltelp2V0VrRGRKTnJEVjdRekZJWnhOQlN1K0RZTDhN?=
 =?utf-8?B?N3pkZHdib0F5UjFuTGozVXVtWW5sdVcwRDNMU0VPOUhtb1VHcEpGbHFJVGJR?=
 =?utf-8?B?MmZ2dDM1M0JWd2VVRXo0UFowdzFaWm4zakhqc05Dcll1K21tdnV4VnFtNkt0?=
 =?utf-8?B?WTJTRmFtOVVaQ1ZZRDVNOEpIMmNTRllNMjBWSEhkMzV1WlJ5Wk1wRFFuRFBx?=
 =?utf-8?B?cVp5YkhmbXA5bzVUZ3kyRlRzQXdhWGFSWnJLVWFIR3pxcVFSWkptTlN3aW1o?=
 =?utf-8?B?clB6LzBkUWp5Z0kvbzRjTkZDbXBpSmtmK3NXY1RPSUtTQTF4aXcxN2NNaVBh?=
 =?utf-8?B?RzYyb0QveDA0UmRPSzFsRS85eVBJMDROdTRuZC9nRXEyaXZCZHQyWVNmRUQ1?=
 =?utf-8?B?TlRVN3cwWTFzQ2szbk1YZGNkZ1VpSEplUUtFR1prQzNsYWgwQ3FXRWpTVVhx?=
 =?utf-8?B?a1RzSlNPSFIrYkZST3Nwb3VuUW12NmtwOWhodVpScStLOUlxSXN2NXNTbjY0?=
 =?utf-8?B?RW5XZ1B1dkYxRkxqYWFRZVcvNDFkNnJQTFZqYjVObiswRVVyZUs5eXNhSmcz?=
 =?utf-8?B?U0YwbGw5NStnbHN1dEUzRkVNOWtZL0xRclNRR3pGa0UvM2ZZSG5VT3JGQnJi?=
 =?utf-8?B?dnFQZitJT2lHUi9CS3IxWHJtbTEwaEUwSUFkM1MwbVZiNm9Cd3B1OWZhNStp?=
 =?utf-8?B?TVF4UXpPd1g4ZDE1UE1hWFVxWGMydnRFU3FtS05KY29TTVF3SjNyWU1nUzF6?=
 =?utf-8?B?VERUTGFZRStJbFJ0VVZHcTUwUkEyTUNKOVpSTnhZT3FvRUY5R0I3dXpmc2NB?=
 =?utf-8?B?eXFyS09VODFTQmltZ29SSkhnRjEwRkYvN1NKV1NlWFpTZjlnczUwdXpkekRy?=
 =?utf-8?Q?QOUA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93277e9e-108f-453f-8f8e-08dd3640509e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:13:21.6452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GauNjpvgfRxhYQSWX5J6Ujlbtharekppi5WnuRET1R9n76YKVgU/amPRFYpj4MiW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341
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

--------------3JcRMxo117jEQBwiUqnybST5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.01.25 um 18:09 schrieb Jason Gunthorpe:
> On Wed, Jan 15, 2025 at 05:34:23PM +0100, Christian König wrote:
>>     Granted, let me try to improve this.
>>     Here is a real world example of one of the issues we ran into and why
>>     CPU mappings of importers are redirected to the exporter.
>>     We have a good bunch of different exporters who track the CPU mappings
>>     of their backing store using address_space objects in one way or
>>     another and then uses unmap_mapping_range() to invalidate those CPU
>>     mappings.
>>     But when importers get the PFNs of the backing store they can look
>>     behind the curtain and directly insert this PFN into the CPU page
>>     tables.
>>     We had literally tons of cases like this where drivers developers cause
>>     access after free issues because the importer created a CPU mappings on
>>     their own without the exporter knowing about it.
>>     This is just one example of what we ran into. Additional to that
>>     basically the whole synchronization between drivers was overhauled as
>>     well because we found that we can't trust importers to always do the
>>     right thing.
> But this, fundamentally, is importers creating attachments and then
> *ignoring the lifetime rules of DMABUF*. If you created an attachment,
> got a move and *ignored the move* because you put the PFN in your own
> VMA, then you are not following the attachment lifetime rules!

Move notify is solely for informing the importer that they need to 
re-fresh their DMA mappings and eventually block for ongoing DMA to end.

This semantics doesn't work well for CPU mappings because you need to 
hold the reservation lock to make sure that the information stay valid 
and you can't hold a lock while returning from a page fault.

In other words page faults are opportunistically and happen in 
concurrent with invalidation, while the move_notify approach is 
serialized through a common lock.

I think that's what Sima tried to point out as well.

> To implement this safely the driver would need to use
> unma_mapping_range() on the driver VMA inside the move callback, and
> hook into the VMA fault callback to re-attach the dmabuf.

Yeah and exactly that is something we don't want to allow because it 
means that every importer need to get things right to prevent exporters 
from running into problems.

> This is where I get into trouble with your argument. It is not that
> the API has an issue, or that the rules of the API are not logical and
> functional.
>
> You are arguing that even a logical and functional API will be
> mis-used by some people and that reviewers will not catch
> it.

Well it's not miss-used, it's just a very bad design decision to let 
every importer implement functionality which actually belong into a 
single point in the exporter.

> Honestly, I don't think that is consistent with the kernel philosophy.
>
> We should do our best to make APIs that are had to mis-use, but if we
> can't achieve that it doesn't mean we stop and give up on problems,
> we go into the world of APIs that can be mis-used and we are supposed
> to rely on the reviewer system to catch it.

This is not giving up, but rather just apply good design approaches.

See I can only repeat my self that we came up with this approach because 
of experience and finding that what you suggest here doesn't work.

In other words we already tried what you suggest here and it doesn't work.

>>     You can already turn both a TEE allocated buffer as well as a memfd
>>     into a DMA-buf. So basically TEE and memfd already provides different
>>     interfaces which go beyond what DMA-buf does and allows.
>>     In other words if you want to do things like direct I/O to block or
>>     network devices you can mmap() your memfd and do this while at the same
>>     time send your memfd as DMA-buf to your GPU, V4L or neural accelerator.
>>     Would this be a way you could work with as well?
> I guess, but this still requires creating a dmabuf2 type thing with
> very similar semantics and then shimming dmabuf2 to 1 for DRM consumers.
>
> I don't see how it addresses your fundamental concern that the
> semantics we want are an API that is too easy for drivers to abuse.
>
> And being more functional and efficient we'd just see people wanting
> to use dmabuf2 directly instead of bothering with 1.

Why would you want to do a dmabuf2 here?

>>     separate file descriptor representing the private MMIO which iommufd
>>     and KVM uses but you can turn it into a DMA-buf whenever you need to
>>     give it to a DMA-buf importer?
> Well, it would end up just being used everywhere. I think one person
> wanted to use this with DRM drivers for some reason, but RDMA would
> use the dmabuf2 directly because it will be much more efficient than
> using scatterlist.
>
> Honestly, I'd much rather extend dmabuf and see DRM institute some
> rule that DRM drivers may not use XYZ parts of the improvement. Like
> maybe we could use some symbol namespaces to really enforce it
> eg. MODULE_IMPORT_NS(DMABUF_NOT_FOR_DRM_USAGE)
>
> Some of the improvements we want like the revoke rules for lifetime
> seem to be agreeable.
>
> Block the API that gives you the non-scatterlist attachment. Only
> VFIO/RDMA/kvm/iommufd will get to implement it.

I don't mind improving the scatterlist approach in any way possible. I'm 
just rejecting things which we already tried and turned out to be a bad 
idea.

If you make an interface which gives DMA addresses plus additional 
information like address space, access hints etc.. to importers that 
would be really welcomed.

But exposing PFNs and letting the importers created their DMA mappings 
themselves and making CPU mappings themselves is an absolutely clear no-go.

>> In this case Xu is exporting MMIO from VFIO and importing to KVM and
>> iommufd.
>>
>>     So basically a portion of a PCIe BAR is imported into iommufd?
> And KVM. We need to get the CPU address into KVM and IOMMU page
> tables. It must go through a private FD path and not a VMA because of
> the CC rules about machine check I mentioned earlier. The private FD
> must have a lifetime model to ensure we don't UAF the PCIe BAR memory.

Then create an interface between VFIO and KVM/iommufd which allows to 
pass data between these two.

We already do this between DMA-buf exporters/importers all the time. 
Just don't make it general DMA-buf API.

> Someone else had some use case where they wanted to put the VFIO MMIO
> PCIe BAR into a DMABUF and ship it into a GPU driver for
> somethingsomething virtualization but I didn't understand it.

Yeah, that is already perfectly supported.

>>     Let's just say that both the ARM guys as well as the GPU people already
>>     have some pretty "interesting" ways of doing digital rights management
>>     and content protection.
> Well, that is TEE stuff, TEE and CC are not the same thing, though
> they have some high level conceptual overlap.
>
> In a certain sense CC is a TEE that is built using KVM instead of the
> TEE subsystem. Using KVM and integrating with the MM brings a whole
> set of unique challenges that TEE got to avoid..

Please go over those challenges in more detail. I need to get a better 
understanding of what's going on here.

E.g. who manages encryption keys, who raises the machine check on 
violations etc...

Regards,
Christian.


>
> Jason

--------------3JcRMxo117jEQBwiUqnybST5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.01.25 um 18:09 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 15, 2025 at 05:34:23PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">   Granted, let me try to improve this.
   Here is a real world example of one of the issues we ran into and why
   CPU mappings of importers are redirected to the exporter.
   We have a good bunch of different exporters who track the CPU mappings
   of their backing store using address_space objects in one way or
   another and then uses unmap_mapping_range() to invalidate those CPU
   mappings.
   But when importers get the PFNs of the backing store they can look
   behind the curtain and directly insert this PFN into the CPU page
   tables.
   We had literally tons of cases like this where drivers developers cause
   access after free issues because the importer created a CPU mappings on
   their own without the exporter knowing about it.
   This is just one example of what we ran into. Additional to that
   basically the whole synchronization between drivers was overhauled as
   well because we found that we can't trust importers to always do the
   right thing.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But this, fundamentally, is importers creating attachments and then
*ignoring the lifetime rules of DMABUF*. If you created an attachment,
got a move and *ignored the move* because you put the PFN in your own
VMA, then you are not following the attachment lifetime rules!</pre>
    </blockquote>
    <br>
    Move notify is solely for informing the importer that they need to
    re-fresh their DMA mappings and eventually block for ongoing DMA to
    end.<br>
    <br>
    This semantics doesn't work well for CPU mappings because you need
    to hold the reservation lock to make sure that the information stay
    valid and you can't hold a lock while returning from a page fault.<br>
    <br>
    In other words page faults are opportunistically and happen in
    concurrent with invalidation, while the move_notify approach is
    serialized through a common lock.<br>
    <br>
    I think that's what Sima tried to point out as well.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">To implement this safely the driver would need to use
unma_mapping_range() on the driver VMA inside the move callback, and
hook into the VMA fault callback to re-attach the dmabuf.</pre>
    </blockquote>
    <br>
    Yeah and exactly that is something we don't want to allow because it
    means that every importer need to get things right to prevent
    exporters from running into problems.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">This is where I get into trouble with your argument. It is not that
the API has an issue, or that the rules of the API are not logical and
functional.

You are arguing that even a logical and functional API will be
mis-used by some people and that reviewers will not catch
it.</pre>
    </blockquote>
    <br>
    Well it's not miss-used, it's just a very bad design decision to let
    every importer implement functionality which actually belong into a
    single point in the exporter.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">Honestly, I don't think that is consistent with the kernel philosophy.

We should do our best to make APIs that are had to mis-use, but if we
can't achieve that it doesn't mean we stop and give up on problems,
we go into the world of APIs that can be mis-used and we are supposed
to rely on the reviewer system to catch it.</pre>
    </blockquote>
    <br>
    This is not giving up, but rather just apply good design approaches.<br>
    <br>
    See I can only repeat my self that we came up with this approach
    because of experience and finding that what you suggest here doesn't
    work.<br>
    <br>
    In other words we already tried what you suggest here and it doesn't
    work.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">   You can already turn both a TEE allocated buffer as well as a memfd
   into a DMA-buf. So basically TEE and memfd already provides different
   interfaces which go beyond what DMA-buf does and allows.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">   In other words if you want to do things like direct I/O to block or
   network devices you can mmap() your memfd and do this while at the same
   time send your memfd as DMA-buf to your GPU, V4L or neural accelerator.
   Would this be a way you could work with as well? 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I guess, but this still requires creating a dmabuf2 type thing with
very similar semantics and then shimming dmabuf2 to 1 for DRM consumers.

I don't see how it addresses your fundamental concern that the
semantics we want are an API that is too easy for drivers to abuse.

And being more functional and efficient we'd just see people wanting
to use dmabuf2 directly instead of bothering with 1.</pre>
    </blockquote>
    <br>
    Why would you want to do a dmabuf2 here?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">   separate file descriptor representing the private MMIO which iommufd
   and KVM uses but you can turn it into a DMA-buf whenever you need to
   give it to a DMA-buf importer?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, it would end up just being used everywhere. I think one person
wanted to use this with DRM drivers for some reason, but RDMA would
use the dmabuf2 directly because it will be much more efficient than
using scatterlist.

Honestly, I'd much rather extend dmabuf and see DRM institute some
rule that DRM drivers may not use XYZ parts of the improvement. Like
maybe we could use some symbol namespaces to really enforce it
eg. MODULE_IMPORT_NS(DMABUF_NOT_FOR_DRM_USAGE)

Some of the improvements we want like the revoke rules for lifetime
seem to be agreeable.

Block the API that gives you the non-scatterlist attachment. Only
VFIO/RDMA/kvm/iommufd will get to implement it.</pre>
    </blockquote>
    <br>
    I don't mind improving the scatterlist approach in any way possible.
    I'm just rejecting things which we already tried and turned out to
    be a bad idea.<br>
    <br>
    If you make an interface which gives DMA addresses plus additional
    information like address space, access hints etc.. to importers that
    would be really welcomed.<br>
    <br>
    But exposing PFNs and letting the importers created their DMA
    mappings themselves and making CPU mappings themselves is an
    absolutely clear no-go.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In this case Xu is exporting MMIO from VFIO and importing to KVM and
iommufd.

   So basically a portion of a PCIe BAR is imported into iommufd?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And KVM. We need to get the CPU address into KVM and IOMMU page
tables. It must go through a private FD path and not a VMA because of
the CC rules about machine check I mentioned earlier. The private FD
must have a lifetime model to ensure we don't UAF the PCIe BAR memory.</pre>
    </blockquote>
    <br>
    Then create an interface between VFIO and KVM/iommufd which allows
    to pass data between these two.<br>
    <br>
    We already do this between DMA-buf exporters/importers all the time.
    Just don't make it general DMA-buf API.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">Someone else had some use case where they wanted to put the VFIO MMIO
PCIe BAR into a DMABUF and ship it into a GPU driver for
somethingsomething virtualization but I didn't understand it.</pre>
    </blockquote>
    <br>
    Yeah, that is already perfectly supported.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">   Let's just say that both the ARM guys as well as the GPU people already
   have some pretty &quot;interesting&quot; ways of doing digital rights management
   and content protection.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, that is TEE stuff, TEE and CC are not the same thing, though
they have some high level conceptual overlap.

In a certain sense CC is a TEE that is built using KVM instead of the
TEE subsystem. Using KVM and integrating with the MM brings a whole
set of unique challenges that TEE got to avoid.. </pre>
    </blockquote>
    <br>
    Please go over those challenges in more detail. I need to get a
    better understanding of what's going on here.<br>
    <br>
    E.g. who manages encryption keys, who raises the machine check on
    violations etc...<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20250115170942.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------3JcRMxo117jEQBwiUqnybST5--
