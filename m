Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA10A0C3E8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 22:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277EF10E7F2;
	Mon, 13 Jan 2025 21:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SPSE7F1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF2610E7F2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 21:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtya1IsC2YVEASQbM6N4iY6+4EcWAws9MklsItsOPEKgFzVeX1UepKo1fxBNVEVfYNO1gzrfTKAHF/+D4NC2Icue2/p4eN3dLW+qrZPnvIPqG8Ycz5C8k/ahNchtR73hKhsZLJ/8tMkXEwqZzEdfRyHuI1Lsh5eXApIXFeH0JlzqjjNqVFTlRxYdE9IkjuQfLvwIrWv5WqrsM49OQqJwcPIDyvEjUMi9O0+KZ0MfLOZA0LkkcekQy91bXQEsbjAxaPP5yMZYlQqKcm3huXpK9U0OJFcg5y22V1Xd4Zmq7Wr5fGoNGQQHso+93u69kUI93fhSFo5l0ybZkDMG/6Tdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLjbKLhRYgEaNkNBVrfBWDdTL43ZzQQKOzb33QLp8VA=;
 b=NFLWHT5aXQJWelozMBO8ymTEaoLLw9zMVwua5H1xCS3JFOYAccTJusSrCv0nE7GINVeuk/hGYpYBXazvBfY49cw0c3J9dP+kuHhuZleIqb1TBBn7zLNCcpuFdRGGLfzuCI8Lo4/EUP7CRr7xJ99ZbCebI7vF+ER9PPPf077XrdZj80NRBiCjzFhSQ23VA/V0eXuiJ15zfbu/X7L9ii7FZb7rogzHJOCl1k0oPp2+ULmKSgfYR4Hn8NSYuxTdq/d0/2E2x8Ff4z/zdsQ+DXYY/iSb4XNARRfvi1IONdQTUoa0FS7O1jDeWfX4aEoaUEfnzLh6fywsOh6nexsi2P7bEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLjbKLhRYgEaNkNBVrfBWDdTL43ZzQQKOzb33QLp8VA=;
 b=SPSE7F1IIv5JfH1TSnnNF7qQ6d4T8Rv36nIZNCS4dbVrOiebkU+vy55cxX3rAOrO3ecBONrwSoa1z7BHvHXNZyReL8MsNYxAjBT2WD5szozDJ4stkAM+7uElXjD5GOCE2fCojFpHJAix/LAQZUKrs8+o03lVuSYayi90u8bs3QA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 21:40:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 21:40:15 +0000
Message-ID: <bb9bbb03-30c8-48e4-bde7-e75c933c9685@amd.com>
Date: Mon, 13 Jan 2025 15:40:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/amdxdna: Remove casting mailbox payload pointer
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com, kernel test robot <lkp@intel.com>
References: <20250113182617.1256094-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250113182617.1256094-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0128.namprd11.prod.outlook.com
 (2603:10b6:806:131::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b47b4b2-5a6b-4e34-7bf0-08dd341ade10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXNSSHJQOWVmR3BEelRxbU1YOUhYK25RMlQxZmJ6d2cxdFVyT2FTK2ZwZVpQ?=
 =?utf-8?B?MXdkMnBBek5kK2U5Rkg2VWE1dWQvNkZNazFvelBiVmpzUjFvQzlUQ3lQRTdk?=
 =?utf-8?B?d0VaUHd0RHhFT1B0bHU2NGxCQkhSNUJUZHJlWVVtMG9UVExDU1RsRFhyMFRz?=
 =?utf-8?B?NzA5RkZNWXBFd3hEK3lpMGtPaldwNUZjWjU4RTNsMk1zeWNlZStMeXFYeWRV?=
 =?utf-8?B?c3AyY0Q4U3lCd1p6ZzAySlUxNkNmc3lXYlgzcFdyeHhZWnlXN0NxV2Nncldk?=
 =?utf-8?B?ZnREcFdPKy9MdFBTSmppYWNnVXFteHliSkZCVGJiNXc4bVo0RnFiYkFmWUdM?=
 =?utf-8?B?OEM0QVJuTHVJZUxKYW1FVjJvbVRVZ3MvOUZSc0ZMbFdCVW1BcWhXRVdndUIx?=
 =?utf-8?B?WUpCOS9naDgrcldRVjgwUmZtZ2d0NUNVSVQrNWViOTJvdlRUZXR1VTB2UkV1?=
 =?utf-8?B?MjlES3pmWGJiMzdjMUN3N2lSTm9LQjhoL3BzTm5Ja3BaVFZhNEozVE9Wcyta?=
 =?utf-8?B?T2xGb2NKOTFrWklUSmhxVTdxdzJLcWxZWmhtT2lqUmp5cjNSV2luTXRRbC94?=
 =?utf-8?B?S0VmeHB4TnZwN2FYVUN2ZU5aK2l5VGpJWStKV0dOOXR2OUpHRk9vTEh2ZFQ2?=
 =?utf-8?B?TktJY0RDbUI3UjF4TUlpbjJ1dDExR3l6YU1pYUdqaHk3NHVIQjdZRGlPckxQ?=
 =?utf-8?B?bmNEOTN3a242MDFXVlpYWjM5dHliWVJwemVJKzMzTHVoVi9laHdrZUw1bmYv?=
 =?utf-8?B?WS8vSG9kakE3QlFYYUV0RVdLYzFGT3BNQlh1RXRuOTRmVmZVTWlGM1lWTmpT?=
 =?utf-8?B?b0YzZTV6OTl1M3ZXTE56dHh6RzlnTytHbGQyOHpoQkkvNlRIV2dDbDhETzFP?=
 =?utf-8?B?TmlZb1Z1OWc0Nk8za0lmeHlwRUFieUhjWDhmOGErQTlsM1hHZXhEYlNGclV3?=
 =?utf-8?B?K1FDTlNBZHJHNDM4QVJORTFiREFFcFdoSCtIcDMxSEFVWGtTK3M2Znp6RXVk?=
 =?utf-8?B?cXBOa0JpY3VBbEF1cVZtd1djNTc5OUYzMDFqL2kwUGtWajVGOElZTk5jRE9G?=
 =?utf-8?B?ZjZJTVROeG9IaVcyZWk3WFVXbjFYMGQ3RzZQUTRsaDhoQkY5VWx4ckdUelFm?=
 =?utf-8?B?c2ZTNXc2YkNsVTU2REJvaStTUkRmaXNoMURsYW1MVUhpZ3VCczdzaHQvclNj?=
 =?utf-8?B?MFgwNUE1YjViaHJCSy9MYlhLemp4UTRpamd3ZWhxZC9QSWpaOTZ1c0NLSGRC?=
 =?utf-8?B?ZGljcjljU01zQ0xWUjBWemE5TldFaG5oYkJKL094OW4rRmMrREw0Ni9HK2FS?=
 =?utf-8?B?NDVrR0QyZmdXaTN3bE9DSXBqR1NoNFh3aFFXWFBUNU83dzBmRDZEV2JMTXRP?=
 =?utf-8?B?L0RJN0gvekpvVEluM2EwY3NVWEhjL2w2dlNOd2NRTzFkbkZoYWFvVlYwQmov?=
 =?utf-8?B?MzNQbVYwZ2xEMGFiYXBnT1dzR3JNZHZnZEhwYWhiZFl1bVlJVzBoNWNlRXgv?=
 =?utf-8?B?R1VTanJnTFdzYWgvTVhIUHhuR0JzcmlrMTdRWS9zdUNoeDFSdnc4b0lITlNW?=
 =?utf-8?B?TVF5S1pBcllBeXJJaWFNOFRaRC91QXhYZUxZN0NtMGZJRDlFYkR4WGNPTUhX?=
 =?utf-8?B?aFkvN3pTNDk1UENRMDJueHVPWHFrR1BQbm8wNTZib0lCUUt4VEp2Umx0bWJG?=
 =?utf-8?B?OWVKZFlLa2ZsT3R1NG40K1VPS0htaHZNRzlTak9YNTkwdTVWTTVjTnNEYVZX?=
 =?utf-8?B?U2F5akdrOEhJeVp4RVlCYStCUERhTS9USzM3OHY1VDdaOFA4bFBRT3JnL0lV?=
 =?utf-8?B?OGdJRjNKTGtBU3hOZzRUM2MyTy9MWTR3b1FScWZ5THJybTdyRFd0WGRrdFVC?=
 =?utf-8?Q?L7OUq06Xc/dYC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDdlQTdHeCtXZkNzWjBKKytOWUR6Zi9wWFpQT3lKaW1SV2lFY0RVSEJ3ZUtx?=
 =?utf-8?B?YUZXWXdVZWQyZ0ZhTEJLbzhHcHA0WXJFYTBlYmxuTjRpZGdIdEpZQXFXVHFY?=
 =?utf-8?B?VnpEWUdxT0xmd0tWYllQQll6NU10ZHdwVWVPeC83cEh3MTFJWWFOQTR0SVBh?=
 =?utf-8?B?aEQvTmxXOXVxbmEvTWF2dGVjTFNpQ2pycEZhSzFqQU9Kck4yMDloUUVwTEZk?=
 =?utf-8?B?YkRub0FLd0Ewd0RDYUVSY2x5TzlWZXZNWGt4ZHMxV2c4cVBmUXloK2R4SXZw?=
 =?utf-8?B?bkdZZ3N2bzIyMytsTysvRWxMZWlxMEEveDJFdEdHMVdpbmxPRnRVYWRWaGMr?=
 =?utf-8?B?WWFLK1U2MVRDOGZYNGt2RU9IZEkrMUgzeGt2NkZhbWRTRlJTS0htSlArWVc5?=
 =?utf-8?B?T2k0b1dGOFVXMlJmWUxGSDdiNDgwcHhUWjl0NnllME5SUkxEVWtWU09IR3Vh?=
 =?utf-8?B?NGh4Z0hmeHdCQ25SZnBxNSt5L2RGOHpYZURub2NMd3pBZVJzVVJydWNSZTZE?=
 =?utf-8?B?azR5ajdzb1FtL24yTllIeWpPSVZITnVFWGUzdUZFMUJHT1FRWFYzVU9peW16?=
 =?utf-8?B?Q2I5aXpiUnVsaXBKeE9wa0UxbUo4SkNEMlNaVFRQdUtZVVJBK0ZvOGpCbUh6?=
 =?utf-8?B?b2dhV0tYbWR6V1pKQmdOVVJwc3ZzWkJLL2ljQWxNZ1FVZkhPd2xReDU0TVFy?=
 =?utf-8?B?VVJTeXRnRmFPeXlNMEp2K2U1REtvOXdNUTdkNXJid3haK0VUcVhoUmlOeFh5?=
 =?utf-8?B?c3UrZGsxK0NJMVlGckJtRzNjMGRiS2NZNFlvdXJESVJrbXFBSXdLNzk1dGx6?=
 =?utf-8?B?VlFvZy9MdnU2dXB2Z1VreXRQNVdpdUgvTFJUWkRacHdRUE1WNTZDTTA4WVpU?=
 =?utf-8?B?VUpnRE9uZUJPc2VOZWtObEV2ZldOWkhxc3RQRmM2dVo2eWlqdThRdU9GWEZS?=
 =?utf-8?B?cXlPQkFjcFhlRVpFaEMrenlEUU53ZTdFZTZsUFN2K05qenBmUXhPNDR2SHFm?=
 =?utf-8?B?RDZXeVloYWlVcy9scnlreHRMT1R0ZDF6cTNrQzdYeFExYnZEUGxxTjhNSHpB?=
 =?utf-8?B?cGhNK1dvTUxQcHVHZ1FUMnJlWVpXbTk2SXR6bkJrS0FEazVkV280ZnJyaCtO?=
 =?utf-8?B?YnhHdUpIZE9MZ3BRTFl3M3p1KzgxNm5oUVdMaWZ5SmtpY2k2ZXc1OGNjeWVV?=
 =?utf-8?B?YllRN0VVV3dkck9iMWJNUjdOYnJGNUVGNzNqVVhYYjh0bDFlREJqMU0xdER5?=
 =?utf-8?B?dWpwd1lreVhpNnFnZ1lZckdtRjluSW42MG1tTFVhYUh4dVBRSlpuNCtqNU9n?=
 =?utf-8?B?dzl6c1RLYTl3OUZUSkQyZUNsYmJBZnRhRWsweE9JbkVueFlmNFZEQkt1S240?=
 =?utf-8?B?VTdVS3l0STJxN1Z3WXBwcTRQM3E4SUhuVGNrRUxxdDN2b2RQUVVoQ25jQXRl?=
 =?utf-8?B?ZGpYYTd1OGZKaS9DaERKb3h6TXNCd2F1bW9oZUQ0emsyc2QwZktLWTFBckJj?=
 =?utf-8?B?Y0lpRWVoem9wSWJiKzcrcmZIQzNtYW04b2dud0RzbjllTktRa3JZZEFGZ3Bz?=
 =?utf-8?B?TkFQNnBRMUpIaElxcTU2UmlRcWtyNUwzb1BxTWJWOEY5djNnZDVuVENMOFRi?=
 =?utf-8?B?NXNpWW96KytoOG9tbDlwR2VTazh2TUpBOHJFNjhlMTB3emxoUFpwQXlTZE5S?=
 =?utf-8?B?U2pweFdrOGlsMW14d2g2ekMyZEVOUG5XUW01RnprRXl4a1VCckxkZm16TG44?=
 =?utf-8?B?aytWU1ZiNnRmME02RFh3K29lSmtoZXljR2dQamtyTXhlZGcxS1B5RUtaUXht?=
 =?utf-8?B?Nkl0NWJPSGRpTnYxbzlzVWlNY0NmTlBDZmlqSlZwRng4eEdKT0FVYkxlTW0r?=
 =?utf-8?B?bzZPM2t3SEJCM0V2M21VQmhqdmNmRmJVcElzak9pNXJ3WG9BM2taK0VuOG5W?=
 =?utf-8?B?bHJqTjRoUEVQdUpsMzJVK0QrQ0NMTnRFem12MjNCSXpkcDVyUzhJYmFHY2dy?=
 =?utf-8?B?cWRsUHlZNmlKMGs1eE03ZUNvczNMY2U2Vnd5RDNGTm9wTnRTcEJlUDdJUzlz?=
 =?utf-8?B?dVFsM2lEcmtVbk1CR1BZSzFYcWMyUWFFTWROMG8rby9KQmEwYjNveXJlWmlw?=
 =?utf-8?Q?WKjqSCc3ysaBHUGSytGnaGKSs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b47b4b2-5a6b-4e34-7bf0-08dd341ade10
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 21:40:15.7980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmNu5LmbJFNtN4WikiMhjnwxdL5zJXdfod58Ml1B0D/x8EoxkJSivBpBYi+vpYoIqh0Z7APlTYArUwQ2yTISHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646
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

On 1/13/2025 12:26, Lizhi Hou wrote:
> The mailbox payload pointer is void __iomem *. Casting it to u32 * is
> incorrect and causes sparse warning.
>    cast removes address space '__iomem' of expression
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501130921.ktqwsMLH-lkp@intel.com/
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Thanks for the fixes.  They look good.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I've added them to drm-misc-next.

b3dff598e72f5 accel/amdxdna: Declare sched_ops as static
412576293cca1 accel/amdxdna: Remove casting mailbox payload pointer

> ---
>   drivers/accel/amdxdna/aie2_ctx.c              | 22 +++++++++----------
>   drivers/accel/amdxdna/aie2_error.c            |  8 +++----
>   drivers/accel/amdxdna/aie2_message.c          | 10 ++++-----
>   drivers/accel/amdxdna/aie2_pci.h              | 10 ++++-----
>   drivers/accel/amdxdna/amdxdna_mailbox.c       |  6 ++---
>   drivers/accel/amdxdna/amdxdna_mailbox.h       |  2 +-
>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |  6 ++---
>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |  2 +-
>   8 files changed, 32 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 5f43db02b240..5c69ae3c40f8 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -185,7 +185,7 @@ aie2_sched_notify(struct amdxdna_sched_job *job)
>   }
>   
>   static int
> -aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
> +aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   {
>   	struct amdxdna_sched_job *job = handle;
>   	struct amdxdna_gem_obj *cmd_abo;
> @@ -203,7 +203,7 @@ aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
>   		goto out;
>   	}
>   
> -	status = *data;
> +	status = readl(data);
>   	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
>   	if (status == AIE2_STATUS_SUCCESS)
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
> @@ -216,7 +216,7 @@ aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
>   }
>   
>   static int
> -aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
> +aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
>   {
>   	struct amdxdna_sched_job *job = handle;
>   	u32 ret = 0;
> @@ -230,7 +230,7 @@ aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
>   		goto out;
>   	}
>   
> -	status = *data;
> +	status = readl(data);
>   	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
>   
>   out:
> @@ -239,14 +239,14 @@ aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
>   }
>   
>   static int
> -aie2_sched_cmdlist_resp_handler(void *handle, const u32 *data, size_t size)
> +aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   {
>   	struct amdxdna_sched_job *job = handle;
>   	struct amdxdna_gem_obj *cmd_abo;
> -	struct cmd_chain_resp *resp;
>   	struct amdxdna_dev *xdna;
>   	u32 fail_cmd_status;
>   	u32 fail_cmd_idx;
> +	u32 cmd_status;
>   	u32 ret = 0;
>   
>   	cmd_abo = job->cmd_bo;
> @@ -256,17 +256,17 @@ aie2_sched_cmdlist_resp_handler(void *handle, const u32 *data, size_t size)
>   		goto out;
>   	}
>   
> -	resp = (struct cmd_chain_resp *)data;
> +	cmd_status = readl(data + offsetof(struct cmd_chain_resp, status));
>   	xdna = job->hwctx->client->xdna;
> -	XDNA_DBG(xdna, "Status 0x%x", resp->status);
> -	if (resp->status == AIE2_STATUS_SUCCESS) {
> +	XDNA_DBG(xdna, "Status 0x%x", cmd_status);
> +	if (cmd_status == AIE2_STATUS_SUCCESS) {
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
>   		goto out;
>   	}
>   
>   	/* Slow path to handle error, read from ringbuf on BAR */
> -	fail_cmd_idx = resp->fail_cmd_idx;
> -	fail_cmd_status = resp->fail_cmd_status;
> +	fail_cmd_idx = readl(data + offsetof(struct cmd_chain_resp, fail_cmd_idx));
> +	fail_cmd_status = readl(data + offsetof(struct cmd_chain_resp, fail_cmd_status));
>   	XDNA_DBG(xdna, "Failed cmd idx %d, status 0x%x",
>   		 fail_cmd_idx, fail_cmd_status);
>   
> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
> index b1defaa8513b..5ee905632a39 100644
> --- a/drivers/accel/amdxdna/aie2_error.c
> +++ b/drivers/accel/amdxdna/aie2_error.c
> @@ -209,16 +209,14 @@ static u32 aie2_error_backtrack(struct amdxdna_dev_hdl *ndev, void *err_info, u3
>   	return err_col;
>   }
>   
> -static int aie2_error_async_cb(void *handle, const u32 *data, size_t size)
> +static int aie2_error_async_cb(void *handle, void __iomem *data, size_t size)
>   {
> -	struct async_event_msg_resp *resp;
>   	struct async_event *e = handle;
>   
>   	if (data) {
> -		resp = (struct async_event_msg_resp *)data;
> -		e->resp.type = resp->type;
> +		e->resp.type = readl(data + offsetof(struct async_event_msg_resp, type));
>   		wmb(); /* Update status in the end, so that no lock for here */
> -		e->resp.status = resp->status;
> +		e->resp.status = readl(data + offsetof(struct async_event_msg_resp, status));
>   	}
>   	queue_work(e->wq, &e->work);
>   	return 0;
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 9e2c9a44f76a..bf4219e32cc1 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -356,7 +356,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   }
>   
>   int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
> -				 void *handle, int (*cb)(void*, const u32 *, size_t))
> +				 void *handle, int (*cb)(void*, void __iomem *, size_t))
>   {
>   	struct async_event_msg_req req = { 0 };
>   	struct xdna_mailbox_msg msg = {
> @@ -435,7 +435,7 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
>   }
>   
>   int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> -		 int (*notify_cb)(void *, const u32 *, size_t))
> +		 int (*notify_cb)(void *, void __iomem *, size_t))
>   {
>   	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>   	struct amdxdna_dev *xdna = hwctx->client->xdna;
> @@ -640,7 +640,7 @@ aie2_cmd_op_to_msg_op(u32 op)
>   
>   int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
>   			       struct amdxdna_sched_job *job,
> -			       int (*notify_cb)(void *, const u32 *, size_t))
> +			       int (*notify_cb)(void *, void __iomem *, size_t))
>   {
>   	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
>   	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
> @@ -705,7 +705,7 @@ int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
>   
>   int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
>   				struct amdxdna_sched_job *job,
> -				int (*notify_cb)(void *, const u32 *, size_t))
> +				int (*notify_cb)(void *, void __iomem *, size_t))
>   {
>   	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
>   	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
> @@ -740,7 +740,7 @@ int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
>   }
>   
>   int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> -		 int (*notify_cb)(void *, const u32 *, size_t))
> +		 int (*notify_cb)(void *, void __iomem *, size_t))
>   {
>   	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>   	struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index f2d95531ddc2..385914840eaa 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -271,18 +271,18 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
>   int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
>   int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf, u32 size, u32 *cols_filled);
>   int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
> -				 void *handle, int (*cb)(void*, const u32 *, size_t));
> +				 void *handle, int (*cb)(void*, void __iomem *, size_t));
>   int aie2_config_cu(struct amdxdna_hwctx *hwctx);
>   int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> -		 int (*notify_cb)(void *, const u32 *, size_t));
> +		 int (*notify_cb)(void *, void __iomem *, size_t));
>   int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
>   				struct amdxdna_sched_job *job,
> -				int (*notify_cb)(void *, const u32 *, size_t));
> +				int (*notify_cb)(void *, void __iomem *, size_t));
>   int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
>   			       struct amdxdna_sched_job *job,
> -			       int (*notify_cb)(void *, const u32 *, size_t));
> +			       int (*notify_cb)(void *, void __iomem *, size_t));
>   int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> -		 int (*notify_cb)(void *, const u32 *, size_t));
> +		 int (*notify_cb)(void *, void __iomem *, size_t));
>   
>   /* aie2_hwctx.c */
>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 814b16bb1953..de7bf0fb4594 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -90,7 +90,7 @@ struct mailbox_pkg {
>   
>   struct mailbox_msg {
>   	void			*handle;
> -	int			(*notify_cb)(void *handle, const u32 *data, size_t size);
> +	int			(*notify_cb)(void *handle, void __iomem *data, size_t size);
>   	size_t			pkg_size; /* package size in bytes */
>   	struct mailbox_pkg	pkg;
>   };
> @@ -243,7 +243,7 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
>   
>   static int
>   mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *header,
> -		 void *data)
> +		 void __iomem *data)
>   {
>   	struct mailbox_msg *mb_msg;
>   	int msg_id;
> @@ -331,7 +331,7 @@ static int mailbox_get_msg(struct mailbox_channel *mb_chann)
>   	memcpy_fromio((u32 *)&header + 1, read_addr, rest);
>   	read_addr += rest;
>   
> -	ret = mailbox_get_resp(mb_chann, &header, (u32 *)read_addr);
> +	ret = mailbox_get_resp(mb_chann, &header, read_addr);
>   
>   	mailbox_set_headptr(mb_chann, head + msg_size);
>   	/* After update head, it can equal to ringbuf_size. This is expected. */
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.h b/drivers/accel/amdxdna/amdxdna_mailbox.h
> index 57954c303bdd..ea367f2fb738 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.h
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.h
> @@ -25,7 +25,7 @@ struct mailbox_channel;
>   struct xdna_mailbox_msg {
>   	u32		opcode;
>   	void		*handle;
> -	int		(*notify_cb)(void *handle, const u32 *data, size_t size);
> +	int		(*notify_cb)(void *handle, void __iomem *data, size_t size);
>   	u8		*send_data;
>   	size_t		send_size;
>   };
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
> index 5139a9c96a91..6d0c24513476 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
> @@ -16,7 +16,7 @@
>   #include "amdxdna_mailbox_helper.h"
>   #include "amdxdna_pci_drv.h"
>   
> -int xdna_msg_cb(void *handle, const u32 *data, size_t size)
> +int xdna_msg_cb(void *handle, void __iomem *data, size_t size)
>   {
>   	struct xdna_notify *cb_arg = handle;
>   	int ret;
> @@ -29,9 +29,9 @@ int xdna_msg_cb(void *handle, const u32 *data, size_t size)
>   		goto out;
>   	}
>   
> +	memcpy_fromio(cb_arg->data, data, cb_arg->size);
>   	print_hex_dump_debug("resp data: ", DUMP_PREFIX_OFFSET,
> -			     16, 4, data, cb_arg->size, true);
> -	memcpy(cb_arg->data, data, cb_arg->size);
> +			     16, 4, cb_arg->data, cb_arg->size, true);
>   out:
>   	ret = cb_arg->error;
>   	complete(&cb_arg->comp);
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> index 23e1317b79fe..710ff8873d61 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> @@ -35,7 +35,7 @@ struct xdna_notify {
>   		.notify_cb = xdna_msg_cb,				\
>   	}
>   
> -int xdna_msg_cb(void *handle, const u32 *data, size_t size);
> +int xdna_msg_cb(void *handle, void __iomem *data, size_t size);
>   int xdna_send_msg_wait(struct amdxdna_dev *xdna, struct mailbox_channel *chann,
>   		       struct xdna_mailbox_msg *msg);
>   

