Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0A84BE90
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E74112DE4;
	Tue,  6 Feb 2024 20:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiCyXQHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44AA112DE4;
 Tue,  6 Feb 2024 20:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707250888; x=1738786888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M9j/JDz61BFs/6WMBN8FcbTvEd1iVTsT7sD3M21c19o=;
 b=CiCyXQHUkdnt3Gn5SCRmdfXxNfy1bNOicqLQ5/FP1oNr+rSK1Yr4AHzG
 vs7g7RwvUrGMlGUbWc1Qc4ziyk7ZK9xac8JQYMYBx4c18tI+ucMKYZn/o
 DfR1TAAZDvu1HMM9oWB0Dl/zoxLWvzW1N+rf8AmDfLrLe++tq5MDsDVjO
 Wv1jcgPHyoIE/mffZodH85rc3lNvyDJ1Y3gUm1Y2V9u5Wx8h/AP5+vXVr
 TVjeC/MWPwk2NII0DhnlHBJjRmNmB8aSro+EXz/q2XOhk3etwgzlWveA2
 iA4UahYJatj187zmf2ucmzcK9gwxUD5+nYewGdU3qWZBF0Fazdoj0FfAr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="395257595"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="395257595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:21:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1170068"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:21:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:21:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:21:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:21:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q838WibIngtO0vSyuzl0qybW61sjAkMKMPUKO+bU0y7HbSPeJzionKQIyU8FPbNnLNxQ1zuqM7o1e/wLuysKfUrOR0j4XAra8pPEc9VjkwxKHOjV0Ws9JQTQgnlO2pFEOXCPc0f2+uiVOt6P720pJ54ngVGi/HCtJSmAFkPgLIcfq0E8sMJry9Sj59VbmWiUrNd2txQKbphWJdizJ6tDn60WoeAGBOLwtYwTkH95G1nFPZxK3QhJeSx1z2bTOUq2vEi7MTz9U1hgybaAkhCzmLbQPAizgY5zx6QZSebj5AaYx5cPHtxkwImTwQFk21rIesi0XZdGNGLfiCUdlS18jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tbYbY8RW0UGR55zeI+OSlx/DwB+OHgOBUGcL9vsCeg=;
 b=VVy+wMkiVeJajyK2y820niZY+05B5JAxj5sVv6h1NTk1Hbt0448sBaqjo3cOu4c0lS+Hin4I9n1CDoyO1CPm4C+j4KnnL9QZNkFIh7gI94pDQGgU0laC06yZwc4Hr9Q799MrIxvK/bWxT3ACpypjQ+MRzV/fefLuihnrxGRAIamIdz2IvdRO3TqIe/OyoxoHJgCxiqDTmCVWO01vQJoGN+6xDe/9c06mOdIlUEwvM08bKEm2OAaFDlgBZbPL7/Xk92T8oaAwTBHD/auw/Rbl5MPMRlTq44ZP7ug14anifI90MeUHdqf6w+0VN3lsQplr2tjG06HkNcLQwOAMApc7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 20:21:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:21:12 +0000
Date: Tue, 6 Feb 2024 14:21:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next Mailing
 List" <linux-next@vger.kernel.org>, Dave Airlie <airlied@gmail.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <tughiv3y52m6ruczgb3g6mvvek7ihfrxaxh7ovoogzqfi6jmun@jcn6xap7vwcg>
References: <20240206122822.12a2df89@canb.auug.org.au>
 <f9a027765a3c65c69c2d49cf2964fe1155e914f4.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9a027765a3c65c69c2d49cf2964fe1155e914f4.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: e9190190-9b66-443f-8a15-08dc27512978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yu33w5esnwJX6xT0dM95RnPo39WfCb/IdXQI6bop+A+3uU6d1QPeoxFcLg0USldhdO6itcnhb8v+SQQu4t/IXjCgWqUP4DJqyNz10ANhRmzbtMcUtI0/v7IfyCmKxcBB935tO5fi5v9xenYKIswgpy0tGWA6RWt9iGZhmwmORTumIg8D5Eds120eVHCTLYSP59AZLDcs6FknZnBqd98KQANX/j0rTTvkRRz41WDaou6AxgDseXN8NLJeb36aNMA+9800dPxRp+B1WasDI49cBUhybnxmG6mJQS0NK/gOgrc/qTsgpb1+yWlP3OUm1d5MpFgAyFsfxgwykFs+Sz8yG8CkUT2y5pvNdFDbm1WOjcHKyECqGnv3W8IMIzTNcr/E2nEh71qYnASj+dbezyxd/oWFNQ49s39XMfYlVHSr2U7haLPOge5+MM92+IG00FaoVfOL+WK+VvesGL6llfrFeVzIlfu9yjMRpP+kpZQpSNDhx0KmgQcsJRhNcgRUlToFz0iVNjyc4MdfP2yfcqkCXzcHRkOfdSV9v9hrKyiJYw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(33716001)(41300700001)(316002)(966005)(9686003)(6512007)(478600001)(86362001)(6666004)(6506007)(82960400001)(4326008)(6486002)(8936002)(7416002)(2906002)(8676002)(6916009)(5660300002)(66556008)(66946007)(66476007)(54906003)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Knns0zH1QfC2mx7c9DtNMdBgI2vnbpDGVe21KHBmsOGQ351/cXVsxBzAgo?=
 =?iso-8859-1?Q?NshbOMWAtGI9Rx6t/rSCGQoGXABF9FSM4IbYNPLLAfcMG8sH05rWNd0s94?=
 =?iso-8859-1?Q?ndP+WogSyui/yu6F4DVP4XJtQGSUMUC4qTSR+XIDSJFTqQ/wnLHSVWMpi1?=
 =?iso-8859-1?Q?1FWD/OS+O/hWUDGbyHUT7S99o1kaOTI29sWwysHE/RyleuH+hB8y+3lKiz?=
 =?iso-8859-1?Q?m4XbCO5pe9J3z7+mjbEWA5hcSvnybmwmRFDR3acQw3PdAs9idXGihM6TKz?=
 =?iso-8859-1?Q?NUWxdfyAPV3yKgkLGwO+vR1M3cF/mvnXsxovmYchQSZBSSOrtzHMkcxM1T?=
 =?iso-8859-1?Q?rZ1B37llFEbGzrOSFfWEyZB9qBBFk7/RkXG3/wR9I1anPjRbOrZf1j7gWD?=
 =?iso-8859-1?Q?53J8xQoeW8QNUeweL7nNX4oHTTSuy1Fl2pw2j4pPbMz8exUthfSk3Gp8is?=
 =?iso-8859-1?Q?AHMXUkIRQ0fWi3TlDSc0CZpcCqCH7Olzl/mk7J2osJxu0G0Fr7mdtpz8yA?=
 =?iso-8859-1?Q?c7XuTusmUzsnHO8Gu4N9mWEc47H+w2jo5p3WCZn9lq0Eiz8YEdZdJ23r8G?=
 =?iso-8859-1?Q?p/CGsSSQdNcSzaZQmM0JMSyJCexRliwf2oyBdGrS/VkcJSnDVXDN4+STm4?=
 =?iso-8859-1?Q?E94pSz7wJM/gLi1zGNqQYSTG8wpjNRyaNNaWoWKsymL1JlqJemIUxnwyX2?=
 =?iso-8859-1?Q?xKfo8cubppELsAFnws4Nw3+okW3Nn9TLH0Sqo8cDcY0ljYo6K9EhqcBduv?=
 =?iso-8859-1?Q?kD+LKns0oB8GyA9sdPWMbfs75MS9JrZY1U2xsrnBgMxhteMByX86Fu2JY4?=
 =?iso-8859-1?Q?mTBzI5UNf0HBp9MJVQafZeyBvngWd9gxUt91IWv+NCdx+79bqu3lfH03PZ?=
 =?iso-8859-1?Q?6hE5hiDM5vmMSPGUu1vTd+8T3nbSJ/oLw1MljQCI5ZKeuPO9B+jLS+SdS7?=
 =?iso-8859-1?Q?pTMm5VwlYTqmPt13lSG9e1CppyahHuiU9C4JxFPTw6YrJLzTyKftZ0tcg5?=
 =?iso-8859-1?Q?1XAuWLUUV4jDWKa8H1OwbJMpwrERKLw5c0Ui0tMxExyEsX3OlwKA6FihgS?=
 =?iso-8859-1?Q?WG3jqTc0mCDBckxG9RLFLWwj44LVn9idJjnbZv/i/XVXzEOXjHKk1mNDek?=
 =?iso-8859-1?Q?3/AiexPdvDRI89LzDxv4nD8Hg5f5gQdEX+jMZVnTktfIi854WL1Kjhmz1B?=
 =?iso-8859-1?Q?tfSn5fI0vTQo9Z0wAvG35uYrRy2P7HRAkG13KUWmoJtUGbHl51J+KBSEa1?=
 =?iso-8859-1?Q?SnaaP1iB81MDvwyVGOwqLwvyi1egqxjCZYam4U7sGvi2r2/+4xNfkCgO7n?=
 =?iso-8859-1?Q?0jBOpQG7weBvRVBwDkkUj7s6ZXnL7a/+fkTJ1fSnuOWqPOBVsoPfWXpYpB?=
 =?iso-8859-1?Q?CtH80E83jlTl1JuofWhOWqJxdu+E5ty9u9MxQncyYrFK5xe4KM9suZw5c3?=
 =?iso-8859-1?Q?EnCIQz+I1vaXO6UcZFisD60ftrJOvVdVuTu1CGPKB1rfCfguwujUXvNw9h?=
 =?iso-8859-1?Q?eRNrt642au93hmaUTU91hiF5t1nxPjv46zpSdz0XAQmnlu7BgaUEWc0/db?=
 =?iso-8859-1?Q?EA8210i3uiT2na37A1qVHMx0CPCP4/CwLcBHWSRKxWkZIOlswFJLr8ZVAf?=
 =?iso-8859-1?Q?o4860rz04DFvRlbnWiAfiQpPeuHKZj01Wtw32qgZ+qw7o3psTPl2fgfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9190190-9b66-443f-8a15-08dc27512978
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 20:21:12.2834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Isb5Vv4e1R1UhsGDjxYW+vNg//oUMohkbh6/91gtzu9r9jOhizjqRnt5kgQJ5J4uJK3F9NrhEvuuJzy+qM5pNOMEBzzUJrxXlx17LVqqTjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
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

On Tue, Feb 06, 2024 at 01:39:28PM +0100, Thomas Hellström wrote:
>Hi
>
>On Tue, 2024-02-06 at 12:28 +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the drm-misc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>>
>> Caused by commit
>>
>>   a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
>>
>> interacting with commit
>>
>>   dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>
>> (and maybe others) from Linus' tree (v6.8-rc1).
>>
>> I have applied the following merge fix patch for today.  This makes
>> it build,
>> but more is likely needed ...
>
>There was a manual fixup for the drm-misc-next merge into drm-tip that
>did the right thing here.
>
>How do we ensure these are included into the linux-next builds?

I think it should have been done in commit 4db102dcb039 ("Merge drm/drm-next into drm-misc-next")
when drm-next merged back into drm-misc-next. Now one option is probably a
commit on drm-misc-next with this content:
https://cgit.freedesktop.org/drm-tip/tree/fixups/drm-misc-next.patch?h=rerere-cache&id=c39c6e3d74203820ef630884a5323237696bd36c


Lucas De Marchi
