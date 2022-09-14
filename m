Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24035B8A64
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 16:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F7B10E93A;
	Wed, 14 Sep 2022 14:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755110E93A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 14:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DReekOeYfnPHn9osLEqemZnRtbiyWTCgJu91uFJrDeWIfM6qz3Qohkg2xSORy1KdxyoNO1G8E+Q93xQvjHrzqingJFE34O7dUQcWDQ59u25RowBYMie+cePcS2OV/rIcmESN/Zk9zE1g9xcxGAJuMtlWFiOYtiPHpx5iwfWnXD+0CzJL8Ul+IggsJP2v9Ih9D3SmywuwcY6VMn2EquhpfPhTxe/B4Jzfkull2yj0uZ5vlirsvHrs8oVnkBIGcXEsqUGVZP8871BNzhtxwakxIusak1D4gRY8RS8W4OaAGBKWAP2JQQcX5GE1zwhuniTa0L965bt+daiILt6Mi8MgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LEiJ6Q1vMm+T1oQeEnzfIVPugxFSgeNgr4I0Y63Adk=;
 b=eezgV4cN5zHEI5Wq94/TP3NJM08Bg+54rTV9bLh/Hyz4SDkMQAFyZySjmojqP81fYNH0CausKjWgSC+W4o+WPqiBcVpE4hW3c2T2ajtxbk7T8X+XL7xtc2SsIHrAAlibPfVtZzX7mXTv6DOhV+u3MHHRWcog7MwHiEGF2oMPNLpUJ2aa5UCkLFXe+LGZofAzHvYTWfsDBI9BywG+4aeO0Fd0DuaIC4pUeky7siT2ZjcCRt0UxC/wjGLCTUGflYJ/zmmX4PovGAAX09li3Htbn9/0BujO97X/YDQcrSHOTkX09slDx+zcwhQ3u2QLM8iLoO5qMWW+p0UNuFUa6e2xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LEiJ6Q1vMm+T1oQeEnzfIVPugxFSgeNgr4I0Y63Adk=;
 b=qtv+oVFGjoOJHi/GMRAa/QReXX0KqwDMqvkhHF1/l2wLdE2rRQHT4AdTcykQz4qdxJAUizOo17UpwHlmXnUbfZZOWOJ5nOQIIqCPIYzgyuNbLL2YebRn2jPlYoWYzhcPmAXvYjAfwGSV6rY31G41NKcoyV/rvtBqZAJpt5mYbY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1943.namprd12.prod.outlook.com (2603:10b6:903:11b::7)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 14:24:40 +0000
Received: from CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::a527:1309:e629:789e]) by CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::a527:1309:e629:789e%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 14:24:39 +0000
Message-ID: <5372b154-dc25-a917-9908-c59555afc865@amd.com>
Date: Wed, 14 Sep 2022 10:24:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] A simple doc fix
Content-Language: en-US
To: Anup K Parikh <parikhanupk.foss@gmail.com>, skhan@linuxfoundation.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <YyGuwqpuwq+PT3K1@autolfshost>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <YyGuwqpuwq+PT3K1@autolfshost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::23) To CY4PR12MB1943.namprd12.prod.outlook.com
 (2603:10b6:903:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR12MB1943:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 8246b6cf-06c1-4cde-919e-08da965cdb4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tuy0Ze3Ir6Jvia7hmHivsqrjb5cywmZhkJTdQLMx250Nr6H4Tqm9ROZp4FECp6AsKnM80tsB7zjNih10MT+AUmYGp1keW0EAI1CEfG0sQVn6lmGSjiyj1QiTmFrKYPJufejGXkUqWHpxH338/hKoJmrw12PNF6MmD00DwKls6sAV0Vna/gSJs/XdciFeQIqazlnNtS0U+8VjJ33uAu2SV5TuK32OGaOJ5EUdibPv8AyXwQS6PicpSIvs6BhKTDqkP8Qh4f35RQ9YbCzVTNIKf0X11Pte3F7ANopq+jm9MAFzZ1K9vzmgrKRUbD2vEf79fYv23uTyA2UZAEhSbFPOdPCmj2Tgjceitdzc34b4tq0qLucMtGRSMGCVA324JP39KnmJ/YhhWnjIsUhxPNpkcUeg9lK7b3mvpa2ipq2cP3yk3ScTUqlbetWXLaWzTU9Zpxx/g9JOCoZxgsBAc5ogR9zXZpKybCrP3vDQj2ohQn0Pyy9jK1Vvszg1dREk3BNaiRE8FVkYHca7KUh8H3zdrGlIX7nehc9QKtUxrEJPk8575c8jxiRwDAozb5yZZnyMiNeQ7d3bW5MBAelG9ByFwKNJu4EZxDrftBGPqIum18EbKMQHYIsQgx8MZXVgIgRjKPwG1AQmjGC3QDJ4dcS29NaZJPqiDeKyZfHkn5ojhMiFsbapo6bAr3AOsTlAfwYytjRyydMRnyo/Ao0DoBOpIzjUpmsPL877PPsv+lyWhMrVuubpcOqEb6+nhR5maUEK8qrfQZChK68xQplkhijTA3RVo3HzjKWOlKUhb9lP72I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(66946007)(83380400001)(4326008)(44832011)(38100700002)(2906002)(8936002)(186003)(6512007)(31696002)(6666004)(478600001)(41300700001)(53546011)(5660300002)(31686004)(8676002)(66476007)(6506007)(2616005)(66556008)(6486002)(36756003)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0pDOTVlS2MxVHpiWHVKMjhyMmlSb2dNVThTQldyU3pOdnJvbUp1UzVESm5j?=
 =?utf-8?B?Y09tbjVla0gvbXBnbGM5aVFUQ21DaGJVeXp5NjU1L0xuK1BzQTZ5WVM4aEdP?=
 =?utf-8?B?UjN3YjlIK3IwbE0yK1crYTBDVzhZWlRFYlFwc0JVV2NZNFJOOWU3TFpWUWcz?=
 =?utf-8?B?Q0ZleVUvemlHYTBqZUl5YTdOTjBzQkZTQ3J2Z2Jsb0JlaWVJZmxza2RYamFh?=
 =?utf-8?B?Q1JpN2RCMVcyaUFtb2F4NDBwUmY3U21UTkdCc2lWa1kzdVM2U1VrY1lYZFFN?=
 =?utf-8?B?ZHRVajZZa0hLS05VRkFFc0VMRHZxNGNzZTBmbmNNRmdERGdEb3Q1cHB0TnAz?=
 =?utf-8?B?bjFHZThpUVJuTlFSNGdUU3lUZkx5TzErSmk5eHlrdTF3aitlSGpkU2JjUng5?=
 =?utf-8?B?djNwcjgxa3lvcWJZN29NL1hDVzgrMVIySWpxSVdTT3FNVysvcnF0M3Y1QVo5?=
 =?utf-8?B?RFpaQnVWdVZoSjR2VUF1dkd5RTEveDgxZVZoUitlK3JQckxrWWhDeFQ4WnYw?=
 =?utf-8?B?KzNIMEhsdE4wTHNXeFlMNDVYN1JJM0MxUng4RzcweGRUNGd6bVBUd2J4Y3Ir?=
 =?utf-8?B?d0FhYmVXZ3RXa2ExNjh6T3NPU0FNR0xUOEl6SVgzSjVMZDZqb0Z1N09JUFZ1?=
 =?utf-8?B?V3MyQ0ZCYlh5M2NxdzJNQSt5Nk1mMnZHWldBY0hIWHVvZmdDY0xlckZWK2hs?=
 =?utf-8?B?U2JIU3pNYmRGWkV5N2tXaFQraGZkV0ovUGxvajlRUmJrTkc4QVBKdnVIUHMx?=
 =?utf-8?B?UFk1Tzk1ZUhSUjdkQjdJM3dGUFo1SVQrWjl2N0VBTGdXRzF2alU5eGJtdDJM?=
 =?utf-8?B?OVNvL2EwQSswYjNmeHR3dTdsTVdZTlFPVlFSdmlOb2FCOTRSOXp4QWdPS0VO?=
 =?utf-8?B?UXhONzZNdWRNU2RWc3o2ak1tT1V4dXY2dGIyb0l3VGRPSDVQNUs5dTd6YVpr?=
 =?utf-8?B?citTbjFXckpnQ211QUp3SFZyYVU3a0Z1SUZmdzBUa28zdE1rQklpdGxZSnVU?=
 =?utf-8?B?UHl0Q1Z1bnZESTRFSmV5ZnZhWmpzN2p4RkdVb0wxWVhxVGNvUmJ0Sk5XY2tW?=
 =?utf-8?B?Tm5abVdmZ2NDR2U0cUlxRk5uOGlIVkRLK2Q5MUJTL0F4VGtCUXJrZUhOUFhW?=
 =?utf-8?B?b2VQMTcwcVFzd2ZzWFcwbmRxNXp4eUtjRU92b0xJK0VSUFQ3QkZzOUZvNkhZ?=
 =?utf-8?B?Y3crTFlSWHQxTmtNS1FuUHlDWVlKWHVWaUtSQVM2cE1jTHBLOWdIWmF3QUF2?=
 =?utf-8?B?eCtxTkhuQ2tRNzQ2UElEYlE3RzFhMjFpckFXWWNmS2c5RGEySCtQeS9uZGJU?=
 =?utf-8?B?aGJQQ0x6N28zQ2NSRG5RV3JBS1ZLM3FzZ0dmRm84WUU4TGdZUWhPYlRrWEZR?=
 =?utf-8?B?WXhBZmNuZC9mcUhKbW1tcURNbmh4bjhBTWVxMVgxVHMzQUVOMEtuWGdnZ0pE?=
 =?utf-8?B?TGJCQyt5WGNMaTRqSlFCK2NsSWV3OW5WMmpoNWN1QnNQK0RIUlZJaGErMGFG?=
 =?utf-8?B?THhUY0tadEU5MXgyelZqZGZDTFB1RVBhVEphVVFZZks0a1pENDF4ZkRrcmZ1?=
 =?utf-8?B?U0tkWUo5VFpYVDdqT2ZDeVdJQ0drSEJ2YjFqU0UyWEwzRzBKaU5jMDdqSDJN?=
 =?utf-8?B?MmJyUVd5RVBYdGFSS2toTEgrM0ZFQ2tyb01LVW1aMi9NRmtjU1NVdEsrWk1t?=
 =?utf-8?B?Qnk0N1lmMVJ3Z3lUcW51T3lvOGVTUFJqb3hoeTdKTHBwbUlZenpKN3ltNm5P?=
 =?utf-8?B?b29yN0ZjbjRmNFZxemhacGFQWEhFei9yMDJnd3R3VWxxbEVCNEVNbDhWQnlO?=
 =?utf-8?B?U29TS29EeG5IOHBNNGFmbndzSmtoVnp6ZHRyUmV5d2U4NFk3RUpleWV6TjND?=
 =?utf-8?B?ZW02VFU2NGU0bVFWaXR5M016L1N0ZFVlanpqQmw2ODdUY2hmT1AxZXJaM1h2?=
 =?utf-8?B?MjJBd3BkNVpaN2FhZWx5Q0RlN29WZEVDUlpJNWhCaCtWZW5Dc1h0ZjdVRWxi?=
 =?utf-8?B?akVqTGVJSVAzcGFTOEFBZExIZVROdDUwVm1ReHpmRlY3cjh5cEtWY0xGVUhP?=
 =?utf-8?B?c2NpNzd0NjBTL0FoZ2Zpb0RseWtXL2NEVjM4NlpTVVZJZFRlNVB6QUM4NDEy?=
 =?utf-8?B?WFUvRU1rYlpkZjhtbmJpNWVhR1lYZE85SEUvMUFxUWtLaklLcCtZNVBqVTJl?=
 =?utf-8?Q?yYRRadX9+QsySnRWjJhHQMJF/+Cc7yAL5YkCSpGcHNlw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8246b6cf-06c1-4cde-919e-08da965cdb4e
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 14:24:39.5768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5R8MfDIvqeDy5zo00GD1YvNYvojQInzmNPJSGRJaZAEC6A654CM1ClYmKaE89AFcC39hJaXJ3tGbXpC5kdMLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919
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


On 2022-09-14 06:36, Anup K Parikh wrote:
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
>   drivers/gpu/drm/scheduler/sched_main.c | 1 +
>   include/drm/gpu_scheduler.h            | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 68317d3a7a27..875d00213849 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -994,6 +994,7 @@ static int drm_sched_main(void *param)
>    *		used
>    * @score: optional score atomic shared with other schedulers
>    * @name: name used for debugging
> + * @dev: A device pointer for use in error reporting in a multiple GPU scenario.


Why multiple GPUs scenario ? It's also used in single GPU scenario.

Andrey


>    *
>    * Return 0 on success, otherwise error code.
>    */
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index addb135eeea6..920b91fd1719 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -435,6 +435,7 @@ struct drm_sched_backend_ops {
>    * @_score: score used when the driver doesn't provide one
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
> + * @dev: A device pointer for use in error reporting in a multiple GPU scenario.
>    *
>    * One scheduler is implemented for each hardware ring.
>    */
