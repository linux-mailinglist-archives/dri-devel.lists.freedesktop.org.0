Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADB9C422F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 16:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B808510E083;
	Mon, 11 Nov 2024 15:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3vAMpA50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8537110E083;
 Mon, 11 Nov 2024 15:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6zpAfScqvO+mMSNu8dirEM/hwYuu0U52w0rziLr0lb6WKzaRVpUGuzVvdQMY/Q+nfIbbd/YqhYA5hBsqsfH8zZg+J4cMbhT46/k5/4QULccH+9MimweiUAWmhupchZa/NP/ckFZZbxyTBB4Lb0BRxGwYnCt0zFYOx++7lLclqr2ynUwNpjcbuk4ItVk765twQfPi0zqujq0JHMbKeFZHkqUSfVVNtn8u7gcfFroiyMnZ6Fq5vzLnJBOG2patQltB1p3l3Tbiw7n69NK18ZGVE93U5r2l5BsrCLvDVhg6z4zkYAa+OM8SmDX7aJ7j3canjsKkDKcbq8Q67aTTRgwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPIR9PXKqxz4e6CAActoGScnZ6gWhmBgiHlyE0Oeehs=;
 b=rlNbFH3Fb53zF4R93UlqZiOVVCdtrpr2GK/3AbxdIA5ogOPY3httl3d5g7TfLr2mj+7hd+GcWHmgBhkK6pUV+KwlMCpbV3xaL744spN8T36Lxg1rbS8zR/8xXiLaEMQ1QbC6lYTVZSyY6tzSPKf6XSNMJjjBHMEr2XSUwGYUS/BORM6wDVGLcj+rn6L17GEe1B+z3qSUO5rRlG59t8FfvrCXuSxIjsBSw1pcd9nmH17PmRof9sQZCk/OVsDQ8jCgJXghFv766g15nJ+uXttlkMr7DDZvS0xcNZJsIRG1LNsa0XmV2+gWQmMKQQT6IysexVeYtWEJrW6IffCpGlBPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPIR9PXKqxz4e6CAActoGScnZ6gWhmBgiHlyE0Oeehs=;
 b=3vAMpA50Sy5cf44p2cXbogbRLP5B4VzKfX6oGAOF2XtO8YV6wnD4QU3voJMSaZNVYPAqsiCJ80SY5/IzC0MwTaGGB+wrgu1ON43THDBACrZ7wFGSBs5tVez0KPUHDTrT08HJIZqqJ6CuLfbD1tn2zxlPb46eZWolSyI+nb/tz5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8298.namprd12.prod.outlook.com (2603:10b6:930:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 15:55:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 15:55:03 +0000
Content-Type: multipart/alternative;
 boundary="------------fLFAmpJSDTwAGBniH10qnPTn"
Message-ID: <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
Date: Mon, 11 Nov 2024 16:54:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 60574e36-86b3-46c6-55e8-08dd026934c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWhxTXdTSnhQVUUzYmlDM1plMVhZRy9PRkEvZ1hOd2FNRk5OSUZWbW5sN3NW?=
 =?utf-8?B?cjlqbndjcm9LM1crVWR0RG1CN1JjNzN1SXl6TkkxSVh5dEs4cS96b3hBamJx?=
 =?utf-8?B?L1VZb2tra1kzUVNpcG5CQ0J1NjZIaE84VG41NjBpeXZsQlJZZzFSOFZIUThN?=
 =?utf-8?B?dGMxTXpITCsxTTB3aWp4QnBkWXBycXV4aEQzbldSa2ZjR3YzaGxNZG53Mllq?=
 =?utf-8?B?TkZBV2JrN1I3VGZVZ2l3MGZ1Z3dGK1ZhU0pyMEVpMjRTSnlVZjhKSFVSVkNS?=
 =?utf-8?B?cjhyRTMzZlUyWWtBMHdNUTVNYkRoNktrWUl0Qi8zTUJtQ0U1S2VzZmRubEFn?=
 =?utf-8?B?bnBsTUUwS1Rndmo4SFRtUjFQbW0rdlpFZFRHNXFXM2FPQm4rWFpqUi9zTmNZ?=
 =?utf-8?B?L3RxanZ1N3ZyV2hBOXJuTzJqRzM4eTFMUWltY0FqTkkyNVpnejMwR1lyMXJM?=
 =?utf-8?B?dGJiQ2lhN3draXJWRjNzVEJqMzBUWWZ2R0g2eExkb1kvd1JlcVpVUEcrWU90?=
 =?utf-8?B?bVRzTCtxSzlBNmIxTmw1eWZzeHhHWFljYzJzUnNMNUdjWlYyU2ppZXdEOFlK?=
 =?utf-8?B?YUJKT2dVNlZRQUNyZ2hVYVhRSkRzdzJsb3NhZUNMZEhLZ1dvSTFWcjNYVitJ?=
 =?utf-8?B?QXpnemRtWXdlWFBpdkp6aDk0VG5SV1EyTWYzbE45UHEvdU4renQwR1lkNGZt?=
 =?utf-8?B?VmNFNW1ZaHRmdVZVMWRWZlF4K1E5TGFHN2JwS214eEdyV2RQRmViRVB3ZXQw?=
 =?utf-8?B?SWdURDFGQnkxODArcUMvZnZtblY0Z3hQMjg0ZVVIcklaTmhuOUlCZldzNm91?=
 =?utf-8?B?SDFsSDc0U1dHQkp0YWNlV1BNUkpBcS9SY3BOTldTc21BYVJMblNXYUJ3VGtk?=
 =?utf-8?B?NnZUMml2OHRvRWtxWWtJUWMxeU8xWUdPbTlDOUNJU0Z3R25NRERYWE1KREZK?=
 =?utf-8?B?VmswcHFoSlN3Y0x4Y0x0Q2ZOYlFKSVpjK1FReVFmczNkWVdYTDNiaittTWlk?=
 =?utf-8?B?RE5uTHc4SWxhR296dGtyRG5OdFRFeUFmMU5TMkJLWDZ1eWgyYU9aU284RU9O?=
 =?utf-8?B?KzNBeWJ3TUNCUmdtTUgrRjRkTGdzamQ0bDFLY3NzelpyRlVmckR5MmZLUHNX?=
 =?utf-8?B?Qk00L1I1ayttZmc1TFBIL2REMzl5OUJjNkJYMWlBUGpzWTB1Y3prdEhDc3Zx?=
 =?utf-8?B?VDlrMFlVRW5wMUMvdGFqRnFuVTh1R0hvL1V0dC9BcC91MjhVVEo4VnlJODdU?=
 =?utf-8?B?RTl0U3FhL2M3OGkwNWdvOFJNZ1RWZjRoWHJuYUZ1ZFBYM1p4NnN3SVR6VVd4?=
 =?utf-8?B?VElaUUo0TTJSaXowU1dwbytweVlOcW1ZdFRvcE11VDRQT0pIQnlBOGF4T1JO?=
 =?utf-8?B?UnVZeVFoei9qcndYVExnUk1uRFNZZlVha1hscHRkT2pKc0RCdk1RNXdCQWky?=
 =?utf-8?B?VkFhOGdYQ3V1N1MxejFhK3hGSUdrUUVQT2lFUXJ1bWM5eFkvMi84b3VMRmNH?=
 =?utf-8?B?S0g2UzEvM3QwcHVuSnVoQzArME1zT0FraWRyY2hpem14aUczcTVsS090bEQ4?=
 =?utf-8?B?azlaVlYvb0hQNlEvQzlxSmRacjFHelBoVXZvajVMditXVE1JY2R0YkpmWFZu?=
 =?utf-8?B?MFd2NGR5TUF2d2loWkdIM2hiakk4OTJPM0NVbUcweWxBWHFnS21UYm5XZjlV?=
 =?utf-8?B?OVJYa004TGlMdTlCbmtPS1QzOEJMODVmallFSjdNSWZmdldnS0J5cTBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJVSmF1R1FUZVM5eGVzR1lXZWFGWTNjOFR1anJQS1dmS0xqR0laaEFVK3d2?=
 =?utf-8?B?K1VQejFsSWZoNlNGMXVRQXZ5ZUxpTGRrSGcydXNUMVFJUWJXQVA4VUhROE1j?=
 =?utf-8?B?QkJ6NnllNG5JWXBkUGFWR0pvNWpWUHdVWEpSWHd2NFlJaFpYTGN1UGRiWGc4?=
 =?utf-8?B?Y0tYOWNGeDV0Y3BQWktoVUJGNTdqN0c2NTRpemlsaUVqMnFoS1IxZTkwZEx4?=
 =?utf-8?B?SE1sTFpkTEpQdFNocWxUZmRoS0FFdDByTnYvTHN1WklwcDBpV29qT0tPWFNH?=
 =?utf-8?B?QzZRZ0ZteG1BbnhFVWtOM1hNSmpEeUpxYStWZUE5eHR6dk9ZQnVDUEcrSE5r?=
 =?utf-8?B?YytJekFqaGhOSjBwRlpyOWFHTUhuVEo0TE9oWjRRNGc3a1BKRVFlbDBnN3VJ?=
 =?utf-8?B?SHBvb1lENEFocFU2b2c4aEV2UWlvcjd5c2pRdCs2aDJ4bHF4N2ZWWllaTWor?=
 =?utf-8?B?d1hGWW5KaEtuaUxXaWczWGpjREhlaUFzbTJzS3A2ZWdmM1BOZ0RIQWJZSUFK?=
 =?utf-8?B?bmw1THlmbU9kVWtabXJoNTZCSVdmWm5JM0Z1b3M5cEhMY1NpdGNrcnZKTkEv?=
 =?utf-8?B?SjhqQW4vR0gxQTIzbUQwYy9obEd1TGhCWlRGTldrOHhKcVM3QmFONW9MNDJG?=
 =?utf-8?B?c09nRVMrWU15MUM5SDZyNUozU1BKK0xyV0NYQm94eFBuYWptUCtMZm0zcmtQ?=
 =?utf-8?B?VFpwUVZHcTMzREE3ZXI4bzR5TDQ4L1liZUxHUzkxZXZFZkFTZzhvOUY5Z2F4?=
 =?utf-8?B?bFJCYmk3TTRwMHpqTDZnNmlDL2VaMmJNYWd0cmJPM0ROenFvZEZKN3ZENXNo?=
 =?utf-8?B?U2dVR0tQQjlpNHJ5dEptN3JIYTFKNnZXWFozNDRET2FuRUR1MEhPZ21DRW5z?=
 =?utf-8?B?UlVPcnk2ZHRNZS9MMDBTcXlObkdsUk5nZVUrR2VRUmZGTjF0aEVoaWZJdGFr?=
 =?utf-8?B?dGNXaGNQM3RMZkpzcjFTK01rczk5QkNmTWxkamF1eTRwaVMrWHVocVZ6WTNK?=
 =?utf-8?B?MUNwUTJVM0hUSWRNeGlta09kb2hybUYrRzFwdHpia3lKSzNQcER0d2hMdjZh?=
 =?utf-8?B?OThwL2tqb01ROGsxd0hsQWVuVWk2WWIrejc3NDNER3lEWWlQUUQvbHZBamll?=
 =?utf-8?B?alkyQWMrazE0ZHQ2K2VXUTJTTEF1Q3J4dGJvemd3eTE5ekc2MVlLQ2JDYWtM?=
 =?utf-8?B?bzVpS25xb3BDVi9haWNtM1Z2RmZSN2dPZS9EenlGUzR0SFJZTi9pZEhjSkFD?=
 =?utf-8?B?RkZocmRyek52ZEF2dHR6YWhRM0F3dmxBZjQxMUwwcjBQaEN3QlNQY0JBdnNS?=
 =?utf-8?B?U2hGOU8xMUxFSkFCVmpya0xUNU1RbDNHY1IvOHk2QzJML3lLakhDQUd3QjFF?=
 =?utf-8?B?K3Y1ZSsvRUdQZ1lwWHFrRldTWUt0dGdXbzY1WVJrVGJtM29NNjJQRVpZdGZ4?=
 =?utf-8?B?S1dyZ0RJZDVlWlpOTFpXeXoxRThLdGlCS0F0eEUwWk1HbXFxQ2s4eUJHVE1x?=
 =?utf-8?B?RzN2MDM4QUdzUVp0MGtzQ2g5TENqN1o1dVFScWx3VFY3SVdNQlo5aDBRajdG?=
 =?utf-8?B?SHQ0QWNhR2MwMHA1VGpUcmxPSzFnMFdHZ2RVL21nQkx4U3JYc1lBSk9DelR2?=
 =?utf-8?B?dlFaQWsrODIwY3NOdjU1ZUZQNm5vVUNIL01KN2ViT2k2bWtLd3pHT2trUzBE?=
 =?utf-8?B?cjU4a0NPdkVPeTJ5SVVXa0VqM3U2YkRVbUFkVFFqaHpOQUwxRlZqcE5YeGJj?=
 =?utf-8?B?UzJJUGVCc2FhRTQxUUNlaFZOekV1NTBzSEgwaWdZSkNTWVlvaTgwcHkyZ3h0?=
 =?utf-8?B?NmhSSzRGQUV3YVpsTURKSkdiL2N5ZkZBWGhoam1GMVJNZ3l6Q0JMeTIzOTFO?=
 =?utf-8?B?eUpHV1N1MWtaanA0eEdIRFdmUDZkblZ3TExFNWdBeThsRkovbHpZM1pVamMw?=
 =?utf-8?B?bXAxU0xjM0lYbmhOS2pzbm8zV0VtYlF0anhPckJjL3ljOWhjcEY0T0hqV25Q?=
 =?utf-8?B?OVcyN0dyWGRzek8xb0h6eFFzbGdlZE9sQVJZb0VSUmhjRHhGZ0hvVXVWUU9I?=
 =?utf-8?B?SEZuVEdiQ3FkSTlpcEFSeU5zZHBsM0ZjNVYrMHc1TythREdCYmhIbUR3dVFC?=
 =?utf-8?Q?+78hbNrQ26TSK0M7SaqtU66/N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60574e36-86b3-46c6-55e8-08dd026934c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:55:03.9134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSp83uEKDhWd2MtrHwXW721FJKdakJTIiNUw5yDtSV0EiDXbtTFN0YwhMOztyySo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298
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

--------------fLFAmpJSDTwAGBniH10qnPTn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 11.11.24 um 15:00 schrieb Joonas Lahtinen:
> Quoting Christian König (2024-11-11 13:34:12)
>> Am 11.11.24 um 11:10 schrieb Simona Vetter:
>>> On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
>>>> Back from some time off and will try to answer below.
>>>>
>>>> Adding Dave and Sima as this topic has been previously discussed to some
>>>> extent and will be good to reach common understanding about what the
>>>> series is trying to do and what is the difference to the AMD debugging
>>>> model.
>>> I chatted about this thread a bit on irc with folks, and I think an
>>> orthogonal issue is the question, what should be in ttm-utils? I've asked
>>> Matt to type up a DOC patch once we have some consensus, since imo the
>>> somewhat lackluster documentation situation for ttm is also somewhat a
>>> cause for these big threads on various different topics. Aside from the
>>> fact that gpu memory management is just hard.
>>>
>>> On the uapi/design aspect, I think this would serve well with a patch to
>>> drm-uapi.rst that adds a debugging section? At least once we have some
>>> rough consensus across drivers, and more importantly userspace in the form
>>> of gdb upstream (at least I'm not aware of any other upstream debugger
>>> patches, I think amd's rocm stuff is also gdb-only).
>> Yeah that seems to be a really good idea. Similar design ideas came up
>> AMD internally as well but where dropped after pointing people to
>> pidfd_getfd().
>>
>> But the bigger problem seems to be that the design doesn't seems to take
>> the dma_fence requirements into account.
> Where would you deduce that?

XE is based on a preemption fence based memory management.

> We specifically limit the debugging to Long Running contexts which don't
> depend on dma_fences.

That doesn't matter.

As long as you don't have a page fault (HMM) based memory management you 
still have that inter dependency and at least the public available XE 
code doesn't seem to have that.

>> In other words attaching gdb to a pid seems to stop the GPU thread of
>> this pid without waiting for the XE preemption nor end of operation fence.
>>
>> I mean if the GPU threads are preempted that could work, but yeah not
>> like this :)
> For us, hitting a breakpoint inside the workload would always violate
> any dma_fence timeout for the submitted workload, as the HW context can't
> be switched out while in the breakpoint.

That is clearly *not* something you can do without changing your memory 
management.

> For any dma_fence workload the guarantee is that that it completes
> within reasonable time after submission (guaranteed by the submitter). I
> don't see how you could really allow interactive debugging of a
> breakpoint under those restrictions anyway even if pre-emption was
> supported as the workload would not finish in <10 seconds?

Yeah that is the whole point, this is impossible as far as we know.

> For i915 we did have the "pre-emptable but indefinitely long dma_fence workloads"
> concept at one point and that was rejected after the lengthy discussion.

I mean I tried that more than once myself and we have multiple requests 
for this on the AMD side from customers. So far nobody came up with a 
solution which actually works correctly.

> So I think only way to allow interactive debugging is to avoid the
> dma_fences. Curious to hear if there are ideas for otherwise.

You need to guarantee somehow that the process is taken from the 
hardware so that the preemption fence can signal.

This means that a breakpoint or core dump doesn't halt GPU threads, but 
rather suspends them. E.g. all running wave data is collected into a 
state bag which can be restored later on.

I was under the impression that those long running compute threads do 
exactly that, but when the hardware can't switch out the GPU 
thread/process while in a break then that isn't the case.

As long as you don't find a way to avoid that this patch set is a pretty 
clear NAK from my side as DMA-buf and TTM maintainer.

What might work is to keep the submission on the hardware in the break 
state but forbid any memory access. This way you can signal your 
preemption fence even when the hardware isn't made available.

Before you continue XE setups a new pre-emption fence and makes sure 
that all page tables etc... are up to date.

Could be tricky to get this right if completion fence based submissions 
are mixed in as well, but that gives you at least a direction you could 
potentially go.

Regards,
Christian.

>
> Regards, Joonas
>
>> Regards,
>> Christian.
>>
>>> Some wash-up thoughts from me below, but consider them fairly irrelevant
>>> since I think the main driver for these big questions here should be
>>> gdb/userspace.
>>>
>>>> Quoting Christian König (2024-11-07 11:44:33)
>>>>> Am 06.11.24 um 18:00 schrieb Matthew Brost:
>>>>>
>>>>>       [SNIP]
>>>>>
>>>>>       This is not a generic interface that anyone can freely access. The same
>>>>>       permissions used by ptrace are checked when opening such an interface.
>>>>>       See [1] [2].
>>>>>
>>>>>       [1]https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
>>>>>       [2]https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2
>>>>>
>>>>>
>>>>> Thanks a lot for those pointers, that is exactly what I was looking for.
>>>>>
>>>>> And yeah, it is what I feared. You are re-implementing existing functionality,
>>>>> but see below.
>>>> Could you elaborate on what this "existing functionality" exactly is?
>>>> I do not think this functionality exists at this time.
>>>>
>>>> The EU debugging architecture for Xe specifically avoids the need for GDB
>>>> to attach with ptrace to the CPU process or interfere with the CPU process for
>>>> the debugging via parasitic threads or so.
>>>>
>>>> Debugger connection is opened to the DRM driver for given PID (which uses the
>>>> ptrace may access check for now) after which the all DRM client of that
>>>> PID are exposed to the debugger process.
>>>>
>>>> What we want to expose via that debugger connection is the ability for GDB to
>>>> read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
>>>> the EU threads would see them. Note that the layout of the ppGTT is
>>>> completely up to the userspace driver to setup and is mostly only partially
>>>> equal to the CPU address space.
>>>>
>>>> Specifically as part of reading/writing the ppGTT for debugging purposes,
>>>> there are deep flushes needed: for example flushing instruction cache
>>>> when adding/removing breakpoints.
>>>>
>>>> Maybe that will explain the background. I elaborate on this at the end some more.
>>>>
>>>>>               kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
>>>>>               failing to see the problem with adding a simple helper based on existing
>>>>>               code.
>>>>>
>>>>>           What#s possible and often done is to do kmap/vmap if you need to implement a
>>>>>           CPU copy for scanout for example or for copying/validating command buffers.
>>>>>           But that usually requires accessing the whole BO and has separate security
>>>>>           checks.
>>>>>
>>>>>           When you want to access only a few bytes of a BO that sounds massively like
>>>>>           a peek/poke like interface and we have already rejected that more than once.
>>>>>           There even used to be standardized GEM IOCTLs for that which have been
>>>>>           removed by now.
>>>> Referring to the explanation at top: These IOCTL are not for the debugging target
>>>> process to issue. The peek/poke interface is specifically for GDB only
>>>> to facilitate the emulation of memory reads/writes on the GPU address
>>>> space as they were done by EUs themselves. And to recap: for modifying
>>>> instructions for example (add/remove breakpoint), extra level of cache flushing is
>>>> needed which is not available to regular userspace.
>>>>
>>>> I specifically discussed with Sima on the difference before moving forward with this
>>>> design originally. If something has changed since then, I'm of course happy to rediscuss.
>>>>
>>>> However, if this code can't be added, not sure how we would ever be able
>>>> to implement core dumps for GPU threads/memory?
>>>>
>>>>>           If you need to access BOs which are placed in not CPU accessible memory then
>>>>>           implement the access callback for ptrace, see amdgpu_ttm_access_memory for
>>>>>           an example how to do this.
>>>> As also mentioned above, we don't work via ptrace at all when it comes
>>>> to debugging the EUs. The only thing used for now is the ptrace_may_access to
>>>> implement similar access restrictions as ptrace has. This can be changed
>>>> to something else if needed.
>>>>
>>>>>       Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.
>>>>>
>>>>>       This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.
>>>>>
>>>>>       The above function accesses a BO via kmap if it is in SYSTEM / TT,
>>>>>       which is existing code.
>>>>>
>>>>>       This function is only exposed to user space via ptrace permissions.
>>>> Maybe this sentence is what caused the confusion.
>>>>
>>>> Userspace is never exposed with peek/poke interface, only the debugger
>>>> connection which is its own FD.
>>>>
>>>>>       In this series, we implement a function [3] similar to
>>>>>       amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
>>>>>       missing is non-visible CPU memory access, similar to
>>>>>       amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
>>>>>       was omitted in this series given its complexity.
>>>>>
>>>>>       So, this looks more or less identical to AMD's ptrace implementation,
>>>>>       but in GPU address space. Again, I fail to see what the problem is here.
>>>>>       What am I missing?
>>>>>
>>>>>
>>>>> The main question is why can't you use the existing interfaces directly?
>>>> We're not working on the CPU address space or BOs. We're working
>>>> strictly on the GPU address space as would be seen by an EU thread if it
>>>> accessed address X.
>>>>
>>>>> Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
>>>>> system call, see herehttps://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
>>>>>
>>>>> The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
>>>>> process. That in turn gives you all the access you need from gdb, including
>>>>> mapping BOs and command submission on behalf of the application.
>>>> We're not operating on the CPU address space nor are we operating on BOs
>>>> (there is no concept of BO in the EU debug interface). Each VMA in the VM
>>>> could come from anywhere, only the start address and size matter. And
>>>> neither do we need to interfere with the command submission of the
>>>> process under debug.
>>>>
>>>>> As far as I can see that allows for the same functionality as the eudebug
>>>>> interface, just without any driver specific code messing with ptrace
>>>>> permissions and peek/poke interfaces.
>>>>>
>>>>> So the question is still why do you need the whole eudebug interface in the
>>>>> first place? I might be missing something, but that seems to be superfluous
>>>>> from a high level view.
>>>> Recapping from above. It is to allow the debugging of EU threads per DRM
>>>> client, completely independent of the CPU process. If ptrace_may_acces
>>>> is the sore point, we could consider other permission checks, too. There
>>>> is no other connection to ptrace in this architecture as single
>>>> permission check to know if PID is fair game to access by debugger
>>>> process.
>>>>
>>>> Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
>>>> the DRM client would also pave way for being able to extend core kernel generated
>>>> core dump with each DRM client's EU thread/memory dump. We have similar
>>>> feature called "Offline core dump" enabled in the downstream public
>>>> trees for i915, where we currently attach the EU thread dump to i915 error state
>>>> and then later combine i915 error state with CPU core dump file with a
>>>> tool.
>>>>
>>>> This is relatively little amount of extra code, as this baseline series
>>>> already introduces GDB the ability to perform the necessary actions.
>>>> It's just the matter of kernel driver calling: "stop all threads", then
>>>> copying the memory map and memory contents for GPU threads, just like is
>>>> done for CPU threads.
>>>>
>>>> With parasitic thread injection, not sure if there is such way forward,
>>>> as it would seem to require to inject quite abit more logic to core kernel?
>>>>
>>>>> It's true that the AMD KFD part has still similar functionality, but that is
>>>>> because of the broken KFD design of tying driver state to the CPU process
>>>>> (which makes it inaccessible for gdb even with imported render node fd).
>>>>>
>>>>> Both Sima and I (and partially Dave as well) have pushed back on the KFD
>>>>> approach. And the long term plan is to get rid of such device driver specific
>>>>> interface which re-implement existing functionality just differently.
>>>> Recapping, this series is not adding it back. The debugger connection
>>>> is a separate FD from the DRM one, with separate IOCTL set. We don't allow
>>>> the DRM FD any new operations based on ptrace is attached or not. We
>>>> don't ever do that check even.
>>>>
>>>> We only restrict the opening of the debugger connection to given PID with
>>>> ptrace_may_access check for now. That can be changed to something else,
>>>> if necessary.
>>> Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
>>> thing, least because even today all the svm discussions we have still hit
>>> clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
>>> sections with offsets). Not even speaking of all the gpu usecases where
>>> the gpu vm space is still entirely independent of the cpu side.
>>>
>>> So that's why I think this entirely separate approach looks like the right
>>> one, with ptrace_may_access as the access control check to make sure we
>>> match ptrace on the cpu side.
>>>
>>> But there's very obviously a bikeshed to be had on what the actual uapi
>>> should look like, especially how gdb opens up a gpu debug access fd. But I
>>> also think that's not much on drm to decide, but whatever gdb wants. And
>>> then we aim for some consistency on that lookup/access control part
>>> (ideally, I might be missing some reasons why this is a bad idea) across
>>> drm drivers.
>>>
>>>>> So you need to have a really really good explanation why the eudebug interface
>>>>> is actually necessary.
>>>> TL;DR The main point is to decouple the debugging of the EU workloads from the
>>>> debugging of the CPU process. This avoids the interference with the CPU process with
>>>> parasitic thread injection. Further this also allows generating a core dump
>>>> without any GDB connected. There are also many other smaller pros/cons
>>>> which can be discussed but for the context of this patch, this is the
>>>> main one.
>>>>
>>>> So unlike parasitic thread injection, we don't unlock any special IOCTL for
>>>> the process under debug to be performed by the parasitic thread, but we
>>>> allow the minimal set of operations to be performed by GDB as if those were
>>>> done on the EUs themselves.
>>>>
>>>> One can think of it like the minimal subset of ptrace but for EU threads,
>>>> not the CPU threads. And thus, building on this it's possible to extend
>>>> the core kernel generated core dumps with DRM specific extension which
>>>> would contain the EU thread/memory dump.
>>> It might be good to document (in that debugging doc patch probably) why
>>> thread injection is not a great option, and why the tradeoffs for
>>> debugging are different than for for checkpoint/restore, where with CRIU
>>> we landed on doing most of this in userspace, and often requiring
>>> injection threads to make it all work.
>>>
>>> Cheers, Sima
>>>
>>>> Regards, Joonas
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>
>>>>>
>>>>>       Matt
>>>>>
>>>>>       [3]https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
>>>>>
>>>>>
>>>>>           Regards,
>>>>>           Christian.
>>>>>
>>>>>
>>>>>               Matt
>>>>>
>>>>>
>>>>>                   Regards,
>>>>>                   Christian.
>>>>>

--------------fLFAmpJSDTwAGBniH10qnPTn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 11.11.24 um 15:00 schrieb Joonas Lahtinen:<br>
    <blockquote type="cite" cite="mid:173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Quoting Christian König (2024-11-11 13:34:12)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 11.11.24 um 11:10 schrieb Simona Vetter:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Back from some time off and will try to answer below.

Adding Dave and Sima as this topic has been previously discussed to some
extent and will be good to reach common understanding about what the
series is trying to do and what is the difference to the AMD debugging
model.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I chatted about this thread a bit on irc with folks, and I think an
orthogonal issue is the question, what should be in ttm-utils? I've asked
Matt to type up a DOC patch once we have some consensus, since imo the
somewhat lackluster documentation situation for ttm is also somewhat a
cause for these big threads on various different topics. Aside from the
fact that gpu memory management is just hard.

On the uapi/design aspect, I think this would serve well with a patch to
drm-uapi.rst that adds a debugging section? At least once we have some
rough consensus across drivers, and more importantly userspace in the form
of gdb upstream (at least I'm not aware of any other upstream debugger
patches, I think amd's rocm stuff is also gdb-only).
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah that seems to be a really good idea. Similar design ideas came up 
AMD internally as well but where dropped after pointing people to 
pidfd_getfd().

But the bigger problem seems to be that the design doesn't seems to take 
the dma_fence requirements into account.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Where would you deduce that?</pre>
    </blockquote>
    <br>
    XE is based on a preemption fence based memory management.<br>
    <br>
    <blockquote type="cite" cite="mid:173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">We specifically limit the debugging to Long Running contexts which don't
depend on dma_fences.</pre>
    </blockquote>
    <br>
    That doesn't matter.<br>
    <br>
    As long as you don't have a page fault (HMM) based memory management
    you still have that inter dependency and at least the public
    available XE code doesn't seem to have that.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In other words attaching gdb to a pid seems to stop the GPU thread of 
this pid without waiting for the XE preemption nor end of operation fence.

I mean if the GPU threads are preempted that could work, but yeah not 
like this :)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For us, hitting a breakpoint inside the workload would always violate
any dma_fence timeout for the submitted workload, as the HW context can't
be switched out while in the breakpoint.</pre>
    </blockquote>
    <br>
    That is clearly *not* something you can do without changing your
    memory management.<br>
    <br>
    <blockquote type="cite" cite="mid:173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">For any dma_fence workload the guarantee is that that it completes
within reasonable time after submission (guaranteed by the submitter). I
don't see how you could really allow interactive debugging of a
breakpoint under those restrictions anyway even if pre-emption was
supported as the workload would not finish in &lt;10 seconds?</pre>
    </blockquote>
    <br>
    Yeah that is the whole point, this is impossible as far as we know.<br>
    <br>
    <blockquote type="cite" cite="mid:173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">For i915 we did have the &quot;pre-emptable but indefinitely long dma_fence workloads&quot;
concept at one point and that was rejected after the lengthy discussion.</pre>
    </blockquote>
    <br>
    I mean I tried that more than once myself and we have multiple
    requests for this on the AMD side from customers. So far nobody came
    up with a solution which actually works correctly.<br>
    <br>
    <blockquote type="cite" cite="mid:173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">So I think only way to allow interactive debugging is to avoid the
dma_fences. Curious to hear if there are ideas for otherwise.</pre>
    </blockquote>
    <br>
    You need to guarantee somehow that the process is taken from the
    hardware so that the preemption fence can signal.<br>
    <br>
    This means that a breakpoint or core dump doesn't halt GPU threads,
    but rather suspends them. E.g. all running wave data is collected
    into a state bag which can be restored later on.<br>
    <br>
    I was under the impression that those long running compute threads
    do exactly that, but when the hardware can't switch out the GPU
    thread/process while in a break then that isn't the case.<br>
    <br>
    As long as you don't find a way to avoid that this patch set is a
    pretty clear NAK from my side as DMA-buf and TTM maintainer.<br>
    <br>
    What might work is to keep the submission on the hardware in the
    break state but forbid any memory access. This way you can signal
    your preemption fence even when the hardware isn't made available.<br>
    <br>
    Before you continue XE setups a new pre-emption fence and makes sure
    that all page tables etc... are up to date.<br>
    <br>
    Could be tricky to get this right if completion fence based
    submissions are mixed in as well, but that gives you at least a
    direction you could potentially go.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

Regards, Joonas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Some wash-up thoughts from me below, but consider them fairly irrelevant
since I think the main driver for these big questions here should be
gdb/userspace.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Quoting Christian König (2024-11-07 11:44:33)
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 06.11.24 um 18:00 schrieb Matthew Brost:

     [SNIP]

     This is not a generic interface that anyone can freely access. The same
     permissions used by ptrace are checked when opening such an interface.
     See [1] [2].

     [1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2</a>
     [2] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2</a>


Thanks a lot for those pointers, that is exactly what I was looking for.

And yeah, it is what I feared. You are re-implementing existing functionality,
but see below.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Could you elaborate on what this &quot;existing functionality&quot; exactly is?
I do not think this functionality exists at this time.

The EU debugging architecture for Xe specifically avoids the need for GDB
to attach with ptrace to the CPU process or interfere with the CPU process for
the debugging via parasitic threads or so.

Debugger connection is opened to the DRM driver for given PID (which uses the
ptrace may access check for now) after which the all DRM client of that
PID are exposed to the debugger process.

What we want to expose via that debugger connection is the ability for GDB to
read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
the EU threads would see them. Note that the layout of the ppGTT is
completely up to the userspace driver to setup and is mostly only partially
equal to the CPU address space.

Specifically as part of reading/writing the ppGTT for debugging purposes,
there are deep flushes needed: for example flushing instruction cache
when adding/removing breakpoints.

Maybe that will explain the background. I elaborate on this at the end some more.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">             kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
             failing to see the problem with adding a simple helper based on existing
             code.

         What#s possible and often done is to do kmap/vmap if you need to implement a
         CPU copy for scanout for example or for copying/validating command buffers.
         But that usually requires accessing the whole BO and has separate security
         checks.

         When you want to access only a few bytes of a BO that sounds massively like
         a peek/poke like interface and we have already rejected that more than once.
         There even used to be standardized GEM IOCTLs for that which have been
         removed by now.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Referring to the explanation at top: These IOCTL are not for the debugging target
process to issue. The peek/poke interface is specifically for GDB only
to facilitate the emulation of memory reads/writes on the GPU address
space as they were done by EUs themselves. And to recap: for modifying
instructions for example (add/remove breakpoint), extra level of cache flushing is
needed which is not available to regular userspace.

I specifically discussed with Sima on the difference before moving forward with this
design originally. If something has changed since then, I'm of course happy to rediscuss.

However, if this code can't be added, not sure how we would ever be able
to implement core dumps for GPU threads/memory?

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">         If you need to access BOs which are placed in not CPU accessible memory then
         implement the access callback for ptrace, see amdgpu_ttm_access_memory for
         an example how to do this.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">As also mentioned above, we don't work via ptrace at all when it comes
to debugging the EUs. The only thing used for now is the ptrace_may_access to
implement similar access restrictions as ptrace has. This can be changed
to something else if needed.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">     Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.

     This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.

     The above function accesses a BO via kmap if it is in SYSTEM / TT,
     which is existing code.

     This function is only exposed to user space via ptrace permissions.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Maybe this sentence is what caused the confusion.

Userspace is never exposed with peek/poke interface, only the debugger
connection which is its own FD.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">     In this series, we implement a function [3] similar to
     amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
     missing is non-visible CPU memory access, similar to
     amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
     was omitted in this series given its complexity.

     So, this looks more or less identical to AMD's ptrace implementation,
     but in GPU address space. Again, I fail to see what the problem is here.
     What am I missing?


The main question is why can't you use the existing interfaces directly?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">We're not working on the CPU address space or BOs. We're working
strictly on the GPU address space as would be seen by an EU thread if it
accessed address X.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
system call, see here <a class="moz-txt-link-freetext" href="https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html">https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html</a>.

The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
process. That in turn gives you all the access you need from gdb, including
mapping BOs and command submission on behalf of the application.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">We're not operating on the CPU address space nor are we operating on BOs
(there is no concept of BO in the EU debug interface). Each VMA in the VM
could come from anywhere, only the start address and size matter. And
neither do we need to interfere with the command submission of the
process under debug.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">As far as I can see that allows for the same functionality as the eudebug
interface, just without any driver specific code messing with ptrace
permissions and peek/poke interfaces.

So the question is still why do you need the whole eudebug interface in the
first place? I might be missing something, but that seems to be superfluous
from a high level view.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Recapping from above. It is to allow the debugging of EU threads per DRM
client, completely independent of the CPU process. If ptrace_may_acces
is the sore point, we could consider other permission checks, too. There
is no other connection to ptrace in this architecture as single
permission check to know if PID is fair game to access by debugger
process.

Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
the DRM client would also pave way for being able to extend core kernel generated
core dump with each DRM client's EU thread/memory dump. We have similar
feature called &quot;Offline core dump&quot; enabled in the downstream public
trees for i915, where we currently attach the EU thread dump to i915 error state
and then later combine i915 error state with CPU core dump file with a
tool.

This is relatively little amount of extra code, as this baseline series
already introduces GDB the ability to perform the necessary actions.
It's just the matter of kernel driver calling: &quot;stop all threads&quot;, then
copying the memory map and memory contents for GPU threads, just like is
done for CPU threads.

With parasitic thread injection, not sure if there is such way forward,
as it would seem to require to inject quite abit more logic to core kernel?

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">It's true that the AMD KFD part has still similar functionality, but that is
because of the broken KFD design of tying driver state to the CPU process
(which makes it inaccessible for gdb even with imported render node fd).

Both Sima and I (and partially Dave as well) have pushed back on the KFD
approach. And the long term plan is to get rid of such device driver specific
interface which re-implement existing functionality just differently.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Recapping, this series is not adding it back. The debugger connection
is a separate FD from the DRM one, with separate IOCTL set. We don't allow
the DRM FD any new operations based on ptrace is attached or not. We
don't ever do that check even.

We only restrict the opening of the debugger connection to given PID with
ptrace_may_access check for now. That can be changed to something else,
if necessary.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
thing, least because even today all the svm discussions we have still hit
clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
sections with offsets). Not even speaking of all the gpu usecases where
the gpu vm space is still entirely independent of the cpu side.

So that's why I think this entirely separate approach looks like the right
one, with ptrace_may_access as the access control check to make sure we
match ptrace on the cpu side.

But there's very obviously a bikeshed to be had on what the actual uapi
should look like, especially how gdb opens up a gpu debug access fd. But I
also think that's not much on drm to decide, but whatever gdb wants. And
then we aim for some consistency on that lookup/access control part
(ideally, I might be missing some reasons why this is a bad idea) across
drm drivers.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">So you need to have a really really good explanation why the eudebug interface
is actually necessary.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">TL;DR The main point is to decouple the debugging of the EU workloads from the
debugging of the CPU process. This avoids the interference with the CPU process with
parasitic thread injection. Further this also allows generating a core dump
without any GDB connected. There are also many other smaller pros/cons
which can be discussed but for the context of this patch, this is the
main one.

So unlike parasitic thread injection, we don't unlock any special IOCTL for
the process under debug to be performed by the parasitic thread, but we
allow the minimal set of operations to be performed by GDB as if those were
done on the EUs themselves.

One can think of it like the minimal subset of ptrace but for EU threads,
not the CPU threads. And thus, building on this it's possible to extend
the core kernel generated core dumps with DRM specific extension which
would contain the EU thread/memory dump.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It might be good to document (in that debugging doc patch probably) why
thread injection is not a great option, and why the tradeoffs for
debugging are different than for for checkpoint/restore, where with CRIU
we landed on doing most of this in userspace, and often requiring
injection threads to make it all work.

Cheers, Sima

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards, Joonas

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Christian.



     Matt

     [3] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6">https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6</a>


         Regards,
         Christian.


             Matt


                 Regards,
                 Christian.

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------fLFAmpJSDTwAGBniH10qnPTn--
