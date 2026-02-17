Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI2WNRB/lGmwFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:45:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA414D456
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2140D10E4E4;
	Tue, 17 Feb 2026 14:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eYUyJpGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011023.outbound.protection.outlook.com
 [40.93.194.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A2310E4E4;
 Tue, 17 Feb 2026 14:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOWPLcptL6x/15yXojwsHGlkdy2zlQ3++/8qMsB1gHy3XYJODj2rVUe4fMXuuUHM0SY9Rlpvt7XccwbfPq6d9g2u1M7iD48QkJkBSGuyzSQtA2TyWbA+qVR9SupITJZVfPQmMmQum8pb5UvRPC8TxlXap1r6dpWPnAniCORkV5BVzvl1uEBMoCctQuhGn4n1Oa6rvwv3Nn5y6x90Jgud5oTU2kPq7aHqcTgYZTAEiqRpnRGMZhiYIywaw2q7Yf+zxg8RTZHk0OYcOo13+2V7UBzijbP4LHUX+ldun3LFSQ47+HRITQqqrlqRkznkP0LCHjCvSbvmCsjVpPvWHfC1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyxvuSbr7Ig8lm7MX7PVg3GfBouar0wKl38rUCbFHVE=;
 b=eE+sY9sbeLqgbCSX4gRKbfSUTRfd1+JhyKf3fQaAsIx8r3VnhOXNaN5Cwu2Z72Q25Y54z3kir6h9sFjMmHO0DhdzAwXSRds3uL3ae+26jZsiERW/VLx9vrLC2XmdShtVmoFSM+DYPodOvw0GRJt9m88r4T0lsgBTqHQubocG91kidVo9fxKT27fBv6lVBb8MBdmOn03dnan199PqcK6oxeP/QDhoRukmxSCDgkTs8SezvE60i3uKFg0ifHF+92E740djwXk5UdIv2VMkFyVuqqluzFT+Q75BcFZouYQFt1IzGRFINQte5NDfPGxXiqDVXmNAbDqUsGUQkoXeWARaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyxvuSbr7Ig8lm7MX7PVg3GfBouar0wKl38rUCbFHVE=;
 b=eYUyJpGltpB6sVK1ChMQkIiFHHzSWX1E8IOXvToSCftK7Y9GmxcQoEumcNOvlGTElYO9C6xRrTGeI8eWcQixbiqW8o+icY8y1d6VFdgBaiRmRDj54C/yAVWkTiw3QTM6VT1ADWtLKAMjiXhIO/VQwQXC/QCgMxFyze5f02wz77Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB9036.namprd12.prod.outlook.com (2603:10b6:930:78::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 14:45:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Tue, 17 Feb 2026
 14:45:28 +0000
Message-ID: <0e7c3ee9-54b1-4ecc-b960-6e2fda6ab3ae@amd.com>
Date: Tue, 17 Feb 2026 15:45:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR
 to query fence error status
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Yicong Hui <yiconghui@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 wayland-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
References: <20260213120836.81283-1-yiconghui@gmail.com>
 <20260213120836.81283-2-yiconghui@gmail.com>
 <f1100dad-b9ff-4ba2-987c-4d5cb4c1122c@amd.com>
 <bc491356-6db4-4466-ab0f-2f2a47f4da77@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bc491356-6db4-4466-ab0f-2f2a47f4da77@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0247.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7478e4-cb35-410a-e57c-08de6e33313f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3JEbktrNElGREg0NnFYcTVwZ3VnckI2M2lkdlZmQzBWKy9sRlIzd1gxc0hx?=
 =?utf-8?B?MDdYZVdZRGVZOFpXUFlGRWttSGVSUXNjUFEwZnYvY1FySnQ2VmRhV2ZmQTZr?=
 =?utf-8?B?RmhHV2xJN09zdllqL2xacFJVSlRLeHVuVUcxZS9WUHdLODlTMFdvbWJEcEg1?=
 =?utf-8?B?L0t6TkR6YjZHc0h2SDJhSGhZd2NBRk10OHFkQldrKzdDOVp4RXFVUVBxT1Rp?=
 =?utf-8?B?Z00wWk5zZFhiSTVVTitkNkhoMCtxQWhIcjNLT29tVGpsb0NoV3pzM0RULzFI?=
 =?utf-8?B?cGhPcVl6QnlyZ25BeFRSOG54MGlpcWJObXJFMFR1a3hweUF5akhhb3lTLzho?=
 =?utf-8?B?aTdheWZuZDVTS1ZDVURBWlRQZ1BGbloyK0QzeUNVaVJ3R1R3NG8xVmRUU2JJ?=
 =?utf-8?B?VVNwWGF0QXJ6SVg3U0gzaVFaaGkzZnRpdXgwRVY5RUVMd2tDV3FKUUZtMWp1?=
 =?utf-8?B?UkdZbE4wTUNDaWIwVkVnQ2RwVkJIc1daMXNXN3UyV0o2Kzdpa01aK0JpQThy?=
 =?utf-8?B?cnRZSi9aSXBRajRYOXRhT3FaRWF5WUoyU0tJNmJvOVgwSzFhT2d1MDhDN3Fa?=
 =?utf-8?B?NmNYaTBhanZ5OTZkSURDdXZJV2xkZkpyMXdlTldITkJsYm5QOTVUemlrbGtz?=
 =?utf-8?B?dGV3MDRNbkV3eHl2TzQyaGtjOVRaZ2NoWkdoYVZINHYxMTVGOFo1U2NQU3dw?=
 =?utf-8?B?K0ZldUl4Ni84QXhWcFV6ZWJicVRqakhtSDdycWdESXVKb3JvNTVxUWRIcGQ4?=
 =?utf-8?B?NDUzek9UalFIZDhxZk5RTWZxYVVUMXZFSjhSQWxMZ21vcWtJbmFuR0pmTHlW?=
 =?utf-8?B?Y200MDE3aWI4VkRMRkhLd3JXSWtXdXR2aXhTM0lGL0xwWTIxaGJzKzl2MUNY?=
 =?utf-8?B?U25jQ1ZVYlh4TGRtTlVVL0x4UnJ6YlR5cHZNUlRrS2xYZjlraUg0V09vMHJs?=
 =?utf-8?B?Q012UU1NYVA1Mjhycks2NjRzcHozVnk2THVhWHJqeUxBVDUwRkEvQ3NkTzdQ?=
 =?utf-8?B?UDBpSThOVUFDaTBmTEpWMGJrbGtCOW50V0N0SHpqK0xmZytvRlliemVtbU9K?=
 =?utf-8?B?WnFzZWlpdnJ6WjJPTW5ndVkvUFF3R2J2SzFBb1JhcWRCNDZ6Wk1naXFWV0RD?=
 =?utf-8?B?NVN3cmg1MUZnd1kycXRLSmZ5eW9PTktaRlFnMkw3aFdHZWJoN1Y3aTlCdXFl?=
 =?utf-8?B?R2Z0UExoNmRvbE5Oc2RFRVBNRFpkQWl1MEpQN25nOXdydkRvdlllWkxDTkRP?=
 =?utf-8?B?V2NDU1NJeTVwYWtMWVVYRGtuaTZyWUMvQkhodGN3eEpuWHRsTzZaL3h1Mm53?=
 =?utf-8?B?RnVIeGFFbDN0RitMamdQYjkxTUYzOEV3ZXhvSGJSck43ZTZKZUZaREIxYXFT?=
 =?utf-8?B?WHNuVjZEWCswOVNxYXdndDVSVjhHTXJ6MnZzNzg5MU1TaldiR2ZtNG1zZjZ0?=
 =?utf-8?B?MUxTbGZ6S0tBOWkyZm0vVm9LMDJ2YXhHcFNjWmQ4eEs3bFhtTDdYbUQ5OHhu?=
 =?utf-8?B?NWZqb1AxZG9wWEVtczYxUmFXaXdZQXJyV3cvNW10OHZWZVFyL1NOd1JkS1Ny?=
 =?utf-8?B?RWpJeHhKQS9Ra01LUC9rTlM2SklQY1ZlQnVRZmhNVXVJRGE3RUYyU0g0YnIy?=
 =?utf-8?B?Ty9QN1N5M0dQdmdHQld3YmRicWg0eWFUMDErTTdCYzJWUW5sMXdCRGdiUVVj?=
 =?utf-8?B?eFFPN1d1RExGUTVsMlpHRk1JbS9iazJoaUdjRk9IVHhrR3hJZUlLbXBLbnox?=
 =?utf-8?B?SG10Skp6SG5uQ3lHdkhlbXlJRkkvdkpqbTdzVDJXSTJCNi9BVXNTalJWcmU1?=
 =?utf-8?B?OHRZTENxU05SVXl6YU9BVDlGUHNDV0dvWUo4N0dweTY4ckExSHA3aVhIZlVp?=
 =?utf-8?B?Q2RCMFRaajhSc2ljdzROYW5jZCtkRVF0RWhBV0V5ZlFxM3drRU52VE1QY2RR?=
 =?utf-8?B?VUt4c1diRms2NXJaZDd3WHBzdlFYVENDQTFVT3dydWNvWCtTb1NiZmQ2MG80?=
 =?utf-8?B?cnpBdGRaQ3NFTmlpeGphamd2Z0dGS2tHMU1mMi9EWjdFR3ZSNVZnM2dVbVU3?=
 =?utf-8?B?ZWNacFRnOFdzQm5NaXNnU0pDcjM1Y0grdUlSK25ydzcxYXlMYmtGamVaVnMy?=
 =?utf-8?Q?l3nc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlVRSVJoekxLVngwaHB4UHgzMlFGSGtVU3Z3ZTJwUTl1RUFoOGgxak04RGJz?=
 =?utf-8?B?SFRtRnpKY3BJU3dLazlSYzN2VWtnNFZxTjBGQlM1ZGE2dkdEbmlDNmNBRHJy?=
 =?utf-8?B?enp1Qzl3cUQza3JjVEZoQTlvdUVzVE5URHJxaG9KNndlbndvZlJxQzB0TXVo?=
 =?utf-8?B?RFRCRnZCNnI1cUF5SkQxNGdVcmJDdVN3VThHa0Nzb1duZWY5RjBJN1NHQ2ds?=
 =?utf-8?B?eW9LeTBZcnc2SENJZ2lRZE95QldFcFhLdFBpVStQYUNBYk5jaFhZTjBpQnBn?=
 =?utf-8?B?Z0M1OXh0L1hWcjQyS25HdTJiN3FIVFJ6UHhJTUJpNHNYaFc5SW5VMlRlMWxX?=
 =?utf-8?B?MURGOThabmJiUmQ1Um5RVmVRcTFnRVBhNlk1eTRFK3R6VklQbTJWbk9HRTdB?=
 =?utf-8?B?MnFXRFArTlhxejdGZnRCcFJQSFA4bi9kUXhYd0lWUENGVEx4dU5wbCtwc1Jn?=
 =?utf-8?B?RU5tR085THp1VzNuR3FzRHlFN1BSWkxpdGhIVEVMaEo5QlVUeHVXejJOV1A0?=
 =?utf-8?B?YjZUbW8yTUpNZGl1a01aVjdVanFwMm9ISFpTOHFsUC9GVG1nZlZydlVjU2RO?=
 =?utf-8?B?b3BoMzcxemFCOE52a3JOdStOQkVBLzI2a2V2Z2RvSGwwSSt2alJoUUFMSzdM?=
 =?utf-8?B?QTR4K3ArT3B1clh3M3pNOUxvUENoV2gwbW5IQThWU05WYlRqQ1ZlL0d0UmJW?=
 =?utf-8?B?QmE1UVBwV3dScURqNEVoQzRPdlMvdVRhMk5lbEhZeWJiN2ljR2tTVUFaZjBU?=
 =?utf-8?B?SzBWTmhOTGJ1azBFZXVtcDZUZmF2WGpwZHlCWktPR01zTXovVjdDMGovRlJ0?=
 =?utf-8?B?N3hHeFhaODU1RmV5SjFGeXNFaTR5WUJGMTNFcVhhZDB4ZzJDU3VBQ01sRlZW?=
 =?utf-8?B?eXZVVmczWVBuZnVsQ3hUZDh4NjV0UnNleWhUblhDc3pQOHRNd054UURQKzZL?=
 =?utf-8?B?dlRvNFc5enJ1ak8yZjlYejRscW9GaEViQ3l5KzlWK3FFdy9jemtWRzVMdDV6?=
 =?utf-8?B?WFpTb2Z1cVNNc2YxQmM4QkNMK0MzazNJcyt5VGxqRENtNHVzbVBxejF1UUFm?=
 =?utf-8?B?ejBqUkRScUhzVmQ0MlU0enUzVXBqRnA3YWxZbmROYzMyU01UTUpQb2lucjlu?=
 =?utf-8?B?ajJua2xSZVhGMEpvWkRRK01UdmM0aHdpcHlPQTN2cWUyY1A1OGlRcE0wWkVq?=
 =?utf-8?B?b3R6SU5vZFhhREdFbnQ5MTRlTnYwYWRzMTg4Ty9UM0M1ejJJSjlUQjdJZGZz?=
 =?utf-8?B?MXhiTU41aVc1VUVkWS9vbUtQMEVaUWlwQ2JycU9iMHc1NjFqbTBNU1hXTHlp?=
 =?utf-8?B?a2VpbjYxZng1cHEzYmVIL3M4QkxjcytKOUhpSEdybnh3MWVMcXVsMXRtZkRz?=
 =?utf-8?B?SlFMekdZcG9jcnd5SjFqamNVM1kySHVHaXpHUXhpdkFuREpWUCtVRFN3Zk91?=
 =?utf-8?B?K2kvamhCZGtOMGtWQStYakNWSWErODZYbnVZUVJmVXFqek03QjROcjIxT0hC?=
 =?utf-8?B?cWNNNWNYQUIzRWlIU2NwTXNNTnlaZXZnUW9VL0t6TkRQS2hVZU9YR0tvbTdF?=
 =?utf-8?B?OTh1WTB3em5IQ0hjbHlnelprbXc4Z3E1L0lxMm8rc1hjckZUdjhuc2hjb2cz?=
 =?utf-8?B?WENEMGlxclk2dS9UbUZ6Y2dLdk9hc01xRWVKNzJ5NE5EZWp1UlZzRUc5VU43?=
 =?utf-8?B?Sm51d1J3VTFMYmxidnRhd3I5MERwMWJLT3FLMkoxdTZBYmN1RW5lZHE2WjQr?=
 =?utf-8?B?SllJSUJFSFZuSldIVnBjdGhUcGhvRklWVm1SZHA0cTBobVV3UkJjZjR1Zklh?=
 =?utf-8?B?VGxuTXk4WHdqR2pJTmtyQ3U3U3NpWVM1UnNFWnV2RjgwQkVJMGljamxYaHQ0?=
 =?utf-8?B?OUNjVmtiTS9rZTYvOC82aGpvc2llbU9DTWcycDhWZ3ZwU1ZEQjNtb3JtOVRt?=
 =?utf-8?B?c1VhNzR5d3RuZHZmdWpkV1FVWkFzWVNic1FzanJka1Y2NDJRcHV6aStkMGNS?=
 =?utf-8?B?OUtaQVRNSGNkdU5NdEo3a20yT05tQ0VRenBqRlRsNi9zUGJEMnFHK2lLUEJs?=
 =?utf-8?B?aEY2YjJPRXRzSGVrTXRDQUFqeitIc2srZDdQdUdmdEwzUHRldmp5eG5tUlJF?=
 =?utf-8?B?NUNsYkFuMHMzY2U5eUgwZTZIZ2hRZDR3RkZ2SGJRdWJqdWhJZ05na0lxVDZy?=
 =?utf-8?B?SkxpVytyMXZjRVl2R1piNEtIL1NWTE01TUQyMnEvZ3dqaEZTd1FQWXo2aHBi?=
 =?utf-8?B?UUJpK05hUWFhRGExM0FyeVBrRHFBb09hYmlrTDd0R1RXcTFuQVBHYU13U3Rm?=
 =?utf-8?Q?XTgTJRgCe4O+sHgSjQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7478e4-cb35-410a-e57c-08de6e33313f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 14:45:28.3934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4dxvda0BBmikcnifv00DzRGDIB7Wu43cKhvTgMiLdBlXbjjoB12G50X6OvXGUHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9036
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 34DA414D456
X-Rspamd-Action: no action

On 2/17/26 15:35, Michel Dänzer wrote:
> 
> Adding the wayland-devel list for Wayland compositor developers.
> 
> Also adding the mesa-dev list for Mesa developers, though note that this list isn't really active anymore. You might want to create an MR or Gitlab issue to get feedback from Mesa developers.
> 
> 
> On 2/17/26 11:29, Christian König wrote:
>>>
>>> @@ -732,6 +732,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
>>>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
>>>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
>>> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY_ERROR, drm_syncobj_query_error_ioctl,
>>> +		      DRM_RENDER_ALLOW),
>>
>> My educated guess is that userspace doesn't want to call this IOCTL separately because of performance reasons.
>>
>> Instead add some additional flag to DRM_SYNCOBJ_WAIT_FLAGS_* so that the IOCTL aborts the wait and returns an error as soon as it sees any fence with an error.
>>
>> Another DRM_SYNCOBJ_QUERY_FLAGS_* is potentially also useful to query the error on a number of drm_syncobjs at the same time.
>>
>> But in general since this is not a HW feature the userspace developers need to voice their requirements and explain how they want to have that implemented.
> 
> mutter currently doesn't use the syncobj-specific ioctls to wait for a syncobj (timeline point) to signal / check if it has. Instead, it uses drmSyncobjEventfd / drmSyncobjExportSyncFile to get an eventfd / sync_file representing the timeline point / fence, then checks the status of the fd and waits for it to signal using generic poll()-style functionality. So unless the error condition can be communicated via the latter (and plumbed through glib APIs), mutter would need to check for fence errors separately.

Good point, poll() has a POLLERR flag for that but I have no idea if eventfd supports that in any way. So potentially doable as well but a bit more work.

Using a new DRM_SYNCOBJ_QUERY_FLAGS_ERROR on all signaled syncobj as separate way to query if there was an error should work for you in the meantime?

> Xwayland uses drmSyncobjTimelineWait to check if a syncobj timeline point has a fence / has signalled, it also uses drmSyncobjEventfd similarly to mutter though.

Yeah that sounds like something Yicong could tackle.

@Yicong any more questions or do you got the idea?

Regards,
Christian.

