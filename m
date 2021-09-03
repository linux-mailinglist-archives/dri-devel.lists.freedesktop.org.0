Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A253FFA62
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 08:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A641F6E83E;
	Fri,  3 Sep 2021 06:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8606E834;
 Fri,  3 Sep 2021 06:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRudhYXU5AbMpUxYQajBA3mNeJVo9H4kdA8DDcAGPurmMpFpn2uw8l5PNvtz2gvNATfROeUUz1IlpLbf9PhEb3kZEXStaDsmRb47Su8tN78nJFkFJqLsf16osi7iY7XoB1+jCuzWSb81WW/hbrDIFEAtMMHUOrhqj1FgIRDEY7xUTSfHdWkE5Mt5siN512fdWGS3LbCBYDEHKxVD5LygnRGlrKKlVGX5mMglaUpQUDeSKsajT9+UN7IiL/bb6s8/zmtVAwzfgtu5M+esWvSqvVcVtot8m+fpnV/IdM6I4diNUgNoPBNtjQyWFIqGVl4qPmcCqN2w0ZOV6nY5AVb7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=X7zaSDchiO5XsyQyeMHfS5e45kXheg2Vas4XmqgYZbs=;
 b=YxDDdIfcYRn6NnsQoI//HR8UjnbQYu/+u+lDl3jBQq0Bwr3KOzjIdgoYKiwn24kZ7BsKAoy67rwdpOJo9LtW8LALCmtZTo/nFLrH/5/D2fTYcbau+TMSl+joaiHbuKe3j7W1J1/YxAH4OUDfvjFSJAQ6HRPyDTYIVv4gCHVWXP/1Rn88VoQ4+RyfSp4n5NfunhbMmDX8ZndKHkfGB6X/brA3VeP+kD3B+6DSiMSI9zBR5QdQAssbeKCzU1T443Ld7ImS3DbCfBVOT9MKhZje2To5ewxBpDppsHf+nZhOGnV9xgCXVrE7jLEQnP/oTHNtexaL2rkf1zCTPwbfBMXx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7zaSDchiO5XsyQyeMHfS5e45kXheg2Vas4XmqgYZbs=;
 b=sBBfh0qy1KoHoyqWJ8q7fcUANfQbfTsQCniWrS+zIixy63R0unucBV0E9aDwC9SbMMTiE/TXQ/63bhB7C0jp3T3BXmIVdOrsO5ytXkUBZLdsTQ8g/FOEVqj6Ee15ES31tUL3K9UPjq2kvKrZeSg/2EKB8KR+gEQ7JE2j+8Az4Ow=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 06:31:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 06:31:05 +0000
Subject: Re: [PATCH][next] drm/amdgpu: clean up inconsistent indenting
To: Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902214510.55070-1-colin.king@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <62384d80-8ef8-35bb-083e-61036d989efc@amd.com>
Date: Fri, 3 Sep 2021 08:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210902214510.55070-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 06:31:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31e2da6b-ac10-44bd-f985-08d96ea4688b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4550EBD08B1BC50D9E9384E683CF9@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0dwyEW2CVWEH0v6tBelnIxFW2MT8Hl0SZTDBqqilpcQGi1jC7Cw3ao89/Mr6DQ1QAB29P9gUogLhj2kBG7AMdGztFlOatVU2im+YPb9xoS8vzYLgCoF116VKIITp4XdPEmHMa8QLeEGuCclQcpySCm1MivaxItd34mKaj+FJc99Bt20Kh2veQ23plK6YOfd1fDS2EZED2SDJ5ytQmpiQLef5w+CA3eXV+yCgKiJXuddYrFuAmi9hlWRmfvkHLgCwlpdHl7CETSoBSgfohaFIcJdfQ2kIVLzx1vekNBfDKKsdjRIjAdGSL2fMdStHSaxiMqVojAvd+RVDGTIMJosbA3FIjbjW5F+vl3fQng60qpAvPpl18Yn9ofWOccOmSRkOYB9kcNSCEiiEpkA2My9j2pJZMlgF43w5+lkwpYjgDpCS3grcrxXCRZ46jaUTd2uKOkHyYsjkMWAz0cgYwMsBqJllPqRaq4zTZO3u/Bc7hWo0H95r+aADDZrkF3jBTUSGWZzYzypVJVG4MROMy63WwM/3O0eCCIZDmIEu/2RTE/vB1+AjaNnrg5e5pXSiS/ZDmyaav3S5dnjXm4/H/cHCmky74NvLVkjvBsQ8slyqAziXE+jJXhSchqZ9hwqjKk0LbmpHtzjkw1I1jVD8ho0gnJZH6BVj3Gtw25enQRDYC/kx/8I/UM1nsfRtYHYuGLD65WVmdAwxJ32nG/EzjR76kHaDuP7MWlgngl3Aw3OpEfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(316002)(478600001)(186003)(86362001)(8676002)(31696002)(26005)(66556008)(2906002)(110136005)(4326008)(83380400001)(38100700002)(36756003)(66476007)(6486002)(2616005)(6666004)(8936002)(5660300002)(31686004)(16576012)(66946007)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHByd29VWmJmR2RXc01RTytIVUJkTURXTWN1Rno1VkVIKzRBZGlrek9SbW13?=
 =?utf-8?B?cnNtemRZMjN3Z1ByMmQ5cjNHa0FlZ1NWRWlCN1FGMFZ2T0NGRXowTzVCNHZK?=
 =?utf-8?B?VFhFdDl5d0pVZkVsR1M4S093dFJlNHI1bkZoUVpPWkFINWh4eU56UGJFZkpj?=
 =?utf-8?B?UTVIbmxxUVhvNkFtWjVPMHUvNVhLeVhZQnIxK24rbFV2Rnlodks2VlhXcERR?=
 =?utf-8?B?OEM3cVp6KzdXWGR6N3dJVGFpVG1rMTY4d1FQUUdraFBGWm5SMm45cy9QUVFK?=
 =?utf-8?B?OWZDaXAveFRGbEUxTjBqNFdTWkUxK2MvMkdaSGJYNHI1T1QvbUJyZkRDTVd0?=
 =?utf-8?B?YjdJcXpNVVVhMXJXdUp1Ny90WDRtUm4xQkxkSCswUTI2TkJDaGhoYmkyazJr?=
 =?utf-8?B?SzhwMWNJKy9mR0M1bXk4UGRDZDQxY0d3aFF2b2xFUGFPNWtKRlRFaWtLRkxv?=
 =?utf-8?B?eWdhOVBuN0dmMzBmL09iblBmSGpnM29xcjhOMWJUeHQvU3hBR0paSllaZmd5?=
 =?utf-8?B?SmMrNWExdlJzbTkrNlgvblJLd0xyWVJPNWpNdjUrUXJrQzNRWkdVWnl6QWRC?=
 =?utf-8?B?SGt0dGhMSlFGUHQ4bGZsd0dWOTUwcHZGWVk4RStzakZkR3crSGgwTVFvU1RU?=
 =?utf-8?B?dU8zYlpxajZFQ2E3QitRVFFxQmZsOGlyZ2gyQitiMUMvMjZrM0Z5a0s3d3pr?=
 =?utf-8?B?dGt4aVRQT2o2bElkUVUyS0VzL3BxL2JmOHVwS1JCVk5QZlhpQ1ZMdVlPaWxi?=
 =?utf-8?B?QmY4ejhtSXBjc2hrSXJMUkM4dzJEejgvUVp3SUs0d054NGFzVjNoYWxpbFNs?=
 =?utf-8?B?cDNrUGNMYWdjekFvQWhPMmpRaEJtYW5ZS05lRGdYTTZIWi9mTlFKUnV1T2dL?=
 =?utf-8?B?K3krZ3kvbjJyNmxFcGtVWDk4dGpzK044RUVZaXRmNVFWUUllZS9LcWZ4ZFFC?=
 =?utf-8?B?WXdLbHYxSWtMbGl3YWhUNUY2ejJlQlVHZEV2YUJ4VlBwc0JVdWZuNWJ6dE9n?=
 =?utf-8?B?ZFM2QU1EMFRQV2tkZWVCYjBjRm5hYkdrcTVueWwydldvZnhoVk8wWmJLUlpU?=
 =?utf-8?B?Y2t3aURPYzlUUm9PNCsxdXozalFQUlk1elgyd2tvRVJvNkVVblZqc1NodUY3?=
 =?utf-8?B?YkdiS0hENW03d1JzazUzWXpaU2dhNDN3SzBCM3R5WVgyVy9PNzFQdWQvRlpC?=
 =?utf-8?B?a0ZIK2pXTDlFMG5mc2pvQjNLaGRvMzk0eFUvUWEvSU5sREE2eVR1MWVFT0xk?=
 =?utf-8?B?SWExNUV0cUk5eUg4OGRNdEtuYVZVeFNZZW5HaHBSbzBqUDV4RkVaaW1MUnBP?=
 =?utf-8?B?QXYwRG16MDN6N2lKTitKME5mUHZxcjFHMlZNYlU3c2RxWHVlWWJHMzVWTmx2?=
 =?utf-8?B?WEN6bzFHdmU3MUR6YWFHS1BSU2ZvRjRvRkNwVE5pYTBSWlVPYmZxZmFQRmFl?=
 =?utf-8?B?RlU1R004ZzdmNE96ZHF2RDNXUjYzSkh0RWJEY3BxWGpKSVFua2VYUXlJN3BG?=
 =?utf-8?B?N1NlN2s4cmJESi8zS2RvOGIwS01Yd3I2enhuS3NSenZIU1ZudGJ1eXM4WDY1?=
 =?utf-8?B?VHRBd0x3RHdRVkFpOWE4bytGU2pldzdUTlRxd1F2a1h0cTR2R0xJWHFMVWgx?=
 =?utf-8?B?c01SaVZuVWQrZk41UHN6MUhzbTVpMmVicmRXTjBSQStjbE53WnFnQnlBY1g0?=
 =?utf-8?B?bCtJZkY2OWgzOGhFdDdTRnUzRzl4NStaNW95WFBQNXM3QUR2cmg4TWE5bkJY?=
 =?utf-8?Q?7amg93xb4YVb8i9OhEdQJ3x3pNjHydgKNV+2hil?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e2da6b-ac10-44bd-f985-08d96ea4688b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 06:31:05.8341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsBJRcZrqLqccztr912+kl+JwqoNunyXY1s0vGU1bhL/vZTXRfDO2mVbwDruwE8x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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

Am 02.09.21 um 23:45 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a couple of statements that are indented one character
> too deeply, clean these up.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index d6aa032890ee..a573424a6e0b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -60,10 +60,9 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
>   			goto unlock;
>   		}
>   
> -		 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -						TTM_BO_VM_NUM_PREFAULT, 1);
> -
> -		 drm_dev_exit(idx);
> +		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +					       TTM_BO_VM_NUM_PREFAULT, 1);
> +		drm_dev_exit(idx);
>   	} else {
>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>   	}

