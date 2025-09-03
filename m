Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC87B41F67
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F1910E21E;
	Wed,  3 Sep 2025 12:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fZfvQtrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCB810E21E;
 Wed,  3 Sep 2025 12:41:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpzBGF3ODk6+nV2JIpF4zurPF7WFZTjIv9hYK1PVDOSRs9h6PksxQ3NNEWln69YCr/x9MnvArSgZcd9KcTcN4rfeNQiMZN1UHzQwbIA35ihqrQv3HKefxKPm6/muZx26ZLjAlI/vNdHpoCjchS7ITO/rEo0aDCOn8oX7Pu8OcwYW39ml2g8MaDAVMGNbLeCclooZfgLB7EX1wHqzuyt0xnIBijEJ2sIdEWYFMbURDQSfY+WlmID2OIVRl+qWPNHVJ6o60o5/OWYrvUsscPCVrDZW7qUeAAWyZ+P3UV7Crd+nbad3/9TfwDH3jvjpHb3G6dYYxP2Br4Q0ahnim/Kd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cM2WvBDeLCntaR1z3GmV0jCmCNhCxZ24thrPPxh/5qs=;
 b=ZNQivtnmvXzyJhgBpZ8XahfEpTELXzbYPgtfWgx4lR3T8oCEXqsNgwGjV72bw6xzxZIXoaVXnwfvIdCN7Dr5q7jbJwfhMsbwRaSNRq6wJExfqMopXiNK8pw9fIiO8GEQbEaiH55b8S8SVKlb+zbpm96kQqc0US9EMcGMNYnOZWs8ArfLyVRe3m8kaA3TBo1eAlqaPIK76PyJfGT894uHH3yNf564ZmWKuCFRC5gw5lEGfZqUPzGXqAhzNytFoavRVfZRHF6UP7byxB18IYEZIOViz2hcdZVjxRj0ZLmd1+UGK9+0Z5jHY6ehizZu2sorfUCmuL5TMhS/k8PmVAX3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cM2WvBDeLCntaR1z3GmV0jCmCNhCxZ24thrPPxh/5qs=;
 b=fZfvQtrphZlGCU5eyEdj/tj7YqKlP4lvV+URav7ZmA5YD2tRnfMmC6ot6g+bnBqtzIYwq68gMDNCJV0dHIjLaacizDXuOLCs+SFAjfDqiofpzWUrYjD8e/5PSCRzGWd8AZ0WerQFEKEe5q9QomROeup1ZDow9x9LbCPVTIZKSdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 12:41:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 12:41:50 +0000
Message-ID: <3dd20bc8-f258-40f8-9b91-ba3d77ce6bc8@amd.com>
Date: Wed, 3 Sep 2025 14:41:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm/amdgpu: Remove redundant ternary operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tao Zhou <tao.zhou1@amd.com>,
 Xiang Liu <xiang.liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>, Sunil Khatri
 <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>, Felix Kuehling
 <felix.kuehling@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>,
 Kent Russell <kent.russell@amd.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Tim Huang <tim.huang@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Natalie Vock <natalie.vock@gmx.de>,
 Candice Li <candice.li@amd.com>, Shaoyun Liu <shaoyun.liu@amd.com>,
 David Belanger <david.belanger@amd.com>, Emily Deng <Emily.Deng@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 "David (Ming Qiang) Wu" <David.Wu3@amd.com>, Leo Liu <leo.liu@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>, Mangesh Gadre
 <Mangesh.Gadre@amd.com>, fanhuang <FangSheng.Huang@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250903120449.380087-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250903120449.380087-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR12CA0015.namprd12.prod.outlook.com
 (2603:10b6:208:a8::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 966a6bdd-acc8-491f-7967-08ddeae740d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGJpTzZoR2p6OTBZbU12Tkk4cUFISGFFRGZwNjF1MVZFTDM3YjNvUjFaL0xv?=
 =?utf-8?B?dy9ucjVZdkxMSUVzVEN2emFsdkhZNml2bGpiQzlTUVBIWGUzNEtuRTdpV3Bn?=
 =?utf-8?B?ZmlCM214aHp3d2wwdnAyY3NIRnlwd2FmSXRaTGNsVVFuSHArZC9EZjUxV0I1?=
 =?utf-8?B?eDVrSUEzNXFrWTljcGM1R0JwR1R4aDB1dXI3cGNsSjZRWUxCa3BHYnRKZzhQ?=
 =?utf-8?B?QlcvV0t6ZnBFWHZkVmNxSURjOElXWWppbnpKTk0rZWVMOEFwZGVKYTRXWGtC?=
 =?utf-8?B?S3FyZm1CRWZVcExNU0ZxZmd5THJlZ0E1ZGdLWlgxQS9JTlM0Q0MyYTlKcXcx?=
 =?utf-8?B?cDlBQm9hQ0Y1clNUS0htQnlQamZtTkNxbmM5SDBDeWpoMUE2aG1MMmlRSGpD?=
 =?utf-8?B?U2I4dFNoZG5zTjFzT0lreU9QWUlkT0NKcUZ5clJoODNnTTBLWlEzekxHSDhu?=
 =?utf-8?B?MmlvYjlFRURTRFFmRWlKeVQ1bTdHZ3dOKzR6SHJBZWpCQWRqUUNWdXlOYzBi?=
 =?utf-8?B?ZG0xSmRwNWpyUHY3R1V5NmQzL2d6NmRPVHN6UzlLTkRJU0F0Z2syY25VVVpx?=
 =?utf-8?B?ZCtHcDBIeWRkUUxLMTRsNUw2WG8yVTRmMGhBYk1NSDBOK1h0bVE3ZEVQODJl?=
 =?utf-8?B?cnB3YXBBMjV2ZDFsc1I1K1RUNWFNU3JUNlJhM2hvVlNFN3pXbk03eFh2aU5R?=
 =?utf-8?B?b3Q2WTFlMkNQR2VxaGFnMk4wYjBRYTFtYTlaMDJOcWUwZUhldFUxcE4ySStG?=
 =?utf-8?B?YkhqSE51SGNWZXM1bGdOUUxtOVAyUVZZS2RSSlVKU0d6THdHUHlpRmRhZEo4?=
 =?utf-8?B?b1QrMmxpZnhXWjQ1Z2FwWmNFdVo4UXB4NURjZjRYUVpGVGVLZXR6Y3FubDc4?=
 =?utf-8?B?bkNpWkJ4NmNPWWFBa05NR2htRWV1bXhTU3ladzdqTGt0OUVlNVQwOTRvN01P?=
 =?utf-8?B?dDNJdTIwdXF1RmY1RDlBenlqWUxsaGJXTUZ6RjA0TWYrZEtnMHdNQ0ZaM2Vv?=
 =?utf-8?B?RzBWRG1ZcDFYa1VtUURqVG1YdnlTU1BweVdrdjZuYVFaMFR4Yi9QTUU5T3Fs?=
 =?utf-8?B?YUhSai9LN1pyS3dmenpaSnFpeVNxaEJpRnh1Rlp4YS8raVpUL3o1T1BtNm5Z?=
 =?utf-8?B?S3ZQTndtaUxQQWhqbnZXVmhkeW5oS1dnUTNBVExJNlg4T2VvcFpIVjV3NGFo?=
 =?utf-8?B?cFdwVjNTc1I4enMyalhobDNPaEZKZSt4cmFYcTlYa0tBRWpFa2EzNFJzODgy?=
 =?utf-8?B?aVUxbVRLc3dGOG1GZzFHYkE2ZktLQUp6aG1GL0FPeDA0ZHkvLzhGdFROVHZj?=
 =?utf-8?B?SkRhemhFazd3d3dzMmxuUytpaUNlNnFHY3ZoOUxubFZDZ25kNHBDMVpnTS9D?=
 =?utf-8?B?dXZ5V3VObE1OSFgvd29tbEw2TmdqNC9VUmcwZTlMQ2RHZ1RKN2tuaDdNemhi?=
 =?utf-8?B?SGZTbG44QnlhNElzYnI1NzMrbFM3YWFyZkJhR2dzVC9IQVdPQUlHbGhIemUv?=
 =?utf-8?B?UTR1WmhkS0NPTzl1Z0paR1ptU080Rmx4WVdNQ0NmTEhaVlRwOHFpN1VzQzRR?=
 =?utf-8?B?YlV0elRORzk4QzZiT05CRGRDZFVtVXF3dVFZZWtuQU1nUmpRVDJUN09IWXJD?=
 =?utf-8?B?dXp6b205aGtDdFdnVHExUWhQN0tSSWRQajd1dERoZm5lRDBVemkvSkhkV0Nv?=
 =?utf-8?B?UTZwWnBKV2tsa1pMZEQ1SGVydEIxQXUwVEczN05kZkpJR0Q2ZHJ4K2N1TEkz?=
 =?utf-8?B?YUljQjN2Rkt2cE9kZlY1bTRhdWZhT0NnamNxejVHTTFoT0hsSUNIMks5ejh2?=
 =?utf-8?B?Y3RxZ1pLck5iVTkybDArWmExNkdCNjNnTUdkK0dlTzkxbGdYNW9YTVFkNXU0?=
 =?utf-8?B?cGcveEdmaGM4c3ZFMTA3L1JyV2VCeFlyVUhvZi9BV25zbDVqZFVkenJzUStS?=
 =?utf-8?B?T0dmNStoeFN4b2RRajltMDZrYk9nazBtMjdNR0RyYkFtNFh1SSt1V2RxY090?=
 =?utf-8?B?VkZ5dTVXc1JBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5ncC9qQTV3WnpIYUNYNVdCOWRqSG9iV3JEWDhmN2RzNDJGZURld2gzVC9a?=
 =?utf-8?B?L0hObTRhcXlNdU1CdE5NbFBSMGVqaFRTVnFwRVlGd3lodkV5WThjcWVFanQw?=
 =?utf-8?B?ZlVxZzVUUkRDSGhyMjZ3YXNZc3dnREZNUUs2QW1KVmdFTkd1QWdxcWN2RXRv?=
 =?utf-8?B?R3lyQ25pR2lOQ21vYlErVzhpWDBJY2NUYy9CVGxqNkZGQkF2Zlg1ZlJrcUxk?=
 =?utf-8?B?bWNra3lTdlhNazdTend5dVdDdXZqdGN2MTkwcFJvUkJTT1RQaTR2T2orbXlN?=
 =?utf-8?B?RkMvSmY5STBJSWFKUVZQVnNjbmc4L3hmMllpTDUzL255N29RZDRMMFlOc1NV?=
 =?utf-8?B?eGRJbE9FNEFZdFhHSi8zczlJeC9HYnRvU3hkMlFzT3ZHM05jb1JqZkY3WTUz?=
 =?utf-8?B?cFU5MTNoM2VTNm5OOWJEVmhzaTZSRStoVlpBQ3hrbnF6L3RMcklSV1BPTVAw?=
 =?utf-8?B?MlZua0dQLzNxOFV4dkp2OHlPWnpmdVR5YThxRjJyV094SDA0ZHBOWDNUdnlu?=
 =?utf-8?B?b0dtN2J5YTRyWkZSS3Y5OVpCQVBFcXBXSElUK3Jza0JuM0g2WjRQVnovTlRD?=
 =?utf-8?B?NVdLa21CM1pVaUxCMVR0NkQ2R2VWTk9FK3Rna1NSWWY1ODJKZXl5QUhSYUVy?=
 =?utf-8?B?ek9PV0svaXE3WXk2ak9ZRnJabERvNzB6V3NuSkp1WkpFS09iNzk4dHlXNEdT?=
 =?utf-8?B?Q0pQUzMycU9wZ2lEbDlPaitPWmZhcEdsand3WlpSSmtLUXdzUUtqZ1hGZm9M?=
 =?utf-8?B?M1UxRXVTQ2NKQUtybGoxZzIzSC9SV2NkUUNidERjTGNJN09GeTJ0dk8rRHVP?=
 =?utf-8?B?ZG1GakdZTDh0UkRRK0U4QXlocllMMEdiVlg4Y21JV3gvUUYwZVQvNTVzKzh4?=
 =?utf-8?B?MkF6YmNiK1gwKzQ2STZMeGpoMGRTOU9tdkJxRHBJVG5wbjFWOGJFNlFXa3J2?=
 =?utf-8?B?OVJnVE0wSlZqMHpTQnhrVWU4bmdLTHBaYm9Ob3ZmaHl3TG9mZWdPSG5qMXBy?=
 =?utf-8?B?eDlLV2JjNXNLV283bTZPU3k4K0tlZE5vNGhTcktOWDNyM1ZHZlhtWnVpR0ZN?=
 =?utf-8?B?L3Nocit4RW0xRnU3U1p3dHZHdjUrQzRzRWtZc0ozak0zL1pFaU5xeC9YaWlE?=
 =?utf-8?B?VEhpK1pYa3pscUNoR0oxSFVVOGFYdC8zVUxFaC8xZGdwRmtVUUM1WHBSZXFF?=
 =?utf-8?B?bEtHekU3ZkgwU29BUUUzMlBMZHlROFZMZ09GcjBNZTZpZ2pUQmwrZ2JUZG1n?=
 =?utf-8?B?VFFSVzdVNzlRSmk3MGhBN2VDNnB0cjg4dittWE5mQ095d0MxNDRUZEJMVmNm?=
 =?utf-8?B?S042bzB3V3hhYnUyTC9NR1p1TEU0dmw4dUhtUVRoZlU4TDByY1FJdngwcmpG?=
 =?utf-8?B?OUh3VU5JQ2FEV2hDMUhBRk83V1NPYlFPZ3hLenZLdHdMVFh3VkwyWENzMDRT?=
 =?utf-8?B?QTBYa2M4em9xaDJtRlVuM1IrZjhZVXpwNHRKVnorbGkxa3NyTFZIVkdFaTE2?=
 =?utf-8?B?RkhIV2FkeE16bytKN1VWSmVqSDQyZUF3WlBrSkk4MDFaQ3BRWTBmcEJGTWNE?=
 =?utf-8?B?NHhkWnFXNW5weTgrcjVzT3o2eDFpcDBXbnBjNnJkOGo4ZnNkbmZUQTN3cFVk?=
 =?utf-8?B?UnFDaG5WU2dQbkpZS0ZSYit6YnJEcW53WThJOTlmb3VkUWhGd0NkS3dWNUdz?=
 =?utf-8?B?alNmUHg5eDlwUjZYS3VPY1l1OUtrdDhFK3VHUWlGQ2t5Y2dqRi9pT2hxYllq?=
 =?utf-8?B?RWdhclZJa25ST3ZXZ0paV294UFB1MW5NRnhVSWpJblBHNGRDZThKVjdsZE1U?=
 =?utf-8?B?NzFLc3krSGl4M0l2b0tmcjJLVDNrZlZwdWtRWTVuM0hmNUpJRHYwQ21PV3hF?=
 =?utf-8?B?dCtiRGJRbjhwSWU3dTFBbjNBNEdBdjZzeS9pNDJXUGtQbEZXN3NBZTdXM1Zu?=
 =?utf-8?B?Z1NWY3BzVXprMFYxMlh5ZDJEQmlQVVFlYW54VlM0SytwMEJnUnNaTFVvNG5j?=
 =?utf-8?B?YlB1b05lMVJDZlRGeG5FQXR5a0FmRTVjTzAvbjdjUnZ6bERMT096ZWJlcmFt?=
 =?utf-8?B?VSs0Yzhxdk84R3h4b21sZXpUelNzbGllS0tMMXF2Zk1CYjkwMEM5aCtDUHBJ?=
 =?utf-8?Q?BQNmZ4ck6PlHR6i2PsC3qUyJc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966a6bdd-acc8-491f-7967-08ddeae740d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:41:50.5216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDIZUeuQWiFup3k8ORevhkxK6AkPW+m6bhZrE2XNcbF1qYaVoiQLGbUJqe+sw77n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365
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

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.

On 03.09.25 14:03, Liao Yuanhong wrote:
> For ternary operators in the form of "a ? true : false" or
> "a ? false : true", if 'a' itself returns a boolean result, the ternary
> operator can be omitted. Remove redundant ternary operators to clean up the
> code.
> 
> Liao Yuanhong (6):
>   drm/amdgpu/amdgpu_cper: Remove redundant ternary operators
>   drm/amdgpu/gfx: Remove redundant ternary operators
>   drm/amdgpu/gmc: Remove redundant ternary operators
>   drm/amdgpu/ih: Remove redundant ternary operators
>   drm/amdgpu/jpeg: Remove redundant ternary operators
>   drm/amdgpu/vcn: Remove redundant ternary operators
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c   | 3 +--
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c   | 3 +--
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c   | 3 +--
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c   | 3 +--
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c   | 3 +--
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c     | 3 +--
>  drivers/gpu/drm/amd/amdgpu/ih_v6_1.c     | 3 +--
>  drivers/gpu/drm/amd/amdgpu/ih_v7_0.c     | 3 +--
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c  | 2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c  | 2 +-
>  14 files changed, 14 insertions(+), 22 deletions(-)
> 

