Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502EE9C84E8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E8810E34D;
	Thu, 14 Nov 2024 08:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U6tYuZfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BF610E34D;
 Thu, 14 Nov 2024 08:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrxulBtYOJRQ+6Uw9S+QYICxDzqH9taAMNSm7zk01VjnzMbdIEBfvvvHzFj946CBa+tab7xYVQ1yEuQSKCJZJVh+1YNnnNy7pdillGXqdtNwmH9XYve9aoO/j/1+7HWGtVcy7fpmbfQH/nin6uzGgorqiMz2a/wTNLpfDPBsn2Kk+iLcFTdmEUdkKtyj3+e58HUCxGVd/HhQ5XfP5CEzczUy6p+JoBdy6UiDCUd/tkCLR0/h40aznCqfN9nvWo09do/dBWOh0tca7v5sY2tMrAZgyt0B4JDMD1gOxWEBRhPRGq6woSdNGZ0xHzZrNF9TArktl0cqfXADTJs02Cjcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbEn5PV4uXxVkbrOIo1zzIu8StLJdOkzvq3BMk6FXLg=;
 b=PbT6qY7IqoRH179O7A/6vb641vkViCCzMYr4vrVrQ/j3WOnmWbqhR6Kh/iB/yY+PfoxTuH07LNZKK+8wqQT6g1YTq78KlfVd40oV3/lBqJbP752iJRDFTzon9ICqIcLFTXBkRnMg6pju54o3Pg8DLhMFbWsQmqH8xDa3aHHOuk372tRcRThgfdL5Q91SFXMUUmygRF7iam1k6AU9YIpbzyjmfwJbpXlLcXBnmTV1qxgFsV//vFH5fOvzZd4aANxD7EhGN4Gh5Zu5D2i9bAC6G3k6P9gQPlL8Qfjc4PvMWDAaY8wqWr++a0Jwx+z3fcayWtd9alo6Kx2L3Vv+lj032w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbEn5PV4uXxVkbrOIo1zzIu8StLJdOkzvq3BMk6FXLg=;
 b=U6tYuZfv075u+Uzdm1DJVDooDPUjLFK4GSo8AxL0Y5QJCNyHcdmDIUDz3YGJ9pgVAyVlLvNWne/1Zo2QhygZq/gaEeGRbl9cVJBUoCkUh5WcwmlXGRrc2r165K+QW/U9stvP8jb3pZ5JTHZLqbDrebHb3cnEmQhwAmgs0+mfEWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 08:38:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 08:38:49 +0000
Content-Type: multipart/alternative;
 boundary="------------QiJoa8ATk7VkiR0EJHo4I8HN"
Message-ID: <d6da2891-f7d0-4c08-b758-f5becc7a12e0@amd.com>
Date: Thu, 14 Nov 2024 09:38:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
 <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
 <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
 <ZzQOkyyQeZ3SkcHd@lstrano-desk.jf.intel.com>
 <ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com>
 <ac5b9c6e-027a-40e2-bdab-2cc5e10067d6@amd.com>
 <ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a0bd91-5436-46f2-6108-08dd0487c2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEZQRi9QZTBISUwrRlFRK3VDSURSdnl0UytUSE9xUTJJOGhIR0QzbStMSXZz?=
 =?utf-8?B?RThGSUZuN3RiS2ozMUlGR3c4VjNTZmZBckdwVXdpY0V6VmEyOG5rU2FGaWE3?=
 =?utf-8?B?RXRYQmtwUTl5ZGk1Vk5kZURLWi9BY090MU9iZTROakN5aG1mY2lXdDBwZTVi?=
 =?utf-8?B?VDFhRkZodEJDYk9wTG9UZjAzUm1xSnYzU0dkbmdYRTJVUUxudHV4Nk1LVC8v?=
 =?utf-8?B?NE41Smc0dmxYb3gwTzVXeWxOdU1sOWRDaDZaSHVUNXpWTS9IZ3BGYlAxSkFG?=
 =?utf-8?B?SWhldEs5RzJadldKQlRoemthYzRJc3VHbmRhaW9zbTUrcDhZNi9IMDNQcVhq?=
 =?utf-8?B?RlBMcmtzZEJwZnpnVjFkVDNzL3VwNXFiekl5WkFWREpVZmZoU2prc2VDUHpG?=
 =?utf-8?B?M2R3T3g3MzJTSlVVb25aMkMzNzZDTnRYQVFNOU9kRDRiNGIzMXgrOU1Ic1Rj?=
 =?utf-8?B?cngrQnZ6Ym9RaUprT1Z0M24vVXU0dG5BZEVRMmhMTlgrMVZWNHdqd1hpb1hn?=
 =?utf-8?B?WmZWNmVjdWQ4anNyTXFhZEVGMXNiMFA5TVVHb3hueHhkMS9QOEpyek9CcVJa?=
 =?utf-8?B?azltcmRVdUROVitJOFlHYi92eFRUaUhYMWt0UzIrT0FWeTBWU1czNEp1VjJK?=
 =?utf-8?B?VlhxZllLeVZhZWNKaUNoVjB0NGFpa2xqVVpXM1ZrM3lFS1kyaS9nSkdUNDJT?=
 =?utf-8?B?WHV0UlRQTFlsZ2JCRXBxdzlSYXRJRlhDclo3UUtZZUxneU5udXVKbDlXdUxh?=
 =?utf-8?B?c3FJRmhYVGVTS0xjaVlVSGcweVpDSFpuVzlDKzcrNzZlcFBxbElvYk4vZkRC?=
 =?utf-8?B?aVF4YzZqaEkrdHNzN25aaHp2YnFiVzhtSVBiL0RRR29VWmFLWXFjNEtVcjgy?=
 =?utf-8?B?SEtEQU1WbCtYRDRmNlRiYTgwUUY3aVIwbTZQVi8ranJuMVRyQ1N4b1daN1Q5?=
 =?utf-8?B?emZnVlZ3aFpHT1hJK1pZbmNDZXd4ZUwzMzQzYW90YVR6MVdXZS8zZytJSXRP?=
 =?utf-8?B?K1RHQ3gvbmNqN3U1UTNwSCsyN3lFNnY3TkYvL3lGbGxFMndOd0M5bHNITnVx?=
 =?utf-8?B?aE9XRFhBcUdKeHVIV3JZaUNkNXVjOWpXSlkybUpsVGNueWNzNHdBTVFhYWM3?=
 =?utf-8?B?cCtOVEhkM2I3NmpEOWJiY3phWGxjVkplNUVnRVljWC9IdkpYSTBIbXFnbGNo?=
 =?utf-8?B?TDBFbzI5QUY4b3ROeEd0MnozbGEwQXdpd1lXcjJvVmFyM3EwSmtVTmlIS3VE?=
 =?utf-8?B?aTN2cXlhWTNwZXQzMDBZSmVuaGdxampBZjZVVnBqdE9UcElOZnNBaENmYWhP?=
 =?utf-8?B?cnlLUHBOSE43WStsTWJxdHJsOEhWaUFpdEV2eUtVeTdocGhFelkzdStPMVgr?=
 =?utf-8?B?T3JxdUYrbU5oRjZ6dW83MFk2K0dyNXkzNUI4SzRKK0RDaFI0aG84S1ZqREZU?=
 =?utf-8?B?VjEwMS85VVFvR0haeFYrMUhnZjgrZ2tNM3d6R0E5em1wcWJpbHVOUEtVWXVq?=
 =?utf-8?B?cDRlQWdmdktOcTVzaktwN1lmdnowMHFsYW5JcTdqL3lHM3BLOFBkY0lkWjJV?=
 =?utf-8?B?Vk1Nc1pHTEhScjAyTDRUTCtTY2J6UnJvcW1hL2p0bitSY3E1QTNVNGhwaWFu?=
 =?utf-8?B?akFHVVdIa2FEcndDR0ZIaEMxNGgvU2lna3JkYm5Ya3ExZjdua0Z1US9Gc05o?=
 =?utf-8?B?R0lHYkN2RzhpMXE3SEYwZmRNVnRUdmh1RjIycVdxL1hBSjBQR0kySlNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2dGRUdGY3BWMXpIWkVJMWswRkFGa3d6UFNwcDRYMWF4Q1Q1S0w0OS9jRVBu?=
 =?utf-8?B?eE8waDN0eDRER3Y0bG1XMG9waUNZWlY0TnJkY1lha2p0ZkRoOU9vWG9KbW5w?=
 =?utf-8?B?RjI2V1BZZkJ2UnlCeTFCQlkzZ2t0SmI1MER2Z21xN0RRQ3crVjQwbVRIYmJx?=
 =?utf-8?B?Y3FIN3hlaGdlQUlTeEJ2U0hHdFNmMjcxeCtGaUR4UlAvUVZ1MVZiN2NKUFZN?=
 =?utf-8?B?S01MdjNXemR6c3NidWF5OXM1MHQ4bGhjNlhhb1RCUDBScjRXVzVyY1lzWmRG?=
 =?utf-8?B?NnliK2R4UVhPMXMrMzRBVFZvSExLQ21GZDMzcHRqQXBKcDQzQldUa1NLS1BX?=
 =?utf-8?B?NjU4aEU1RFJRYk41UlBOdSthekYxTWNxOGdyaUJzZWJPZnlyNWM0WEFWTnE2?=
 =?utf-8?B?N3U0ZXlvWmlJdStiNW9JQ1FOQnMwK3JNR2FlTVFiVnAwODBpTE0xNHNQaW5Y?=
 =?utf-8?B?NHJwdi9LM1E4aS9Pb3BkSklMdXNueVp5cTBuVS9aRGlmMndRNkpDQWdwczMr?=
 =?utf-8?B?WFpUTDBzTFF2RFY3UldwcEJhN1lsdnJ2eXRTR1ZiN0JZTGJSak9jWFhxeVVw?=
 =?utf-8?B?cEZlTzAwc0FaTnN4Z0VyaDMyMmdkdU9BUytpOGorcC9XRTJpQUhta3drdndU?=
 =?utf-8?B?ODRKeWtoK1VNTGY5dFQyeWR0cnJ5blBnNys0STc4VGxYRUR5ZUtPVzFYZVdM?=
 =?utf-8?B?TTRZZTdPYjdRUHVQYUR4ZVZqYTNTbU1BT0lsTk81a0pMRFNmMXZQTlZrZkNO?=
 =?utf-8?B?L1NXRzNTV0VpTHRXT2ZlcENNUUxqdFdSeFdyL0xWOThtaE5tU3JZcXkxL2Z3?=
 =?utf-8?B?aVBPRGR2M2U4L0hoQisrN2krZXE2WDhrYUxjaU52RGNmai9aRWNHeVVHdE1o?=
 =?utf-8?B?dnJLekJZSUJCV0JTRHVsRlVhNGI1QVdCYjNkNVh6Qk5EV05rbm5WNzJGTGxC?=
 =?utf-8?B?UlNORmJBcVRYS1JQYW1Oc0hkbFVJYmNIWW5tc1V1Q1cxcS9kUVd4WVVCcGFW?=
 =?utf-8?B?bkJHZUdoMm5NTlJKcGhXVEFjSm42ZTlWTWlIY2UxbVRIM0dBM2dVQXdwU2I4?=
 =?utf-8?B?Vnd4S1VxYk54bk0ySTQ1ZVFPNWtjLzRQR3dnTDJBVU5CR1lLQm0wRGNTeVkz?=
 =?utf-8?B?MWhjZW9ZQWhVd1JzZHdra1VxeW53d3UyL0lrWFEwV0Y1NEwyOUFrUlZHR2Zs?=
 =?utf-8?B?VFpkZkVzdHRRSU5DMDBPeVp1U2hEZmVVeEF2RGlLNnNTa2VwNzRYSXdqdXdC?=
 =?utf-8?B?dGRib1ZJeld5ZmpCOHBuQlQwN3VHdFNMZFQ1emhmcXlQYWhhTUJ6dzNnc05k?=
 =?utf-8?B?WjBKZXJtKyt5Z1RhT001Zkx5MXFuYWlkNTQxNDZwSlYvMHJoSlFGMTI2Lzlv?=
 =?utf-8?B?Z3FQMTRhVmw3UkR4NmZOdGFaUllyVlMvMlVERkxPSlVwcWQzUml2TGxoeFNl?=
 =?utf-8?B?UFRnbmJiVjdOMndOTWpiK2FvdVJrdmRNams5NUdleWNmRXZULzRaMVVVZStZ?=
 =?utf-8?B?aHZRVEhlQzFtY1RuZ09KUHhWOSt2ZjZ0L2h4dVVJeWYvTHIwNFpnV244cFpZ?=
 =?utf-8?B?NlovdEhVaFJ4aEs3VXQvdnRZazlja256Mkh6OUFUdEQ3WldJeGwvbmxBT0N5?=
 =?utf-8?B?U21UR1hEL0IxM2RvTXlRSFZXNW5XbkEzbDNXVDN2dWw1cTg3RE5vWWFKYzk0?=
 =?utf-8?B?d25HZ1pZOEJReFgwTStPUk1TcFh0czlkbWlZemxBa05nbDc5QXcyZFV5N3dh?=
 =?utf-8?B?ZjNYWTRvSENHUXpVRjg1N3VjZnJMbkgzVHZwRmZmRDNxb2VDbENGbThyNE1E?=
 =?utf-8?B?VzFOUDM4cWF1QlFaTVlJdzdyS1pBWWlGUHZQL2tnUUhBeGtVQXBHblhHYnlx?=
 =?utf-8?B?dzMvL3FhTVJjV1RFL3hFa1h0cjR4Q1lVTFlCSEpWZ3NDVC9Lc3pJcGt4aldq?=
 =?utf-8?B?bWxXeUU5OVpIUytYNXp0TEFNUnJaOGhidGVEcktnTDlrcnI2UjFnMmdjQUFN?=
 =?utf-8?B?bG9kTmhYVm9YYmRzZ3ZMWHN2bFcyMmN1N3NQRXN4Yys1eTRITHVsc2RobjZm?=
 =?utf-8?B?ekxrbFo3MktxQlNXOUkwTURrRFQrWnBBNVNvWEFFanQydXNHNEU0Z0FpWWNo?=
 =?utf-8?Q?wGROz+QP+Dqh+ESAxdMbdNhLG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a0bd91-5436-46f2-6108-08dd0487c2ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 08:38:49.2476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uahzl+D3Z8hl8YidLFTuJ8C6Xt43OUHZjXKIyZ0hEl7NWYUfB+YmO9dfWo6I7xKc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431
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

--------------QiJoa8ATk7VkiR0EJHo4I8HN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.11.24 um 16:34 schrieb Matthew Brost:
>>>>>> Now the ordering works inherently in dma-resv and the scheduler. e.g. No
>>>>>> need to track the last completion fences explictly in preempt fences.
>>>>> I really don't think that this is a good approach. Explicitly keeping the
>>>>> last completion fence in the pre-emption fence is basically a must have as
>>>>> far as I can see.
>>>>>
>>>>> The approach you take here looks like a really ugly hack to me.
>>>>>
>>>> Well, I have to disagree; it seems like a pretty solid, common design.
>> What you basically do is to move the responsibility to signal fences in the
>> right order from the provider of the fences to the consumer of it.
>>
> Are there not ordering rules already built into dma-resv? This is just
> extending those preempt fences.

Well, the usage flags are to distinct which fences should be queried for 
which use case.

The order the fence are used and returned is completely undetermined. 
E.g. currently you can get READ, WRITE fences all mixed together.

> I can maybe buy some of this argument, as if a random yahoo enables
> signaling a preempt fence without properly going through dma-resv or the
> scheduler, then yes, that could break things. But don't do that. In Xe,
> we have exactly two places where these can be triggered: in the TTM BO
> move vfunc (which the scheduler handles) and in the MMU invalidation
> path (dma-resv).

Yeah, but the purpose of all this is that the dma-resv object is 
shareable between device drivers.

That one device driver comes up with a new requirement is certainly 
possible, but then we need to make sure that all others can live with 
that as well.

Just saying that we limit our scope to just the requirements of one 
driver because other are never supposed to see this fence is a recipe 
for problems.

> I would expect all drivers and users of dma-resv and the scheduler with
> preempt fences to use the proper interfaces to signal preempt fences,
> rather than bypassing this thus ensuring the common rules for preempt
> fences are adhered to.

Waiting for fences in any order is part of the design and a requirement 
by some consumers.

See nouveau_fence_sync() for an example of what is usually done, radeon 
has similar requirements.

But those approaches are here to for optimization purposes only and not 
for correctness.

That a driver says "My fences must be waited on first A, then B" is 
something completely new.

>> Since we have tons of consumers of that stuff this is not even remotely a
>> defensive design.
> I can consider other designs, but I do think larger community input may
> be required, as you mentioned there are several consumers of this code.

Each fence is an independent object without dependencies on anything 
else. Imposing some order on consumers of dma_fences is clearly going 
against that.

>>>> Anyway, I think I have this more or less working. I want to run this by
>>>> the Mesa team a bit to ensure I haven't missed anything, and will likely
>>>> post something shortly after.
>>>>
>>>> We can discuss this more after I post and perhaps solicit other
>>>> opinions, weighing the pros and cons of the approaches here. I do think
>>>> they function roughly the same, so something commonly agreed upon would
>>>> be good. Sharing a bit of code, if possible, is always a plus too.
>> Well to make it clear that will never ever get a green light from my side as
>> DMA-buf maintainer. What you suggest here is extremely fragile.
>>
> It is unfortunate that this is your position, and I do feel it is a bit
> premature to suggest as much. I didn’t know being a maintainer was akin
> to being a dictator. As I’ve said multiple times, I feel this warrants a
> bit more discussion with more stakeholders. If this is unacceptable,
> sure, I can change it.

I'm sorry when you feel like that, it's really not my intention to 
dictate anything. I have probably over-reacted.

It's just to me suggesting this solution is so far of that I can't 
really understand how you came up with that.

I perfectly understand that you must have some reason for it, I just 
don't see it.

Maybe we should concentrate on understanding those reasoning first 
instead of discussing a possible solution.

>> Why not simply wait for the pending completion fences as dependency for
>> signaling preemption fences?
>>
>> That should work for all drivers and is trivial to implement as far as I can
>> see.
> Again, this is hard to understand without a clear picture of what AMD is
> doing. I pointed out a dma-fencing problem in the code on the list, and
> the response was, "Well, we have some magic ordering rules that make it
> safe." That might be true, but if you annotated your code, lockdep would
> complain. Anything that cannot be annotated is a non-starter for me.
> This makes me nervous that, in fact, it is not as trivial as you
> suggest, nor is the design as sound as you believe.

I'm pretty sure that the code is not even remotely bug free. The design 
and code has been under development for the last 16 month or so and is 
now published bit by bit.

We completely missed both during internal review as well as testing that 
lockdep should complain about it and I'm actually not sure why it doesn't.

The full code should land in amd-staging-drm-next in the next few 
days/weeks, I can give you a detailed date later today.

> Anyways, I'll still likely post a common solution with annotations. If
> it is rejected, so be it, and I will rework it.

Well that sounds great. But let us discuss what this solution looks like 
instead of jumping ahead and implementing something.

Regards,
Christian.

>
> In spirit of open development here is my code in a public branch:
>
> Kernel:https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-umd-submission/-/tree/v2-11-13-24?ref_type=heads
> IGT:https://gitlab.freedesktop.org/mbrost/igt-gpu-tools-umd-submission/-/tree/umd_submission.v2?ref_type=heads
>
> Matt
>
>> Regards,
>> Christian.
>>
>>>> Matt
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>

--------------QiJoa8ATk7VkiR0EJHo4I8HN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 13.11.24 um 16:34 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Now the ordering works inherently in dma-resv and the scheduler. e.g. No
need to track the last completion fences explictly in preempt fences.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I really don't think that this is a good approach. Explicitly keeping the
last completion fence in the pre-emption fence is basically a must have as
far as I can see.

The approach you take here looks like a really ugly hack to me.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Well, I have to disagree; it seems like a pretty solid, common design.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
What you basically do is to move the responsibility to signal fences in the
right order from the provider of the fences to the consumer of it.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Are there not ordering rules already built into dma-resv? This is just
extending those preempt fences.</pre>
    </blockquote>
    <br>
    Well, the usage flags are to distinct which fences should be queried
    for which use case.<br>
    <br>
    The order the fence are used and returned is completely
    undetermined. E.g. currently you can get READ, WRITE fences all
    mixed together.<br>
    <br>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">I can maybe buy some of this argument, as if a random yahoo enables
signaling a preempt fence without properly going through dma-resv or the
scheduler, then yes, that could break things. But don't do that. In Xe,
we have exactly two places where these can be triggered: in the TTM BO
move vfunc (which the scheduler handles) and in the MMU invalidation
path (dma-resv).</pre>
    </blockquote>
    <br>
    Yeah, but the purpose of all this is that the dma-resv object is
    shareable between device drivers.<br>
    <br>
    That one device driver comes up with a new requirement is certainly
    possible, but then we need to make sure that all others can live
    with that as well.<br>
    <br>
    Just saying that we limit our scope to just the requirements of one
    driver because other are never supposed to see this fence is a
    recipe for problems. <br>
    <br>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">I would expect all drivers and users of dma-resv and the scheduler with
preempt fences to use the proper interfaces to signal preempt fences,
rather than bypassing this thus ensuring the common rules for preempt
fences are adhered to.</pre>
    </blockquote>
    <br>
    Waiting for fences in any order is part of the design and a
    requirement by some consumers.<br>
    <br>
    See nouveau_fence_sync() for an example of what is usually done,
    radeon has similar requirements.<br>
    <br>
    But those approaches are here to for optimization purposes only and
    not for correctness.<br>
    <br>
    That a driver says &quot;My fences must be waited on first A, then B&quot; is
    something completely new.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Since we have tons of consumers of that stuff this is not even remotely a
defensive design.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I can consider other designs, but I do think larger community input may
be required, as you mentioned there are several consumers of this code.</pre>
    </blockquote>
    <br>
    Each fence is an independent object without dependencies on anything
    else. Imposing some order on consumers of dma_fences is clearly
    going against that.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Anyway, I think I have this more or less working. I want to run this by
the Mesa team a bit to ensure I haven't missed anything, and will likely
post something shortly after.

We can discuss this more after I post and perhaps solicit other
opinions, weighing the pros and cons of the approaches here. I do think
they function roughly the same, so something commonly agreed upon would
be good. Sharing a bit of code, if possible, is always a plus too.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well to make it clear that will never ever get a green light from my side as
DMA-buf maintainer. What you suggest here is extremely fragile.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It is unfortunate that this is your position, and I do feel it is a bit
premature to suggest as much. I didn’t know being a maintainer was akin
to being a dictator. As I’ve said multiple times, I feel this warrants a
bit more discussion with more stakeholders. If this is unacceptable,
sure, I can change it.</pre>
    </blockquote>
    <br>
    I'm sorry when you feel like that, it's really not my intention to
    dictate anything. I have probably over-reacted.<br>
    <br>
    It's just to me suggesting this solution is so far of that I can't
    really understand how you came up with that.<br>
    <br>
    I perfectly understand that you must have some reason for it, I just
    don't see it.<br>
    <br>
    Maybe we should concentrate on understanding those reasoning first
    instead of discussing a possible solution.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Why not simply wait for the pending completion fences as dependency for
signaling preemption fences?

That should work for all drivers and is trivial to implement as far as I can
see.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Again, this is hard to understand without a clear picture of what AMD is
doing. I pointed out a dma-fencing problem in the code on the list, and
the response was, &quot;Well, we have some magic ordering rules that make it
safe.&quot; That might be true, but if you annotated your code, lockdep would
complain. Anything that cannot be annotated is a non-starter for me.
This makes me nervous that, in fact, it is not as trivial as you
suggest, nor is the design as sound as you believe.</pre>
    </blockquote>
    <br>
    I'm pretty sure that the code is not even remotely bug free. The
    design and code has been under development for the last 16 month or
    so and is now published bit by bit.<br>
    <br>
    We completely missed both during internal review as well as testing
    that lockdep should complain about it and I'm actually not sure why
    it doesn't.<br>
    <br>
    The full code should land in amd-staging-drm-next in the next few
    days/weeks, I can give you a detailed date later today.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">Anyways, I'll still likely post a common solution with annotations. If
it is rejected, so be it, and I will rework it.</pre>
    </blockquote>
    <br>
    Well that sounds great. But let us discuss what this solution looks
    like instead of jumping ahead and implementing something.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZzTHCazEEn5hHydL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

In spirit of open development here is my code in a public branch:

Kernel: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-umd-submission/-/tree/v2-11-13-24?ref_type=heads">https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-umd-submission/-/tree/v2-11-13-24?ref_type=heads</a>
IGT: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mbrost/igt-gpu-tools-umd-submission/-/tree/umd_submission.v2?ref_type=heads">https://gitlab.freedesktop.org/mbrost/igt-gpu-tools-umd-submission/-/tree/umd_submission.v2?ref_type=heads</a>

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Matt

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------QiJoa8ATk7VkiR0EJHo4I8HN--
