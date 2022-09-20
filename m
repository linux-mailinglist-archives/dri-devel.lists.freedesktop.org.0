Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C675BEB93
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 19:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F10A10E724;
	Tue, 20 Sep 2022 17:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A641310E724
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 17:07:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+fYwxoMLVId2NyUF60QHSxvvdkyjpnTcBF8Z/quvSCDms08qkeF0lhyuIqXmWABUMbyhve3EljkSEN4L5AXCOy0MU44jA3918guDm9CjMA7DN8X9bQRKGDiiDkHqWDbQ3lPq/NKqM0oikcg5rtaG1RJrFJHFgKk/7QwWtfKF1fJh1YvEG0yyn4izFFKmk5BJzU7rWiUCX50yGn5FB2Nt8dXiZbEmkZHm0jmieHEyugxTZmRKWNUzoN0uYsO5VztzaGk8YhQhdfnbSVRqZ3xTNnQt22k+mprUWuZO8+GuwX9w3mHvu7S04kklVkCPSPsgz5JCDSMo4OWzvZz+3jhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JW/BoRL6//WkNOJdR0ujFIOnkewLR6BAie6C2ZjBraM=;
 b=UrPRHNtu7ZdrCaWAjhdEQHMZMurVpUPzonNhV+Y1QvaX12xWmQOEltpxcRNlu/m1KbTGwGHuWqKJisSpVe6rOFWvQPusJX8+hbQGvracGqc87stXWr8HB593+VuABf6j8YezCsqILszkx0up08c3mFg302Wy/09GHHKO4kAxi6fdstq4X40M3YabPoAiQ2gME9+TxMT9/yHebepEKfQz2w65jh0LjqiIOMHmRGesj1gpZMcYzjzW+/+U/g3u5yxZsN0w6b/u0Gdx2vhva5dikGb8WjP8Uyp6zTajZt5XPU/JjXBBnaoHsX7n4xf5zVwU52r1VQaEv/1ZNdGkWc2v8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JW/BoRL6//WkNOJdR0ujFIOnkewLR6BAie6C2ZjBraM=;
 b=e5NJIiGtgq8TbsiasT+5sj1VAuCuCFhP9tlF1ft8LMIblrLgfx2vfAXBcHcLx1KYgYqZrIO9RXlo6hdPk4fh55PSTWZb4YHUGdeGmh4w7VKO5rf2yA3wvcLPCcsAVDFGKRPgigMsJkridll92dP8bSraEStbhxwc4DEuNSrIzgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by PH0PR12MB5418.namprd12.prod.outlook.com (2603:10b6:510:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 17:07:06 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 17:07:06 +0000
Message-ID: <52c849ad-2645-03c8-4907-07df6b2fc090@amd.com>
Date: Tue, 20 Sep 2022 13:07:04 -0400
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
X-ClientProxiedBy: YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::9) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|PH0PR12MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: a52713d2-51b9-47dc-6de9-08da9b2a8baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Md1SxmN6tzRx5svRrdKWuJFRskRnC6wRNZMpTn+w9IpRtuaplm87Cvn/gyesb+lFjwap7egymv4kNlq0YDDd0RKo2wFbP0meRINNl1xtr4no2llUbPwfkonpzo5SpE/KaDitdea9PzuZ1R8De0+e8LOoEAbbIioxt66rftlp9aeHC/BHeHkiwUZoUErq9S5ss/GYSa+myd9ps3ri3T7NETs/R+E1Zbu7o26bGxxb0JtFW0gz13KFDwBvFxGWhYcExxFVeux4pUo6bEpwhh1Cd+3LF2/PbW1oI1/3hJ9dLzubpUdOFrpBeD8DLHXn1pT54ML2SDZ8SMgLKqO3W0sPY43XjfGrByyax2gO0dh87Tiqx6lenHQtKcHE6bvmifH2wJWu2Apz8EGrKmav4hL8l5Ad6u743cwMzEXZsn+wRRg1emt2VjRjHOd4X7l4aPn5jEVBG1Z4ULrDKfS2zIAIFm1G/2k2yEH72GPkgxdgTX6hnG2XG60/WTv6Jr01jDR8ds+YxHHYuD0OT+iqIBZ6cmel/gM6khW8JcXJjDtmAnaUMNd/zumQA2Nadc8pZaHR2U4hO5wB/AoyiklViSuQWwq8fmoBsxN5l9MtJzIN6IJ7EhrDrEVsqFJSXb4QH76D75Tu4uglQ89wlVzGwXRevEcB/5QIGYyfhYt3GVwLUS9VvEbPaT10K0o6l0qB23xgwdBAphBNTAfoq8eNXP0mr1glp9eBbA37Db4+zqLhk5oDQz7tVoh4PMGkX5xkOaJi34wqlSCRtdcKmUua1udhpZN1El5z1A1OOxCiUWqUpwCfQglXCla2kwLAE/vjCipU/YKpyZODQI/humixi3jL9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(38100700002)(66946007)(186003)(2616005)(66556008)(66476007)(36756003)(83380400001)(2906002)(966005)(41300700001)(316002)(8936002)(53546011)(86362001)(4326008)(6486002)(6506007)(6512007)(8676002)(45080400002)(478600001)(31696002)(44832011)(5660300002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDFZTGFPVEx3aWFKZXBPQmJjZHJIdjFnTnRtZk9rbVFKdDU2MjRMY0Q4Q3Nx?=
 =?utf-8?B?RnlRQ09LaVc2U0FlU3VETUMwZWh0WHVoNVV0bHo0Zm9rWWVBKzR4TGxQK1lR?=
 =?utf-8?B?Q0ozd3hIaTUvMVMvWEx4MEl1SHN5N1ZmZ3FuY1RoN0FaajdCclhlcWtBMS91?=
 =?utf-8?B?NTdScGxsTm8vZ2tHVUlOUi9MRGRFQ1ZvRGtPWHROZi8xQUJ2U0FzNjRKajdW?=
 =?utf-8?B?cncvb1FXSXhrSHYrVWN1Yi9OUkhRUjl0RFM3aGYzOUc4dEx1S3pFUEkrV2dk?=
 =?utf-8?B?N3o5dHpIUVZ3WGpJVGhtN1U5VFJYVzlwY0tsUG8wYUJVQ2pjTUgrcExlbTl6?=
 =?utf-8?B?VFl3L2NoNnhZOUhkMlhRRXdZamY4RkhTcFduS2QyV3NhQmE4ZjNpQmNMTG5q?=
 =?utf-8?B?WS9VTXU0aHJpNFBpTGkvRkNiUE9uWS9XRElybW8zQnVKL1BKb3BHVENoRDhL?=
 =?utf-8?B?RVcxZnJlSVF3eTdpeUJoM041TzlQZnp6K0YyNnZRczRxaWhiM1phdGJadWtJ?=
 =?utf-8?B?RHhwanc0b2x3d0xnRFBKbE1GWG5oOFc3SGQ0dFpKYVZIWStUODV5bW9JUmpP?=
 =?utf-8?B?cWsrckpuU3VHalN2b0VJY21OMTFsRFlEQTBJcWxGM2QreHpLVTY4eEpkT0Yx?=
 =?utf-8?B?NG9tWXgweUxocnF0WVFmUkdaWHdHZjFxUWpVNVM5YWJsYnRYbWVhVTZHVUh2?=
 =?utf-8?B?Q0pMY3dDYklxUEorRUMzS0hTM3lVbXJ3TnV6QVl1bkN5T2lOVVdjUDc3WWdK?=
 =?utf-8?B?ZFA0QlhVbU5vSmVHUVNhQjM5WCtlbnhBeUNpQ2kxN0xaNDFueVgrQ3hTSDVT?=
 =?utf-8?B?bXFvMjZpSUZRMG9uTEJMaExNL0J4M1VCNzJBSXBIdDlVVUZ5VWtoelJKVkVL?=
 =?utf-8?B?OVRqM1I3bGJDZ2lma3BLNHl2MTdqSzJnbWVJczl0ZnBGV0xPNlNuU3NJbmlN?=
 =?utf-8?B?cFhZYXlxRExRYmJ1Yjg0Uk1EK2tqV2ZrYkNRd2ZEdXkvQ25BNUdGR0p5Uk9T?=
 =?utf-8?B?SzcySGJIRlRxeDlPczNWTWN1QjZaU0I1T0d3dXlTUitUTDBycVZIbHg3WUUy?=
 =?utf-8?B?LzU3SzdYWkFUcG9TUUErYTJNa0VIY2xDS2MxOEFwK3Q0QXV5YjJPQzNnRE1n?=
 =?utf-8?B?NWxIMmdpZGZUMjBOUUNHcEhXZndYQ1d4U05aM3lvdmVPa3VVUmhLN2FDVUM2?=
 =?utf-8?B?NnpWUjlNRWQ0MHg1SWxuc044NVBtbUxiaGdRcytzWnBldGQya2NrZEpGWWlK?=
 =?utf-8?B?cGR6amNSNFJlakpnRWdSdFh3WXFSVFRGd0c2Q1ZnMEVRQnAySWlEK2pIZ3BO?=
 =?utf-8?B?RXNCRjFYVHV5aGZBUVl5dEhIcDNmUkNpN2EySGVqQ1VvWDk2NGlmczZVK2hO?=
 =?utf-8?B?NXRLNEZ2VXpJYnpOWXhFTndtWklCY3crcFJhODJUcnd2bUxvL1lubnN2aXAz?=
 =?utf-8?B?TFU0UEp3K2lhZkJTTnRJbDJQWENjM2txdTRWRmovN25PRmE3L1FNMXpxU2FB?=
 =?utf-8?B?MjRRQk53MEo0ZUt2dnIrNWhLOUtXWmJjd2pLeWJpS3pkZ3k4dGlVdGJDZlZw?=
 =?utf-8?B?UHU4aSt2UHRRdFdHMEVQTk5GYThJMmppeE1VVXRtKzB6UDJMZVlEcGhuaEFK?=
 =?utf-8?B?TlNSblV2eUJxRXpYeUFmcktkaFBTYklZMlQ4U242ejVPanJ3ang0NlFmV0VI?=
 =?utf-8?B?Z0FINGs3cEo5QXp5M0xZR2N5OVRUSXZUVjJ4N3BOS1QvWWhsd1NvdFZOeG9U?=
 =?utf-8?B?WFk3SmVRVEZpa0k0TXIrcHlXQUNNVGEyTFhlM3ZFdG83d1ZPMWN0MURZWk9Y?=
 =?utf-8?B?ZTJJUWFEWVdtMGtMa3J5Rkh3MHo1d1o4amgxakRmUmxOTENlbXI5RkFUbk5l?=
 =?utf-8?B?WkFXWXBpZ1ZGak9OekN0M3Qyb2FNaU9BY2l0VDBEYXdIN2J2UHZMNnZtMFU0?=
 =?utf-8?B?Z04rby93SGNNU2FYdEJtL0hEUkl2RUsvV3Z1S3dKN0s0ZHdlOFpacXE0eHRL?=
 =?utf-8?B?RkxXR2ZyL0l1cnNBdGpZbWJiSzBVcGdVUm1ETGhYNHZUWDlxWlJxRncvSVk0?=
 =?utf-8?B?cUVLL1NTWW1YRnZLMVBFaW4xVkMwMmxVTS9SekpJK1E2UHB5alJpUnUwRTBv?=
 =?utf-8?B?ZUhKU1BHQzRhSzNaVmYwS3pMRzhPM2xaOHNaRGpjWjlwMmRPQWJTYmd3amZy?=
 =?utf-8?Q?Hoy9rhIruTVj9fQlCr/fn3c+AaJ2JEqwNkxgbOkL9IT7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52713d2-51b9-47dc-6de9-08da9b2a8baa
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 17:07:06.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ44CoZdvWBd00b7k8LzwjNgUHROVAipUESeJSxrVhY9R583RvT2WQxH4+YoVzOaYghNg7KDCHipxae4+1igDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
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

After rebasing to latest drm-misc-next to latest I actually see someone 
else already fixed this and other kerneldoc warnings so we can skip this 
patch.

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
