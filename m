Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CEC3B37B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AFB10E8C7;
	Thu,  6 Nov 2025 13:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQbbikPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E8910E8C5;
 Thu,  6 Nov 2025 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762435846; x=1793971846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gvHaLEEUF/GWsyOUsUZanZmznM286CMOzcpRxy5DdBE=;
 b=MQbbikPFX+K0cLsGqhmByrGbHZwP0DSqbKicitUL9Pw3HUWxp4IVDd+B
 DuISLgSTZWlxA9cssV7EpeeX2LBpkNp5T/hIPujhlBWhxDumMT7HQQbzs
 F7e0FWLMXhGZkp6scBcsArv56yJPy65+lua1lRAkl2pE/afLC21YCnUuN
 YTZiKfgyxmi9uk0MOK7H77CI9BxyIoVREKGhEaXmGOzJVWxwezCdMHVqO
 z0ATYEihxbZvDLirkhiOTSCyD3D2Jv8tOYA+4qBgfEWNgVRqlmMKAs5Zl
 isKACWU8p4vvP/CgSK4PSdKNaUg1ourywX8HBD2Ujsu24Ygccz+46Pv9R w==;
X-CSE-ConnectionGUID: nARmFx/hRbquzn2XfBvm7g==
X-CSE-MsgGUID: R9lWenaPS3WBngik9PWKQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75686568"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75686568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:30:45 -0800
X-CSE-ConnectionGUID: GRJnkQu/RhyBlNn7oUJ2dA==
X-CSE-MsgGUID: zIXJd05KRxmLUsTmRiZnBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187010959"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:30:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:30:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 05:30:44 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:30:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4l1pX1K3kSGoBNJwnKN1XqPh+hH6r/drDWRZXjrCvxySEpUUCrsg19TYZRJudWmwpp9pRYyViciz382OC+AoQ5RbD6R8fHm63IA3R8RDZsmvaEQ2AiaefKTT25sWTvUK45gC5VZeT/nXUrwlCy/jt4drUVCkVzurRrxLWNldA9LnyNkMXEyG4NGvA7KBBHojf4OPCfEYQr/TAgJ3ZBOmGDLio853E+9sXxNWgL8Gnd0SF7vQlYe1x5GOYP/Iq/sDF3Pg5rUJSE2c4j5UmcnOKg1gaZD3lDJONpFYreaK2RbXG6TsBHlmkDRLzDVQa6LncZPBiUmRj4EEWrMNVBx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvdn6YGkCSbLsTRppLRO7zat8buvXlMg/MI9Gb1MuG4=;
 b=LKNfmRJw3WSZgAmtK8qSLkifOp1iotWqQdVG7DePlpOR21bwZOwZeCnXMWhfwPxj0ZvxXjBAQxw0BfNw3Qn2R4wbYq1zCsvYXFphLlDuHDaiY+9XkE3QTz7G9Tw0nY5HVFGGoKiJIe+tOTYsXuiLZuqIfzDJnG1H8mJ3xunQzg/OJc7V5kN5PjgaNsJGNRn9BLIv5vLCCcyUT+t+c2qMynF7gYis5h/aXokGnREzGhmge7aHuazpuTqiAm9ni7ODgroW0P11jytXO9jTx0hOCmG3whgmk61LXpl2/slTdvFkE7ujhdZyoHz9hB1rm4vMcuuhtytLv4yx28S0ENbT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 13:30:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 13:30:42 +0000
Date: Thu, 6 Nov 2025 08:30:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Zack
 McKevitt" <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner
 <lukas@wunner.de>, Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
Message-ID: <aQyi_VL5AzzXsYtT@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <20250929214415.326414-5-rodrigo.vivi@intel.com>
 <20251030183254.10d64ee1@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030183254.10d64ee1@kernel.org>
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a44a0ab-b904-4f40-04b0-08de1d38aec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EyJkWJhMWqo/MtFOCsL0n7MVeslDvUnY3r9V97FS+ds6LcoIWVcjPk1Tz8Kx?=
 =?us-ascii?Q?We9MZc1bufHrT/nCfB8iRU3ZN7KZFcu1XDa9EH3jQD9TmmHBt5xBV5aUUajr?=
 =?us-ascii?Q?cIgbo0smhnHgd6TZe34awmP2/pa8dtYYfp4zDn0fFpSxOqyxDoh46uVsP2g2?=
 =?us-ascii?Q?bPYuWuyudyoEMyJBaQLWHpEMqPmWrxTgZxPNfe9VM+YX5KlHLERVcmu5ijkz?=
 =?us-ascii?Q?XOysFTNa9OtNnb0apprpIiWiqE5nENZWaHOVy1vScaL8EJ6/pgzRPTRRfoFP?=
 =?us-ascii?Q?jb6cQCIii5e4CZj69hCKVNr5Ft/ej2zrN6Ruj6qwrxWC4w93NS0jA6q0RwIP?=
 =?us-ascii?Q?wYj1FXHN1SBYPRpMPKl2W0essn362j/efN62Sj++sC8w4E7gMdNM7WjSUH8Y?=
 =?us-ascii?Q?se3a6plZYRztl6WVx76J6hKegRc6ycokULrDZRNAAsfPlx6/31PUYDKGTIWS?=
 =?us-ascii?Q?nl4AbII15oJjqiwthYRwpl873seyJrZG5JPx7Pe8YjKtULNPUZIexPhall3c?=
 =?us-ascii?Q?gZdbdLZHNz2vaoMsIk8R5CWu2IHOuWADadHa/jt1RTXrxWSQwnkWMuv8EjaV?=
 =?us-ascii?Q?u2YFGaukX4IhJ/A2uhzKglWHOA8kt6DoVpOgcaZxUY37lnbExnGArVv1ONdm?=
 =?us-ascii?Q?ftAH5odyoibVpYgPSJhEApdXeZejREniinYWmWZ0q7UeVEevph9pmGcnXSrr?=
 =?us-ascii?Q?MWg2b5VKfjmquWdAjNsl9t+wvo3fkMUvGFjyfRSLs4+aY4p1AXBv3oal7ZYC?=
 =?us-ascii?Q?KNEMT3RSfA49jcGnWhxDmRMZWTE/f9dcdOa2TXWx4oq84oXki87s330xIdwK?=
 =?us-ascii?Q?IK6CTjkLbdh/Zr6BqAzH2gJQulZVwdGnGaPBj6T9SYjncP8PV2RZkFGtLFAC?=
 =?us-ascii?Q?1qnaO8TXwlvMP6TrVChDLL01kmKPB6RyR6TFHldU54hCK1ntG7kHWdTURDHn?=
 =?us-ascii?Q?Gdb9ioHXjMKPFjfIOWG2ACq10Vzw8hSKd2b8MnEh17Uo6KnVDuqK4nMOOOit?=
 =?us-ascii?Q?BurSZn9aeAGN9RHXFUe+lZjZ1ZlARhfGGqvKik7F7UGEMVHHYzhcJOsC89ri?=
 =?us-ascii?Q?vPEYLIOqQ/SWu76JlfzRy2VxFreCYR+/uQi+gS6w+2808Q2ABG+Qn4mxGIU2?=
 =?us-ascii?Q?B/OJ5byyWKYbfffCZrw0pKSHfY/SGwlJ4zjHoJ54t0s2SazRO4JelRQeJ7+H?=
 =?us-ascii?Q?SxwauOGzo5yYhEnvm7SZr/iITc/4J2NSbRgx2YUUNIx/MPQzVqZ9cRFjyYl0?=
 =?us-ascii?Q?a3plvTiBrU0dr4MgmZixAiPqdkZ+Qh+ARdqeqzCZDzon9L+p4A+vnpUnc1AX?=
 =?us-ascii?Q?w3wkDwM0fEQ2jVai0czvgg4oglq9lAsSY/Eep3sZsx3d720nvocKT/HeyAoU?=
 =?us-ascii?Q?q9nUhG0/gyIs24kHKsiKNEcpPe1dEW0y2OqjmVPYXztCdD1agpLIwGI+RfxE?=
 =?us-ascii?Q?kxeKIiLkIaeoxSz9MucCHxBRY+a0CPLw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+PvGtmZ0WJ+YqqMKfARJMKyAlTuJDDqLkSb3dyzT9DWinZ+IN93nLYwVJYH?=
 =?us-ascii?Q?CEj5yA2Yr99ibuz7CmBf0iw5WvPmaVudoCSc8K7V//OShr7Wsr98Uehp8+Vb?=
 =?us-ascii?Q?s1SKEQVwbq1p4hf0W7J+b9LTQKcInuoIibwkuqAAeBjJ27xLnEnGmAnwb2Qs?=
 =?us-ascii?Q?S6TxiBi8bsfKwxlWSMx/zzq4dZEfjkJ2cRDvXVzB5wqlk4xoQF/3r0oNHGhF?=
 =?us-ascii?Q?gRzPHuEJRzU4lXgjgujWuKmrYVC1uhL1JxAA8NMxcJKdccOBXsMYchWHgc4U?=
 =?us-ascii?Q?ky7/zPjg4+XmDUacKzMRVhQUQ3y8YjJd7s53h2ya0qlJnGX4VTTipBAFwivq?=
 =?us-ascii?Q?A6pT1s8nNqTugI/IuLlGmbCOb9AkSzzK7A/d39Q8f32oxH77t9/eKumc5FEV?=
 =?us-ascii?Q?FNWsqkWhS+khN8EShlyPg7+tV3P3yFxOOLy67TKZGysi0aFN4eeHWdRUPbMY?=
 =?us-ascii?Q?tvudiP/XaWs/LSjquRnvLmiXGFypQ4WpV7Aadye8Fl2uz77mfCMJS1SJAESN?=
 =?us-ascii?Q?VV2B1q4rSnjdz7FdVLyjnFkB3NpPuYnCf8BvpdT6phAF6eL1x1ePEWU09yAa?=
 =?us-ascii?Q?et1rb4030Z1KSskQ6JfRUcT/d1SWLjw4hJIVARp7urRz7dCU+Olxp5aoUHgp?=
 =?us-ascii?Q?81PwNs6e7OyGSCEEBiGHskGtAh5Xy+SrtYdjNtxgks1PUMFyTgO3VpUye+u1?=
 =?us-ascii?Q?nudNf2pi5J2BQFq4GasPodQoZ/5vfbOC1miuvAv8H77De9xXTr0wXt6XGgwg?=
 =?us-ascii?Q?Ku4afB8p8SeCSS+Nu3I5WuwpkE1wLSfPp8reYb59gcjSnAAcPB+/MJITv6hk?=
 =?us-ascii?Q?+AL9uk+dJ8igKLi2mhra8WU6PhWm/WitP07U4SaC28c1G7xQD4eAhI5Cqre+?=
 =?us-ascii?Q?LdkhFX49M04iDUdc2pIA3hDiNY4GStcSxjRo+VZFPEpwPyMVxz4bQG1Mc2ZU?=
 =?us-ascii?Q?v0qEgSPHqdLuNcQXx3M7yWtN6GEyEOl7GTom/lPu0glrQExVfrWCy1c+m8St?=
 =?us-ascii?Q?VUS8ctufKswKuGdwp9BMoDgMr2qz/EJuE87cRqjBwqSTUBQQG2MxPMnGvFiw?=
 =?us-ascii?Q?xDf5ILpNkR8haYMdw1BPiYRjTufLulmRH6DjY1/3ulfwcqVkCmVLIosVEHaW?=
 =?us-ascii?Q?i65k+kBmhvnV0l422k4TWGIHUX/p+FuKOVR+ruBvcqbomtCPTAfdEN2deSiZ?=
 =?us-ascii?Q?c9lbrLKSBlXh2ksuQPOVwdFjGofZA4Jt8JFkLHuvZbHkeQZplyr/bp5D8zkZ?=
 =?us-ascii?Q?DpTzQoX5sEJqsDMVmxeS5YGE0vUwX2y4pq0+cOdVLhSMxT1jbraWjSov95cn?=
 =?us-ascii?Q?eW+EG5igom7zgfkaISy/SO4W0US8x6XVLNhR0OZCpe3ExW8nk5+M1PPiYOB4?=
 =?us-ascii?Q?mwrro9OjauWMiCsfyYkbDkbjhfTCRhmTO+qFnr4fBKoSjdMOv3iNhh36a7qt?=
 =?us-ascii?Q?RXAzYl3OR6+EELrkxx83qIapm7RQzC2a1rsz9V2LfoQJlO4fb9VoED/lGCVQ?=
 =?us-ascii?Q?Az76A/ZcLJOkOAM4xzBmoK55eFP9asqR8Nb2yIDr1/vnR/5r78/U8xuLBGbR?=
 =?us-ascii?Q?LKvaTzXAMHszRML9kO39A0g/x0OepB69nSL2KjbzkB0tWoHCo5Yx00vZKJqd?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a44a0ab-b904-4f40-04b0-08de1d38aec9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:30:42.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfQoewSCiqxdPqMw3gpx0CN2zIzy8KAB0lw+C2aPts4JslV1KnwXLvOWd5MFM2ZMfAg5AeOM3xxnk2+x/rbPzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
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

On Thu, Oct 30, 2025 at 06:32:54PM -0700, Jakub Kicinski wrote:
> On Mon, 29 Sep 2025 17:44:13 -0400 Rodrigo Vivi wrote:
> > Introduces the DRM RAS infrastructure over generic netlink.
> 
> Can't comment on the merits but in terms of netlink..
> 
> > +    ./tools/net/ynl/pyynl/cli.py --spec Documentation/netlink/specs/drm_ras.yaml --dump list-nodes
> 
> We recommend using the "installed" syntax in examples, so:
> 
> 	ynl --family drm_ras
> 
> instead of:
> 
> 	./tools/net/ynl/pyynl/cli.py --spec
> 	Documentation/netlink/specs/drm_ras.yaml 

That's really neat. Thank you

$ sudo ynl --family drm_ras --dump list-nodes
[{'device-name': '00:02.0',
  'node-id': 0,
  'node-name': 'non-fatal',
  'node-type': 'error-counter'},
 {'device-name': '00:02.0',
  'node-id': 1,
  'node-name': 'correctable',
  'node-type': 'error-counter'}]

> 
> If you're using Fedora or another good distro ynl CLI is packaged (for
> Fedora in kernel-tools). The in-tree syntax is a bit verbose.

I didn't know this tool was getting package with the kernel-tools
I thought it was only helping for debug during the development.

Now I'm even wondering if we really need to code a user-space tool
for this drm-ras, or simply recommending the kernel-tools/ynl as
the official consumer of this API.

> 
> > +	xa_for_each(&drm_ras_xa, id, node) {
> > +		if (id < ctx->restart)
> > +			continue;
> 
> IIRC xa_for_each_start can make this simpler?

indeed. I will attempt that on the next revision.

> 
> > +		hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
> > +				  cb->nlh->nlmsg_seq,
> > +				  &drm_ras_nl_family, NLM_F_MULTI,
> > +				  DRM_RAS_CMD_LIST_NODES);
> 
> genlmsg_iput()
> genl_info_dump(cb) to get info

I was taking a look to other examples that was using the genl
but I will try this on the next round. Thanks.

> 
> > +		if (!hdr) {
> > +			ret = -EMSGSIZE;
> > +			break;
> > +		}
> > +
> > +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
> > +		if (ret) {
> > +			genlmsg_cancel(skb, hdr);
> > +			break;
> > +		}
> > +
> > +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> > +				     node->device_name);
> > +		if (ret) {
> > +			genlmsg_cancel(skb, hdr);
> > +			break;
> > +		}
> > +
> > +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> > +				     node->node_name);
> > +		if (ret) {
> > +			genlmsg_cancel(skb, hdr);
> > +			break;
> > +		}
> > +
> > +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> > +				  node->type);
> > +		if (ret) {
> > +			genlmsg_cancel(skb, hdr);
> > +			break;
> > +		}
> > +
> > +		genlmsg_end(skb, hdr);
> > +	}
> > +
> > +	if (ret == -EMSGSIZE) {
> > +		ctx->restart = id;
> > +		return skb->len;
> > +	}
> > +
> > +	return ret;
> 
> Separate handling of -EMSGSIZE and returning skb->len is not necessary
> as of a few releases ago. Just return ret; core will do the right thing
> if ret == -EMSGSIZE and skb->len != 0

Any good modern example that I could get the right inspiration from?

> 
> 
> > +static int doit_reply_value(struct genl_info *info, u32 node_id,
> > +			    u32 error_id)
> > +{
> > +	struct sk_buff *msg;
> > +	struct nlattr *hdr;
> > +	const char *error_name;
> > +	u32 value;
> > +	int ret;
> > +
> > +	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
> > +	if (!msg)
> > +		return -ENOMEM;
> > +	hdr = genlmsg_put_reply(msg, info, &drm_ras_nl_family, 0,
> > +				DRM_RAS_CMD_QUERY_ERROR_COUNTER);
> > +	if (!hdr) {
> > +		nlmsg_free(msg);
> > +		return -EMSGSIZE;
> > +	}
> > +
> > +	ret = get_node_error_counter(node_id, error_id,
> > +				     &error_name, &value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = msg_reply_value(msg, error_id, error_name, value);
> > +	if (ret)
> > +		return ret;
> 
> Leaking message on errors?

good catch! will fix

Thanks a lot,
Rodrigo.

> 
> > +	genlmsg_end(msg, hdr);
> > +
> > +	return genlmsg_reply(msg, info);
> > +}
> 
