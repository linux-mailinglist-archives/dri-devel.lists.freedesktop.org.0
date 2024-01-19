Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57AC832D7E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C24310EA41;
	Fri, 19 Jan 2024 16:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ED910EA40;
 Fri, 19 Jan 2024 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705682750; x=1737218750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OfWdNMOFw1yV8+c7+uTD9yoMkmIJzLEu7c6mBAJ0RjU=;
 b=W4osxFZgO0hPUWgBQQ3IOp8F6D5fmPJwjENLqMcq74n9s8y5fnqbJz9a
 oFjR+QakaCm/IFx9PkOGIdIJBfQ7vt66IvzZAXcN0TmY1E5EzBMFs0Nqy
 e4ltQ6JbiShHJEo1NgWNFs9rosfNqvkTmL3Wp5EnAwdcylIxsdAL7lD9D
 L7Mi34ZLRRLt1gprY+YpM7xXRpx6s4eymad4KNob+yPNMfaIGUYhu7HY0
 Pg9nuoZWVYPmb5zryxoCdPENYzAS1m3UOsuEVAAaCOaRs5wFCRK3lZTtm
 eTI9GuHJMmyTLYfLqG8sGgIQEvLVuQv4Ff41K+UMIeEUNHnQYkizNgkO6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="486936393"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="486936393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="904193335"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="904193335"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 08:45:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 08:45:48 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 08:45:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 08:45:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 08:45:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1FfVYaifvY3N75VbOG+CaXy4XSZIW2pYTF6KXnp9wjgw+r7w7PW/SeQ2OZBGssjUjAbCCJ3ioGCofPpSoNkw/wdcCTCcGl82TTmjLTMBjokl4aiHMoZ8j+tI7Gt50qPgGACvAkdjcjE7sPkPTKr5hHtpgSiAddoo4Vy94TCoG2kxDEJ+KFuWi1dEKIqMlYlH6vYBJu/e0J7ZiUC9gV7IvkAh8/YFHWACm9MMPMwS8HfHRcYTSAAZQaqv8H63Lsijp+jcJhLZsqcMszSBg7zFwm3Q854AVXupuj9bKheoAIVZYhKuCVU+R/RvNVtDBAmoSsbcTNxN0Z1S5yVmK/X6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcU9PFKXoIuIdnD7k8KJ2KBRU9fiPNBVpMSZ1vAYVOI=;
 b=Ccymg+dhMM6kT3HoJ4oLF87o2ronVki7Bs+KLgjKmBEkDkr+iUdJtrrHS3+nUj0/OaOcm1965CYWj8bvyEYC349jfFHD5Ft8zZ+8GHvscpACS2CjjD1n4PWn8s+DMh1jRQd+76t5yUeFQBQyoQGHoekjNyk9qsmBRXT8vlIADkgwEJeuaj05PVpNxFR5/6tzQfvK9EbdwU9Urc3bKgj0vFtZtR6KtFbEAPFqq7FsaBpfMMtoIcszTt6VPBGMC1tGPPXmfl+UrCB8vGhiiuILCXhtcRgkHNOfKqZog5Hl9AHxom92IbqA+jPuug258WLrEHWHDLItVkdBwrC3uwzr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 16:45:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Fri, 19 Jan 2024
 16:45:46 +0000
Date: Fri, 19 Jan 2024 11:45:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/doc/rfc: Removing missing reference to xe.rst
Message-ID: <ZaqnMb-5qUUlM92y@intel.com>
References: <20240116220331.145607-1-rodrigo.vivi@intel.com>
 <ZaqidHi4EGImQgoF@intel.com>
 <c06e6e4c-ac73-490f-a607-27ae2e014c6b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c06e6e4c-ac73-490f-a607-27ae2e014c6b@intel.com>
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: fb41faa1-6a77-48cd-44f3-08dc190e156d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEiXqXSMjMxtVE2ZkFQ+fnCclcsgV/5YTNZ10H0RJX2bDDWdPXyNTHEya088AHCUG3ezyRhvwHLY8xAlnflcdp38j3opJoSx6JPatzC3aXKFjnKIU+05ifeNnuKubUzSt75gn5gMGnK+X3vp9d2J0vXUkBr62MNCmgQiP5KHpDlx5OtxCx2P0yWlDi2ZCIw5I7abwr7Stlv7zecmcPOMFlJAdvV1w/LhwjKnOnWlHJKmecrR9DdgM1//QNYTKL3/SsnlQpUBwXK5mrynh229ocMC1yelG/+N8y4Xi/opVZIZcUj3STOAk30bzZ5lKW9QpZyBGWu84ac1AA98t0/+uOQ9Jryf2axP1CRQDAAS9KpP55zEoRAzAN2CkOfzb+saXY3SxAbVaaT0EGIAAQ1SYLeiAjWv8kISKmY+7QqpoEEV+slZu8LFiAVsePdi1ANOAtihZ36UuViLltRA7jzsMfZZ6IR7e6PQMa7I69uFd+iZMPtRXCBz3Amezu4WraHsalv8SvgfmwlE+WgtQOskdnqZoD6X/FrFJ178ZRwmCg0TA8wHtf8Qh+OSifycCyBxqaUGHiPNNkc+AsqJdwNNXSuPv4iMPOrzCw1TQWmcUwJNF+p19+nEk300QcrU1xd3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(36756003)(86362001)(38100700002)(82960400001)(83380400001)(478600001)(6636002)(6506007)(6666004)(450100002)(4326008)(8936002)(8676002)(6862004)(6486002)(316002)(37006003)(66556008)(66476007)(66946007)(26005)(5660300002)(4744005)(2906002)(6512007)(53546011)(2616005)(107886003)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3nmb2rpcdbMzZF5Q2+CK8c6gVCgykmF4Xnsk5n6cdAVaE8B5MTiDCq3vniG?=
 =?us-ascii?Q?UJZsD1yDbfaadX2L9f7QhSpayZV477X3wIyenDjEG4P9HcYVQy6JiUkvyvAp?=
 =?us-ascii?Q?Lalxxio6I3AIQYq3l79I75zM8vbQTj4iHPEsaUd5QQ3nTQa9GbaKM5JZXQp0?=
 =?us-ascii?Q?ruJglgjQ8PkXkZsAZ/A6ZvdGbbqj5c967fpQXyCH9G7KNTt8PL8oKOSKavXX?=
 =?us-ascii?Q?yZwhnNnKzvOnhPOJ4EfV8ioFoTAhluduzSK7dHbqRJitWSZ0weWydU6+d42P?=
 =?us-ascii?Q?Lg8SdQIhGkW1xdQE5/u1C6Gmfa118jEMclIZeJ74f1zILY8B/WxDKGqQLa/p?=
 =?us-ascii?Q?+QYQ28Ks7jBWNjCy2eQQRctNtOxVtZdjgFKzS1YDzGlDoSJdGCJXciccTIUB?=
 =?us-ascii?Q?OPuxPQt+oBrs8j0LnZjNhh2/xP/n7Kfxg3YUZuMP1ZzwU6ib0LBacPwkrtwW?=
 =?us-ascii?Q?lHRnIyF+QlKReEafG6eRdpv0i9ruazpdF7WhMHioqt7HJdb4HfUyZrvN97am?=
 =?us-ascii?Q?CffHHUXySMvOjpq+F09q6uqcM5pA15+S32cYK+McKxszEtZDC37OR4RpXD4m?=
 =?us-ascii?Q?jpYJ/38LKi+sHUnqcSnK7+vc70+9ukEKy9vw9f6+J3KKTtisfz1EZPLuhT5h?=
 =?us-ascii?Q?HeOCit8vBJHEW6ZGaW+Dp20m9HAgLn9T0qFm1CtllfBPD9PwjHS81IXwCkNT?=
 =?us-ascii?Q?lDDzqu4ODRu8CKjWCmB2BuirPiZtucthWlenQsLW88Dz5ucrDXR06ppo9jae?=
 =?us-ascii?Q?5Yft+D4ubgmtwheejlWzswbBf0EjmODQ8hhns9Fv+BdjkmIeMjWJfqCc++Fx?=
 =?us-ascii?Q?iFvLSiY8mifb7toOgQdh4+6J/nZ3RQ8xqP6KEOJPG/g6bFTAdJo8V7Gm/vxu?=
 =?us-ascii?Q?3zuTwF/PAasNuFg6YrXJ4aXw6lrWVz9JiMhUOLq2fUUtoTgc/Nzq9+abjbB8?=
 =?us-ascii?Q?7IAINPs5csU0ePCkiLD4PezNhCavotGk9W1W/OMw6hMlmTiQd0Qeb9ol9Knu?=
 =?us-ascii?Q?dkE6K4lCG48ZgAVwt1fCBTR88Y81NcNKKWBREUMdvPra1eDQ+HfNb0qsibiT?=
 =?us-ascii?Q?WYyfglBqo0enQtBzxVYcA5+JYOG983/7Y9udgiqssPE7O5z6wD3gJ55qlq9G?=
 =?us-ascii?Q?LILU+kXkNPSil3hXDAKpNLEchwubRu7eJ8GcBIgTOmalWgrv8RB7x5DeMBnZ?=
 =?us-ascii?Q?U1cojP6IPfK/yy5H/J6qicbi86dEKRpQIJw67MyISfBqqklCgVwsYE0Hm2Q7?=
 =?us-ascii?Q?wydENmuni6te12gKnWdONkyHnj3WBkIKgTeCqdQ3TA+P6t2RNpgfxxQA0yDp?=
 =?us-ascii?Q?e4g7mC/rUMo38lKivg8t4Rin3L+czJIwRB+jUGMYouwlbx6VqkRyb5kQTjIM?=
 =?us-ascii?Q?p4twYF+xmVDw2AyHcxiKDJ0NFhUwuLDYI8x363pxG5BFjRVEExXfxRTu7nas?=
 =?us-ascii?Q?qhBwE04ZQu3qiHoX0hoMXmiqKjo/3gBxPzr7JP0t6IO8aRswknrUgtrjpRUp?=
 =?us-ascii?Q?WcH8Wvi5gv4zmOtrLHRgIYULgYW5qOpN1p7g7VkxEwbzR4N+uDsTKSVCGCCK?=
 =?us-ascii?Q?cWiwwFNYdsbL1E7Tr4doRKVFEP9vyBBhnMSgeaSNMLbveqCJP84gyV/Y1znK?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb41faa1-6a77-48cd-44f3-08dc190e156d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 16:45:46.1590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyYPrwloPmEOGmVpYGvYlYRr8UYzWB2gWvLP0BxCerDEVVsxqdFeQiVf/KvxgYxPj8LC4rUiQt9izRqod9oPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 04:29:50PM +0000, Matthew Auld wrote:
> On 19/01/2024 16:25, Rodrigo Vivi wrote:
> > On Tue, Jan 16, 2024 at 05:03:31PM -0500, Rodrigo Vivi wrote:
> > > The file has already been deleted as the tasks were completed.
> > > However the index reference was missed behind.
> > 
> > Gentle ping on this one.
> > I should have mentioned here that this fixes a doc build warning:
> > 
> > Documentation/gpu/rfc/index.rst:35: WARNING: toctree contains reference to nonexisting document 'gpu/rfc/xe'
> > 
> > > 
> > > Fixes: d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thank you for the prompt request.
pushed to drm-misc-next
