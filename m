Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76A832D1A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDBA10E18D;
	Fri, 19 Jan 2024 16:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444F610E0EA;
 Fri, 19 Jan 2024 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705681534; x=1737217534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BU5k09tEvQnmR6Le2hLERsA3b/Dnoxfb8rrg8PJilko=;
 b=iQsI/xqJB1rcF97Stsgwmfo4PsBKz+wQ/22mdNwlYoh4/rJwV8O0HabT
 BAAzPutROJGAZuBlo0W4UFU6Ww84AOY8bFJyPNfDXjvuvPKZ/RZajBwsl
 RPMYUWyhI4D7+0ne/nfWWPOCToV8SGFXAfqBqg65TnffNqnjjy3z7GHE4
 CVfdv17Af8fwtdLJrMT5GpiIM+PQLgxDVK8Ydzif8oCROTRTELLkgnhaL
 H8+r9I/zbthcXLlEwtMvIpm06lZTNFyI6eXOhlEdULgOmAAjZ/UjugREj
 O9MIJQuxoRx80L3JYRDXgTN+TGR14eY5fiUH2QhKL9a6QdD7RQdP0YuDz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14303302"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14303302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="707660"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 08:25:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 08:25:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 08:25:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 08:25:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8aSO1PgrpYwcdTuVwPWwHX/lIpNn6+PrVAEAuWIREXgIZpAoNe6H4bfTOu5jjCTaYqsq/0RwQ2P1mFh+gh5uWogFURBPLcdr58Rd4GYS1nbxmdtDFh1+PD8h6N/4RH2jjCKpAuLipA4UykPIuSiWxb3vvkn9/sfwzr7sXfOBPVmOk7kE2j21X/DUg5yilxyuBYrUtInbdrUbrL5ewZ0vR6nHYhrsB5QBx+lxUU5E59b2I4VOEkvJJ3H9fWTFHMaOIf4UG6ubULMl/C5t/w8eYD5DL0h9J8exdrxbmnPV8JvVLvEQ0IUHPQoeNmLnCyZACknmXPKE0LulSfTgXi9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jwocl/0u7eK/lZrulSNbQxKXmWy/MT92X08TuPHwrE=;
 b=iZHc3Hlbqhi3ygcG1kpU0CM7+TjQGmm3JeEkth53BAopv0FvPk8tC6pfwX0nh1sNAJ4CuS7Kgjal/aXi8/ZnlOROCh3t8HdUtNYL8IN9kfJSbpt5ZFHCaNvpqpk6irlwR6VL/24cKLCG6Kuk/FOJk8EYv6BZAnbHI3GdRF3+6ZKnszf+8ibVZXaGEiUeHWEw83djLDwdukAajKzlNDV/DIKT0CdmqM/AhY6/YBs+umGTZizlW9gFb/ZCy0rswsIwgyzgID+iU1WM0Fmb/VryHj5JCPtl4MUT0eEqciTLCMs3pyiT6DDU4A7I00ulakdonKuh0qhUziZnUVG57Fcy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 16:25:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Fri, 19 Jan 2024
 16:25:28 +0000
Date: Fri, 19 Jan 2024 11:25:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/doc/rfc: Removing missing reference to xe.rst
Message-ID: <ZaqidHi4EGImQgoF@intel.com>
References: <20240116220331.145607-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116220331.145607-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: ca88cfe1-a9ee-4595-5961-08dc190b3f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGendjCfokBDfzgbD+W4Ktid+6VsqGEA5HZrCM6Srid3pym8+73bvD/WrXdsfEiR4wR02DwEUjrerB9dxxPnT1XjcsU2IL54negO9e0kfHowY+eOoDPIPEKAUdcjrfZCdx6amAzpQ0BTqYlcx/bkFIxqaoZllxEQ+f7fSdlJYvm1F8WsLVi/Ua/Y9qRSRzgrpK0h/MNj/Bpl7VBiTN8zhfQ857ecFA6t4P1DkenruK5SswW8aCUcMZNP1qE9rQoKdR1bcLAi6323fPcpT1FLaqObQlKna66avUDiqZZuAGHnOsipA7/vaRVRu7fjAb9YGQ6AhcnYangHIe5h6Jj2+e6gSDNk4TjvE9VwS43WmnBU3xYZkN+p7Hfxs0vJ22GbMOeRVKh8gwHMv3OpEFsWuUl8eMnTgP2EcqbnSyGw3Y+5HSvymEa6jBgQbyRvg2cxiWolejFSEi4F+T84x4PcWHeWVZhYnf/YWOtihfGX7SOxpI+rm1Y4X4lbmI6MVShb9L/oCgh4+FVXnvpSuBjwShKAVa20a8UM9yw7qt8dLNvlFHS5iEVRQuRAHLRsy6KXZXdnT9A5wZr93lR2/LXCKju3mteboDgewwfprT6yZMhAYKYTx64vGo8yaHR2OKJV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(1800799012)(64100799003)(26005)(107886003)(2616005)(6666004)(6512007)(6506007)(83380400001)(5660300002)(2906002)(4744005)(44832011)(41300700001)(8936002)(6486002)(66946007)(8676002)(66476007)(66556008)(4326008)(316002)(450100002)(478600001)(36756003)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SG7pkyz5zSEoV5SwGEuR62pxWa+SzCuqvBTNes0+igxLjXpY0JUgelbLN17L?=
 =?us-ascii?Q?CJwfGYHz/cDYxCDFDsx5HXqxL3lRKc9voF3WvgYoNfnJ8HIaIGhC64NHcmra?=
 =?us-ascii?Q?efb8Cx4U5+rqebQYN0QZmUS4fcmU02Y7FUbz+6X1E1GT8zR/ziJJusNF57/E?=
 =?us-ascii?Q?Ywj7iQxGN2hczIGD5NbYhe7hoHDxrDs7K/gbZ27U8a906CZ8cLzp5IgJ3eZ+?=
 =?us-ascii?Q?1Z7fPULDHH/z6TFT+lPa2lFA+9j3ojShDbSWPvzev0p4FC4yh5zSaTcEALNM?=
 =?us-ascii?Q?iPMKbSFzjlrcfU5yBYZDLr6SGpqHKE4PD/8tKkX96GGjE+Q7EpZSu/qiEIRe?=
 =?us-ascii?Q?Y2lKuCxKXIaQYFuHJf8e7Lk3ZvZOoz/5T92uFdlyyOKIfsbesi3B88WOLcI2?=
 =?us-ascii?Q?Nr6BDQLhr5DLXfuL+tBNImBbNLAO6XNDXr9z00oEiVWszH3zLSfo5NtTWjsi?=
 =?us-ascii?Q?Qy8GPEnP4EJXOD+AhQim8ESTY/edNNDn4qgEd0h9g/sSQWe32jGe9wN6IdKb?=
 =?us-ascii?Q?dSAGJEh9JZxdUMuuMYuHP9KM4vx6TIllk9odT6T4kC9yg58HIC58U/jAD4Rr?=
 =?us-ascii?Q?TT2O2Zcxbkfk5Kt2dU9DgcE7h+RU166xiLdkh6bQhlTjo1gZKL/wk0pK1Fv6?=
 =?us-ascii?Q?y4OZ7FSwUiTupbJsT5DS0Fqub+VZXqlFqWzuyhjp9DdPHSOurHHxmRGB67ZZ?=
 =?us-ascii?Q?5AwyoGO7KyqGalal/Y+EAidElgi/25iKN1tk02eI3sY3d7334nU24ZtIoC7L?=
 =?us-ascii?Q?SEue92SbwN08JcSCdgodVQG/PtC6ryzOJzCqOTdP0t4xFqi89+4YWVHnhxeu?=
 =?us-ascii?Q?V1vqAzNkQiAuZPGZA/9MrIv+4AOQeK4Iynil3l4+AXhFOeWTFFi4aKkHk6FC?=
 =?us-ascii?Q?ehfX3/aV87kN9u4WS/wyEpgGyqG2Afy45BY6YVDZYWVTJ357eXdCxejwfrd8?=
 =?us-ascii?Q?48EDLNsjo4VKtDzBX3NWstrDdJ2LahQTUqfRhWlUKBaJuERzAeLfZTcUwzHd?=
 =?us-ascii?Q?OJpAv8tYLvbZJ3PjaaO1iGpqX6OxJhbAxK8Cs0Pg+5OpMTs/urDpiLXQYiQm?=
 =?us-ascii?Q?Eif3gr/HrYvPkvQJ6evaEJE/edH2m1aVokH/pHuD2D7h+OlbTFQNavQUDp5n?=
 =?us-ascii?Q?1eNP2s8WTIuw1aiCaJu93esSv2Tpz3hrOrFfop1htLNE7E/b2MUVTt3DUKqa?=
 =?us-ascii?Q?iDdLNH+jCM+aQWnBIH23FL7cf8IGtYOAjabvXZpY+JvmYfZXr7PfRt7yUEu5?=
 =?us-ascii?Q?zv9yQDcL1zTWAJTWgkA3POpEigwC2uB5fADYKJcUqHB10/+FFMbmn0f9FI5P?=
 =?us-ascii?Q?s3ISkBHRZLYRwC0S+cFuj4WFiGso/pccjuqw1bjerEMzFeOHKFmrrIZbc8TY?=
 =?us-ascii?Q?3kD/CN9ubmux01MKuf1yIi/5diidhJM6Hl2U6K8HAWgXv8VPNw7bNPELGr9q?=
 =?us-ascii?Q?J8Kf3dBkBAbMD9XaiyeVThdmSspvCFxMZ/cuOLjnO/icgBBxr99vb8aAs9EV?=
 =?us-ascii?Q?GASW+KmuBbmkSa4hNHiVg/gbkiJX2uHiYwKC/aI5X+7UiaelDgnObOqSOs60?=
 =?us-ascii?Q?bef8wPxQM19ZAtO0Ccqw4FpucIAaaqoLsHdLK/0tfPY64ttAsGfzyVRdDT+M?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca88cfe1-a9ee-4595-5961-08dc190b3f5c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 16:25:28.0197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ppsP9zlV6GTjh9r6F8HNeM4ueEv9fclCEi4CNWgxA6NdH7+hrfYy8mEXI0341AwDbtqUBZvMNP4GzlNs/vZRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 05:03:31PM -0500, Rodrigo Vivi wrote:
> The file has already been deleted as the tasks were completed.
> However the index reference was missed behind.

Gentle ping on this one.
I should have mentioned here that this fixes a doc build warning:

Documentation/gpu/rfc/index.rst:35: WARNING: toctree contains reference to nonexisting document 'gpu/rfc/xe'

> 
> Fixes: d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/rfc/index.rst | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index e4f7b005138d..476719771eef 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -31,7 +31,3 @@ host such documentation:
>  .. toctree::
>  
>      i915_vm_bind.rst
> -
> -.. toctree::
> -
> -   xe.rst
> -- 
> 2.43.0
> 
