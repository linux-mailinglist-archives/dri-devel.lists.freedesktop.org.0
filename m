Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9206744105
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F30110E4CE;
	Fri, 30 Jun 2023 17:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5468D10E4CD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 17:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3GlaLxekIw5NobA4Hxaqf0OfNQnfhezpyg7rGchw0Vz4ShUB8UuDY7p5fNpfDxl4MIgUTMccdVydKmp2xjQYe9JCIuh5bfYUFZ/rPiOgerg/NYNWWZpubyouD1KYbs1QfVlXoj3FwRrwHJMvAghcvR/IbYMXMdfpGfxlwka6ch8P16DgCCcu4BWJogDygiJQhZSu7xgCc19YLKC7Q1xri/zV+XW7Try75OZm8I6KxshAEcBIghJdo6y7Pwhg0ijXFqxpNQWmPzCvxgHvRjKDxgfEWwHMsdM4gmmqv6aBiXTEFabhQhrYp2KYZOjnLD2Wtr1WgrXKmzjFxEOLPt8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QinjLaTa3dTC/TtbQB9oVbdQUBM0QeTHUHOQqA5JF+c=;
 b=c5mHID9ZGmW8SmBQlW2G7iBLwaGS1MSsHimD6IzEw85S7ZJCr8IoN3CAWI5NuO6KZNQyWisQcC5GwVXhGeo36bAbEDyYMU8LGCoq309Yj7QcNnlxHxm8VYagoew6LJMoKwGKD25/BRQ5l/jQq5KJZcviiV5SrOFG+UdZcMS3soHAmMPOgKYglTqMQ7368E7+w0FTuKZjNLsjbbpiDMYtGF3SaTzZgTJl/4/cXHY4lJFApVMPrfCX0o/U176spb7QJbTdF6fWr3zdcD4VVvQ/jpJ4TKqTmx4RVx1i4pqxmGAFIACfyVIc+aVtsQW+n8bAjEX1kqCl9CN9wbtm0Swvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QinjLaTa3dTC/TtbQB9oVbdQUBM0QeTHUHOQqA5JF+c=;
 b=1xNaL9IsDPK801NNXasCYokXOM5Z668tjvm76xYdb7TRXCqG2FkmubTT6bh6KjDUQxU5baGVs6BG5HYVqgBCg0/lG4caOb1oiw8j9eDuTJobXtGcHQOcBbwW03wweOWNcepv+1dAKPELki8OtWc35dOHiYvAGyrDch+j2rd7GTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 17:19:17 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 17:19:17 +0000
Message-ID: <5d7578de-13a1-35e3-f751-187d15e50b77@amd.com>
Date: Fri, 30 Jun 2023 13:19:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 juan.hao@nxp.com, dri-devel@lists.freedesktop.org
References: <20230630120041.109216-1-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences v3
In-Reply-To: <20230630120041.109216-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0400.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::10) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA3PR12MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1faa8f-da1a-464f-3321-08db798e2226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTGLO+ZRzAPBbFkGPyV10R5eHeCjIUZMD7dTjzGorYy8mUjyCuhxcA3gIcjAfT7Qtk9bgsA/OERmm1yWonab3AwygPo5KP7O1y4NjVc7j5quulr7y1QNcJCvKF46sbXrNACNi4BR3aw5x/juibGY/edm+bR2Qxt/I1yWYz+qNib7goAJNbq607d0g44sHXzMsWDl5Rqn6FCaAQ8xjatydfGX6RY1Z4nVxgsUrqM7hI2HCpLUuL/EXriC340EsND4aYwd2yuMg2wLK2RMJnyVhjmA9Xg5ixlWC8nUWjKmxsdMV8RRUDL0Kc6XSqYnLxljDt/RUdPZsmXkEjVKQELotl9IZGlv49yFN2tTM0UDaeRhrQzoaHiLVbTVFjPpR4qdT+mw6/9blWqkKJZSXWC+sq4ywgyGJz+IsNWVtP3dd5gmrses1MX9OTLN9apYwNrjpbZ/G4sU5DBAsiR0QQbnbzu6HbcaizUcxqY/4q9QfhRJ9M7oxtKGU7sHsP5O6EmPnbB+VB8An1KK0QTQ2qA0cewS+yEGEV/8i+Sw6uyuplcGYeA7r8UGYjkXmXRFuTRdKIkufG/pZ1a3jHEaENcql56Zu2uXWsg8pkdB6jciYz8SAPntTVvWSJlkJa2fWpAoipPrm9aA/RaE6qqe/c/huw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(38100700002)(31696002)(86362001)(53546011)(6506007)(5660300002)(6512007)(66556008)(66476007)(66946007)(2616005)(44832011)(186003)(26005)(478600001)(2906002)(8676002)(316002)(41300700001)(6486002)(8936002)(66574015)(83380400001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFaQjMrUEhWSU5sdmFEdzh3ZWlqd1l6SFRHWWNmQXdCVVNXRUs4OWxqWHU1?=
 =?utf-8?B?UE4ydTR4dk0wVXNIUWNMdmNKSnJ6SVRDdWpST3Z0c1I0aFlqM1gzOUpCRnBD?=
 =?utf-8?B?QzFscExFaldWTHlGN0dBTUVCOEVUcFNiY2JBTFVvdEhJZitIUUU5eXdRWmtE?=
 =?utf-8?B?Y0w4bVpVaCtrWTFSbjVkOHJKKzNIVzdrTDZLNkIyWElYSHlCdEV5ZWd1Nm9u?=
 =?utf-8?B?U3drOUlza3g2d1BCTlpUSE5xTXdnb1VnZ1hLV04xcE45YzltQmdmZTJHVkFY?=
 =?utf-8?B?UGc3R3NTUXFIeVR2OVBicFNMNkRkZTBDVDR2U25pSlB1eTFnaHlyMzBQanlZ?=
 =?utf-8?B?b0RMT0NsOHNkTDFORVo5T2pCVzBIdklEN2dabmFpYitWcGgwNlNyQU9FN2dT?=
 =?utf-8?B?ancvMkgrOXhFNjZ4Q3Ria3B3V2xZL0t3M1hvTUFHRUdpNTlOZklLYVJqM3J0?=
 =?utf-8?B?NjJHWUF5aFZuMEc3a2hzaXlaRXZKbWxZdjVsb1FKYUY5WG95SHpkL0VZVUNE?=
 =?utf-8?B?ZkJObG9LNG9wMzJhaDBmQlJJWjQzK3Vod1NqbktLMFZCZFFKTCs0emJuY3Jo?=
 =?utf-8?B?NWVIbGJYOW9vczBzU1Y4Z1hQOWJISUVoNGJvdjJZOW41ZTVYbXRiVDk5dG9k?=
 =?utf-8?B?eTVzbG5TRG1XemhvdGgwNVBhTitvdjBoSVRKZldWem1PUEFzcHMzRXRJV2VE?=
 =?utf-8?B?amlzM1hsTEwwQkVDbitiR0RCYTIvUUwyWkpDRzFFeC92cHpXc3hQdi9MVnlj?=
 =?utf-8?B?aHM2dURpUHkzWmh6MlM1eDIwTk1uM0E2Z2dwc1V6UVN3NGFkSFB5M3lEd0U2?=
 =?utf-8?B?LzFRYjBnMkhrVHpiNWNPNXZBQ3ZNYWxneVZjY1ZUNGhEWHBucWxkbE5zemps?=
 =?utf-8?B?czFtbDlmcU1nWVE4c0JaMGcvNmw2KzBsYkFwMXhFOWlZdXdQSE1QTEY0WEM0?=
 =?utf-8?B?alR4clJPVlQ4S3J1U1UvTG93V05LNExVaTR1ZVp5am5peE5TMGFYS29SUWFH?=
 =?utf-8?B?MW11TytNSzcramc4OGM3MDVwOE9VOTR6bHJuME9Ba1IwaTVjMUtEaE1jeUJE?=
 =?utf-8?B?NnNSUzFPWXYxME9FZEMrWkxjTFptVS82S092WUNlZWg4SG15Zkg2cmxaTmVi?=
 =?utf-8?B?SjJhMVlqaXpub3FQRVplNUY0dnpUSDNNM241aC84Z3I2MWdYT0I2c3pRaXlF?=
 =?utf-8?B?Y3VOUUVxWGNpdjZMbGFndWkzeTRKWWwxa0MvcmRYVUloZW5NM1pHbFFuN3Q1?=
 =?utf-8?B?cDh1ZmxPeUY4U25JUmVETDlOVlNqSnFqMm5MU3RqRm1BMnFRMmJCdnd2dk5E?=
 =?utf-8?B?ajh2SEwwRnVDVEdsVHBpTVdQeVlHQmw3SVhVNFd2WDdSU21pN2Q5UkI5M2d2?=
 =?utf-8?B?dnBFc1M2Vnp0SCsrOHkrVjZsbTdpY24ybXQ5S2ltRW9OWEp6RFp6ZjRlRkRY?=
 =?utf-8?B?VUhqMXl2dmZ2aWVuaG9WUmVacmRQM2pjZFRqTURTUlVlMjBJUHBpVXVTaEtI?=
 =?utf-8?B?RTlXQVgwT0pNZFVZVHIzS0MvV3NJZ0JRQ0dyRnVSNmRhcGFKMEMrbVhRd1Uv?=
 =?utf-8?B?ZjlNbnp0VDdmL3cwZlZJRmE5eGVFOHBhN213QzZyb0l1VWhKQmpGS2FkUXBB?=
 =?utf-8?B?QWVyQ1NWSVB6ZngwZlQzaklsQkhPM2dxclpaRzV5NGVuTWFnMUlIVkRjUDRN?=
 =?utf-8?B?dTRteWxwZE84UFBMQWJQTHZKYmI5TlJiZ1Q5ci9odjN5b0NtN2wvaTJaeEp5?=
 =?utf-8?B?RkwzeTE0NE0vY0xIVFJXMm82YUVMd3RqZC9xSTZESTNzMGZMcVdHNUlyOWZO?=
 =?utf-8?B?dXordm00SjU3S2hnTTdPcjUydXRQUERWUHNscFpUdkZLSTVqeXlPOUdoakdN?=
 =?utf-8?B?T2h3eForay9MTUFTNC9FdGZFdTU3K2tTSDg4U05CbTB4Qnl2bWxBWUE0ZUdq?=
 =?utf-8?B?b0pGT1U4RU9xQ0EvZG45Um1VYy9lZUt1NTF1Y1FzS3lXT0t5Z1ZEY1hxRm1n?=
 =?utf-8?B?VDN3ZzJVSUJ2V0pUZTdSRjE4ZmYvcUlhMXl6aEZWeTZnSmtLYk13Qm5LNU9O?=
 =?utf-8?B?RGU0blJWWEphbzNCK2lhUUVXSDhIeTNCU0ljV1RieTdFdFZDQmh5dnIxM0NX?=
 =?utf-8?Q?ZDiWKN633caSsUOLBZS+kYC6u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1faa8f-da1a-464f-3321-08db798e2226
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 17:19:16.9640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mp+XWkSv4R2O51OCCEMLlszVrsUH41FCsl1ke7mPAxjL5gJQ4gxSqyj/AizTGqFY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921
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

On 2023-06-30 08:00, Christian König wrote:
> Some Android CTS is testing if the signaling time keeps consistent
> during merges.
> 
> v2: use the current time if the fence is still in the signaling path and
> the timestamp not yet available.
> v3: improve comment, fix one more case to use the correct timestamp
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 26 ++++++++++++++++++++++----
>  drivers/dma-buf/dma-fence.c        |  5 +++--
>  drivers/gpu/drm/drm_syncobj.c      |  2 +-
>  include/linux/dma-fence.h          |  2 +-
>  4 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 7002bca792ff..c625bb2b5d56 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -66,18 +66,36 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>  {
>  	struct dma_fence_array *result;
>  	struct dma_fence *tmp, **array;
> +	ktime_t timestamp;
>  	unsigned int i;
>  	size_t count;
>  
>  	count = 0;
> +	timestamp = ns_to_ktime(0);
>  	for (i = 0; i < num_fences; ++i) {
> -		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> -			if (!dma_fence_is_signaled(tmp))
> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
> +			if (!dma_fence_is_signaled(tmp)) {
>  				++count;
> +			} else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +					    &tmp->flags)) {
> +				if (ktime_after(tmp->timestamp, timestamp))
> +					timestamp = tmp->timestamp;
> +			} else {
> +				/*
> +				 * Use the current time if the fence is
> +				 * currently signaling.
> +				 */
> +				timestamp = ktime_get();
> +			}
> +		}
>  	}
>  
> +	/*
> +	 * If we couldn't find a pending fence just return a private signaled
> +	 * fence with the timestamp of the last signaled one.
> +	 */
>  	if (count == 0)
> -		return dma_fence_get_stub();
> +		return dma_fence_allocate_private_stub(timestamp);
>  

Hi Christian,

Thank you for clarifying the justification of this patch in the patch description,
and adding the comment before "if (count == 0)"--it's clearer now.

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Thanks again for sending a v3 of this patch--it does make it clearer now. Feel
free to push this patch in.

---
Silly question perhaps:
	Could we not have returned an existing (signalled) fence with
the wanted timestamp (when count == 0), as opposed to allocating a stub? Maybe
allocation should be avoided?
-- 
Regards,
Luben

>  	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>  	if (!array)
> @@ -138,7 +156,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>  	} while (tmp);
>  
>  	if (count == 0) {
> -		tmp = dma_fence_get_stub();
> +		tmp = dma_fence_allocate_private_stub(ktime_get());
>  		goto return_tmp;
>  	}
>  
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f177c56269bb..ad076f208760 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -150,10 +150,11 @@ EXPORT_SYMBOL(dma_fence_get_stub);
>  
>  /**
>   * dma_fence_allocate_private_stub - return a private, signaled fence
> + * @timestamp: timestamp when the fence was signaled
>   *
>   * Return a newly allocated and signaled stub fence.
>   */
> -struct dma_fence *dma_fence_allocate_private_stub(void)
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
>  {
>  	struct dma_fence *fence;
>  
> @@ -169,7 +170,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
>  	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  		&fence->flags);
>  
> -	dma_fence_signal(fence);
> +	dma_fence_signal_timestamp(fence, timestamp);
>  
>  	return fence;
>  }
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..04589a35eb09 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -353,7 +353,7 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>   */
>  static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>  {
> -	struct dma_fence *fence = dma_fence_allocate_private_stub();
> +	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
>  
>  	if (IS_ERR(fence))
>  		return PTR_ERR(fence);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d54b595a0fe0..0d678e9a7b24 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -606,7 +606,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
>  
>  struct dma_fence *dma_fence_get_stub(void);
> -struct dma_fence *dma_fence_allocate_private_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
>  u64 dma_fence_context_alloc(unsigned num);
>  
>  extern const struct dma_fence_ops dma_fence_array_ops;

