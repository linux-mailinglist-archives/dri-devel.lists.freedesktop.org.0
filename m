Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE15BEB69
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 18:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCC010E729;
	Tue, 20 Sep 2022 16:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3734A10E719
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 16:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsoxpSoNA1/qbwoACvqB9sPE0kUgBZ6CflSHgGKCnp2+bjpzR3QsgXpK5tBXDCmUjPLxIZfUjj8bWPwle3am8WXkTY9hImtOiioCQukGQgh0IdLqAghGgnvIMR4poKl1h4s5cl14l0112GAmcJjs4i/z3vauG7hR1V01WOLtHxA0zT/vHYHVLVjIXBES4wzK0P+edAk+dE5ZIa8CXJIKQWyJK+lVC9uG3a8+wtSoduiODuy0u3dnBCqWn8kTXjMTQXHEurNizdXkGjXetD0tSsCzPqQH+cvYTmIZsA1ubiF+PeWeEAOcIEktPQvj7Yy2ch5olJtycGEiFcy9Gh0SQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ4JXhxKUI1zsoJ05VFaiVr3hVV3o+jTm6EhiotmwU0=;
 b=mZIIjlh/GUcMMib0qnDgTbZrkC84G9JY56kJy7TtvX9NPtsToBX1cJU4A3RdmrS6aGFbTP8PZDP9A84u7iQoN9gHH6UGP6kMLqPncByPjTG8MAAIyG2o0A///gglk+0QHiCvP7ZffDtpOW8Veide8DC3rmATnZ8q5R76r2y/86lk7JnlLt47bqDlGCfDiWXj+iNY2tT28i1NlDq4uAjl1ii+8/04NxXS56Z8ptUIGlRT0fCK6aaZ1A1Swg1j/tt+NVfFKjScFwdUfMIbnHmvjQzNSehcehZyLGsjgjCRdY5PQS0rAPtnJLsa4ZMcpYR0ACYKWHaiFmibhpuQ1Egaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQ4JXhxKUI1zsoJ05VFaiVr3hVV3o+jTm6EhiotmwU0=;
 b=vODBUsOwYBcgxkO8NuSzvP3w9+CxhlAyACq7fbDxVGoLkochNHMkgvx7sLozqQb+sfk0CJN9Sg3LN2DM37IxFJyJ5weW/l4Ygsw1nxnWg+mTJmTDkHsUbgxakXIfSTVwgwDi5hTGV0tUinU+z/dRFzpX83wh5V6dHMaK8pMYCd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 16:54:31 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 16:54:31 +0000
Message-ID: <160580f4-103b-8b58-7b56-2fd6545c989e@amd.com>
Date: Tue, 20 Sep 2022 12:54:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] A simple doc fix
Content-Language: en-US
To: Anup K Parikh <parikhanupk.foss@gmail.com>, skhan@linuxfoundation.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <Yylh1Nst25I6u6Uh@autolfshost>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <Yylh1Nst25I6u6Uh@autolfshost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::20) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|DM4PR12MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f426f3-857d-4b28-de64-08da9b28c9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWfvNyOG8DcNa55UzxujHvAJCC2JitVJZWVdO66QYvZql3i+i+4C5Vv9wyCnppAwsDKAQPwOwRceu0Uf4e6P8hhDPhaVcbIiWB+jCnnOsAol/y4G+jDjHdkQkSgUDkV/ZtVd7wKvY6h0XYXPxTiPa8nK0I+jT7Y/y8XLbv82WjJItqYRXvMEcaRJXcGl1rYWcwGYSP1rmjC7jzmGCtcjqN1E/QN4AeXyntv0rd8gznk06WptL2GemYFNjD3Lhn+A8yzJoFXtpp9RJ3HchzW4FCFxhPJ/wsFuleH0zCyuAXq0skVXSZqlvYxRS03Di/js7uMuDZPqyWs3j1DqoW7BckLCWdnnYRVvxbASz7lUIJGDFNHv1hSbskBXtpGI5mb3+k3I0XdRLV0sOOcXzpdiWJvYVII7GmGsgw+BhfeD+uK8jW/U1RcZJVl193QdCmkoRljZWNRVWiQb5P4KB2+AlOe2XhlUatQgjvXZTj00PERwu/gv/jw97QNbaqDNMxNS91mcKzUGx9hVhBJ/mtyqeUX00+PGRY0tw2K9J5H6fQI9C5kAINGBSACJ9IF4EO48VK5TkdZHYQ0VgfkKtCDy94B3VbNyTzjnEcthMrs65K4k8Q4yWA2x/iO30K9NX4OukUAC5ay20Tdl3DDkgvn95YM6AAvt/pNrGQqTO7dfxr2mJNhGQ3GIuoSx5hRt9A6FRTE4Yp9HwGTzrDTnzBDWLeY/KgRdf7nol6/XA5BxWQfwJxgav7EzqnXXUqHEejtFEyU9/clTjH3lNS978f+HkfdHYctMbRGnU7XAAgHbDZWYz5KNiVyFgYrLQ3V6QAY1dwL/efFEa75xanF5qnQTKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(41300700001)(8936002)(86362001)(2906002)(66946007)(66476007)(8676002)(36756003)(4326008)(66556008)(31686004)(316002)(83380400001)(6512007)(53546011)(5660300002)(44832011)(6506007)(45080400002)(6666004)(31696002)(38100700002)(478600001)(186003)(2616005)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEZPN1VzY2NKS0luTDJOY3UxQ2ROZGlUU1VrcjVwL3dON1FHbnhwaXcreGta?=
 =?utf-8?B?U01UV1hBQUZTYnRldW9lZWV1TGhCNkdBdlRZTlgrNVpwWXdJbVFHazhFWGNV?=
 =?utf-8?B?STZmVE80NFpIM0xKczdwRzgvSng2YzZlalFpcGo5REQxQTduVlN6Z3lSZTdN?=
 =?utf-8?B?Mk1oSExFNTdHV0x4dSsvZng4ZnE2bUd5TExhOFpPdWtwT3ozeDdLYTRScWVZ?=
 =?utf-8?B?a05zaVEyUTBocGNaeUM2Mm5hR2dEQ3RoYjRQSkVncFZOLzVJZ24yVzVFV1NC?=
 =?utf-8?B?OTdGazMvM2NyR2UyZFUrR0J4T2JrRzQyakd2V2x2dm5mV0pyOWtwUGtpMlpq?=
 =?utf-8?B?ZW1ZTWtKT3JPSjF2VldYWW9OZ2ZZZ21QVGhrWE9qcjBqZ2ZKT2JwK0ZOYTlH?=
 =?utf-8?B?d05PZzVVQktobmd2WWN4STNVaXRFS1RRTVU5U3B1ZE54RzhVUXFqb2tiVDBk?=
 =?utf-8?B?cTM0dmFZRTQvT3NwYm11QXc1NFdpeXoySDJVVUxoS0cyME9MOWRlNE5yUXdO?=
 =?utf-8?B?VXpmbFN2OU5sdXVNRTcvdWZtMm01WmYxTXFEei9va1U5UzY0T20zbEtmek5O?=
 =?utf-8?B?TExWZWpaRktmc2VaWXp2VkZlYjZLR1FnekNuaDNNWkZybzNrRXR4cnE3RVlC?=
 =?utf-8?B?R3gxSUxpQkF4akRtVXVuU3ltQnlFMEtDdi9nVFZhc1ZvakZnTUxLQU1nQVZZ?=
 =?utf-8?B?ZE5VSktUamVaUE9sOS9VR1QyeTBJbWxvVkVaYWlJbS9iVUdjcmRBQUd3RUMz?=
 =?utf-8?B?Y0cvTWpDUWU4NGVzSEs3enVhNWU2RmxJU1NVbVUveEZqUDVLY1V5YlhyZ1hF?=
 =?utf-8?B?WHp5VkUyNWYvOTA2VEU2UUlOMHVrN2tiQjhsZnZnejhBa1l1ZCtuVTVxQjBP?=
 =?utf-8?B?YnRYaGc0UkVhMjg4VnIzdXoySWNpd2xQa3k3YlNmaTRxVDhKQzA2Y2VPTkJt?=
 =?utf-8?B?WkZXaE9lc0wzc3RjYWdzY2RSV09UOExyWnlPYW9nTDBwclVoZXFsWUhMNUNk?=
 =?utf-8?B?eEI4UWdnclZZU1RKSEkrejBLc3lWNGNGRTVRQy9EdEthZThNQkliMmJWQmky?=
 =?utf-8?B?ZnNNZ3FkNHZUdDZiTGFNYTF4anpyOEJIOUlRTStNdTZpaENndlpPakJwbGJW?=
 =?utf-8?B?NHM3RlZaRFhlanBwZThMMTVvUWhsbHM2cUoySmNKbFk3cmR4eXZITWxadjE0?=
 =?utf-8?B?SHE2YWRCb0ZpZDdJa1ZHNjBISjNDN2doUks2Y2x6ek51WW9mNDhFSHZ5YnhV?=
 =?utf-8?B?Z1lONEZHUGt2R0VKTUh4NlR5SjNLM21aOXNCZzc5cmVYU1lPOGhyRklOV0VH?=
 =?utf-8?B?U0FTemVicUM4QzhZZnJOMElxVk5kazNRTzVjdllNeXRZV0RKclBvYTNseTZo?=
 =?utf-8?B?RnlxN21FbnpPUGthNkdtaFpFMFFPZjh3Tnk4K0NYUkFMMzVxckNOVmtUQ2pH?=
 =?utf-8?B?YUlRZENzY3FmZnBCTFR2QWFSS0p1OHA0anpYTEFoc1ZZT3MrUm5mbGRENGxW?=
 =?utf-8?B?K3o0K1cwNC9DejdjSFlnbUo0WS8vUHdIY0hKSkxEdGlhQ0ZwZHFDOWlWNzQ0?=
 =?utf-8?B?L1VtOTBpT1BISmhzc2VXZXpydHFVcnpPZ1FMSHlCMGlEb3NwS3BNWlBhRFU2?=
 =?utf-8?B?bmNVZStkdnduSVcrbWFubTVQbjg5b3k1eVgxSmFQa3puM0xFS2phcHBmVW9x?=
 =?utf-8?B?MUg5OVVMYkNzZWJVcWIvRVpCRHJ0QjJxSUt2WVBRUjNlSE9hWVZGbDAxOVIr?=
 =?utf-8?B?SHVBNUI5eGJBWUdocWt6a2RmTFgxa3JtanhqUGtGTzk5ZHBTTVBZZDZiU1dT?=
 =?utf-8?B?UWxiL2tPUlA1SHBmcmc2UzkvdWpWdC82cFhKcllrVExHMklPSWdHeU1sTG5v?=
 =?utf-8?B?dm9UYUZUWklxMC9jSGRCRnlBMHJvSGdSb0FTek5iaExjcFJUT21jWTNTenFL?=
 =?utf-8?B?c0xkZXVZVGVISklMNnFxN3NWWU56eXhaZGQwbTVrRzhvRVFpRlVxMll0NVdG?=
 =?utf-8?B?M3dTbTM5V0VzbGN3V2RSQjBOK3lpbXhWVldvb0dWY1FLZFU5L2pIam44WVRr?=
 =?utf-8?B?ZnYyOVc2R2pjbTN1eXd0aTRNbWJuS3llREMzZHN2Wnh0RXcyQm93N2thZ3Nn?=
 =?utf-8?B?bmFuSG02OTQzRTFYcXhsVFBSZGtzUnlISHNZQnV1UkpKV2t4WjlLL3dlSHJW?=
 =?utf-8?Q?8agQ43pCST70kO4S0ff3qGJ2ZwY2HJ0GVaivFW0ZCCh6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f426f3-857d-4b28-de64-08da9b28c9ae
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 16:54:31.2586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LyWKIE0o0Kxyj6B8LesovQMYLv7//RNMYUjtZv8tQszGkYZI1ywXqYzo8H/QfBlqA4pAL5P9AdzmxtPMwqIuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Will push it to drm-misc-next

Thanks,

Andrey

On 2022-09-20 02:46, Anup K Parikh wrote:
> Fix two warnings during doc build which also results in corresponding
> additions in generated docs
>
> Warnings Fixed:
> 1. include/drm/gpu_scheduler.h:462: warning: Function parameter or member
>     'dev' not described in 'drm_gpu_scheduler'
> 2. drivers/gpu/drm/scheduler/sched_main.c:1005: warning: Function
>     parameter or member 'dev' not described in 'drm_sched_init'
>
> Signed-off-by: Anup K Parikh <parikhanupk.foss@gmail.com>
> ---
> Changes in v2:
>      Correct the doc strings according to
>      Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Ff528a8e4-5162-66d5-09da-5252076882b8%40amd.com%2F&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7Ccbef53d3f32845465ce908da9ad3f29b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637992532358603366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=PnHCvtDFVWnb25YkDfjHcmy9MBpLCA462xco799rjJs%3D&amp;reserved=0
>   drivers/gpu/drm/scheduler/sched_main.c | 2 ++
>   include/drm/gpu_scheduler.h            | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 68317d3a7a27..979685830671 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -994,6 +994,8 @@ static int drm_sched_main(void *param)
>    *		used
>    * @score: optional score atomic shared with other schedulers
>    * @name: name used for debugging
> + * @dev: A device pointer - primarily useful for printing standardized
> + *       messages with DRM_DEV_ERROR().
>    *
>    * Return 0 on success, otherwise error code.
>    */
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index addb135eeea6..80a525dd19bd 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -435,6 +435,8 @@ struct drm_sched_backend_ops {
>    * @_score: score used when the driver doesn't provide one
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
> + * @dev: A device pointer - primarily useful for printing standardized
> + *       messages with DRM_DEV_ERROR().
>    *
>    * One scheduler is implemented for each hardware ring.
>    */
