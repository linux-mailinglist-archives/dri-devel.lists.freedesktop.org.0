Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391669BF1F5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E010E2E3;
	Wed,  6 Nov 2024 15:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PYdfBm+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE8C10E1FD;
 Wed,  6 Nov 2024 15:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naow8dP13pmKqa2deuqHKq9SyCiY37E8RKDv9L/GcKcQ8UnVyBbSs+Dmk9COhxvzJ3Yv9xfYOTXxcy7SK8dKcrWXa5T7Y8O7qCldPAwMi/zmZNQnNj1L5d75PfTiSVwadXK3fULLuzyCHEYQFCfVz5vFQacEejKtLkUiFLqWhnEE6dEn7R9M73hL9cpaRJcU6mKJGupSVILuVHK1+Yof6DEPwdpkDO5OYw3qDXy3DGEv0uErSSHjIR3h0txJpuFzEz36jDj7/dj6HpoWffNTV7IdE+er+L3MgDFouToNQ1kpHbDQlnSNbZ3hew4igx8NGIdvodLYI6GzOrixRyh2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80rak4ZYzpcHRSJUTYh+Vh7sForMKk1snI13JXeQY80=;
 b=G6kd8SwNxz0x5TDRTfTxXKfX8t4Ny/A6HwbbAC8bAZttul5n0T9BoBlm707RTu3ralNkaSU8H5z7QNBV5UmArMhA7r7XBqmDG6rrejtxeVjiZDwGB/lJ1P46LzCwbdzk4DiITQcT8PXxU+Wh6Wue7mkLqgopdO40lH/hKGdm44dZfJKoGu8zAJ/OYyNDqFUu8ll5413yQydARm8jCVYN6mZeaF2WnvC4so5tuyyRg5Ia75fpfLsJLOnDBONnSLY1Wkhv6ZoubVNEhWsmiWcFPBK41ntgHNRlnH/P2z6ZgA1L9vLp3qq9G6woAJ9eL6GPfr+CjRTPnvJ3bFjDRM5Rng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80rak4ZYzpcHRSJUTYh+Vh7sForMKk1snI13JXeQY80=;
 b=PYdfBm+fHAZNXt/fUWOPzJWQxEa8qr6FAVWDdRFYsH5t2kQCc39CYXYiAnrTghwCa5xgeK9qUwjK5OxGPYWaziJxnml2Y/9NaxSf1nxRj5QX9CSbJeH1ChRrhePIWgsF9GlSO9elBVzklXYk7Rux5gVmyOlgiDD+5Ld6R8NRBqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:44:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 15:44:20 +0000
Content-Type: multipart/alternative;
 boundary="------------5igpWynrNtgKY0QkNsGgVUsl"
Message-ID: <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
Date: Wed, 6 Nov 2024 16:44:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com> <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ca1dca-64f3-4118-1dda-08dcfe79e152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGI1bXNpQmdVU3pVL2dKeEdzd0xHWHBPb1F5NndiYktjY0lEOWFOL2JBMi9n?=
 =?utf-8?B?TnpNaVBpVFBpbXVSd2RXNURyYUhsblF1LzJORHZmR0FvZTBVVGthaXIrRkxh?=
 =?utf-8?B?TTR6VU5wZkJIRjVRVEJaVGtSZnhjOFJWREluQk1oMXpqUjdod1FUN3pqT3BO?=
 =?utf-8?B?UzU2K2hIUGNqY01RTEtveHdka2VLWGlrcUV1TVBjYmpuQzJzTmZmeDNRL1U3?=
 =?utf-8?B?Z3JzckV6bGVuVG45VEFMMWxUNGZPZUdmK3pwSzM1bGVJQ1ZmZ3pMUWlnRWY2?=
 =?utf-8?B?QXFSUHdOQlFaQW9DbzljYWRCVFJOeDY1M2xubUV0MThwK3dCVGJ3VUNUc25E?=
 =?utf-8?B?cDJNNnBNYUNTTmlzcnM2bVMwM2ZycW1VVzlSYUpjd01yaTRQckVvQitTSkIw?=
 =?utf-8?B?ZHMxUVNyZURhQzJoem1mQlpObVY0NmZRZmdXZG9WUzVrcFBpZ2F2S2NIMDRT?=
 =?utf-8?B?TFVpbW4yS3BHNE9jV1M5SHl6OHpVUmFCNHFkbTRLYWkxZFduOUFZQU9OcGNj?=
 =?utf-8?B?VStFT0VEUjhPYmRIN3JJZXFhVjZsSEVyazIvMnZQVGorS0d6MlQyVW5FVXhL?=
 =?utf-8?B?NW9vcWdNbkZzSkMwWVhuV2RWYk9yUCtaUnhyeWdxUmZTVG9MOWUraXk5dmE4?=
 =?utf-8?B?UzRTQnBHR2diQ1puSUJzRGlsVS9JZWVTeEhEWFoxdXZyeG5oaHhsVFdnSmdQ?=
 =?utf-8?B?SDJsdEZoWVRQaU1ySlIxMnJXeHVjaWhGMlV4ZXVNVmJsR1ZYTUVNRWJGeksw?=
 =?utf-8?B?M2hOeWJEYzRzZzhTUFpuSUpCSTBNQnZsdzBRR0hlRlZmZFJOMVE5emxHNXVZ?=
 =?utf-8?B?bW9hbVJLdEJQRzllRHA5eDZDM1pqOFp4SnBwVlhxQVZTMkh1T1JmNkRNQVY0?=
 =?utf-8?B?TnJnOFFXK29ETWYxa1JSVnZtdElyTlc3K2U5d2I2bXRIaitmOUhOTjdzUnh4?=
 =?utf-8?B?RHJvMFRybEY3MEpIYjJUMUVtWEcxcTY5NS9sRFRiUU93Qk8xSEZCS01KaERs?=
 =?utf-8?B?Snk2MXJrdHpySkZrUEFGMDB2Ui9ySk9GNTlzNnl3Y1JhazV2eHY0dlowL200?=
 =?utf-8?B?VzEwQXlha0ZaVTRrTlYxVG01MmttZlJMdWxMTDZEUVpDaGZLTGdFVjBSdzhU?=
 =?utf-8?B?Vk8vSjRCamhuUjloSXMvRFFDTERNQ1ZhZXhIbzVxaWtnWkE1d1dMb3gwdXVq?=
 =?utf-8?B?MGlrU3NPbWtJQ3owYlV3dU9MZFhEb1g4cE5KSEpwaFN0eDFKQlhhR2hqRFlH?=
 =?utf-8?B?OWpCSWdzb3ZsVFZDci96UndreVF5ekN1dHljai9VNC9YSFNiUzNEcWd2dEdP?=
 =?utf-8?B?NTRNdVJCd0RlTmRMQ3JDOWF3SjFSd2NKbzAvUEh1dlg3cEd6T1lCbUZhaWVO?=
 =?utf-8?B?aUNLN0pUZkk1RTNOTlFkRUFCMm1hRzNham5PSUFIcm9Eam5tMnVneE15Mmow?=
 =?utf-8?B?MkFHTDFDcVdPWlZDbFNkbWJEQ2NEVFNITWhuWFd2Q1ExMU1FRWZkaWxDcU9u?=
 =?utf-8?B?ei8wTlIxV2lxZk52RVJFa1NsbG5mNkhaelVyMncrMjVFc016OTQrUFFBQnRr?=
 =?utf-8?B?WDdyNCtyUzNReWFYbWZjTCtEOE5kTTV1bVpKbVVHYjRNcmJxalJVMHZnV3JI?=
 =?utf-8?B?NXNQRkx2NGZqdnd0QTdsZXQxT3h5NERhUUVVWHdPL29TeXJYbjFSRERyM2dC?=
 =?utf-8?B?bTZMM3N0VVE2N3B0WWs5SmZHT3B3VmRIZ3plU0trMTA4Q3E4STNyUEJ3QTIr?=
 =?utf-8?Q?5jAPQpttXevz5vh1SU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzllS2o4MG0ySnFvai9YcndNTnovb21UUm9PZExKRU5yeFRWMlQ0V1JvenJj?=
 =?utf-8?B?azFuYnVtdGhHM2VqOHVEbjlQcXp3cnA2YXVRY3ZiWm1zdU4rN3NOdE95N3B0?=
 =?utf-8?B?TkdiYUdySG4wZ3BINjlUNXBaSFg0azJjcTk5clpVRTBaM2Y2clJSTkxYUWVW?=
 =?utf-8?B?eDBtLzFYQzN2Y0cwd3NhemZMd1dnbkxpM0hOY0dIQzhBcUNlOUxJSGJhQmtv?=
 =?utf-8?B?eDJEQjFvdDRUaDV5YXoybFErdnNIWlhjNFlybWNkeGFNMlJJMWxrNHp1Zllx?=
 =?utf-8?B?a0ZuNHJVWEl5UGxlbDlha3Z2UHplZXAzdjRYVVdMY1dBMGk1UHdzT2NaZU1I?=
 =?utf-8?B?Tnk4Mko4NElaYjFvMGhpZ1ZSdmJTSEpCV01tbEd0V0UyTHJDWWZ6MFlZQVFT?=
 =?utf-8?B?STltd3lPZXNDakFlZ2dGKzVrdlFCa3FpY1Z6U1d0T3lvUGUzMG1UNHY2M3o3?=
 =?utf-8?B?SUpxYytwYllPeGlzS3E1N0xBYVFMK1dEclQ1RktIaEtlQUpUcm9rT0FQdjJy?=
 =?utf-8?B?LzZYWEcvSENjNktLVWhZaU5JdWVteDJPd2lwNTdLd1B5L0dNMGh1Nm51NnBs?=
 =?utf-8?B?d2g3ODhLaXVyNlp3NFJieGNoOHNHNmsvQ203c1ZsUXZhR1dBQkd6VUFqaXhL?=
 =?utf-8?B?ci9xREl5SXJhbGFmdTU1NkZIa1RsZ3RCYVI2NUdzNmZYYjg5QjQ0Qm1YN3NE?=
 =?utf-8?B?YnhVbGNQNXFGSGdVc2h3clRERkhLbnFJNS9penhXWTBGNWZNNlFwZ2xqMHdx?=
 =?utf-8?B?eFZHN0J0ekx4SzIzZE11MVpDNkVZNWpmUy9FSWtsUnoyRlJ5M1ArVE1BSjhJ?=
 =?utf-8?B?TDFkY3NuQzkraXBsRG55SFFDUDRxQjZxZ00xZU9wUGJmeWpCOG43N3VvL0xv?=
 =?utf-8?B?SE1nZXJtR1ZrTmhwOS8welFNSE9LaCtpeXFkWDNEbHpWTG1FV0UwWmZKQ2hk?=
 =?utf-8?B?eWl2VTBGNHRzcWZ3a290OWhCLzFmTk5ZdnNtME80bVZNc1FFb2YyNDhUbGZS?=
 =?utf-8?B?eWNUR0VpTFE1NVU0UFV1Qkh6QklWaTNOVVJwR0l4VGRUemRkaTMwcFdKQ3Bm?=
 =?utf-8?B?MkFEaG9YWmhKOEVGYjlRS3ZxSW1zYVZDcHpMeTBUWnN5YWJVRE1INVE3SEJm?=
 =?utf-8?B?ZHFIWExnbEVBb3g2VmZZWGJxR3diRVQ4a05YclR3YlFtZXBzOE0zMVlCdVlF?=
 =?utf-8?B?QXB2ZCtXSTUyRHVvS201NjVTY01KUmx1a042NUQ4MXNMVmlJaWU4RzRYSm1q?=
 =?utf-8?B?QU50Qm40cTZmV1JMMlBuczl6QmNzQTFvbjV2SW1BbjB0VzFmbjViUnVRRk1Z?=
 =?utf-8?B?aUxmWnpjdHFYdnJGNkpJTmdQeDVEWDFPbFA4NzdRVjdkYzN3V2hHTHpmYkhr?=
 =?utf-8?B?QjZaTVJIS01BK3FndGliOVN5dTdTUjdsWVFSNjFkUXBKRitheGs4WmhyQlh1?=
 =?utf-8?B?K2FGNnZ2aFhNYlN1dkY1MW1lYUlvUVNBYVBJOUtOcnppcDk1N1p0YWF3b20y?=
 =?utf-8?B?NGhDRzliZlpWWU96ejRUb2liZUdwN1IrYWNyTWhEb1NYZS9aczU0UCs0eDhG?=
 =?utf-8?B?RFQ5Qlg2aHB6L0hINVVENFR5eUF6T2p6Y2xETWRGd2VjR25lSktGdjBST1lJ?=
 =?utf-8?B?Q0V2Y3JTM1dWeGFkU2lIbWpTWTVyMmpZcDhpcGJDV1hVdEpNWjZZWUp5dHhC?=
 =?utf-8?B?dWYyUjFuTnp6eFRPQlQ4ZGNzakRpbDNxRkdIdUdNVmNOT29OQmxSbXByMG5I?=
 =?utf-8?B?eWVDOW54Z3hUMFc4Y2dIeDRiV1JyaWNucFp2azJJOHFPNVAwSkdZMnRCVVNv?=
 =?utf-8?B?ZjV3YzNOeHdiWDRVSzJvUmhvVjdrUllFb0NwVVFHdXRrWW0rRGtSNmluVkQ5?=
 =?utf-8?B?QmtCeXhLbUMvWmhIM2ZBSkUwSWp4U3RQa21aOHFoRFM1YU9rTFZNUVFQRFNV?=
 =?utf-8?B?WEtyeVFJVVczZFBtQStEYTQ1alpDMy94Yzc0TzFUaU5hSmFXNDNOaHVmT1dK?=
 =?utf-8?B?NEk5REU1VGVCb29IMi9Tdit1YzE1MjgxTzR3VGdyR25xZGxBYUU2RFFFYTRD?=
 =?utf-8?B?VENLVlRzZlBMb3FrZGlpVnR6YVI3WmRTTEVtcTZsRmE5Ukd6aDZXcURRQzVo?=
 =?utf-8?Q?O5Sk8/arZ9/fP57DfCsa3jpOt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ca1dca-64f3-4118-1dda-08dcfe79e152
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:44:20.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zAxOFmL6jdHdyxT/obvTkgxz+ceCzcUOdKUCSBKUKFQyv7osro/lbLKAH1avGwa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
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

--------------5igpWynrNtgKY0QkNsGgVUsl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.24 um 16:25 schrieb Matthew Brost:
> [SNIP]
>> Can you fully describe your use case? In other words what exactly is your
>> debugger trying to do?
> See above; I hope I've made this clearer.

It at least sounds a little bit better.

> Also, I'm not really an expert on Eudebug, as I haven't been involved in
> the development aside from reviewing its interaction with the core of
> Xe. Any further explanation would likely require me to loop in a
> colleague.

I think that could help since I don't have a clear picture of your use case.


>> Well, I think we need to take a step back. The major question is what is
>> your use case and is that use case valid or causes security concerns.
>>
>> For example userptrs are imported anonymous pages the GPU has a DMA mapping
>> for. Re-mapping them into an user address space for debugging or even
>> accessing them through the ptrace interface is strictly forbidden.
>>
>> We already had people trying to do exactly that and it ended not well at
>> all.
>>
> Again, if we can focus on what this patch is doing—accessing a BO, not a
> userptr—I think that will help progress here.
>
> To bring things together: "There is a huge push from upstream to avoid
> using kmap/vmap if possible." How would you suggest accessing a BO then?

Well that's the whole point: You should *not* access the BO on behalves 
of userspace in a peek/poke like interface.

> kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
> failing to see the problem with adding a simple helper based on existing
> code.

What#s possible and often done is to do kmap/vmap if you need to 
implement a CPU copy for scanout for example or for copying/validating 
command buffers. But that usually requires accessing the whole BO and 
has separate security checks.

When you want to access only a few bytes of a BO that sounds massively 
like a peek/poke like interface and we have already rejected that more 
than once. There even used to be standardized GEM IOCTLs for that which 
have been removed by now.

If you need to access BOs which are placed in not CPU accessible memory 
then implement the access callback for ptrace, see 
amdgpu_ttm_access_memory for an example how to do this.

Regards,
Christian.

>
> Matt
>
>> Regards,
>> Christian.
>>
>>> With this, I strongly prefer the code as is.
>>>
>>> Matt
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Matt
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>> Matt
>>>>>>>>
>>>>>>>>> Reported-by: Christoph Manszewski<christoph.manszewski@intel.com>
>>>>>>>>> Suggested-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>>>>>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>>>>>>>> Tested-by: Mika Kuoppala<mika.kuoppala@linux.intel.com>
>>>>>>>>> Reviewed-by: Matthew Auld<matthew.auld@intel.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>>>>>>>>>      include/drm/ttm/ttm_bo.h          |  2 +
>>>>>>>>>      3 files changed, 89 insertions(+), 64 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>>>> index d939925efa81..77e760ea7193 100644
>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>>>> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>>>>>>>>>      	return progress;
>>>>>>>>>      }
>>>>>>>>> +
>>>>>>>>> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
>>>>>>>>> +			      unsigned long offset,
>>>>>>>>> +			      void *buf, int len, int write)
>>>>>>>>> +{
>>>>>>>>> +	unsigned long page = offset >> PAGE_SHIFT;
>>>>>>>>> +	unsigned long bytes_left = len;
>>>>>>>>> +	int ret;
>>>>>>>>> +
>>>>>>>>> +	/* Copy a page at a time, that way no extra virtual address
>>>>>>>>> +	 * mapping is needed
>>>>>>>>> +	 */
>>>>>>>>> +	offset -= page << PAGE_SHIFT;
>>>>>>>>> +	do {
>>>>>>>>> +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>>>>>>>> +		struct ttm_bo_kmap_obj map;
>>>>>>>>> +		void *ptr;
>>>>>>>>> +		bool is_iomem;
>>>>>>>>> +
>>>>>>>>> +		ret = ttm_bo_kmap(bo, page, 1, &map);
>>>>>>>>> +		if (ret)
>>>>>>>>> +			return ret;
>>>>>>>>> +
>>>>>>>>> +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>>>>>>>> +		WARN_ON_ONCE(is_iomem);
>>>>>>>>> +		if (write)
>>>>>>>>> +			memcpy(ptr, buf, bytes);
>>>>>>>>> +		else
>>>>>>>>> +			memcpy(buf, ptr, bytes);
>>>>>>>>> +		ttm_bo_kunmap(&map);
>>>>>>>>> +
>>>>>>>>> +		page++;
>>>>>>>>> +		buf += bytes;
>>>>>>>>> +		bytes_left -= bytes;
>>>>>>>>> +		offset = 0;
>>>>>>>>> +	} while (bytes_left);
>>>>>>>>> +
>>>>>>>>> +	return len;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * ttm_bo_access - Helper to access a buffer object
>>>>>>>>> + *
>>>>>>>>> + * @bo: ttm buffer object
>>>>>>>>> + * @offset: access offset into buffer object
>>>>>>>>> + * @buf: pointer to caller memory to read into or write from
>>>>>>>>> + * @len: length of access
>>>>>>>>> + * @write: write access
>>>>>>>>> + *
>>>>>>>>> + * Utility function to access a buffer object. Useful when buffer object cannot
>>>>>>>>> + * be easily mapped (non-contiguous, non-visible, etc...).
>>>>>>>>> + *
>>>>>>>>> + * Returns:
>>>>>>>>> + * @len if successful, negative error code on failure.
>>>>>>>>> + */
>>>>>>>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>>>>>>>> +		  void *buf, int len, int write)
>>>>>>>>> +{
>>>>>>>>> +	int ret;
>>>>>>>>> +
>>>>>>>>> +	if (len < 1 || (offset + len) > bo->base.size)
>>>>>>>>> +		return -EIO;
>>>>>>>>> +
>>>>>>>>> +	ret = ttm_bo_reserve(bo, true, false, NULL);
>>>>>>>>> +	if (ret)
>>>>>>>>> +		return ret;
>>>>>>>>> +
>>>>>>>>> +	switch (bo->resource->mem_type) {
>>>>>>>>> +	case TTM_PL_SYSTEM:
>>>>>>>>> +		fallthrough;
>>>>>>>>> +	case TTM_PL_TT:
>>>>>>>>> +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
>>>>>>>>> +		break;
>>>>>>>>> +	default:
>>>>>>>>> +		if (bo->bdev->funcs->access_memory)
>>>>>>>>> +			ret = bo->bdev->funcs->access_memory
>>>>>>>>> +				(bo, offset, buf, len, write);
>>>>>>>>> +		else
>>>>>>>>> +			ret = -EIO;
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>> +	ttm_bo_unreserve(bo);
>>>>>>>>> +
>>>>>>>>> +	return ret;
>>>>>>>>> +}
>>>>>>>>> +EXPORT_SYMBOL(ttm_bo_access);
>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>> index 2c699ed1963a..20b1e5f78684 100644
>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>>>>>>>>>      }
>>>>>>>>>      EXPORT_SYMBOL(ttm_bo_vm_close);
>>>>>>>>> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>>>>>>>>> -				 unsigned long offset,
>>>>>>>>> -				 uint8_t *buf, int len, int write)
>>>>>>>>> -{
>>>>>>>>> -	unsigned long page = offset >> PAGE_SHIFT;
>>>>>>>>> -	unsigned long bytes_left = len;
>>>>>>>>> -	int ret;
>>>>>>>>> -
>>>>>>>>> -	/* Copy a page at a time, that way no extra virtual address
>>>>>>>>> -	 * mapping is needed
>>>>>>>>> -	 */
>>>>>>>>> -	offset -= page << PAGE_SHIFT;
>>>>>>>>> -	do {
>>>>>>>>> -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>>>>>>>> -		struct ttm_bo_kmap_obj map;
>>>>>>>>> -		void *ptr;
>>>>>>>>> -		bool is_iomem;
>>>>>>>>> -
>>>>>>>>> -		ret = ttm_bo_kmap(bo, page, 1, &map);
>>>>>>>>> -		if (ret)
>>>>>>>>> -			return ret;
>>>>>>>>> -
>>>>>>>>> -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>>>>>>>> -		WARN_ON_ONCE(is_iomem);
>>>>>>>>> -		if (write)
>>>>>>>>> -			memcpy(ptr, buf, bytes);
>>>>>>>>> -		else
>>>>>>>>> -			memcpy(buf, ptr, bytes);
>>>>>>>>> -		ttm_bo_kunmap(&map);
>>>>>>>>> -
>>>>>>>>> -		page++;
>>>>>>>>> -		buf += bytes;
>>>>>>>>> -		bytes_left -= bytes;
>>>>>>>>> -		offset = 0;
>>>>>>>>> -	} while (bytes_left);
>>>>>>>>> -
>>>>>>>>> -	return len;
>>>>>>>>> -}
>>>>>>>>> -
>>>>>>>>>      int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>>>>>      		     void *buf, int len, int write)
>>>>>>>>>      {
>>>>>>>>> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>>>>>      	unsigned long offset = (addr) - vma->vm_start +
>>>>>>>>>      		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>>>>>>>>      		 << PAGE_SHIFT);
>>>>>>>>> -	int ret;
>>>>>>>>> -
>>>>>>>>> -	if (len < 1 || (offset + len) > bo->base.size)
>>>>>>>>> -		return -EIO;
>>>>>>>>> -	ret = ttm_bo_reserve(bo, true, false, NULL);
>>>>>>>>> -	if (ret)
>>>>>>>>> -		return ret;
>>>>>>>>> -
>>>>>>>>> -	switch (bo->resource->mem_type) {
>>>>>>>>> -	case TTM_PL_SYSTEM:
>>>>>>>>> -		fallthrough;
>>>>>>>>> -	case TTM_PL_TT:
>>>>>>>>> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>>>>>>>>> -		break;
>>>>>>>>> -	default:
>>>>>>>>> -		if (bo->bdev->funcs->access_memory)
>>>>>>>>> -			ret = bo->bdev->funcs->access_memory(
>>>>>>>>> -				bo, offset, buf, len, write);
>>>>>>>>> -		else
>>>>>>>>> -			ret = -EIO;
>>>>>>>>> -	}
>>>>>>>>> -
>>>>>>>>> -	ttm_bo_unreserve(bo);
>>>>>>>>> -
>>>>>>>>> -	return ret;
>>>>>>>>> +	return ttm_bo_access(bo, offset, buf, len, write);
>>>>>>>>>      }
>>>>>>>>>      EXPORT_SYMBOL(ttm_bo_vm_access);
>>>>>>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>>>>>>> index 5804408815be..8ea11cd8df39 100644
>>>>>>>>> --- a/include/drm/ttm/ttm_bo.h
>>>>>>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>>>>>>> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>>>>>>>>      int ttm_bo_evict_first(struct ttm_device *bdev,
>>>>>>>>>      		       struct ttm_resource_manager *man,
>>>>>>>>>      		       struct ttm_operation_ctx *ctx);
>>>>>>>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>>>>>>>> +		  void *buf, int len, int write);
>>>>>>>>>      vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>>>>>>>      			     struct vm_fault *vmf);
>>>>>>>>>      vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>>>>>> -- 
>>>>>>>>> 2.34.1
>>>>>>>>>

--------------5igpWynrNtgKY0QkNsGgVUsl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 06.11.24 um 16:25 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Can you fully describe your use case? In other words what exactly is your
debugger trying to do?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
See above; I hope I've made this clearer.</pre>
    </blockquote>
    <br>
    It at least sounds a little bit better.<br>
    <br>
    <blockquote type="cite" cite="mid:ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">Also, I'm not really an expert on Eudebug, as I haven't been involved in
the development aside from reviewing its interaction with the core of
Xe. Any further explanation would likely require me to loop in a
colleague.</pre>
    </blockquote>
    <br>
    I think that could help since I don't have a clear picture of your
    use case.<br>
    <br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Well, I think we need to take a step back. The major question is what is
your use case and is that use case valid or causes security concerns.

For example userptrs are imported anonymous pages the GPU has a DMA mapping
for. Re-mapping them into an user address space for debugging or even
accessing them through the ptrace interface is strictly forbidden.

We already had people trying to do exactly that and it ended not well at
all.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Again, if we can focus on what this patch is doing—accessing a BO, not a
userptr—I think that will help progress here.

To bring things together: &quot;There is a huge push from upstream to avoid
using kmap/vmap if possible.&quot; How would you suggest accessing a BO then?</pre>
    </blockquote>
    <br>
    Well that's the whole point: You should *not* access the BO on
    behalves of userspace in a peek/poke like interface.<br>
    <br>
    <blockquote type="cite" cite="mid:ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
failing to see the problem with adding a simple helper based on existing
code.</pre>
    </blockquote>
    <br>
    What#s possible and often done is to do kmap/vmap if you need to
    implement a CPU copy for scanout for example or for
    copying/validating command buffers. But that usually requires
    accessing the whole BO and has separate security checks.<br>
    <br>
    When you want to access only a few bytes of a BO that sounds
    massively like a peek/poke like interface and we have already
    rejected that more than once. There even used to be standardized GEM
    IOCTLs for that which have been removed by now.<br>
    <br>
    If you need to access BOs which are placed in not CPU accessible
    memory then implement the access callback for ptrace, see
    amdgpu_ttm_access_memory for an example how to do this.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
With this, I strongly prefer the code as is.

Matt

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Matt

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Matt

</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">Reported-by: Christoph Manszewski<a class="moz-txt-link-rfc2396E" href="mailto:christoph.manszewski@intel.com">&lt;christoph.manszewski@intel.com&gt;</a>
Suggested-by: Thomas Hellström<a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Matthew Brost<a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Tested-by: Mika Kuoppala<a class="moz-txt-link-rfc2396E" href="mailto:mika.kuoppala@linux.intel.com">&lt;mika.kuoppala@linux.intel.com&gt;</a>
Reviewed-by: Matthew Auld<a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
---
    drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
    drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
    include/drm/ttm/ttm_bo.h          |  2 +
    3 files changed, 89 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d939925efa81..77e760ea7193 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
    	return progress;
    }
+
+static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
+			      unsigned long offset,
+			      void *buf, int len, int write)
+{
+	unsigned long page = offset &gt;&gt; PAGE_SHIFT;
+	unsigned long bytes_left = len;
+	int ret;
+
+	/* Copy a page at a time, that way no extra virtual address
+	 * mapping is needed
+	 */
+	offset -= page &lt;&lt; PAGE_SHIFT;
+	do {
+		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
+		struct ttm_bo_kmap_obj map;
+		void *ptr;
+		bool is_iomem;
+
+		ret = ttm_bo_kmap(bo, page, 1, &amp;map);
+		if (ret)
+			return ret;
+
+		ptr = (void *)ttm_kmap_obj_virtual(&amp;map, &amp;is_iomem) + offset;
+		WARN_ON_ONCE(is_iomem);
+		if (write)
+			memcpy(ptr, buf, bytes);
+		else
+			memcpy(buf, ptr, bytes);
+		ttm_bo_kunmap(&amp;map);
+
+		page++;
+		buf += bytes;
+		bytes_left -= bytes;
+		offset = 0;
+	} while (bytes_left);
+
+	return len;
+}
+
+/**
+ * ttm_bo_access - Helper to access a buffer object
+ *
+ * @bo: ttm buffer object
+ * @offset: access offset into buffer object
+ * @buf: pointer to caller memory to read into or write from
+ * @len: length of access
+ * @write: write access
+ *
+ * Utility function to access a buffer object. Useful when buffer object cannot
+ * be easily mapped (non-contiguous, non-visible, etc...).
+ *
+ * Returns:
+ * @len if successful, negative error code on failure.
+ */
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write)
+{
+	int ret;
+
+	if (len &lt; 1 || (offset + len) &gt; bo-&gt;base.size)
+		return -EIO;
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+	if (ret)
+		return ret;
+
+	switch (bo-&gt;resource-&gt;mem_type) {
+	case TTM_PL_SYSTEM:
+		fallthrough;
+	case TTM_PL_TT:
+		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
+		break;
+	default:
+		if (bo-&gt;bdev-&gt;funcs-&gt;access_memory)
+			ret = bo-&gt;bdev-&gt;funcs-&gt;access_memory
+				(bo, offset, buf, len, write);
+		else
+			ret = -EIO;
+	}
+
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_access);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 2c699ed1963a..20b1e5f78684 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
    }
    EXPORT_SYMBOL(ttm_bo_vm_close);
-static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
-				 unsigned long offset,
-				 uint8_t *buf, int len, int write)
-{
-	unsigned long page = offset &gt;&gt; PAGE_SHIFT;
-	unsigned long bytes_left = len;
-	int ret;
-
-	/* Copy a page at a time, that way no extra virtual address
-	 * mapping is needed
-	 */
-	offset -= page &lt;&lt; PAGE_SHIFT;
-	do {
-		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
-		struct ttm_bo_kmap_obj map;
-		void *ptr;
-		bool is_iomem;
-
-		ret = ttm_bo_kmap(bo, page, 1, &amp;map);
-		if (ret)
-			return ret;
-
-		ptr = (uint8_t *)ttm_kmap_obj_virtual(&amp;map, &amp;is_iomem) + offset;
-		WARN_ON_ONCE(is_iomem);
-		if (write)
-			memcpy(ptr, buf, bytes);
-		else
-			memcpy(buf, ptr, bytes);
-		ttm_bo_kunmap(&amp;map);
-
-		page++;
-		buf += bytes;
-		bytes_left -= bytes;
-		offset = 0;
-	} while (bytes_left);
-
-	return len;
-}
-
    int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
    		     void *buf, int len, int write)
    {
@@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
    	unsigned long offset = (addr) - vma-&gt;vm_start +
    		((vma-&gt;vm_pgoff - drm_vma_node_start(&amp;bo-&gt;base.vma_node))
    		 &lt;&lt; PAGE_SHIFT);
-	int ret;
-
-	if (len &lt; 1 || (offset + len) &gt; bo-&gt;base.size)
-		return -EIO;
-	ret = ttm_bo_reserve(bo, true, false, NULL);
-	if (ret)
-		return ret;
-
-	switch (bo-&gt;resource-&gt;mem_type) {
-	case TTM_PL_SYSTEM:
-		fallthrough;
-	case TTM_PL_TT:
-		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-		break;
-	default:
-		if (bo-&gt;bdev-&gt;funcs-&gt;access_memory)
-			ret = bo-&gt;bdev-&gt;funcs-&gt;access_memory(
-				bo, offset, buf, len, write);
-		else
-			ret = -EIO;
-	}
-
-	ttm_bo_unreserve(bo);
-
-	return ret;
+	return ttm_bo_access(bo, offset, buf, len, write);
    }
    EXPORT_SYMBOL(ttm_bo_vm_access);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5804408815be..8ea11cd8df39 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
    int ttm_bo_evict_first(struct ttm_device *bdev,
    		       struct ttm_resource_manager *man,
    		       struct ttm_operation_ctx *ctx);
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write);
    vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
    			     struct vm_fault *vmf);
    vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
-- 
2.34.1

</pre>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------5igpWynrNtgKY0QkNsGgVUsl--
