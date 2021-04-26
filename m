Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E636B2D6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 14:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DC66E82B;
	Mon, 26 Apr 2021 12:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0CB89F3C;
 Mon, 26 Apr 2021 12:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2Qyb0Nc2k2pD+ZSvLx+FurlZasZ6sFyeaLM9VP9P1dZconM5x3OwbIkers3QxyFxOkQ+cmzodFfbkZETQy4v46iICciDdOkOW+yKavWrr7x6clNMQlBQQRPKJ022njGRlxpQ8+hNykMMyvkvCJNESxx6oCjEpcd9hSAg1Wugju1FjXMubXDaTEVIpN5wNNbf/aScECbDV6daES0akPAanjBjKPYVaFEBHLZ7D4whIa3ED7BCdB8hH61Qjooc+n6BoTdOISPJdHTCtvEBQdp8+3jcNN+k5Yo3QjQuThWqrrXX2S9B6EQWzynlqjr5o92ZMCl/0VX6NNBwXCYlbRQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7T72pKvXFV1eQrIIzFdrRrbVYOZQWfBovVqCPpHgIw=;
 b=kZhiNSszg0AIjCGe0KgZJll96PXyuBx3CsaqQCsmwalT31y9Aj8TKsEqm3Eej5LLWuiSPt1KCpgEZvK1LyhNMlQn6lJt09fju2hEyniwfQ4r4jGFTcSI+sydeuu3LAslFyH6NwrIgQcyhDL18ZJOtj+UHksCuQLf7PSG2tFDZNEb7ff3Kplte7Vn9BoFgIyM1Q5vF/XbTLRGk/vaMYOb5bz/P1u08mZj8b8ZRI1Px3C7YqEt7LA2aq1I3lSL2cwvVhux3KsDgGx0HSKjSjp2X7jyMDc/cA9Uj2gDhlVoPV6lxwlAhFzzfQwXUGD37Bh2dcaxDsImh1Zk/HMge7C9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7T72pKvXFV1eQrIIzFdrRrbVYOZQWfBovVqCPpHgIw=;
 b=tEBRBQvRK2QoTPJDs61z5RKMOO4dk1CCMeuyelsAsG+falx/0r9DC0iehMjxSHtTtocxaKh/hPICD1PRM58081owO2+hUtwnkAW02mnx2oLBba47Kvp9ez/tSp8+7Ic4G3jFP3tzcm2wy+9uFyub4ZYEJqHGaKcZuLb42Vr5IgY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR12MB1543.namprd12.prod.outlook.com (2603:10b6:910:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 12:15:48 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 12:15:48 +0000
Subject: Re: [PATCH][next] drm/amdkfd: Fix spelling mistake "unregisterd" ->
 "unregistered"
To: Colin King <colin.king@canonical.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210426121304.83256-1-colin.king@canonical.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <196cd921-6078-fb64-682c-5962310947f4@amd.com>
Date: Mon, 26 Apr 2021 14:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210426121304.83256-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [217.86.97.47]
X-ClientProxiedBy: PR0P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::21) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (217.86.97.47) by
 PR0P264CA0153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Mon, 26 Apr 2021 12:15:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ce0fed6-189d-487a-83e6-08d908ad0642
X-MS-TrafficTypeDiagnostic: CY4PR12MB1543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB15432170FCF45D1CA828B4D98B429@CY4PR12MB1543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1/ZbYEmqPSpyx13/JR546odn/imTUuTQpq9UbmmCBck3XEdYKxTy7HJ5Q3OybsRqaafpYnc773/Svs4BFe/p8IdgaKCELPEHMaCn91Dd+8ku0PTx+qVWUQP+T046JB+ZMZcwh9ME8jlE8zCQoTQA7iOLRgCn2O2fJ0PDZc7yuHcGfkN8DBcEFTJPgxtxtBfYE4KAv06ocdEPCIFv9tvnre3oJY9u1wEJbcRPBtOjOEnQNh2jWDQq7KbctASSkh5D4O5B92II+5R3pmEdML+KjLxwZQk6CW6sBNiBgsj20zckjMXQsWLl6j8VDYuNYxpKx/m1aVnq1DIFgeQBkH9xhUteml01LIx7UAP4i7M5u9ppFlhN4RpFy3A4kkw05x+bzaIuuauANXNcfAMsqTjnd09NEoTUSEto6kMdMpEISV/8qtXyVB0DXXRQ/rigPK/fkxL9+4QqlD4HAJIUxy8JZQDF/w7uBcgXmLasMVBCLJKpLu3B1+fxW+ftYAHsFgScheRy6YYAnhRwkB4veg2XZuspHdniGLHBDxJU4m/f/n9YDDalYf0sojiQUfDOAkThlCQbpnYR3dXJ5TNJwDp6vBNDdetuGvpv52HhhVhsYYDtK43d/v94QE3HUeRC1VISlsEe+TEOOZeoAZ5IRBieRUzWN6GhUyUgH7oMByim60nVgQFl1wblDQGHHh7Fy89Yt087P3MsJGiIuD6s/DxUHrUvnoD6xC4Y9qKwfQxVuas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(6486002)(31686004)(8676002)(2906002)(316002)(6666004)(4744005)(31696002)(38100700002)(53546011)(66476007)(5660300002)(66556008)(66946007)(83380400001)(110136005)(8936002)(16576012)(38350700002)(478600001)(36756003)(956004)(16526019)(186003)(4326008)(2616005)(52116002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cTFpT2NnU2xWRzd5bk1SbGN3MGJkcVIrbWtlTnNxZm5mR3l1OU4rNGhIMGY4?=
 =?utf-8?B?cHkzK3FtVDlZVTZlN0NNK25xRUo0TkQ2cVJ2RHBRczhSNkcxcytKeUR5WFlp?=
 =?utf-8?B?Y1J4UzQ5M0hWRlIzcEN1M1dhR3JqNUU1Q1BmRE93UU4wWFpGVHYrZ2JzSThq?=
 =?utf-8?B?TmxGMnhlTUdMOW1NNnZZVG8rZlpabFNUZkxlSndkeEp6NXJuY1FEbG1jMGx1?=
 =?utf-8?B?TkJrZ3RUK0tjL1VrSXNDMExBM0ZkUVpxR2VqaTU5TC93WXZHaWN6VUJYK1dL?=
 =?utf-8?B?ajNCM1J6YlFMTFBSSExYY2hKeTh5MVcxUS9nMEZ1aklPY09lV2JIWmxQVTVa?=
 =?utf-8?B?KytlTXd4TkFsNS9EalVtU05xNlVTR1A0VW5yMm1TVE5jZVFVangyY2hBajgv?=
 =?utf-8?B?VzNSNWhFMGtUTG8rdFJQYmxFYUhYaEVYSkt0M01uT0UxRGY5b0dySE1lcXhT?=
 =?utf-8?B?K29RUnRJRWMvRHdPYWYwallxYVNkalMva29FSzkwVCtLamdjVERnN0VVL3NJ?=
 =?utf-8?B?enJ3ejhJOVRxMFRDY2Rkc1NDeldTcThlN0Y3RmFkWi9tVHFoalhSU3lqWExY?=
 =?utf-8?B?RXRzZ1RCbEtUcVFCeTlWOW9xcWg5RTRiUDBHRHVNNGxxMzdJM1dCekxoWEhJ?=
 =?utf-8?B?R1h3c3c3NW92UHhuRHYzTTN4dlhYWFBrL3BsazFsTHBmWGpnMTBJZnliMWxM?=
 =?utf-8?B?bFV5S0hBeHBteGtxK2N6VjJjbDNsVjFwLzNhNk9Db1Q4aUtUTFBCb1hqSzBI?=
 =?utf-8?B?WVR5TlB1SmJzNUwxZ052Rm03ZW9EczBpcWFyKzFYMmpGcGU3dldrd0NWVDhP?=
 =?utf-8?B?SURweWN5akhhZUUyblVGb1NZR1pORG10Q2lkSXpyY2RuQTBlWnl6bnZRbzRN?=
 =?utf-8?B?ZTdYTDBjdE9BNUhQenRBTWlNKzZYcmFULy9vRWhmZmRzbGlnQ1lsODJ0WFBR?=
 =?utf-8?B?Mm8zY0l6NThsaHhHYUFCVzhyY0lDQnJWbkdWWTY1SGdoK0QwdzBVaTJubDll?=
 =?utf-8?B?bDNqZmVwbFRTMlo4T0h5WDBsRVc5bGF2RVNjMXo1Zm9LcHpoeGhnWHl4T3hB?=
 =?utf-8?B?Z2d6b2xrQzJ4clNDZGRhMU1JSnVES3lNSEhrb3UxeUFQQzIza0pVWlgzcEdj?=
 =?utf-8?B?RG9SQ3R3dUxsVFF5cnVwcXZFV1QyK3Nrc3FBRjE4Si92TktVMmNXbmZBenlv?=
 =?utf-8?B?YnJncVpPcFNINkdJOHdmTEw1TEp0U2dZbWFWWlFYZFRwREJoL3pBREMzSUpJ?=
 =?utf-8?B?VXhIRFZwaGhBbWZiTDhyNEhiWjRad2lBM1I4d2FGTWtxYlFKTVR6VzdoMTY2?=
 =?utf-8?B?VThOQWdUVm5FNUpiM0grcUtERk5COG9qRjh3eWpkaFpGNzZmaDV6Ulg1Qjgy?=
 =?utf-8?B?TTEvL2dUaFUzUGpjRXo1OTl3WDd1aEtqdjRVUFNETUlraEk4MlpNcWZMU0xK?=
 =?utf-8?B?OGt6dFc4ckUrNU83QXdWS2lvQlhMVzV0VEFCc0JOa0JkaXJqQ095YVJuMWhE?=
 =?utf-8?B?aEFSQkd5NWUzVmdmZXB5MVFRMHdlS0VReTMvamZXQmRYSHBueU5meVYxZFN5?=
 =?utf-8?B?OWhuT2syZjhYSExpc3lVOHNPUUJLclpHeVJON0U5REVGZUtXYTVEQUVSeHNO?=
 =?utf-8?B?WDNUc0JRZitRNFN5bHlPL09SWDc4bTIzMDBRT1R5MjJ0V2VmN282cjFyajl6?=
 =?utf-8?B?bnIybW0xd0VDK2wvaGJGbUtkQzN2T2hJRGZaQmdVZkdnZjRCREJOL0NRcm8w?=
 =?utf-8?Q?0Qpw2tAiexWEqTRFYh3yPmkpDmr9c/i2drDjmmi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce0fed6-189d-487a-83e6-08d908ad0642
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 12:15:48.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvypGcNKko+3ZGf3a/LlFpYt4zIBnI7YAWxFANE03hb1NBD06GB21gmb2ZCWB6V02FteO4ktGI+WBvruurGZrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1543
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@amd.com>

On 4/26/21 2:13 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_debug message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 4cc2539bed5b..e4ce97ab6e26 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -2286,7 +2286,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
>   		}
>   		prange = svm_range_create_unregistered_range(adev, p, mm, addr);
>   		if (!prange) {
> -			pr_debug("failed to create unregisterd range svms 0x%p address [0x%llx]\n",
> +			pr_debug("failed to create unregistered range svms 0x%p address [0x%llx]\n",
>   				 svms, addr);
>   			mmap_write_downgrade(mm);
>   			r = -EFAULT;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
