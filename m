Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D3244D4C6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B5A6EA5F;
	Thu, 11 Nov 2021 10:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FEA6EA5E;
 Thu, 11 Nov 2021 10:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFzybV/a7ZW3W7tKuVBd8YBanJT9+nUh2ObhLVlRqLfbK5EAha5NDpJQlwzLYewuDtRSl6RzggNBis15S78xxzHIFhYSUnj789HlmEAbcmATHFCKLrmIK9AEh6/MCpnlEloM4E9VViZwuATJ47JumAfdgKwGX3JGR1q7RTeGJjoUEn5zeKLJV26ep4B2QXO3uA4yfr9KJwb+UdMTZthxvbSM2iB6NlX2yAuv6gbmHgtYwMen4iaDKbCHJ3yImePTc+rN4H2m9S9vFcwK1DaA3U5Ky544RSV6YsVsP7FlalqQC+pZMRq/BDtw8PQu+WFFtMhsoxmVcbN/h7Ix9grfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SgO7lqiy7UjBoRYyDrne3XjjKDGpEH4VAiBYQ5pBEE=;
 b=ahkV9UiOHW573fPdLG8pPSu5DoBo75eDZRoqAeUunckg0xW/9miq8Y4PnourGkSZof8DvVm9l8jBsKlNkWidphvG+FXO0GvnEcGkqyAZBci9SdstWYO/jAFg0EdT4ZEjdqQSOzB0fUaorc1ceYtE0UeGlgKMttaguU1wHvDZMfvyDaEmtdC6SwhtFLcWIsbfQAUrErX0ia2ugolaz7LzoldtfSi+24p+yBZWpQxVo4aA5e1+oWO40kSXk/5jlyZZ2N/Y+Wo+YyM+IdZ19dVQ/vGGC6hygO4pXpSPVSfxoQkk0VPixAvi61zQcBwLcgfe7OEgOwefbkbwNcHnoHvmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SgO7lqiy7UjBoRYyDrne3XjjKDGpEH4VAiBYQ5pBEE=;
 b=3k39H/0thu/E3Y02EhJ8PVpJ7IKjVrAe5NZ/prqtF0/pQVB/5q159jTl9oLfJw6NApvBMw9f+AVbyXf98/6Zx2olpQtNL5e73SN6ZTtK0Yl2SAm263q0FT/xDkDG3Sxh2QeTtNRF18BeUO0AKMSf/SBYL2xD6FxRsptWzKGrF2U=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4586.namprd12.prod.outlook.com
 (2603:10b6:303:53::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 10:08:56 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.018; Thu, 11 Nov 2021
 10:08:56 +0000
Subject: Re: [PATCH] drm/amd/display: Clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <1636625005-87952-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <abc4159c-e903-9265-826e-b44b387a7fcf@amd.com>
Date: Thu, 11 Nov 2021 11:08:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1636625005-87952-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM8P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::30) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AM8P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 11 Nov 2021 10:08:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbef5118-9e50-4ec6-0fea-08d9a4fb45bd
X-MS-TrafficTypeDiagnostic: MW3PR12MB4586:
X-Microsoft-Antispam-PRVS: <MW3PR12MB45863E77A362DF20A539DB3083949@MW3PR12MB4586.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCY6uHF7JhuCprRugvAneyfDPcP69S0YUgWE0nocRijFAyGwWpbUfXdL+DHdp1lTLLmzF9koy44Bdt/shawX4hMN2ZPf76YqJ+h/NnR+X6wDsbC5gym3l01r/rZHCWujqZb8FsDppiyJLR7mE9b2OFo2CBibE030uzUs1WTlv3X+qiG3gXlrpliHJJe3MI44bfCz67D9BFTsX4Qeg8Sup/vLyZKtZQUbPBDCD6kbZlWIhAZp+Qe5DH11DF4UTp6rR3P0acpt6xoQM+79YonnFE2u0JhZYDVJV/fqfs5EQdalwjfAWqQ62sSCtgG+kwN6eMoS0i0EXbobBbj9mT6sn6KTnSyL27LxvEDDCGb09xqYdwnJs1Y6UVXXu5J7JrPhfhS1U9OydjvWgmkBZL+PXk4gwfBKocOMGrJQeWvQvjxhA0ckcdB79VrLjQuBSoT1DlxtpGkg3b8JY01Dt7xSSfuwh0czyfeAaBH907IWVRNmhlxdUcE2SKHALUjO1MxAV9UteJQBPZgC6sAzwD6YkonDNov5Tlq1vcgqmQ2993hr3rbttXuitQ0tzYuR18oINi6CuL3N/kKUYoa04pTBHDKJ94bdefxIlQPUet01KFYJQIF2rNZs0lf24KmYlmnTFPd3yFUt8vQjYDkd0jRhoELrNbc7ykwTgScSaUJO9M+r0FZfuinjOB59KNiOFMj8j0V29/Qmg/9SL8yFnws9B0c/pQshRWt5Hv2yZu8ho/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6636002)(956004)(2616005)(8936002)(4326008)(66476007)(66556008)(66946007)(316002)(6666004)(66574015)(508600001)(5660300002)(31686004)(8676002)(83380400001)(6486002)(16576012)(26005)(86362001)(36756003)(31696002)(38100700002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWZKd0hKNUJtY1hqa2JUak5jZHIxUytJOTVHZXJuNHhPa3Z4NTNXaFhCaUw5?=
 =?utf-8?B?enVLWWtTT21TY05PRE5KOUJ3Qzg0QitqaEk4eTZNYzVScHNuNUR5NG1RK1lk?=
 =?utf-8?B?T1VLS3lHYWg4TFlPT21BRkJFdmFYZ2d6cHE3bW5PaGUvK0RWbE9SREVuaHFw?=
 =?utf-8?B?S2FRcDFJU0hUMG4xSExYUDlZNnFQcjV4QWwyOWo0VzZRQzZaWkFWOWUzaGYy?=
 =?utf-8?B?cVVvdFNWZDN3THlmT3hsTFVmRndYY1BDNm9Mc3pVeCt4aElLZStuOC9lWWtw?=
 =?utf-8?B?ajRoaktWZDRRNlhrQ0JUd2wyRmExd3BNMGYwSTNMS1VUWmp6cU1VTnowb0M4?=
 =?utf-8?B?QWF6aUovalBjMk12WWhTWTFIRVBYTk94di9ZSFh1SnRENjhkQTFLNHlzNlhk?=
 =?utf-8?B?VGozYnJ6ZTZoY3hGZ29sZExiMy82em5UbjFZckQzKzVHa0I0WHZ6eHBCbnhr?=
 =?utf-8?B?bThJNFlSTEM1bmg3ZjNrWlYvNGhpK0h3d09CZlpvOTVodEFoZ25Jdm94SFZQ?=
 =?utf-8?B?RW11KzMwRDRGVUI5ZG1NYjRwREJUVjBzazRXTlhPb2hqeEJuTklwRXV4Q21O?=
 =?utf-8?B?QzRtL2hMeUV3cTdDTXhlVnNCSmRIazNwUTZPdWJEZGY2eVp0RFowTU1IeUVM?=
 =?utf-8?B?NGhQU1VTWmtHa2hjd0J1RlU1UmF3WG5hdnRaYTBZYm52bzhRaHpjTXF1ejFk?=
 =?utf-8?B?T09HNjQ4MUc0YUR4VlhrNUVmVDlPY09NWUVRTFZWZVowQkZHVlRvQnhGZCtp?=
 =?utf-8?B?LzlXcVp1SjVocFhGdGgxR2NmSU5UVmd6SWRkdEdsLzkzNHJMTlk0NEpMczBT?=
 =?utf-8?B?SzkrS2ppdWlqWGM3d0VRYWVNYkJjVDhEUWh5bHpWVUdRUmUyM1Y3c0JaMjlQ?=
 =?utf-8?B?Y1d4K2tPRk94a0lrWU9Wa01WcmEzemd2ejNWRU1wZlg2d3ZObHg3V1hXWDRM?=
 =?utf-8?B?RW5mT21FSE1qTGpvaEs4ZC9TUTQ3ekk1eHYySzh6S1ZJVFpFR01GMzFNYVZr?=
 =?utf-8?B?aktCQ01kRzBFMGl6azlDdDNXdVhQZDNjczF3OEhKREduRWs0eXRlS2RmMlg2?=
 =?utf-8?B?UGFsbWdCQTNqL0VhNGlZcUtVaDhvdHFzTnc2WmJodGR0bFlMakp4cUlld3NU?=
 =?utf-8?B?NHE1b2NUYzIzamZjVGNIVnB2NzR2RkEyOWlLRVRSVDNGaFV4T1JZd3Zaa0Zi?=
 =?utf-8?B?V0t0aURGakV0MkZGQ3VSaVFkWnAwUFYxQkN2eGVXR3ZuZHRsM2hRUkdGM3Ar?=
 =?utf-8?B?TVB2Z1EyclJxd1lRM3JRYkQ0T2kwUzFlSjJ3emNyN25jMmdmZWJ5aVVUY05l?=
 =?utf-8?B?M3lTd2l4OFNHMzVzSXhHSXY2MzVMSkYwUUdvNTBHTDVkejZ6MW1zZEM3OGMz?=
 =?utf-8?B?ZDNyQnZTQ1h5UlJkSmFuTmFuTXJJVEQ1VkFSQW5PVndUYU85RDhuQ1ZNdWlS?=
 =?utf-8?B?UTk2VnJXWUdHS2lESFZWRWtnN2I3RUwzb01JaWh5TFM4NHV5WG1xVEJvRXQz?=
 =?utf-8?B?QlRrRUZVVm93d25iUHJYQmhNNUtMa293OElTamFRWFFIZUVucWtLWndJNGN5?=
 =?utf-8?B?ckNkM1NjSnVsTHNDc00rZFdYM0RJRFlFRFNPa01ISk1kMWZFQktUZzhiL1da?=
 =?utf-8?B?SkJhREhQUE92VWdHM2dOOWRTY2I1amRnNk9xV2hnc2tvNFZQb1FLT29SbFNP?=
 =?utf-8?B?TjdkNjlnbWJwU0RrLzBkcVQrRnJUZGM2YUYzTjk3UTFsazhadVN1ZE1qb2dl?=
 =?utf-8?B?SWIwL2l2T0gwcFBWQUpJNUtCZmpSU1Z0U1FBOVpFUTFhSyt6Y3dmcEpZU0dF?=
 =?utf-8?B?Tmt6UUFFRG9jcmI0eEFLdVV3ZmxaZjZYSndDd3FvOW9heXRuYXJNM0ZTaTF4?=
 =?utf-8?B?WHNWZitUcG4wRUJYbWFUdytYTnpPejJjRndPN2t0V0hFUitPcXU0Uyt2N1Ew?=
 =?utf-8?B?VTg0QjdCdDVnTXZ5U2NJdHAwZFNMVWZET2FqQ1dNSGZNV1dCdm5DeVlBY0tY?=
 =?utf-8?B?QlNtclNpWWtLbENsc0hlU1JzZXFHTVUxdFEzZUxkenZKanZUWmhMVlhaK3N0?=
 =?utf-8?B?MmtvSUNGQWcwZHlMMHZmNDg4cU5SK21qdEh5cnQrajNMWjBEY2tielNuUE5U?=
 =?utf-8?Q?FKUA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbef5118-9e50-4ec6-0fea-08d9a4fb45bd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 10:08:56.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnYd7NSTqsLbv8g404mQIm8rLHCW47ScqTzt71rilMH2KO/+JpN/tp40BmmGer6+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4586
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 11.11.21 um 11:03 schrieb Jiapeng Chong:
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:622
> dmub_srv_cmd_execute() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> index 56a0332..e9fadf1 100644
> --- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> @@ -618,8 +618,8 @@ enum dmub_status dmub_srv_cmd_execute(struct dmub_srv *dmub)
>   	 * read back stale, fully invalid or partially invalid data.
>   	 */
>   	dmub_rb_flush_pending(&dmub->inbox1_rb);
> +	dmub->hw_funcs.set_inbox1_wptr(dmub, dmub->inbox1_rb.wrpt);
>   
> -		dmub->hw_funcs.set_inbox1_wptr(dmub, dmub->inbox1_rb.wrpt);
>   	return DMUB_STATUS_OK;
>   }
>   

