Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A375FCB4C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 21:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED0410E04E;
	Wed, 12 Oct 2022 19:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85910E00E;
 Wed, 12 Oct 2022 19:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665601545; x=1697137545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kHHFBiGKyCVwA4Zymn5y2iTe0ruIYOHFVil5e1HIbZ4=;
 b=RAE9jFOBPx3AfAEu9l13nOiakDfBe6cSh1/siljF7KdIUQZYp6zYlLsO
 /8S8wMgPvsN6i/2+oMPwohlwQKFGYVWk8lHEXqO8D5Y7GyW+NiKVRisJ8
 1akvsUkQ3rAfrNvubQUKGhts3NzQVOER4081ieJzTqd9r0sUHtI+mlKu0
 Y3VndX4QbmeTcTIAw3H6kVM9yHzE6RuaFHnGdw2Sz4ARTiaf202cNXMPw
 7EwxPwarebUyMPszaGAqZnbVPNva80IOJr6hVBB9RwOzQWTKGvkhQyZV5
 Tzbt/CoqI7G4wwa4c5y6hkXgPIdZ0GpN0aHMYPjTUnJpDxRZovD+UPPOd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="331381799"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="331381799"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 12:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="629225675"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="629225675"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2022 12:05:44 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 12:05:44 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 12:05:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 12 Oct 2022 12:05:41 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 12 Oct 2022 12:05:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnhCAzKC7obFZsnd9HgupLX4Nj/V1ysfXZtIaKUbRQg8WLSzY45fg17FvaEcsgK6qaPPwf89E18UK0q9vxe/gPs6jmg6MIRZeQaP9/zZLeqfdytMPb9mEjcNbc4U9UM1XtAzvgyXGTQW4L5+oce9jPWX+A/bZ8OzzDSL2pbdaKWNB3rvR+YpeFXrJ8hGnE9jBKDORiZp0nhLIoYCvaiNc940X4yFAVRhB/im7Ur8QgNd2gx+dU0+Fadm36aqzVX1hG1x7GacK3tkTEV6rxDvssx3YAOyjL6+vjm0W/xHjDi9OL1RcpThhFetlVQppjP0DKw3NfaMTiTowVKUt8f6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7xpb+zWUgM+HFnkNbg47y6wtDzEuOZYFgLb/SxKHRE=;
 b=JyAzy/GJE5UcXN9dJyqYTCxDy71hNcVlglXqMQ0FfD6IPQaBQi6x7X02/OchG+dBgoYbltA0JqalOXldt2GGEHdbxiWZ2cse/Sl+358OAEC1fm/wLSLu0fbBKsB8Z5m9+ZKeXnQHvXhmJdeywtpn12GGjzPSuPnS1W8fxNCWqg3RDaQpn7hBF0dUv3YgeELVY94bAO/wRsaTnZqBdRNljxFe2W1QW9ae+OQZFAOyKsPO1ktPuwumwpURX9oU3qjnAPOz+fUH9vVpTY4pNWdlFFTMitB8eNVnctrH19jS/96GXSzUmoTIOA8l5RRTGDVSTygrsva74BxRB/mHqmobuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Wed, 12 Oct
 2022 19:05:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%4]) with mapi id 15.20.5676.031; Wed, 12 Oct 2022
 19:05:33 +0000
Date: Wed, 12 Oct 2022 12:05:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/3] Add _PICK_EVEN_RANGES
Message-ID: <20221012190531.ecmurislebsivjhf@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
 <87mta1whjv.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87mta1whjv.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c671f55-ae6f-4fb3-b6a3-08daac84bd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxKh0lv6y/ZOgDf+PToPXhdfkARkMg7EDEtrzTVeUxGOE/TwsYqkD6cCGxh9aOCVFVUpnDOXjKzCSnqKzoKo95l7KQD9RkHz0MZ1IkXG+0VNduC8scIZ459DkjlQUQN23kKCtuTS+r/dZIQfIAZGgcTZ06x7MxzBuxfGjzGVSryuXEfrwvZyrc6LA+yDaXpeIrpO14G+Ctibz0i3Q/ct0muq8msqKUaAl+Y708pVGRBFhGQE9Bqyi+0p9+G+cOaJoEx0f8vi+qwsrytQbs9oGGT/zlm3tksCK0ATtbGIWpJXS30BHASGl/OCncfcIfDDg4W2Xq8sdjdJ7Nhw7oh6WtlUNJqR8di0D8BkehAVWq22dfGyLnaimkXhvDXsVnnUT/PkHHZg+oUv0LMCoLWpEMvxGsDdZfQPmD8Lj6unnd2dWIg0bkb22CCOsIlDxkpYwVs9Xhk3hjzJsUR6CUFmB+tvP62H2h6XBHHGDV8aq8PajFyIV5MtTXfDLCiNJ/vhd2ycyMhp9darPF/BvWD6nWzU3ZlFyG51yTJGbTt14w8NPPRDKT9eeqCGYd+E1fhAvUUrgdTy/JZRWbHDhnX2oOZeEh/G/7M4Nla0UXk6jnwhMpmdh/rJAVPqk6a0EFxXqL5vYVBcN3Jxg+6T2PgmwilhRHzKtwpNq7+GTuCd83YR3XMA3CBHk86+0GUMnBt9Qq6H6esbFtwBwFzZqXHeVkCSqw3xqacNzIIQpMD/xfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(66899015)(2906002)(3716004)(186003)(41300700001)(1076003)(66556008)(966005)(36756003)(8936002)(66476007)(54906003)(4326008)(66946007)(83380400001)(6512007)(6506007)(26005)(8676002)(9686003)(6916009)(5660300002)(38100700002)(86362001)(6486002)(82960400001)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xDK25FoqtBBY251Dn/nl/bm5jqEx1xdIG0xPVkyJkaT5yRXNMmTzot3e9QnJ?=
 =?us-ascii?Q?KfLgjA1e3Bl19aBLnbjOOLLzGYGSO4qF84QxQXIcBiEEsIEVq0cp+4z2DRrs?=
 =?us-ascii?Q?y8FjAmqzG8FDI9Q/ORSJgENPHyi8XVAGBt8L+dkylq4NdAt87HJwBSDzUFwM?=
 =?us-ascii?Q?DSyc+l/i2nI21EFm3UXOT3/vBHitKhM6m0JQj7TeMmE+rwpYwi4EsX1Dkrix?=
 =?us-ascii?Q?pQkZvkXIYXHddsLBLavY8EElQ4nTydrnK0CobF6SJ35z3LC9pcGUIZRvenAr?=
 =?us-ascii?Q?p+UYU++19MW11z0v/TVRnmKFsYAueAH801xLOe/O4GvWeai/op2fwBujKHEp?=
 =?us-ascii?Q?Sx/EmOO+Vwu0qe27iohp3pWIzp4F8EtB8F6PSEJ1Qago8/U0J2cxjetAJg6f?=
 =?us-ascii?Q?7tIBOgbI+x4d9QKN2SShnv2iGTdhl0Sn7ujGqDFgWwex4Zl7PiM0ltqkt6qp?=
 =?us-ascii?Q?dxsr/JBjKpGSamgwPeOA9pa1amm4PFh5iZQLPXKXFdENfP1ESxm2nplk052M?=
 =?us-ascii?Q?zUcEtsVt/zzT/S5Y5b8Oua0d3pEc37+DNZwhWyr0XzqustCmG3g5ykgaHbD9?=
 =?us-ascii?Q?rP+ppG9KMRnLfn/UAVzg4cJeoq0pWAl/AvBZnCKc37OeXH7nMKR5t45o9bBL?=
 =?us-ascii?Q?xZfjiRpfQg7oBiXkAoAS3BPwKrTg2sSzzDgXdGhMyt8yuRxmWl3ZKreosfM0?=
 =?us-ascii?Q?eA7U3nORv+h/aNciJGHuWhvKWkY5/8H9t69n1CBWd+dezVDd03A8txl2o+Ec?=
 =?us-ascii?Q?GWCMzflroT6Uo+DxmpvHQVY4hTN1gQeG7aamS165NByBQyTlfWuG0hZA0Cub?=
 =?us-ascii?Q?9WBw2LfVTqDd5bcK08WtJu1eFraBPh3AG+PXcbmp7KnPIU5vhn9nFFkLq+hD?=
 =?us-ascii?Q?VNg3wSmrQnDO90/SzhgPI7/WvFtuW5F5yb/0O5pCFIG8r6FZChTbpQujUad1?=
 =?us-ascii?Q?3F5B7y4q4EQFG1zlgjNi8qh1GPTD6xFrpatZwobPRwcu/Ty7E9fXFnRT2bTX?=
 =?us-ascii?Q?ZRMtdoCpIR3Yp9bunY/djZAjUiCDRT6bAWzxALlteUnVBsDEGOaJB9tolymh?=
 =?us-ascii?Q?wuldPk4EFDzfkmooYp1HEiTOhxBrGXcYxGjWAKdjRLimO5YIEh1NDt2wmDaW?=
 =?us-ascii?Q?fIx6iH/AfkUVdbVUqUyGe2kNat72EuYBi+5NZiLELLKS77viK7PQxFO814LO?=
 =?us-ascii?Q?USsxL89Efn81/43ZzYXclNim7Zmj+M3gVbuVmIZdddDguTMrB2nlU/3k6Fg2?=
 =?us-ascii?Q?nmFJnDFn1AbpB1HaLSzf+7ZzF+wbyr0a0UGXDAFWmnzXdxiX0dRGGPb1H4KB?=
 =?us-ascii?Q?y2utpLvZVBzo91b386mELnG97PxzALpJvsb8l6OZD9zw/tMDS0h4FImu2m4+?=
 =?us-ascii?Q?XRhX5hwszXDA7kPcsyffnWdp6ZkP8raHOFqe/AxAHbEq9GXSRyyovaeWC74c?=
 =?us-ascii?Q?vn0NnONj+JrvvCjC997CB3GyL2ODQGetQ5CM8VZcaGBZ0HZno4+zNWK8VA2/?=
 =?us-ascii?Q?nCDPQVPa4Su7u//v1nDB2OejgtJ0tKnrdryG1VaFx/EuGoeQAAuNnxoPxOBr?=
 =?us-ascii?Q?Hwn8QaOKnGWdXaeknivNeRC9/w9Rl+mzZD27/lqIZn/NyQ/2tCisUnzVXs23?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c671f55-ae6f-4fb3-b6a3-08daac84bd13
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 19:05:33.6067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5czLau/OKxynqqUXF8yYBJG/xzoZbzc/IqrR+bn25RhM3I+/97CEwwFUuIB/97LWElHTxgfzMdGVvg/W6ZaXJHkgpzXov9sTImPNo7Nojo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
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
Cc: intel-gfx@lists.freedesktop.org, Anusha
 Srivatsa <anusha.srivatsa@intel.com>, dri-devel@lists.freedesktop.org,
 balasubramani.vivekanandan@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 11:51:48AM +0300, Jani Nikula wrote:
>On Tue, 11 Oct 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Add a new macro, _PICK_EVEN_RANGES, that supports using 2 address
>> ranges. This should cover most of our needs for _MMIO_PLL3 and such.
>> To show what is achieved with the new macro, convert some PLL-related
>> macros to use it instead of _MMIO_PLL3.
>
>While there's nothing particularly wrong about the solution when looked
>at in isolation, I do have pretty strong reservations on the whole.
>
>We have:
>
>1) _PICK_EVEN() used in _PIPE() and friends
>
>2) _PICK() used in _MMIO_PIPE3() and friends
>
>3) ->pipe_offsets[] etc. adjustment used in _MMIO_PIPE2() and friends
>
>4) ->ddi_index[] mapping proposed in [1]
>
>5) _PICK_EVEN_RANGES() proposed here
>
>Originally we only had the first one, when the hardware was
>simpler. Every single addition since then made sense at the time, but if
>we add 4 & 5 to the mix, I think it's just too many options.
>
>I think it's time to take a step back and figure out if there's a more
>generic approach that could be used.

true... I actually see this as replacing most of the uses of _PICK()
and giving and extra benefit of removing the worry we are doing
out-of-bounds array access. It also allows to more easily move ranges
for new platforms, which is my intention here.

So I think that we could have something like this if changing it to
something else means a bigger refactor. Talking about a big refactor, I
still think my series from a few years back would make sense:

drm/i915/display: start description-based ddi initialization
(https://lore.kernel.org/all/20191223195850.25997-1-lucas.demarchi@intel.com/)

I think that got stalled due to initialization in the intel_ddi.c trying
too much to group together the if/else ladder. But the overall intention
of the patch series I believe is still valid today:

	(...) create a table-based initialization approach in
	which I keep the useful indexes for each platform: these indexes work
	similarly to what we have on the pll part. "enum port" is mostly a
	"driver thing" and when all the conversions take place, it would allow
	us to stop using the port as indexes to register or register bits. "enum
	tc_port", "enum phy", etc are not meaningful numbers from the spec POV
	and change with every other platform.

+Bala who apparently is going to a similar approach in the ddi_index
approach.

Other possible approaches hat come to mind (just dumping some thoughts,
with no actual code/poc):

1) Inside display strut we have:

	struct {
		u8 version;
		union {
			struct {
				i915_reg_t foo;
				i915_reg_t bar;
				i915_reg_t bla;
			} v1;
			struct {
				i915_reg_t xyz;
				i915_reg_t ijk;
			} v2;
		}
	} regs;

instead of vesion it could be the "first platform to use it" like we
currently have. Those registers would then be initialized during module
bind and then we stop doing these conversions to map a platform to a
register offset.  It still needs some per-platform change for the
bitfields though.

idea would be then to enforce using the right struct inside the union by
splitting the code in differen compilation units. One platform can
evolve from the other with the same compilation unit as long as it is
backward-compatible, i.e. we can add more registers, change offsets,
etc. But if the HW interface completely changes, it would need to use a
different version.

2) Looking around what other teams do. In mesa the registers are actually
maintained in a xml. Example: gen12.xml

<register name="HIZ_CHICKEN" length="1" num="0x7018">
   <field name="HZ Depth Test LE/GE Optimization Disable" start="13" end="13" type="bool"/>
   <field name="HZ Depth Test LE/GE Optimization Disable Mask" start="29" end="29" type="bool"/>
</register>

In code it's used like this:

reg.HZDepthTestLEGEOptimizationDisable = true;

3) Kind of going in the same direction, but more in the kernel side. Maybe
switching to regmap?


I think one of the things that block this kind of refactors is having to
bring them back to all the previous platforms. Maybe going back only
until HAS_DDI() would be a good approach. Or maybe even spliting it on
DISPLAY_VER == 12?  That might help more radical changes.


Lucas De Marchi

>
>
>BR,
>Jani.
>
>
>[1] https://patchwork.freedesktop.org/series/108833/
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
