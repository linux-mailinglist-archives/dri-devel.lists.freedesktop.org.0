Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9173C3BE
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 00:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D12510E6BA;
	Fri, 23 Jun 2023 22:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CFB10E6BA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 22:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eotADxkqDFo1Pw5+AIZ6hC204LDdquUzYxEyPzeS3nRtzNQcLgI8ms4luEu+V2NhqidksidniS5f77l/wVag8WUcKt5f7Ps+ifHKeCP7cWj5ICOh1IwaFxS/jRJ5kpe0zhFT4zLYs65yn4UHTci8sJAeks2suEJ8swnzNCy7UfAz4Xwbg43OOQZ2jYnDEh6Ot6YhLGRcDdI72AWcBwekz+nkfvN+3xxpaW5af7xkpApsB7k/jBJbRKS0HJF0n8C2wf6xv9zj3A4ysBrSHBecT0rJlyunDW2SVDGhqmkQC79t8WLuOEc8SuwXUC6FZK/XT7amy/gaJxvn0rWnBi/zXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiTbDTCVLANj2ilBruy+JxdbRKv2PGprikhDWaemYKE=;
 b=L/hJWNZrHox9Qc9K8agdQr/fB1tfWDUT/WvesD2pa6rRoMsDolG6s6oRT1QXXMILkYJ1l9Sbb9fa827IlxqOxFaa+txxZbOD1enZhe4ArfHaQ5GvHYrmfRSygvnZR1GQpuPR3WI8AgFkM0OGRqZnJnTH+d/n9ubZqOhWv+oN3pBmRMK7rf1/L2ZWbygT142zoJdrk5fqOv1DqIbuyuLs6PoaBnKinrD5tXkeVQYsXiVsoT5iElJFCVXWESMzuFMGuOtLmtpBRZ7GiLqb7NUAh9IDZ461PNNQ1Zq+tQj0zObaEj25HapuyqP2utPv7fJgqJugQq93Q/21NMk8KUcXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiTbDTCVLANj2ilBruy+JxdbRKv2PGprikhDWaemYKE=;
 b=H8gj8M3UofxG1LF7u0nS8pUUPz3jobkkf/ps596/nlnhRT72TxM9Xr/a7WeGgLelsbSvaAf902ZVQ7L6T5qJowerM5XO1U4PiiG86k6gLw1coxt/mkq5qHIwFru0QllisapRX05dxc2Tlm1NUjhkyDfaaECuBEUyyTPyrODalT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 22:00:53 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 22:00:53 +0000
Message-ID: <aa09f63f-a711-c8ed-78e9-e902b4c69da4@amd.com>
Date: Fri, 23 Jun 2023 18:00:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 juan.hao@nxp.com, dri-devel@lists.freedesktop.org
References: <20230623090856.110456-1-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences v2
In-Reply-To: <20230623090856.110456-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0254.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL1PR12MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: bec026b7-6a8a-4422-f3d3-08db74354fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mrc777a94OhHMuBQ5zR6RL97mDToNHbvqHWrAXdv1Ej22KUirnhzAJYO0dto/Nkl16nZRVIzjtcSA7gYM/4nRlLzjWmV0Hpspwa71OV+i1tKVzwZF64crZY5VUJb+h036UVCAekvQeSgC3DPtPKdKZFzTKTuFapIIivSTZAxEiZle2a9+BzMP6zAQlonYR7WKKbImS4j6t2MdBYBmfvEwjrTQr+Cfjrz7dF1PeDK7TXn+hK5hNRsK73m4m3uyVIM/pCo7of02DnRuxjF/6Dwwwll54tVLzSFExTnE18yHKJhxMD0U2iavVBKmZ1xTGfMJbtmU5NGr37sXmv8t7ioAqvTlGH6As9FcuEBgZTvVFPykdsra5N9xNofgdi2GIC/uBHM88SuFJ9jwD5YWuxfl/zEKnQj5u/KA+syEzEuHPxMBPLEClzZyAG7Meh2zqPr0N2sQNM8CUyERjhCUMn7+ZNWr76dv3/eP/LBoEG2feHc1upHsXbBEl5+RbsPdiDXrF1aLyPn752/m7ESux2Qk60bAMcmzyVMmGxb+6Pg7h5q1I5Msb/fs3NKy29GBk6aqcM9yTVIakxwKdAHBz6uNr0aFOH4lTf7Qixe/67zRuaaNja66RezDFl0UoCfgSP7hgkHSNgRUAh2EEyuNzKgKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(31686004)(83380400001)(8676002)(41300700001)(8936002)(316002)(2616005)(186003)(38100700002)(6506007)(53546011)(26005)(6512007)(6486002)(478600001)(36756003)(31696002)(86362001)(66946007)(66556008)(66476007)(44832011)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1JNZTdXYTljOFVYVVc4eDUwdW5GZzMxQlpoRDdkSTJ0N1pvWDBsR2ZBMkhO?=
 =?utf-8?B?eXorY3cwU2tHUk9LYk1YazBaUHZPT2duUFg1TVJXK0orSU8vNkhiOFFTMjB6?=
 =?utf-8?B?bSsvRUo2dUNScjRBL3dqK3RIQUtGalM4b01DdjRuQXBwaUxGRTdEcGluYXRB?=
 =?utf-8?B?ekQ5MmJOTkluRTZURXVwQkl4dFVTUVIzVWZzRTFBVVhuTlRacDBZU0daQkhS?=
 =?utf-8?B?eko5bzBjZHVjK1EyRU5xeHhRc3I0dlV1b2NwK0JrM2NSdzN6R1l2Wit0S21R?=
 =?utf-8?B?YXdnQXlHeWc0OW5LN20vTmR0ZkRlcWlDSlJmMlo0VERpVXpLK3Qya1dLWTAw?=
 =?utf-8?B?dVNHZTdWU3NTYjhjNzltdFRkMjZPWVpvUmcwUjNKdVplSWEzZW41TFlPTkRJ?=
 =?utf-8?B?cFI1NmRJeVdlQVJKdDk0cUZIdUZrbmp6eXZ5M0dEWFF2QUZaZ3lOWjZUS2Vo?=
 =?utf-8?B?ampUV2JnaUZ5S3U0c3RpQjc2ZHMwZUVKVXNzZzk1WlJtUm5oMGVMTnJNeXVM?=
 =?utf-8?B?aUhkNng5Q0NrOTRKWEVmNlZTMlIwVkFRd2xsaEsxMktGcXY3TmNLK2N5cFF1?=
 =?utf-8?B?SjBhWXRLNnlMdWJzNEszdHQwQkFMQWY3M3V5bWp3LzczN0YzcDlPUW8xQk5s?=
 =?utf-8?B?Ky9oK2phYTRFcUNaTUU0ZndFakhHL1pMWFkxRjY2UnY5UWt2eDNEUGtYajlU?=
 =?utf-8?B?YXZvYkVEa1Q4ZWVYOGlBRnFjbXVWYnl4NDRSTm9NdHBuSXdTR0Rrc3BYQkdU?=
 =?utf-8?B?T0k0R3FVVlBoTHZtMk1rOW1xUlpoMk1Ib2JDc1F2UzMvLy9tQkNSTW9DZFJt?=
 =?utf-8?B?KzNyZk9KeG5Lcm1KbEM1MmVoY09ENExMYUZQZVRMUWdlVkNzREtoelZyN1pM?=
 =?utf-8?B?VDRqSmt4U1hmMVBnMzM5UHdGWDMvczBlVjFvSHpWVndEOTU2ZXRBZVU2ZTJL?=
 =?utf-8?B?bi83R3l6ajlINDdvbFJhaTE1VEVPVWdldVZrUFZNRXBLblhLL3M5bE51Y0xp?=
 =?utf-8?B?WWJBbnp3UlZteWRQZWZvWHd3b1dOMHFzdUJEcTRoai9IMktNN2w0M1BMWGI4?=
 =?utf-8?B?blNnY0RjSWk0SWQ0ZTVFTlFaQ2xlSFk5ZXNWNUw1VVY3THY2UGg4aWJlL1NF?=
 =?utf-8?B?NVY4NHJIRy9XN1I1dndoY056NzNNdE9ZVE9yekRGMnNydC9abVFJVGNFNFFx?=
 =?utf-8?B?NUJySlA1WkJodkNMWGNlR0ZMdEtoN2hGOGpkYVJRc2EzOVhLMHM4cXdnTk5C?=
 =?utf-8?B?WlFzSTVFc0lOYkorcTBKOFRNeFFvYlVhTlp4dUh0Y2tUZnV4VU51bHA5R09G?=
 =?utf-8?B?YUkwRzBPZW0zeUJiakljYTdiekdTYTdoSzFhdm4xUVQxTC9wbzI2MUdKQzdQ?=
 =?utf-8?B?QkxQcUlTS21xeW44QlliRXV0WnJtRmVkR2l5TnlqYTNPRnI0a1A4UEplTy9O?=
 =?utf-8?B?cHBXSzlLcTVETzAzdVIrL1p3d25UMjJtcXpFOUFjbkZmRUdUK0cwQmYza0hU?=
 =?utf-8?B?aW1YdFJaNjNOU01GSFM5R0dXRjd5aDlGNnhZai8yem95d2oveSs1MEVGN2xJ?=
 =?utf-8?B?YisrY2hnbjUwdHFJSTlEd2tuRGgydHNTZHBuSU5PczhDazBsYnFYcFI1NDBo?=
 =?utf-8?B?eFpDZ0VISXFrNjFCeHpvb1NCQUgrSHlZS1loZCtPWjB1WmhnV2M4bXRPNy9t?=
 =?utf-8?B?bW9qMzRXMWd5VXpiVFd5bWprS2VwdUduanc3WDFxN3FRbU4rdEkrU1dSaXl4?=
 =?utf-8?B?dHl4QlZGNmJGdUFnUU5YM0dLZjFVazVUcldFMUhVM1lsYUhNWk5qd0VBUmdr?=
 =?utf-8?B?UVdWV0VVZVF3dTRKc1VRN3BNeVB2UVJ5RGd5OXVEK1R5T285clh0TG1NRjN2?=
 =?utf-8?B?WDg0VVR4cC91dHZabzR1M1M5MVFmUFhaa29menZNem9XWmFEQlZ1R0JIbkI2?=
 =?utf-8?B?K1JpRGRJa0dHUlRsK2R0RTlEdHo1bGJ4Y051L1MrNWxCZTJlVjRLV2x0QlR4?=
 =?utf-8?B?a1Z4R3RBeU9SQndwUWhCMm0xRThaczZYUEhWMW9DbWE3d2tLbWs2R0NkcFFo?=
 =?utf-8?B?RWUvY0Nlc2J6bEt5V2dtUTM5a0JMZ1ZxK2pwMkY0cmMwZVFuYjhsczRxUlE3?=
 =?utf-8?Q?2ir0zHPbRfhZaD1yvPdxxNUO2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec026b7-6a8a-4422-f3d3-08db74354fff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 22:00:52.9711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXb4lMeErWLDKKahYZJA1eo2d0bBTIi69akhzi2D3Hv7J7ClMj/3yEuOrLJiyxKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5157
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

On 2023-06-23 05:08, Christian König wrote:
> Some Android CTS is testing for that.
> 

It's not entirely clear what "that" is, other than by the subject title
of the patch. Something like "Record and return the signalling time of
merged fences, as well as regular fences, since some Android CTS(?)
is testing for this time." would be very helpful as a commit description.


> v2: use the current time if the fence is still in the signaling path and
> the timestamp not yet available.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 20 +++++++++++++++++---
>  drivers/dma-buf/dma-fence.c        |  5 +++--
>  drivers/gpu/drm/drm_syncobj.c      |  2 +-
>  include/linux/dma-fence.h          |  2 +-
>  4 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 7002bca792ff..46c2d3a474cd 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -66,18 +66,32 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
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
>  	if (count == 0)

Just before this "if" I would've added a comment to describe
what exactly is being checked and happening, since working out
the negated if (!dma_fence_is_signaled(tmp)) ++count; is a bit
cryptic. Perhaps something like,

	/* If all fences have signalled, then return a private
	 * signalled fence.
	 */
	if (count == 0)

And I can see that "count" is being reused down below in the logic
of this function, but perhaps using another variable named "signalled",
and then counting positive conditional, and then comparing,

	/* If all fences have signalled, then return a private
	 * signalled fence.
	 */
	if (signalled == num_fences)
		...

Would've made the code clearer.

The compiler would optimize the use of a second variable to
the same register anyway.

A moot point now perhaps, but we should keep note for future submissions.
-- 
Regards,
Luben

