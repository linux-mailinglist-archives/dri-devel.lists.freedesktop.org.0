Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED36CA878
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 17:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331C910E3AA;
	Mon, 27 Mar 2023 15:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47FE10E3AA;
 Mon, 27 Mar 2023 15:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvpiiHhRAQMBs7RW/LV63hsPG8CAza3vYB25CgVzCwKoBl6/FBAnpYzS7PcoS3u1WqJJ0UpsFoi8EGs18LKTcDpajLZ7H6N9nbvpWARL9gNTznM4m3Sig6jBBNf6r+Cy3Cv1kL9+3V408wOEtJx+NPjpXn0Cska0y19zGIS9+aRYbLXqKRNSAmPHeCB8l34Cv6uzWsR4YbJWTi/Anvl2lmompIneusraJUSDzIKk8lBrHZQWwW9uVfSpeRAp+bqLSFj1mrjZJ+dRfl7GN9xjhFi4tIS9M41s6pEx7wy5Q/Z1XRzf9saO4R0INqN6iedCDgBZ+8sE+zz6AeiGQwV/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezmf1LSCQJeiilrVWuGaXsG7BT+op+gamW7yLgakgcY=;
 b=UX2IdU0vVjBZjCAyu6IQnqY5Odqvjy5IXtRH4J3n9nqHQ3q6TVKm1UiqpKbdcUvh+lDavLhEqeMV3btG6FlRFbE+IxGCmdfra9kFOM3eYkdrA8JzBcXoML+BZy28v5IPIIIHcwZMlyYREyRS2/GwN1URmMhRTNHLQLVAcQmQbE0cq8CJEfcrBd28TFxxbebpH8Av+Xl68arJsdSM4iEok+qlsGSEgGj7v3Sf/ljqWc9EFzwgG26QDrFPfcSx9PCHlZ2OG9wgkDZDldvXgvp6y5zpPzBXwUjS9heFJjcqKYk1eP4yCjuCXNj/1qboR8Ndf6GbNzqkRn6PDb/nRG2MTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezmf1LSCQJeiilrVWuGaXsG7BT+op+gamW7yLgakgcY=;
 b=nGOFcoPLThG60x0BSp1rFNN/1wMU3d1s7bW6qF6URQZYx7PpcSbyRhSkQII4OUfLqTC3O33UbiPJgDdgwOZQajRJqitanlkiWZ3LUG04UgVy9fXPZ+b2ovjGbbdTj5XzP6Pv4/ozStP0z/Kbmibv79gz5WpMtQ/85PDzJU/xJFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 15:02:10 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b877:9974:5a14:cc37]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b877:9974:5a14:cc37%4]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 15:02:10 +0000
Message-ID: <17ac25df-1e06-ae3a-e04e-831e20f00323@amd.com>
Date: Mon, 27 Mar 2023 11:02:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/scheduler: Fix variable name in function description
Content-Language: en-CA
To: Caio Novais <caionovais@usp.br>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230325131532.6356-1-caionovais@usp.br>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230325131532.6356-1-caionovais@usp.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0293.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3219aa-46ca-49f3-8d06-08db2ed43d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oYK3R5HU1LCuUIBuOKeM5DJ6EAEUJtSmUR8LWZ9y0A2JInwUVGL4fQkoRKhVHvuZDkcXFFjuiVXxoWM2V3Kzw7O+8aKSUWMoa4kuY1wzGAmN/IuTEZhXUvu7DQgSxm5YxFAC4LAVD43zzmgpd5qqLTjlj1ile9yC9AqEYTl5Y100mACs0MhbNscR4rYiD59PzATpOMmIlLgbmMOM8nNSs0KetIOEuqoNxTwXOU9LGs0iV7ZBQXbDkibHzUsCgCec0HB9ZYHCRPwJiMjp10lo0NZ6jhIWVvKMlLzU0Ymm39U79Er4YCKJh2GrnxyuBlH6tlTBJ2x0Uh243o3WHL8xVqfu9H1Twh+WnknS9622RbQ0WR+MJp5USCtNGqREVIpYI0Xoco5OD7jPbL3fDo9uv+Z5qUuQDejlqDKallrDtX5ZwPAEtG8bhI0regFBwF0Uyz0KCI1atw0zTW4l8Ka6T7LIjvVODnZlC9soc7/1myNAl6nKD2P6VQILPaEjAk9S1IuP5XNEVNqpskyVp7c1mlefVgF/CgoePwdQ77kXJ3fP2qOnliIKphf7BzP/3Ru8sV8vDh+ijZugHMLNJOVkQpZrGCccwqoG+tL4tR6MHifmHO2Oau8alT34CZtaaX2i4FeNXjs+0BhFqGxK3E8soQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(66476007)(66946007)(8676002)(66556008)(4326008)(316002)(5660300002)(38100700002)(41300700001)(8936002)(6512007)(186003)(53546011)(6506007)(2616005)(6486002)(83380400001)(6666004)(478600001)(44832011)(86362001)(31696002)(2906002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXFvWjl3dExzc0ZTL2U5ckJsNXIyRFNZZDVHQ0xaaG1Ja1BHNTVtcXZIQ29o?=
 =?utf-8?B?em5acWtCeFdnN0VxdDNIdkdOU3cvS2hvVmlFd0ZDaHZoR0xNNWh6TjNIUTdL?=
 =?utf-8?B?bmVoTHdGd3BWL2R6bjZHM3B0YWo1U2k4bFZGMGJVaGYxMzlNR2lYekU1QmxS?=
 =?utf-8?B?Znc3Y04xdGR4TnhZZkMxNVlPQ0h2dnlzRGRSajJocEdQc0pjU1VsWjZ2VTZx?=
 =?utf-8?B?Zjl0TG9Rc3ZXV1dOR2d6QndmSHZWNWV1MEs2QUxsd2dCanZJRHM3bnV5TzQ5?=
 =?utf-8?B?MzhobWdaM1Z5OFFMVEIrWHM3dk9PVmR6WFdodC9SdXBYRWV6U0gwVU1tSmt2?=
 =?utf-8?B?czJNV3JhWW9kRVkzcFJHZmlRbjFqTThFbWhWc1RKd2J4dUtaK2ppYnhpRXpv?=
 =?utf-8?B?ZDdhbGtibGVPbGd4NG1DdVo1NVFGQmdwYm82RFo2Zm45KzZQaDIxNDBPcnBh?=
 =?utf-8?B?S1pGZTlzQ2RWdDNZcGIwREtmOUhjaDI3MzRZMTk4M2JYNS9WaWpOb3FmQzNT?=
 =?utf-8?B?aE5zQkVZbzZ2dnc3cVB2Z2lOWFhvMm5DeGR2YkNUTUNCa0FjUGRkTUFxREFO?=
 =?utf-8?B?Q3Y3MEFJbHhQeDFHL0loWkk4UU9ZSC80Tjl6ZmQ2MW1HcTZ0Q2JDcU4zRG9k?=
 =?utf-8?B?eE44RHI5NllPUWZaWEhTcUpidGl6ejdVRitQaXYxZTdaV1lDMVBuaUpjMEdn?=
 =?utf-8?B?aGVwTk9CT3FHZTVzS1EwSTRydGVVK05mTklocWxhbVR3ZjBxd1NDZlpKbG1U?=
 =?utf-8?B?S2hwemJDQXNQR0JMSHFHaTZzWXhkRGZQVkhlaVFKTWFBa0dyMW0zTzVUdjBt?=
 =?utf-8?B?UWczQkE3aTlUTEFoZkk5NlFlYXdNelNiVU9ON1lVZ011bDJtbzE3NC94RVZY?=
 =?utf-8?B?R3R2YThZbjd2Nkc1bWZ5M1VQWGtKcHVXVnlINEZXY0MvbDNZRXBEWmxDN2Fv?=
 =?utf-8?B?K1YwRm90RlQ5UkQ2Wm9FLzZJZkdLTkR2ZWcwNzhzYUhTWmJhamFTdEY0bUlG?=
 =?utf-8?B?eEF3Um9WcTFDcmMwRUJsWXV4OXZ6RmE4eWlMZFBWR2NvbzZybUNLZWdaYjJa?=
 =?utf-8?B?bThoSnJKaFN5T2RoUEEyUmNmcDNSZGk2WEtHTkpKZGd4NE4wcFhwWTRUbFdo?=
 =?utf-8?B?RkQrYkZOOFNHOWIxR09tNE12MEtwbS9SN2pITWc0VmE5b1ZJUHpNNkJTTEJt?=
 =?utf-8?B?SnhTQXN4cDJjLzlSUHlOZHdRM2o2QWVacUJadTRCZmlQUlo0d0R3aHhmZVZY?=
 =?utf-8?B?Tkw2MHIrenhGUXRoWXoreUVjYVpXbUVndjg2YWxtU3dXRmFpdlZpS050Mlc4?=
 =?utf-8?B?TjA5dWRNN0JVVG8rUkVyci93S2k3bTZ5OEVQbEQwaVJGTTIvSDdZcVYyMWlh?=
 =?utf-8?B?eUxyNVdLSllNbHNnTTRJMjBHSGxUUGxTVEE4R2RZMk9YQldlTS9nVW54VTZM?=
 =?utf-8?B?cGxmTmlrQ1BPb3dIeGVaUi80NUZZUzIrTkpHdFpsOHdkK01BQThXZThhcERy?=
 =?utf-8?B?ckhMOVpYVkJJNlhob1l4NjlTbHV5aFFEcDh0Wmx5R0hPZDRTYWRCeUxGeVc2?=
 =?utf-8?B?WGJqVDAwWFdGRHNsODRGajFNM241aFVPY2lEU2VCR3VvWmoySktJOHlWdUZs?=
 =?utf-8?B?ckJwZnZWMndmNXNjd3BFSUJaTnJZOWNKeFBZaS9qdGRRLzNFbmdFY2lJdlpL?=
 =?utf-8?B?TkxEMWlGQTZpMjhDRVVnaHpPRTRJQ25vVEMvVDQxQ1hEcHYrSVNwK01iandB?=
 =?utf-8?B?bFNBVjlwSHRBWWxlS0hXaWxCNHdZR1RXVDBVbEtta2Q3Wk1OSFlGTUJ1SEk3?=
 =?utf-8?B?NVphYTlablEwbll5V2pTR1JBWU9ka0MybCtYSWhjWjZXNFJkeDJ5L0oxYjlZ?=
 =?utf-8?B?MjB1cXFIandZaHJqdm9qeHMzRDNrd3lvVjV3c2QvZ3VGbGdNNlZOOG9hOHRG?=
 =?utf-8?B?U0tOS3ZrWTZtTDlCampVaEJvS3NPaDZiKzFMN0hvUW11SXpFWjB2a293d2ll?=
 =?utf-8?B?QnRHeVVZemgyWUQ1OXIrMXVQYnduQ3ZOT1JMdjh5SnZGbm9OeVlGcHYvSkhv?=
 =?utf-8?B?MVdmRzFqWkNMTjVRWURYQis0VERZKzJ5eGxDaVpjQU1NVDU2RXhYQkUrY0xU?=
 =?utf-8?B?S0VPb0R5MitCNmJDWk9Jc05nS1g1ZFpxZUN3aFJtWWhVMGtGNGxrR0N6NWxS?=
 =?utf-8?Q?BZENBIatAD2W9uhSbrR05pxZD3PaJvsKnN7JzI37rUu1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3219aa-46ca-49f3-8d06-08db2ed43d32
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:02:09.9150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muk16Iz0zSWJxjaKecrehl5KiSbvdJdRXu8s4UKX2kuluClY0cFfw1X9CLPWclxb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the fix. I'll push this via amd-staging-drm-next.

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2023-03-25 09:15, Caio Novais wrote:
> Compiling AMD GPU drivers displays two warnings:
> 
> drivers/gpu/drm/scheduler/sched_main.c:738: warning: Function parameter or member 'file' not described in 'drm_sched_job_add_syncobj_dependency'
> drivers/gpu/drm/scheduler/sched_main.c:738: warning: Excess function
> parameter 'file_private' description in
> 'drm_sched_job_add_syncobj_dependency'
> 
> Get rid of them by renaming the variable name on the function description
> 
> Signed-off-by: Caio Novais <caionovais@usp.br>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 214364fccb71..7db586e6fce6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -722,7 +722,7 @@ EXPORT_SYMBOL(drm_sched_job_add_dependency);
>  /**
>   * drm_sched_job_add_syncobj_dependency - adds a syncobj's fence as a job dependency
>   * @job: scheduler job to add the dependencies to
> - * @file_private: drm file private pointer
> + * @file: drm file private pointer
>   * @handle: syncobj handle to lookup
>   * @point: timeline point
>   *

