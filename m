Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B325B969F5C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 15:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7292510E5B0;
	Tue,  3 Sep 2024 13:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EUaLGuFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2757E10E5A8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 13:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzXKtmOczwuU46nutgBlIOMoPUXsFQXfHO7ZcmcSvZ31xn5/hnSsse42vG93ELt+UTMufqdRxih1HVNy/QrIpWEjTIWONnXNqdRAWOO6DQIbJvUlNR8qIRBFBVmyRkxgNqZNAH9bh4EVYHdpv9DaJeTez0k01txNvxILcWNm+WtRQAG7x0qeDFbrqwRL3fwxaoMpWZPLoz4DTNOJEUnSRTPY1ZB6CBRWHB0eGz/7CT3O07jCtH6GG6pJh+3Yc7ca3Ztp0PSxT9Tpt0q/irFuVuERyit/mKdDED4QxPMCWux4OFBYeVs3MgSVfa93c2hvv8IamObFQ3zPQsBxYoPAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySUUkjOdT33Ojn05AG/DMGe3jdZGYwU6/uPeU/gIg2g=;
 b=jBVY/pAMxCXJno943aTZdAWg7TI9mEAulMLmQplSBPOqo4uHCHTdyqiEOxVsWLaWM9QGlT46sO1LVqIjYbi6LjvNjB8rc8/rQGbso6vFCNmXMNoA4+PW7q7JmogWfSVKEo7RFwRkowIfpcKjVE6QR/dGyOYPgznVwiHENtNkKnp5ws+nphoUNorYcjEOz4r0ypS/Z5HOnkh0urn/RCarlPl1bk1gl65wtZrwF8V22AaJ4adt1tlPWUaymOVlidVw9HH3G78RI4/HPS5qOCSzkdN/xTzmRWRnA6rmCiJzVbycRS6/I8L77IwA9KB2S/37unf55EFvboRqxH2XigIzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySUUkjOdT33Ojn05AG/DMGe3jdZGYwU6/uPeU/gIg2g=;
 b=EUaLGuFoVKYapD/oEGYHIwtsgZkxwkA5XDDdCpYk1hyWAZxqid91JBLhyVOq1zB2+VaoCbFHw0m7e8wiU9vn/aWxUh2rbT8sKi8ik4Wb0aPNDKvmLyGsfdFy3dPQ1zg0aEaVhkfqbbCKbTNYz3YyRt4rrZti32wGIwVPVJmvJmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6966.namprd12.prod.outlook.com (2603:10b6:a03:449::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 13:46:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 13:46:50 +0000
Content-Type: multipart/alternative;
 boundary="------------9RjaUZPYNK7KvPXSc34C8iSm"
Message-ID: <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
Date: Tue, 3 Sep 2024 15:46:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
X-ClientProxiedBy: FR4P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a20ea06-89dc-4b84-1fd3-08dccc1edcc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWRscUtyQWNEQmZBcnc2T2IrYmZUVXRLcmx6YlBtL2tyMWpzNWZUMXo4Q3FO?=
 =?utf-8?B?UkpGaEpSclVyejNIbmRoWWJJYmJhMWp3dEpvNitWcXJvdUFJc0tRdlZyRGIz?=
 =?utf-8?B?UEhYQmFOb25tdUJOV2RsK1NmbVFyQXlFUGdGdUxtcnNhZ2toaG5YazU2Nndv?=
 =?utf-8?B?ZXc0TU5aNnJiZWJEMWhYWCs4NmtZNEZhTjJ1NHhYamdFMmFQSXVWcTROeFp1?=
 =?utf-8?B?QUhvRThzNXdpOURGYTQwNERlZnlWODY5b0NHSVRoMUhrZ0JsUGxpc2xnc3o3?=
 =?utf-8?B?OXc0SkM4QjFOcWRPV0ZTRzFPTHpwemVCcDhaZTk5UVRnbWdCck4yZlg1QVlL?=
 =?utf-8?B?TGFKeUY4a0hWUUozS2ZGVFBBaHJDbkZQTHcvMmc0VS9RSVhBTlZGeTd4ZEh4?=
 =?utf-8?B?amwyM3k4ekNhVVhEejdRNWswTllHTmZRVEpOT3FtVVNoMzhoWGlvQUdvMEh4?=
 =?utf-8?B?UVVhYnNXQjQ2RGVZVHRNVktnaWdyZ1JKYVJMblhoTG9OZU53UTRTSUZFZko5?=
 =?utf-8?B?eWhxRFBFL2pLelp6ZnkzaG81MzVZaXRoaTc3YjRHS2dpZXN6WVVFdjhNdzdj?=
 =?utf-8?B?YkptMUNyMVNLYU1xZGJIR3BWOVRKUElRU2I4VmFyVXlSRStBS0J5OFBMMlZQ?=
 =?utf-8?B?STJUVW9Cd2t6MDlzaUl0TnhpOTE3Nkg1cWowcDAvMkl6OUl4R2hZczNvQ2NV?=
 =?utf-8?B?OWNqeWlGaG1UZUIzd29Zc2UrNUVmQ0FXNk90MVliaUVaNXlKSXg3UGV0MGQ3?=
 =?utf-8?B?NFh4dUtFWkdwak8xUnZPNFhSZXcxYlVuSmk1ejJDVVZ4cThnRDRsZ2lJTFZS?=
 =?utf-8?B?WDlpTFN0eXh3SW90ZlFhTG1GeGhlcHVjQytLM1F0YlFoSkpxT1VzeW9YbHpL?=
 =?utf-8?B?Z250L0JOb3JScVMxU2xkR0FNZEtvM2p3NllpU2dKRzFjVVJ0Qy9WUFJIUmtY?=
 =?utf-8?B?T25VMEtnYTdPZEVvTUNQQU5FeTFlc3MycmUwWGxVdGl1bVhGOXRvQ3F3NVhj?=
 =?utf-8?B?eGFOMlcvRjVmK09DZVVUektRWkphZE4rcTdOdjBIZ1F5U0t2eGt1SWYvY2VI?=
 =?utf-8?B?ZnlOaUlpUzRybWJ0TUNxRU9qaXVDcS9teVpja29oa1Bzek1idGZlVy9FeDdE?=
 =?utf-8?B?VTNhN2JmbU5UK3RWZTFBZ1htVFUrMVRXNDRMQ0Npc054WFpzNVhla2tyanUx?=
 =?utf-8?B?VlVhWktrVjQxUWNpbWI4eWI5d1hkL3ZCQUU1N0VQTVhXL285Tkk2VExuTFZI?=
 =?utf-8?B?b2NkYmNHSDVIdFRBYjhIa3JSOVFidEtzbWdYR2lCSFltTThnTEh6OStjeW96?=
 =?utf-8?B?VXZ4a0gvSHhhOUwrNUZYcDJPMmxEKzRWL25ucFFYR3UrRC9rNWsxSm85OXpk?=
 =?utf-8?B?RVRkRGxiR0hoTm84dTlKd0JiS2RpQy9OZDE4OHNoNmpadGQ4U2pnVVU0UG9m?=
 =?utf-8?B?UTBSWWNBTEpOYXJTNUZuSXZrNC9Ublc4bFFTUkV0S0d4UFd6a0dTcENKWUpr?=
 =?utf-8?B?dWdNYjFDakJjWEZ2bnNxU1JqR1dDREV3OTNEbUNCbzNuNGNZRUtFNVVMUGVr?=
 =?utf-8?B?RlJtSDFMUWozRWc3UlQ2UEFNZUQ2Sm9pZGJULzVvdDYxdy9VVkFnL3FNWnVK?=
 =?utf-8?B?bXRBOFpLTEwvVVdCOFVxNVFlSFFpUnN0TEx0eDdNV08rY3E3RXIzN1dwaE9r?=
 =?utf-8?B?TUpBeVo5R1FBampoMHlkYVZpazBLbngyOE16SW95SDNLeWJyMFZhRXpKUzdU?=
 =?utf-8?Q?QxtH5eBPOZGVlgAv/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhNcXFTWmxPbFFwdFVldTZzTTducEVRdFFRbUtqUHpxYlZhWndRZ3hiMjJM?=
 =?utf-8?B?RVRURXBsSWtNZmJNNFR1bjdUVkFod1dvT0MrUWF1VjFVbUxvUGxlMmM0WHIw?=
 =?utf-8?B?R0k2WTE1Y0FrMTU3NVZHNWlKZ3RLSjRaTEZ0OFVndDh1a1hpTEFvNWlYNXU2?=
 =?utf-8?B?bUI3M3J1TGlXSXdMSFYwNlNnaVk3eTNLbDhoenJPN21LWUZLam92YjZvTWtO?=
 =?utf-8?B?SmNxVys3Z1FsbzBKZzY5WFhGYTcycjg3YjV4d2pmVEZCZ3FnU1orTlRxUUpx?=
 =?utf-8?B?K2tERnZFeUd4dUNYNUdLcG1IcXRGTE9uSmhHRTlzS3BzSHdLVVZwNEtoNElv?=
 =?utf-8?B?VmVsSE45d2JPa2h1MGtVeExIeDVoaDNGT0hUa2RkbzRMUGtRV1d6OGJGWWJU?=
 =?utf-8?B?alRkb3pnb1EyU1FLczhYNDAydzNPMHJMMUg4TWVmRWNKMHpxS1diczFPMnJH?=
 =?utf-8?B?VTRxQ2p5T3ZobGN4R1o4SFRPMHRDQmZ2MUd4VUM3Smk5bWRqbWdieFEwMkow?=
 =?utf-8?B?MzFBdERmSUhZMURuWmRDVE5YVVpjNjNPTlR6V3NscUpVZ0hHZFBHT2RoNTBI?=
 =?utf-8?B?RkFlRytwdjR4R21qcnErMldFNDVSby9IU3ZSakppS0FjU3BrTmh6VDNsWm1P?=
 =?utf-8?B?OE9zY0s1QmlQVE1zN01aeU1ENWVMYmhPZmVpaUN0SXNFWFk3b1REbVJZVy9x?=
 =?utf-8?B?Z2tDQWxESTk4K3k2ZEt2dkxEZ1lTVGY0UTZpSGFtenZhSlN5T0VKV1dkQmhx?=
 =?utf-8?B?U1Y1aW5ZNkhqY0NLSUk3RXN4WjdWOHUzbzBiUTdJVkttczVDTjFVV2gzVFVL?=
 =?utf-8?B?ZWI1QWhLdERvUTRoR0NWYkVyNnpyeEI4K3pMamxGRlF0SkQ5SWovMUx5K1B5?=
 =?utf-8?B?RnZDaFZpWG9aT01xQ2VBT05odUNkTm9MTmNKQ0FKUGl2UGFMbW5yQis0aW9k?=
 =?utf-8?B?YmpyYndhVTdhNHRNcC9CRWFVMnM3bzJUL1lxS2lXbkx2SytwbnlZbGoya1NK?=
 =?utf-8?B?TXFpdk9PNDdWT0l4T0FkRlJoQnpxeGVNaE5EQnk3U1lPZ2VkM2ZXMFBqZ011?=
 =?utf-8?B?b2luWHRkTUdRdVpyclFsS1RQNjFvY05WbVE1OFZaUzM4aFhCaHVubGpWSWVU?=
 =?utf-8?B?K3NXNE12SjhSaXJpdmV3T0FXSFpnd0JheDdtSmgxaUtWY3ZnSUVsQzd1YXZp?=
 =?utf-8?B?RjFHaDd1SnQ0Z3dlRDBCais3WU00UGprTXZ5R1JVYjRrRWhzNHVOSDRCMGJi?=
 =?utf-8?B?SXA5NU5kdUk5Q1crYnJnbHBwYWcrWXRIeXBCR2FDZWozUHcraVZsUklpejgw?=
 =?utf-8?B?QmlvdUJjNlZtc3RMWDRRaFQzRHFDYllwUmZHd2xEVGYwSTk0U0E1RXcvQWRu?=
 =?utf-8?B?K05sV3EyaWNna0IyNFc3TlRtN3FLYjRYNk53cFE2d0MrZ1E2cndIOURzY0NP?=
 =?utf-8?B?ZjFmMC9NdFhaNmQ1eVBGdnNGY0dOMXMyWEVWYURVV2NEUWFON3kwRmlFUUFW?=
 =?utf-8?B?NVAxbWlFWkJQOXg0MkxnUFVrU1oyTlMrOStSanhwdDczUEFtVzZLa0FuZFV2?=
 =?utf-8?B?TTVFbm1GUDlpbmFGbUdNR2drM0trdWxlS2kxa24xZEZvbUVnTXdJSk1tTUZx?=
 =?utf-8?B?UDJ6R1RGTFdtU08wM2VHY2NVTHl0VmJGR2g1d3N6UFU4NVlIdHFnYkxLM3V6?=
 =?utf-8?B?aWw3RTd6aTRTbldTdE0xUFVNRmFFOCtsMDgwMGk5ZmtDK1ExNk5YSUpQQTZP?=
 =?utf-8?B?L3FSSlBtOU9jUGF2dmN1alFNQkp5TUVHMHl0a0xsc0pxSER5Qis4Mk9RbURo?=
 =?utf-8?B?N29OR0Yrc0NJTzErUGs5Z0RhYVM5ZXlXZkYvNXVGRlpQOFFCWFZvTUMyL2U4?=
 =?utf-8?B?NTJrUlZGUFFKcFRjWC93OXdpeldUL0xmN083RnVqbTFQaTdleDFyT0NVdFBI?=
 =?utf-8?B?cnI1MGxCWm8zV0d0dmpWaE9rQ1ZTaklmM09OZzFLL0I5ak94WVR2YXlxU2o3?=
 =?utf-8?B?Q012WHg5cHdaMjlGUFJ2anN6RlV2OWdJUVRzSzU2dzVmMmRJQWVMeXF0TUU4?=
 =?utf-8?B?Z2xOcFpVTllwLzBvL0gvdWVrNHlMR1RwMUNzbGRUL0ZEK0NsY3BObi9DTDBE?=
 =?utf-8?Q?POdk1MvuFekCmdL0DhSR/QfIw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a20ea06-89dc-4b84-1fd3-08dccc1edcc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 13:46:50.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10FpcVrjtoI2G/ZXKa2TkL09cIQoQ+KhWb7gEVxjVEAFKQWJprAR+EOjR9xbiz/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6966
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

--------------9RjaUZPYNK7KvPXSc34C8iSm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steven,

Am 29.08.24 um 15:37 schrieb Steven Price:
> Hi Christian,
>
> Mihail should be able to give more definitive answers, but I think I can
> answer your questions.
>
> On 29/08/2024 10:40, Christian König wrote:
>> Am 28.08.24 um 19:25 schrieb Mihail Atanassov:
>>> Hello all,
>>>
>>> This series implements a mechanism to expose Mali CSF GPUs' queue
>>> ringbuffers directly to userspace, along with paraphernalia to allow
>>> userspace to control job synchronisation between the CPU and GPU.
>>>
>>> The goal of these changes is to allow userspace to control work
>>> submission to the FW/HW directly without kernel intervention in the
>>> common case, thereby reducing context switching overhead. It also allows
>>> for greater flexibility in the way work is enqueued in the ringbufs.
>>> For example, the current kernel submit path only supports indirect
>>> calls, which is inefficient for small command buffers. Userspace can
>>> also skip unnecessary sync operations.
>> Question is how do you guarantee forward progress for fence signaling?
> A timeout. Although looking at it I think it's probably set too high
> currently:
>
>> +#define JOB_TIMEOUT_MS				5000
> But basically the XGS queue is a DRM scheduler just like a normal GPU
> queue and the jobs have a timeout. If the timeout is hit then any fences
> will be signalled (with an error).

Mhm, that is unfortunately exactly what I feared.

>> E.g. when are fences created and published? How do they signal?
>>
>> How are dependencies handled? How can the kernel suspend an userspace
>> queue?
> The actual userspace queue can be suspended. This is actually a
> combination of firmware and kernel driver, and this functionality is
> already present without the user submission. The firmware will multiplex
> multiple 'groups' onto the hardware, and if there are too many for the
> firmware then the kernel multiplexes the extra groups onto the ones the
> firmware supports.

How do you guarantee forward progress and that resuming of suspended 
queues doesn't end up in a circle dependency?

> I haven't studied Mihail's series in detail yet, but if I understand
> correctly, the XGS queues are handled separately and are not suspended
> when the hardware queues are suspended. I guess this might be an area
> for improvement and might explain the currently very high timeout (to
> deal with the case where the actual GPU work has been suspended).
>
>> How does memory management work in this case?
> I'm not entirely sure what you mean here. If you are referring to the
> potential memory issues with signalling path then this should be handled
> by the timeout - although I haven't studied the code to check for bugs here.

You might have misunderstood my question (and I might misunderstand the 
code), but on first glance it strongly sounds like the current approach 
will be NAKed.

> The actual new XGS queues don't allocate/free memory during the queue
> execution - so it's just the memory usage related to fences (and the
> other work which could be blocked on the fence).

But the kernel and the hardware could suspend the queues, right?

> In terms of memory management for the GPU work itself, this is handled
> the same as before. The VM_BIND mechanism allows dependencies to be
> created between syncobjs and VM operations, with XGS these can then be
> tied to GPU HW events.

I don't know the details, but that again strongly sounds like that won't 
work.

What you need is to somehow guarantee that work doesn't run into memory 
management deadlocks which are resolved by timeouts.

Please read up here on why that stuff isn't allowed: 
https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences

Regards,
Christian.

>
>
> Fundamentally (modulo bugs) there is little change compared to kernel
> submission - it's already fairly trivial to write GPU job which will
> make no forward progress (a 'while (1)' equivalent job). The only
> difference here is that XGS makes this 'easy' and doesn't involve the
> GPU spinning. Either way we rely on a timeout to recover from these
> situations.
>
> Thanks,
> Steve
>
>> Regards,
>> Christian.
>>
>>> This is still a work-in-progress, there's an outstanding issue with
>>> multiple processes using different submission flows triggering
>>> scheduling bugs (e.g. the same group getting scheduled twice), but we'd
>>> love to gather some feedback on the suitability of the approach in
>>> general and see if there's a clear path to merging something like this
>>> eventually.
>>>
>>> I've also CCd AMD maintainers because they have in the past done
>>> something similar[1], in case they want to chime in.
>>>
>>> There are two uses of this new uAPI in Mesa, one in gallium/panfrost
>>> (link TBD), and one in panvk [2].
>>>
>>> The Gallium implementation is a naïve change just to switch the
>>> submission model and exercise the new kernel code, and we don't plan
>>> on pursuing this at this time.
>>>
>>> The panvk driver changes are, however, a better representation of the
>>> intent behind this new uAPI, so please consider that as the reference
>>> userspace. It is still very much also a work in progress.
>>>
>>>    * patch 1 adds all the uAPI changes;
>>>    * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
>>>      the required objects to userspace;
>>>    * patch 3 maps the doorbell pages, similarly to how the user I/O
>>> page is
>>>      mapped;
>>>    * patch 4 implements GROUP_KICK, which lets userspace request an
>>>      inactive group to be scheduled on the GPU;
>>>    * patches 5 & 6 implement XGS queues, a way for userspace to
>>>      synchronise GPU queue progress with DRM syncobjs;
>>>    * patches 7 & 8 add notification mechanisms for user & kernel to signal
>>>      changes to native GPU syncobjs.
>>>
>>> [1]
>>> https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed
>>> [2]
>>> https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads
>>>
>>> Ketil Johnsen (7):
>>>     drm/panthor: Add uAPI to submit from user space
>>>     drm/panthor: Extend GROUP_CREATE for user submission
>>>     drm/panthor: Map doorbell pages
>>>     drm/panthor: Add GROUP_KICK ioctl
>>>     drm/panthor: Factor out syncobj handling
>>>     drm/panthor: Implement XGS queues
>>>     drm/panthor: Add SYNC_UPDATE ioctl
>>>
>>> Mihail Atanassov (1):
>>>     drm/panthor: Add sync_update eventfd handling
>>>
>>>    drivers/gpu/drm/panthor/Makefile          |   4 +-
>>>    drivers/gpu/drm/panthor/panthor_device.c  |  66 ++-
>>>    drivers/gpu/drm/panthor/panthor_device.h  |  35 +-
>>>    drivers/gpu/drm/panthor/panthor_drv.c     | 233 +++++++-
>>>    drivers/gpu/drm/panthor/panthor_fw.c      |   2 +-
>>>    drivers/gpu/drm/panthor/panthor_sched.c   | 408 +++++++++-----
>>>    drivers/gpu/drm/panthor/panthor_sched.h   |   8 +-
>>>    drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
>>>    drivers/gpu/drm/panthor/panthor_syncobj.h |  27 +
>>>    drivers/gpu/drm/panthor/panthor_xgs.c     | 638 ++++++++++++++++++++++
>>>    drivers/gpu/drm/panthor/panthor_xgs.h     |  42 ++
>>>    include/uapi/drm/panthor_drm.h            | 243 +++++++-
>>>    12 files changed, 1696 insertions(+), 177 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
>>>    create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
>>>    create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
>>>    create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h
>>>

--------------9RjaUZPYNK7KvPXSc34C8iSm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Steven,<br>
    <br>
    Am 29.08.24 um 15:37 schrieb Steven Price:<br>
    <blockquote type="cite" cite="mid:a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com">
      <pre class="moz-quote-pre" wrap="">Hi Christian,

Mihail should be able to give more definitive answers, but I think I can
answer your questions.

On 29/08/2024 10:40, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 28.08.24 um 19:25 schrieb Mihail Atanassov:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hello all,

This series implements a mechanism to expose Mali CSF GPUs' queue
ringbuffers directly to userspace, along with paraphernalia to allow
userspace to control job synchronisation between the CPU and GPU.

The goal of these changes is to allow userspace to control work
submission to the FW/HW directly without kernel intervention in the
common case, thereby reducing context switching overhead. It also allows
for greater flexibility in the way work is enqueued in the ringbufs.
For example, the current kernel submit path only supports indirect
calls, which is inefficient for small command buffers. Userspace can
also skip unnecessary sync operations.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Question is how do you guarantee forward progress for fence signaling?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
A timeout. Although looking at it I think it's probably set too high
currently:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#define JOB_TIMEOUT_MS				5000
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But basically the XGS queue is a DRM scheduler just like a normal GPU
queue and the jobs have a timeout. If the timeout is hit then any fences
will be signalled (with an error).</pre>
    </blockquote>
    <br>
    Mhm, that is unfortunately exactly what I feared.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">E.g. when are fences created and published? How do they signal?

How are dependencies handled? How can the kernel suspend an userspace
queue?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The actual userspace queue can be suspended. This is actually a
combination of firmware and kernel driver, and this functionality is
already present without the user submission. The firmware will multiplex
multiple 'groups' onto the hardware, and if there are too many for the
firmware then the kernel multiplexes the extra groups onto the ones the
firmware supports.</pre>
    </blockquote>
    <br>
    How do you guarantee forward progress and that resuming of suspended
    queues doesn't end up in a circle dependency? <br>
    <br>
    <blockquote type="cite" cite="mid:a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com">
      <pre class="moz-quote-pre" wrap="">I haven't studied Mihail's series in detail yet, but if I understand
correctly, the XGS queues are handled separately and are not suspended
when the hardware queues are suspended. I guess this might be an area
for improvement and might explain the currently very high timeout (to
deal with the case where the actual GPU work has been suspended).

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">How does memory management work in this case?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not entirely sure what you mean here. If you are referring to the
potential memory issues with signalling path then this should be handled
by the timeout - although I haven't studied the code to check for bugs here.</pre>
    </blockquote>
    <br>
    You might have misunderstood my question (and I might misunderstand
    the code), but on first glance it strongly sounds like the current
    approach will be NAKed.<br>
    <br>
    <blockquote type="cite" cite="mid:a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com">
      <pre class="moz-quote-pre" wrap="">The actual new XGS queues don't allocate/free memory during the queue
execution - so it's just the memory usage related to fences (and the
other work which could be blocked on the fence).</pre>
    </blockquote>
    <br>
    But the kernel and the hardware could suspend the queues, right?<br>
    <br>
    <blockquote type="cite" cite="mid:a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com">
      <pre class="moz-quote-pre" wrap="">In terms of memory management for the GPU work itself, this is handled
the same as before. The VM_BIND mechanism allows dependencies to be
created between syncobjs and VM operations, with XGS these can then be
tied to GPU HW events.</pre>
    </blockquote>
    <br>
    I don't know the details, but that again strongly sounds like that
    won't work.<br>
    <br>
    What you need is to somehow guarantee that work doesn't run into
    memory management deadlocks which are resolved by timeouts.<br>
    <br>
    Please read up here on why that stuff isn't allowed:
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences">https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences</a><br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com">
      <pre class="moz-quote-pre" wrap="">


Fundamentally (modulo bugs) there is little change compared to kernel
submission - it's already fairly trivial to write GPU job which will
make no forward progress (a 'while (1)' equivalent job). The only
difference here is that XGS makes this 'easy' and doesn't involve the
GPU spinning. Either way we rely on a timeout to recover from these
situations.

Thanks,
Steve

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
This is still a work-in-progress, there's an outstanding issue with
multiple processes using different submission flows triggering
scheduling bugs (e.g. the same group getting scheduled twice), but we'd
love to gather some feedback on the suitability of the approach in
general and see if there's a clear path to merging something like this
eventually.

I've also CCd AMD maintainers because they have in the past done
something similar[1], in case they want to chime in.

There are two uses of this new uAPI in Mesa, one in gallium/panfrost
(link TBD), and one in panvk [2].

The Gallium implementation is a naïve change just to switch the
submission model and exercise the new kernel code, and we don't plan
on pursuing this at this time.

The panvk driver changes are, however, a better representation of the
intent behind this new uAPI, so please consider that as the reference
userspace. It is still very much also a work in progress.

&nbsp; * patch 1 adds all the uAPI changes;
&nbsp; * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
&nbsp;&nbsp;&nbsp; the required objects to userspace;
&nbsp; * patch 3 maps the doorbell pages, similarly to how the user I/O
page is
&nbsp;&nbsp;&nbsp; mapped;
&nbsp; * patch 4 implements GROUP_KICK, which lets userspace request an
&nbsp;&nbsp;&nbsp; inactive group to be scheduled on the GPU;
&nbsp; * patches 5 &amp; 6 implement XGS queues, a way for userspace to
&nbsp;&nbsp;&nbsp; synchronise GPU queue progress with DRM syncobjs;
&nbsp; * patches 7 &amp; 8 add notification mechanisms for user &amp; kernel to signal
&nbsp;&nbsp;&nbsp; changes to native GPU syncobjs.

[1]
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed">https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed</a>
[2]
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads">https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads</a>

Ketil Johnsen (7):
&nbsp;&nbsp; drm/panthor: Add uAPI to submit from user space
&nbsp;&nbsp; drm/panthor: Extend GROUP_CREATE for user submission
&nbsp;&nbsp; drm/panthor: Map doorbell pages
&nbsp;&nbsp; drm/panthor: Add GROUP_KICK ioctl
&nbsp;&nbsp; drm/panthor: Factor out syncobj handling
&nbsp;&nbsp; drm/panthor: Implement XGS queues
&nbsp;&nbsp; drm/panthor: Add SYNC_UPDATE ioctl

Mihail Atanassov (1):
&nbsp;&nbsp; drm/panthor: Add sync_update eventfd handling

&nbsp; drivers/gpu/drm/panthor/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-
&nbsp; drivers/gpu/drm/panthor/panthor_device.c&nbsp; |&nbsp; 66 ++-
&nbsp; drivers/gpu/drm/panthor/panthor_device.h&nbsp; |&nbsp; 35 +-
&nbsp; drivers/gpu/drm/panthor/panthor_drv.c&nbsp;&nbsp;&nbsp;&nbsp; | 233 +++++++-
&nbsp; drivers/gpu/drm/panthor/panthor_fw.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-
&nbsp; drivers/gpu/drm/panthor/panthor_sched.c&nbsp;&nbsp; | 408 +++++++++-----
&nbsp; drivers/gpu/drm/panthor/panthor_sched.h&nbsp;&nbsp; |&nbsp;&nbsp; 8 +-
&nbsp; drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
&nbsp; drivers/gpu/drm/panthor/panthor_syncobj.h |&nbsp; 27 +
&nbsp; drivers/gpu/drm/panthor/panthor_xgs.c&nbsp;&nbsp;&nbsp;&nbsp; | 638 ++++++++++++++++++++++
&nbsp; drivers/gpu/drm/panthor/panthor_xgs.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 42 ++
&nbsp; include/uapi/drm/panthor_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 243 +++++++-
&nbsp; 12 files changed, 1696 insertions(+), 177 deletions(-)
&nbsp; create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
&nbsp; create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
&nbsp; create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
&nbsp; create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9RjaUZPYNK7KvPXSc34C8iSm--
