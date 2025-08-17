Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953CB29421
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 18:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9236810E03C;
	Sun, 17 Aug 2025 16:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHWbStLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78A10E03C;
 Sun, 17 Aug 2025 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755447777; x=1786983777;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UghzGxsD2tOAn6/JcJMVJl7D5DhKp4bCEc6qjzy3eIY=;
 b=RHWbStLGcq3NbZqLhRenUQofOYDeTz1MNRLisV+wX/C9TXpg15+j9ord
 4ZscGsT9Z5+2LuXFnCYU/FF91JbWUb8T70InPj7a0qScbbsUMu0gxJeTf
 qmHwaRuGsoiqq21W103hnIIpYg68i/OVvRSqwyuhRmhmDZhJU33KgiSTr
 RnftEILTr8E9TtzNZ0BLJivSBXSU0w+6nW5lQ130Q+qhzjU2oB4mhw1MA
 3IaPwcJnAFzA/A6xgB31BXXz9zBErhrCEZkYT95wFzkqgNhLQ/kNDG971
 wXBNUk1P53cw6naxxvC9ePQ++3rPEq42HqWXtOhbHCX+36+Vjy9/qF6+e A==;
X-CSE-ConnectionGUID: F2xtKWJvQyGKQi5QZpZ69w==
X-CSE-MsgGUID: djmZUt51RAaDxKX70GpK+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57763769"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57763769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:22:56 -0700
X-CSE-ConnectionGUID: IUkLBe6ATQKqDTi+vbPe5w==
X-CSE-MsgGUID: E3YnaWsFTWyfBjZewzsDWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171831906"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:22:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:22:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 09:22:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:22:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOAPrdh7k37dHENKby8xq9pi+g8MmYPxBM2HNTOoPNivGufmrRMe7nuJ1/YdKSEuW6l2SxyjQpVSC1VAt4zP4DQsu3hZIg/nN9MMyx2k5j/1HvftFNMos1pl+zyZAXaG1UHXyctxPW55hmYDcTtaIA1Bg7AgxkXRhyII0golO4CLo5/TI1yZbTNajNUsCTeTeNPl45QM5EUA5M96og5fZRKri/GX2RyXlPn+THVAPKJ1koFkIZwd/d7ecxpuu18VdhYmsoeDmP5ztitHtoPHzOOcKqnEvnf657rgCKQv1lrhxNPEFKUPUaOGqLuNBl4qNFPbDNYWjzxWPNDL0giQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT6vvkGjCHjWDhQ82aSL9G0lTGEvfVCkX0vZN9JDwU0=;
 b=SjNNTeUg6dC+9DP82D8SrdmJDfAQUcqW2HT00Z3kKH+vMpA4rnr1J/qXUWVZ9YxPHBvTu1tNxBtMRtT+7VyannYvjrpXtk7PLtAs0CYcNSbBkfRCrQang+smLMps3mIZxm+Y002+ex1J06qzGkWvMFYYMPYKGzR248zTKaNJudfdKSb8FZ6jT5+AFhB2/mgLjy3XtjVDqiIb0EXP9i20rMlUc03eHm6E7MHCKP+cA+odfxWow+5W/s3UVlYUEj5HjmJ0ODDfjDpfkoPl9DOI/pk70sEQU/qyq07vs37F/x1xiTYJoxvhN+BoUx9QBaymv5lKqd6/gCfC8KdCM0gwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Sun, 17 Aug
 2025 16:22:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 16:22:48 +0000
Date: Sun, 17 Aug 2025 12:22:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
Subject: Re: [PATCH v8 01/10] drm/xe: Add documentation for Xe Device Wedging
Message-ID: <aKIB1ArNJmjqbc8h@intel.com>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
 <20250814121448.3380784-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250814121448.3380784-2-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fc62eb-112f-49a5-2627-08ddddaa4e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fanT20oxWbGjicucvjHm3NWPZFYmM1qLbOthwKVQntcwUUcbFxlDFAz5Ns68?=
 =?us-ascii?Q?j4EEuKEmveGLSZ1Q/yOS9Knhg4xpGYI2vUT+xI8TfoHLdt0Bew4Tvu5uN6iP?=
 =?us-ascii?Q?0iF931HFO/luStArWYog29hxrEELB768x5y80C0/wYT8gWveVrTgdvpDVSgk?=
 =?us-ascii?Q?bW3jrpCVUmacrGJOIhrT/kE+KtDLazodahKmCZcPRB9AjEM2NSfxPlLvwZuU?=
 =?us-ascii?Q?nw1GrZ9QCj6V8CpSq14Q0xzP+qICqQxXe/arAzrgyHZp6QeWxXA1RxvsgWav?=
 =?us-ascii?Q?BwJmgofxyon8/xCAH83QWDexIhaSDA565eZpzAmEHXmn95dwm3BhSOgd6Nr4?=
 =?us-ascii?Q?LrhfiKTOxkseBjt9KbDxPmw/SujeCGyDZQc9bV2O+29RsRrj0lqWumFJZwtF?=
 =?us-ascii?Q?X8V1bHnzlHLnN0X12Bj2G9bKSbJmm0FRkWGFBgLtrT/N8VU+0TnQ/YMje/Om?=
 =?us-ascii?Q?HoQRzPYksOV/h3h3nrLo/oFnjyk06YdA8OC42V4Ccs2puUxM6gBBiSFSQOx1?=
 =?us-ascii?Q?myUGelKkjE37hiQ6e8sNDf6EHQjyZ/GLqcBP5qag6zXhZNbebxr+0a5firG4?=
 =?us-ascii?Q?Q7r0ak1i5iPQgAIE6ZyQtlEfPhCYtf4M9eWvoKI9+nKsNI+8JCGFnqF5B4wa?=
 =?us-ascii?Q?FctAHDpbRgPERTAi17NJD1xUZ9a8Kbf03tKeq7iExgqGP7TbkMJFMkZ8/dob?=
 =?us-ascii?Q?J9+hh6d50ZBurhtn6E906Ey0+CZnmmYyqXB/h0vSfjqHQMAUkoSvhOY4m5hW?=
 =?us-ascii?Q?FpRcc3HJMyvFZ/wKRe72uvsqkw9zPvzHwlcBtLuykkVc+oXaECnv2atwuKLS?=
 =?us-ascii?Q?LqUa9RzvkzKHTD+QOwR2XNWOWZkMwuttqMLLPVUoa5cK0seASgk5Y2Xb0apF?=
 =?us-ascii?Q?GkzeNXZXqAUTUdgAKaqERPtPRdHvOZ9sQKna7quFC0/ddzQD6UK927ay2rtj?=
 =?us-ascii?Q?BpD8X9kd7aukkPAuhwbpPhDr+gXLyvpQQzp8V2MuaDBraFBqpPpxF2tl77S6?=
 =?us-ascii?Q?L1CC65sXYZ71F7G0xurmdYSdHzNSvejAKDvryDWF/XhHwfz/X32G2zUx+fk+?=
 =?us-ascii?Q?F2YOwBSzuFo2xosdhjFbaktyPRUHsKF+R08hUKPOI9STQf7FpgbcUjNhlshU?=
 =?us-ascii?Q?ikDbuEVqG0lsJrnJ5KVmlNQ0z1s7f9NpBbPhnZZ9kGtAPqGyhg+GeG4ORVMB?=
 =?us-ascii?Q?9o0UzhND/M2213rVgaYN4QOQskRQLKkDfbm8ywP1jBqZN+RL63xoUrlhSGzx?=
 =?us-ascii?Q?ZSfVGM9H/Vniw+5UeOhudq8GwSNIxO7oQPQzwe/iia4/wWT8i2FnoZV5bBuq?=
 =?us-ascii?Q?Ey6bjgaQRJhl/jt8Kd+4QnjQtWyoPNQq8JNvPSzvpq5vf70btBYKcP9cUpen?=
 =?us-ascii?Q?XFjqTV2R3SSjEEEjYhd5EfQ+HW+GGDL5OmhIKQ2WA7tI3exDBEmJA/rMU88/?=
 =?us-ascii?Q?0g7lsuh4Q0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ito3Yf8X8C3NNnpT/Eq5im/JAz3cEKq0Pk+Eggjyebw/+pQJTeUXWVPP0m9r?=
 =?us-ascii?Q?R6xyF6owqfh7gdEX+P/XT1mZYOWKpJnUo8PAURDvsjrZkrC0QI9yLWZZ0v3F?=
 =?us-ascii?Q?ppuWT0QYhofa8AQikq6HaImPrYH//4zQNI0Hv55upGPMBju+yrFTv3IJ/Foy?=
 =?us-ascii?Q?Y5bsxVe1g8SIDlU+SYcIto6R3q7tgptqbEnEl8YtiZdIpn3uYwa0uwBs6uaM?=
 =?us-ascii?Q?hfaZ42PSvdsjhlOzPuylD0ww9Oa1kltZwDRnowHyGIrmszjtn0FcAmoY6UON?=
 =?us-ascii?Q?tPmx2Iw305+3O4ssK/FVbTPkmBDyw6bgESLurkLGA0cZVmz55Bd277DWl/ZC?=
 =?us-ascii?Q?eXuCIAj5h/JiP7q6mc5GR/sqFq1v21u1EaUmbrXIO/O++BuZm9n1XztUO9fb?=
 =?us-ascii?Q?PmVZF0LKZwR2T7i+Jzy/tE8X4oQ8/lmWmQz5PIxIFUOdngfg3R7IMIPf5wfV?=
 =?us-ascii?Q?7uM3Z5n9T5H/y2cWyUFakY2YtLz4WoAxjFY1494mjEXqXj0F2IyNdInr0xKW?=
 =?us-ascii?Q?tufSmbx3g2EuzM5ACdOBoWEE2HBpsBevV9cqe32trrBk+tI2yfHboF3Wsxw5?=
 =?us-ascii?Q?OfILz8CHVuHvp/nBP1tVMQoW1E+dGPSO/0VXuUTlIvEQhuIwT7xutnUZdmHd?=
 =?us-ascii?Q?qzYTBjvixBOGZzPfaLCCudzoiN7ZcAOs3LoP5bq2aCIQz3CwJqtgnKtuqPOL?=
 =?us-ascii?Q?lZN//bIds0k4kHC/ztAJKZ9pF0rv11Xgqby26hfZ4knmYytEkpHDyN/EQ69J?=
 =?us-ascii?Q?IlzBw37KpRwtG19ZGLmYvfVIV4XlRGC6aqLj/rbo03YaXGVN+dcXplLvpczb?=
 =?us-ascii?Q?gjb3zP/vNCwgnrG94TTwWCm3YJjB6zNxGaqlYJ9OJBs6REknlPCl/qjEjjli?=
 =?us-ascii?Q?0csQfGqddd2fo6gaIqUTeBBb/Wx6ProrSlaptSsH8FN5Am8bgDU+tI3Trsl1?=
 =?us-ascii?Q?gwOEj2XC6DAC3s+3B10auxJaUxrwrzG9CFTI3gqgY8KVykZRm+eAli+KlLR6?=
 =?us-ascii?Q?B35b7W64CT1RSq6CkAD2H6/oQ+PpRuOOjUArU0hs4rYI9PT2CYA19AjcXJZ2?=
 =?us-ascii?Q?1+h351fb/yPP7ll5DRhGWcYL/OfL/T5mpPWlQ9XZOmuiY8FDorxCeR3yetYy?=
 =?us-ascii?Q?1OSkxMbTz0c+Stg1w6N1VnMk03KNkFj5XhlmAZsU/ruSUmpY+2psZzQ1LNXH?=
 =?us-ascii?Q?k2nuYyMsKi5H/vBKa9UllfnrM7tJ18vNoPN4v+gny9+D34BAavsvPoO+wMQM?=
 =?us-ascii?Q?got4YLYwtay8lBQmO6vmwfwKWKcjJBD2b34wJOkgTAeVfyh96UY4ZDMqcX7D?=
 =?us-ascii?Q?KkucPGWMPVX3WKHbdL1Kh5CHXu/IWXigSWbmZQot0b32Il0S9r2KRj/OK1Mf?=
 =?us-ascii?Q?bCpaFQqRIuWA602GzDDuwfJwe8aiGCJzhFXy+ZDORF4/Xb8mlN13zjqtVm0X?=
 =?us-ascii?Q?aX82IetEefqO9h2H+8Z63VNmgNY0hFsjJS1aU7nf5pUDoIvuucjbSTWFvaN9?=
 =?us-ascii?Q?c1MWbetwne+IIC3hy5/j/UzmvTCvQlmN1UDnPNVMYP6GEhAIImsKKiA4R6+M?=
 =?us-ascii?Q?KKkkOuxvfyeT84J/aKJaqFl2A0PjVPAnSm83yEuS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fc62eb-112f-49a5-2627-08ddddaa4e39
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 16:22:48.5108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT4bJZ+ZEWq1YdR83i92NaFhgGhh8NeXTzsNBeCYVmLSfxrcaZRe6C4cwFVoc2v215Y+9mnNzBOioa2rN2cecw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

On Thu, Aug 14, 2025 at 05:44:31PM +0530, Riana Tauro wrote:
> Add documentation for Xe Device Wedging so that
> file can be referenced in following patches.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/xe/index.rst     |  1 +
>  Documentation/gpu/xe/xe_device.rst | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_device.c     | 10 ++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_device.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 42ba6c263cd0..88b22fad880e 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -25,5 +25,6 @@ DG2, etc is provided to prototype the driver.
>     xe_tile
>     xe_debugging
>     xe_devcoredump
> +   xe_device
>     xe-drm-usage-stats.rst
>     xe_configfs
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> new file mode 100644
> index 000000000000..39a937b97cd3
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -0,0 +1,10 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +.. _xe-device-wedging:
> +
> +==================
> +Xe Device Wedging
> +==================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +   :doc: Xe Device Wedging
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3e0402dff423..0ab0366c3a9d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1157,6 +1157,16 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  	xe_pm_runtime_put(xe);
>  }
>  
> +/**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot be
> + * used. Certain critical errors like gt reset failure, firmware failures can cause
> + * the device to be wedged. The default recovery method for a wedged state
> + * is rebind/bus-reset.
> + */
> +
>  /**
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
> -- 
> 2.47.1
> 
