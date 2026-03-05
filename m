Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K9gLOY1qWlk3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:51:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3075D20CF06
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527810EB2F;
	Thu,  5 Mar 2026 07:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iTi0Zlhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012045.outbound.protection.outlook.com
 [40.107.200.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4464110EB2F;
 Thu,  5 Mar 2026 07:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhUNcUjVg/WhE3CspDW3XtiAMK8s1ZUk1H3jnzk7qfZZfLPfO714Z4F/SB/Gc+0H+v3RKNyxiW6+q1zkh0hkYP00IsMmv3BDMrShywUwe19bx/f/2lM/pa3d9lP7146wgN82Q8cdXIxaH/Yy1nXUF4cpjODArVbDAgTWK6+d/oXsKpMIGHsLMLPneb650UVNCiNFsp16+5fDbfB14N+vPcav9cz0yeHjm1rZtqxeozkI5lBn1dXcPxfjLnKeATrShED+06XBglOImghbBzUN3dRZ+0lxt/IqQb7GaYtDSRgySFXiHfo9DnEoS++oSGAYm2tYQL8DUvqej+1CR+l45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zrs4bEZvDGvc/LRSqBaj6dx+bSsEZ9x1dolKDLyb8hA=;
 b=gMh4lo7nhK+ZGLng6ntMZ5/ipApAsaB9OejG5wZFGuwmWu7A5GfGs56GN2w+p4/GzMDbLOdByn/zUpSQo+1/bW+vH30emOSwv289bZp1nzjrp27GCWwwe391IGRXB4BXPbahr++wE4P9fbgLTH79oJ5bbTJaa2ug56GgNe8gtvAVUUnSknXBLXiU8WG51Rd6Gh/ZMOYBXhHdyTdAmRcBx74eCzPDNPOBkf6Y8WpWoZ9RapxumPMllWEPqzRGJZAmZ2dsqieaVOXp3U4sab2zlqW5WPBsYYKZ9FE9pPrG9Rm1RB2BJVPdqZxNyBAp/ZfH905Un9I81sWN/CqmkUfn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zrs4bEZvDGvc/LRSqBaj6dx+bSsEZ9x1dolKDLyb8hA=;
 b=iTi0ZlhkqSLtkA+7LU7m/qq+Q9bAI71Zm10eoCmBYnGCopso/VR1j8AAZGTG5UwzxXwoQCyuNad7v3h/Flls4q4Dh2DHM/dEz3GbM2SgRgRfmKATQ7n2m+JOh6RLg0goRIKOwu/iWFmRuIvW/7gNfj0bzE89SMWJ2+HZluDxZq74THv8/Cto1Hw9r36PYbSukLjaeJUurv1xlEwYuJIgCie6R+F6p7hjC7xk647kctOW8xHKIA33TxK83zXgHTUuJkhA/plk4S4DO/e/NkzLZ9jjjL6YyGFCE09pudVcAt9WqugggmK1EEdJ/ut8aXxe3SFverwhrbCpGsW3JHCnYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6159.namprd12.prod.outlook.com (2603:10b6:8:a8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Thu, 5 Mar 2026 07:50:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 07:50:53 +0000
Message-ID: <24b74629-87e8-463c-ad21-376a5097823e@nvidia.com>
Date: Wed, 4 Mar 2026 23:50:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
To: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Zhi Wang <zhiw@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: af10074c-295a-4606-6c95-08de7a8becf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: FtadwwGtJzVYtnx4sGb8GVrDf9k9GurwzH5zb9EnQbwOgR6oiS7jDO+v8Cyfd2Psze6RcPKxqNd07IBzJDy6Fep3rTVlNvP+U6tpKCnelB27Fg1RK7r9sO8qH03C3xgfjQvBt0f3dnXumagmyvgltOJLZz1e+m10aZwQ8h2AlG+wp11OoVQd2qcgyF58DEMx+8gfJH9hfxmZVDt8uWze/MzkL7eLqP/i8c4GWichQlfcUqewgHXvSbIRXf9xO0e3dAl2v1zEBQ7V3PAleVHgnpZCOxlqW77r1jUGB/PRoLH09pJCROSfqitcfElcbF06Cfb+ggepITwfSrbrMMEt2qNam+jVXqoR/vNVeYQexoNt6Rd9yHp6ccRnl4/GrSkNiLalYXfaTdCCFzvXNEAOECOFhY5CZj9T2NQU94WjnEPEpUohMunkR1Npevgj6N7ErEET3yI+6s9ARcmncGmpw7faojgUwEjG9XeDU6jZ5tlKwxcUoRL9sprQM2riXwEfYyBqfHc3mHOACSwSCNQUySrpEb2A8lqAaNkYJmxwzkuyA7Rl7NuK4Y+UOlhf1SnMOsKWlwsB4AcOqkh+1KYAZHhcXk/8zVGaBoSPrjSmLTTmWAyP+xgRDgSCaawmvpfcgGMD5PxWT8ZIU/MqHStnut9ZkW13T9Gaql+Di1zH2FzW+Xd6piKOjqvxxI2ZotFW67XicTc1ZGQAvtxkaf4duXEXrwuqDHkzC+xFSsdwzoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVIyUnpDOFhmdWVvSVRxbndFSkVOWCtLYWRVTE5mdkN4TisvbzBUYTRHazJs?=
 =?utf-8?B?NWZqcTcxdlNjcldPcHk5b1BuU20yYU5IZnpUYVVXVldxeG1VNldSSkpTU1FT?=
 =?utf-8?B?bTh6UmRxS1c4dG1zcExrcWlSTnI1eU03UmFMejRDSWVTeFFndG5ZeGFxR0Ur?=
 =?utf-8?B?cEszRmFKVEV5QmlKRnQ4N0Zua3RtN0JDV2ZoR3oyamo5eEE2eVhOdjB4bm1X?=
 =?utf-8?B?NU9zUDVGdWZjUUR5cjNqdXVjaDJYKzAvUG9HTnlEdDRBOUh6eHRBMjZqb08x?=
 =?utf-8?B?TWJwanB6ZjM3SmhnNDVsVlNHTlF0TzZ6ajB5cEdxVlJIMkhJWlRHT05vTTdu?=
 =?utf-8?B?TzMvM25XL253N0MxVWlnR3UzZXZ1dXVZcncxRjh6eEZocjRKc0RZa01LTjVy?=
 =?utf-8?B?QjN3UmNNN2lNMmdJSmcwWGwwaSswNDNCem5EakNxVjZDMk9GbUNNQXF5L3VG?=
 =?utf-8?B?NkJEVzE0L2h1bFpVVFdzZHdLNFp3MWpTSmwxRzE0YTNVY1pFZE42ZGthRk45?=
 =?utf-8?B?c2ZlZENNQUh4NlpyK29ucWRXbnIwZTZZQmZlVEdJZVp6YXBKZk1JNngzTks3?=
 =?utf-8?B?S1Mwb25acXkzcEZSUStYaytpTnd4Q2tVemVJb3BTWWozQjZqNWNVREVobmU4?=
 =?utf-8?B?RlFMWUFKYjh3Z3BIOXE3WkdobFhqbmFnTE9wUWpiSmtyWERIMnQvTWRhMCtC?=
 =?utf-8?B?bXVoR1g1ZHI2VkJMVXZLTnI0MFVJVlg3QW5aclVtdjJFVUZGdFBLUlRQd0ZJ?=
 =?utf-8?B?dnhyOHVVRXF6N1BTZ1puQWVOTGg1UUpCYS9OK1IycjJ4ZnpZTi9BUDdXRE1V?=
 =?utf-8?B?dDN4UmhRU3FRd3ZnMzFqaUJmSVpKUnJRcHlvd0NUSnFSN0NlRDlPbCtPVWxZ?=
 =?utf-8?B?V0s2bE1Eem1JbjdQa2ltK3NaMU5lR3Y3NjFuenRzRStZeDBWQVNyWWVyRXkv?=
 =?utf-8?B?Sm1lMVY2bVB0bXM0ZWsySlFTamNDazVCbHlqdURxMG1lemdJcnlrTCtyM1pI?=
 =?utf-8?B?aThzS1VEZTJjaDVjSktkSUR0b3BPTE1FclVmUHN0Y3d3UXI5Ti94RURvMnR4?=
 =?utf-8?B?ZlRMM1NDNkc3b3F0UlRWTEc2THpHT1FVTlNSQjdvbnFKazBlaEl6OHpZek5u?=
 =?utf-8?B?ZWxLOHZpUi9MczY0em15RmFFazBuT0tSb1IzYUQ3L2t5bzNHckdCSHBHSS9L?=
 =?utf-8?B?YUEvY1VDMjJwSEE1ZzllUmhtVjZ0eTZwYzI5NFozWEJlYjBhM1lHb3ZldkdR?=
 =?utf-8?B?RHpPaUZKRVIwM2ROcDE4ZHpzV2dYdkxrQnYxUktacWpmRXVIb3FjaEptL0Mr?=
 =?utf-8?B?ZjNkUEc2VXNNdVhsQnVQUGZHTHZwSSs2RWNleFNyT3pSMTYzYmRjYm9mdjVl?=
 =?utf-8?B?YVJLZFhaYmlLTHFMQmtiN1dQK2xiOXpEandJSVl4NXM0SkJ0ZTFBRUpuSnRY?=
 =?utf-8?B?OUpURitPVTZ3R2U5cmpCb0N4dGlZMUw1andjUE1xa2lQMFIwbTlWVlRJMUtL?=
 =?utf-8?B?Z2dOSWU0NVBGQjk1ZDdEenJvUlhRRC9jdlRYSEhVS3gxaDgySUtjVWJYekZu?=
 =?utf-8?B?MVhjSzY4aFlCd1BKTFZZZmprcDZnZTViOU8wZXZpd3lyWUlSd282UGZQcVBS?=
 =?utf-8?B?L2FndmxJVUwxQTBGZUNrenUzNHI1UGlNRFhTTEtqYll6SStxcG5pWWxHL1NU?=
 =?utf-8?B?a05TT1RNcTc3U2pvcEp4UnhsS3NvVE1qemlUZ0FBUFVMSUE0NVlJTDIzdXpT?=
 =?utf-8?B?N284NzkxbTM2VjNrNVVrZU1ucmowdkJPMUw2bytrZkw1RENtanhSTEpMdXdl?=
 =?utf-8?B?M2RFajNtUVBYK1o5L3EwREY1a04yL3NvcThrV3UycUNYT3l2ZUx6UGgvTWY0?=
 =?utf-8?B?ZjJ4OTZJSkZPbS8vWHU5WGptSkJuaWFneVVUeFNVeXl3RmJZeXNMNXI4MFJv?=
 =?utf-8?B?bkhYV1BEWVFjL056MVI1WTdtNWVSeWRoYVlFNm5iKzlqWlRNUUw1SS9tR3VE?=
 =?utf-8?B?RVFPUFhPVE9Yak1rbm1GWktjMVJVWFZJd2FBVXBaWDBqU2dwUDQ4OHg2ZTZX?=
 =?utf-8?B?Y2IrWW82S2VmUW91dE1zdk9zMGtiNXZTVm9wbXpCODBaM3ZPK1k4WW1aYmRp?=
 =?utf-8?B?OXFOWkFBYW15MlRWaGJFSUdobUYwS2cyN0xaVmhrb3F5ZUVLVjc3UUsyM2FT?=
 =?utf-8?B?QlVIUk03VHQrOS9WSU1wOSt1blg0UnBBUklSRUV6dExOSWh5NVVHazFBb0JP?=
 =?utf-8?B?c1dwY1c1L2JxTGtCSjF2dUFBYldwbm1NUExBdUtkZlVKT1VtK3dpQzdjY1dD?=
 =?utf-8?B?ekYxWWhGN3lXQTRhTE1zWk9JQjgrdXZMUDk5UDdVYVdiaXZxbTYxdjlmSVBk?=
 =?utf-8?Q?4xjdeHNJ0O9+zjLE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af10074c-295a-4606-6c95-08de7a8becf1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:50:52.9637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IBAI09QEYKzLejb7RZ/ez4qz+DcbjlKUK42Ksk+NCKPYJmrv+xneu8KORP+/0q09ferqmowMVhgPCCF0NB/zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6159
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
X-Rspamd-Queue-Id: 3075D20CF06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[google.com,nvidia.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/4/26 11:37 PM, Eliot Courtney wrote:
> On Wed Mar 4, 2026 at 8:39 PM JST, Danilo Krummrich wrote:
>> On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
>>> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
>>> +        read_poll_timeout(
>>> +            || Ok(self.driver_write_area_size()),
>>> +            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
>>> +            Delta::ZERO,
>>
>> Isn't this either creating unneccessary thrashing of the memory controller or
>> unnecessary contention at the cache-coherency level?
>>
>> I think we should probably add at least a small delay of something around 1us.
> 
> This is what nouveau does (specifically `usleep_range(1, 2)`). OTOH,
> openrm just does a busy wait, which is what I replicated here for now.

Open RM has some ancient bad habits!

> GSP command queue not having space IIUC is meant to be very exceptional.
> I am not sure which is best, maybe Alex has an opinion, but also happy
> to change it because that reasoning makes sense to me and I don't know
> enough about the distribution of how often it would actually need
> to wait to know if 0 delay is justified.

Almost never! There is a big big difference in how the OS behaves,
between 0 delay and non-zero delay. Sleeping, if you can afford to
(and we can, here, IIUC) is far better than a hard spin loop: the
scheduler can do something reasonable, for one thing.


thanks,
-- 
John Hubbard

