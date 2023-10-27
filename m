Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71E47D9538
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 12:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E0410E971;
	Fri, 27 Oct 2023 10:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5B810E971
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 10:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OP+lh2X3yOQ7IETQ/Bhf7EGtMTlVzV/sbtzuh4cMiIbiY4TM70lRaBRqo/LUJtDrOakGe0YjXgDKIlBNEPms8s+G9t64mtaozNT5IBcYe3Rh+d7QQkgqd8RTYc36YLPlID+fXFJhnMGXffx9LrDF8M9BLH62YPGITa8enfvks4aV/vWj7Ie+InIL68au6dj//L60wRVzHArIgV33PO+F8sa+5IiLZl29r9xgjEAfDMTe7FveEQu2/QbrwJVtcW+q5P/vcALta5oWO3edq5NSmcq6XgjnZ38W6k7mURXN1aJusZsMEYKDL0l5cU0ry5lNIfVB7Y3DK9ga8hGp86xNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sqKIT7aBVk7CEKVFJB8rbkMtSHe+jXMtmqkyzU5BaU=;
 b=O5t3X8RnsERDuzGCl7QnhQ0j3bLaZ3QTk9pNm/PtkfLFNKLxoEJllGlnLNIcVxK9zz8gyiusZg70sg1eOMIbM9Ug5/HaDnLnpJtamZXAio0N3S2aO8talJ6HQsVl3YfMpFEu+Ih03weEVsp1ekT/iHg069i0k8xQ0f1EBQwVVP9jcmYIZMSemMpm7wH3TChlou1bs9ni2vTcZrEVxWPzVkYnyUYnFsJNGAv4xgPI7BNQoN22fCnu+d8QrXktcmB4lmparjSy+G3Ww7WVcPCh/pDSydaiwFQR9i4Mj3hLq7ur0u1pileU//jth5eg2F4lPaJ9wBWIF4j5HTg4rdgTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sqKIT7aBVk7CEKVFJB8rbkMtSHe+jXMtmqkyzU5BaU=;
 b=luiiysVdgKeVyL/xPhZEsHdCFB39O7EB9oFmSJqQEyPEp1KgnqmLwZQGr7vLVeC/G94QJ9cWMGKIUthPaJBPkBAZTnsEPbllM9xThxRajZohm1MnBs9cGLNknIVeucdKpU/AGpHPB5EojLPtJpXqa6SWELHrTBiHI9S/F7+MWqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.29; Fri, 27 Oct 2023 10:26:28 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 10:26:28 +0000
Message-ID: <e5c9a94b-2b9f-4f64-a1f4-e85c8f64f2d2@amd.com>
Date: Fri, 27 Oct 2023 06:26:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/atomic-helper: Fix spelling mistake "preceeding"
 -> "preceding"
To: chentao <chentao@kylinos.cn>
References: <d4ebae36-265b-4537-ac1b-ae878d236151@amd.com>
 <20231027024459.12793-1-chentao@kylinos.cn>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231027024459.12793-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::11) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: 777a099f-a2f0-4fb9-e43e-08dbd6d72deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQ2hXqlPrVUdvB8vu/VB+zL7ATwJaZVrY3U/YcVHkXMK/W/ff/PAQe7x7PfeFkyWIygEvf73dKmhOr7UYZo5wOcTtrXdL0eW0d1N9YN803QR/KNsyVVY9ak1BC5UupNYCwZUT7nbwpFPPnM/NRJgYa/s9JQtOhy7HsGANNXdyEtVvhrxLT7ok7AZFcYtZKxdldVNloZwUauNtIBNsHrksGxrvjjuQD5BxWHkNx4F+W/+eDvOW4hVclrNJwnbRlo4Nt5hsA4O36f32MPBjwtCaUk0SrEZpxVZWqLCKxlH9WkCPNQctTebE3RUplUROycQaqBntQbZRXX+e8md+tkid7gdtqiYoiXv7B8gQLJPPAPP8lBr7eC4E8tt9GT3Ye7czUDEGZ/PE/oPpkdAqlMj8REyumidVmeQbVJEND9/A4ri2P1c8m2mR0o4v6BI7srILFQM2bAcKRBbUZ0brWzoSz+Wx7RNaN93Ldui7Wp7G6YEe9XVxPaFaQ5LKr/56no7G7F4qo6JBlQsCL/zX3UtI5FWN7DlYarYs+4/ciMz8u5x6pEj+sgeOE1Mwoi+UG5UTtjs2/cnAe0lVff3i+3WYdcsqhGhhKnj72lcC7MDdMiWROBO8C1r68RH5CWXZwHKxXmIFMFScey5iTtVcw/Paw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31686004)(83380400001)(53546011)(4326008)(2906002)(38100700002)(44832011)(36756003)(26005)(2616005)(8676002)(6512007)(86362001)(31696002)(478600001)(66476007)(8936002)(6916009)(6506007)(316002)(6666004)(5660300002)(66946007)(66556008)(41300700001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEJPNWhzbytITC9sd243MC96dmFTazJxaTFidTNvdDZKY29DU3pqaHVOa2pM?=
 =?utf-8?B?a25ITWxqVlhnUDRyQ1c0anV2Nm1OMVM4MTYwdkNmREpQZldwZWx4a09iVXRN?=
 =?utf-8?B?cUxoNEFMRXVUN3EyVzVLb0RFdE84d01VVmg2Uzg2aXY0ek5lRWZYUHdlLzd3?=
 =?utf-8?B?OXlZLzVKNE45b0paV2NEaDlPSVJyL09kYnZXU3UrZE04dzBLZEs2NjlCR0la?=
 =?utf-8?B?QjUxcHZnV3RhM0xMdFFLcUFNTk5XTHRLZUZpVFRYeHQ4dEpVK1RWbG1qUmlT?=
 =?utf-8?B?dFN4bWl5anUvYVF0VFFEOE9FRUJXRnJCSkRTSDF1Z00wQk4rTUNMd2dWNW15?=
 =?utf-8?B?d2lUeFR0Z1RXMzJjKzlEZ1dSV3hpZVoyeFdlclhMWWtyUW5QQklGblB0M1J0?=
 =?utf-8?B?cE94Q29sQTZLWHlXQWVVUlo1TURMVkJlZmJ5ZEx4eUtnUUJpRVZnNUp4N2sr?=
 =?utf-8?B?RkdvdFZPcHE1WUp4NVV3ZzhTb1hsNndtU0ZVcENaWmN0akVFcmFZdFcxa1dQ?=
 =?utf-8?B?ekpubkV4ZW9iRnlJNVFEc2M4NGNkZGZsQm1XWXFLbFY2dzZ3eFBSUitJazRw?=
 =?utf-8?B?SGtFbWV6SmhObkpTT2xOZVpqLzEwakdXaklRLytVRFZyMkJJaEhiUlE5VFd2?=
 =?utf-8?B?c2U5VFhLWldjSGRBalZRR1RRTDZYcnduV3laZWdUSXYwdXEwNUZSeWxTMndI?=
 =?utf-8?B?VlN3Nk9SdkZhYXFDVEJ2UEd2aE51K05uRHgvdVBET2xKZHJDMTUrb1JPem5i?=
 =?utf-8?B?cS9tUU9BMFFSbDNIMjFZQTVuWk1PNWpFVWRFNG1YNWJmajFhejJFVXd6RUc5?=
 =?utf-8?B?QUZET2dCVkdRMHlEL00xc3BCVjJTdzZLU1QvcTBRVUlxRU9DOWx6Zml4N1Bn?=
 =?utf-8?B?SEo0MjJLU21oQldpWmEvS0JZLytPK2RUT1ZMdi82Y1ZkQ2hhUS9uakdyWGlQ?=
 =?utf-8?B?RW90aGlweGRjRGVPNW9rWTEwUEkxa2dZT3c3Tm41cFJuSWNROGdZVXJ4YkJu?=
 =?utf-8?B?VUVYYmJHKzNOZm9jUVRtd0tab1FweVJUMVZFRmRZYXJ1SU94eXpFUmI2b1Iw?=
 =?utf-8?B?YjkzREYyYzNkb2VYNGZvREhDN0V4ek8yWWlmWGxSUkpBNEZDK2xsdVdoSHVh?=
 =?utf-8?B?WXQ4VEhyeWt0R1U3ZEhkVDFoOVNNNlNDUWlKTWpPWWZ2R0lzNk9VdGhNREJr?=
 =?utf-8?B?ZVRHWEdQODJnWHlQNE5UMlR5aWVIbktLai9qQW5RbW9QdDRHcHpuV1VvYVF3?=
 =?utf-8?B?bXZ3c1VOdUQxQVBSL3RKTVQwN0VrVmRISnRxVkVKeWFCMmhkMzgxQ01PcGND?=
 =?utf-8?B?Q25IYmI5L09JRG51elN4N0owY3lwTEthcWo5YjRvOGVhR2U1eU5YbmtlM0pR?=
 =?utf-8?B?VDFLcmJLOU8yRWY4THl4Z3Aza3l4SnVwdTVMYldrNWx3WlBjMzNYdDBtenNW?=
 =?utf-8?B?NGs1TTdnOVEydXZQMStSLythTWl5Sjhvb01mbFpzb21od29TcnFISTFkeEhL?=
 =?utf-8?B?RjFJQ09aRmI5RWNFQ3Z0bWFDRHZSRC9VZDdzYU4zRWc5Q09RbzE4WkhZUTlv?=
 =?utf-8?B?MWF5Qmw4cFdTZjZwRkxEVERVTE9CY1c4MmJvY25pS1krNHc0L0ZGaERNTFJN?=
 =?utf-8?B?YzRWOHlTQ1hVMUQ5ZTBYTzBBS256T3MxZUhpakJpbXB4SlpURFk1bmZLZWI4?=
 =?utf-8?B?MFpjbUVJUHh3WnZ2WkZmQk1DZzhrZFpoQ055eWVRMlRpNFA0S1JOYnJuKzB2?=
 =?utf-8?B?YTgrdjFtRk9uYzg0emNmQ2dPdmZxa1hEU2JRQktkWUhiQ0FJUkQ2NnNvN1A5?=
 =?utf-8?B?OHllTjNiNEY3Nzcwbmx3bWxjWTBmL1RLZ28zWUphbThEZHhkZjk3NmlDN094?=
 =?utf-8?B?aUJYQ2Y3cHhudUhGN2hOWUh3bGlZdURRRkVGbEdRT2gwUE05b0ZuR0sya3o4?=
 =?utf-8?B?V2ZDWWVCRmxqMVFzQWJQeFRXVGFGUmJpT2FoWmlwbXltZnE1MUpRWU11c0Q2?=
 =?utf-8?B?REtBZWltMHJwR280anpYbjRHSWdsbmMyekFNMlhaaDhvUk1udlJJWFpBODhU?=
 =?utf-8?B?RVZwMk5xTVZyRGIyeHV2L0dnVkQvakMwajVmTmt1UVhSbGRmRkxFR1BrdTBN?=
 =?utf-8?Q?M4AMZwWrq9QpRTuTVsmsGmzDI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777a099f-a2f0-4fb9-e43e-08dbd6d72deb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 10:26:28.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/9iYqAV77egPjzyOAkXGnsHSD3JYsVx6TzMfnZSqPqlHXFqS2T4GNzj/l8Eoe+4lFmFHUTbvCtd9lyL5JSnWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662
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
Cc: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/23 22:44, chentao wrote:
> From: Kunwu Chan <chentao@kylinos.cn>
> 
> There is a typo in the kernel documentation for function
> drm_atomic_helper_wait_for_dependencies. Fix it.
> 
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Applied, thanks!

> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 2444fc33dd7c..c3f677130def 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2382,10 +2382,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>   EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
>   
>   /**
> - * drm_atomic_helper_wait_for_dependencies - wait for required preceeding commits
> + * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
>    * @old_state: atomic state object with old state structures
>    *
> - * This function waits for all preceeding commits that touch the same CRTC as
> + * This function waits for all preceding commits that touch the same CRTC as
>    * @old_state to both be committed to the hardware (as signalled by
>    * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
>    * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
-- 
Hamza

