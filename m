Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC66C4F2F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 16:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABD910E39C;
	Wed, 22 Mar 2023 15:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2A510E39C;
 Wed, 22 Mar 2023 15:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4AarmzafEw6vmrL5yfGsg1zGbNV7IWt14M7XqFd32o1I+Xd0qA2q/ZDS2iNkG0omzDF1sxmVloBHE6WRfBQxSmhiiDI1EgIN/dkXdZG6e0MvMj0nOnQACPx15z60JTWFF3bpEX3WfQHZdDq9VicmEBYekv9T9Sls6ebfo6I3dXwpXxGoA07NOUiffdui4lqAbDeHEraNZz/ZZCFEAIy0DmTTXqPNFgXxWxNLH59PfRhXghYXtJGMxNayqFU2Opqk+A5JE7NVhjxidTpBsjEUlrpxmSIfTje6birnO0REPU7weeCxRY++9yJaGL+njX9As1dQzxkGSJYzGATZOruAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VN0p49hVjY2sANyLdsfWnnYc3OuUqd0S+wk4i08JMQ8=;
 b=PmRVN359hdvb5SoB8ptHwIDDigstwtDC95PParD3wLfumLo8eoV0rfydS32DsXijfp/+1WLXqMn4KftfVa2mWNKVeiQfSMaZ4Rh42inrppx0c96DoiGv+zZWm7Alxpv6g/LU1+t2e6356ny+UC2mP2jX7sbBsZRWMytfLBGHp96wB4nrgP7s4knK+IMqbjPMYiWY6hoAIn5TikfmB85fq3nqPwDvrMiF/2juZE/IZAqrLgzMrVyU9jvVvuglsdFHuoMteE2aoPT60aUQBUu3egq8y1VOw6vPWrJnhUtOG0q/u1FoOFGFeyuUYa+xZeNB/Q1KHx3gkwyc9gkutGP6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN0p49hVjY2sANyLdsfWnnYc3OuUqd0S+wk4i08JMQ8=;
 b=Ozk0r5yGDuG4zVZ9jFO2r8s5/p0AgPYNcHD+4n2baHrGaNWUlLwf9d4TSuJmzqJy2YaRAS4qH+5Lw8t2O+UZzm3VBhljMDFDViouHeZynHV0SLBS7Pfv+SqwEFzlyo9XsKFWBJ2KGFhCWPjMnQcwN6tINh+TE60jWBaZeNZs8XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM6PR12MB4369.namprd12.prod.outlook.com (2603:10b6:5:2a1::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 15:16:25 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:16:25 +0000
Message-ID: <135cd1f3-e931-6099-279b-1e5c71bcb373@amd.com>
Date: Wed, 22 Mar 2023 11:17:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Remove the unused variable
 dppclk_delay_subtotal
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230322015917.118874-1-jiapeng.chong@linux.alibaba.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230322015917.118874-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::14) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM6PR12MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: a0071a28-bdc8-4bfa-b323-08db2ae866e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RqSmpYlQfG4vM1WejegAHfhZ+Zt3G9x4uqofdnll2++2FuyAjefSYUnz0VJp2aPx4KkhMyW3OUUYBOGLeLfd1H4k5u3BZ7FQfCyzSnyDgQC/gO8HcKzjMhE9htu+cky6hCzgZe/X4DK6iEzig5A+Ibx2W1/eoO99xZ12D3Eb+mx2/o68MARow/xL/gsaDQZmFPF/ZOut2kltTSJPxW0FtsQ+LLpiFzmTz+mhAeykMSXc7UWJZmoBwDlG4rwEoE1/ovqPRa3z2kkM3xeH04+LixR/y0YJ70lV8bUDAaeKvpcL9iqUBALsDAT86DXPyMOyNcthAcHgCmH21jCAMwRFeZvn+f9HEfTeuEq5is6BM1cPlr/s4SV/sRzJ6cp12lqq68JlsbDrsjljMvhb+IR4F14HKlHceGRD5kMNzMLvhcbWR6waV2rliGXnPe8nQZX+SKBlqZ4LQS308eUgUviuFE2wK8GUdBkvuylouIxGJPGL4q/bI5YQJAc3wlxjDM7tjWU2gIEw6lfw46P1fmLigdxyda/0wfpZGFEdqbKwqoCUJG8KNRX4DM3L9ZlEWfmFQufYdClU5oGQLoSuj+60mZrJsoUZqJwX9V5oFNQwuYnnDbYqZ/MgHaoXkFDUMcf54+eTF/Wk7xHpYggzWbadLuseYJpvEoYn8r9K/PmDijl7LSUN5tfrMYTt9J1T0eXEb/UD0IEJ1AlE74G7/LzCXLLWJaYd4b8XoyWmlfdk8Ko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199018)(2616005)(6512007)(6636002)(38100700002)(86362001)(31696002)(8676002)(8936002)(4326008)(66556008)(66476007)(2906002)(66946007)(36756003)(41300700001)(44832011)(53546011)(5660300002)(186003)(6506007)(6486002)(478600001)(966005)(26005)(6666004)(83380400001)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEs4UTh5ci80aURrMDVWbFRwOTEzSzE5MnNvTC9YamViWVgvVURlb3orUlhO?=
 =?utf-8?B?VXRFZGxsVWh2d2pNNy81d2JxdmFuaG5kQzlOdm8vd09pa1BQSllrV1dvL01w?=
 =?utf-8?B?L3dPQ0FlQUtzYUFsN1VsclVCT3VuaUJRM3RwcWtaU1JFbmhsR3ZWYTNXTjhr?=
 =?utf-8?B?ZG9XY0JVZlptNVdTeG1CL0ZuR1JZWHp3Uy82VFB3YkIzQjY1elhXbGY1Sm9V?=
 =?utf-8?B?SFJ5dEliV1EzSjRnMDkyY2F4SXFIenc5dlh0QlNJMmdLWDd0SllVT25zdUdh?=
 =?utf-8?B?Wk0xTjFnenRUUld1QjVEZFYydXB5NU5QYksyMEZJem15OFNUUWxwVEhiOHNV?=
 =?utf-8?B?aUpJRUI2YzV0bVQzaVBkVVkyRlc3Unc0TG5POTVEM3JhMXdJNjJkbGlkek42?=
 =?utf-8?B?RlQybjV5YVErL1NYSWdjdzJKa2pNVnZCOUdmampYdGVDMFVqbVBZNmRQUEZ0?=
 =?utf-8?B?NE41UTdLaktQZW0wdFJYaWpETE5tUXhpKy9QZFFWSDFYOWg4OVd4dDJBeTlv?=
 =?utf-8?B?UHp1Qm4wSkJNcnNOV0ZLTlpvSHpSbUFIY0tRaDFkK2p0QktvMTFWV1E0K1NL?=
 =?utf-8?B?VnFXMnJkN0RwVjRvTXc2SVpEMnIxWFF2cXB1N01BeUpQK2tSWUpmT0VsVGxU?=
 =?utf-8?B?YWNTZVRCNFNmUnpmU0ZCSzVYMFY1cHIzVHl0S2ZBYk9QSzhaZzkzVzh6akVB?=
 =?utf-8?B?N001LzlpRkRjd095NHNhYmJSclFFZSt0QkZOenRLVlQrWmRYazFpQ3R2YzZt?=
 =?utf-8?B?R0U3VzVtaDJJM1ZEak9vWVVpTk5YRTdzNkQ3WExWMVdQc2lNR0xpczZYWW1H?=
 =?utf-8?B?TG9uQm80U0JVOStEQnpPT0hwN1F1QUNaU1QyTDAvMGtuMW03cnRxNFQvYVVj?=
 =?utf-8?B?QzA4MjJESDdRVUErVmFkVzVBR3NINkhTM2s4OGtTUXR2cEhPMDBoNERUZTdL?=
 =?utf-8?B?Rm9saEJPVmd5d0NHRjNYaXpXNEorczhIZHZTVUdnZDVrS1V3QlFYUWx2V3pp?=
 =?utf-8?B?QU5qSWhYWC9MRGZHY0NMV3RQY2JjN3J0dVdoblFGUWZVZ0diUEtONHhEQUI2?=
 =?utf-8?B?SjVyRURFaDdLT29sQ2Q2Z1l5NUFydWxnbGRaRDhVRUZHVEd2ZGJMZ1N4Nkky?=
 =?utf-8?B?dVZxemEzeXdLMzh0RlFFWVNic29xMTVIbndyT254R2lDVnJYTU5HbEx3aXhO?=
 =?utf-8?B?eUdTQ29ndndwKzJoR2pZdDVRZ2Y2WmRGelI3OXN3Tk9rQVNQaloxL2V5OVh6?=
 =?utf-8?B?UVVodGpBOEw4QVNESlo3Y1ovZzhhVVp0ZTB6N1NBUGZZNGx0bXNFQ0lCd1VV?=
 =?utf-8?B?c044dXMxeUpaeWtadGJDMldmUWhqa0JxVnUzY0QycFhzamVQUHM4ZUl3b3hs?=
 =?utf-8?B?UTZzeWg0U0lDM0Y3YldQN3oxQWNjdWl3L2xKQ0ROb2xXbkFISVRSZjViRmF4?=
 =?utf-8?B?cHVGQ3grWWdmR29kcTRTWmgvdVB2cDQwMnpiN1g3WTF4cG1ySlJoNkZIb0hm?=
 =?utf-8?B?T2RxYThlMzl3TUdpb21aUS9iMFY1TjlkNzRLSXdoMUdNMER3cjB4N3krM2Nl?=
 =?utf-8?B?MUY4czdLS3FkeFRJNFpFSFJHRUVVSUxDUTVnUFVCRnVpQ2M2b0FQMCtGWjdz?=
 =?utf-8?B?VEVISU5FblNZQUxLUG80d0tFa1QyRjJ2enczY281SG85TUVGNXFVNlZhSWE5?=
 =?utf-8?B?OHQ3Z2MvbXN4d042QW81aXlpMVFUQWQvNjN6RkIzRkd6M0JCOVptMWhJYWNB?=
 =?utf-8?B?bWhlZTkzN09xM1VuWGRsVlhsazY2bVc3MnFHS3d3ZEFsZ0loRmhON0oxczlK?=
 =?utf-8?B?L3pGZlZUeFRxZWpoRlkyQWdOQTBsUlFPbEgwclRzaXNBRGpnQ0RtQ1ZSMGQx?=
 =?utf-8?B?TUQwQWR2aWYxQXl6aTluQy9KdEx4S1hKSm9pZ3RpcXp4MWJnT2JWbnZjbkN2?=
 =?utf-8?B?NkpBT1ZMM1JTdG11ZitBR2lDZXZtQjc5L2lWd2M5WG5zRHc0aUpFZ21MaFli?=
 =?utf-8?B?Y25VTDlNUy9BNVJ0VlFyWTVmbEhUMXRiOVBaK3QyWERuQnN6U2puNFZuR0dq?=
 =?utf-8?B?T2ZVT2xoeVF1SnBydjJMRDdBV2s5dlgyeEQzU1lDbXdBL0x2ZE5xNmIyM0Q1?=
 =?utf-8?Q?VyBBeVOu2d/SnTpumYfDbNFeM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0071a28-bdc8-4bfa-b323-08db2ae866e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:16:25.2156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0xhrmumsgCeT5GJLQxVMvAdj4n8j4U0ECiz7Qz0RNwrmXGW2RkeFnaiuIefHKQhVnLCZPv1s3GVekT7oklJYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4369
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/21/23 21:59, Jiapeng Chong wrote:
> Variable dppclk_delay_subtotal is not effectively used, so delete it.
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1004:15: warning: variable 'dppclk_delay_subtotal' set but not used.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4584
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks!

> ---
>   .../display/dc/dml/dcn314/display_rq_dlg_calc_314.c    | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> index 6576b897a512..d1c2693a2e28 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> @@ -1001,7 +1001,6 @@ static void dml_rq_dlg_get_dlg_params(
>   	unsigned int vupdate_width;
>   	unsigned int vready_offset;
>   
> -	unsigned int dppclk_delay_subtotal;
>   	unsigned int dispclk_delay_subtotal;
>   
>   	unsigned int vstartup_start;
> @@ -1130,17 +1129,8 @@ static void dml_rq_dlg_get_dlg_params(
>   	vupdate_offset = dst->vupdate_offset;
>   	vupdate_width = dst->vupdate_width;
>   	vready_offset = dst->vready_offset;
> -
> -	dppclk_delay_subtotal = mode_lib->ip.dppclk_delay_subtotal;
>   	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
>   
> -	if (scl_enable)
> -		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl;
> -	else
> -		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl_lb_only;
> -
> -	dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_cnvc_formatter + src->num_cursors * mode_lib->ip.dppclk_delay_cnvc_cursor;
> -
>   	if (dout->dsc_enable) {
>   		double dsc_delay = get_dsc_delay(mode_lib, e2e_pipe_param, num_pipes, pipe_idx); // FROM VBA
>   

-- 
Hamza

