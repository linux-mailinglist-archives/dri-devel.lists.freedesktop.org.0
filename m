Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA465292E3
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 23:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2A410E3DD;
	Mon, 16 May 2022 21:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B779D10E1C9;
 Mon, 16 May 2022 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652736635; x=1684272635;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ji87ob0D8PlkeajM7oCokKTO/3ta04TSuyEe7TSvsBQ=;
 b=EqeZahU4ZnHoHoLnnxNnFM0bPOqsIFhB5fkHz2tu1YZpnRim01O383/y
 cmFu8QuP7mIhu2ik5isArbNJnJClcTAQRLVzHQRCqMrno43uT44A1WCu4
 ApDQs6utZUjdJ1Q1LGFdbF4KZaHTj1Yoe9HjGdNH08n8VLderJLwQLDYf
 11/nAJ+8DcOdq01hMgm+I1mKbJeqb/vVYzgq4G3JDfgIAdEjhmUh8MyRc
 0tGLLRv9AF4vq9A3K1tHe+4QO8/BbboZKuZWcoYr2HvhAFNyUgOoTvYC1
 7Be6+N4tEZduCM8jxXd7VyZgMx7FGBemJzU/BvykEKgoOpzw/16HgLq0w g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="357380952"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="357380952"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 14:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="626144234"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 16 May 2022 14:30:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 16 May 2022 14:30:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 16 May 2022 14:30:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 16 May 2022 14:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aC//GJG9rhihlo0ZXXJph9eHoUwdGIaAMyIfcNgZDXvXe81pPa6OwEkm9qoCLE/Gk9Ox/kPJi3g5BCqTDhpfKt+oPSyWPIaeeo3ksyfTxUx3iA9Qcx+Co2a/julmccUsFMMNhILoAPhSG6e2UU9dkLiJUut+h2sLQd3ui6Nmd50Ik7w6wU/gRiOHycDSRl9p0LUgGw7YjkrZ71mqomPxI3hf9LITFWQ7adBqN2hAIA7btX3Wd8xegXB7p9KOZPIsk+EAaqOM/Ffo59AZ6c9vMKsf0YBjm6mDGxTscrmMItn57gL1MnAEZke3fNUJKw5jp8hJ7PHqzdGBNZZOQvzm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1krlOwxkYk8aL1Ao3bnXtUNns7He6IO9jcBAlhhNLQ=;
 b=kzVTOaW38iHmrfkUiInhPB3o6DBZm39XaP26EhzvzeJkkpiM1ZNWYo88IiEnPpMwA8lXuSbE4lGWSOCGySqkC0M/vdErutUvhBdA2lc7je+bWzlJkxPleXaG8uxzUbZYdySL5Fgicy9SUL5+fXG1I53gWPRE6FNiHaer6QsmkrwxBqgLrxDmc+rxOGLSTovMg7L3ivyrnzJbzz/zFRftqZcTJKsRYTIDPlKjOF4kgWHR6maw/GmT5jhIFGXfKoQk12qCvQablmu40P7o5rGFj1vq+GUM13HOcZXCvIMbJE5xz6HRyp1IS8OXXehlUjygXdBqSeHUWWvrY/iiv4UB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN6PR11MB3357.namprd11.prod.outlook.com (2603:10b6:805:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 21:30:32 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 21:30:32 +0000
Message-ID: <da1059c9-31be-f546-6ca0-26697a450d67@intel.com>
Date: Mon, 16 May 2022 14:30:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH 1/1] drm/i915/guc: Remove unnecessary GuC err capture noise
Content-Language: en-GB
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220507045847.862261-1-alan.previn.teres.alexis@intel.com>
 <20220507045847.862261-2-alan.previn.teres.alexis@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220507045847.862261-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0fcc6bd-939f-4bd0-85fe-08da37834e89
X-MS-TrafficTypeDiagnostic: SN6PR11MB3357:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB3357F1C4AF1FCCE9024270A8BDCF9@SN6PR11MB3357.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /BOcQ0+Os6zS6GpALpser7MLB/uOCqpw4thVhWQU+kx0dQFFRG7Yh5Pa8jrNwjxeEFU3qtUb4CE/jMSHt4OQUL3DoX8agzy+QYXNNjE/0CAk+pn5RlNjTRvt2wHj5iZ6pnX5QNZJtCJwJ8ctKZ2koVMOu85bA033ZRAAIAbzkvksX7GER6XqFPY4k6fKig45v8aV6SFU1paFJj9bgVpL6fpb0VI6tKoBLron1glZvEfaQmuAAqiAa/L6ibOw2Cmeh7P3CX16AQMzX6Iu1pZawSM4wZrdu0HO90qXQfqajB+n6bAyGcgcQdF1J2ThbX6WA9eSjuawniJ3kTl7QLVzTqGxcjPVpJZ0uaRLbvD/e2Ab16nfRulLWz44oFaAWanoqf0tQmsKS0KVgdfCrG0xxHxqyBBXBkvrJmhBE8/XcDKf2jjjb+CzwwzK2NBtulIRiAOvxz9hxGiCTCA/4W3anFtyenESSgmfd7SHdXKfrDB7Y59lm+ceuYwqEnutJ5qPPoxnzqPmxeokfiFtrdwFfuEcQ+MFMCX8YtIurFeYMsS0X/CqEqyOpS+FTnmB+/a3hHn5efh0yC1oBMb7WvRbh0tccPIGQkPvif/evcNuFHky8LOOf0wufuEVTP4KVY59dPSoZ7zeJXXBBRi/EeoSp6ZMkF5+Y5fiHs7HVgPgZ99ZGb+/v+yfRzpxJ46G22qR5xdVAbie/3iJn9dCbw5iAOFhbGm8es/GdNSTOXKQ3Yo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(31686004)(6506007)(186003)(316002)(2906002)(508600001)(6486002)(82960400001)(53546011)(26005)(6512007)(38100700002)(450100002)(6666004)(66946007)(66476007)(8676002)(4326008)(66556008)(2616005)(8936002)(5660300002)(31696002)(83380400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXpRbXo0VG5KRHhPTnpmeDJYaCtCdFFYMTRwMDFJZDFVbE1IQlZBSEg5ampV?=
 =?utf-8?B?WFZ5Kyt5bWhRdmlhZEpJQ1ZLZjg0YXJsdXVTVWhXSDh3S0R6OWVKd0JWb1BH?=
 =?utf-8?B?VmViTlE2c0dMSXJxbm55Rld2YjJ2SnZ2cmJxMm42M0tHakNOTjhic0RaQ28x?=
 =?utf-8?B?K1BsaEx0Z2d3K0Q4aHNqclloNncvOVltTUZBeGJzLzl6UkszZGFEK2Z4OEVY?=
 =?utf-8?B?U0NsNVAzRTdFOVhFUDc1WEVsWkI2eXhkNnlzeHhGSjV0aWd4MnVGTk90a1Qr?=
 =?utf-8?B?TURmYk02NlBUMGM0ZjFDeFR3MDlVQ2dqdFV5eUE1ZXV4TGcwMFpqS0paamds?=
 =?utf-8?B?Q1Fsc3l5Q0duMUNBU3AyZlJwdTZBSXhFUkgvSUhpVmJHdUowa3djWWRTMm5t?=
 =?utf-8?B?bG9wSmcxWFk5UWQvLzRYYUg1NjMxMDE0RWdOS0NReU8yQ1FUWmkzK1Rxdy8r?=
 =?utf-8?B?ZjhpVmV2N0FYNkFZM2dSTjNwMzQ1MnZZa2d3VFYvRmtLTlpDMVRjY0VoT2tS?=
 =?utf-8?B?WnQ1UXNVdU16Z0FENVZwM0gwTnY2TEVKQUNWcGFnYTZraHpFTVFySU9HNVBK?=
 =?utf-8?B?ZjNwQlBzWGpKWTU5RFRxOWFvb0k3UVkxdjFlSXh2Z1Y4L1JScjc1VjhzZjdz?=
 =?utf-8?B?WE9pazZEQnNJeVZUVDhaNnlwbWEzMnZubmJUU0J6T09wWmlzZHE0NFJDNVJt?=
 =?utf-8?B?WFhkbDNOTkZ1NllNYXZZclNtK1ZvS1oxT2l6aVplYWxnZDVST0M2ZGFJaWxL?=
 =?utf-8?B?ZkZEL3dxRXpKLy9leGNVTk9jZ1VWQXRHNHlPb0JnOS85Qmh4alFuK1RxSjIy?=
 =?utf-8?B?elFsMVhkNXlHUTNiZGdlZ0hWalpOZ0N2YTFmVTZJdi94eEd5bjNUWVJiSTY1?=
 =?utf-8?B?Y1FIazBCMll5RWE5ZEUzeGJUTFFEQlR5bzN1eXI2SXMzandUZFIvb05VcXFz?=
 =?utf-8?B?eEVYRmxkYjBkWktmYjdjVmpFd1ZhSVQ2Q01mT1drdVI3WmE3WVUwb3FsWHpn?=
 =?utf-8?B?UlczNnYrclpGVDdHY2FTaStDWGVNTUVjRmo4eWN3TWFnTWlxd2RoNXU5RC95?=
 =?utf-8?B?YnZoUnhjM3l6d1JmVWxxOHpna3NxQ0dxNGxUQ0JwTklsU0ZTYXA5ZWRPeWVW?=
 =?utf-8?B?MFN2MzdCcjltSGZ2bzNmTVpDNkdlNkx5amtHS0tsK1AyRlFmZDBvRCtvaUpW?=
 =?utf-8?B?a0g4Znk5MXZQUkwyMGFZdnJ0akxhTGRVWFlUMUM2NitHa0FaRUx4WnlvRVRr?=
 =?utf-8?B?LzlQVTdLK0QxUSt2N3Y2YmVqQUM5eDRIZEdFdmVDUXhWZ0hncGZrVTkwNzBr?=
 =?utf-8?B?Q0w2U2hvVUIvcXVFSW5rU1dQVTNMQU1heUNHczBJUVJ6dmtQNFd3eUpJSit6?=
 =?utf-8?B?b1BUcHJSczNSRTVBTWI2TlRPaXdaRGZUZ2tCZTR4eHdzblJBVWVZSC9HVGVF?=
 =?utf-8?B?Zjh1ZWxDWDVFeHlCRVBYeWF6RDZxVWQxZWYzL0t0YVExT1hESXdmSm5MUkFU?=
 =?utf-8?B?UFZQRm5pUGhzYW12SUpub0dhRnc3VktlMi9NMWRoaUpZZXB2RjhtczA0OGpZ?=
 =?utf-8?B?Um9RdkNFeVkxZ3piNysyWE0waVNHWTdseGcyOW9SMHp4MFBBY0lkQWtranNj?=
 =?utf-8?B?Z2ZMcVJMK1Vvdk9NOStKbDJyVEZCdEtFa2dqZC81Y2x1Q3E2K1dFQjYxZ01R?=
 =?utf-8?B?THUvRnZZMVNvRzBOMUt6OU1zNXNGbytKOUR2elZ0US9JcXpwclUwRkhaK09z?=
 =?utf-8?B?RmtTSE9rRHdzbzlpVGpVZk1Cd2krSjRWZDZ6Y1pJMTBmelJaL3c3QUtzT3kz?=
 =?utf-8?B?RjN0MmhJbWVYWTVqWXpsS25UeFN6cHBua1VONExoekZVeVhMbHp5S1lUSE1t?=
 =?utf-8?B?UUdKTEpWL3hMdXZvUFlLbi9FS0ladktWZGdCK0ZuUTExUHRZL1NZOVRLdFh4?=
 =?utf-8?B?R040Y0Mzb0NlaTl3azBLSlI3aDZiTUVwWlRISG1XMWJzMTJlZEtJMTlobTZp?=
 =?utf-8?B?UDRBU1pQY2dJM1d4K25OemFYMUg1UDg4bFU2VG1GTElaclJCb2ZueEQxS2lu?=
 =?utf-8?B?TkxHTmFVaS9ZTXVGY21JcGl6S0tmZXpibklpUmdDTWtjZDdKYlJCQTZRbTU0?=
 =?utf-8?B?VEtYbEx5SXFuS3lTV25sMnhINFowMEFxU0VLa2tpaE5qMnJpSVdzeUk0T0JL?=
 =?utf-8?B?Qk5RY1RkWVNyQXREVVNXSmU2YnRKNXRZaGhmZWUrcHYrZTRXK2wwWmhyM0Zj?=
 =?utf-8?B?RmZ1aTZlN3gyTVM5Nm1BVlUvSHBWWUpJRmhxOXRkMHhnWWlOQ2JnNWQrdVNQ?=
 =?utf-8?B?NHpjaXBObE5hOFczRE52MEQzSkVhbDk5QlJRMit6dU5kTTJ3cnZYU0JOVGxO?=
 =?utf-8?Q?c9Ro6tQGMG94VxRo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fcc6bd-939f-4bd0-85fe-08da37834e89
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 21:30:32.7506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dn2uPi2AiAykD9AsoOI97BEJjgc7fMrOBIq+mE3tU1jxzF4v85M+hN+6WRjfQTuOqcz9wrL7RD1MoaXuUzsh66JNAdjSxo1J43/J5AwKrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3357
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/2022 21:58, Alan Previn wrote:
> GuC error capture blurts some debug messages about empty
> register lists for certain register types on engines during
> firmware initialization.
>
> These are not errors or warnings, so get rid of them.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 77 +------------------
>   1 file changed, 2 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index c4e25966d3e9..97a32e610c30 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -420,72 +420,6 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
>   	return default_lists;
>   }
>   
> -static const char *
> -__stringify_owner(u32 owner)
> -{
> -	switch (owner) {
> -	case GUC_CAPTURE_LIST_INDEX_PF:
> -		return "PF";
> -	case GUC_CAPTURE_LIST_INDEX_VF:
> -		return "VF";
> -	default:
> -		return "unknown";
> -	}
> -
> -	return "";
> -}
> -
> -static const char *
> -__stringify_type(u32 type)
> -{
> -	switch (type) {
> -	case GUC_CAPTURE_LIST_TYPE_GLOBAL:
> -		return "Global";
> -	case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
> -		return "Class";
> -	case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
> -		return "Instance";
> -	default:
> -		return "unknown";
> -	}
> -
> -	return "";
> -}
> -
> -static const char *
> -__stringify_engclass(u32 class)
> -{
> -	switch (class) {
> -	case GUC_RENDER_CLASS:
> -		return "Render";
> -	case GUC_VIDEO_CLASS:
> -		return "Video";
> -	case GUC_VIDEOENHANCE_CLASS:
> -		return "VideoEnhance";
> -	case GUC_BLITTER_CLASS:
> -		return "Blitter";
> -	case GUC_COMPUTE_CLASS:
> -		return "Compute";
> -	default:
> -		return "unknown";
> -	}
> -
> -	return "";
> -}
> -
> -static void
> -guc_capture_warn_with_list_info(struct drm_i915_private *i915, char *msg,
> -				u32 owner, u32 type, u32 classid)
> -{
> -	if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
> -		drm_dbg(&i915->drm, "GuC-capture: %s for %s %s-Registers.\n", msg,
> -			__stringify_owner(owner), __stringify_type(type));
> -	else
> -		drm_dbg(&i915->drm, "GuC-capture: %s for %s %s-Registers on %s-Engine\n", msg,
> -			__stringify_owner(owner), __stringify_type(type),
> -			__stringify_engclass(classid));
> -}
> -
>   static int
>   guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
>   		      struct guc_mmio_reg *ptr, u16 num_entries)
> @@ -501,11 +435,8 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
>   		return -ENODEV;
>   
>   	match = guc_capture_get_one_list(reglists, owner, type, classid);
> -	if (!match) {
> -		guc_capture_warn_with_list_info(i915, "Missing register list init", owner, type,
> -						classid);
> +	if (!match)
>   		return -ENODATA;
> -	}
>   
>   	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
>   		ptr[i].offset = match->list[i].reg.reg;
> @@ -556,7 +487,6 @@ int
>   intel_guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
>   			      size_t *size)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	struct intel_guc_state_capture *gc = guc->capture;
>   	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
>   	int num_regs;
> @@ -570,11 +500,8 @@ intel_guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 cl
>   	}
>   
>   	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
> -	if (!num_regs) {
> -		guc_capture_warn_with_list_info(i915, "Missing register list size",
> -						owner, type, classid);
> +	if (!num_regs)
>   		return -ENODATA;
> -	}
>   
>   	*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
>   			   (num_regs * sizeof(struct guc_mmio_reg)));

