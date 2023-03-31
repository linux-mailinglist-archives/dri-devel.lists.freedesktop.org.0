Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DEB6D2360
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 17:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056610F296;
	Fri, 31 Mar 2023 15:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428E110F2B9;
 Fri, 31 Mar 2023 15:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7j9KGTue/p+soch2GH+SpVVNBDC7jW7Jqw1yO47Pc2yu2PlSZP9kVQB8dtgskZmGuqKDV/lLknVnlQGYlz2IrVCaXD0a0biYRofm+Ia+UGqCeG+wqiMSvCO6ghtaXSTp4vMa000vUUj4LD6QYqPf3TV3+P4/5bPFP0HjxpWE44bcPmz6QD0+/c0IalfBz2Tjwt4dQ69LrWl+oM6h/Sex3kDjl81YcC4Gby9mtxxJTQyIO0Pa84Wh7CL7XHYYgUQmJPdzb4i9rhDfYnKO5w2tBVCmcZgSBKrHoZYMAu3nRCLKwRFxD6bC/U9Sy9J2bmjB5nrukgyLIlqhUJHaXPRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8OkWdTZyukZI3YJ2VF8km93+RWgsgG07Akig3m0inU=;
 b=b05MyRwj1kOlJhG7l+xZ4BeVC1mA9fi8kRb25y8eFDgayj5MFZ8Nu0v5jlQFfjX9/K8S+kWIFG7G3vj7FLLRuZfu7AJSN4eYUC4S2dQnFndMh78vYkOj9G7e/p3iiFAZg1+XrgmrDzJq9VL80RuGT4dfTr+hLuuTVnNzXo0EbzUnef9xc5zbMtFUXxVXOlds2OtKAjKpR+hosJosfXXMgPnsqP7n5L0qrw7DRRMVk6Iy9DGzTtuKRBlVXj6SOB95kwTjiOFYCbARAvINfmY3T7ih3ZhpdHaG1Ui/t/7c8jelso3Gcskk0ADCglYuCz6HwlskqoyYFolDYTFB/5+pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8OkWdTZyukZI3YJ2VF8km93+RWgsgG07Akig3m0inU=;
 b=LTKBapFHPW44MQo3RDQVMkOE9ah4ODpdh7u2ueVskgNmsBb648QuFs0bNMNgak8kUp24GIr5FSxDq+H5AEI2PYdXb8qf0O88n96SwqyXxiCK0yLueXcJqLuYjNAxdx0dUtBZFtwaDvaQU0b6vhT0OMLuHHtMEDAYWDI75fNO6TM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 15:00:04 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 15:00:04 +0000
Message-ID: <fbf84e6b-438c-0486-1ee3-7bb1171b2c0a@amd.com>
Date: Fri, 31 Mar 2023 11:01:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/amd/display: remove unused average_render_time_in_us
 and i variables
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 aric.cyr@amd.com, HaoPing.Liu@amd.com, Anthony.Koo@amd.com,
 hanghong.ma@amd.com, Angus.Wang@amd.com, Dillon.Varone@amd.com
References: <20230331001032.1846456-1-trix@redhat.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230331001032.1846456-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0384.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::13) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|BN9PR12MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 1013ea79-ccd1-4f50-dff2-08db31f89bd4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRX1kGT22mZPuSpFaCsdEI1zJuGuahmZ3j8z5N4kxZ/lUd9kj5111CrA88Cog+U433oYdnvCbjGNNiK61btqomkK81bogF+LAPl61H0TKD8tqiFQs++Aw+fxYCjykiiDeUFh8P4oxe5soECKwODcsr29iSoGb8uB6lmJZ765LipzEV5fdgqOuacTfjFXeWKUIWBtMUex7MqAdQDUUs1FAmeygS40Jkq6w74Ni7MywyVixRoMMxR3k1xH5a3uPurVoPnHJCBTpqPwvQOio1yxUKr7WSn0eUyUSV6weGqqYscvKFSKe6mjwb+W0pKEJFXeV80mRpM4rfmZkVfrAL9ULPjOU8h76HiBjr7cnvFb+GTN7Ho03Cgsvk65HQXfdrKxgHtSRvCQXDzuV41U6fXHQdu1hDs+wa0GTCbTGhnirIEgwaIcls5pMVSJ0DQO5/4GTy8AaMaeBB4NIVI33UHb5eU486iNNTCgigvavdFKAkaZl2gf/1VoYCY2PT/+oPgMLy658RrgGRqzGuS3xF+g5cqILkUFJwLDfY92oD2Bb25xyffNsFCqKGtz2Bz9A5UnINrMDjguOQ6CKZPLmkDHhS0kGBLBDFQzqKozfYoeFfX2MhHgKLUZCw8DOiWyeG+oIaZROlzzT7+H4cpCryZXhtRaLfeSi1AvYOh8s3U/19Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(2616005)(6636002)(83380400001)(6486002)(316002)(186003)(6666004)(53546011)(6506007)(26005)(2906002)(478600001)(6512007)(8936002)(4326008)(5660300002)(36756003)(38100700002)(921005)(44832011)(66556008)(31696002)(41300700001)(66476007)(66946007)(8676002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2pDT2g2YjVRQzVISHNaOUNab25HRzVnWkZkR091eC90N21KN1lUK2R3aUNn?=
 =?utf-8?B?Wi9mcDFxWm81NWdvbUpGRXdlZFFLUWVWN2RFcCs1TEs0cDJGbjlQS2ZIbWhK?=
 =?utf-8?B?L21aNmRkVWwrQ1ZiV0dHelFiUmZQdU9WZ3FRTi9ZTUtNUUM0VmxlWVFBdFoz?=
 =?utf-8?B?ckdiSHdTYVpZY2dYYnlvd2hRRHJVekpWY0dhRHVUMUo3a1dOSWpJZUoydElP?=
 =?utf-8?B?ZURpRmlwK3RqSFhwUGQ2bVk0VzE0SEJ4WlBoMllHdEl5ZEIwejhGOHFKQWlx?=
 =?utf-8?B?ZGxueHhqbFh5Sk9aUlVYNmRhSThwdi9yUDVzYnA4SjhaY2dUNTVJUHBHbGRJ?=
 =?utf-8?B?SUJYVnhBYkxNVDJFamNKVnNrTjNXOFhReTRmRTd4c2dsclA5Nk0vZEVjeVRO?=
 =?utf-8?B?SlNKMStoR3ZlTHRCWW8ya2Q2bU5CZWZFQ20zaU5pMjlkdjhOdUdrSlUyNGFl?=
 =?utf-8?B?dXhleEhxcThFVlIyWWRUQ2doZ1UzWGdFdktsK0ZZT1c5T3h0ZGExTWZSUFFh?=
 =?utf-8?B?UVFDek5PMWxWRWJJSTZHV1ZVWS9QR2VieHdZUHVMeHRTOUhya1MvY0lmTDZH?=
 =?utf-8?B?SG84NWg0QmFZSk9TcVE4Ynlnd1hxQ0lXN0VwSFBpU250NGg5K0doZ25MZnBJ?=
 =?utf-8?B?SUxLckhUWDJ6Sm8zR3RBYWI4aEE5T2FvRlREeVFmcVVrN3d6ZlUxNVQ1dmlS?=
 =?utf-8?B?Mzh0M2d1eS9TYS9NZ205TURFeUYwYmZMSDNGbFdJeXRoUlZOZnJVd05zT29D?=
 =?utf-8?B?ZXlLOWhidmIxUG0vWitIVWhON1dtVXdNaithMU9QSnFmbjV0VDZXQzRXUU9J?=
 =?utf-8?B?VitZOGR6WFdPUFFsZDhveEEyb2FMVEpkQTI2bU03MmRsWEtnalhLQ2xpdkhF?=
 =?utf-8?B?U1U3dEZtV1ErWUVNcmtlUnB1Q202T1E1LzBRQjUwVU8vb24xc09PVU9HeFRn?=
 =?utf-8?B?MVQrekQyK3JQTUwzOWUzRTFaZk5PdGVFQy84MW9WeVVaMzVac0JOczc2REY4?=
 =?utf-8?B?c044TGlvY1VSckZFZmFQY0N3dmdadGRaRTV2cWsvREhhWGYwU0ZTSVNtQXY3?=
 =?utf-8?B?ZkZDNnB1aTdReTZqaVVMQ3pBUU5EOStRRWUvTUpGUWdyNTNlRm11YXVwZUZI?=
 =?utf-8?B?a0hTckpiN0FrcUpBNytZRjl2WXZIZWprdVkvdjFYRWRJUEhvV2pKV0E3V0o5?=
 =?utf-8?B?dmJhK1dtUzBCd1dpemZCRytSbW4vdFpJekdTbkpkQVJETllNeTcxemtUeGhW?=
 =?utf-8?B?eXdlQWlHWUphKzVocXhxSWk3bnBhMWNXZzJMUkxxMnBKUlgyaS9aYktTMzAx?=
 =?utf-8?B?OFZGdC9OWGJwdGRGMWtSRGpkN3RvTVZ6Zy82blJpSlYwZU9jWFUvTUtDUHls?=
 =?utf-8?B?VVY3cWhsOTRoU01DY0lyaDVGSkpnQjVGZ1Z3emltRFpYTmhtVGg4ZEpVRnZu?=
 =?utf-8?B?UzZOY0R5T0JyK3k0UlVLMDhQQSt5bm1HTGpyTC9NeDZ0cHlBOXcrQ0Z1WnhC?=
 =?utf-8?B?STUxY05jRm50TTlWOXBURVZFK21QT0J2ZzJ4VCtoRVVmai9LejQwVm11R0d3?=
 =?utf-8?B?dHpRbGhNaDBKTGwxTHZkTUExS1NTN0dYdVdxTWw2V1FEUFRFV0kxait2S2Ro?=
 =?utf-8?B?SnJvQ2VNTU1na295QU9WVmZXclVlL1BjbkxoSGlrR0dpMitCc2NBSEZTQ3dG?=
 =?utf-8?B?SE1ZQzNqazZKbHd3ejllbWRWeDVNRnJKMFRqcVFsMWR1ZlRvdE0xSkNqUzQw?=
 =?utf-8?B?a1VzenZ1cXBQVUJHVnVlUkg5czQzcGh2c2o5bWI2U0NEdzRjNnJ2K0RmN0Z2?=
 =?utf-8?B?d0NmOW85bDVENXdPL0QvLzlmNTJaeUFucmRkUjhUd3lXVmZ2Uno1YktvMklI?=
 =?utf-8?B?RVU2ekpON0N3TzMwZm9ydGJFak15Rm9RK3lYc0JFOVJNeDY5TVZkYjJaaEF2?=
 =?utf-8?B?QU1SNmtDZ3BKU051U2VuanhMVGlrUVhGRmp3WDJLczNhWjFvRVErUkltUjNv?=
 =?utf-8?B?ZnNtZ2hKT3paNGNaV082SHhSTFR2RElUTzB1R3dOUGcvSDBQR3JFdDh0RWJo?=
 =?utf-8?B?T25IM2hlZUdJRUpZclhaOEZHUWpEOWJ6MlVxZjN0dzRSVmhqbitQUkJxUDh5?=
 =?utf-8?Q?hh9XO3TCoN3U6EZojJoed7onx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1013ea79-ccd1-4f50-dff2-08db31f89bd4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 15:00:04.3630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBbCcrPxJgWt5t9r3W2HZdgNXmzMR/+5PhawQv00Dry4DA5XBSRyQRhC8g56YUWEMmf15PvrCy8uBXR/RkvS4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226
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
Cc: llvm@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/23 20:10, Tom Rix wrote:
> clang with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1132:15: error: variable
>    'average_render_time_in_us' set but not used [-Werror,-Wunused-but-set-variable]
>          unsigned int average_render_time_in_us = 0;
>                       ^
> This variable is not used so remove it, which caused i to be unused so remove that as well.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   .../drm/amd/display/modules/freesync/freesync.c    | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> index 315da61ee897..5c41a4751db4 100644
> --- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> +++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> @@ -1129,7 +1129,6 @@ void mod_freesync_handle_preflip(struct mod_freesync *mod_freesync,
>   {
>   	struct core_freesync *core_freesync = NULL;
>   	unsigned int last_render_time_in_us = 0;
> -	unsigned int average_render_time_in_us = 0;
>   
>   	if (mod_freesync == NULL)
>   		return;
> @@ -1138,7 +1137,6 @@ void mod_freesync_handle_preflip(struct mod_freesync *mod_freesync,
>   
>   	if (in_out_vrr->supported &&
>   			in_out_vrr->state == VRR_STATE_ACTIVE_VARIABLE) {
> -		unsigned int i = 0;
>   		unsigned int oldest_index = plane->time.index + 1;
>   
>   		if (oldest_index >= DC_PLANE_UPDATE_TIMES_MAX)
> @@ -1147,18 +1145,6 @@ void mod_freesync_handle_preflip(struct mod_freesync *mod_freesync,
>   		last_render_time_in_us = curr_time_stamp_in_us -
>   				plane->time.prev_update_time_in_us;
>   
> -		/* Sum off all entries except oldest one */
> -		for (i = 0; i < DC_PLANE_UPDATE_TIMES_MAX; i++) {
> -			average_render_time_in_us +=
> -					plane->time.time_elapsed_in_us[i];
> -		}
> -		average_render_time_in_us -=
> -				plane->time.time_elapsed_in_us[oldest_index];
> -
> -		/* Add render time for current flip */
> -		average_render_time_in_us += last_render_time_in_us;
> -		average_render_time_in_us /= DC_PLANE_UPDATE_TIMES_MAX;
> -
>   		if (in_out_vrr->btr.btr_enabled) {
>   			apply_below_the_range(core_freesync,
>   					stream,
-- 
Hamza

