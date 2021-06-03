Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563E039A471
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E01F6F4A8;
	Thu,  3 Jun 2021 15:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2085.outbound.protection.outlook.com [40.107.100.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A696F4A8;
 Thu,  3 Jun 2021 15:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9x067cfQ8zEq3gFIfm8158s9HJ0c//iUBz00Mpc5JQbastqxI10lt+vXfRf1dG/U+3aGFC17dlDY0HTc39vrVPJRVWiFpIkweVJcVYhEdaQ/3dvdRr+FVslUzZWsKqxwJbp1TlOtyjU6OiSC1b45CwHR4BDvlk4CoHHgxt6OrLRczxkMkgIaXZkjtVwp3XyXeFikwb+2fDosddqU9r8pCYCdmbWibCGae0rXu0FlzNLPpm/ESBDTFcKWn/3xqX36kVyAlzJJnhHSDIqHfXoeQbh7hdEeoJImjbVRU/fvuvi7Em67UJHhp8RA1LWDFra63Mhagtw6FaIJPaWTwQM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9r7AcPB8Y1pANFcNIKl49YnnC7r9+LWitrcxTRYz/g=;
 b=WsLmWjVJ8Q/Mi6bhumWeeze3sAuxV5oomlbiCOSN+KZJV7cW76mHZQ5ygvfXzuxtXy/DsEcc7XZJJaMrQBV9pbrEqr8uH/ag/WNk/Z2MepzpiOKlKz4j8aL2PxcoNAEnm/Rb1GTn+4AvEhh9Kcww/2SinCo95jA/zoAgj2oP8MZNrN+EXaTQoUosRULeiDqbQTychTassYpyXAYCn8nD4l8gQgpTt+L2A/ZIiFhYadnfzul7FkCi8b9MhltVGVoUofzM5efkjHxuHiWHDJQt0luSPuV4QSu/o9hQCoyo1HWr/1pZuu7j9WxUeI0ArGucSYFTlLeQRXlai6giPBn5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9r7AcPB8Y1pANFcNIKl49YnnC7r9+LWitrcxTRYz/g=;
 b=1PLpAK2YTa4pz3BuTv2mA3saU8SXdUtc+WwzbusGU2coYBGc52EFy257V4Rp/FgcUpP1kTzqryw9tk3t6e7JV76nWsWHlDiJvaY8rr7KhQdHzGZ/p65PCKArUod3biI8IdiuCL+ZmRWe1jOlhEp6KAWgzPQqzQJNISeSQJ9cVfI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 3 Jun
 2021 15:22:10 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4195.024; Thu, 3 Jun 2021
 15:22:10 +0000
Subject: Re: [PATCH] drm/amdgpu: remove redundant assignment of variable k
To: Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210603123440.83936-1-colin.king@canonical.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <1b714f14-723c-5e66-dd1c-b720f4b120fd@amd.com>
Date: Thu, 3 Jun 2021 11:22:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210603123440.83936-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.203.225]
X-ClientProxiedBy: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.203.225) by
 YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.26 via Frontend Transport; Thu, 3 Jun 2021 15:22:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a63c1ab5-7456-442e-c2a2-08d926a35b23
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5179005B8D0FA9D7C8D7F10E923C9@BN9PR12MB5179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /C1bd8XCJ/8nBIlhM0H8ypJqxN0FTJrt2H3XmM5ykjj7uQnfjVD+kp9vWd/FrPnMuYt9/a71VVE/Os9tw+VEuxQBT6USB0tPLX9Knv8oBYd05BRamHIuO0KFdzNKzpCK3h+HWIrXbKwtrgY4TiSFaOYBX4NKoXIaV3g0vtJSFupCTJrKtmoyaVM2+af6NiphtQjBbeHe0yYEKYnCz22qH58/Liani6w1VZUgpT81raunqkn4S7Oh7SG/WTmJmx1/OeIccGJdEUVsMIldD2lKsqikUIYrAErvXLQc0l0jVtCmB3yxZAAWDVM3yVXgTTzT7y0vrLlWLMR1xs3HL/e5W4IAPRusUlXuy890t/98OPpExKJqRjumO+mfyi2gyQK2LvxkI0DqYhnHdq5H9ukoxR+nJNdtM1H4OI8+bgkIFg2Zy0mz+fq/qASoD4suEItDHh7QpLi590iC6IaFyrzEB9jQzylwEjuBz3bSJjzKehPLiSXP9MEqpsWSrDuZMH+XCz7B0Tk8vfbnMakbQUgiQ++RpwzuOw3OvSRyFS5objbLzzH9dB7rw9QTKP2r1ebl1efLdq1BUTCBhDu3z4cgIFXvsn14l8cCgAJccV11X3UsiFZAioRIWZELxoL7L1/fhNo6RHYj3/3gC9Wyxbx8YxpZCQ3ze5DeV1i6qWSbTMorStgQYwIqm539GL5o0KGgoGpY5CUeqhVnDFN4GT1LXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39840400004)(396003)(346002)(83380400001)(6486002)(86362001)(38100700002)(316002)(110136005)(16576012)(2616005)(2906002)(956004)(26005)(8936002)(66556008)(5660300002)(8676002)(66946007)(31696002)(478600001)(66476007)(36756003)(31686004)(4326008)(16526019)(44832011)(186003)(129723003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cTYwVmRnS2JpVHY2aUE1V2JVWUQzczdkckl1UHJkTkxBZ2J6ampDUThrT25n?=
 =?utf-8?B?bTBycEV3NkJhVW9LdHcrVjNGNzlkQWNKRTE2aStjMW02OU1Mbm5pM3oyb1lt?=
 =?utf-8?B?dEJocWlOS0p6QkNGR2dFVzRSeEpPdm9WTTBYSWZackxlbDBmUmEwVEN2ckZW?=
 =?utf-8?B?ZUQ1NklYKzRVTzZwbDNmVThFWXpoY1NPbThRRW02R2Y4bnBRM21veWdEdVhj?=
 =?utf-8?B?Ym9CajkrWDdsa0phM2tWTjYvK250dWMrWno4MThIdmRYWGRpenJZVTR5STZJ?=
 =?utf-8?B?ZHZaZkVjVUg1b080a2w3Rzk3cmxCUnhUOWd5V2c2Y0NOVlBOZ1hIckx6WjJK?=
 =?utf-8?B?a0JTblRaMFBNMU5iN2gzbittZkhiTURESnp4bXZmbmpMbmZzeFVsbE5KZmpq?=
 =?utf-8?B?eXFQdTdJbzBEUHpkMkZ2ZkhPOUFIcW9EUmZQNWUvYnpvN0dTQk1OT1B4WTNy?=
 =?utf-8?B?ZHpyRHhSTnZmQkt3MWxGMTZJTTdOeElUOHBjRXc1Q2lmelZuT3pNQWRBU3cv?=
 =?utf-8?B?R09MRnpMY2I2b2V6RllKTUJldkxXQzJNSklQeHJQVHMvUVRkUjNVblQwODR5?=
 =?utf-8?B?WjZFVWdvZUlRTzl2YlZ5c0NxVFdFTW4venhIdy9scm5XVzVMTU5jemF1RWR0?=
 =?utf-8?B?Q2J1SjZsQ1RKcTkrS2FaOFhiYWpTekEwSnRSRGs3V0xHSW52V0s1MXpLaHVt?=
 =?utf-8?B?U09JY3haWGJpNmtGUHdqbkt5ZTh5U2pwY3JXdkdXNjJWTS9Ta0FzdS9yMngz?=
 =?utf-8?B?MXBKMFRyYmozekliNWdZYVpnbHExQmVvQ0UveTFQeVR3ZUxmQ1NzQysvWGRC?=
 =?utf-8?B?S2RMS0tJMklBVjhLZktmUStiYzVMcXNYbnJKRVdrejZyeXA2MGpNKzhIbHhn?=
 =?utf-8?B?RXFaSHR5WWpnYTN5Sjc2QTIwNXV3bVhJYWF1eklueFcvTCt2RHRkMk1KMnFm?=
 =?utf-8?B?WWg3RzBpL1YvMTF3MmZsbUxydldwYlNUdW9JTG1sSjR1b0dSUWk0Smk3Zm4v?=
 =?utf-8?B?cDUvRFdMZ0xmdi81WThld0VDUStCdkNKSDNDazhZOHhPRThidnJIUGo5ZFd6?=
 =?utf-8?B?Zng4R3luVWQ4aytLSzNTdGIxKzlXUHh3YkdnK2lBZ09icmoxbGVDVG9jT3RY?=
 =?utf-8?B?WmdSQmdaRXJiZzlGaGVOMjErYkhwV3RRemIxeUt3UDZ5UTRLZlRPOVMra3Y5?=
 =?utf-8?B?dFNIU0gzTG5yY0htR2w4S0NGWHFtTW05MCtFVU40SU5HSk5Ld0I3bnU3T1Iz?=
 =?utf-8?B?ZWdwSHFSR0k5Z0lWRlBaaDNIOTFXQjhiS3FvUkI1UW5HYjVZMERHSndjNk93?=
 =?utf-8?B?OWpZNmZGSEZ1MENxM3ZyVWVmMGR1a0tWcG0xQ1pQRFhJNGh4am5pMnovbW9E?=
 =?utf-8?B?bmZiRTlhSTR3a0J6ZFFtYUVmaGYyMEdoQXZQUWlCVWNydmhURXN1Vk5QcFph?=
 =?utf-8?B?ZTM3YXdVYmhybFU2Nk04d2t6WW1BdENNWFVHeENnSTA2WnQvb1l4V2MyOTRT?=
 =?utf-8?B?blJGQ2NraXRIVWdacU9PMk03NGRQUXNyQjdBVWdDWWRlMUZwRTNaVFV2NFJZ?=
 =?utf-8?B?OEtOeVJsc1Y1blNGQWQzME1pNGZMV1I1VXlsQVZUQkY4bkxwZVpVSFNXQXRo?=
 =?utf-8?B?bjVidW11NlhiMWFaenhhSW9RZHAxZmVuY1Q1ZFhMeDd4QlBra1cyM05VcDF3?=
 =?utf-8?B?b3hNQk81V2hHZlRwQU4rV0N1M0NWMGZpZzRCUGEvcmVyY2dhdkpuRy9Hdmtr?=
 =?utf-8?B?RXpjUzV0eFh3bjBqbnNscHI1d2NLZkxFMzN0Tk1POWFKNjdSK0JHdzJkYmFH?=
 =?utf-8?B?dVJYVXlmMzIxNUQ3RDRMZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63c1ab5-7456-442e-c2a2-08d926a35b23
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 15:22:10.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orB7aBuk7sLkQ8AX3Utt/QgB9yzGTZA8GGN8YKiV46tp5b0PsDpZDp/1+ZFlMOOLx6Ckyh5w9cj2jp3sMcjykQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5179
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-06-03 um 8:34 a.m. schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable k is being assigned a value that is never read, the
> assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I'm applying the patch to amd-staging-drm-next.

Thanks,
  Felix


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 2a7bed66d50b..f545dc1248b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -278,7 +278,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  	write_seqcount_end(&resv->seq);
>  
>  	/* Drop the references to the removed fences or move them to ef_list */
> -	for (i = j, k = 0; i < old->shared_count; ++i) {
> +	for (i = j; i < old->shared_count; ++i) {
>  		struct dma_fence *f;
>  
>  		f = rcu_dereference_protected(new->shared[i],
