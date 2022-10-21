Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092CF607A3A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 17:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3612410E3EE;
	Fri, 21 Oct 2022 15:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DB210E3BD;
 Fri, 21 Oct 2022 15:12:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l71cDup+ABqfUNVNnKDJaFx9gUmp6CodXFcM2RkV1NeTEA/6F6YJJEuyfkgFWXBjcb297H9a59sqAZZUVM462J25ASUGMrcDYTIZhrm+e7vTpsi5NACISnla79/LiNKyoO72QYHnHGOpseu/7gjXL4fQoCV9l7f/8sxk0NFKfV5ECzOroOdVKp36ZvOMyXdnQ2J/SR9YtcjBOTpyCa45VLVAKdj4zEb3IDqX9gDAOnxEZ/yrN7hZoD4zPazC2xpGDSwvQAgNc2ZBChVHO1MtLWxXisDsZwssz40OziMhWtWdsIaOt6gnlEOsm1phupG66lxg7x0MkppvTzhHYdP14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNvwI8i1NUcbzqkVoEV+4mdYMO/sGQGcqnXJMzL9D2c=;
 b=lrkPAHEX7/60f4KPw5bibdwp+v1Jz3tDTNmQCzK6gFoTAIC13+2U7DOygyXQCCi3nz3ZQSrizCslUODgw9zWkAWIy0sLZduNurXi46P41TWu5gi4bZWIj8asO61DTSa2HvuDDn6H80qU+X6zxfxfamH98Py28LS12PY0+h1Yk/M6gQMOQOWPKI+fHFHqnwXt5US61ONxg7W7Q6DOXnMMeWbXxWAEEsCPaO0g/yPE6V4TEwgYW35f3+D+CMBYnCwaCdV8WTcahZS3FRr6L2kYTkYzawZqWDYBUgqt1cjkaBdyzAbzEQ+g25yKAhWARDcyZW9MLeAPzZd+A0DT3PU7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNvwI8i1NUcbzqkVoEV+4mdYMO/sGQGcqnXJMzL9D2c=;
 b=DFsvto04VcPBQqkBFH7lpssyKQvBhdYkgwZP97913/vwIYaCGQFgwMyE/I5PTocK9JyAMYkMHO5KClvypirPRscVQG6yrwiAy9LCCqKLFEpgQMnwD6WrKu88pguo+lwtC5/hcPEfn0hjAsAtxPWoPwaIY/MU9/q90LAKoPT+s24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 15:12:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%7]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 15:12:08 +0000
Message-ID: <cb1efdf9-3d68-df1c-a808-d971077a2666@amd.com>
Date: Fri, 21 Oct 2022 11:12:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amd/display: Remove duplicate code for DCN314 DML
 calculation
Content-Language: en-US
To: Rafael Mendonca <rafaelmendsr@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221020221051.919704-1-rafaelmendsr@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221020221051.919704-1-rafaelmendsr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c1df00-38df-437b-8b26-08dab3769ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K0LPe37aLyir7dEGSsxuoU2o1asBeLSA+vfDJdVb0ycVJ4c++p8Cw4M825lz/KQUodGeJFyil8mz3vkuhuQxt5AzJNH7zFf2g+ODfBNvG1731N7Afv/cgllLNEHXPqkOvgKAZwWEZP78XZUAnc+MMX3SBNeu6X7N/ID/VqHzeVfWxEfl3KDsU9FmbyMOniLviw62jkjnBAcheV7wtmwqYLyoWF7GOmPblFVuycLHbRC49aK2MfMAzH29CVK3ekhw7OlZAZX5AG5tGwN3zO2FgPn6JYvjsHPl/umGJC98gMJxY6NPUA38oevkSxqaZs0ivsvi+3RtkvxfKcVB9rJSp0bmRKzxSK/IvXilmfrd40b0ISSB6+DVWh7W7dvv0pL4Skbjelbqd1wzKa4WAPH0hlZy1s6BR/QvWkCmEsJG1mr+8M8NSEXKR8FivEjo596XFo2Bn3NZRj95ONbkRWn/Mt5wjMlBulKQyDsrL9oluv/tMPzrb0MiSqd/07drT35SofBnAypPBhoTlU/RY4Vueq6QqhBQkbPuFBQUUhfl2PrykbWPOJISr6GtKzd4Zw1pW2lSl0b0yTggCqMTMEPQsUIqgg1QOiaDsLweieAJ1qvKDhON17Efu/c9sO+JuXONww8F9qdcRCuY+1dE0uFU/vmaoDlIU0edy9taMLTVbx9YNw+VTlw0amY6A3bbCSkEc5S4ar2YVLWm0sBAGO5ZRYVUoe6tJDRkr+mrNvz9yMAyq1ueHxa2L7bH1ay+Ia75EslA5irgrqlH0hZX16Jme+3h9xCXpbekl8LIzbGhohY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(5660300002)(186003)(31686004)(4001150100001)(66556008)(2906002)(2616005)(6666004)(6506007)(110136005)(38100700002)(26005)(316002)(53546011)(86362001)(6512007)(8676002)(41300700001)(8936002)(30864003)(66476007)(83380400001)(4326008)(31696002)(478600001)(44832011)(6486002)(36756003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRKeUE4Y2dDUXFrR1ZQeTUvVk05K1Z0TVNLanhwNzdOc3UrZTQ2YXVVNjB5?=
 =?utf-8?B?am9NSXVURU5NQ0FwYUtWVnBzNlBFbncrUkNmVWhUd0YzR3NoOHVXK0NaaXJn?=
 =?utf-8?B?TlRDOGxSd2lZYURIK2Fra0thMDY2YUk5T3g1QXB1cE9IMHRsem1LMC8vY0w4?=
 =?utf-8?B?NmM3OUtnVDRZWTZ6cDBBTjE5ZzUyN2JJQWJjbDJYL0hJK2dnS2NvTExDb0xt?=
 =?utf-8?B?U3E5K3h4ejd5S2JZUmpjdnBhNkdwem85YzRVWmdIeUNrUnhvWklLOU1kblFa?=
 =?utf-8?B?U090dHBRRWQwVzQxT0dXTDk0WGRma1pkTVlCMW8vSHFRRjRucDFpUUhZeGxE?=
 =?utf-8?B?OGZRUHNoOWFLMFFLSitxN3cydzlBeUlSUGs5NlJwOXptTVFlWnRWN3ZxaS94?=
 =?utf-8?B?NHBxV1RNTlNWZGFtZi8vUG9hYjNxK09xUXN3a3lQMmxHV2VHWjRGcktGdU9y?=
 =?utf-8?B?WjZVT0lpQVJqRysrQXpNelAvSU1Od2hBemZqME4zOEg0ek81OEtvcHFzV3JQ?=
 =?utf-8?B?QnJFSlk3QWkzajlwbkphbzVmT2VVamlRYlNhUndVZlI4ZjdvV1RPN2VDS3M5?=
 =?utf-8?B?Y2NKUTl2QjB6U0RERytzNkJtSTZhdmR1dzRlOFJudTBsWWpiWW1xNEJwekVz?=
 =?utf-8?B?NnJDQks0dDhTZklXdHlnNUF6QVU2ekNGRHdkQnhXeC9pbCt1ZU42TzNLcGZn?=
 =?utf-8?B?blFnZ0tRdjlYZnAxMkFxOFVqZGh2ZTBhYTFJVlY5WDNzTytya2hJSFU0Mzl6?=
 =?utf-8?B?VXV3MDVXV1ZndVcreG1wSGh4QTRpSWw1NGVmU0wvU2huL2F4TG53dTBvaHhu?=
 =?utf-8?B?SW42blZIempWY3RyOEQrL1pPM0RKeHBWdDJobHpnL0YyM3lPNXF4eHFjTlFC?=
 =?utf-8?B?ek9HY1c4Q1N6NFdWSURNakF5RGxselF2NkxDdGtUdnQ0VmxGckM5bVN2Kzht?=
 =?utf-8?B?dXVTdEVremZueWJqT0l3eDhqMTYvNDZzVFJQUUNCUkY0WG1NR1haYktpeTlz?=
 =?utf-8?B?ZE5Iei9XOEJVbDAxUndXZElEaGdYRG0vcHc3ZStPZU56WlR1Y29rd1dnTUN2?=
 =?utf-8?B?Ui9QNERncEFnRWwyREF6SW95YktSZjQxOXB3OGQxeGNkMTkvTFc2dnF6d05Q?=
 =?utf-8?B?T2pjb1p5MjRmMnAzaUpPWndLSC9yZEFtVkQ3ZVBYcW5yZGs0a0Q5Ykt3NzdZ?=
 =?utf-8?B?L3phdlhaY2Z3dGdISHFjSmR2eTVzUWV6S2hWTGpFbmF5MW9KMkVLaWdSOGZM?=
 =?utf-8?B?Sm1BM1BHR0xaYVVpaExtL25FdFA0QUlCVG52WXJPNW1EMXdhQXNIaFQ0WjNX?=
 =?utf-8?B?V2lTcW80WWhRcStTUlhPcm92UjlOQmRSYmVRSG1weFd4cTVLSXlyUzRhT1NR?=
 =?utf-8?B?UTBSYSs4TFJKQlFnRGVSaEZjeVhpRnlxMFcxNTZpanh6VnR0SDJkSUErVzRY?=
 =?utf-8?B?VktLVzNSYm5qYkljSzZVSW9CWlpROEkwY1F1T3cxc09RVnB5ZlZVTUltQnlW?=
 =?utf-8?B?alpiMWxVTjAwM05WL1JyeTZWaHJkcTZpc3dnVXVveHA2bDF0RS9GUVJEOU95?=
 =?utf-8?B?MXhJZGdDUldseVc5YzNDVlRSOGZhenBVL2kwWk5HcGRvakVjdjVDZDBEalY3?=
 =?utf-8?B?NzdSVVpsQmRKT0w1SWN4WG5MSy9ubEZnUEVkYmU4Q3FpSnpPdjlxa29RbnZK?=
 =?utf-8?B?UWxTVVlqTjhUamd5NU9hU2hyZkMxOGVoWVB3eUZJMG1PYUZUUjQwV2RiSjFi?=
 =?utf-8?B?RnhyRTd3cG1qcFdMT0ZieE5rRTFrT05PaFBXOFp0TDcyTE1xVWJ2MnZrOHlj?=
 =?utf-8?B?SWRUYmQyUGhuUW9QcTZNYUszS1RxK2VTbXlSRmtZVWZmUEJrWDVCUzU1RG1N?=
 =?utf-8?B?YTE3M3dtMXNEV1FqRVNKU0tvbDE4dmdiVktkVGNGcDRXSGdJNzFpNForTU9B?=
 =?utf-8?B?cGdMRmxTdHc3SUxPcXlBTVoxRGpDQU02ajlhZVNINk4rMUxta1NzWExFS2l2?=
 =?utf-8?B?MmZIaE9OY1gzR3JMQ3E1Q3RpNTY1L2RJNzFXZDRLeHVwYXlIMHRVU25sbEt1?=
 =?utf-8?B?SThjRGsyZFBPWlpvVWxjOUJ2YmlBQXc5L3AyZXYzWks4WXZOWnJ5TWNROUR4?=
 =?utf-8?Q?cv2J42DZxccl0ktRPsMouqFFf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c1df00-38df-437b-8b26-08dab3769ebd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:12:07.8968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DvBLva5zRk597RRZuQhMYpCvsqZjm3iNb/2eEliUUQvzp777HR0Yvo4xdsDHCX0yckd4HVRdgA+aAO9hKWzoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-10-20 18:10, Rafael Mendonca wrote:
> This is an extension of commit fd3bc691fc7b ("drm/amd/display: Remove
> duplicate code across dcn30 and dcn31"), which removed duplicate code for
> the function CalculateBytePerPixelAnd256BBlockSizes() across dcn30 and
> dcn31. At the time the aforementioned commit was introduced, support for
> DCN 3.1.4 was still not merged. Thus, this deletes duplicate code for
> CalculateBytePerPixelAnd256BBlockSizes(), that was introduced later in
> DCN314, in favor of using the respective functionality from
> 'display_mode_vba_30.h'.
> 
> Additionally, by doing that, we also fix a duplicate argument issue
> reported by coccinelle in 'display_rq_dlg_calc_314.c':
> 
>   static bool CalculateBytePerPixelAnd256BBlockSizes(...) {
>     ...
>     } else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
>     ...
>   }
> 

A lot of the uglyness of this code and some of the duplicate nature
of it are due to the fact that this comes directly from the HW
designers and is consumed as HW gospel. Years ago we tried to write
our own beautiful code to implement the HW bandwidth constraints and
calculations. This proved problematic as we had an argument with
HW designers each time there was a bug and first had to try to
prove that our own code was good. Consuming their code (more-or-less)
as-is short circuits any of these arguments and has lead to a
more stable driver, even with HW where the bandwidth calculations
have become more and more complex.

We do want this code to be kosher for the kernel but beyond that
we want to refactor this code as little as possible for the
above-stated reasons.

Note the "NOTE" at the top of the file regarding this.

As for the specifics of this patch, I'll leave that to Siqueira,
since he's been a lot deeper into this code than I have.

Harry

> Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
> ---
>  .../dc/dml/dcn314/display_mode_vba_314.c      | 106 +-----------------
>  .../dc/dml/dcn314/display_rq_dlg_calc_314.c   |  91 +--------------
>  2 files changed, 6 insertions(+), 191 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> index 0d12fd079cd6..6e43cd21a7d3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> @@ -32,6 +32,7 @@
>  #include "../display_mode_lib.h"
>  #include "display_mode_vba_314.h"
>  #include "../dml_inline_defs.h"
> +#include "dml/dcn30/display_mode_vba_30.h"
>  
>  /*
>   * NOTE:
> @@ -90,17 +91,6 @@ typedef struct {
>  #define BPP_INVALID 0
>  #define BPP_BLENDED_PIPE 0xffffffff
>  
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -		enum source_format_class SourcePixelFormat,
> -		enum dm_swizzle_mode SurfaceTiling,
> -		unsigned int *BytePerPixelY,
> -		unsigned int *BytePerPixelC,
> -		double *BytePerPixelDETY,
> -		double *BytePerPixelDETC,
> -		unsigned int *BlockHeight256BytesY,
> -		unsigned int *BlockHeight256BytesC,
> -		unsigned int *BlockWidth256BytesY,
> -		unsigned int *BlockWidth256BytesC);
>  static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
>  static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(struct display_mode_lib *mode_lib);
>  static unsigned int dscceComputeDelay(
> @@ -2178,7 +2168,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>  	DTRACE("   return_bus_bw      = %f", v->ReturnBW);
>  
>  	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> -		CalculateBytePerPixelAnd256BBlockSizes(
> +		dml30_CalculateBytePerPixelAnd256BBlockSizes(
>  				v->SourcePixelFormat[k],
>  				v->SurfaceTiling[k],
>  				&v->BytePerPixelY[k],
> @@ -3317,7 +3307,7 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  
>  	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>  
> -		CalculateBytePerPixelAnd256BBlockSizes(
> +		dml30_CalculateBytePerPixelAnd256BBlockSizes(
>  				v->SourcePixelFormat[k],
>  				v->SurfaceTiling[k],
>  				&BytePerPixY[k],
> @@ -3371,94 +3361,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  			&dummysinglestring);
>  }
>  
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -		enum source_format_class SourcePixelFormat,
> -		enum dm_swizzle_mode SurfaceTiling,
> -		unsigned int *BytePerPixelY,
> -		unsigned int *BytePerPixelC,
> -		double *BytePerPixelDETY,
> -		double *BytePerPixelDETC,
> -		unsigned int *BlockHeight256BytesY,
> -		unsigned int *BlockHeight256BytesC,
> -		unsigned int *BlockWidth256BytesY,
> -		unsigned int *BlockWidth256BytesC)
> -{
> -	if (SourcePixelFormat == dm_444_64) {
> -		*BytePerPixelDETY = 8;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 8;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
> -		*BytePerPixelDETY = 4;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 4;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_16) {
> -		*BytePerPixelDETY = 2;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 2;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_8) {
> -		*BytePerPixelDETY = 1;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 1;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_rgbe_alpha) {
> -		*BytePerPixelDETY = 4;
> -		*BytePerPixelDETC = 1;
> -		*BytePerPixelY = 4;
> -		*BytePerPixelC = 1;
> -	} else if (SourcePixelFormat == dm_420_8) {
> -		*BytePerPixelDETY = 1;
> -		*BytePerPixelDETC = 2;
> -		*BytePerPixelY = 1;
> -		*BytePerPixelC = 2;
> -	} else if (SourcePixelFormat == dm_420_12) {
> -		*BytePerPixelDETY = 2;
> -		*BytePerPixelDETC = 4;
> -		*BytePerPixelY = 2;
> -		*BytePerPixelC = 4;
> -	} else {
> -		*BytePerPixelDETY = 4.0 / 3;
> -		*BytePerPixelDETC = 8.0 / 3;
> -		*BytePerPixelY = 2;
> -		*BytePerPixelC = 4;
> -	}
> -
> -	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8 || SourcePixelFormat == dm_mono_16
> -			|| SourcePixelFormat == dm_mono_8 || SourcePixelFormat == dm_rgbe)) {
> -		if (SurfaceTiling == dm_sw_linear) {
> -			*BlockHeight256BytesY = 1;
> -		} else if (SourcePixelFormat == dm_444_64) {
> -			*BlockHeight256BytesY = 4;
> -		} else if (SourcePixelFormat == dm_444_8) {
> -			*BlockHeight256BytesY = 16;
> -		} else {
> -			*BlockHeight256BytesY = 8;
> -		}
> -		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
> -		*BlockHeight256BytesC = 0;
> -		*BlockWidth256BytesC = 0;
> -	} else {
> -		if (SurfaceTiling == dm_sw_linear) {
> -			*BlockHeight256BytesY = 1;
> -			*BlockHeight256BytesC = 1;
> -		} else if (SourcePixelFormat == dm_rgbe_alpha) {
> -			*BlockHeight256BytesY = 8;
> -			*BlockHeight256BytesC = 16;
> -		} else if (SourcePixelFormat == dm_420_8) {
> -			*BlockHeight256BytesY = 16;
> -			*BlockHeight256BytesC = 8;
> -		} else {
> -			*BlockHeight256BytesY = 8;
> -			*BlockHeight256BytesC = 8;
> -		}
> -		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
> -		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
> -	}
> -	return true;
> -}
> -
>  static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
>  {
>  	if (PrefetchMode == 0) {
> @@ -3948,7 +3850,7 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
>  	/*Bandwidth Support Check*/
>  
>  	for (k = 0; k < v->NumberOfActivePlanes; k++) {
> -		CalculateBytePerPixelAnd256BBlockSizes(
> +		dml30_CalculateBytePerPixelAnd256BBlockSizes(
>  				v->SourcePixelFormat[k],
>  				v->SurfaceTiling[k],
>  				&v->BytePerPixelY[k],
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> index 61ee9ba063a7..a373d35dd473 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> @@ -28,94 +28,7 @@
>  #include "../display_mode_vba.h"
>  #include "../dml_inline_defs.h"
>  #include "display_rq_dlg_calc_314.h"
> -
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -		enum source_format_class SourcePixelFormat,
> -		enum dm_swizzle_mode SurfaceTiling,
> -		unsigned int *BytePerPixelY,
> -		unsigned int *BytePerPixelC,
> -		double *BytePerPixelDETY,
> -		double *BytePerPixelDETC,
> -		unsigned int *BlockHeight256BytesY,
> -		unsigned int *BlockHeight256BytesC,
> -		unsigned int *BlockWidth256BytesY,
> -		unsigned int *BlockWidth256BytesC)
> -{
> -	if (SourcePixelFormat == dm_444_64) {
> -		*BytePerPixelDETY = 8;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 8;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_rgbe) {
> -		*BytePerPixelDETY = 4;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 4;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> -		*BytePerPixelDETY = 2;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 2;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_8) {
> -		*BytePerPixelDETY = 1;
> -		*BytePerPixelDETC = 0;
> -		*BytePerPixelY = 1;
> -		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_rgbe_alpha) {
> -		*BytePerPixelDETY = 4;
> -		*BytePerPixelDETC = 1;
> -		*BytePerPixelY = 4;
> -		*BytePerPixelC = 1;
> -	} else if (SourcePixelFormat == dm_420_8) {
> -		*BytePerPixelDETY = 1;
> -		*BytePerPixelDETC = 2;
> -		*BytePerPixelY = 1;
> -		*BytePerPixelC = 2;
> -	} else if (SourcePixelFormat == dm_420_12) {
> -		*BytePerPixelDETY = 2;
> -		*BytePerPixelDETC = 4;
> -		*BytePerPixelY = 2;
> -		*BytePerPixelC = 4;
> -	} else {
> -		*BytePerPixelDETY = 4.0 / 3;
> -		*BytePerPixelDETC = 8.0 / 3;
> -		*BytePerPixelY = 2;
> -		*BytePerPixelC = 4;
> -	}
> -
> -	if ((SourcePixelFormat == dm_444_64 || SourcePixelFormat == dm_444_32 || SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_8 || SourcePixelFormat == dm_mono_16
> -			|| SourcePixelFormat == dm_mono_8 || SourcePixelFormat == dm_rgbe)) {
> -		if (SurfaceTiling == dm_sw_linear)
> -			*BlockHeight256BytesY = 1;
> -		else if (SourcePixelFormat == dm_444_64)
> -			*BlockHeight256BytesY = 4;
> -		else if (SourcePixelFormat == dm_444_8)
> -			*BlockHeight256BytesY = 16;
> -		else
> -			*BlockHeight256BytesY = 8;
> -
> -		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
> -		*BlockHeight256BytesC = 0;
> -		*BlockWidth256BytesC = 0;
> -	} else {
> -		if (SurfaceTiling == dm_sw_linear) {
> -			*BlockHeight256BytesY = 1;
> -			*BlockHeight256BytesC = 1;
> -		} else if (SourcePixelFormat == dm_rgbe_alpha) {
> -			*BlockHeight256BytesY = 8;
> -			*BlockHeight256BytesC = 16;
> -		} else if (SourcePixelFormat == dm_420_8) {
> -			*BlockHeight256BytesY = 16;
> -			*BlockHeight256BytesC = 8;
> -		} else {
> -			*BlockHeight256BytesY = 8;
> -			*BlockHeight256BytesC = 8;
> -		}
> -		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
> -		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
> -	}
> -	return true;
> -}
> +#include "dml/dcn30/display_mode_vba_30.h"
>  
>  static bool is_dual_plane(enum source_format_class source_format)
>  {
> @@ -468,7 +381,7 @@ static void get_meta_and_pte_attr(
>  	double byte_per_pixel_det_y;
>  	double byte_per_pixel_det_c;
>  
> -	CalculateBytePerPixelAnd256BBlockSizes(
> +	dml30_CalculateBytePerPixelAnd256BBlockSizes(
>  			(enum source_format_class) (source_format),
>  			(enum dm_swizzle_mode) (tiling),
>  			&bytes_per_element_y,

