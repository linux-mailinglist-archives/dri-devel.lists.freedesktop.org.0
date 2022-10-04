Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6365F45F1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 16:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702B610E717;
	Tue,  4 Oct 2022 14:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4728B10E5E5;
 Tue,  4 Oct 2022 14:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmfvxgLnRdFs5lc8T99POzt94H1XVTSx0aSrxwkg7HvQH0pod/NuiCwLhPDLHj5S4Rojahfzd9AhbtlVnbNJ2/J41+y2ME+phkY+0JJ7bSGVCUYztX9M/duXNW4yAxBUwUhUSpqrCz9r8MsrGyH0ZKlgun+B8A3ytko//Oyf2h41FCUxt9V68e7DgLBqeDUDA3bjSavMqiMdxMLohuN0y9+/V6Ytig0cBjN0Q/ubuHQL20sdFd40iVukm2XC0NszvTEdmkTF5pLM03HeqRmvW9CBN0BOKSCRhY1SLk+0tEngrZMQCAenzxcoTCECmxx32fix2XhT7fmCjD42TAXcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crPQ7PmXRwJAsvNU5GJgT++63k2rB78au4d4zlvngLo=;
 b=L7vPG46wu5BuZ7YfrXuItAnvQzhOiXg8/GFZn7ca0wcyPq0BohduHle8Wod/1+cKlkBH/+utLCwe6ijtp3BsfjZgn+AQuNiEWHGBPEsgKxrhNYTivWf509CrcGMqzGwxh/fyefWYqmIHmS1xzg9TkhYs1le7EN2uXYbd0OdFU3z2d/UKX/BgSKegp01O72bmD/S5mQh1+lg8e5SCM91wFw00yeoqNupo1f2m9SovBknUd976IRgY0tQOyO8hersIh8KLLA1ilnePW3MfubQeg9GPELqnoEjzvQmKWNu49hQhOFZXPgAmNIV5u9bn6tysLYygBWBgGka1kANRH3Gvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crPQ7PmXRwJAsvNU5GJgT++63k2rB78au4d4zlvngLo=;
 b=SwOWQ5NAIad1EozZwhUTLU15WyZhOQQP4EeaUijP843XO/GtGljvrv9UBjQPMMiV0/9LG6m3aCICneP5vTt/+ZHyakL47MX+LFydcsRfyIliBONLFBySzDFFiHut53TnA14hLNjzLR8NtLekGABbNOJL/XD1pfnuxBcwjsyFtR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by MN2PR12MB4504.namprd12.prod.outlook.com (2603:10b6:208:24f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 14:53:15 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 14:53:15 +0000
Message-ID: <a80f39a1-6df5-cf4a-10e5-be46db8a778f@amd.com>
Date: Tue, 4 Oct 2022 10:53:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next] drm/amd/display: Removed unused variable
 'sdp_stream_enable'
Content-Language: en-US
To: Dong Chenchen <dongchenchen2@huawei.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20220930063827.1835856-1-dongchenchen2@huawei.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220930063827.1835856-1-dongchenchen2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:208:15e::14) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|MN2PR12MB4504:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1618a3-5604-4d78-e7cd-08daa6182a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SVaLxKz5Bh914Mkg8LP8W6Jz9yWZN42iU1KHfVqCVDkUwksNl/OEEm7BL0wXQfiQMiQfrci+NH0XfwvYi/e+wPZPVfb+NSRJB4CGHLlRoXtDLzIckiKxf8VpkwGpYkUefEAAkm9aCuMg5+wv3iRY6UYZMO7uAaUxB522MkhZe9L9erX9JWe2gr374D0imwFGkVSPq0eGN9opQoEisEhaf8KHMbfVpTEghir1N+VvdkZ/WFfn0Lo2pxydXLzm4+pVlnCh4YS1gkuOFt+rPM9iAc/6Ykk5LzOBIYWcFvkMhLhQ97PE2LiT1JBfo7r1yo2IIjX8xsIjA2pn5LTY3eZglC+FENp+fQY4F2zPA/wnMhl6LRkqe+cgVMk9CQuP/YwrUjwwgf8TTnvjJ8dPC5Gjc3jy+yCt+LLuKavNVJAM0Tm0IeymCkJiVgJ7zcMamb6nTxBB6VDDhZn+Zdxh1ah7fYIZyy7achbbk+mOfq7Lgv5HLEdj2CGcDeow98tSwP0YNFYvC5y1vA+D+BZzLcM1hnEEEdFy4/vwPzApH/7/vd+dWglJD6/5kzGpLZN5tGSVD9rdwFE5wuY73OY66P0N96Xh4s5biWFzVh62TZHTZ32tvn/4UfK4HBnW0Kc8OctU+uV/1YP7in5hBoTwn3TKonchGbpHhlbSbSJTEbrA7JtmWOXzKvWSLMALOjhhwRDVpd5dE9Fgwo1Z0hVgQjKVTUmUJVy09l89BW/JCEe/khHvqjxnCFwQrHFwZScpQ6p5kQRfxAHu89BJKtf8Av9VKSoRD6yKPYcGo1Nacv+ycyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(8936002)(6506007)(6512007)(53546011)(86362001)(5660300002)(41300700001)(186003)(38100700002)(6666004)(26005)(36756003)(83380400001)(2906002)(2616005)(31696002)(316002)(31686004)(478600001)(6486002)(66556008)(4326008)(66476007)(8676002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFQ0T1lNTXZWNE1SV0poU0VKZ2I5ZnBkQUtkQWZWVE12b3ArKy9Oa0RtRTJW?=
 =?utf-8?B?ZUQyS0lWaG1CS3ZyVko0ZDE1Y2ZIT3lRcjFycWZtRWExVzlCSHZMR01jdkE1?=
 =?utf-8?B?akdFOXZmRmpsNXplbXh4dlJIQzd0VHNFaFY1VlJ0R0FFTzZzMVh5ZU12UVht?=
 =?utf-8?B?Y0FTLzlvRGVQWTNtLzY2akEySmYrQkZPZ1JHWWNUNTRlU3U4bmFYQmlLRHVM?=
 =?utf-8?B?cHAya2ZtMnBUQ1Z4SFlubktNYjRtUFdXcy9hYThLTGwwYlA5N3hncFkyTnFa?=
 =?utf-8?B?NGdRb3dYRHo1ZzdrTkJzTjZLQU1uNzFJbk50UDU2TGVLRU5GUWRDeXYyMUtV?=
 =?utf-8?B?ZEJNWmhmdXdMbTYrQWpxYXZHK0VUa3cxQ0k0YVRkdklPZlJ6QlBoUnQrbVU0?=
 =?utf-8?B?bmZibnp5RUVqeTErQjZSZnFNTmFaemhjQzhWTytOQ3p5bnA2c2NvcU1pak5J?=
 =?utf-8?B?SXVXODBBL2J3NHU0YkhKdkVXSHBFc3pvU2NHSVhneDNWWEV5Vm1RMWRlOVRz?=
 =?utf-8?B?RFNkZjhYbk5ibTNVZGQ1S0lsc3BCaDd0U3V4ajU4Qm1XUjUxcStkWlllbWMz?=
 =?utf-8?B?ak9uY3lja00vSHJHK1BvV1Q2SnMyd0IrOWExU205ZjN0RHErTFNJbnFPUVp4?=
 =?utf-8?B?dlc3NFBHUzEwUUw2Rmh3RDZiNWJRcFY3VUV6dXVtQ0ltVzFRekl0d1BLYnVh?=
 =?utf-8?B?MGxwNWlYbFFDR1JQZEY2Zm1nd1M1OXVORWRGSnJqbmgraWdFakxhSFJXU3ZJ?=
 =?utf-8?B?T0c2ZlNmMDdvTFlURlFYQkVreXJFY1JkZGxsUWZIT3orRmQxeUlTQ2k0VVA0?=
 =?utf-8?B?ajZnc2tHTkFRNmpOK0h6Z1R4UkJxWFhiamIwdTVsN3dFcEVQZytHdmtudGhX?=
 =?utf-8?B?cG5NdmJaMno5SWNxQkoraU9Xb3k5Y2NyZUxoTFRYaEpvT2RFRXlNcDlIdU5K?=
 =?utf-8?B?aDdjL2kzanozaUVOTG9DR1hJdUJ5WDZlZWI2OU0zNVhIUkt5clkxUHZBU2wy?=
 =?utf-8?B?MS84MlRSaEp3UGxHNW5Eei9QNE5KazdPbjBMOUtGalZrc0M3NnRFTCtCVjBC?=
 =?utf-8?B?TFRjeHlPTVlTd3JBSDVWcFk5YVFrMnE5SlpBY1BDRnVnWlQ4c1kxeEREWXE0?=
 =?utf-8?B?d0g1RVF5TUlnNzRCemc1MUZGbUowdDdzWVJqMVNybEg2K0RTb1VIQ20rYlB1?=
 =?utf-8?B?OVR3TWRVc0NLM2FkaG5SMGdsWU9WdjBDWmxWYTBsamlUK1Q4R1BFVW13UGQ1?=
 =?utf-8?B?blU1UHdKTGdtd2JBTnN0Z0dPWnNRMVRNZW1ndWd2dXl2TzYzZWxxWDJ4cU5S?=
 =?utf-8?B?QjBvQ01UUWE1ZW1vd2pTUzM2aVVwSmhrOEJYeWdHaEhlTXV4WmV6emEveVU2?=
 =?utf-8?B?VFk3NEkzL1Q2Vmt6dUNvUXAxdHZOdUVQZ1orNDgyK1NIK0l3Y0hEbitCMURG?=
 =?utf-8?B?c20xNlIrMHVCSnBrTUdWdy9KYmF1UHllM1h3NEd4RlFxMHU1RnI4c3JjQWJO?=
 =?utf-8?B?RWU0T2ZTcWFGVFB3VHV3VG1uYndQbmpldHYwZUlYYXNrTjNrUys5RG9NMnhu?=
 =?utf-8?B?VHc1WHAybVREcENTN3RDNjVKbVYzOXlKZmNMSGdEMGxpMjFhQTVtZVRKZXdZ?=
 =?utf-8?B?clNFYlM4bUQ4ZE0zNFBsSGp1dmU2K1JnYnJzZXJBdEwvSEJJS1NXY0Q0cElq?=
 =?utf-8?B?Z3p4ZjBkK1FsUThNYlAxZ0ZDd1VaNENWQU5ENnNiWVZQd1VPdG9sVTQ0Z3k3?=
 =?utf-8?B?TGlyTjRNSG14emdyU0J2Z3dYNkZTUjFyU3NvaEwyRE9sTll2NnA4VUZaWjFT?=
 =?utf-8?B?NkRJNUZueFUwQzBhRjhtL210ZkFVSUg2bFZTci9LMC9MNlVIQWo1YW9CU2VE?=
 =?utf-8?B?NSsxN3hqSWEwcmkzMTVRMFgzWnZDM1c5ZVRGWU9GWFBFNXcyR21PRlFSN0hi?=
 =?utf-8?B?QnVOUGE2VHQwWXdENjJtcXBZd3cxNnR0cm4zYzFrTjA3TFhyRU42Q3R6MWRW?=
 =?utf-8?B?aE5ZMEdJZTFraUlXWkFCejVtWlk4VUx2LzNla3hBV1VFNEZFV1NsbkR0REhj?=
 =?utf-8?B?VHVuN3djeGllSHJqU2xlM2hOelZKMGxXYXhpNGRKTkh3amtvNTExSnpDeloz?=
 =?utf-8?Q?3KgPEviH0HX7NZHY5JOKiaRDI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1618a3-5604-4d78-e7cd-08daa6182a5b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 14:53:14.8938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSfGUebH4ZZjqin0LOJ+1B1vL/zIAQFhBE3b39Ji3ANafriqxLAlH8UGF4bVLB80i4D/Nw9tv7TBuJRNdCnHNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4504
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
Cc: kernel test robot <lkp@intel.com>, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 yuehaibing@huawei.com, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-30 02:38, Dong Chenchen wrote:
> Kernel test robot throws below warning ->
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c:
> In function 'dcn31_hpo_dp_stream_enc_update_dp_info_packets':
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c:439:14:
> warning: variable 'sdp_stream_enable' set but not used
> [-Wunused-but-set-variable]
>     439 |         bool sdp_stream_enable = false;
> 
> Removed unused variable 'sdp_stream_enable'.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dong Chenchen <dongchenchen2@huawei.com>
> ---
>   .../dc/dcn31/dcn31_hpo_dp_stream_encoder.c       | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
> index 23621ff08c90..7daafbab98da 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
> @@ -436,32 +436,28 @@ static void dcn31_hpo_dp_stream_enc_update_dp_info_packets(
>   {
>   	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
>   	uint32_t dmdata_packet_enabled = 0;
> -	bool sdp_stream_enable = false;
>   
> -	if (info_frame->vsc.valid) {
> +	if (info_frame->vsc.valid)
>   		enc->vpg->funcs->update_generic_info_packet(
>   				enc->vpg,
>   				0,  /* packetIndex */
>   				&info_frame->vsc,
>   				true);
> -		sdp_stream_enable = true;
> -	}
> -	if (info_frame->spd.valid) {
> +
> +	if (info_frame->spd.valid)
>   		enc->vpg->funcs->update_generic_info_packet(
>   				enc->vpg,
>   				2,  /* packetIndex */
>   				&info_frame->spd,
>   				true);
> -		sdp_stream_enable = true;
> -	}
> -	if (info_frame->hdrsmd.valid) {
> +
> +	if (info_frame->hdrsmd.valid)
>   		enc->vpg->funcs->update_generic_info_packet(
>   				enc->vpg,
>   				3,  /* packetIndex */
>   				&info_frame->hdrsmd,
>   				true);
> -		sdp_stream_enable = true;
> -	}
> +
>   	/* enable/disable transmission of packet(s).
>   	 * If enabled, packet transmission begins on the next frame
>   	 */

Thanks a lot for your patch,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

and applied to amd-staging-drm-next.

Thanks
Siqueira
