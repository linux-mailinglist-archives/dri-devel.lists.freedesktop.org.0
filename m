Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1EA4E0E3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4661510E5F0;
	Tue,  4 Mar 2025 14:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eZ4eBIQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ADC10E5F0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:29:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnzVKE3hlb81L+ii68KRyyep8+5bJuE1r7qKEBUruOTZbnBy0ZBxgFK7ahP8WYSLx/behv6TKSN8J0eTScoisUPwsGnA49tHDcYqeAsLwdcUb/SHM/MxFfEJ5aGbRI5iANtdw/bgBVkB7L8BzAgeFJtoIkTQ3oJRiXodEeWOS6N/b3t8wzb3lLFAjxyXuajO4SnpKJ6J59CUZXLz/s+8INe33jVmXLkXSxV9koHRalD33A2iv2XVR+Qlz39juDmGQ0nFs/u0Tmst7sz4tuZzgqjdYLI45RrtyWZCe565I6/CN2fFjL9pYbsheu31Bqu1xZ0q+SXR/MQDjliR9nNQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWmXeP637apDnYFTNHjK1EtRSH7kFMGVBmjjpC8N2tM=;
 b=YqvUxcfStzCoLDRRTpL9lPfIsm78TiOFaYJ2ltMcPIDTpCrjJxkN1LJZ6pycDPVEwMoe2ZzkqlNMMghU4z3sVj/Nk/lrJHknsJrm8Odx8oWhoN5ZgATwJ3DFqG9CTj7zxrHAAJkFABX+F7T9aQElnwjPzyUynZCFC8e7oGikOG5oP2QlPS4h4ugkkoaoS69nUvnMMvfr/oKLerNqx5TR2tJlOGJvs72dtgya8KliNLGzTCwWedJ9rp41/NKZrXQmEsMdvtUynVpx9d0p/Yo1unDCz95oo/96S2TW/bbec7+k4Ms/lkh/3PsRC4BNfkXBmDyfsjKmJy3qXAp94oIvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWmXeP637apDnYFTNHjK1EtRSH7kFMGVBmjjpC8N2tM=;
 b=eZ4eBIQ4IeAT4QpUGtyQiYAFMgxdQOV9Kg8fn73RjkniV4MNr+wMGBCBcI9oYk/ntHHqccIj3kVelZIcApgyjtoh9ydzClgH3AEOTF8GZW8rR2BKgM0NVYhae/xXW9VBat4tlReOraZ6/9xw5FlRjJl9uBdfiJ+bT6+mBHhvJus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 14:29:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 14:29:49 +0000
Message-ID: <0d471fca-b64c-4392-88ee-d26dbfe3cf2d@amd.com>
Date: Tue, 4 Mar 2025 15:29:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
To: Jason Gunthorpe <jgg@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Wei Lin Guay <wguay@meta.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250226133822.GA28425@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250226133822.GA28425@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff19752-da2c-42df-ae7c-08dd5b29051d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU1VQktJcUhvMU9HYms5WU5XTDc3NFFuQXp0VUwxS2hNNTJNaFRiejV4S1I0?=
 =?utf-8?B?QmtPT05hdS9BZW9hOFhqU3YwQ1FTd2NwR01qZ0xUc0tWSkd4SkZXMm03d1ho?=
 =?utf-8?B?K2RaK29OMmFCMy9ZdWhHeVhqVjc3TUlWcWhNWFo4eXNTZWZubi80SHlxOFdl?=
 =?utf-8?B?KzFzbTVkTFI3ZWVjTng3UmIyK2RSV1ZUMjI5TFBoeWlLcG84K1Q1WW1tVE9w?=
 =?utf-8?B?N1Nob1Vvc3B2VDFUUlZCRzU0ZGZCRFFVaDhjS2lseHdvZVU0TnU5OFdJK1kr?=
 =?utf-8?B?WTRVUEtkU3ZRRkJIYzcvUkJqQlA3TENFSmpOdVhuRCtINDBYQW5xMnNFMkI5?=
 =?utf-8?B?dWNpV21RWVBnTTVaaUoxczVicDF2SHRMNkJIZnV6bDBCb3FLUHA2ajhBa0ov?=
 =?utf-8?B?YndLM0ppSWRacnY3NGJSa2JuQjJtcTlHdnNFTU5CaVBRakgvbFdvMVhlWFFH?=
 =?utf-8?B?MWhHU3BaOEhXeDkxN0VFTDVtZWU3aVE3bytCTzhMR1BRaTBsaFVHSldTQ2ly?=
 =?utf-8?B?emJUMko4dk10eDhGeFhkZ3FmM3hyWlFqbkw2Vkt1VWhVYWZBZFIvbnl0K0lD?=
 =?utf-8?B?T3RIM3FLWmtnQU5IcmZqRENCeXByYUk1YnU0bGJtallQdTZVNE9VdHdwR2JC?=
 =?utf-8?B?R01GQ0FRVGtlYzEwaUFsRjEreTRuSlROWk44amNVQU90NzUyR2J1WnFBekpG?=
 =?utf-8?B?QVlXdkplcHgyQURrN2s2ZVliOUZxZnFqbUlIRXhkUlh0bmw4NnQ3MGpyRUp5?=
 =?utf-8?B?b1ZxZFUxQ2ZUeVNuaVBpZGpoUjZrK0l6TWVGbnZyeTJUR0k0bVo2WllJa3By?=
 =?utf-8?B?NjczV2J2dFFUL0VoQkVXc1NOaWVGWEVkc3J3UFljdEUyc1lXYmRBbEFocEFC?=
 =?utf-8?B?MVY1anUxaU16MUJPQzJ5UVI2KzZJUU9tSUxobjVRUTlrM1RPdGh6ak9iZ3ho?=
 =?utf-8?B?WVNsZEdrTXpIcGtyK29ValpwUkdFNUpla3g0Ni9jWTVoR0VUVFErZGEzNVBx?=
 =?utf-8?B?VHZxMmlVbE1lbFpMUTIrVFhkOWYzaWpkTU1hRTNVSE54Wm5SYUh3Ny9xdllP?=
 =?utf-8?B?dEFIQXYzWFhLQXN6N3pEMTdWRnVQV2RTUGVXQVp4dGo4Uk9DUFFuQ2YwVFBT?=
 =?utf-8?B?MFhmSy9ZUHphdDRUTE5iZlpiNWF1VXVQREFkVnlCMGRwQ0YraWdIMXROckV1?=
 =?utf-8?B?QU43cGN1clRINnZIelZONFVYTElBb0FOV21oYTRBZHl5ODE3T2Myd0wwMHlM?=
 =?utf-8?B?U0dIdU1JM29yaUR5TXU3KzE5eFRMRWFDOUl1blJ3S2lmdTU2TVpVbVhpeEpZ?=
 =?utf-8?B?TUpzRkcrRnVseno3S0J0ekFGRm84SFRCQW9ycmRRdXJlY1JQNUZaN2ZIU3Nq?=
 =?utf-8?B?TWJkeXFpWC92M01zc1JoT05JanZhRVRtTDFUMkY4ZzZnN2g3R2hjZ0V0NUxh?=
 =?utf-8?B?UXBHU1djZTFzYkt5em1ETGVwYmxxUzk5NnN1TG9hakdydEN3RkZoa0h0ZCtZ?=
 =?utf-8?B?QjFjR0Y4OTkydmkzODREYlNQTE9KYkVNRGxvY0FFd01MdWo1eElneGI2cHZZ?=
 =?utf-8?B?TDRvdnlGSEVHaFJScHdwM3JyaTJHcVhKbU9zOUFlQ2QwWktWMHBKYVRtL2ZV?=
 =?utf-8?B?TlpoQWxvTEJrcFprUm1FS0x2UGVXT0V6dWR6a1VOZXMyUjZJRm1yU0ViOE5S?=
 =?utf-8?B?YUZRYzFLVW9KZjN4WFhmbElFamVhR3IzWE5oU2lhckY2NFUwNldNdXFNSjNT?=
 =?utf-8?B?cTZ1NHRocS9lTjNzUmlzUkYxc1gzdHE5YnN0YlluWmt2TU81R0Zzd2xKUzhI?=
 =?utf-8?B?VW9ScWE3enpkd0hPSXZ3ZGwyS3g1anJ5a0l4bmpETHh4MlgraVdMaWhTVzdE?=
 =?utf-8?Q?qJOgt2rhdDazJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFBUmNqZTdZMjcyMW5NSmtUc3RZdktseHNydkdqQURvL3ZyRGgrMm9hd3FT?=
 =?utf-8?B?WklTR1dNYkQxdjh2alpra2RXeExEeE5jT3RSQ0hQOE9MSGp6NkY4WE1HUDlT?=
 =?utf-8?B?M3dvODNIek5kWVA5dG1naTYwMWtQazhjaVltR3AxaHFEdUQvWlRDRm8vR1U0?=
 =?utf-8?B?NEthZGwwVEZlTjRyY3N0K1pqdzhFRTV4ZkFOOWFGTTdFWE5QeHNvYzFicnJD?=
 =?utf-8?B?RjJTMERRYm8wbFRiYW1UN2RsMFk5NlJJNVdRVVVpUUFnWGhmdEZYc1N4ZUt6?=
 =?utf-8?B?bkRRd2I4QkxycUgrR08vWGJCdTVmS3cxVDJUMUZ4Q1NET2Nua3BTZit1SDg4?=
 =?utf-8?B?a0xyY3R5SHNIUUNBR2tBcDRRZXhFMC9adTN6VnYxcmdyY1NyRWdzOXVUNXlT?=
 =?utf-8?B?N3BzSTZBUXBvRnZ3UnBDMUE5dStlVDRjVk95T0VGbnZVdDUzblFGRkJPNG1L?=
 =?utf-8?B?c3FyTnE4dTBWQ2RxVjRNTHR6a2ZpUDVYZy9FcTBpVUpGR1NScGNsMkp1ekh2?=
 =?utf-8?B?Y2FRc2tVL2hxWkhMYTBKMEs5U1BMNGZNUkYvTmV3NjJpYVY1MUFMb3dtU1F3?=
 =?utf-8?B?djlpZ3N3SGtwdFAwdGdIRUpGT2M3WjNNVzJFaUhsbUxSblBmdFY3Nzl2WWts?=
 =?utf-8?B?K05JOW1UUjJUem9qb21zM09KcEFMZlkxNm5nemMrUzhIY0tueEhHak5YOFEv?=
 =?utf-8?B?YnlVYlJaZ2xaY0tISVVBdnpDWTk4a2ZBSGZKemxnUHIzWG5jYk5QcmNvWFZt?=
 =?utf-8?B?bHdXREc3ekNQRDR4dkRiVVlFN21sTWVnekFITXFFUm1iaHl1Q0lsU1NKTDdz?=
 =?utf-8?B?V2Q2SU5SZnJ2U2Vrb0tvRU5jSGt6MW92blFvRGgwSHFuT0tGNW1XVmRWbGtv?=
 =?utf-8?B?RzhPck51SlVId2FUWkp1RDJnNmIrYjVDWE0ybTViRExJM2JxVDRwK0pCKytk?=
 =?utf-8?B?VW5vZ0dZYmhWL2ZzY3AydEhNNkQ3OVNFNk1XODZUcGJ1NTdTVWdDL01KK3No?=
 =?utf-8?B?UjJrWmsxNlZJZVNqaWY5QXU4ZGMrV3ZoM1l6WVJLUWxLaGp6TUJ5QnZTQU5X?=
 =?utf-8?B?NUM5blpLaTlvOUFSZG51MzFWRWFmSml1cU9DSVQrSXFXZnVvcndpNHhoSlpi?=
 =?utf-8?B?RU5qeXVVRjM4OSs0dGhwNEE0VVVHVnNJQlJoQmdpNGpaM093SVBRSGF2M1M4?=
 =?utf-8?B?NU90a0Z1cTYzLzQrZW8yaG0zaDBJN0s5ekRNZm9WOVh5TnA1dXBMdnpiTnpa?=
 =?utf-8?B?bnh4NFVueDlIQW5VZG15eVNERmRHbTdUa2ZKVnE4b29uZTBNR01uRzlWQVFP?=
 =?utf-8?B?OVpXM29TR01CcHpKWmlKOFhmVHVXekg5U2sxQU9wSmpBeDBRZk1IbXdkMHMx?=
 =?utf-8?B?bThRdktHSDlETks5Zzd3NnNJdm1NRmU0VmhwWFFWaC9hZDM4d2g4VUlBaEND?=
 =?utf-8?B?OElWdXYxSEhVallCdFJ5a1p6S21meDZKWUF5Y3BpQSs5WFhxRzlDM0tLc3dV?=
 =?utf-8?B?ZHdpYm1vd2NVWDY0OTNkV2c5eFdMc082T0pTZ0x5OFZTUmZlSkZMeE9memc1?=
 =?utf-8?B?SzhTRWczT0lpTHpoM1VHQjlUUzA0ajBub0djbWFwblJERXhtQjczNWRUWHc5?=
 =?utf-8?B?RGsyZG0vYTRuWXArTGdTVGQrTTh5T2Mwb0FOcVVpOXNiZ05KaWJFODArQlhk?=
 =?utf-8?B?ZFpseTErYXBqeTNGeDdYRWhuZjZWQmlGTStNbXhPQ3lock92ejEvczhNeDJV?=
 =?utf-8?B?dEZrZkZMRHBmT25xUUZOdWcwem1IbzhPNXF4M2t1L0x0VEdsYXFRM2ZGRGFS?=
 =?utf-8?B?bVdFT3J4RGVZcWFpNTVaSHdRcGVtU2I1SHBhdVNsNTIrNlNDY1JlQkltVTQz?=
 =?utf-8?B?ZXArSThFUGRZS2hscTZlenAwQnNwVndxZ2VGemJKa01yVzRBbGFzblVxZ0RR?=
 =?utf-8?B?UUgzZFhFZFJWUWFzRHJRSU5zYVRsbzhSOGpqUEIvYWpPaUIvTDVsUlVPQXR3?=
 =?utf-8?B?aTJCakphTDhHUGpTNG9zNEpDd2Z3SDByRGpMTkk4ZGpPT0M1STRyeE5mRVk0?=
 =?utf-8?B?QXQwdS93V3M1Q29tUlZ2Mi9xSU1qZjREV0EzMmJzQkhqNHhMSjF1dE5JM201?=
 =?utf-8?Q?UrBupBy6lrgRgrwbtoe5eUQkT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff19752-da2c-42df-ae7c-08dd5b29051d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 14:29:49.5426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcEHna2B0GPLqp/zZYck3ipWdM1kqzz3nG+MEi1+lZNGqp/upadorRxC7oC2PvPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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

Am 26.02.25 um 14:38 schrieb Jason Gunthorpe:
> On Wed, Feb 26, 2025 at 07:55:07AM +0000, Kasireddy, Vivek wrote:
>
>>> Is there any update or ETA for the v3? Are there any ways we can help?
>> I believe Leon's series is very close to getting merged. Once it
>> lands, this series can be revived.
> The recent drama has made what happens next unclear.
>
> I would like it if interested parties could contribute reviews to
> Leon's v7 series to help it along.

I think demonstrating how any new interface would work with the existing importers/exporters would help.

> We may want to start considering pushing ahead with this patch series
> and using the usual hack of abusing the scatterlist in the mean time.

That works for me as well.

I think when we should get away from scatterlist then that should be a separate set of patches or maybe call it a separate project to get done for all DMA-buf parties.

E.g. propose something like an iterator based interface and demonstrate that V4L and a DRM driver can live with that and that this approach works like expected.

Regards,
Christian.


>
> Thanks,
> Jason

