Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8496B30D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063D910E6A8;
	Wed,  4 Sep 2024 07:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t+PTz3y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461D10E6B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSqnYa2iLh6aw2fyTWGkB2aFtBSWgMtb49Zb/87qh0oOY67mQAWRQtEdjGJaVDu9fYPcoO0+DaAl585Xt7IpMz4fZfEbhj4Fyka/hJnT66rMYYbUTdLOXB7oMuD2qJuq5TMoLG0k+YsQ/1QUV5aje1PRoYmvlrrq0cR5bA/YIUnCWvyq7qAP6xSV1IoD21vT9pbzKvH73DshYwOZlJgIRi8DWXq/m+t/nXQYg+waQa4YBSJkInx6BFFSWYHrDP2QZMHY1BE3WhJwpJvTmFncfeY2b1ClUKpFx8kPiAXCEthU7IccTtoe21nnsbA7VIrlyJK2yrFib0hETTkPOwFgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlbhofznO9silNcixRCr1zH1sgox5OIcX6Mi56UuGBk=;
 b=KJJck+IpwlaJeFdpJ8sNiixVMQoGHCU+fvZrRRnc3+3frglzw9OLRZOd2JbPxW2lfrqbF1K5mAkjj1CxDGszXrBtTSbwZQMICwJE8vQqhQTVG88GULMu4AiX3G9ftmVRJOFLt5Y4Y8vH+URapUU3+ST2xV3U8GkXA/AEDRPDV70hQPlp+mWnN2gLXUv6ai2vsLkU8285I9w8/WrlU83wLPBFb/ARhtQzgbgXe7c1L5lhd6FZiXCcxcMzye3/IsjUOo/Y757QTlNEsrwIwicW7Y0iJKk0zImakeVQXrwpEXZaXVQMYafXCPbsOAdOzbf97URbGEORkN8GBjAyjeDEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlbhofznO9silNcixRCr1zH1sgox5OIcX6Mi56UuGBk=;
 b=t+PTz3y/bkhnOTeZB+qkXMWBTb33WVAGFu5StGjBJFn8bs0TmekG1mwBTjU0dP3+hhmIlPZuwS7WktihbDAvJnshQNnAnzMPfxWDaJ3ug0x5GqJNHDEYQtMyC++m8jCLQ9AcpidsjbYWtW9nPPC6kLSalt7EN61aDp0SdqDYgbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 07:40:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 07:40:43 +0000
Content-Type: multipart/alternative;
 boundary="------------TDZFqnznmKyjV8PbConOIHvm"
Message-ID: <77ce6514-7050-4b17-b7f8-096b7933dcfb@amd.com>
Date: Wed, 4 Sep 2024 09:40:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
 <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
 <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
 <b6185b8e-148a-494e-a336-e4290c38b700@amd.com>
 <ZtbFJRZKA4UghVai@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZtbFJRZKA4UghVai@phenom.ffwll.local>
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: e44ba62a-a7c7-483e-9ede-08dcccb4e1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkQzMnh4c29QOGVzSEZiWkdsMm5zZE5Wc3FudkdOS1ZlR1gyVDV0QUhabjdz?=
 =?utf-8?B?Y2JSOXE2Z1FHc2g4bVROR0s1THJlUlR0RUlLNzVYK2hiTUJIaTJTeFRlcm42?=
 =?utf-8?B?d1I1OGdpTmhyK3UrMHB0RWh5TjlaQktJekRGSzJyWmxSN0tLd0gyYVdwSnNq?=
 =?utf-8?B?RVVtZ2IrRjlxZmVVSXM2UERWdHc2RTZ4UFdRa2dNQ1lPVlkrdFdTMmIvNlZ4?=
 =?utf-8?B?c09PS1A4WElOMEpyNDduRDBBWmZSdVhnbTZhNzNIY25yK1czb0FWWVVNOTBn?=
 =?utf-8?B?Z3drKzhOc0xGNjFCV0xOL2FkRXdka2tvVGp2NmJLWHlITE0yMWZkMUIzcXR0?=
 =?utf-8?B?dVpWU3QyWEFvVmxRbXUvdHNGVGtacEhvSk01czVrQXFGdTJBNkFiZ2pMVWx6?=
 =?utf-8?B?ZGpMZER3RStxSFFRaUJpQTdWUDZteHVmRGd5MWtoQlJjVnJiWC95WG5JUHkw?=
 =?utf-8?B?S3J3ZUFINGNzTUF0L0FGVmlreWlDUG1UWWJEeEtWcE9HY0hQL3AyT3g4SU40?=
 =?utf-8?B?Yy9uVHlBdnV5dWhZRWdpZmdpUlF1c2NlMnZ6T0xjZVVwclpEang4NFh4RVN5?=
 =?utf-8?B?dzNQV0dzZ3ZpSDZ1YW51d015ZUplQnVDMHRPemFiT0hsT0ZjNE1KVWpta3NF?=
 =?utf-8?B?aFIrSk1qa1VhRG1iL3BoaXN2bG0ya3V4aU1IV0ZvTVRPOThObm42TjF5UWIx?=
 =?utf-8?B?Y3huU2xucVo4Q3ZRZEVLRm5OcldpZ1FpVzlFbWpqcm1xQm8yNGlJdHBpWDZp?=
 =?utf-8?B?eDRMTEltMUJnY2ZHWk13TlZMVGl6bExGdjVNSVdzWEpPUk5xTXBBVGc3QXVr?=
 =?utf-8?B?TUhMRm5EYis1OXZsaW50Zkl5bXFsVU5VWjdoNnFtQkNWS2J2MFlKcFoyUXFu?=
 =?utf-8?B?WlMrZk43SWh4a1VndkkyTktlNGM1eG14QXBkUGNadDdzVTFqRGRQYVViNjhW?=
 =?utf-8?B?eVNjRHh6ejRZTXV4ZjBTSmhxSnNsS3J3d1BhMUQvWk5BNHkrQlRaSVVKTlZC?=
 =?utf-8?B?TUJUZ0I3d1Q0WE44NXpIaDJiKzV0dmE4RzQ2TmJzaXZWcklOZzlCYk51WU90?=
 =?utf-8?B?YU5TSHZzd2tYeUlVeVZpK29VNTdRZnlGOHUzV2NZUXZ5WFQyeVlLTXhLZzNM?=
 =?utf-8?B?cmllaWc0cldpeUNtd2p2aExLRGxHZUdLaTJsTElnNmpOZEdwWnRvRlEzK3BR?=
 =?utf-8?B?RlIrUHorNjFoRXhrSVlCS0IwTjJTSUFxTXRva3lnWngxbE9Xd2R1TUNrc0Fr?=
 =?utf-8?B?dm1mNGJnNU5pM3pXVWZ0VTBnUGI1bzJkbFZ3b3FLNWZ2QXNXSmlrNklZTHJt?=
 =?utf-8?B?em5kUXBuR2tWeHRrVnFwZ1crMjR0RXg2KzNiRGlFNHQ4NXZMeVVqVWlXOXJB?=
 =?utf-8?B?UDVJd2QrY3kxamc2VE1IdDRZMXpvc2E0WDYzREgzaU1oMlpsKzBZMU9LWVFo?=
 =?utf-8?B?UW5rZFpvTmFiclAxckdwNEora0ZqYzZBUmJYakJCQUgwa3M2THhKRU5xSzQy?=
 =?utf-8?B?UDJocCtmdjB3NDQ2cUVUS09SdVNJSVlweUtRMWR2MlM4ODkyVWU0T2JuUTd6?=
 =?utf-8?B?NjQxbGRSMVhudDBDTUI5L1A0SU1vQ1FMKzVQaEpOalpjdUd5UEEwbWJoSXds?=
 =?utf-8?B?Y3ZoSm1qRmxLcEVHOTVpUzVJWXFXK0FJZjYxdnJkMUxiYXYvWlFTQTg0N3lG?=
 =?utf-8?B?MUtkM2pGT1Nsb1BkeGlPdnMwY0JkV1hrSUdKY254S2xjTHJBKzVkSm9Wb0NN?=
 =?utf-8?B?cmZLQ0tPM2JVOVc3QjdremtoN0Jxd3hDNzZkVlRJZWNEMVI4TWdHUmQ3SnBZ?=
 =?utf-8?B?NWVIMXpoNitmZUJnLzNFUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVJQMmo4ODg4alQ4eEZJOFNCeURWRXRWRG5KdlMyUWRNMjVxcGtNVmxQaXF3?=
 =?utf-8?B?bnUwZDE5NFFFdldtYVVUekppdEg4SlNlVnIvQzRUT0Nkd0dCR1JudXBvOStI?=
 =?utf-8?B?WW4wSThFSlR1K3dEaXBnNUYzNzV3WTNpZ2pRK2Rla0gwWUtSMGdKTmxrNWlO?=
 =?utf-8?B?cFN0QkRKY0J1elNyYzNXc1EyMmdyYU8zUEYvc1l0ZDRTV0FYbWx3Zms1MEEz?=
 =?utf-8?B?M1QvbTF2UGpTZWdRVXBUU25vUU5vSngzdXdrYldaYzk0eVMzNGxoQkxUcTRV?=
 =?utf-8?B?MnZTbFNsczArU2FVTUM2OVA2c3l4b0RuTS9PcUhaWUFhbzBFS1RrVVpDK2Jp?=
 =?utf-8?B?OW1sODV3SEljVGtGeEZmYTAxRzRlcFRLbjU4ejBMdHptQWc0NjE0NUd3MjRp?=
 =?utf-8?B?Nnl0czJIc2ZVZW5MVUtEZTlDT01hbTdjRDFSR1RnWHQvUktacWJDUG1LYmtZ?=
 =?utf-8?B?cE5ha3h4cTNFdzZkcmhGcmRoNUxPR3FydkJWYU4rQUZTSWFNZ1E5S1FWR1pU?=
 =?utf-8?B?bUU1MnVNMGpPRGt6L0JaVUFENGhOL3BOQmpsWEwrY1R1OERkbEppc2N5RWli?=
 =?utf-8?B?QkVvWnZRd2RtVGVNdjg2UFJlMnRrK1lPRHVhOWZxVzFFTGJmc1NMT2lXS21n?=
 =?utf-8?B?YXNEZlZGOEN5OSswT2pVNHJCVWlSZjZMWWpxRElRSklRSUh6RmRhc05qUTdt?=
 =?utf-8?B?Z1NoWW5RREdTcjg3SlhNSlRId3B6Q0RFOVR4cmZTc0pGUS9nT3J6QlNXQzBZ?=
 =?utf-8?B?d2lxaTBuVDhQZFN0ZEQxaXVyaVl0dm16c2F0OGJVakZLbStMcVhDbm5FZSs0?=
 =?utf-8?B?OG5pTFQ2MVV0c1NFQW8ySnVHSWhXYUtsZVRERTlwd05KeTZWd0plQnl6Z3Ay?=
 =?utf-8?B?YmsyQThXOG03Vmc5UzAzZ3NXR0cyaFZrR2dUK3VYc0J0M3U2VU9HR2ZaOCt3?=
 =?utf-8?B?dGVmUUUyTVA5RWE2a0NyanVhNDFVM1VDc0FDVWNkaVhuNWxzaXEySnc3dTE2?=
 =?utf-8?B?ODlRamtORVNQb2RFemozb1l3UkZRQmpYdWhPQWE5b2Z2MFNRK2hIcUdyRXZn?=
 =?utf-8?B?OXJ1cGkzdUtUekh1NjhXeDloc2JKa3R3RDZFanlJZDBiU0xYV21qK3VPVmZz?=
 =?utf-8?B?NGxHUXVQS1ZHcmV3VWRSOTJjZ3E2b0RXUU5yTDNBV1hOQnZ3T2VYbEQ1Y1hZ?=
 =?utf-8?B?Y0ZvQXNDQnFkSG5SSjlMbUxOQVhGbFd6dHNJT0U1RkZ6T3FYaWlFMWpGRDRW?=
 =?utf-8?B?MzdoTWZaN29WM0x5Z05UUEVjNjhWSHdIVjh6dGpuMEZrVWZYVzBKdUl2eTJs?=
 =?utf-8?B?ZXh1WkkvbFp4TG1TRDk2ZnNkbWZLZ2FGNFhrT05iaGlTRjhiMWorV2cza2Jk?=
 =?utf-8?B?eUtoeDQ5VXNubW92QnpCYS9ReGtpSEFxVjQ5UW01cVo3LzhCWEZEN2U4Y2VN?=
 =?utf-8?B?cEwwMEVNOVpkY1ZhaElRUzhaRThSTlNYdGFWQjltOWZWNUtuV1U4cFZFZ3Ux?=
 =?utf-8?B?YkxQMGpDelJ4THZHbXZZNTRmVHdtTDI5cWw5RjVwL2tuUE1ydGJyd052aXhX?=
 =?utf-8?B?eHovbjhDTmxHTStMTWErajNxdFpGcmQ0V1lwelMybmswa3AzZG12Q3VzbGc1?=
 =?utf-8?B?NFgzTkVDU1I4eTA1bWpDZFROcVV2cnhWVHdVclczTWlUdEJ6STJJY0g2TDV6?=
 =?utf-8?B?b2oyUGNVVk9TeVV6anIzR2Zsb0RRWEd3YUlsRXdIL0VFdmJNeWEwTTdQWnow?=
 =?utf-8?B?cmtKMnUvSmtWaGxJNWc1bnhrUzdwVzhSQlBYMVVPeVIzTzJTNzFFU1owc3RS?=
 =?utf-8?B?U2NLUVNOQ09aZXNjYVFrWVdJSVU4cDlOTDlNU3JvVXJaVUg2bEhrVDR5Z1VH?=
 =?utf-8?B?VEs0YWcxTHdhNEU4ZVBQTmNJaUdYVUY5MGFVZDZzaWFSYlFPdVltL0hJQ3RZ?=
 =?utf-8?B?aE85andxS2FxODRNMzRRc2dXZ3N4WUtEODc1angxVFN3RDA5bUZyU05mdzdn?=
 =?utf-8?B?OUxnZ0ZhMVR3VEpRc1RzMjR6eStMNEttMkZaSmN4RXpON1pNYjI4UTRwWjB2?=
 =?utf-8?B?MmxaZm9YcE0yVHNBdnE5am53VE1xQVgyTlFHcStHd294S01TaFdOTGJIRFpJ?=
 =?utf-8?Q?vsLQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44ba62a-a7c7-483e-9ede-08dcccb4e1bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 07:40:43.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCPH4rTVxk1dga73USNUyH2PfIIPzJjEcLpNCby/xWPBAxdDrMdKZz7zKpNNOdu1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162
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

--------------TDZFqnznmKyjV8PbConOIHvm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.09.24 um 10:13 schrieb Simona Vetter:
> [SNIP]
>>> So I think the issue is much, much bigger, and there's more. And the
>>> issue is I think a fundamental design issue of dma_fence itself, not
>>> individual users.
>> IIRC both Alex and me pointed out this issue on the very first dma_fence
>> code and nobody really cared.
> I guess way back then we didn't really sort out any of the hotunplug
> issues, and there wasn't any fw ctx schedulers at least on our horizons
> yet. Thin excuse, I know ...

Well it's just when you have a bee string and a broken leg, what do you 
attend first? :)

>>>    I think at the core it's two constraints:
>>>
>>> - dma_fence can stick around practically forever in varios container
>>>     objects. We only garbage collect when someone looks, and not even then
>>>     consistently.
>>>
>>> - fences are meant to be cheap, so they do not have the big refcount going
>>>     on like other shared objects like dma_buf
>>>
>>> Specifically there's also no refcounting on the module itself with the
>>> ->owner and try_module_get stuff. So even if we fix all these issues on
>>> the data structure lifetime side of things, you might still oops calling
>>> into dma_fence->ops->release.
>>>
>>> Oops.
>> Yes, exactly that. I'm a bit surprised that you realize that only now :)
>>
>> We have the issue for at least 10 years or so and it pops up every now and
>> then on my desk because people complain that unloading amdgpu crashes.
> Yeah I knew about the issue. The new idea that popped into my mind is that
> I think we cannot plug this properly unless we do it in dma_fence.c for
> everyone, and essentially reshape the lifetime rules for that from yolo
> to something actually well-defined.
>
> Kinda similar work to how dma_resv locking rules and fence book-keeping
> were unified to something that actually works across drivers ...

Well sounds like I've just got more items on my TODO list.

I have patches waiting to be send out going into this direction anyway, 
will try to get them out by the end of the week and then we can discuss 
what's still missing.

Christian.

>   
>>> I think the complete solution is if we change this code all so that core
>>> dma-fence.c code guarantees to never ever again call into any driver code
>>> after dma_fence_signal has been called, and takes over the final kfree_rcu
>>> itself. But that's a giantic change. But I think it's the only way to
>>> really fix this mess:
>>>
>>> - drivers will clean up any of their own references in a timely fashion,
>>>     so no more accidentally lingering gpu context or vms and the bo they
>>>     have mapped lying around.
>>>
>>> - there's no lifetime or other use-after-free issues anywhere for fences
>>>     anymore
>>>
>>> Downside is that some of the debugging stuff becomes a bit less useful.
>>> But e.g. tracepoints could just dump the timeline once at creation or when
>>> signalling, and so you don't need to dump it anymore when freeing. And a
>>> signalled fence is generally not a problem anymore, so in a compositor
>>> that's also all fine (iirc you can get at some of this stuff through the
>>> sync_file interfaces too).
>>>
>>> The other downside is that it's a huge pile of work, but I don't think we
>>> can get to an actually solid design with less headaches and pain ...
>>>
>>> Thoughts?
>> The alternative is to use the scheduler fence(s) to decouple hardware fences
>> from the containers. That would be rather cheap to implement.
>>
>> The only downside would be that the scheduler module probably keeps loaded
>> forever once used. But at least I can live with that.
> Yeah I think interim it's an ok stop-gap. But aside from keeping the
> scheduler code pinned forever I think there's some more things:
>
> - I'm not sure we can do it, without digging into dma_fence.c locking
>    internals too much.
>
> - It defacto means you can use dma_fence that are fence containers and
>    drm_sched_job_fence, and nothing else. And drivers will get this wrong
>    and do dma_fence ad-hoc for stuff like tlb flushing, or pte writing, and
>    whatever else, that won't necessairly go through a drm_sched.
>
> So not great imo, and hence why I've shifted towards that we should fix
> this in dma_fence.c code for everyone.
> -Sima

--------------TDZFqnznmKyjV8PbConOIHvm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.09.24 um 10:13 schrieb Simona Vetter:<br>
    <blockquote type="cite" cite="mid:ZtbFJRZKA4UghVai@phenom.ffwll.local">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So I think the issue is much, much bigger, and there's more. And the
issue is I think a fundamental design issue of dma_fence itself, not
individual users.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
IIRC both Alex and me pointed out this issue on the very first dma_fence
code and nobody really cared.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I guess way back then we didn't really sort out any of the hotunplug
issues, and there wasn't any fw ctx schedulers at least on our horizons
yet. Thin excuse, I know ...</pre>
    </blockquote>
    <br>
    Well it's just when you have a bee string and a broken leg, what do
    you attend first? :)<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZtbFJRZKA4UghVai@phenom.ffwll.local">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  I think at the core it's two constraints:

- dma_fence can stick around practically forever in varios container
   objects. We only garbage collect when someone looks, and not even then
   consistently.

- fences are meant to be cheap, so they do not have the big refcount going
   on like other shared objects like dma_buf

Specifically there's also no refcounting on the module itself with the
-&gt;owner and try_module_get stuff. So even if we fix all these issues on
the data structure lifetime side of things, you might still oops calling
into dma_fence-&gt;ops-&gt;release.

Oops.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes, exactly that. I'm a bit surprised that you realize that only now :)

We have the issue for at least 10 years or so and it pops up every now and
then on my desk because people complain that unloading amdgpu crashes.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah I knew about the issue. The new idea that popped into my mind is that
I think we cannot plug this properly unless we do it in dma_fence.c for
everyone, and essentially reshape the lifetime rules for that from yolo
to something actually well-defined.

Kinda similar work to how dma_resv locking rules and fence book-keeping
were unified to something that actually works across drivers ...</pre>
    </blockquote>
    <br>
    Well sounds like I've just got more items on my TODO list.<br>
    <br>
    I have patches waiting to be send out going into this direction
    anyway, will try to get them out by the end of the week and then we
    can discuss what's still missing.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZtbFJRZKA4UghVai@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">
 
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I think the complete solution is if we change this code all so that core
dma-fence.c code guarantees to never ever again call into any driver code
after dma_fence_signal has been called, and takes over the final kfree_rcu
itself. But that's a giantic change. But I think it's the only way to
really fix this mess:

- drivers will clean up any of their own references in a timely fashion,
   so no more accidentally lingering gpu context or vms and the bo they
   have mapped lying around.

- there's no lifetime or other use-after-free issues anywhere for fences
   anymore

Downside is that some of the debugging stuff becomes a bit less useful.
But e.g. tracepoints could just dump the timeline once at creation or when
signalling, and so you don't need to dump it anymore when freeing. And a
signalled fence is generally not a problem anymore, so in a compositor
that's also all fine (iirc you can get at some of this stuff through the
sync_file interfaces too).

The other downside is that it's a huge pile of work, but I don't think we
can get to an actually solid design with less headaches and pain ...

Thoughts?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The alternative is to use the scheduler fence(s) to decouple hardware fences
from the containers. That would be rather cheap to implement.

The only downside would be that the scheduler module probably keeps loaded
forever once used. But at least I can live with that.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah I think interim it's an ok stop-gap. But aside from keeping the
scheduler code pinned forever I think there's some more things:

- I'm not sure we can do it, without digging into dma_fence.c locking
  internals too much.

- It defacto means you can use dma_fence that are fence containers and
  drm_sched_job_fence, and nothing else. And drivers will get this wrong
  and do dma_fence ad-hoc for stuff like tlb flushing, or pte writing, and
  whatever else, that won't necessairly go through a drm_sched.

So not great imo, and hence why I've shifted towards that we should fix
this in dma_fence.c code for everyone.
-Sima
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------TDZFqnznmKyjV8PbConOIHvm--
