Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3385AFDC9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB2010E3D1;
	Wed,  7 Sep 2022 07:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A92D10E3BE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibTOWhBeUv73v/INWMozw/NvM5WAHiXKcOILr3qT+3MRw7vGXX+V+p0KCKiw80SL9iwbdnVzoYoBXCUFWAV2jIMmXljj/8yT7bGK/M12k+VEfCGZixGYypAgslvQMB3lyEhMe3qxfMSg5PTqhY1PkBiklIja0izUyX9yS8RMiFIEXqvDP1TTE3pI6oYYgCd+5h9JygzK8Nvl782s7X/oWPI2vev5tgDrpR/8KN6S6Q5wc6kKBelQWJmAH48shqWCXoSlNltFDBk1usOO+h7f8vfuzb8T41NCUGI4Zvmfm/emFM9NnJdmaZfVRdEtkq1t3T7JYUQN08UJMjaj6PKSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+Fj/bEJMwlqepfR2tbb2sIQr11UJjDvEO+7wdatJ2I=;
 b=ERqzIyPGvZUHWmD6Aw8hfkXoSq4qRj4a4dxiA8kBGHO0/3NNo1QQppeGPE+paW7mlrmapA0jheLAVnxkZ2JmLjtTZOIRys8PHucP4hupjIV9sS3WglKQ5UlzboY97l9rtGMzrv8J7/tT14pDiq5Fps1nWDtW2wOoyNcy9QRWPL/sAR2flIeriJKZXSxMzBj9jOFySFV40amldvqNwDz6YCUAnrtzpuV8wjMadSrKEAu9I3RbgBpxTlmh5vh8lvjQuFI7qVEtzCstMV/CCyjMkv3kgNqaJX27KQxjE1fRusCJHW6hxpIES+Ad8k5dVCHhTnOFMR8of8WNNwejlgAZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+Fj/bEJMwlqepfR2tbb2sIQr11UJjDvEO+7wdatJ2I=;
 b=M3B101TCKi2/U26UColuFwRiObe1x46wk5yRUk6v+2Z8ofpyFC/mutxXoEJNHG9tnVJ0voEDDoM9twAQsxBBzzfow+vT/ZBef2KtVxWtjKkJZx2dtpdccH4nm023Bc1MMykboup9hy52yCRkrQt4Twy0fKMdKzxnP+KuiJ/Beu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Wed, 7 Sep
 2022 07:44:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.012; Wed, 7 Sep 2022
 07:44:12 +0000
Message-ID: <c0c7747d-582f-9e90-b664-94f25c0c227f@amd.com>
Date: Wed, 7 Sep 2022 09:44:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: Remove unnecessary '0' values from ret
Content-Language: en-US
To: Li zeming <zeming@nfschina.com>, ray.huang@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220907032934.4490-1-zeming@nfschina.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220907032934.4490-1-zeming@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: f3372158-7dd1-424b-a62c-08da90a4c18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lnpd3JiP0HvxTLtGM9BCz91rnvid27+t/CW8ZUZRJdvZGBNK+2IleN4DK7xAi7PyI7JQs4ldNiM12K7wqyy3eNK4fib548IBikjIwIC8LD5axSCq2+dS6DqmR49//LEimmSm6VKa3Ljfnz6a0vd0fxV3mR48QlQ+ukVB3aYhPEZ0pB2YdYYGjjd3q0lM514p9DPtHjCSymbzvUpY4F1RJQ4Jz7WvvxsdElzmKi57iXWglWI3HbXPC0xoqC51i0ar3fmKYHGVWynBcrWsreYBdkHjlBRHfP0phMRumIfubEcoI46cYxm/QeR8iMDlbl6Wtxep/ReoSlD5HOcieMI/eqFNx8XBEFl+cCHemooJFu/UsyAxetzGbT4qqbK+OGkz14iiHxQLLXbbCN8RGrHK2QFRDEug5OsTcK1ZexQ4AvuHWSSfmPS7cEMGscx22p5XSD/2f6PDbDonilkGSxnGEz5fbqfm0NbNgHQYBEeJG+rsee9ZjlZaLkOOuZiREJB8mwNaIZsyMZQdcL83B6AHy30rhjnMZzfiofEyn9ARwv7e/t2JARI3W5XHtPMB0gb4qeGu5PH6RkaNqAr3bILoFZH1Jtc/0jCCA/Guy7MSQ6Pu6NswQYeZhQNxVn1X89ovx380nZhmQ2KTYuZIMgfg4Ga0q6Z4tKZ30RE461HK7SkiGL2hY23ODQPnCDfBtc/MyyiH5piNws3liHHYnWe7MUagtwHK1674p6BPfweCk7/GU6CewwzageDdK1bo60IPdTL9DGdfFmLpBEYM2h1Wze+uWEH9pi3Px3bjkZio0gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(8676002)(5660300002)(38100700002)(478600001)(6512007)(316002)(66946007)(66556008)(66476007)(4326008)(83380400001)(4744005)(8936002)(2616005)(186003)(6506007)(41300700001)(2906002)(6486002)(26005)(6666004)(31696002)(36756003)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDlxME9vZEN2cGp3WkFKUmEvMDYwL21OdjVrMVZhaWo3THY1dkEweEFnNk12?=
 =?utf-8?B?dkdIY05EN1QyUFczaklLVmJsaGkzQXR5cTlpZWZJQVNQYmNzdWVEaHR5Qmh3?=
 =?utf-8?B?RDdUOFoycFNMZWVTODFIZFljWWxyM25JMnV1NWZZeFR1cEhqNUJ2LytkdE9B?=
 =?utf-8?B?RkxnNHoxT2dpVWJzbUE0TXhaSXR5ZlYvR0xFWjlmeEpyREh4YmNIc0NBdnRR?=
 =?utf-8?B?NEFxUFBLcmZjaENBS2dmZEFwOXFwMDRrQmJWOHJFMVRYSXhpQkJ1S1J0SWtu?=
 =?utf-8?B?UFgwSlB3UUQyZTM0cWZHK2J4TVFpK1pMQjVmMHp0SVlrMVJpUzlBQTJiUFJR?=
 =?utf-8?B?KzFJNTVkTmticC9hNjE2MmJFUXAybk5TeUZsY2JlNEllSnBTcGpjcjQ5aXll?=
 =?utf-8?B?emttS2FmNjRETFhidkNqV0VBRWlkQzNVS1NwVmdHMzdaZkh2TUk0WC9lSits?=
 =?utf-8?B?endTano5R1FtNnFIalY4QnBOOVZxa1R2L0U0SDdYUWFPYkZkaFZGWWhxdGIz?=
 =?utf-8?B?alhSSDF1d2J4RzZyc3B4b1hMQ3JGUld3UVZvaktaZCtBVDRoSDNXak95aFJK?=
 =?utf-8?B?a0hQWHV4d2Z4TTM5c1FrWEZ5MU5QeHRmK3huZFBDTGQvOEpIaTAveUtDYUZ3?=
 =?utf-8?B?eXZHKy96YmZZR29DSHVWNmwwMjNPOE5zTmlYdFZpaGQ4M2MyakMyY0E0L3M3?=
 =?utf-8?B?cFRlV2lwU0JMVDZGMkkvSitDMjVoMlZKTVJkaFU0UFUxZFFRemowWDZBbFBo?=
 =?utf-8?B?Qm1sWEZ4WW1XNVhkeUFDaFY3MG1uMTNjUUJPRlFmam5RVHJrWmJYbVlFYTg4?=
 =?utf-8?B?dE1zVmxxZUpWOUF1UEpWQzBwTWhUR1VJTDBVRnA2VXBXU24raGRrcmZxRHpE?=
 =?utf-8?B?a3NUb3B4WVlmcFRXbHFTc0lJcUtOaUhDQW5HZFlOei9DTjBMdzE1VlljWDdW?=
 =?utf-8?B?WkprcXFWREIrZ2tWY1B1VEh6TDBoZnFFZ2RQcS9RVFNGY1gzMC9CNjlTUEJw?=
 =?utf-8?B?eE9rYVJHd3RNTXZzYVVVRXNyZGx3ektIeXNxWkViSzhKL3BWRlpnU2hMaDlS?=
 =?utf-8?B?cXJtTWgvczV1V2UwRVluVmZXZ2NqamR5NnhnWmthL1FuemtXc0JnRFZmMTFM?=
 =?utf-8?B?ZWd1VEErOUJTSEVheXFlRjVvSlF1MXJSSFplQkl0a3dhUC8vRm5XTGZNTkI5?=
 =?utf-8?B?Q3hWNm0yelBUbTR3b1pHVUdRMUc5K29HUE44MlE5Yk84ME9GbE5kUWpXR3g5?=
 =?utf-8?B?L0JCa3kyQ0JGNThVNi9LK2RZTjd4MHBsZGZpM0VWaHhudFpHVEhmZllEdzhp?=
 =?utf-8?B?dXg5YThYMUh1UnR6L0dCc25sOXFaYlpYdG1xYkJuOUhKMHJTZGh2MGpBQUZQ?=
 =?utf-8?B?SU9CbGIyWDBCUlIwMWsyR01WNUJnQzFNSERVdlhpSG9DbnI5RUpDMU43eEM5?=
 =?utf-8?B?dmxTNDZmaTdtNkhVWHR2TE90V2MrazlmVHlzd205RVpnMytZdEVjQjVNcUFq?=
 =?utf-8?B?NnBoMnMvcTVKdFJ0c1haVjdJU21nenhGWjdOaytIZENDNjB2by9ZUW1nZGNF?=
 =?utf-8?B?My9nNlp5R0FKQlJzOG92d2Q0QjNDbm9kdEMrRWFCS1B2bGhqbnVDNXg1MFF5?=
 =?utf-8?B?WjR1WUFMMTNXdHh2SExnWUhYbG9yRXZKM0pVQm0xRVdhcG5BZVhDNmMrVFho?=
 =?utf-8?B?NjBkcEM1SHJCY2FrOGFacTBiRW5iSmZVcXZvOTVQZFVEcUJZOU4raDNwa0NW?=
 =?utf-8?B?Y1VoSnlYbnBMSzRqY0JxbXkzU2FOeVhQcnRGMEc2YXZvQ2dOU3hZd3NMTGxM?=
 =?utf-8?B?OW9JaG9pWWlIMitEQ0lXYUpYZUpuQk9IcGZPZFBmS0dhUFJqc1hsRXpHb1Nn?=
 =?utf-8?B?UFVmVVhDU0NVTjE4Si9HRkZ2ZWhNWXVLZVJFYVAxcUsxcU02bkRuWkdMU2lS?=
 =?utf-8?B?eVEvQWJwQnlNN3k5MEd6dXBUZFN5YkRtcFplZXFWUHl1cThXMXBTTDhTVGFh?=
 =?utf-8?B?cEZNTEROWHI1S2RTd2grcU1ZQkVqMysrdTVsd2hPOHdYVmp4V1hFemNJTWN3?=
 =?utf-8?B?ZXlyWE9HcmZ0a1M0MFNVNVQwTTltWHJBS3RhMm9iTHo1UW9RYW9FalIrVEVU?=
 =?utf-8?Q?80ZGGPlGTglWg7W8M0/if983X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3372158-7dd1-424b-a62c-08da90a4c18f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 07:44:12.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FwnRyGUwacHD5qHLoSUlyv+GRCopwjPF65FA3zjQ8wnMxU4cPdF48Dh9IhrgaZ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313
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

Am 07.09.22 um 05:29 schrieb Li zeming:
> The variable ret is assigned in the judgment branch statement, he does
> not need to initialize the assignment.
>
> Signed-off-by: Li zeming <zeming@nfschina.com>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   include/drm/ttm/ttm_bo_driver.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 897b88f0bd59..1afa891f488a 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -106,7 +106,7 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
>   				 bool interruptible, bool no_wait,
>   				 struct ww_acquire_ctx *ticket)
>   {
> -	int ret = 0;
> +	int ret;
>   
>   	if (no_wait) {
>   		bool success;

