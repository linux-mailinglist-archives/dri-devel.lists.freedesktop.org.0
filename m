Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2776977E0F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 12:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B0E10E251;
	Fri, 13 Sep 2024 10:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AezGA7yH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7B610E24C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 10:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynhXJKbI0nQ2lmFkF3b8gyab5Q1O3aw+NEvLiV7sjSgmSNNdnhxOuyMs34EWW3ez4A2hgQpkw+dWVzFTYb8OdQs7rjF6FI8WwEMu1e64jtKgY2JPVPWZrl1MvPz8uQShfr4dSVQRvJXu6qQ0kioiKdxExsg6LIIADqho38Yb7aT9cjj3aIiUwqNv6mmvXc3v7+7Y3pMeZ0MMH8glQsuYUc9+QW4C4VrYVoIv4QSCcQTj6IuxAiwJ2mPxeNPCi6Ip5VJgd9Sx2xmR47K5I6hzJ/Lm98G907xxoukSWSl5cneYG6WUrvvGegWgaZpLnsDoFWiNBDZ7znYysLKTPvqIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQlaNnlCaW3YfOxTOyYjvuYK9chnUspGND9PzpjhvRw=;
 b=LaDIt5AHCjbHHDo/+N4tAEvbi19A6giZJywisaROSfwtCwBzzJ40Mo2sEoFL2M1Z1CeGkRIkeUS6EjPaBJRV6+z3FPCpU/yuQSd2y2wnizCMDb/nRvRzIWOaLqB47c9P2kN3hE5Dj/YzkPkmEq47NrQH2npfC58u2rHvytHkAJbTj38IETqzipMtHq/f+hpR5yXzfUT+SPzsgho1nWjy8/RnVc3kVNWNpAj4JheEr24XNgjtN4L4A3BLRXqysVVAv+hVfZBfLXGIkaY9kjxhUWsS+L4g8RzetQ9lx9lK8vxjeC3964MR2fAdAp6Aqo4WURSzwKbrhcBG7ehAMY+zhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQlaNnlCaW3YfOxTOyYjvuYK9chnUspGND9PzpjhvRw=;
 b=AezGA7yH2tvN6wITllWJUv2R5xoteWwNwyTwDtGirIQzR2stbEdETaGSz3NEOwEKsmnLMyOxCuXsc0xHLA5aw80lL3rhI10uKboaUKnrOb8zrRt72CWXMYnnObHOSKKZF8Dbnqna/YLK0ElQrQYypX8nd5v9KyOlILr0IKitb9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Fri, 13 Sep
 2024 10:55:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 10:55:47 +0000
Message-ID: <70fdf365-7e65-4b45-9274-abbb1e8a56e2@amd.com>
Date: Fri, 13 Sep 2024 12:55:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm: GPU Scheduler maintainership
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
References: <23b1d4e3dfdbd05501385cc2b67da8901693bbff.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <23b1d4e3dfdbd05501385cc2b67da8901693bbff.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 60081428-6bc3-43db-106b-08dcd3e29f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmJWZnFLd3dKUXNvNEFhNUlzVUhzK3Rsb0Rvb2E2V1RCL3JRZmlOajNpRTZ1?=
 =?utf-8?B?ZVQvMURJQVFKMVlIUU5wVVVWazF1Z2M2RzNLREpydlhBdGRtR2tDa2hoZDRp?=
 =?utf-8?B?NkloZ25JekRGZUFLVTI1QkpRSlBtM3NVVWtrR3VRVWRDVW05N2xJbGlKdGlF?=
 =?utf-8?B?YnhraTBIU2JWZU5RdXhOUDVENUVMdVJzYUp5MGNXcWNQRHpkVDRWU1BYeU1v?=
 =?utf-8?B?Yk10ZzBYRURTelNJZ21HOWJvQzYrd0FUZFFXdUZGTU5LN1FhSlREanVmNXpW?=
 =?utf-8?B?Ryt1NmlHUk9zZFEvNkRvOExkTHNhNGY5NFRET3dWRjhOVHZrbDcrSG9jN0Rs?=
 =?utf-8?B?Q1NVd3FDYlNmZEFwUkNtcm8rOVdxZ2dqRTYyT3dxMXRucjQwMzhOajlKekhI?=
 =?utf-8?B?eEliT3o4T2huTmpXUkV6a0VLRkxQbDVUQ2ltTUFScmJ3cHQwMzlWL2loQXpa?=
 =?utf-8?B?WHE4bkI3UEJ1V3dNYVNnclFTWU1KeDhIVGlrR3NpeUdNMFhBcjJKWmRnYUNi?=
 =?utf-8?B?K2o1Tis4cURodmtyeTRwWHRaSkpDUTNGZDVKZTd1WWgydjFzWlY4Z1kxRklL?=
 =?utf-8?B?cnlWUk9Vc3NOQndPb2dOcWVBRnpZY2RrZ3VaclIzbGdWMHF2OVFwelFNNFM4?=
 =?utf-8?B?TSt1dDh6bXljOUNETFFMWVdGNGMxTG1UNmc3ZjhDR25MOG5YY0FPTFE0N1cy?=
 =?utf-8?B?dS9xdk9Md1hsSlg2akRqU044MU9KVlJSZVovVnc3V0hncjRvOXJybE53VmZz?=
 =?utf-8?B?ZHhvdXY3aEUwNkpuVk85blE0eUxkVHEzNkdGSzUxd1dNSkY0VHFpMjRFVUJl?=
 =?utf-8?B?TFdsUlZmbGk3STRSVWJWeFIzRXZPd2ZwODJnZFpTSWRBaElpdWY4YlZJWjFp?=
 =?utf-8?B?WW14c1dmMVNMK2pmcXdhQkxVcTI0Wm1TNnlNK0QrTFNBUHBvdHhzaHJ3QU0z?=
 =?utf-8?B?Mk4zNkE2OEtwMlFQZ0dCcmFrcHVyS2Y4emRFWUxHb0VJSVRBQ25uRFhadjhV?=
 =?utf-8?B?UTlpeEw3R1kyOE5JMHBZaGtBSlN2eFVLY1VScTgxV2RlRGNnd0pCS0V3RS8r?=
 =?utf-8?B?UGJ6dmMzRjdyNmMyNjB6eFdPU1ROWnM3RFJXZFBaS0liQkJjZXd6UmN1TmZY?=
 =?utf-8?B?L3d4ZXA5TEVzM2xvd3gwQ0taTEFTSmJDMVlmeTVjU0FBOGdESE9YaWRpV2t5?=
 =?utf-8?B?RDhmQUQ0cWkzeldoYnhtcGRuME5CWHh1RHBiWW5TQW1TVUlWNEZJbHhYK2o2?=
 =?utf-8?B?aGZrbkM1V1VMalF1OXJlcnhEbnhVSExkcnVmU21kMVRuaFBta05kcUdtNEZU?=
 =?utf-8?B?R2loSWxFTEkvUzlkVHFGOC9yeUljeTZLaEdZbmMzUkxRbDdxcEtDR0EzOXlV?=
 =?utf-8?B?bEpRM1VnY0dJMm5NK04xdlh0WVliOUpTTGxKM0F3eEVWMDdCTWF5SENlRXk5?=
 =?utf-8?B?R1lxeVV2VHhUcTMxSC9YbFFvU1NrQVBQeUJ4dXJHTFVjQ3Vsck1kU2pMSGdB?=
 =?utf-8?B?RzRVb1VHQVlDaXNuNDRSOG5pNGJqYTYrRnUyL1BDVUNWM21qTjBYeVpUcm41?=
 =?utf-8?B?RklHUVd3bWNkNFk0djJEMWtwcGxDaENDYmhuSjVad05Xd3ZYV0RVNi9vUVB2?=
 =?utf-8?B?WUc0SFI4clhvM2dId1FCY1FaWEpwdkp0eWNNYlBaYzRLeUFKZkN0ZG55OWpT?=
 =?utf-8?B?M1J5dDJjemFkcTFDMUp5VVVPTlFnR201b0U3YVZwUGtLbCs4bEM1UGZiSGI2?=
 =?utf-8?B?LzUrWmNxaWE3Y294VDNDamhJREREWU1XRG1CNDFyQWUyVTBlelU4T2FuMnZP?=
 =?utf-8?B?TE9sNHh0N3ZkMy9UeE55YmVpL2ZtM0x1dnF6eWU4bTYyV0JkQVdEMzJOOThv?=
 =?utf-8?B?OU8va3J6cFRnMm04bk44T2hPRVcvTTBTakoyMkxES3NWK2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzF5NVFkOGNjQkdjT05yUWI4bVVqck1sT2NjaUpCdHd5SkZNM1NqNkZpSmVy?=
 =?utf-8?B?TTJrQ05sWldiNEJqeExaQTRvazdVOHp1Vmh4aWNUTVo4YTVkN1BoRFlMd25F?=
 =?utf-8?B?QjZGL2J2ajdlMmpYZkt2Q2V6TUcreVlRWUd6bEhwN3Yyd0RYNzFkMjRRdXdF?=
 =?utf-8?B?aG44aDRWeWpGQ09OODNFSzZWblRSTTJiQ3lFcnVFWDNHeWZJKzNhRVRiUWcw?=
 =?utf-8?B?ZFQ4NC8vK01Lb0JKQzJ0eWtzMlM0N25HZ0gwMCtkR2dqaEJpbEtaWGUvYXBD?=
 =?utf-8?B?aTh2eUFRYVJ5cmsvMkp6QzZBcGZoN3BDVVUrQVhKNnFlNlhHbHlSbDI5Nmw4?=
 =?utf-8?B?OFBDNFdIQkNSUmtjN0hBa3l0UllaRE5FUzRHcXhaR0VHcmJ4d3VRZkUyK2ZX?=
 =?utf-8?B?WVBTcTVQWVd6YW9FTjZpNnJOU3I2aUpsRi91V0NFWjIzbjlGZkxhZDBXSEha?=
 =?utf-8?B?YUZlbXVaL2Z5R2MxZ2FneWt1T1RFYXMyN000NGdudnVobTNib0NReG93ZVBI?=
 =?utf-8?B?dks4UXdZS1RqSkJtZDBweFd3bXptaTJZVzVIYkxQTEsrSVF0cUZuMFVMdXFN?=
 =?utf-8?B?ZHN1Mm1hUEJ0Y1lOZDdXZVJBdllEV1doWGJqbW9ieXRIQnk5dGxrTWgvZGRl?=
 =?utf-8?B?bnJxNDg4VTlLdzZraDBjMVlvRUNTRDFWT0EzSjd0eVBzZWhZTFVjaUswWks2?=
 =?utf-8?B?eTFRbVFoR1kzWVk2dXY5YURXYUk1NjFkaTAyK1dxT3REVE15b1dMTWlCaXVK?=
 =?utf-8?B?NG1UMGF4UmtDVUhjZ21zSjBzeVNRSnJVNng0UmJpN1QrMjJhZmhSL1p4RkZ0?=
 =?utf-8?B?R3FZOW9JeDdCTWNra1VDV0lTbldrdXdjVTZQSzdQMitybFQ0ck1XRHdzLzI1?=
 =?utf-8?B?a0ZuOERnbVkrdU9ITnNhSVIrN1dac2QxaEZqVFc1LzZNaFplSHh2MTFNaWN2?=
 =?utf-8?B?b2FiVGg1SCtWcW9oRWhPYXFSWnVic0hZMkYzdHNwZXdNblU3YW5DbElNeUc5?=
 =?utf-8?B?QnpxYm8rREJ0QVBrVmxsYVJCb3pweG1iM0lpeUlod0lJNUpITklVMndlS1dh?=
 =?utf-8?B?TXlzbnh1Y09ReHgyYWN1VjFDQUYyUjVUOVhhT2JoY0owcUZhcGV3WXowdmhL?=
 =?utf-8?B?VVlLT2ZhUnUzS2plM0hrZFVLbXRFalEvNS9ueTNwbWV0WTRvTGFyRldkdkZC?=
 =?utf-8?B?eGJacEphMnN1SXVBSkZQbzV3V0tyNW1HMk5qUVlHdVFpNnFQMmNIRmJ4dWdm?=
 =?utf-8?B?Mnpid09lMWhqSEg3TEZSNmR3azhYa1BrcFl3TVYwakdxTzk3VTc0M3dHWnh2?=
 =?utf-8?B?N2YvRW5qaE1jcXVmbW4rLzZnWlNBU0I1Z3ZxOTh4UWxnOXpNalRiRGxWSWo3?=
 =?utf-8?B?M2Q1T0V6d2hXTUd2cm5jc2NSYkV1aVdyd0JTR3BZUC9iR0ZDYnpxajJ1ZzZL?=
 =?utf-8?B?ZC9LRVlGVFBiVW9JOGdJN3JTTWJHRnVUbmRqNzZHNTJuRXB1N09xcy9kTk9U?=
 =?utf-8?B?aU9iaWszUzIrb3BmZS93MkNDdi9uZjFUSCs2enp1VU9HVkVFbCtGckRrcE05?=
 =?utf-8?B?TE91bHJ1OEdCWXI3WlZFZEVtV2tsaGIzbjRBZmN5SktnYjdBSm1ETlluL1FN?=
 =?utf-8?B?OHN4WXROWDE4d0FvWGlidGUyYlFWT0xuYUhIVmhoTHRVcDFGR0ZhNCtwU1VV?=
 =?utf-8?B?SWF3VytHUGVQY1hqamxVMWtsazQ1K01EYURLQUtVL3BYdFk0ZDdWMmZ3S2VF?=
 =?utf-8?B?bUJFeUpWemNicVA3VFplWkMvYndmOCswTE8rQUhIQWlDWjdNU3kwRWRsbDh4?=
 =?utf-8?B?Mm55ZUY3RHlxRTNnRlhkN3VWUmZpR094cjJpamZhYjdEZFcwZmhUc21rQk9Y?=
 =?utf-8?B?RlZLZVpucElkcnp6d043akM3WWFTYXhUbWhtSGdlYUQ4Ty9lejQ3S3poVnZp?=
 =?utf-8?B?Y0FaUmU5TnQ3YjY4NjhidlVSaHNYNFFYVDNuOGg0OE9salR3QnBFVkxoaU1u?=
 =?utf-8?B?b3YwT3R4TElvVnJFdHltOVR1dmtiN25oR21zV3hrdFNFUVl4NFlYZW1XRCsr?=
 =?utf-8?B?eUJFQ09yUTF3dHVoQlE2ekc5OGZTdDFuSEV3Qm14TXdyMUlXblprUy8wVG1a?=
 =?utf-8?Q?eHSg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60081428-6bc3-43db-106b-08dcd3e29f36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 10:55:46.9618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0R5Xn0qXqfZLQXLYRTqq19a9buYNnjvCaxntTPmDv2RyAKTRrywFmJzQ7Wn4ND8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
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

Am 13.09.24 um 12:49 schrieb Philipp Stanner:
> Hi everyone,
>
> it seemed to me in recent weeks that the GPU Scheduler is not that
> actively maintained.
>
> At least I haven't seen Luben posting that much, and a trivial patch of
> mine [1] has been pending for a while now. We also didn't have that
> much discussion yet about looking deeper into the scheduler teardown
> [2].
>
> @Luben, Matthew: How's it going, are you still passionate about the
> scheduler? Can one help you with anything?
>
> I certainly would be willing to help, but at this point would judge
> that I understand it far too badly to do more than reviews.
>
> *glances at Christian*
> ;)

Yeah, I've already wanted to suggest that you and maybe Tvrtko step up 
and start to help out as maintainers here.

And I have >1489 mails unread and can't find time to take care of them. 
I'm happy to help with design questions, but I'm seriously not taking 
any more maintainer work any my shoulders.

Regards,
Christian.

>
>
> P.
>
>
> [1] https://lore.kernel.org/all/74a7e80ea893c2b7fefbd0ae3b53881ddf789c3f.camel@redhat.com/
> [2] https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
>

