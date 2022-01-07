Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF4D487F1A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 23:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9D110F4E4;
	Fri,  7 Jan 2022 22:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2078.outbound.protection.outlook.com [40.107.212.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8492710F45F;
 Fri,  7 Jan 2022 22:51:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGVa5xMVakQEFckmIljWwbZCu+tSFGnjKxcBca7PZ39WwmOiSqfDi0dJCFfCnm/0j6gfTvRx5NO7vMhxMgJtlLyIGvTSQoapMDTAljvqxQ8vzNSlsb2FbUB1e12ieuRP223Wc/AcGQj4OJYV19JelF6CGDYWUHtFIE6vMedn1yfgtxLAlkh9oUZhVC/DinPsVfloQ/i+19Xhld0IoCEnC7J2FMwMC3qSgMRCRnRvVOlnj144FXBGT/1sQLeIsukm5fe/g6fe6qgcE5MVUshsAgUBeETFgtOFm45r2VGXcVShONce++MYi0w9ABg58FGH0YPdyhCiQqCdpphEM10ZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQHYTWIG5WT/22z2KOEmzib+Hoczo2vq9Dl+PU2TW6E=;
 b=HgxYjmQdIwCTq3G1xjSloPhv0CUp5vOyHDs7tAqDEHrLrsm9Gjo5Ngm3fQ7FC3NBXl0hb4rozTjELppAKD6qAmhlJopkeHzx23PVO+jHMgKm8Egah3eSQALTGK5ns2jbxQFRVR/8SxOtOY3cueB8SRlXC58XwZfsww7gbh7BO8nPO9NfrIr9VJkTtztVWzSJDZTOcRjbaWGbjshvbD8512i7B4UnwoamGfZtZQkXXRErL0jzqnMgLV8hOS6Jp8HJjQxizPX+JXCAWBPyEBWYsnN/VA6sIvpKziDo/Vg1L8OA9Kw0tX5DUqQldSZ3L67Cbap0jd9DxBd3soRkjPtUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQHYTWIG5WT/22z2KOEmzib+Hoczo2vq9Dl+PU2TW6E=;
 b=VRpBgJ+NKDeV2lGY1mx2Y2d7ckjr2q/vPmVRlm3rISqpcgUcGCVNvUaWenm+uptUKw33yEiMCx6GbAVB8FKFXTYSIQD7DN4TBUrGZmmoXP9fmoI4LOd/HmAin8mHpotnG94XHF8Tio866kvpbLKKbLVzvLqtXfF5nTKixwT+deY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3184.namprd12.prod.outlook.com (2603:10b6:208:100::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 22:51:51 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 22:51:51 +0000
Subject: Re: [PATCH 0/2]
To: Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Zhuo, Qingqing" <qingqing.zhuo@amd.com>, jasdeep.dhillon@amd.com
References: <20220107095732.982194-1-lizhenneng@kylinos.cn>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <95bcf269-3b41-f02d-c953-4c35ddf32307@amd.com>
Date: Fri, 7 Jan 2022 17:51:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220107095732.982194-1-lizhenneng@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR05CA0019.namprd05.prod.outlook.com (2603:10b6:610::32)
 To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d7699bf-0847-4439-55b0-08d9d2304b21
X-MS-TrafficTypeDiagnostic: MN2PR12MB3184:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB318494A9927C6525104C3BA9984D9@MN2PR12MB3184.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TlhSGxXnOVYMpp5bzx4LnbgMcyPreethpAbkkEGe140OHaYdTbu1xIOsoC98uyFJxzW4MxxcpRPG/X1mvI5wUizxvL81RZXIVIOaMKAnCK9NLhTk5de6ZYVeDmQ8HWOKOwPT2Pw1JhXLzL53cnx+d9V1XUwXn0+Jt4OkowILVx2HFgL5UCFffuroiDRVDMSPI0swk5opnohztqhkV+c63fSXLfGzhHfHUEZot7Ubv3adKamScRdj6sxFmLiOfKMur/uILC1xaIKjV5RBW7Oe1hnulRf2ZeDhmOgCe0d8YfH3x+y31uYS/Fd9mPHr68zVpC2TPwbNIbp+i+PcjQDc/wN9/rzCrd7SbkFpWtX5dcj9yiiXKZGO4Z3u8G0f5bgM0zycgzPWG3CbbucpJdspD7R+1bmpW6+HvV6YBlTJNTT3MOvMKo9GiVKOxXxSN6MDEhws6zIxmHxlSg2qOvrGG28G5MXXhJtZyFxrK5dKK61qg8ZWGjKq4G+6omWOCMhwCSGBoDN0JsAhBKftv0HuUdDUrWAHCSLdJHAZnRp4Z44bqul2X4vrFLAdW70rR0z0VfBnTGyKgUaEbZMUGwIhKZJ6CV+nxQCJhd1CJg4vMc0Um4gJNFM0TfuuVpagWkfSRlntW7i7HpuRso9szqHMY21wjqIowXcFtFMdoAtBCLmTEjv1j6wrD7Lh9y8fvvU0WWcpwQYSfkDXpYz13/nuFnWUtRmbgwKkUm9CI4gcqVrAbNsER+mAbg9RcMxdnzRZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(5660300002)(966005)(6506007)(508600001)(53546011)(36756003)(2616005)(31686004)(6512007)(8676002)(4326008)(54906003)(8936002)(6486002)(316002)(31696002)(38100700002)(6666004)(2906002)(6636002)(83380400001)(110136005)(66946007)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmVnZnp1eFYwZ3NrVWcwOUI2U20zVTdYTmhUOVJFR0VsMElLdXh5VEZyejI2?=
 =?utf-8?B?b1JiZE9UWVFLR05vc0JLM2p6K3JYSkwyRmx1ak9hTXlzVkRtOGdHd1B3b3cy?=
 =?utf-8?B?MisyZXk4eVhEQXEzRVdLT2hIdU0yTVJrSnEwVkp5ZjY2VStlVUFjR0xsM0M1?=
 =?utf-8?B?cEgxWVl0SjFUZXhQWm1DUXc5RkRLb2RMZy9kNjRQZHpzTjFNTEEwSGN3K0JW?=
 =?utf-8?B?M1lYRGJ6NDgrMUdVck9wOEd4eXk2c1VpQlNhVVNzRGQ2NDBpYjJwamh2NzhD?=
 =?utf-8?B?NzNabm5BN0pTaGZ4MGxJeGRIdmFZZkV4WjZseksxK09WQkNiS1BQdithOVNP?=
 =?utf-8?B?MVZoRDR6VnVPL0dCU0t2RnpLZFFzeXJZWmhBUlhlUEluSTlaNnJoUGRGQk81?=
 =?utf-8?B?OTJEajdtU1M3VUhCWDZaMkM1TkxSNlBTT0s0VHdOM1lrOUd1d3pSQ25HVGY1?=
 =?utf-8?B?dzUzZ3FsYjc3NGcvU1Y4NUovUXlBYlJTeHZtQmc3dGFpb2kvQXFzSkdFcVdE?=
 =?utf-8?B?N3Btb0V3ZkhFazloVzdCd2hmdkl1OVFFYkRDVHAxMFZtVjQ4Qi9zREhCdjBw?=
 =?utf-8?B?WmpKYmV6cDJJY2xISVB2UWhjWW12QytNYU8xeTdySThzZFpBWFREd2t6dno1?=
 =?utf-8?B?blQzR3FHUUpaZ3JpcTRKWUh0YmpvRXJWczFtWkovbVFVT2ZJd1I1Zmd1c09h?=
 =?utf-8?B?bHNybUZHVWhrVVNVSlMyOTVOR0pQem1DU0tzNWM0SVlySEZ4TjRsZTFZd1Mx?=
 =?utf-8?B?eWFWcmZNV2MwY2tCYis0blJaMS83WnFUbW5WUlZjbnYwUEVOOVBZY2FuY3Q5?=
 =?utf-8?B?VXhyVm5aRlBLN0F6S1RkcXFmL2o1d2RVMkptZHp0UGNtN1B3czdjdkhnTVBv?=
 =?utf-8?B?czdGRkJiOGNZbVlkREhJS3BuZ1BGZUxvR01yYlRqODU5YWJnZURzcUc1Qyti?=
 =?utf-8?B?UmFOeU5wenUzYi85VkpXaVRiMXRWMm9nWWVDd3poTUVHVGJuYjdhM3l3bWZu?=
 =?utf-8?B?SHkrNkV0NURwYnhUYzhRMVNnMVR4WVhCRVhCUStDQUtSQnZLOTA0RWIvK2dH?=
 =?utf-8?B?MElTQVdDMEVUKzFoYWI0cGZ4WEhEaVFoLzVpSm1IcWloQkREUTNiVExQdkNw?=
 =?utf-8?B?N1dLckxHb2FPWkViSFczZmNiSCtDTUxBUDhtUnNFUDFJYWVSTWc2blpNd0pt?=
 =?utf-8?B?TWtFbzVacU5iY2NobnNISkhsZUQ3VEFlQWtQVTJOdGJmZ2NjMUZiRDdUUVQ3?=
 =?utf-8?B?YmN3YzZGVDl5cW51RWloZWhTNWlWalFuTzg3dXhPaEkwRTcxY2wvbUw2czZM?=
 =?utf-8?B?bnNvbjEya2puTGMzU1VodFZpY3NpVTMzN1p1akp1cm9SaUtuYSs1Tjdqbmd3?=
 =?utf-8?B?SVJBYnY5bkVKSWtmaWNjTGZJTGxjRG1WUXhiNjJua3h5aUZ0dFoxVGZ2S3FS?=
 =?utf-8?B?NE5RWGwvUTJKb2VHaFg5T1JnUkJCTjBTYjNORW9UeFFLMm9rRDk1cUxZMFhl?=
 =?utf-8?B?Yk9rSHdpUnhZL242cWpSbTVCSUN5RHhsMmd3b2Evcm54U3FXanFSd1JwUXFm?=
 =?utf-8?B?cWtpOEVqWHNhaFZicHJlaDlYa05lZXUzcnY2aTlPZWJPZHZlelROZnlybVRp?=
 =?utf-8?B?bFpaSE13TFNDN3o4ZVFwSnN4TVBMYXJ4MG5GNjY3NGhlanVwdE8xeVJ5VVVq?=
 =?utf-8?B?ZTNFRlRwMkRvb0ltOWNzUFNyeHQzTnp0Mm91VEl1OWVVWFI3Vm51YUJOUG15?=
 =?utf-8?B?UjFIVTIrSk42QkZUNDdtcEUyTE93ME44RGE2ZmlFSStNMURFY3RiTm5qNkNE?=
 =?utf-8?B?N0haVElhdThPSm1UNWRIOHZQM1FRUFI4aGEybDJkTlJhcVQ3MTBmY0JHYUF0?=
 =?utf-8?B?OEpFMHJvOUJ6Kzc4a2dqLzZCV2tGRFVLSUFqQ2FSbXR2UEwxZDFkWk5vYmhG?=
 =?utf-8?B?Y3JmRTM5UEV6RnNIU1ZrWEFieTJRQ3JzUzhucWd2YXVBM3RlQ2hlOWw4NGVt?=
 =?utf-8?B?NEVwZTFwdmMyZWhWRzNBcGZaZFJqcGdGTTcvOGdCUWlXNk5jeklDN0Q4OHZM?=
 =?utf-8?B?bHFONFcrNVFlQ3l0WFgzemNBRDFKUHBVV1YzRFZLY0xURUJodUNUR1k0ZURT?=
 =?utf-8?B?RlpkRDNpY21LcXYwckFWYWhsRDRIRGdwdHhJTUlCcjJ6MnZqS21Ob1dVOWNC?=
 =?utf-8?B?aUFrR0R4UHhJWTdYcGRKYm5TQklicnB3ZzRRQ0NxdGpWQXY5N0tGbXNqd28v?=
 =?utf-8?Q?1u22th5fIykWmNI8hKjpn9yIUtXUYgziydW6oQNnoA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7699bf-0847-4439-55b0-08d9d2304b21
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 22:51:51.1844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 916qZseo5zb5eS/rnfdZnlTqEknJ37E1pjcPUZ2K31VVjrWcVm2+x4LaqjtsS2m3Xl+nISgAzlh4k1Su5n6UCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3184
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhenneng,

+ some display folks

First of all, thanks a lot for your patch.

We had a similar patch in the past, but we had to revert it because we 
cannot simply enable DCN for ARM-based systems. You can refer to this 
commit message to get a better context:

https://gitlab.freedesktop.org/agd5f/linux/-/commit/c241ed2f0ea549c18cff62a3708b43846b84dae3

Before enabling ARM, we first need to isolate all FPU code in the DML 
folder fully. You can read more about our strategy at the below link:

https://patchwork.freedesktop.org/series/93042/

And you can see some examples of this effort in the below links:

- https://patchwork.freedesktop.org/series/95504/
- https://patchwork.freedesktop.org/patch/455465/?series=94441&rev=3
- https://patchwork.freedesktop.org/series/98247/

Soon we will submit another series that isolate DCN302, but we still 
need to isolate code from DCN20, DCN10, DCN303, and DCN301.

If you want to help us speed up this process, feel free to look at 
DCN301 or DCN10.

Best Regards
Siqueira

On 2022-01-07 4:57 a.m., Zhenneng Li wrote:
> For adapting radeon rx6600 xt on arm64 platform,
> there report some compile errors.
> 
> Zhenneng Li (2):
>    drm/amdgpu: fix compile error for dcn on arm64
>    drm/amdgpu: enable dcn support on arm64
> 
>   drivers/gpu/drm/amd/display/Kconfig           |  2 +-
>   drivers/gpu/drm/amd/display/dc/calcs/Makefile |  6 +++++
>   .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  7 ++++++
>   drivers/gpu/drm/amd/display/dc/dcn10/Makefile |  4 +++
>   drivers/gpu/drm/amd/display/dc/dcn20/Makefile |  4 +++
>   .../gpu/drm/amd/display/dc/dcn201/Makefile    |  6 +++++
>   drivers/gpu/drm/amd/display/dc/dcn21/Makefile |  4 +++
>   drivers/gpu/drm/amd/display/dc/dcn30/Makefile |  6 +++++
>   .../gpu/drm/amd/display/dc/dcn302/Makefile    |  6 +++++
>   .../gpu/drm/amd/display/dc/dcn303/Makefile    |  6 +++++
>   drivers/gpu/drm/amd/display/dc/dcn31/Makefile |  6 +++++
>   drivers/gpu/drm/amd/display/dc/dml/Makefile   | 25 +++++++++++++++++++
>   drivers/gpu/drm/amd/display/dc/dsc/Makefile   |  7 ++++++
>   13 files changed, 88 insertions(+), 1 deletion(-)
> 

