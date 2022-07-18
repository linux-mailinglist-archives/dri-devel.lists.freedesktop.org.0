Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9655785B6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 16:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964718D722;
	Mon, 18 Jul 2022 14:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC9E8D713;
 Mon, 18 Jul 2022 14:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FW1gfqoBI7dLexJtKFfOwbqmqnzeBQKmDz4vD4TtswOxe1Ys541ymcW2C2fKRj/zMxW6JIblJ4yxGA3TN9DFLJnUHB+xn0wj8xxuovKw/gyD2tDHyKVEvTirCjCLrNZhUDQRwHYv8xDJeGSL/8byM+5dtG7yazo8VqK+mHpqQE26sn9lSpNDIGWTnte7ZDoUwSckxJ9gm7w5HIzS8u0QrMRKSs2Arf3NdS1vPCmqR0EibsHkPs3ApwxXxkF049IFTJ3ZoqQJT5RhGx+Sv4t82ow2YzrUn3ZUxKYEKdUvXef/R8QkEFVWUCq/J17K11As0tAhKMsNRQFTjws+FrKLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WowxVs+RZN0fr4hgO5gs5LKYu6e34RGDMochP6f+uWg=;
 b=WkAqdIwUYBeiP+d3bHRB4/FEfkfrV8XnT4RuvnRc7ZFiYsTUCCZ/3pzNgF1jad0iEDup/spu1acs73yv6kHyBE/2GHMeNN8RKt63frryLjHK+DYR8gZZTm2aIUpdqnlvkdXI6y7PwcKq3bvv4GsfESO4RpYOk1QGWZ+iLZMoJpMwoZu3nexErMbu1TdcuhINt+rW/bJ5Ai5Pg304pF2OlAhRR040c+/YbQn23iYSMtZ942k2dqUwZr7oSyS+8QJ9SLb1TGvIB4lt76/Qac4bCE5nQMJ/COfnGSGq1I/P+m+hK5mh7QXuE0Q4gjlAcmwVQlMALUr/zgXbuY1UbCQYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WowxVs+RZN0fr4hgO5gs5LKYu6e34RGDMochP6f+uWg=;
 b=PIEHCVUR3YbsZZoIea+Eh3KZSwgOKR/yE0zqLEj7P3Kwa0fzyyqxpsSUynZCKo9cJh75BYmlRuW+8gJmms2iPsX9JWiuJzupd2eyys7Mp4dNQ8mTFGmSqU/miwwkKvJtO6ZN/UGaa3iJ4rIWvkV9+lXSaKN4zxWVMk9mQeH6Nfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3602.namprd12.prod.outlook.com (2603:10b6:408:49::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 14:44:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 14:44:42 +0000
Message-ID: <a9ca8493-5fe6-4271-d551-284b99549664@amd.com>
Date: Mon, 18 Jul 2022 16:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: Fix comment typo
Content-Language: en-US
To: Jason Wang <wangborong@cdjrlc.com>, daniel@ffwll.ch
References: <20220715052017.31633-1-wangborong@cdjrlc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220715052017.31633-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0138.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec33401f-ceb9-4c04-15ca-08da68cc0cd0
X-MS-TrafficTypeDiagnostic: BN8PR12MB3602:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I5Xrjwt0m3p0r1hEQ+MyMsd2WRi1/O4dU2uc8rtlmtuy0dQuKHmLH92lBVVXVCpEhIIRYVizhiwy2VFkjI8lfQZbAUi334yBhhZjRgWI2pUdPqn7LnQvSMJOU+CF+to1eUFw0fRjC+J0z4Jmier/bs0+qEKSvTUbCrg0aZfI79GLaKm5TfyJDXfYq2b9RrOV3TMIK/T1dcQ3x8PlsysM5l2ljuj30EJkaI2kqyTbJG7WpmJ2CpnFcR//7KATGsnzJXidcjoK9njdjPO1UHlqRhuVie3HCa8r8NA0VJLrfNkdvID8oyhVu3gG83n9Rwi2jLAOOEDUWMeym8kLsmcHPWQMcHQjIt+xJhNWwifdI3Lk0R7Voj+5NDJBj3inYZGM0GWCOJ8rh7nuzQahhptgP++Wyllvvs8rgLLsv+dSrwyffU05qhLzz32dD7UinTQRBffyWLE3Y79kkzWmNG6tEflDjHq6PbpJY/KzqlsZErer7fUfwdFTVHce9YE/Eugqu8G3GutF9loyM53aBZefT0TTIhammpTnXgQvvmCH6QdoQAmO2YfU9pEpTQeQhUaA8WfVIINrR3FKPSeTd7MXXQO0gpkBzyNjRAnGMeqrPLSCQI89OoTLBm4y0IaXKfs4BDrJkJNe22yRvV5x83Q1tq4KASA6kUXMgdkzlcFGFtBlVJhytUjoYjk4KW3Y4iRGR/n63pjhN3KZkI2zIw32rwIVTK8Ti5GNcH5zeCAEEIZ1AmwZeXewgk7Q8XN49Let6/+ukqa02F53LbQMkTwNom8ca8a3/G/qcdow0wppf3sf+bksDEMCCV9fKIp/NJN6ZmYETcWA3hFXrMt56l08wTXK+vg7NaU5xwUAAp9e+7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(8936002)(5660300002)(31686004)(8676002)(2906002)(86362001)(66556008)(31696002)(4326008)(316002)(36756003)(38100700002)(6512007)(6506007)(6486002)(41300700001)(6666004)(2616005)(186003)(478600001)(83380400001)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ArSGZxNW85MCtlNUhLdnNEQ29pMFZKRFRCc2NZQ2pRYzJVSWI5TkNkemF2?=
 =?utf-8?B?bnJ6TkdaamtqSDJpS25JOHZjakV3dUtaTDh1RHR3N1NxQy9aekJzZSswd01P?=
 =?utf-8?B?WmFtWmdSUzYzc0lyVGRnbU1JbG01czMwUHNHdDBMekE2czRNWkl6RkRENlhC?=
 =?utf-8?B?Ui9XZzhlQXRqVytMRlBYSTQ3ZFpETGxhSHQ4V2VvUmcyN09xRi91V0RZaVBI?=
 =?utf-8?B?ZlpDLzdvRTIydmtkK2xlZHlCVDZ5ME5jcFRCUVFwSmljME5IWjFvWHBGM3NE?=
 =?utf-8?B?WkRzWVpjdDZqSFVzeTFFN1AzbDhocWJuSFM2MnhoSVczVjVuaGdmYUhPRisr?=
 =?utf-8?B?N0o0OU1vc0VEVEhyMEZjOXNOemYxOW9VYm9hNmtBTlV2dnRxWUZ6amszNDRU?=
 =?utf-8?B?OW11cG0zQTFBV1UzMmI1K1dMZ2taQUN4cy9oT3RwQklQUFBqT1pFcW1pWWta?=
 =?utf-8?B?bzIxR3ZxbU0rTVREbGsyeER0L3I1RXBKcXNtRTluVU9yTmo3d0lRMUZFZTZl?=
 =?utf-8?B?am1UZ2wrUVBrVll1ZW1hcWpuQkZPOVNHcDc4TExzS3d4dlI5NFhSbjhwZ2tQ?=
 =?utf-8?B?cTIyQ05wZmt6Z01XZlhUMENXbXpnUmpOUDdyd055WkFza1RvYkpVM0tpNitS?=
 =?utf-8?B?cDM0WG94WjRMVVkyMFFRekVsRnZpbG9qcVh5ZmdHOTcwOEhaMFdibzIvNW1X?=
 =?utf-8?B?bU5vNFJXMTB2Z0JnZXEzZ09HZHpZQ2txYmU2RVZGbDdEUHBadXpZSU9HRHRO?=
 =?utf-8?B?Q1FkdGZPd3hBSy9NcElMOGs0c0crZVFDZS80c2dNamw4RjZ5QjdSdTZJcmhr?=
 =?utf-8?B?bEZURDBlK05nUmFuNTFyNWJ6c0k4aXFFVTNwRUV3cWxkMTR0T1psaVpVRWNS?=
 =?utf-8?B?TmUxeUxqVkJQRnAvKzZ1QmhubkNwa1VSN3NBL3FLV296dDNwZ0pySGpUVEdZ?=
 =?utf-8?B?eE0zVURrRHFlTUhVRGNrckxlY2gwUzFCNXBoTnVxSjJuKzNpakx4cnEvbEtI?=
 =?utf-8?B?V0x5S3lyOU5PcloyTFJHL0hMSVIrTkdEeW02Kzh2aldmOXVZS2NlV2UyUnhT?=
 =?utf-8?B?WXhzS2llZXNjTnJONkxmVlhNbTJUOFJQQmNieWFGVWh0aTl1QWx0R01kSTd5?=
 =?utf-8?B?bWF3aFpZYzRzbDV4dmtGNHg2UklTQVlRc09aNXQ2b3U0QnFuSjZRMjFmMTJU?=
 =?utf-8?B?V3lVMDEvOXpFa2FNUmN6a1daY3hiTVliUmZ5a0FZN2NKY3JZY2xCOTVJMHll?=
 =?utf-8?B?dFVKeklhckxtTnBWczQ5L3pCN1g5ZlZxUXhGTDZoSTJyTlZ6MWNjb2FIU3dU?=
 =?utf-8?B?enRmOHdoU3VjT1VXNVc0RXdwYU11ZTUveER6cWk5aUlJTXJlajdUSjJ2aUNq?=
 =?utf-8?B?ZnNZSTFmb2djYm5KMUh0NDBxY0tsdVV2M2VCQk1MbGNMQngzeGFxaC91eDBS?=
 =?utf-8?B?d3g3cnNlSXJRbWl5QnVQVDZYNkltRnd3UnNoYndhUG8zZitDb25RdTBQdUFN?=
 =?utf-8?B?M1FVWHFQMjRTWUw5L2NPUWo3ckxrTUZ5OHdtYU5haitBVWMwbmxiQ3ovVlhL?=
 =?utf-8?B?R0h4aWtPUXY3SHpnc3REREJSVHNlVXJJSDNBRU9LdExyektBZGNRM1A0V0kz?=
 =?utf-8?B?eU0yLzR3V0lvKzU5SGkydjRPWmFJUTJQY3VJOHpCYkhoWi9MenpoQWNCRmNh?=
 =?utf-8?B?UHFSUGhLeXRwVzVCS0xzc25POXNwVlVVT2daWGZJVm9VQmVXNndEZS9XSC80?=
 =?utf-8?B?VG9HWGtkdGF4aG1aRnVOVTZZbTFMdklvMHRDTW5QR09pSWxKcVV5RjB1TnVo?=
 =?utf-8?B?eU9ib0owT0hzSUlleWR6TmJyWVpCYWp1b0tkVGIzaDI4NG8vU3g4b2twS1VJ?=
 =?utf-8?B?b0RYNm1xdnNYTVpzdjhWTkxyUGdFNXU1WVFoQktZbEJBdVYwdzVNYXBXVS9B?=
 =?utf-8?B?V3ZFajZvRFQ5RHhEVTU5bVhRYlNoVEJXaWtkY0Jjckg0TjBiL3p0WU9CQmgy?=
 =?utf-8?B?WFJrSC9lWStPTjUwQWFlRDB1ZDhDbVBJR0xOVFVKYjZNTG53TlhuM3dtL3Zy?=
 =?utf-8?B?VzU1UFJXaVhnNVlHYVRtNGRiNjQxODF5VVMrWXJmcDBvN0FCaXdYNVp6ZUhU?=
 =?utf-8?B?Z3oxSllLMDlFWlhla2ZNQnRjRzJlSWNEQkFBSE81K0ZIV2RWekE3SXhncEZR?=
 =?utf-8?Q?Oj9hXyJOYqhClgl9y6movFxJnTQmNJZV6OMZ+V+08UHe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec33401f-ceb9-4c04-15ca-08da68cc0cd0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 14:44:42.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCNZvjTiojOj6S4FRSJt5U2gS6h+CWx3DzalXTynAprC8X98YVgkcM8acGMFaO3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3602
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.07.22 um 07:20 schrieb Jason Wang:
> The double `have' is duplicated in line 696, remove one.

The subject line is rather confusing since this isn't related to DMA-buf 
at all.

Please change that to "drm/radeon:", apart from that the patch looks 
good to me.

Christian.

>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>   drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 84843b3b3aef..261fcbae88d7 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -693,7 +693,7 @@ int radeon_gem_va_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	/* !! DONT REMOVE !!
> -	 * We don't support vm_id yet, to be sure we don't have have broken
> +	 * We don't support vm_id yet, to be sure we don't have broken
>   	 * userspace, reject anyone trying to use non 0 value thus moving
>   	 * forward we can use those fields without breaking existant userspace
>   	 */

