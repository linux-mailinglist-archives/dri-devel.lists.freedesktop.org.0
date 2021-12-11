Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF2F470FC1
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9309810E68E;
	Sat, 11 Dec 2021 01:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756B710E697;
 Sat, 11 Dec 2021 01:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184891; x=1670720891;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ILjrNOjzNqloWBgOAXs6LKu2V91/iCizrnLrKw0WgII=;
 b=HyLOoChoFWc92Aqv8JuI3vnHGp+zh+flAA6LzAWvtXo7ySJclvS9fKUA
 Oul5NmMGbJNno8XPhAkqkpwGzjcrKPJBZ1I6dGIEWi+fP9pR2Cql/IWcm
 3rqItBGE0zjNHdirhq+O5tlxNeswbIYZFLsuORfQlHLeafBFrtA7XctdT
 ecKUMzzhhbwSReziP8EzNzcKaRmm6zh0j+1bMzwfUYPeknHD8/GW/P04f
 Drov8ZFfRwLvHozyrqzuqE2/nB5TkUvY6aJydVxVynbxCBEJb9UA1dzGP
 ZXfjTSxViLautbzHTyh4Fp5r2wJG0jX66MmvapmLyQayGF5HDbEHLisnu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="218514943"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="218514943"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="463894835"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 17:08:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:08:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:08:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 17:08:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 17:08:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzI7En+u6qi/fyRAEHNXpr7sOkLQK6yU9I310bAlz9n2pIvl4Bynf0XABrXwheulWM3PXnIyRRVNOro+4LHoeyQA5hXgZsfbfufTbnSf3MQw2qWed1o/ze+E19PaBU7qsV0Bc9XYx8l2mJTDB7pgHzU+1YJS99i6JRHkcylIsRhV1DRzrc8bzl6HoiVLX9tNaxgcMJuf8Bhg8/zd4Fwy+Fscj6KyeHpW4X0SumpQuBzZPsavXl5YdbZhB2ErDFiDpLH1YLCfMx2KOUF6qj8zR5xQed6a8r3kMYk9EFlMlvkaOfjHdNZmeIVClRKi6/OW532CSdaVTvJaIVJbxQUxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaODt918OMGs635eti6QL655Jfib5i4PnL5K1cbODLI=;
 b=lJl8T1rPfqtR+QhKVpcrjV4wu7LC49HvrPNO4S/4SfszjyLsFD/9Wiw/63csEyopv6ynDJvNzfmlVnJpwlY15judn4ep7ZGtAURojM7mJ+JFkrQnEy7tPpsI9CwVIwz/oMt9Jw0Nt3BOt8igmk7Yypcax0PUbrJWVOqy+CXh1FXU9N1vJXG7qGxpa0On1cCCuXnLhNLTcrE2jS08BX6F9q+ZVc3ErQqTOEczOVeq38HXWp6VkH3YAnCeorn1tYG5OHwE1jdGIUXDhcZqXQG3EturtWxe6QQLBSEXmxAE6eDR+6bgm2Q1aMjpjtjPHYc58B8TFwJCqmjm2JoX4VzUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaODt918OMGs635eti6QL655Jfib5i4PnL5K1cbODLI=;
 b=mHGr0KvEyiqcJn0vBHnaZf7LL5EFtgKnasPQTxHW8+OGFuyvYYQKCa50gM3Ls69KgfDsb7h1b+B6U7mREOjb3SAyOvkf932kASvTwHOVqdzQkIbzhNFJEvlv1b59RwWJJDXoo6ytOuXcf0yNsnuLfgxE9IDHQAnNrdG2kjmxovM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BY5PR11MB4008.namprd11.prod.outlook.com (2603:10b6:a03:186::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Sat, 11 Dec
 2021 01:08:03 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%5]) with mapi id 15.20.4778.015; Sat, 11 Dec 2021
 01:08:02 +0000
Message-ID: <3341ea71-c118-2308-c388-c1a743337f3b@intel.com>
Date: Fri, 10 Dec 2021 17:08:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 2/7] drm/i915/guc: Only assign guc_id.id when stealing
 guc_id
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211211005612.8575-1-matthew.brost@intel.com>
 <20211211005612.8575-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211211005612.8575-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:303:6a::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4133a3fb-5691-447b-c9cf-08d9bc42ae43
X-MS-TrafficTypeDiagnostic: BY5PR11MB4008:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB4008E9076B501E2B09B9E62CBD729@BY5PR11MB4008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZqsimxto2lS4IsgmUfr2SDlGjBPwq7YeBQZbCLSi9Cxw6Np8AbByBYV9zssBMRFAXtSSjroZCWHxQ1dzFaDoCcGm2q041DyRFRkAvSEV3QR8JmtBBmAkbZ1Ztn0nygVWAAuv/SSieOYW7nG9afNOi3y9rYr3NlR4NXml1rnYYfMREOjuAmSGCQa2PGICBGgBwvmWGbqmB+1Zsj/I2cCwkZy9Os97cVBvgEoTB37PLnpBFmyWT7qx84f+8eX9Hc5TUV2HER7AKy23tpgAlZolt64D6QCv83kPMViN9xh0TcOu3DSAvQ1R928uA5syoli3+KawkEDSwAiZOq4X52zJA4t+a9HAkHzE0eWhhHkFfNJmI19mjmRQiUDUadRvMlapHVcrynCkLiNrXGGZAsXdzwwg/wf+Vx0iDAVDpXUt1rQ9LvmClunEruKqtpqq95/989vV9T89W5PBKQwmmYAYJP5I8/l4Ws0O4Sv0eoA6yBC9oqXJsC8X0iYSbmxCUB/VPCqYXM7Ar/EM/43pG1R+bRI2VvMIsxHZDcRQLBhFZRvj0cVY0SY/oOz7nwNZqCG3hdXpvg4hrHTkkxT/bPmZucj7Y1qXU17EoMZ2ZAzHA1ybb+gwHzvHRdVYsH9Gf1hpir+tQBo2v0kDsRr3+QzvlUvb2QAgoCZMMwNuql5jN6fw/glDQAlryJdsk8aAbk6zazBwrhOn/QTm1PwbZq8NlLwzmEro462xhkQljyPWJoL5iyQObWqqT8Ucw69G8x7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(66556008)(316002)(8676002)(66946007)(450100002)(31696002)(107886003)(2616005)(8936002)(53546011)(38100700002)(6512007)(5660300002)(82960400001)(31686004)(66476007)(2906002)(86362001)(26005)(36756003)(6486002)(6506007)(508600001)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3hoUkVwalUwV2VFQ3dpdWovR0s1S3NIaXFva21MRW0xVXZuaHJ2eDBnZjho?=
 =?utf-8?B?djdXeStwbnplQ0NXd3h6c2JSQUxuZjdSWTRudWhLeTRleFVFZjlDaGVFTEVu?=
 =?utf-8?B?UlpKNnB4TXk5NXB0RGRLb2dKTDBNbVJBQnJieEtDcmZkUjZpVXRKd1hVaEdp?=
 =?utf-8?B?elhqRTlSWVZZblRSdFhmMXdmT1FDQXVwVzZjNDFLMm1oR3BpbUNTMVYvSjRh?=
 =?utf-8?B?WGd1NDBJaEVUNXRiY1QvNXRLbnVreWhMUFVqRlBOWXVTNGRPbjRiWFAwcW82?=
 =?utf-8?B?U3B4ZGlyWXBVUThoNGdMUFU1U043T01iQ2d4S280aFh1cE1ESTFZS3kzTlpp?=
 =?utf-8?B?dU9PY1ljRGZSWjNKQ1lSZjJNdjNaQjlvcGZsOStsOGVLaWFnR1JjUE9tMUx1?=
 =?utf-8?B?U3NPYlBjYzJBLzRpcGFwQ1M4cDlpY0NJbXdOYnc4M1FKcmpnQ0RZVk9jM2FT?=
 =?utf-8?B?OXRtak1WajBHaFQwWHE3ancwOVNCaXNQUDZvVzJqZXQwdDF2S1ZPbDdXeWhu?=
 =?utf-8?B?T2VWS3R3THRJc2Y0MWljeXpRVGloVythWHNBelNObG9LeEV5Y212RW55TEhW?=
 =?utf-8?B?dDIyWGo4TjErblFRK1lVWU1uQUFoYzdJYjhSMjlRUlk5TEpzNzEwU2o3cHk4?=
 =?utf-8?B?K1QydTc0TkZ6c2tHcFNhdERyeGFsbHcwSnpIUklSZTAzYU9PU2d1Z0FVaERF?=
 =?utf-8?B?SXN6TThVajYwaFVPWUJmejR1aUYrNkdiMmY3UUdKU3ZPUmN0emxRcGxnOUdF?=
 =?utf-8?B?VEUyRnoxTWlGVTJRU3VyV0ZZTXpYenc4N3dGM0I3V3BaS2JYNTRDMUUzUE1T?=
 =?utf-8?B?OCtZbVo0SDlHK3RJd0pxbVA4K3lRMkFFTld4MG9KSm9kNlQwVmU1bDM2SDFy?=
 =?utf-8?B?R0tXNFJEdy9Mc1JsdDNISjg3SVk5bGxuQWsvcHpGZyt1aTJ5MDY2V1ZKRDl5?=
 =?utf-8?B?NkQ5bVdnRmNvZ200ZTdzRmNvWmJyejdRYjA3R0lTdk1NQVVlTnNIblNxdWNU?=
 =?utf-8?B?a0lBQzMvckIxYUxYWEVzTURpN05uTU1uU3N3dzVpR3VrUE91NXQrWVB2cEl1?=
 =?utf-8?B?aTMzUktYeVBJMkNVb2Z3RlBKTmF5VXZrTm42S3B0NVREbjFreDhHT1RSSy9X?=
 =?utf-8?B?SEc0YjJ0c1VJMkF0N2g4MVJTaS8vNzdnYmtDZkZoYWV6aHExdVcyMmpkb3JE?=
 =?utf-8?B?djIrdDFETkRpQjNYc1kzamJGR050OW8xbWhnQjd6K1V2KzlyaWhCbmE3OVd5?=
 =?utf-8?B?RnlISFZuVUU2VFFYQTVzZXpGRlZmYTBYQ01INHhVSHpoanZ2U2d3SXA2akJx?=
 =?utf-8?B?NWEwN2laS1M2c29mMXZKejlUbno1MW5mek16WVEvSENaazJ3Mmx4RWlWVTQ0?=
 =?utf-8?B?SzV5d1A3MlQ3aHJjdnFleFFRMVl6aFVTOFRnWG9zYlJ0OG9JaERjb1djQWRi?=
 =?utf-8?B?RGpSNTVzSDQyc2hnaU5ndVdrVlRYalkwSTNNOXJmRGhGYnVBbWhYWFJpVnNs?=
 =?utf-8?B?TE52Q1pRWmFidnlFZ1JoN0ZIZDQ4eWtSS3VmTW9qdG5ZOWQvZ3NuUmNlcUVq?=
 =?utf-8?B?aEh1Q2o2d1VYODAzcjI1WTE0SzJGUTYzakkrZE81Z3FnVXNrUnRZT1FQc3Ji?=
 =?utf-8?B?QzAvbjNzVk9JRnd1WDFwMWdndFhwMzBtQ1hSNU9Sb1RRZlhtQUxFV2U4Tmkz?=
 =?utf-8?B?cEQ3ZU1ReW8wR1ROVWlGMjNmL0Qxc3Q2ejlHR3pNWWlBN1h4Nm1yVjBtQVdT?=
 =?utf-8?B?RDlGdHArNEJqTGwwNUFpTmJBS0lvd1d3U1JIRSs5dGJEYW9zcnhCdXNFSXFS?=
 =?utf-8?B?SzIxY2ZWeWJ6a1Y5YUpYNmpvd2tTMWlZczJWZGRJbjZrcG02SmxYOGJ3aWdJ?=
 =?utf-8?B?MmpwaytvVHJyWVkvVUlDZFVmUDVXTWRtdGI4TkU1RnJMQURkbUNDcXVpRWdq?=
 =?utf-8?B?MVpFZWc5WWlJVjhlOEJCbFliQVg0RGgvZ3ZuU2hSQm9DSTJjdndZV0tMNDIv?=
 =?utf-8?B?U3NRRkM3d21jUFJSVTdUVkI1cUg3dDhHeDN1NmEzRGZmbG9wUFFUUlFEcHpy?=
 =?utf-8?B?K1FFZkZmcit2MVQ3cmhmK1ZkVExCQVd0TnlEVDVpamZXVHU0YXozYWszVkZK?=
 =?utf-8?B?ckg0emxDdmFUNVRsOFpnQzdnclRTSGVjTmtNNkJubGc3emdMbHd0clZ3VndQ?=
 =?utf-8?B?aEtha0Zjck9rdG5xMjFaaXVhOEkzTHdrMUYrNnBOT2FqWlJiNHRJeHQ3TFpn?=
 =?utf-8?Q?uyVpZTWouIP05C6PJ6TY6xANIiTHY0jVX8dM3Ch244=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4133a3fb-5691-447b-c9cf-08d9bc42ae43
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 01:08:02.8739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqmLUhsclSgcIGf5CiNTXVBdQLZFzyTqssgVevNtAuZu+Q9TLBQicDpkJLhIuqQLxqeYRmxg1XuDIVDafDaJ0v4qV77Z7zFN/1yux+NMHdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4008
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/10/2021 16:56, Matthew Brost wrote:
> Previously assigned whole guc_id structure (list, spin lock) which is
> incorrect, only assign the guc_id.id.
>
> Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9b7b4f4e0d91..0fb2eeff0262 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1935,7 +1935,7 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   		GEM_BUG_ON(intel_context_is_parent(cn));
>   
>   		list_del_init(&cn->guc_id.link);
> -		ce->guc_id = cn->guc_id;
> +		ce->guc_id.id = cn->guc_id.id;
>   
>   		spin_lock(&cn->guc_state.lock);
>   		clr_context_registered(cn);

