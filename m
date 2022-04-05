Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454FA4F2995
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 11:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB31910E127;
	Tue,  5 Apr 2022 09:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3A210E127;
 Tue,  5 Apr 2022 09:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649151839; x=1680687839;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=uhQ8/0KrmQRVYn8JL/47vLJd2WEEI5EvZMe6YRDQGOA=;
 b=gUFw29l9fS3e94mrF4sD6hRGsYp393u4EZQ1U4Et7UpjyOJoFofWatKI
 /8U4GafaJGsiFt2U6qLarYkjBOyaYb0Y6HH4OYpqjMAMdF61pE4kY4Gfm
 HWFdKDUt/69dMSm5PSqk5EyToRQg8ofmwZOmWo0PXGEUTJE5Dea9D+Z/n
 24P0rVP4NWc94UidEpz13MdrGNTJ9OUXsw/82YFZrXwBKLwm6PeTfbVCA
 BSv8go5wWBSw6HTsTFs/OXDCC6iLjM86f17SrpELm5WS+HqRSV+GLfu58
 ZSvUlwM1g5mB0W+KpapZEDtyOkD0Bqey7rlsX9A9JmZweu5LTuOnKCLIa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="242850856"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="242850856"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 02:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="523929664"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2022 02:43:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Apr 2022 02:43:57 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Apr 2022 02:43:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Apr 2022 02:43:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Apr 2022 02:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMrCXAKv17noceXn+jMOAFD9uD7bucJyZGYjLpyKOnbYeEwy10Vauiz7iXk+I4r3/irMP3GjkL6+cHL40mQyzBJbe6H3Exfk/JAwkaQ40gM8vH4/uvw7oETCFN7SNN/x32cTRvgVSpHSTFbKdVJLwClAjsc99mR3XeXo4BsUJExKX76CrdBvQdy6QBNk1zcLnF48i/lU4+vRAn4o68YoZqSMX1HglmYKoS6omCqx31W8pfAebRnsXkAphDskLkO90OsG+xGoGVde+jxPCdYVhPH8JrIu6GjvBhcBN/YUmhAWC5VrimEoVwHhcTZKHxUjLM8un46tIUSCSBPkNOP2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiRawKM1a7C8F8JLqjz2QtKqPn80j3ihzws/HyB5JC0=;
 b=AMTrOsPzjvGsonIgM9chTBxfV0VYwJQIK2+1qm+/ydDfFOdFLDUvuLEMciFzsUAZu/ahXoeNAv+GcJRqk5fIJZbyHvExbqTikfIO4CByKgtgMUvQkCVeH/kXuo2FMeIr5HT3dqwS4jlY+ftH+6yjvHjROfN1nweFwTJz03u33bcoN65qdJdLQ6t4pK2b9sm/Vd/W0jocQX52w3jrOUszcwUR0ZqJ4mBEGikMDEp4MrN9wK70CXP1nvG87ouVcX6dJodq/R4LOpYIsHdiXEl3bzD0K75lgU0t5WKr4+OlRBD4BWBIXku3Tg8GWCKDrd3tikqG/nDurebwHgJBuTNzxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BYAPR11MB2887.namprd11.prod.outlook.com (2603:10b6:a03:89::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 09:43:54 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564%8]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 09:43:54 +0000
Date: Tue, 5 Apr 2022 15:13:09 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 3/9] drm/i915/gt: Optimize the migration and clear loop
Message-ID: <YkwPLXKuxsku4GxS@bvivekan-mobl.gar.corp.intel.com>
References: <20220401123751.27771-1-ramalingam.c@intel.com>
 <20220401123751.27771-4-ramalingam.c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220401123751.27771-4-ramalingam.c@intel.com>
X-ClientProxiedBy: BMXPR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::19) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c74814a-5aa9-452b-3c24-08da16e8cc31
X-MS-TrafficTypeDiagnostic: BYAPR11MB2887:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB2887517241AB57052519C1829FE49@BYAPR11MB2887.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMeHLQlDZYQjKIsOoWKl8NkyERQcjE0qRa06Yrc3+lsqMxKhAcN2ShOWYSnUOiqpv60k/avZ4c3qcBiqI+xUFlOD+OhRekIXboHzjreOGQb2U0/iJ6Y2x6aUGVHhqJHQrHg96IV7lNOVRyIpj/8Mt4P1zH5HyFm5NG4E/nmWjV/8qbJUrMBNFzpRvQ+80UUdOid+qkwm4o+r+LKuYoSG8a2z9lySKYsij7PPYThAdpQUPC2eCYfO48G4sHDvOnh+ta7igxLRC9gGFv2k+fMYOHdOECHI8+QXQkGrtumP5vT+3cMa0A0v2Tl2UFYe0f+I6S2VDjzOqGMwcUiivYk1qEqtRSFvGQNTJ+dyd4aS086/cjszTc8LMBW0m4IIxIIBvjO5yztZ0F5u3LqPfqes6ovC+S29R0oeB8pe23EwBxQVpRjJmxyRBpOqw6RKItkMpl8Io17+Pu0Rejl3mDKwqvxcs956LK6hShm2igsuGLo1deNSD9DtIKjuPKHsLYUlP2kfenH3DE4tclE8XaKnagTorv2zo6X65loUwM2SOIrSbDxJalajXW/OKDKflPf3qZ2gQD6KwVorn1l71zgm/LI07W5ftBlt61qPRkNHjXP2whQp30OlH9+JbiaAWzh1uYEDKH34gBBy8HESLIBbXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(83380400001)(508600001)(66556008)(66476007)(66946007)(8676002)(6506007)(966005)(53546011)(8936002)(44832011)(450100002)(6486002)(86362001)(110136005)(316002)(38100700002)(82960400001)(6666004)(5660300002)(2906002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21jOWVOQWphSnN3OU8rM2U4Zk9qOHdFaWdVVDhZRGNKTUlpU2tJZTg5VG13?=
 =?utf-8?B?K2dkVUZMdUxmYm9MK0xCTWpWbjFnUUQ2QWduc1ozN283Ym9ZOEUwSDdrbXdM?=
 =?utf-8?B?cFYrSW1CeFZ2dHpOdnVRL0F2dXZmbWpTSDJYVkJNdmdsUjVMMU9aQ2hxUjFm?=
 =?utf-8?B?VzVQWldNRnUwa2FPY2g0Vlk2SStDTzFDVmQzM25yZXBJNW9MM3ZQY3lrOWtX?=
 =?utf-8?B?NE9CUS9aOGhONVdWOFVzZXlzQnBwRllFelZnTjlCelhqSVU4amw4Zlp5M2ZT?=
 =?utf-8?B?UFhsL2F6VFZrdUtjVk9uU3NheFNzMnZ0b2xjaThndFJGL0lpRHVtOG1SWE1t?=
 =?utf-8?B?cytUVnk1ZnE2RHJ0S244V0g4NTRqdUZqRVNQcktDdnFMN1hETFREcnNkV3VN?=
 =?utf-8?B?cUZIZ0hSVU8ySE9JTnpZcTNyMW1mNFhZUUQ5OGd0bW1MWUJFRnJkdnlWY2Vn?=
 =?utf-8?B?SE9pMkVXK3NFY1lzV01FR2wxdkoyN2FvTG4vaE1ITUJQNC9OdzNwZ013TUUy?=
 =?utf-8?B?K1RQNlpSR0J6S1F2VVlKeWpOUW9xOHJBT1kwU2tNMjRBdlpRM1JWNjZkYjhN?=
 =?utf-8?B?azFZMU1LS2lRTmUzdTZ3elF6bjRHbkkyZ0kyODVZNnZqSi9LRTFEa0NFMGFC?=
 =?utf-8?B?OWNEcXRQdWhqS1NEdUtXaWM4cUJuYUZyWE5Kc3RsS1lyM3NGRDZCUkloQmdR?=
 =?utf-8?B?Tm95bnlkRkdTYXhySXphT0xQdDFJREo4VG42SEFTK0Y5L3VaZVYwUzRjOWJ1?=
 =?utf-8?B?d1RsU2k4S3RUdkJoSWFxWHAzWm80VmhibXF2cDB1Y2J5MzlNdnNUdUM2ODFr?=
 =?utf-8?B?aUhmSVlIQlhkQ0NUWHgxYncxUlpsZGNFRTEydG9yd0ZWWkFFSGNteFFrMzdl?=
 =?utf-8?B?SVhhSDdna2QweVB6N0VTdUx3dmVlV2lFSUxLelYvT3NGbWsyMWdXNDRlV1Vs?=
 =?utf-8?B?TWtCZXhkZi9VUmxwaHZORXpKU21zNXI3WVBKVHhzeXN5L25WaUJkcVR2OGZY?=
 =?utf-8?B?QkJrcFY2Zk9oOUVqQytUSW1aQjgzTi9oUTlqY1lQMVN1bWRLMjVyd3A0T3d4?=
 =?utf-8?B?eWlKVlhDTlZ6Y1J2MzlSV3VjTGNMb2N0d09CNzhqVktmMnVQb1d1TGRXSm1O?=
 =?utf-8?B?bUVOcFZGNEZzRGRubGZ1OTJSWWZSRWp1WkYzQVJJMlU3TUJsRUpJOHZDOFVo?=
 =?utf-8?B?WTY3dWQ4eit1aW1iM1daMFA2RUY2bkdBM3BPcTYzN1dyQ1p2YXZJU3gvc043?=
 =?utf-8?B?OXl6M0IrMXZRbmw2R3pmRVNqd0NCRkl1ZG0xQ1ZJKzJoVEhRWndwaDU0RW1P?=
 =?utf-8?B?K2JSdEdmVUlmSDNKM09yMWFjV200MGJiK0dqcDU1R0FhWjdQS09CVmthQm5h?=
 =?utf-8?B?Ky92Nnl1ZUlpczJCTGc5d2dGSUxjRVhmWEV6cEswMWhJUXBMRTh5emVtWXU1?=
 =?utf-8?B?dEZnY0RGZm5SeThKWklwb29vNENpenN3bE1YLzJldWxESDlrUm14VFBzZjhi?=
 =?utf-8?B?STVkc1dvZDJhK3MwbVUzTUN0TnY4RXh3Um5vTHF0bHhWY1RqZlVEZE9UVlhR?=
 =?utf-8?B?eCtCZmFQY0lKQTJ3R25ISXRqaXRMbE1UM21OcmNVMldtUU1Xd1pZWG1CV0Jt?=
 =?utf-8?B?ZzZEeGVkRjVPZ2UyeXRBb1RCUkJMWHJ3KzhETHkxVnZJNytKazJHTWZ2QTNh?=
 =?utf-8?B?SWRQWWFvWjVUNEZtdFk3QXJ6QlpJWjkvVWxpcFJEWjgxL2JMTVFnUyttcytE?=
 =?utf-8?B?d0Iwcm0wMmlCdmszTEl6OERQQ3UyUW54YWxPZEcwaEFTU3lYeUtxSEtBMlBr?=
 =?utf-8?B?MDlhcU5HZ081SHdqNzdwZnZNUGJmWk9IZWVkZU9qUEdDMUZGZjZidWZFY090?=
 =?utf-8?B?Mzd1YjBMYUI3MlNBRE5tekUwNDBWUk5CYklJSlgrbktrUjg4bWFUZXdoNUdD?=
 =?utf-8?B?eEl0Y0ExM0hVWVpzeDNEaGVxajV1L3pEZUpEQm5NdU5hTmVyRkUxbUh2THJR?=
 =?utf-8?B?TWIwTWkrWWs1aDNyYmtVQzhBVGNFaW9SYmM4WE85RU1WQlMyeHZmRWNKMEtP?=
 =?utf-8?B?ZmRGc0VZR24xTnNLVldRM29uckgvR3JCdHdHcEEzM1VGeC8xM1ozckVjanhR?=
 =?utf-8?B?YSszVnlFTE5LOXd2bkNFVHFVWWlpTkM5dGNyYWxwa0QxZEQ2dzExcklTeHpx?=
 =?utf-8?B?aXhhcTFqRURSTjhSRHdxV1VhS0sxa05rRUtOVDB0WTJTTjF0enpYWUlWS3FW?=
 =?utf-8?B?WXl5Y2NTRDJrQzZJTk04bmFsVkMvMjB0eG1mZFJhK0VOSjhOc0g4Z2xmbWhu?=
 =?utf-8?B?bmUxNjkyOVhYaUZLUFlvOW9OczB3d1B0SFEybk53RzFxbmxiSE5LM0FEK3Nv?=
 =?utf-8?Q?A2xhbltfCxCVBA0JIR3YH6hEH7Uw57CTZlSen?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c74814a-5aa9-452b-3c24-08da16e8cc31
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 09:43:54.4723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVd6rXiw4XGJqrqPmn7TjrJ2U3Cq+dVSk5xxkGqfeB6JEzBI8kd6Ylkq5thQ99VJn7gT7PIBDCmHZzjjuLZf51xjT1dowYUwnb5Y8TXt7m1OGAK0qVdRbBzxmvWM4KTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2887
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.04.2022 18:07, Ramalingam C wrote:
> Move the static calculations out of the loops for copy and clear.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 40 ++++++++++++-------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index e81f20266f62..580b4cf1efa2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -526,6 +526,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>  			   struct i915_request **out)
>  {
>  	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
> +	u32 src_offset, dst_offset;
>  	struct i915_request *rq;
>  	int err;
>  
> @@ -535,8 +536,18 @@ intel_context_migrate_copy(struct intel_context *ce,
>  
>  	GEM_BUG_ON(ce->ring->size < SZ_64K);
>  
> +	src_offset = 0;
> +	dst_offset = CHUNK_SZ;
> +	if (HAS_64K_PAGES(ce->engine->i915)) {
> +		src_offset = 0;
> +		dst_offset = 0;
> +		if (src_is_lmem)
> +			src_offset = CHUNK_SZ;
> +		if (dst_is_lmem)
> +			dst_offset = 2 * CHUNK_SZ;
> +	}
> +
>  	do {
> -		u32 src_offset, dst_offset;
>  		int len;
>  
>  		rq = i915_request_create(ce);
> @@ -564,17 +575,6 @@ intel_context_migrate_copy(struct intel_context *ce,
>  		if (err)
>  			goto out_rq;
>  
> -		src_offset = 0;
> -		dst_offset = CHUNK_SZ;
> -		if (HAS_64K_PAGES(ce->engine->i915)) {
> -			src_offset = 0;
> -			dst_offset = 0;
> -			if (src_is_lmem)
> -				src_offset = CHUNK_SZ;
> -			if (dst_is_lmem)
> -				dst_offset = 2 * CHUNK_SZ;
> -		}
> -
>  		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
>  			       src_offset, CHUNK_SZ);
>  		if (len <= 0) {
> @@ -584,12 +584,10 @@ intel_context_migrate_copy(struct intel_context *ce,
>  
>  		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
>  			       dst_offset, len);
> -		if (err < 0)
> -			goto out_rq;
> -		if (err < len) {
> +		if (err < len)
>  			err = -EINVAL;
> +		if (err < 0)
>  			goto out_rq;
> -		}
did you take a look at my comment at https://patchwork.freedesktop.org/patch/479847/?series=101106&rev=6?
Above change looks like a regression, can you check again?

Regards,
Bala

>  
>  		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>  		if (err)
> @@ -690,6 +688,7 @@ intel_context_migrate_clear(struct intel_context *ce,
>  {
>  	struct sgt_dma it = sg_sgt(sg);
>  	struct i915_request *rq;
> +	u32 offset;
>  	int err;
>  
>  	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
> @@ -697,8 +696,11 @@ intel_context_migrate_clear(struct intel_context *ce,
>  
>  	GEM_BUG_ON(ce->ring->size < SZ_64K);
>  
> +	offset = 0;
> +	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> +		offset = CHUNK_SZ;
> +
>  	do {
> -		u32 offset;
>  		int len;
>  
>  		rq = i915_request_create(ce);
> @@ -726,10 +728,6 @@ intel_context_migrate_clear(struct intel_context *ce,
>  		if (err)
>  			goto out_rq;
>  
> -		offset = 0;
> -		if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> -			offset = CHUNK_SZ;
> -
>  		len = emit_pte(rq, &it, cache_level, is_lmem, offset, CHUNK_SZ);
>  		if (len <= 0) {
>  			err = len;
> -- 
> 2.20.1
> 
