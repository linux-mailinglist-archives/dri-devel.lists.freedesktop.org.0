Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9E608541
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 08:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8804710E32A;
	Sat, 22 Oct 2022 06:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E236D10E04D;
 Sat, 22 Oct 2022 06:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666421155; x=1697957155;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RqebuFfoWRCYmra+MxC0jwP/gzopThXEPrkiCVrOPL0=;
 b=BRWLB3vkwHE5tmDlfsJ7XlUU9EJrUvD3F0lHe/N0qsynoaiewoXvh5Fu
 ksXncYrK0vmBNv9/PsdHPshlK5w/jZavj9I0cukle+mkpk+gSjqlPE6CE
 fUK8Xn/IG9OxBrUdzy2k6OWFniLcWVON2jyir4YHrFiQTFombeZ4M2ppX
 mm8bIq+xmBjQBPsCOv8jqUtEw+XJtoEuDK8k5ojJtm53++HbEfUmiEYI9
 9O8f/+lWfoqqsCGevlgMJ+RZ9KNT0c4IpMSiRKMW7BNQZMCyNpfxMT7/Y
 l062MnDJGDig9ktyAcxTzCGAmHjrSd1ciU6ZX+4OlkCMQrc0OxNcru1HN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="304773599"
X-IronPort-AV: E=Sophos;i="5.95,204,1661842800"; d="scan'208";a="304773599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 23:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="719980946"
X-IronPort-AV: E=Sophos;i="5.95,204,1661842800"; d="scan'208";a="719980946"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2022 23:45:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 23:45:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 23:45:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 23:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3wAgNnDDxhhC7f7j8c3wXz7Sc6JjrXfI9gyqDtVl3gzgqEUZgrM1CaQM1V3a+cR7247eawEQlE9/dyxUUK0LQ5e6AFjMi4HT2/HiE+Rlc9Jv7c3fRoBfs74VgG8dXM92qO4/S1OqM+lK6+EBDy4xw3EF35dPYwFXhLg3PsSCaRzkqWxXK8qxX5CyHi76PDajyosScSGumMgN77mKxvAEqYs8V2g0mE5A0dWr5p+SXOBdO6lktACHscCIC2vQBGOqmJlf7FRTQQb5l/2E4DvJYqt2ynLLab9VlbTRR/YXlViaQnESBRV2YPOWZ87gL/3IUkVP1MfCRq8+ohw+rRYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1sG3hbxuYQgdm+ZaNGATA/Rw0sD5BME2fJhOvclvvY=;
 b=ViRxoW5VM7AYqaxDgMU1QaYW+ccPKgizpDJzXVXWfE5IyvDTfLwyk/wqKAx20KkS9GPaePK/C8kaQlKfrClDxcSxzlMGDr5qGjR1H+oMJYFhdjpH6udQRiQzzaU6I0TXGtwc4uAc5VwQhrNbOcikYbAu2sVvYQB9VAP0RUY3+79E0Hq/5Txf45NRO0C4MjtmKWiV31bYQ9EmAJc87rtMqUn/jpph78f8knB8vL2/CbmdjmWqY51P+2ZKtcYMLacJ4GV8NdtCi208hgbOi1or2sGAHKLZAcL3+tdND9l2etGWRHEBk/mCl+Ns66NbUSgpwBSvza0NiHEUGOQ5Ysl/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sat, 22 Oct
 2022 06:45:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5723.033; Sat, 22 Oct 2022
 06:45:51 +0000
Date: Fri, 21 Oct 2022 23:45:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/3] Add _PICK_EVEN_RANGES
Message-ID: <20221022064550.llyv4kj4grsxfncw@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
 <87mta1whjv.fsf@intel.com>
 <20221012190531.ecmurislebsivjhf@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221012190531.ecmurislebsivjhf@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 94912c8e-3408-41ef-ea8c-08dab3f90f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zkA0nOry2XDI3Y/JPTXpi0bEiUDWf+g4GUVvUiFeEdv0sS9SmBgKE8Hnkrri8T1F+jJHzeZeteJLXFoq1FCHHxZHBGJm6OLYj9DSrccxAmnGWBin3X+EU52ZJbNA0NJuusrDe52TuFPSPYP/Fg2cu/nNX7hrT+hNKigOGjbswAXLO0LgwfKILZ55qQPnvKnxB7L9tcwpPr+lCZnNGULxcyyBgeVNrjFg29Hu7Tg/KJmxzH7pyU05Mv7HPmvZY/AbhJg2zzsIKI0iXN9FawoLVcydfPTxoRxINmvE8S5aTkYBiKMS7tLOUWeV99hEh286tjRxi01ytduutbWc/RpGtGbrbqAOgZbjvJ3qAc+Mr9ihPdjNjWy6r1oWOWaNk0RkigidUyUkJuozWFz1gBEo26E2ERD/qfRvAMFXknaFf7altWvgHlTcza2UEcxRvmzt/H8OMI2yLps24obYFU5NjUdZ+yWYt0kh1dMZkW/3S9dUjx67RJ2hI+2JrMV9vyGFmZFILbNonkvzkYtWawZlCt85OibNQxwJTx//Foo5SEpt+zLO/LE5IYZa2UnrrrwM3KwvGLzD87coC6B0PzFARvOla9FSmGDQ5cfqrWiBtHmbzjAYjg5yRMffc5C50u7DHWNRcEAau0WSTjf2cyolivPS7H4SZnHksfeAw29SuBCSOTZB2Tu52LWvFXBC691iMvhy+g5hgmf4gHtKv51tcld6Wl6yX0mw4kMdtFYJUYTLDhWmQjWUvhzv0yMbigqI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(36756003)(66899015)(6486002)(82960400001)(38100700002)(966005)(478600001)(41300700001)(66556008)(86362001)(8936002)(83380400001)(186003)(6506007)(9686003)(1076003)(2906002)(316002)(6916009)(5660300002)(4326008)(8676002)(66946007)(6512007)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9+eTzTTQzLVnL1PkUOPbLuhz4tHFvhmsljXl+zT/b8NDfqIKXjf50V4y8jKa?=
 =?us-ascii?Q?Wzs7zd6/CiYZriO/YiWoi/trHR8Qdn7t3yNY5OUrDoCD504HzHmHPcBRmV+0?=
 =?us-ascii?Q?Ky4EShA5vUmxkhydFmfexLsfNV9pKWjC4AI2r8CeHaaVuSsthzQqPZFBpUIt?=
 =?us-ascii?Q?MZyS3Bt/uAgF4+hu8LDgo91u6Vu1XeBtxGS3/JzK5UIf7soxLxEKQgCiZFRg?=
 =?us-ascii?Q?7vgUGDGnvTNolBA8/tFOXR8QlA5+FgCUUv9nERpWjeb985ji2hLLVSaqkY4L?=
 =?us-ascii?Q?VWkrbUNraKQ9JpJyTePUcq+0fK9w8rAVk4X74OBhTr0AUpj5silNs+d99oQQ?=
 =?us-ascii?Q?gt819onaDQ772keSWsagbfDtY5f5m445xQ7cmykjnX2QUAcEBJXhzKq05vk6?=
 =?us-ascii?Q?vwIV5L0XtnGbqohUz4g9bUYHfUA5qyKbmVhVjYo7O4uWiEr0FYHfNHTpXI7w?=
 =?us-ascii?Q?0dVQJu5FxlYiS/g1+P7AQomjD4RURvCKdTE06T7WFd0MYNJtjJNruXLqD2+E?=
 =?us-ascii?Q?WgKFpjk2gDdyc5DdSxNStxkKMxsocFMoy/XLubkVP32ERwnX+88wNvhs9Sh3?=
 =?us-ascii?Q?2PnuDIjIALTs5bnxt+DgmRMRgo5bTH6Pa7mlWi+K6Vo5woeOiLarAZw750f5?=
 =?us-ascii?Q?jDxK5QOYYpNEWx6dS0ibUanZe8dm9Soefghs4nFsZASwZDK4MnTw5g8H+Q0r?=
 =?us-ascii?Q?y8yB6xaRLL/+avganOSGDZNRqzn7ym89Tj5rB1vhgdYmScv/QEyOooIhiXrO?=
 =?us-ascii?Q?pRYvcRIRmYA05pKNT9hT/R/qwV+yfrtMSLJuiOE1Mvujz4Y/2jvsKugPlsDP?=
 =?us-ascii?Q?8pcfmc3EEuwkZx+QdgkjdhwR6X7Yt3i5SeenvFIlqpiszVMFtVyioeo7WdVV?=
 =?us-ascii?Q?Q9KddyItzaqy4e5B9U9UsE+MpzikDzIJLebyzlukXkor4s4gBazracOZIPg+?=
 =?us-ascii?Q?Fn2G+bPXKz0Oy07ZuNKNQcMvAKMkYVSgncvyfbimOtqbumpLg31/gYT3mRrh?=
 =?us-ascii?Q?A/aU+mWGuX3okNCohFKEb0JR/M7hcfs6C0oorkXY1nK6ZkOlkv/Nqe1lIMIJ?=
 =?us-ascii?Q?N2FX3oheBoO3S3LEwnIAXQG9wKaCuii2hh620IvR49FD6ngZTFmx27xpAd1y?=
 =?us-ascii?Q?J0fW+8uiNivzicJ5UjwMGp5pNhiJ6fOY+svLpUeCr6uUJxAgSX9hzMjeDRCn?=
 =?us-ascii?Q?AXPl0y4cnzwhkdwpn0OcCBRtDgi4Vnh2n9JCvIUO49R6ZzICxGJw/By3Knt2?=
 =?us-ascii?Q?fjBV9FNjJZ8UOYQ5igMBzzX67rpnTX85tzYEB7KPjQnBQcTn7O/TYFY8xohk?=
 =?us-ascii?Q?QL8WWdp1x+AhWZjCMs5doK7d4jyV/MH47kfQuonIMh7qJiP6cR5llsjea4Yd?=
 =?us-ascii?Q?mIZ4fvbLvaGRhhGu4JMWcTpJXFJ2uByJB9uS6o4Sqx2Up09YXTnluC55sJSp?=
 =?us-ascii?Q?3z5VAHEOGKYmkce1XW9Xhbe3fQWhKxojk2N9eZ4B+3abMl5ZQ6S7rhuv6XiJ?=
 =?us-ascii?Q?/alNc9F0s2upTKwhO4UjDJyWSV39xqwI4u+jaiqY74mlqO/U0dYBykBvLY/G?=
 =?us-ascii?Q?xgtDlRIrvvw0mFYvXkUbis2NZpERIbDXvHZc5gm0rJTCXLn2JDcdy29LH4R6?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94912c8e-3408-41ef-ea8c-08dab3f90f83
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 06:45:51.6285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5yK8OEN/L4hkXt9VU6KUz1wsDo9gmsvO7JZ2HH7trD+GBvuv8iye5+fSI2+cBMv8znirZY9M1WZ6W8BPFyKvnsjv1pLU/OgIn4i1dh62Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 12:05:31PM -0700, Lucas De Marchi wrote:
>On Wed, Oct 12, 2022 at 11:51:48AM +0300, Jani Nikula wrote:
>>On Tue, 11 Oct 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>Add a new macro, _PICK_EVEN_RANGES, that supports using 2 address
>>>ranges. This should cover most of our needs for _MMIO_PLL3 and such.
>>>To show what is achieved with the new macro, convert some PLL-related
>>>macros to use it instead of _MMIO_PLL3.
>>
>>While there's nothing particularly wrong about the solution when looked
>>at in isolation, I do have pretty strong reservations on the whole.
>>
>>We have:
>>
>>1) _PICK_EVEN() used in _PIPE() and friends
>>
>>2) _PICK() used in _MMIO_PIPE3() and friends
>>
>>3) ->pipe_offsets[] etc. adjustment used in _MMIO_PIPE2() and friends
>>
>>4) ->ddi_index[] mapping proposed in [1]
>>
>>5) _PICK_EVEN_RANGES() proposed here
>>
>>Originally we only had the first one, when the hardware was
>>simpler. Every single addition since then made sense at the time, but if
>>we add 4 & 5 to the mix, I think it's just too many options.
>>
>>I think it's time to take a step back and figure out if there's a more
>>generic approach that could be used.
>
>true... I actually see this as replacing most of the uses of _PICK()
>and giving and extra benefit of removing the worry we are doing
>out-of-bounds array access. It also allows to more easily move ranges
>for new platforms, which is my intention here.

Jani, any feedback here or in the possible things to do below? I'd like
to get a sketch of whatever solution we think could be the right
direction during next week.

thanks
Lucas De Marchi

>
>So I think that we could have something like this if changing it to
>something else means a bigger refactor. Talking about a big refactor, I
>still think my series from a few years back would make sense:
>
>drm/i915/display: start description-based ddi initialization
>(https://lore.kernel.org/all/20191223195850.25997-1-lucas.demarchi@intel.com/)
>
>I think that got stalled due to initialization in the intel_ddi.c trying
>too much to group together the if/else ladder. But the overall intention
>of the patch series I believe is still valid today:
>
>	(...) create a table-based initialization approach in
>	which I keep the useful indexes for each platform: these indexes work
>	similarly to what we have on the pll part. "enum port" is mostly a
>	"driver thing" and when all the conversions take place, it would allow
>	us to stop using the port as indexes to register or register bits. "enum
>	tc_port", "enum phy", etc are not meaningful numbers from the spec POV
>	and change with every other platform.
>
>+Bala who apparently is going to a similar approach in the ddi_index
>approach.
>
>Other possible approaches hat come to mind (just dumping some thoughts,
>with no actual code/poc):
>
>1) Inside display strut we have:
>
>	struct {
>		u8 version;
>		union {
>			struct {
>				i915_reg_t foo;
>				i915_reg_t bar;
>				i915_reg_t bla;
>			} v1;
>			struct {
>				i915_reg_t xyz;
>				i915_reg_t ijk;
>			} v2;
>		}
>	} regs;
>
>instead of vesion it could be the "first platform to use it" like we
>currently have. Those registers would then be initialized during module
>bind and then we stop doing these conversions to map a platform to a
>register offset.  It still needs some per-platform change for the
>bitfields though.
>
>idea would be then to enforce using the right struct inside the union by
>splitting the code in differen compilation units. One platform can
>evolve from the other with the same compilation unit as long as it is
>backward-compatible, i.e. we can add more registers, change offsets,
>etc. But if the HW interface completely changes, it would need to use a
>different version.
>
>2) Looking around what other teams do. In mesa the registers are actually
>maintained in a xml. Example: gen12.xml
>
><register name="HIZ_CHICKEN" length="1" num="0x7018">
>  <field name="HZ Depth Test LE/GE Optimization Disable" start="13" end="13" type="bool"/>
>  <field name="HZ Depth Test LE/GE Optimization Disable Mask" start="29" end="29" type="bool"/>
></register>
>
>In code it's used like this:
>
>reg.HZDepthTestLEGEOptimizationDisable = true;
>
>3) Kind of going in the same direction, but more in the kernel side. Maybe
>switching to regmap?
>
>
>I think one of the things that block this kind of refactors is having to
>bring them back to all the previous platforms. Maybe going back only
>until HAS_DDI() would be a good approach. Or maybe even spliting it on
>DISPLAY_VER == 12?  That might help more radical changes.
>
>
>Lucas De Marchi
>
>>
>>
>>BR,
>>Jani.
>>
>>
>>[1] https://patchwork.freedesktop.org/series/108833/
>>
>>-- 
>>Jani Nikula, Intel Open Source Graphics Center
