Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434D582A08
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 17:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE5AA7248;
	Wed, 27 Jul 2022 15:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C95A7445;
 Wed, 27 Jul 2022 15:54:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1OGKSNpDzv9BkZjjJHg6adW1DR7O8P7gMB4Ec4o8g0EvDJuZoINaIEzHtCOlV9PRCngLTL5o0YfaftOA+O8uJ6dFUqeE5PRm0ir+2ZxEC+42H5Faih7svMQGwlSx47pGz9mX1Z0qK9+UGZiPJ5wt5FqhnJPtA0/RPs7MrxS9OIABLMtnXa+GGSzeHOBFMZyF+gNiOwpxW10iwCPWDVUPvvo+45XKMpsAdxsbVkufysPL2o+a/D7/CxSZr4mFh7YpMjY38XCkkLmfAp7448Xq6fs2hEdFDRvvukLd3ZSAfCMY8YLHXxTMBhVMNJKu/uSl5No7AMv7PFIEmKErfrnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Zq9C5Qg5y7VBqG3qWqoTnaOtz1AF4+PxDUGZif4V8E=;
 b=Yds24mD8KuWc2nHa939Pmq1VJ6Pw1zaGAm8Np3WO6AIOOkqWvTAXHE7zqNx1xyfD1wFAKfR1teqFTSEauIZwr3jDQqQKBOfJ9qP7Z1LNbG9sbyEX148GCdfBGQG0TIzfHrB4Zlw1korERagiLJ5uGzbLKl5SDWS38E25KRgzasmvLejo8ngBauNCFGoovXa4uXI9fPmRQ2xEtdXLvxiaR4eeg/cyqTf36aGCiLcsSRSFz/N7/x7XVjLNqzhZHlLmWPifieJ8U42qHGKyoYA+Af/Hj7hUpocAIkHHv566+1UIcNFbJDwG9ByrEJ4xHld9+s3acYgceGsbnQRJGCJueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zq9C5Qg5y7VBqG3qWqoTnaOtz1AF4+PxDUGZif4V8E=;
 b=lO4NIKX4FjUZ55IgmxueBg/hLL1tpvB2szgTEBOLRdDGDJD8p3xLzZobRXDni1Edc3iTL7i/mA9oa/pZMalJsSAsbRICn4ulGa5uIFEI4r2r7H5X0n1+w31jH+4D1orXTajgbHZc8CBqKcjbYHZ2x9sc2kyvys4yHx84AcOBtfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SN6PR12MB2798.namprd12.prod.outlook.com (2603:10b6:805:69::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 15:54:37 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5458.024; Wed, 27 Jul 2022
 15:54:37 +0000
Message-ID: <232fd849-51a2-7092-756f-cb34b460993b@amd.com>
Date: Wed, 27 Jul 2022 11:54:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next] drm/amd/display: remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@linux.ie
References: <20220726222809.64709-1-yang.lee@linux.alibaba.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220726222809.64709-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0025.namprd14.prod.outlook.com
 (2603:10b6:610:60::35) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c53adb60-d0f6-403f-1c00-08da6fe84e99
X-MS-TrafficTypeDiagnostic: SN6PR12MB2798:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +OUhj/BHmfikOITrGxjHaU/PMQ/ng0P+DvmeNZjSo9RKSl+QhxuATjUXwBZ+DHz72KjMIRKUP+K31nWBnb4jty4eDt6rJYZkzokQcrPTx4cMC4uCvvn9xaBC3TBby0/x4iG9TKVQiVqm2l2N2hfzcQvMRXfqzJ8MGOpsHHRcm8RO4RzzIKNwoPpG9dleenbGfIv07m+hob8u527nBh//3VLLyacyuVX2GTJIhghfK8UQ2P2rQq2GEZvjQ5NniLldVRm7JKA1DU56zMBO+wmE/dbEtLsc1zvicP0kp1nkffafwbxnzj/+Ovy998tm6yQQos1ZpvUrtvllrKtUENNngJMdMTMtuCWUgv80YOajn14cDqRECNqEZyH9SUtYZjTD2alLkpnsItbU2gp1Ie1FH2xo2IMinhfKDyHcGM9TCUdiHVELBR/RqyUW8f8qOlQVZY87PmdC+n+UFYYhVxRQX0mkRaDVuyywh/499QGYDtpA1D7sfjTk2MpWDclP+6kcvsXb1CjtDG5vDCUWuCZ39CsuJr9T0DdvITbvHHM8IN/3CWLgvc1FGzxdpxqOxoBkvUrq1MLHKc25A5Q9hnxEI/E2FwazUorF0XBOLHyABNWc2oxfnJX5zsJxzDouywRK8brspb5tylMtyPpAnYsP/BiDG0m0zoGjAYxjzEh7N0W2qE9ML96gZIzvxnvIZHIxqdX+fF/Zs2B3OSDlOcNHp6yiZ/Rij6LJftqYE1V34ckDa2N8c+2RbBlVcH8uGxVGaEEuRfDg0+xPf/TYyRvIvlrHO+DUMWfxwKh6zjJgjSPeLtmAGekGE7BMHdoudwY5pLfloJX+ZCM47KfO3GLdwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(8676002)(66946007)(8936002)(66556008)(66476007)(4326008)(41300700001)(5660300002)(2906002)(83380400001)(316002)(31696002)(86362001)(36756003)(38100700002)(6486002)(6506007)(6512007)(26005)(2616005)(478600001)(53546011)(31686004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkwwRTFCVWx3aFVaeTlvZm90eWV1b3JzVU1NMVBWV09pM3hITFhxZWMvWmVF?=
 =?utf-8?B?cnhYUm5aK2x1WVo5SmRndEN6dEV0TFZlSlNjTHEwSE9uR1dxZVV5RUxQT2oy?=
 =?utf-8?B?dGlFRDFwZjlOUTNTKzdhY1JpRURTSDhLUVZXeWEvbk50QTZJd0RqZXJRbjZp?=
 =?utf-8?B?S2E0Qnlwd2pnUVlZQ0xuS0ZubkdxQUJUTzBHaHlhcU5PWlpXQlpTai9VelFJ?=
 =?utf-8?B?NW04Ky9XaHhlUFdNQWpVMEZMSGx0Vm9tRU91UE56Tjc1TG1KU0dEU1R3OE9C?=
 =?utf-8?B?eDZINFY3anl4NHN3dXFoUzRtQm5FVFBSV29IMEZUeVdPSGdSQUlISnE5cXVp?=
 =?utf-8?B?eFk1ZzBoWkZsZDU5N3Jrb1N5TS9RcFpBanlCYVdGb2NhbVE0bHlZeVJ6anZ3?=
 =?utf-8?B?Y0tiUlJ6bnF4ajEveVJucGpVblRFRmJpQUdidTJ2N2UzZzFxWTFWU0VCNkdl?=
 =?utf-8?B?OTBCSWc2d0VtekY4eW0vSnJCdGd2UE1Ua3Q5NTBZY0d6V1o4UFYvWVVoVnd4?=
 =?utf-8?B?d3hjU1FSSmw5eVcwSGVJa25zREM5TVJCRDNIZTZRc1d5czRXWmMzM2lTUThU?=
 =?utf-8?B?bXF2Y1dkblBDQWd1TW9hcVRFb2t3TUZGbSs3S2FCakhNN2txc0NkQVB5d2NM?=
 =?utf-8?B?Z3doelovWFl6MFFvVmtrVWdPSld2UE9DbDhUUXJydkVwcWtwbHl3TU1rZzlt?=
 =?utf-8?B?U3R2UUlsNzdvN0tjZXRhOEpQL1Vlb1E5WjFrZTBiNGJ1OUp5Y0tjV21GWUVO?=
 =?utf-8?B?eUVTdkxiS2xLTUdHNTBVVUZQY1h3L25TTlp1eXZzVVhDRkJpdmoyS3c3YkJM?=
 =?utf-8?B?eEhHMUl4WCtoeFNrMWhCWkNZblVuNGltM1hTYmVTU2FCUytDWEI3UXdDb01n?=
 =?utf-8?B?SEZDdit2UFFKc2lkckJwcUtOcmhVMHVLVHlNeDNNMitUM1pWRktZTjhPMCtw?=
 =?utf-8?B?NytYZGZoUllhUDA2S05tRERMSURwQlhXVWhaQ3pISFYxM1BMWVRtdnJBT29K?=
 =?utf-8?B?Y2VsdU9wTDhBQVNDQ3R2aG9LYzBtd2JiRTlPREVVQ2R2SE1WelY2M2JKWkFV?=
 =?utf-8?B?T0E0OFNCbnFjOWF3WUpFdEJVeTFnSExVN2Y4cURzQzdadlg3c29zZTZubnUr?=
 =?utf-8?B?WFdsLys5cmtjT0dNUjZqa0hpYnppR2lrbFFMWkJDOGdzMXNIR2pQdWJ3ekhz?=
 =?utf-8?B?d2g5bTUxTkZNbVpoREQxUGc1Z3NJeHIrQm9IbFBRbVE0QUFQODg5M2gvS0NG?=
 =?utf-8?B?N0VKU1EvQWpwZWFPTEo1Wm9OYVZJZnlyNlN4eUxVTlF2bllsc21HSG92VVk4?=
 =?utf-8?B?UktzaWo4VHM4d3JiaFR6WS8reC80cjFDN25tVUhTNTVDU0RNS3M1WkZhNTZH?=
 =?utf-8?B?d0ZpSlFlSHNyQ2p1bmg4ekJjUjNacTFMa3hpT0MxZWM4aTAyczJoNS9hSERB?=
 =?utf-8?B?NU51SWltcGJIT2d4bTQrczBzN011OEZ5bXFNSG9ZT1pnU0N2cHJ4OVF5QUFE?=
 =?utf-8?B?RVk2VzEzRzJRdnlWRkJLRkw4RUNPSFJyeVc2TG4yVVowQm51RWVDUHFpeHhi?=
 =?utf-8?B?VW1lcWN1UGx2WUJoa2Z0Z0lFNk5sblU5ZHFjRE4zNTlGSzVsd2QyUElHeDVn?=
 =?utf-8?B?N210R1FkdUhhS25QdW9kWENxOFNWdGVrV3RyQUx1Mm1oa3c5aTVlVGdsRnZK?=
 =?utf-8?B?d1pZVmZUdlJrcEl0NDQ4eERQS3RmUTJMYzhjdTg2cXhIUjNhN09tanl3d1lx?=
 =?utf-8?B?SUFNb29ZRXFkYmNuU1pXVitML2ZxRVY5ZUJYcGpSMEdNa1BCWE4xRHIxd2wz?=
 =?utf-8?B?dmtDUWU1aTRhd1AzRzg5NTBhSFdwWlJtc3M2N3BaSUpwK1ZzNHg4bDhMM2g3?=
 =?utf-8?B?WkpCNVY5bkExamlxMUpwUisvRC8rb084NFJRUElFTTA0dllmNmxxRUU5cFN5?=
 =?utf-8?B?UU5ZQzQzaEg3UlRjMng3dlpFQjJvWWNCUjdIbktDZUk0SHFwdHdMT3g5NVdC?=
 =?utf-8?B?TGVkSHhNM3Y2b1dmZXN0M0QrQkJXSHJCS0M4UmgxZVNrTDFCWnFFY2x4VjRT?=
 =?utf-8?B?UUZvWnRVeTl3U0JXUnBKamk4aThpVFhnaEU4VTYvU0RVSHVpcXFLVnYwclBy?=
 =?utf-8?Q?IkR+3qLIIEgLlLu6iYeVlPs5m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53adb60-d0f6-403f-1c00-08da6fe84e99
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:54:37.0755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POrwBhorBMG1cshBpTlhh7qK8soSMHzskoBbiFSC6+jKVGZ5MXe+Pon4ByjzdNMguphQMHjVGzd4eAhBWcaTzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2798
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-26 18:28, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c:2344:67-68: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> index 39428488a052..ca44df4fca74 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> @@ -2341,7 +2341,7 @@ void dcn201_populate_dml_writeback_from_context_fpu(struct dc *dc,
>   				dout_wb.wb_dst_width = wb_info->dwb_params.dest_width;
>   				dout_wb.wb_dst_height = wb_info->dwb_params.dest_height;
>   				dout_wb.wb_htaps_luma = wb_info->dwb_params.scaler_taps.h_taps;
> -				dout_wb.wb_vtaps_luma = wb_info->dwb_params.scaler_taps.v_taps;;
> +				dout_wb.wb_vtaps_luma = wb_info->dwb_params.scaler_taps.v_taps;
>   				dout_wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
>   				dout_wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
>   				dout_wb.wb_hratio = wb_info->dwb_params.cnv_params.crop_en ?

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

And applied to amd-staging-drm-next.

Thanks
Siqueira
