Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E366FF531
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AEE10E4F1;
	Thu, 11 May 2023 14:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B92E10E4E5;
 Thu, 11 May 2023 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683816925; x=1715352925;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wtX5EN/J93EYXcQbHP4FVIVWSL+UjMgjrGgDl+Sf9sk=;
 b=Esvy6MD+oAo01OmKMqVttb/xJsVyD0KFJJFEB6O0VcDcNHRJjpk82o7h
 1fEk4S+65AS7W/UU/7MoBarQ78wTGg6RkcjBbtBh46Tdrcy1Cr0NwcGiP
 4aGGIni4G8y2OJ+Kw7qR41gEbway0PPKpPoPAlROD+t+oY9pxcaWcsXVe
 cBo/HYmzbYzuNrwlqrb24QGUcwoF4zss1hnCFW96KeoWNYjsfHFvyUp5A
 E9jlRgz/uFBsRb50lkBBeJyNLl188NxPXETkcrE9ExsLJPrDyvOdw///c
 9D4I8IH9CH4uiHgwUO6fsvW5DaAXaCW5Dcv6ZwHnAFjZnSCK/xvBLEWDe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="436854104"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="436854104"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 07:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650220390"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650220390"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 11 May 2023 07:55:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 07:55:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 07:55:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 07:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd8Hiup7gYYqMkUcqiROpY5BA0VsYJqt345tzERYcBToExpeQFnMDDDpLU/c06vtt8lnR9DiuHz/gg9hxhYfTqe2JapIbBuPmJSUbl++mGrv/r18vgIX0iF5KSBHRGrLzBeG2XxpWGYZgRemLRxkTairvj6rCPNXpmj25LU/rE17GMVgaiVt4uCCG0/6rW0Zup2xDw19XdOiPrrtLNtp/+a7BiBUAF8xgdDNdSsQPn/BntXU4A8W3PPrEdOdlfn9/+pfRfcOkERUNcAeqz+Darj6479HLrU7lfjlz1/Pa61nZ7bflyG4oY7D3kM7tyIPElxEMss+Cvbxup2GhGRMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahUnNmLAdwgh3sWvb1kAXfjh7VZC9M8HpYDOBEDOE8M=;
 b=Q+aKsAm2HTbXEyLDO/7y3jvEVjRp4FXFGMolOF7i1/EoHE7NDiTz8YaMJ6bpkhWLHGlm0146dlPK8c/cX5dEAMwYIzQzGX7NUqRCvkbmwUBfDbKYVjLYtzgiNFgFZ4HhecUyo9ewnZo1QQsvnTb1XIWzy+wcKeZjPcqUXSSNBMF3muh3Au3NWr1T+SYbG62Z8HsIaRE3o3M6kQUJlInYA3ogsc8VcS3cLBuLo8qiRJ0l0w9vVsCLy7KLB0Y/fsaHAunm9T5k+O99LZguogrV26LMZgMkzueiZ/dVnX26LVO4821LowS2jrz19+PT7Wl4+U9J1ulcEIitIeKoqipqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Thu, 11 May
 2023 14:55:08 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::f76e:7b88:5465:5f5f]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::f76e:7b88:5465:5f5f%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:55:07 +0000
Date: Thu, 11 May 2023 14:54:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Properly remove the vma from the
 vm::notifer::rebind_list when destroyed
Message-ID: <ZF0BoLJBupaVg+t4@DUT025-TGLU.fm.intel.com>
References: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
 <20230510141932.413348-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230510141932.413348-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW3PR11MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e06d3a-bb02-4d06-bde0-08db522fb5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVG3iCCKEmnCwAjRa3i9X1lmGrLMgYGmuqYdF5eaEruuA/vnWlCfb3OWeE/8rJjsOvSXrn9ufqH2pxEsW74WFYdHkZg2thJjefRlP8m/MM86ibh3PneYNPDI+P6nYjfKpECMBB6oBPUmKyx/ATPckehYQTD3NvCVJrSyAcXRwESRIi2HN39fiM/L/+iwim5RUG0b+Lhlr0qe9IKkoPqyAM/PiQ7lbKiIYZWQ+8bs/+Ql0XFOffJhS0N4AIVU1EkGV44Z4x6InXhDCmPbstGKasurKfT5pULiA4AON3Ni1yd5AKeczZgvIZS6Pm5hneQDBZB/TsN1yBIPBXiqWUoqt6cULNfvWJIxi9jVxfYj7pUP2DFxLOe+4ENUrsduOTZ0IVuR/wMaZo19rL34ETrkhaGN4RtGSYozy98NQMBbFz/s8ajM4XmxS/qAG+tVxKH5bXMu5zEWcL83WY+VCWoHQNCVzbymYk3diP9EJlcpM+47tqSKu8R8m0W/V0rctR2n/Y9w813v55vx9Jy5Q/3x0x5m8lbG7GesXAkE9xyzFYH15gft2lLBYBAACxxOxkhsyQKvPYjl+CbrHWqoYGAv2GRR8S2p1Eey0wkaFHe4Fo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199021)(86362001)(38100700002)(82960400001)(66899021)(6486002)(8676002)(8936002)(478600001)(5660300002)(44832011)(26005)(66574015)(83380400001)(316002)(186003)(6666004)(2906002)(6512007)(41300700001)(66946007)(6916009)(66556008)(66476007)(4326008)(6506007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Mw3VDWuvrK1oivXMlNM+2MNZEAAz8leV8VVz3+oadgiBqWJsnFVLiEkzT8?=
 =?iso-8859-1?Q?tZBgjBaj1Y9r7LNUlFwCKcDVx5EzxZsfqh7J549kXTtgqhXuDP8BNPzvlB?=
 =?iso-8859-1?Q?ShtXfmQ8eDQmMR/NLcg3yvi4NOe/2uLFOk6zVK/ib7HJ66dGw6qKlEL5Gz?=
 =?iso-8859-1?Q?yQz4NedmPwO845GDRE8Le/YczcMEAwTwqy7qitP90azJNyJeGknIWZqJyr?=
 =?iso-8859-1?Q?FHPpq2PTuQGMwE5SgNtCtnVurrw7661LmHBKPD+FUiOJzK0t+VRAsjjgTK?=
 =?iso-8859-1?Q?fraBnxL8enHTylsGvTfdBKdx9I3DGhrYdoJ6CVHMtFzjc04Be/dGyG5ukL?=
 =?iso-8859-1?Q?p1bHw1gWnchJoX3QtRcbdWMS2fAJw3xYlumfEgRElLH7GVAUJi7NkG7QXL?=
 =?iso-8859-1?Q?lYvN4Gl8Wr5APxJcABHk9nxL3vkYPb5VgpYdqMP+vYD+JFB0QgrZ9j6XTA?=
 =?iso-8859-1?Q?GcqPbLFwL6u/sOnnpqH066zzcxYSBPsfQ9OqAHuhmFrR3qAn7O3opmCrOt?=
 =?iso-8859-1?Q?8wyvXCMX+Mf/I9muT8tHU/CHfBYMyPV2tixbLYrQ074B8LTgAtPUqaNmOM?=
 =?iso-8859-1?Q?B3X3ncGCi0lBDyKy5TOBklkwQoaQnGx3JBIDvrQze1ML6cmb42/vfoJpI5?=
 =?iso-8859-1?Q?oGCgJ+Z98KIZm6GK1djFFY/NEErCkgVu640gMQgAFC0xsBHWDDypCG/Pk+?=
 =?iso-8859-1?Q?joesH7/p4VpttuX48x8rxkNKhFpfZOX2K1naZnclHZ+N+2SLJLDh76varq?=
 =?iso-8859-1?Q?VglLuTz+GDmo4nZcgNQ6uD6uw/+J8ZJFpKbHqv6sdaKMqJkOtTuOJd+ful?=
 =?iso-8859-1?Q?sUky93TOehhczF6p1OyX1Hd2LYi3HS4sfpNIL0oorSNP/AYYRYaidtVyZ6?=
 =?iso-8859-1?Q?LXdtmbVkID8ZcACw870JKvaJzHOEt9MxcSrYj7V2UqxjQzD/A/oqcDkis4?=
 =?iso-8859-1?Q?rhG81UNv1ObqtyyFtoMHZsdVxiisNA7RyyvZ6tnfFLxl4DqtECMlu3UFsE?=
 =?iso-8859-1?Q?1VfPui4S7ZGZ/K94qtc8qNSwr5QISv1GivDTAzpBiyWqbz4vRaeAn0b/vQ?=
 =?iso-8859-1?Q?dvp3b852yShELdudkArNVXi5Y2rZmlF6pYbm7gjNrFMyszG79NP6FLMkbv?=
 =?iso-8859-1?Q?FFdP0b67niK5v4bVjw0v1W+Z9+llvP4vioNkL/iTMgkxrmW8KiEYHM+496?=
 =?iso-8859-1?Q?RVxtbexV8Xmjm/mQcX0QNgzdrjJOggqQ890PhQKZs7elGahqHCPoeOT//Y?=
 =?iso-8859-1?Q?pBnIeVDE9YTORdNZH+2HFFubkvlK6Rlc+IDX1X8s87YAahrtmJ+5/PZYuV?=
 =?iso-8859-1?Q?JBS9lNHVHFKkZ7/i17ddUEq794Tan8IHmeJH3ThSUYEZN2rbh3T5/qkEPp?=
 =?iso-8859-1?Q?V8dnHyxImqbdzG51e9l/sPqMRquxowtI3LUcTgv1n/MfmENy/6YQvYqNbt?=
 =?iso-8859-1?Q?bE7oJkjoeztZaWJ/kOH+STdVp3Da+gafgshLuVXxF0O5OsaQenQ6NpKmNf?=
 =?iso-8859-1?Q?W4QLm4oAeoQt506/VdYdKwJBf55In9vN1MaBAiCdtf5QSqpkvswSi8KFuR?=
 =?iso-8859-1?Q?3Vs9QQEuU/E2jUrsmBuiNby1AviyZIraP2fIWfOBzHZtviKI30CrOq127a?=
 =?iso-8859-1?Q?RWj/BBJ0me9qqgYln3fp0K9PtXteryb91N5VIggDKqB3oYPwPVNkSvgw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e06d3a-bb02-4d06-bde0-08db522fb5b9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:55:07.0835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoTm/d1pC5Sws9Q1RrwrWMDs9LCCZ7jMyGiLNtRIVb4WjVscjmCD0brU7+3ZBYr/lOkqAh5f29YFpbphUUeP8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 04:19:32PM +0200, Thomas Hellström wrote:
> If a vma was destroyed with the bo evicted, it might happen that we forget
> to remove it from the notifer::rebind_list. Fix to make sure that really
> happens.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5f93d78c2e58..f54b3b7566c9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -978,6 +978,15 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	} else {
>  		xe_bo_assert_held(vma->bo);
>  		list_del(&vma->bo_link);
> +		/*
> +		 * TODO: We can do an advisory check for list link empty here,
> +		 * if this lock becomes too costly. Nobody can re-add to the
> +		 * bo to the vm::notifier::rebind_list at this point since we
> +		 * have the bo lock.
> +		 */

IMO grab isn't a big deal, not sure this is worth such a lengthly comment.

> +		 spin_lock(&vm->notifier.list_lock);
> +		 list_del(&vma->notifier.rebind_link);

Can you safe call list_del on an empty list? I thought that call blows
up hence we have a bunch of if (!list_empty()) checks before calling
list_del all over the driver.

Matt

> +		 spin_unlock(&vm->notifier.list_lock);
>  		if (!vma->bo->vm)
>  			vm_remove_extobj(vma);
>  	}
> -- 
> 2.39.2
> 
