Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F0BC3263
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 04:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C09410E00A;
	Wed,  8 Oct 2025 02:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DXT38Oov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C694A10E00A;
 Wed,  8 Oct 2025 02:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnlciAS0Fhs82MPoEewOAoJNVR1slgWiaU+HVfLLfZ8yRSTKL3Qm4iktGhWYQJKHlXVMu6QLJ0ovnlrdi8zpbYeDS5zwSqocRIcX5BMZXG4HyObtgbbJsIIdrU1kZBUxvhnuncrBkeBDJun1hP/HXA7a2/njardV0HNATsoC1f4uZZvJMXriQZR3BYOT23f8oceS6kfUr0u4UlAblQbUwEDc6ivl8XpzE7IgKYWAuc50PiTbw1ICNR1J7OFBRQ1xU3+8aYDES09trrC1gqSa84mPYuugTaGsRhRLH0J9FctWQ/jgB6lqemRsR6uJgL7DiD6xscNC56aMVl7SUwSp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MumTl/NSW8hlkkYssHi5muK8cGAiaf9rt7cqvm8tRLE=;
 b=ss9755ektdnrxpaChvdE1tu5jIqqw5IBVGdzOhKar+g2i3w1bUZP2kjeXqlol0A6XkOVX6ETnu9AmIdX8HsIhM3MPksju5UIDC40p0ZUxiFrptv30m3o/6Y4t3TKHsV3KUrkVsnZ1aCzGMUMxOf/ZoomlAF20V01TZkEVep/vjVCjSGOJIK9xvICG5og+ok6BvoWB1kpfKL3ll9sLF4weHl7zCKtqSFvPRzcT8uz41TPd359sOXoT+pFOcTx2KAHtZo0y8sWgOzew37msUQLstJgoWYf/jKzuh2daSushuZRy1cZoZ5d+vI4kpRvNsRYB5AXSlwI8yBG/N/qXA4RBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MumTl/NSW8hlkkYssHi5muK8cGAiaf9rt7cqvm8tRLE=;
 b=DXT38OovvsmjUNFPh0FeyE71ZF8fSIygy50L2RunGvTErY2REodX7UWpnQG58IxMtD0mxC1Dqs3BdLdOfTcXY+7cO75+JG6NGPSrwr4oCVMOjX30+Ne6k06abmf3+MbcwoNbLVMBLIeDVv7CYf0jcpdUNOFW0isDpRbeQfJNb3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 02:15:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 02:15:33 +0000
Message-ID: <6f24d0cb-ce14-4e56-990b-00ad579bc282@amd.com>
Date: Tue, 7 Oct 2025 21:15:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/amd/display: Initialize return value in
 dm_cache_state()
To: Eslam Khafagy <eslam.medhat1993@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Yilin Chen <Yilin.Chen@amd.com>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251007224549.87548-1-eslam.medhat1993@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251007224549.87548-1-eslam.medhat1993@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0062.namprd05.prod.outlook.com (2603:10b6:8:57::8)
 To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 5434fac0-aeb5-498f-0dff-08de06108f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXErOW1vaHY3dEw3dlcyNkl5bXo2aGJJNVN3VVFTcTdlbWErWkVNN1dXN0Yr?=
 =?utf-8?B?a29BeTNZc1UveWR1a0cvUHFLQjk1VWlpMGgvVjQ5NHhkTUIrMTBOeVlwU2JJ?=
 =?utf-8?B?VVd5eFEzcVZjYjhVRFlZSVFCQ1Z2RzRLd09wUFgxZEtNaHlTNmJCTEI1TFBJ?=
 =?utf-8?B?b2s2Rm9ZbEVLaDVoWHpMR1VCUGFMUG9wa0kyK3lhVUJ1MWcwUEFod1pFQjAr?=
 =?utf-8?B?NWtCdG1iK1RUc1lRemNXblBVZTNBRlMyY3NlcklxeEFRRC96akN3NkxVb2tk?=
 =?utf-8?B?d2lDMlNJMXFqUXhPQi9SU2VoODd5d09seFpuTE9hVjh0bDRndHhSd2JwUTRk?=
 =?utf-8?B?ZThUcklMQmU0eG1jS2tENDRqYWdoZXJicHJpUjVKNm5CZVFReTdTVlV3VWdl?=
 =?utf-8?B?Tm1lUDM4WkI3UlkvV21TdUhDNDJ6TG5FMzVGK0o1cWNDbllYRWpsdVh5KzVC?=
 =?utf-8?B?MWh2NVBFRStaRmxUZXB3c3hQc09KRnpJYlFsdExwTXZ1N3VZTVkyZW8wZ25u?=
 =?utf-8?B?TkUrMEc0S3JXVWRiWWREY1NrMHNCUU05VkRCaDBtb1oxYy9BK3M2WmZjNlRj?=
 =?utf-8?B?NENxQ0FwSFBOTEtYWjJDaUswMjJTSTR6VkRTZE8yQW1rd0N2aUpJdjc4ZHlL?=
 =?utf-8?B?YmU0MGkyR2N1V05wL3dpM05OT1cxb1N1ZTRZZXpmbk5VVDNqekhPOWIzUkFC?=
 =?utf-8?B?OFhZVTg3UXEzRW80S09QUDdKeUhvRVRLU0RwSCtrQ2JXaXN1Rkd1SW5idWE1?=
 =?utf-8?B?QUVBMUIyV0FEUm14cVNIRlVrN3Vtb1RPV00wN2drRUFRem5HYWZ2TjJMeFAy?=
 =?utf-8?B?ektZVmk4T255T0pRc2xWZGUzMndOSXB6ZkRMTXlUSExGUFRjTkR0NGRDbzhR?=
 =?utf-8?B?SVZkeXRxTmxjSXhYUkRMOVBERE9reWwxdFMrZXpZS0NjQ2RPWTlIaU85WFlq?=
 =?utf-8?B?LzlZZ29TUmVxYUhaQ2RHRC90UWpOaU5hTFhjTE1YRW5OVjhveUwzR1hmMXBu?=
 =?utf-8?B?dHl2Wm9ieVVJS0c0RjVlaW82Z2tEdVVhRGZuQzhUQjFBTTVabXMwS0ZZUkJZ?=
 =?utf-8?B?bFFTZzdwTkhjMVB0MlVPV25sWE8wSXlzcXp5VmJ6Y2t4RTIvVzYrR3FnSTdG?=
 =?utf-8?B?WHZ4TS9ya2pLeUMxUmhTcXFBZmlRS3hVdkRLRjMzc1JnWnhuWFdmT1F5Z2ND?=
 =?utf-8?B?NC9odzBEUkNrSG80T1JVYm1wMmY3WC9ieE5PZG1jV3V0ckRzeFZ2aE05YW1N?=
 =?utf-8?B?UVlQK1BoU1NZeTBVSlQ5c2pZdnZzd1JpOE4xYitGODFjOUIzZ1FhQmR0Q3Ur?=
 =?utf-8?B?TE9JaEJPUzljMnlxTGNIQ2lrNW9rSXUrS3lyS3FIdkkraEFpSU1SaFFUTXJp?=
 =?utf-8?B?OEN0WUp2QS81enZGRXlka1JRYllYS2dJOHhzTDBsS1RrNXkyZDkyWjJzWXh5?=
 =?utf-8?B?RG0xMXY4eC9jNFJtbXJaQmFGaGRIRFNMeFc4QUxTUVhaUnlHQTdpZUVNanpy?=
 =?utf-8?B?L2hSL21qVC9EQ1JEVFMyZXAzRlJVUHF6YmpiT3l0NHZqU3V4d2c2dTcvakJQ?=
 =?utf-8?B?WC80dW5qL1k0ak5OTEdBbHBXZ3Y5NzhwQXI2dVcxUTVPQnovY2w3NXdMNmpE?=
 =?utf-8?B?OVJKbG9vVktsUWFJMVlHNUpubXAzeWNUbFhIYXd4ZU1QUnB1UVQ2NmJWc0Rz?=
 =?utf-8?B?aGYyTlgxeUg0cDkzS0JDNWVBb1dmUVgxYzZqN21Edm00V0NZbTFML0g4MmtS?=
 =?utf-8?B?WDJZVUQwRWdDRElJdmptY2VLakdtZkJpQ3hoSDM1VVlHQlJsbGZMNWpwSHNx?=
 =?utf-8?B?MG40MGRhQjEwVEVOMnlQLzdKZVczWWd6L2lRcDY4QVFlS2pNUE04b0hOTVNT?=
 =?utf-8?B?TmlvcnRPUXA3dndGejduSVphMkxmYVptQi81eWZmdGFQSGUrWm5GUjUwMkJG?=
 =?utf-8?B?NkFKVHR6VEFFdmMyeGY1b1BSeHJ1and1Z1hMM0diRSt0bWE4alJUbUt2bUJM?=
 =?utf-8?Q?JeiLMS53+zgr+EikUONgvqPWu9RWn4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlJoMW1qd3hqYm9BbDNubGlPWnBMeUMrTndmc0U2dnN2RXBYV2RwLzJsQ1JJ?=
 =?utf-8?B?KzR0S2gyZkRYUjRXdzF1VExadDcvdkIrOXovcGhLczRMMU8wNnhoVklzUkE5?=
 =?utf-8?B?djVUZzBVVWJvazR3NlVlS1BTWUZQQ1FwcisySmxXeVU4NTNpaWJTYk5XSjdy?=
 =?utf-8?B?RkE3Y2VoSU9kOUJicVhSQkoxQkU3OUlRNUNDaWdvTElwL0V6K3dxN3YxeGNx?=
 =?utf-8?B?dmMyVDFKMVArakM3dmd4ZzB0clB4ajJqMG1SVXoxZitRSURSTUk3QUN2UE43?=
 =?utf-8?B?TTZxVlNOMXhIYjFvWDloRFQ5TlJnWURVMUxjcTZMWGZYa3FMalhzcTFtZXUy?=
 =?utf-8?B?SVQ3RkJjMkVaVXBZTHNPSE1FVU9RRUxUS2EzWUE4UDNjTFR6NnlnNnFldnJa?=
 =?utf-8?B?TWNDNDV6ZEk5blgwa202dXBzTzZEdE9tWklqNXY2YVkwR2QyQUNrWWhkLzdF?=
 =?utf-8?B?YjJ2YlhJeHdLc0VPb1p2SXZGUHhJWktDN3hENkNYWDJETk1QcXg0MFhjbE1j?=
 =?utf-8?B?Vmp2cE4wcWFPbDZFb1VMdnZEQ21Dd2dRTk5KaVBRWFE1V3JUTG5VcnB5OGVy?=
 =?utf-8?B?a3gyQWp3NCswYWw3NGVsaThGOUt1U2QwTFBPS2JiYnE5TDFmR1hpV1BBQ1V0?=
 =?utf-8?B?VGlpbDVSbzJaUkZWSzRsWkNNSGg1MDdpRE8vQ2w1MmU5amw2eVdSMWxlZWFM?=
 =?utf-8?B?YmZpekYyUDFFWnFuelRMUmdja2lBZE9VSnBFeTJDTHlUbDVtVGtqbnN0aEMy?=
 =?utf-8?B?aWsrWVAwSmx5WUNPM1dZODZNbnh2VFVHeW82Q3M2Q2FOWjFZOFNmY0ZIbGtU?=
 =?utf-8?B?VXF0eXJ3SUNwalhlUVNDZi9Oa2FyUUlCcC9aMTJMdTgrdU83VjVhNTZYeTJm?=
 =?utf-8?B?ZmZzMnFlOVorQmIwNjh6cnNsakkyTVNNSnpjeVBNZUQ1OTBQRVpDNHp6dWhy?=
 =?utf-8?B?QndUQ09uVmhiV2k5M3pLV1hPMnNMbElXWFZFMFFXczQyUlV0UjE3MExKZXBV?=
 =?utf-8?B?OXlhZ2wxZmk4emRhT0o0eWxkL2NhK1NIYmJLSzkyalRWUENQSExlcHBZUk56?=
 =?utf-8?B?MGRrazkrQzErcmRDbXo4MHZzUTZIdDA0UnpmRFQxZFlYZ2JuNFQyL0xlMzhB?=
 =?utf-8?B?QnVCeDB0R1hPazBRMzBSRmdEbERHMTVMOWpIbkNCNHU0SkF5aWlTOGY2YkxV?=
 =?utf-8?B?dE1iSXJjV3AvMysrNVdSajJJU20yc2JQWTNkNHo0dHluY0NBT0JNTUlRcmcy?=
 =?utf-8?B?eDRhZi9reURrcThvTFR2V2hkUjhzM0wvOGl5U0hIT2E2bmJoVkZGSy8yTEJ0?=
 =?utf-8?B?Mzg2ODFXZzdSNG02V3NUR1p1MVhGWHgwb05Xb3F4OWhxL1Q2K2E3VmZvSVFu?=
 =?utf-8?B?Z1NNdjlCd0xkQ2JJR1FZajJPeS9jVWdmWGY0VFpIdHBPekRIbHNJTGFINkFX?=
 =?utf-8?B?N0J5ay9mWHYyaXladURmTFFmVC9kRUhrbHkvK2h3RDZaVWNheXJkVnpWcFZt?=
 =?utf-8?B?Sk9aZVJneGxnbDJOT0dHeGZDSmJRRkhaWk56S01VWVFxckJrcVFOY2x2MWtU?=
 =?utf-8?B?OGhrUUIyN3dWZVNsTEE1VXZlWm4wWlZoQlFQcENoaWRqcTlSYVVHQk80NFMx?=
 =?utf-8?B?dGx0UUxKTGppUEE3QkNtRXN4bGFLaFpobjhnOE1NOS9GMDRYS2FDWHRxbFdx?=
 =?utf-8?B?bnV2Zk1HUWo4Q2I5ejV4RG9mQ293MUlpOFMyY0ZSSFVUYmJaMnlBa2xmSW83?=
 =?utf-8?B?bFRpNU1oaHNkUEpuTGdxdnI3aEoyZjdRSUNlZFdDR054Q2FZbllSUzhNRGlM?=
 =?utf-8?B?TFFXUFM0NHloeGlqaXJwWGZ3a05rTi9VdXpTYlg0Y2RvQ0w5a3RFUUxSSWo0?=
 =?utf-8?B?OW9tZEltOWtheUJzZFhkcVBpWTdmSXFKMC96blZTQVlicHZxSCtMUkxGQTRO?=
 =?utf-8?B?K0pSZ3RwanFqbFF4elpjeWxucTZKM2s5VnE2cTRKMGhpbHlrK2JGOCtaMFVP?=
 =?utf-8?B?YndNU20ycDlkSmx0RlZsMTdtNTZnVmVYTFg5aGw3aENhY3BFUm5EVFJ2S21V?=
 =?utf-8?B?UWFKcXFyY0F2NnE0MlhkT2U3bUtyZWdyM20vaUlXRUdjVHRzc3lvZmk5cys5?=
 =?utf-8?Q?qaPe3nxAQ/N1jXO5ABc5AUt4R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5434fac0-aeb5-498f-0dff-08de06108f50
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 02:15:33.1037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neCFS25CJrMziXyNfhPoZaqgZwPZ4m694c5+c/54ewL0vFst/y5mCjl5C/3d43QacAeahW9vdRqwuLa/g02sTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819
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



On 10/7/2025 5:45 PM, Eslam Khafagy wrote:
> Initialize the return variable "r" to 0 in dm_cache_state() to fix
> a potential use of uninitialized variable warning.
> 
> The return value for this function might not be a PTR_ERR, in casse if
> condition fails. In that case we ensure predictable reutrn.

Can you walk me through your thought process?  I looked at all possible 
returns for drm_atomic_helper_suspend() and they all return ERR_PTR() or 
a state.

So I don't see how the IS_ERR() clause could have a problem.
> 
> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8e1622bf7a42..6b4f3eb9ce48 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3115,7 +3115,7 @@ static void hpd_rx_irq_work_suspend(struct amdgpu_display_manager *dm)
>   
>   static int dm_cache_state(struct amdgpu_device *adev)
>   {
> -	int r;
> +	int r = 0;
>   
>   	adev->dm.cached_state = drm_atomic_helper_suspend(adev_to_drm(adev));
>   	if (IS_ERR(adev->dm.cached_state)) {

