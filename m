Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D25716F53
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 23:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C42110E42D;
	Tue, 30 May 2023 21:02:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5413110E428;
 Tue, 30 May 2023 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685480535; x=1717016535;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I9GC0cCsu7bXyONklPZUXdppCNRCgZL94qGsHHpZprA=;
 b=hmIz+1ctJD7cXW460TNx59wtOVMdslGHi2YxV4A3qnsZq8Z4DCUZsxt7
 TqkOi3QHpxDBS53JsxKC0XeFrZ4ULlln3cSidO6DLa6KB3lSNVzdSbJoR
 1oo1Cnp6bw9qild//DqiUnlphF1B6efxK+jwItM7mUJo9a+lSZXlJV6aB
 0i67HEUeNzUk/AMrUfE59j3aOxZOPmr4KYS4JCCH2+YE1086ag95ziucy
 YsBaBEG/FhN6BGEOXHQl3QeFuN1yIogjMMbdyjhaN84QY0G7qN431Iox+
 pT/w5+q+iO7hl7rP6IBXS9XwUTSR/FlgF9QkBHZheuC+VGpKt7x9jOWJA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="352545793"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="352545793"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="796422919"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="796422919"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2023 14:02:14 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 14:02:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 14:02:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 14:02:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPr9NhLTSjAh6iAIUK6ILLUrHMruraCwyu8UEZdWeLdePB/sDRvxXASwc/gS6phZBI1JuFiaBJ+/MYyTc5Rk9wWzCUXWZfD6p5bTQt1c60WkcYZ+tUDDow4ohtCMwMfCeaS8Zj0K/R8X6D8VrOQFnSe9B7lzc3bGVjnZZC72WhyubXOIDbIRD3COxj4cCXC7Ha5zGlrccRJNzCTGN0omL+1kVK+nI9OSsOURauYUvHvQy6Jaxyf5GAkupaX1Vya10wANrNOyM5nIv30aHevpfM+VXiORJAcTb9/YhjueAnqCambVtM0X3SamXxsmZXVJWC/I9XqVKxKm9Xfc11rIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ggHUV6BdKfFuhKrg1RuKJZNn9YDKwPsEmmuwm9p6HA=;
 b=L6Z/DVB8pv7MIaeBuLbg5THAFF4OzF4s3UhrbLIhJtds/Bkoq5D47ZBbETGXDgJ9t9K4KL4Vt4j0crokoMEz7modxiGCVDUf48bPOMe3QsW319z+FFtcnQL1fO63shqvCj4l+NZRnlUY9vkm9ERC6CfA50jmS9K37Sv0NHX5vBLrxEtiBRBn3cESu1lgCet7qX8hDu+PjnwK0CH4hPAj3FqCyZjrOys4ZB6YdcZKBksJ4BCtdSp1HU34p//NicysWHCptNLyoHn2Y6j3i9b9ZJvO3zgIFMal9fMhZNqvCcXxteBBXanOqxZfGxBQZ+ZgP+6Gqu0auwdptlnzC6ttNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 21:02:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 21:02:10 +0000
Message-ID: <c26a58b7-9583-f240-326b-109b5d39e848@intel.com>
Date: Tue, 30 May 2023 14:02:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH 1/3] drm/i915/guc: Use FAST_REQUEST for non-blocking H2G
 calls
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
 <20230526235538.2230780-2-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230526235538.2230780-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: d078d70d-e938-47b8-e76e-08db61512247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YHGvrh0mdxg41pE/MTAy7ADzUrfkRxWHx7v4IWc4f+Z/2TmBMSr+GXXVjQ9cbSfnBSTTzYQNKUoM05gG+Iy8yKWkD9wW/RnB6aMfZfGKNHyUekFhPG3hKr3KaW1+ll+G8aw6/KhUJSgEgpqCTOoj2g2txzbiS+jawTie0XX+M1Y9FcM+sHMzJuzhOJI73+/XKHXAp5DgYGJAql9rsSXgWrQwUCw4deoAKZvKmvvU//e2wbz08S9esrBD8Z+bmpLlpA9eePPd2aU/wjr8DhViunvdPvnDIe3sIBPWtJCGEXcXy2waxyZgR8HsZJYPko7OwL6vChxmiWMbRivweRHCObQW/UF/FWzZ0wDTd9FmC5CbGleU8ypN0l286nTOsNUAJYmV2MoWaEp5Oy1Dy1A2CoJDRoEUxOpr9MJB/SXUCPlTJ3QcpqovQwdesSONW1Pw47Qk3KUBmUhZTWSyfGC7GTnjRPzWHzB1m0JhZvTtIcW1h3nu+IJZoN36UzD1qngUhWwbrmewDHfoQXm9ZlZ4C9/YumswcXheZY/yvsVE+lMmhv7C1U0+tr+Yqg3E5tv5d5qr4mQIRCI0wtpC/Sbw7VaXUfFcnC/c1UGZfbxhJY9lEC5hHe7D3lUAtMzPyUdWJtrSOD5GmeoLY6fzDH7BJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(31696002)(86362001)(41300700001)(6486002)(4326008)(6916009)(6666004)(316002)(450100002)(66556008)(66476007)(36756003)(66946007)(5660300002)(186003)(2616005)(2906002)(6506007)(53546011)(6512007)(31686004)(26005)(83380400001)(38100700002)(107886003)(478600001)(8936002)(8676002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVDREFEOWVIN3JUZlhXQTJZS3hMVlQwaEV2b2hTb0xCV2UrWjgwamViM1Rk?=
 =?utf-8?B?cFJJenQ5b0dTZEJpcVVDSnVDZlJkSUFUTUpZSlpuNjRORFJpVXBrekI0Zjg2?=
 =?utf-8?B?NFJUdmxyWmVSYWZ1c2dGR1pOQUQvbklqcHlJSFZpR2VXcUY3T1JpY3BYS2xm?=
 =?utf-8?B?ZndKODZCdjdlQWtZdXpOc3VyNUVjYm4xWmV0VnNud0ZZUUMwRWRlbHkyUEV5?=
 =?utf-8?B?ZkN3d2dTYTBSeGg4MlZuSEtrV2xyRHJ6YTR3aElqaHNzL1puQ21sMEx0UXpR?=
 =?utf-8?B?U2twWXZMNVpLckMxYXpiMmtydUw0Zk03TjZ4RnF4enllUXkyTk9zUXBIQlN5?=
 =?utf-8?B?cnhwMHIxeHBGeXM2WmdYZnphRkNCQjFRTTk5TmJCSmVRME5ydEtaZDk4bWZZ?=
 =?utf-8?B?aFVaMmtqbWxmMEZTK0RzSFFDY2NvdHBvOG52YklxT2dBL0IvellLMCtjV2N2?=
 =?utf-8?B?ZnNHY0s2M3lNS0xZcWxZb0JMY1hQVTZLWlBHTHBxOWNPcUQvc2NFMVRVb1BU?=
 =?utf-8?B?RXd3NlhPNS9qc2xXbFM1bkE2MkpUaHJVdVpsSWlDM2NYRjhMdzFBcldSNFJK?=
 =?utf-8?B?UlR5aTl4Nmx0dVhIS3cyVHE5b2dnMCtDR1pzS3N6dlo4QzAzN3hKVEVNQzU2?=
 =?utf-8?B?N3RqN1lWWEQwWjc0MG96Q1pFOWkvYUN1eWFMdndmWHZaWXYvOHRPd0VadTkw?=
 =?utf-8?B?TmZ6Z0ZIOXB4aEY0dFJuUU1vdUxnaFhqREZ3Q1RJYmdNckQ1eUVSQ3BoNE5C?=
 =?utf-8?B?NitDUUlybTZGVk1KMENLTURkbzQ0aW5SNkhNRTJNYjNOOWMraUlDaFkrcHE5?=
 =?utf-8?B?bnBvUEt6dXQ1VzdGVE92UDJ5RlVoc09kQ1NXSUt6c3MyaVZmUUpVU3A3U0Vo?=
 =?utf-8?B?MEhQUHZRSnpEbVNNQXZrTFMzbW5Bb3ZpTWwvclZNMkZZY2J5L2RZYUtJNkVt?=
 =?utf-8?B?NHFIY1k4WEdrOUxIUGxtdVNxVnBJYjRtV1hjN2FNaTRNbGkwa0JHNGp4c0xH?=
 =?utf-8?B?SkRSVDBCWmx3L05VbmhUazRXUVZJcGtyR0VlT1FrUGFHOXd3cHVqclp2bUFr?=
 =?utf-8?B?ZFFTUnRYUEFoam9vc1BXTHF3cnU2K0l3SnBrdTQ5NjdaN09qVktreUVzR0tQ?=
 =?utf-8?B?Wng4eFc1ck5qSGFwSUl4Sk0za003Nk1uUGYwS3BrNEhRd21Ra3M4STJ1R2l5?=
 =?utf-8?B?STN0MjBHc093OGtKVWZBWXpVOUp6WmhuZndIQjNPdkgyWkMybDIrbDR5NkVy?=
 =?utf-8?B?QVUzT3A2UWd4SkxTc1BiRXQreGxHUno5dFgrNm9sZjhWb3h2V2c1Q0tzRzM4?=
 =?utf-8?B?T24zUTgyK3F3cGJUdjAxcngzSlgreEZxYUNFZmlzYURnaXlHU0NlVE5vOTZH?=
 =?utf-8?B?Mnh0WlhHQ3RmbjE4OUxjQ1E5K2NJS0RDbmJBOXdWY2ZlclJWYVA2QVFMK1VZ?=
 =?utf-8?B?M253am1xSTd5bGJsL2JhZ3pCbFczOStBQTVKdkt2aVF5NGpuTDNvMHlxUDUw?=
 =?utf-8?B?REZOblc0enRxUHlFd2hibklJSWg5ZGRsQmlvYzdMZTR0Z24rQWduTmkyR2RZ?=
 =?utf-8?B?bEc4NlFBOGg5ZzgyRjJ6RXg0cmIxTXRQNUNNaXFQUlRVbUV5ZXoxOEUxbDZJ?=
 =?utf-8?B?N1JydXNaZVZpYTl4YXc3NTNjRVhiV2ErcG5qNXgrZVpySmFLR3gxWDhVWkIw?=
 =?utf-8?B?a1JycnFXNERCKzI2S3BzcGo3WUNrdlJ2WlNwaE1uYmlJdGFuSnRySnBKbWlT?=
 =?utf-8?B?ejZjQ0FlVENPZEgrOC9QU2tOUFZpbzA2Z3hPZXN6K2tNRUtGQ2VEc0NIeENF?=
 =?utf-8?B?T1lQRlhtQnUwOWg3OW9MRm9wK1Ftd1B2amNZVVFKTlc3MTNGODFuS1ZqVXBk?=
 =?utf-8?B?Q0lxSjBnL0lWc3BUSUcxdWFiZHh4S0JZbnpHN0pQNGdHaTZVcGcvbG5BV0xm?=
 =?utf-8?B?NGc3NjN1UjNuK2FqdzJJRDI2MHVMbTNZdDdvK1N3VlViaHlzRHlrUG5oblVj?=
 =?utf-8?B?NnhsOVFRVmR6aDhXYmFCTEVlSDc1WEF3eHVWOGI3MjdCajN3aXRGY3F5c09U?=
 =?utf-8?B?OHJ0K3UzTW5KTXZRY2hGZUdZN2dNZlJWeW0zbHZPYkljNEVsL05ub21UUnVw?=
 =?utf-8?B?RHBHRjg5cW1GUFBsYUppcUhGZnFhaXZZYTFOR2c5R29Xa3NSS2REbHdFTElt?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d078d70d-e938-47b8-e76e-08db61512247
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 21:02:10.0105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTGn5KVHS7d5kEV5Hu6Y/Kg/LdVfZBy5lA6A0QBUslQR16gV1rcwNgspg5wNkzQ9D7Ix+41qMFjx5gOWO0x3kKUz89sAzDMcoEoOp1r5VpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
X-OriginatorOrg: intel.com
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
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/26/2023 16:55, John.C.Harrison@Intel.com wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> In addition to the already defined REQUEST HXG message format,
> which is used when sender expects some confirmation or data,
> HXG protocol includes definition of the FAST REQUEST message,
> that may be used when sender does not expect any useful data
> to be returned.
>
> Using this instead of GUC_HXG_TYPE_EVENT for non-blocking CTB requests
> will allow GuC to send back GUC_HXG_TYPE_RESPONSE_FAILURE in case of
> errors.
>
> Note that it is not possible to return such errors to the caller,
> since this is for non-blocking calls and the related fence is not
> stored. Instead such messages are treated as unexpected, which will
> give an indication of potential GuC misprogramming that warrants extra
> debugging effort.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 30 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  6 ++--
>   2 files changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> index 7d5ba4d97d708..98eb4f46572b9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> @@ -24,6 +24,7 @@
>    *  |   | 30:28 | **TYPE** - message type                                      |
>    *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
>    *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
> + *  |   |       |   - _`GUC_HXG_TYPE_FAST_REQUEST` = 2                         |
>    *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
>    *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
>    *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
> @@ -46,6 +47,7 @@
>   #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>   #define   GUC_HXG_TYPE_REQUEST			0u
>   #define   GUC_HXG_TYPE_EVENT			1u
> +#define   GUC_HXG_TYPE_FAST_REQUEST		2u
>   #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>   #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>   #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> @@ -89,6 +91,34 @@
>   #define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
>   #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>   
> +/**
> + * DOC: HXG Fast Request
> + *
> + * The `HXG Request`_ message should be used to initiate asynchronous activity
> + * for which confirmation or return data is not expected.
> + *
> + * If confirmation is required then `HXG Request`_ shall be used instead.
> + *
> + * The recipient of this message may only use `HXG Failure`_ message if it was
> + * unable to accept this request (like invalid data).
> + *
> + * Format of `HXG Fast Request`_ message is same as `HXG Request`_ except @TYPE.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN - see `HXG Message`_                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = `GUC_HXG_TYPE_FAST_REQUEST`_                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 - see `HXG Request`_                                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION - see `HXG Request`_                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + *  |...|       | DATAn - see `HXG Request`_                                   |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
>   /**
>    * DOC: HXG Event
>    *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index a22e33f37cae6..af52ed4ffc7fb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -426,11 +426,11 @@ static int ct_write(struct intel_guc_ct *ct,
>   		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>   		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
>   
> -	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_EVENT :
> +	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_FAST_REQUEST :
>   		GUC_HXG_TYPE_REQUEST;
>   	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |
> -		FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -			   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
> +			   GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
>   
>   	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
>   		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);

