Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A9678B17
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD17510E5BD;
	Mon, 23 Jan 2023 22:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F6910E5BB;
 Mon, 23 Jan 2023 22:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674514494; x=1706050494;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PBASLUgWCQQ8b8TvpffghTWUS0gPgmuQQgCUPCvGsCw=;
 b=GfsQmxu0SAx/zXweesJMm6YBXWwEVMb8e5lEef4QvtNXjYDFc3cmGV2l
 LAmL6uJdpf+JSr1Mcg0V4qe9vUqZM2ZAlR4wuJKwWMWcLgL4cNwDj3xND
 UfspIeAUvIkCG70AXx7AhJIobER1XPY7R+mn6XDux32MG+27wS8y4tKAP
 Jr96Ev31W/yZi0hUHt8R0IiAEglXhUDWy5+V6BIi2/RhFJ3hgfQKd5S9m
 LlsfJWUkJ96n4QAKiWqtXJ0Q6W33yKnbrE9Q6f+IO5xrrzQUN5jHPNRtA
 anLyK0HJ/4TMGS/i4l1Xk4Lsj4Se1O1eibROF9o6o5ZQXMNbDZVRzRcu5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388524801"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="388524801"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 14:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804366653"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="804366653"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 14:54:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:54:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 14:54:53 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 14:54:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lw0bnozLupbVQRvzIEfkjWLvXC1KrCTupItzFiT+P+Td9+8zP3Ig5V1+Qt/d+dQGA3fuByOj7gAXGCGfbDnVSSTefAFsv7msuegAREQ8u9MUhE9PKbkmouKTWdjIDxQu4VQBoYUJhG2oaWSRbhoIup327f4b8y9Dr1pgIBDl2m5cH69XkkUCPuSOYiT5EQZovf5M1EN0+L8TxXaIpkeMeytfG/QtjLHYCIBt1AXRyu2bzIR67qOPrEc5SZ1mMAKJ8JrSoHmV45cnyH7k5Cvu1JxsE+sLdB5IBKPihyOhfxlKo61+GLZ5YVU2/+wDSEb7WfK27PijDfUjiLDElNRX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lRQY0nmxUxQbczM8L1JRxIiYzqV/f/3zc2ZbO47utM=;
 b=b+B97K/l/YajKHxfNu57NwFxNYCo+A5NSYqouuY1UDsK/fytXihiSXVA1bh0aHXpRkpGpPVF3zRPAOk6syEILYbOO3xcSUEHOdBf4alMCAZdNTMw/03hgpoGDaqpaJ9iVV6pXxbTl1AHGAXPuRFXpzR+XsIlCfE+ipCaQCB+4spX6xT+MT9TpZo4m929y21sSGGbeYhw1ez2QqN8NBR95qm9ZX8/ZMgEQYces3DZtQXp7D9AaRLe+3iBegdn5Vq5P38HmfSQxtKTxXc2dhXEE45B+omdqmunyogZTlxigdPbhpW4SIMOhNMPCeqpQCBNFDHCSRv8kQZCyepXtm4DFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB8089.namprd11.prod.outlook.com (2603:10b6:8:17f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 22:54:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 22:54:50 +0000
Message-ID: <f5dbff58-e1a8-03fa-5f51-ad355f4bed6f@intel.com>
Date: Mon, 23 Jan 2023 14:54:48 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 4/8] drm/i915/guc: Update GuC messages in intel_guc_ct.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-5-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f60185-d6e7-4bb2-ec49-08dafd94d56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scpCDGFyqjleK2Dm3coMF5YSSJHQ3E4apjU3UgEOCxFEV8Nx1qnhfR5cTu2yemZzOSLzmzlEKwGole2ifAgqTP/6LPzS+tQwKOsyV8AtSL/7L6YOJJClh1hRkMxS5oLZ9QmGiRmM+k455Pq3tpuxA/OB9Wn/V4JxVZY+mXIVNoiL0U5sArncnmToaX9x/8+xAj0YigPil9+o1FSsc82Ax7TD9YgQauCv65lUrQEvK90R5es1JWgubYfXALuZX0YRcPeO4lOaKi81lhGrThiisogI4TeLSuPwT7EItfbPd0IYAQZNSdonwWcVvsguYdLntJo6YsevZnFfo4ysR9eXvPB4eVQBUfbOTUg6fTa+3/K0nJbvcg/ivv8ccVS+nzGE0WLYLhpGc0XzjCiu7t/2JZ0Y/zeH0UM9IjNnogGg0wrufWaiXManeLDUNfrvXbCs3KR14BJTbTAK62DgT5PhlnR5Su9EEkJJJq9w046+cwG5WWS2CHUffLIk+Cfz+ocrE9o5VSY1uKebW3rueQ4H3CShhsgS9aQNHz8/pvT6xqy/RMnL7UpFCIhzuTJKqVx/9jdIZUII3ZYO/fjlyZgijWCwVtz25UKcf92kSaqXaI8cNyJddX/h3JNMoisC4X5ipNxlsjMLACHftp9zm+KJ+NUUcXEI5dK1prkwIqwaq9elcDiEolegBGi7nU6v3tm94EhNbIjT3TCKiAlpxFRLF/r+mHja6oGXCGZCOcesQCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(38100700002)(83380400001)(82960400001)(41300700001)(86362001)(2906002)(8936002)(5660300002)(8676002)(26005)(6512007)(53546011)(6506007)(186003)(66556008)(66476007)(316002)(2616005)(66946007)(478600001)(6486002)(450100002)(31686004)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uy9UY20zTzZ4Mk9DMjU2aFdkOVNRVGNyWi9VdERsc1NDby85VjF2OFZrMFdu?=
 =?utf-8?B?WEdYQnNsU3JKblJnTXU2YkRBclNnYkozdHJCOEdxa3JienMzWEYwWnlPb0pw?=
 =?utf-8?B?ZUpNRzlSMGpGbDRhVzBzeFlMdnhZQzJJK3ZNYUg0WHdrdjlqdjIrUDJsVWN1?=
 =?utf-8?B?VG10SXhWV290Vkw3bk45eXB5R2x2aVIrRU1aamxzTWo3MFc4MzZReXBBMGJ0?=
 =?utf-8?B?R2pNY1pjT0hHZ1IyR29yaGpjNFBQUDFvdlpLYlVNSFcwYzRVMEQ2eTlrUHUv?=
 =?utf-8?B?a05DYys3TXJQaDh1L0F1N2ZqUGEyalJPeWExWnI2WkdaQkdNMTg5Zk44bVZG?=
 =?utf-8?B?WDE4ekc3ZHlKZUpSdkxFY3lNR0Y4ZjJncElsZHpxbXZWTVBqcXZVWmIyM1RT?=
 =?utf-8?B?NEdFUHRjSmc5eDErMDNHajFoVmo0UVNUeWtQcFlyb3hQREd0Rkh1QTYrR1V3?=
 =?utf-8?B?YzFta2QvTEo5YVlpbnJSR085MG1mSUtKNktNbjdtb3N4R1VJOUM4V2N3YWla?=
 =?utf-8?B?c3hPYk95eFBVWFNwK2tXb25CN2RlMDdWUE0wWXpObnl5VmE2ekdDRStIWlVZ?=
 =?utf-8?B?T1c0aS92eFUzVDBmVnQxOURyQnBuZjBSd2FrRlEwRmFuVXdnbUdFdWJwR2V6?=
 =?utf-8?B?VS9wNWIzYU8xWEVhMVNLaHJ5S2ltcDJha0E4SGVPdzRjVlg3b1Z2R3p6ZDRl?=
 =?utf-8?B?S1doKzhDNElZMnF0TTFSSjk1a3o4aGVmQ2xHUVBXZFU2NDF3dkNnT3ZOTTVL?=
 =?utf-8?B?dWZ3aWNBblI2TnFaaHBVRXR3UkoxamdScmxWdjJDdlJtU1h2dzFTVGN0R1Bz?=
 =?utf-8?B?QUROcXlVYTN0b1gzUWI2aE9xbEpnT3p4Rmc5QmdCcExrSWNRUzljWTY4RVI4?=
 =?utf-8?B?aHl0YjEzdkNha0Rnc2pWY0xBZzR6aU5pMzZ4SkMxMHIzZWpwY1p1SDE4S3hF?=
 =?utf-8?B?Rm9IWmxJWVVPQ1dlTXozRlljeXZ5NGt3OW5IQUs2d2hueHRKVWdqMnE5N290?=
 =?utf-8?B?SFFzSDQ5QTRtSWZleW1KaG5GRHY5TCtUc0VreG1rdmVxRHhkNkw5SnVrVEQ3?=
 =?utf-8?B?VnNGZWdNeUZiOVByVGVTVUQ5Yi9tY3RnL0JEVWdQN0tzVjJnS2lNQ0FWb0pP?=
 =?utf-8?B?eG1zMVc4MmtXNEUxSE5iZ0dyODVja3kwWG1INko0RDM3OEFRYmJPQ3NCWGxu?=
 =?utf-8?B?UGt3WHYzM0U3bHNWQkR1VHdlSDFDMjVPbEJKamVvM3dzQUhsZys0NmhhaExB?=
 =?utf-8?B?ak43ZWkvMEFCcGwvT3ZqY20xUGU5aFljMDZkZ0NPeDQxbTNvUUg0dGdxTGZS?=
 =?utf-8?B?MzNnQm5sNHVWUWVwdkx3V0cwMGdtOWtJZm5BWFJyMW0vZlZBdkJRb2VlMUVx?=
 =?utf-8?B?MmM4YlJPU0xEMnlIdHFLaEtWUzY1UjQ5RmhBTzQzMFBsRVlYYnVlQTlVdXVr?=
 =?utf-8?B?RHVOUHA0dGZLV3pZZzhwVkVaV240SzhnSkJYUHArbFRyOXg1TDNhcXdvM3Fh?=
 =?utf-8?B?QXBpUkQ5VXJ1K2NEcURVUFB6Q2dUQi9LNllyWG1TVHZDNVBETkNEejkwbE9K?=
 =?utf-8?B?V1J5TDZNMEptV0dheGN4ajMyUlpra1RVVmZPcTlETmJaa2s5R09GL3NUUkY4?=
 =?utf-8?B?VFBjTG9TamsvVEFFQUpNcUc4OXlSYitoUklGb0YxSzhETGthaUE5bHEyU3ZJ?=
 =?utf-8?B?NWt0dktML2ZpcHREYWh4M2twakZNSEJNZGx2UXV4Tys3dzFvZjYxYUJObUJX?=
 =?utf-8?B?L2dNRjdwUUF0bGVpSTUrcGJ3ZlkwY0xvV3hHTHZraXJCWGZKeGVDV3NiSVNV?=
 =?utf-8?B?R3JYc3EwL3lMWGhjR2E5ZlVzRERpSWtVZ0ozZFY3WXIxelhFNzhieU5YWmlQ?=
 =?utf-8?B?bzNmTHN6cDd4ME9CZjZuWnhUTjY5ak41eERQekQ3TjUyOGdQRjVNR1NQamRY?=
 =?utf-8?B?WitTbk9rT1JMTnhwMnNCV0luZXdvY1RYZFNza2NITFBUS0FZcFVnaE5LVHZh?=
 =?utf-8?B?bnNNTVlVWVh3OFdJZlR0LzZKUldzL3RJci96NXRlU1RXMW5GcTkwWlJVZ2Zj?=
 =?utf-8?B?bUNBZmsxU1JHUHUyWVFSdVJaenc3d1pyMk5sb0tXQVhvYmhwUW5CMXp5RlV3?=
 =?utf-8?B?WTJ0Y3hZa1c4aUVBMHpvZE1xWWo5SERMODdPRkdFMDlxNWw0WmVBTkVvZjdK?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f60185-d6e7-4bb2-ec49-08dafd94d56a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 22:54:50.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZZa3eGTzeYG7UWvdQzBECX5uuk8nlQPoHflnLJKyEtgkRBPtz3nBjgV55yYDfLhbDkfLT+u/IVRZvD9MPXR2ZszNqXuYkQvXQpfD9aQj0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8089
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

On 1/20/2023 08:40, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 2b22065e87bf..89adfc4193d2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -11,6 +11,7 @@
>   
>   #include "i915_drv.h"
>   #include "intel_guc_ct.h"
> +#include "intel_guc_print.h"
>   #include "gt/intel_gt.h"
>   
>   static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
> @@ -28,21 +29,16 @@ static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
>   	return ct_to_gt(ct)->i915;
>   }
>   
> -static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> -{
> -	return &ct_to_i915(ct)->drm;
> -}
> -
>   #define CT_ERROR(_ct, _fmt, ...) \
> -	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
> +	guc_err(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>   #define CT_DEBUG(_ct, _fmt, ...) \
> -	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
> +	guc_dbg(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
>   #else
>   #define CT_DEBUG(...)	do { } while (0)
>   #endif
>   #define CT_PROBE_ERROR(_ct, _fmt, ...) \
> -	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
> +	guc_probe_error(ct_to_guc(ct), "CT: " _fmt, ##__VA_ARGS__)
ct_to_i915 is also now redundant and can be removed?

John.

>   
>   /**
>    * DOC: CTB Blob

