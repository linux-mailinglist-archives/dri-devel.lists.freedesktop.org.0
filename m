Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997A6CEE8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29D110EB79;
	Wed, 29 Mar 2023 16:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92D010EB6B;
 Wed, 29 Mar 2023 16:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb0KCyopHPktLGO4OGN+2znMNVHKCoVsIS5oyNO5HXoG29vNfk2DqDQ/V/ResKaS16RDhs+o44oyyKZqY3J/qSIrCCUmbPi7/Btt7+aOlNIF87th7ZZZg9xjlMeexirKxx+QBH/G5/agdwSr1fOxyiLCZY2qIJX7CPg+ZNlSYd8OQtsII8NKv0BD1MLRYM4+tqWmFBTxbl0Kk7DYTxX7Ts6a9lMlaufH7ZEKF/SrDr+78TVnhg1ECxa8PJ2ostlcPuFjhPE7KiZpPikADLPDaXFMwlhM4s84O1FkFUQtk1A06UOG4eSUuYdWf88Cnh7TirrQIR78ofMbfacGgMj5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqnE0taHUWkP6+PX+BfnDbIblb4eJawDjlifvUW8enY=;
 b=TfSPUtJ+pGwhLop/hN7eqidEFFT7WUq29m2U88YMztH4tg8DPcma/xjFTT6YzJNe+MW6H9OpBhTInbbyjRyq3iq+zUsE7gymwqhcUcjcw6uCndAYPaaW3b7cJVxz4IsqKs/h3zdnlLSsoWEM7jhsBr+jKeoAm7dt4koUWf8uXdgt3CWVogL+D9geksYZKojUjxdyeiHvPDbmtQUYBceb7Wk3iBV7/rVBjih/4rdUyGI5coOCdAqLLfG6G6laEzPis5yDWC5qeqUOKDcumZnU/SI2Li+WeeT4jD+y9S+30B3X9qQignzDtfPdzSSQHH14q9e5p6qauIkrtbCsi8JqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqnE0taHUWkP6+PX+BfnDbIblb4eJawDjlifvUW8enY=;
 b=nhFS2mR9b/3WkJc5inZjdTDhm3oChaHW/wi1Lhv81N4l2o5yb4enCHJ7PBEIlWIRF+lWhXbFTKG6/mO3K3Dxe2XSxrKbt6/S+bHImq9jl7i4hM03mfcj5d20w1jlyJB//+F5i6vSmad5V30yaRL0hy6mkbiCVX37YN/0MHkNsz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB6853.namprd12.prod.outlook.com (2603:10b6:a03:47b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 16:05:00 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 16:05:00 +0000
Message-ID: <a848b681-0c24-2676-2f20-03b11fd8dd77@amd.com>
Date: Wed, 29 Mar 2023 12:06:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm/amd/display: Remove unused variable 'scl_enable'
To: Caio Novais <caionovais@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230328220947.108188-1-caionovais@usp.br>
 <20230328220947.108188-2-caionovais@usp.br>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230328220947.108188-2-caionovais@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::48) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a138a0-271b-48f3-2630-08db306f590d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWz57ZcOMlVeggicd8JKKBP5RhWk5puZ9StOscGp7Vbvskv9QoH9fZ21FN/c0S4FOrR0bHXP1lijexr6cKLpWdaN14ZiHAacYQAiXDwMiyQNUjo3Yu3zb/k/S8w9ehNk9ufYOTE8rWS7QoQ+FnuKPRKlh+Yj69b1/ILtN1IYoToFfZgqIDH32g4Q2Dvpuz/TPkMbnDDHvIWgrFPR4Z+mzdVwjDWbrzL9IdB9CODrIbnlCMsRyv7ct03UIxAiT+40OOoyRyKdcCeRNDq96HN6shMM4fg+dpM7QxEgxO9PrmVOExfF4Bi3pBSly81FB1F+b0IrN4qt+0fyj3RL7yfccNW5A+72Ulw1ZogBY4rpqNPQCTkGAqctvAUrOKXQSITelG7rz5JZabt4j00uYOtoEu7T+ivCIAVdbpzaMYLV8TrQZVLagqmLu2QlU9Ezm2Ew1n1L1+z8m4t6Fs6pq0RqehPfFOzfIvQG1ue/8Fx96xcrjCp4JtLZE54EAJcC38JWJdraO28KOJs5w7KoYT83QXFYEgjBYtWUIeO/M7WQSFd0/LUGpZ0V92JyXZ02D1nKJ5ksoxiHF/+HNkPt/iwCtpMslKffzYOuGIJ9N36fPmDmny7d9E3dL+8s+h2xr10YOjUW4RsnkTCMnNrFake7EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199021)(66556008)(8936002)(83380400001)(66946007)(31686004)(38100700002)(44832011)(5660300002)(54906003)(2906002)(8676002)(4326008)(41300700001)(66476007)(316002)(478600001)(2616005)(31696002)(6486002)(86362001)(6512007)(186003)(53546011)(6506007)(26005)(6666004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEw3S0llcGhiT21GbWsxbzlzUDFZbkFMSEpyczNoRlc1dXdIWDJPMzdPenM3?=
 =?utf-8?B?Wm1oNGYwcXdmRVF3Y0VDWWFKNVNSK0tkMWZneHhYdGFoQXFmZ09Jd1VNbGJW?=
 =?utf-8?B?VzB5WmljUUZGMFlQNDBkZ3ZLdnZwWk1SVmZGZ2I1YjFQZFV6ck5GS2VmbHdz?=
 =?utf-8?B?VkhseTVIa0wwQTY1R1FQSUxmNFJxOFBxdlZTRFdqcjd0RmdaM0JuaWRqamUx?=
 =?utf-8?B?UStQWDJBb2o1TFhxbk9FazQ4QTg4Y0lyNnNIaE5rOC9reWNrRnRzUVZ0ejZD?=
 =?utf-8?B?MEFldXVjZDJTazV0S00wbjUzcGJ2SGhHY1VwUmdmVTRrNzI2LzlWQ0hQV1Mx?=
 =?utf-8?B?QVZTMG9uNGZsVkN2QmFzMHpINEZObEFqSlY4UUgyRk0xWndEVjZGeUFIQWNu?=
 =?utf-8?B?ZXZnNUJ3bG9QajRqUHM0WksrVTVZTWNLSGNTNi90SXFYU2RYdVd1dEtVNFRq?=
 =?utf-8?B?azBCMktCaW9lVVl0eGVFUld5dCtxS09wcDRUWXluVm4zVENwVHRUemxsVjFm?=
 =?utf-8?B?QWZud1pybjk2ZmY5QlpxRFZrVWpWa3pmVmIwMHYzbmRLdGlxVGJYUkZTbjVD?=
 =?utf-8?B?M2RLTHdDNVhqWEVsdytKS1NjM3hOMWp6cW5xdkN5NjFTT1piZXVERFZleTJK?=
 =?utf-8?B?Qm1MbFN6SUVybW4renVXNGxoUHdMNUU0WXJFTUVCSDBHd0gwOFVza1QxeUwv?=
 =?utf-8?B?cFNkZzB2b2k4ZFRYZk0vTVBVd2kzeEoyUUpRK1FEc3BkWkw5TG9TUUVBNGFX?=
 =?utf-8?B?My81Y2JacnpxQzZjeVBQbDB0cW9XRmllOVhDWENOY2FSeG1maVdZYi9WUm1R?=
 =?utf-8?B?RVFpNUpVenVNeVZTWVBzeHBSOVlId0J1WTlmQWRObHZkamRwRTZIS2FQZ05n?=
 =?utf-8?B?dHRMYjRiQXI0TEljTmhobEhBRFBxR2RZLy91Q2tNelVGKzhSRSsvczE4KzZQ?=
 =?utf-8?B?SUhRcEhKcHJOTEJkVGxqbWt5VkhwaDRZVFZNeFZLK2s2emt3SjcxQkZPM2Fm?=
 =?utf-8?B?MTJQbzFOeDBqeGhYck8zekVudjYyV0FZVGNtRHl3UmtiVEtRVUpCRm1iSWUz?=
 =?utf-8?B?OHphNFREMnhlZmlxTllRcUdldUVNUHVPR24zVmZPVHRtN3F4QThlaXR5bGpk?=
 =?utf-8?B?TVhLcmJXOU1yenhpUmVhMG8veld3UGdyNmlnbjhuMXJnQ3AwSjhaemFBRTJp?=
 =?utf-8?B?TTc4NkZGMXZPbGptemZxb0hwekdMNFAybUdhWHJmUHAwV2lNRVJnRUtuU2d0?=
 =?utf-8?B?bVRHWlBtcjc5enpwWHRxZWJlTTlMK3BkSTlOUUx1MkZpcjV3V0l1d3hBaGdS?=
 =?utf-8?B?eEdSMjNBSFlORzdnZHJTQ2QreXNFbW0yd1ZzelVmWTdlenQrMHZMZmYrL1kv?=
 =?utf-8?B?eEk4YnpLcFVNTDFyUEpidDFZT0wwNHhlb2l4czBwT0VJeWxJSU41MWRjNERt?=
 =?utf-8?B?TWVmeGJZQmVlVncwRWlRZDhkNXUwRXRBbUp0RG51aGV6RFFzYXV0bGlKQzFY?=
 =?utf-8?B?NVdvOXRuZG9abjVybFg1aytJeW95UERaQTYvSzFEdDdDRWNmaXFndVlsN1RS?=
 =?utf-8?B?NTdtOFpOTmo4NGJqMW9MdkRRWC8rVm44OTZCcGZWVjFKeEc0NGRsVVdTTjlZ?=
 =?utf-8?B?RzgwaWhtNWFOV0dhQlFza3FpQUVSKzArNFMxTmVzMVQzbGtZWE11MlQ1UTBU?=
 =?utf-8?B?ZVFLREtuaW9oallUZE9OV0xPNkRPN2V4bSt3Q0xkVnoyVFNXZkFHQ25hcjE4?=
 =?utf-8?B?bE5Cc0lnem93dTk0eFRQZFJ3YWV1NEw1ZlA5ZU9VQjB1Tm1hSWsyQzdkWFBH?=
 =?utf-8?B?d2UyanRGRXFUVFFCSitBbTRlWnRjcUNYN216OVZlbWp6UU8vVWxWalV6TDNP?=
 =?utf-8?B?RFlXQnhINXk3emlkVFhKbDAvbS8rNzN2bVoyWHVxa2xINWJhUlZicTU1blFq?=
 =?utf-8?B?ci9FeWdlMGVQbzBwb0JvR2w2ZHZMT29ZZEFvQzRHR1UwZG5HV1hhTXhNOFc3?=
 =?utf-8?B?TzFXL3M3MEZhVGJiY25mWllNd0dQSDdVamQvdEd0TTJQa1lSa0JURWxOOG4w?=
 =?utf-8?B?MGg1dis3WkwyRFNOckdYbWwxdWY4eVB2b2ljenRDRXVja3lrcG9lcER3K0tS?=
 =?utf-8?Q?5um85QtjyyKlFs7CofWGVhbA+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a138a0-271b-48f3-2630-08db306f590d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 16:04:59.9445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RrdI829wka32hxmr3dYRHS+Ubz+DhzrYKMUR87BWxRqIZl38UV+X/Adju6y3tr7bGih8NaRkXSuUC30j6Cs7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6853
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Deepak R Varma <drv@mailo.com>,
 "Lee, Alvin" <Alvin.Lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/28/23 18:09, Caio Novais wrote:
> Compiling AMD GPU drivers displays a warning:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c: In function ‘dml_rq_dlg_get_dlg_params’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:991:14: warning: variable ‘scl_enable’ set but not used [-Wunused-but-set-variable]
> 
> Get rid of it by removing the variable 'scl_enable'.
> 
> Signed-off-by: Caio Novais <caionovais@usp.br>

Applied, thanks!

> ---
>   .../gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> index d1c2693a2e28..ea4eb66066c4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> @@ -988,7 +988,6 @@ static void dml_rq_dlg_get_dlg_params(
>   	double hratio_c;
>   	double vratio_l;
>   	double vratio_c;
> -	bool scl_enable;
>   
>   	unsigned int swath_width_ub_l;
>   	unsigned int dpte_groups_per_row_ub_l;
> @@ -1117,7 +1116,6 @@ static void dml_rq_dlg_get_dlg_params(
>   	hratio_c = scl->hscl_ratio_c;
>   	vratio_l = scl->vscl_ratio;
>   	vratio_c = scl->vscl_ratio_c;
> -	scl_enable = scl->scl_enable;
>   
>   	swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
>   	dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;

-- 
Hamza

