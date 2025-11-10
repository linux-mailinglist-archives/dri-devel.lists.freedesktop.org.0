Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30BC4941F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 21:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF7410E384;
	Mon, 10 Nov 2025 20:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leNG0UUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11DA10E384;
 Mon, 10 Nov 2025 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762806937; x=1794342937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wf9fvUwa2mraRFAK88MmKRCNVHxr0j+SiE9wOEa70fY=;
 b=leNG0UUTf8nwLs+ugUXHEBnljaesmCH9KG2vv8EM7gn0YrYqC7aH/XNc
 Q4cuVP5qTS4TzbIosMJ7NzHfTJIYtKZ2x7R7S3gFaGNHWC0l1RVlIxl2K
 R/Wc8xJsrtjEgzVTy2Hd+jFtwQyDGYQZ8xW+HOjinNBJxerJ50qEa0gvA
 jHUiyQDPaAwmrKdk27rt3XUlOyjhEk7JMUhXXxQLob3qU3jxBnr3RVaS4
 53T6hZdyrHEcWlMwRq+zrVcV0j37deOifnAuEWcj+wblECuC/6NsHfL2X
 OaLL+cU6gYek7yaMRxKUxHvno50MQkfu0tCE/fh8WVyMVTVJehgUkOtVm w==;
X-CSE-ConnectionGUID: VQgiCYTdQ5aobR4W4DK6SA==
X-CSE-MsgGUID: fRXaDprjRjSeDDBtegrO6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75475185"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75475185"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 12:35:36 -0800
X-CSE-ConnectionGUID: g0WHGHxKSLupDF5uTfd5fw==
X-CSE-MsgGUID: 5lzs8xPmQhevChvFWtpDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189211033"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 12:35:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 12:35:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 12:35:35 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 12:35:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbGOMAlNJ8ylRWAno6ZxRIH1WauCka+Kj/+U4M454Do8hWDcmWnmW63/CvYjoXau4DB/FIgC1ynSTNzFBHtSxLCnEuwlshoj/lLj2PL72I/EGfu2ubSKj2176M8LWUn2kDWrAVHnvR9nR3eLAIbtUclPzW4El5Zs2ygWSNMGxFCUrCH/7E13ERxYJCB4ngP8Q9bSLjMnVdHulFV405kf/HqnzOuVbDDi48rtyOg4uXddpAQJ2t8pjyRppK/bSN3idDfFyQ4ECe3uI1WhbV3q3opy5nvT2nDw4unIISI86iXMjWS/TviloECiaGy7yE+ZxCtMMtS9YPrYhDxe/nCtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHNPvHPP3cv6OB/FoZG5PWgPwi2gAi0Bj93SD+fJzrs=;
 b=whWfVOW8bpj1EZy7yG7mnx6rSnLehzy71a8h0We5KM7tJ8oaLt1xsATICypbEdRxFNPySsJTe6FM2AkL12R3yO3xQejQMiDp7gsDZQWp76CdeIP0fkXWE4uZbzDQBGVxQOBJZXQ5xPbVpDb25nZv52NNDFBzBHNGFqCVu9H6Kw5XppChLJXZPqTLG8rkq4wBPZQAhk/SNH7GCLbaUs57zcxCLXyghPQM0PZrsJXabSdxyUhVuWlw3q2c3skgf+tE3trC75IAgNPMG2BQR3jnvcL/3XbJp6NI2RkJfJHRAPt4uJBJ47xbAJCY1KLTHKH6FcDOYLoo07BudeAUjrRepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 20:35:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:35:33 +0000
Date: Mon, 10 Nov 2025 15:35:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner
 <lukas@wunner.de>, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, "John
 Hubbard" <jhubbard@nvidia.com>
Subject: Re: DRM_RAS for CPER Error logging?!
Message-ID: <aRJMjyYLo5_rFbzP@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
 <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
 <aQyftlgZN11YYQXy@intel.com>
 <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
X-ClientProxiedBy: BY5PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:180::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 564d0275-5850-494d-fcce-08de2098b20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xny8EHklZUqEv+1FQZmdug5pn4wQKJqaJJaS6vfTjbOBYy8aT3fu7bxwYExB?=
 =?us-ascii?Q?5j59gMYC/SSLcAQmKm8op3ilV8ZrN+YP5z4LE87Z0X5gOJcnbK93V8jTeE84?=
 =?us-ascii?Q?n2kdUoLfRq+ejNNqInxJH5n/qTc3Iy4fAB4U+8zZyf76zGB4sRKjWjP3a0GA?=
 =?us-ascii?Q?sVeRV0foIHk1se+ES04LdJG4p5wOXavm9K9d8ql2BLh4FFAjsfTahrZsS776?=
 =?us-ascii?Q?3UfLO790V/C14pQmOzX7ZFVi88k7aLJj0Ko9zYV7vwx9+x9SVMMuxJOwT2FX?=
 =?us-ascii?Q?81gDhvVfTVBtrgRz9c9HRTKFYbcVcw7dl3BDtojcUjJAl9xNqT4BkK6BcN6H?=
 =?us-ascii?Q?9nLWc5P9Q5NCvf08qcuUmBE5Xbk5BcuMNK0rF8jSVfeJkMevIPH4GOygbTsA?=
 =?us-ascii?Q?RAReOQgfEYYuixbo862AhDcvRldThJWAhK2ZyQHDj3nQPGvq0GjVMxrm6HSA?=
 =?us-ascii?Q?uz3tAU2rnIX9IIblznjn3ugAtsiObN1wyHv6hM4zo5il25Z1wlsz+IBUQ8g+?=
 =?us-ascii?Q?ZGo9YopIDWggXok1r9AfxJHKPcSPY9PVsHH6DMo73SsCIw+B8MktwqHDlS/g?=
 =?us-ascii?Q?qHJKiAMCbmmgi7GrNrn2OTS+PVH7iI/kJSwWhMgFaYrgHc4ujgW2YiY2KhlN?=
 =?us-ascii?Q?7aQqEjtxOQdyvQppCZIpuUARTyPofa4l8CTCmtyGEGC5v0FeCTTQLp9Vtdeg?=
 =?us-ascii?Q?3KyYpOteVs8bg6SiWUAJz4reH5hgmiWYLHbUBWOG3okNRHKQFdwRtS4HkSgK?=
 =?us-ascii?Q?8yxyKK2PSu264Dw0dmhfEfmoyraX36prESEAAWid/V2DoVxZAHOslnPuzAap?=
 =?us-ascii?Q?PCiq5gfaB5121jIChT7q+frj3VKhwN+Lx2L8rU70h0B8skfFk5VbVBLrk7Ag?=
 =?us-ascii?Q?DtKYGhvmEZqY20Gq4UHWZv8ZlZBkcNcL2jRhmwg/WOwgUa8lrUtjY+NZ+aKT?=
 =?us-ascii?Q?s2tuFxhu7D8EU6MWfFvpbxowufZxT5tRc3r6UtHwvn6V29Z/fNAtpAdubqE8?=
 =?us-ascii?Q?U+IdtTC0NYR0axeo0t0fYDEndkrXWRjbBfWoNPX+hnDkTOppaifz8FbBSdux?=
 =?us-ascii?Q?DrXaeKyM7hOc4q/mfUBirtaYFVidmrBiolAAm1tePjqpIKqpEXHLhfSWs5Xi?=
 =?us-ascii?Q?3A/X4Az+8AgAGa/O3f1HKrMTp33HrD32TBaVpDAoabUuRpeDT1sJG1S8HXNa?=
 =?us-ascii?Q?Nu+BdicHk/zMsu5Copb0sFI1UE4839znAEMoCVDl5XC9zKYZlEKypBOB/uO0?=
 =?us-ascii?Q?41qHZFmssOgSH278+37bHyNlYKqusI5hmetjd5g8nzTAWb7pVmag0yAzO+0m?=
 =?us-ascii?Q?QHnjmtMfR4FT9Gu95l+8u9LjCu4mvK4yOPn69ErMUrRJgjlfu8FveK2zM+io?=
 =?us-ascii?Q?dv7UpDDBs4d7iU4jKfrzwcg1rljTIJWdvXRz+2WZbfZLorjfGxuhMaW8+1sU?=
 =?us-ascii?Q?PqscVEDs0eeEJvNk3HAMCFQ0ZK4wx+23?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40VRGbKZUBFtW96CjY0BN+GWNXzlfYcFb/Tp38Mh1ICpxZuk3sx0YAih5KxX?=
 =?us-ascii?Q?GHRcL5gP2+d9YTwmLZI9Xb4fTyOz4qmkkt+5ShCnHC/pLR6WTjM572Th3L63?=
 =?us-ascii?Q?fE1CI5k4MqmjAkhY632ny68EkeFivAPUy6hrwlrzct5gmXk6TNdnVu44dJNa?=
 =?us-ascii?Q?CxQoEwGuBMFddX6WaPmOzGtsN2FYsyXa71CzdCKP7mRrPq6DhgAOIzLabR1S?=
 =?us-ascii?Q?XHVYITbvUUAodxb73IyjZ89WF8Q2rtJ1eL0Eo8grYeHk+iDALtfnw/+GcUkx?=
 =?us-ascii?Q?YG9c24NX76pE9+tFAIhZU+7QEzKocsY1ic2Ra/6tQV9YCupc4FJ3mglJZB64?=
 =?us-ascii?Q?30Vjg973OfF9VM+YjsyIY2/d2GWQtjoT0qLpSM06zEESMhFOjLSbfrHV7AeG?=
 =?us-ascii?Q?TOaslKfqX3LIHf3nRuUIBJAei/gyCpZae0V/ACVT3opv7nQP00kOHveUSJBa?=
 =?us-ascii?Q?mBpdc9qiTrkdIm4SUki1bLlFpTCeH+L5j48D8M12SIQqoCHJTcj//+IuV4fq?=
 =?us-ascii?Q?IFkrf+o3aR7MJWyfB6w/ZclKUiEOMbTGCYqvKyZABy+T04hMpOVxc71WjEeF?=
 =?us-ascii?Q?MfCD+y+hntO4yfru/McGzYKPIonzp5bJK2RL8CYMJrNsBkIYqa1mORxt7Qu2?=
 =?us-ascii?Q?CH7B4p2M9HkuTY49HHE0Co+HCuwkMcFxeXsvkrKttoViiKi8wOpLwdb6EE6V?=
 =?us-ascii?Q?kgQqdp5oCDiO8zxFLn4sHwidTbB5sIZ5iF6ZPQyL4cuyp3+j3DaazffY9wlg?=
 =?us-ascii?Q?IiN60cJWG3vCvGti7t5wnId1xFpHqFbTE+515vFN3bYZSf/othJAODKJtL9C?=
 =?us-ascii?Q?0E5OXG7j8MbP485a9//4+BdqyIf2Jv4Gu2pHrohKkiC+tDs1Trndm0F13G+R?=
 =?us-ascii?Q?0JffQ1RFwHVDyoaxsI/+PWGr4WnuUciGXjgz4xjGKHhDkyK52ohU06DUHiOM?=
 =?us-ascii?Q?HJm7uJ7k/0QYoAkQX7UGJUHZXo1XcA3bF5Qln+KYb04O/dItoFrmg7wKliwu?=
 =?us-ascii?Q?oJbplAqNS7DuRi7Cz5ydwX0b4ZGmULBYpuxtXS0KToVVc/z027Sr/tYkxMzU?=
 =?us-ascii?Q?HdC8gcSAgh7zcmfZ13V01b92zfGLBBTsQiT/a6dXN25AC96hfWUr7MsUxDt3?=
 =?us-ascii?Q?kOoihR28j/axmGNcmdZu0fHFsdl/hfMOG76FRZwD+6cGdBoIMpZxcJ/UZiWc?=
 =?us-ascii?Q?M25HVxYjblEv1XjsApj+4hWfDhjV9nGJmuPYrz9ip/ZEp3HiNQQYrhj4w6LV?=
 =?us-ascii?Q?A/A1MDvgTS/qh3ZOFDr85F/S9xz86xT5jefmaXjyDE2Q5bbKE1jNVHij00UM?=
 =?us-ascii?Q?+Ph7bndBDEKskTQneejDrZY10bdVBBo9uzgOsnezu0VrKPABkCGmkIO0mi+s?=
 =?us-ascii?Q?XuZlX0zI8Gf/6qsrhHvRP0wvzs+V3hfh/kutdQeiw0FPP6w0LxxGcq66/+0h?=
 =?us-ascii?Q?Ns3r6jeZsRzZtMoB5iym5W4r+fqjX9VqZEm8G6QaF/brKx6Dduxp8Virc58q?=
 =?us-ascii?Q?AoowaG0ZoYAg7IC9cfFsHy8jBAFHEt+snbHwgbbX1fLBgrcAINmrVBQKQfhG?=
 =?us-ascii?Q?XFqonUh60IY0KUY6VezgNYfLc/WJLTliqfGweuqx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 564d0275-5850-494d-fcce-08de2098b20c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:35:32.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1SAiozrUKOnOZ8FK7tMoX3eiUvQ1imEqPPmH0mA6W/zYbagsXPTFPLw3m2fpWg5dqjnt7fPMFcKcF/aog7N+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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

On Mon, Nov 10, 2025 at 01:34:22PM +1000, Dave Airlie wrote:
> On Thu, 6 Nov 2025 at 23:16, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > On Wed, Oct 29, 2025 at 02:00:38AM +0000, Zhang, Hawking wrote:
> > >    [AMD Official Use Only - AMD Internal Distribution Only]
> > >    + [1]@Zhou1, Tao and [2]@Liu, Xiang(Dean) for the awareness.
> > >
> > >    RE - AMD folks, would you consider this to replace the current debugfs you
> > >    have?
> > >
> > >    [Hawking]:
> > >
> > >    Replacing the debugfs is not the primary concern.
> >
> > My initial plan was to go with debugfs like you are doing, but
> > I keep hearing complains that debugfs is not global and we need
> > to take into account some cases where debugfs is not available
> > in production images.
> >
> > > The main concern is
> > >    whether drm_ras can effectively support the necessary RAS information for
> > >    all device vendors, as this largely depends on the design of the hardware
> > >    and firmware.
> >
> > I fully agree. This is the main reason I'm doing my best to make the drm-ras
> > the most generic and expansible as possible.
> >
> > node registration with different node types, and names.
> >
> > I imagined something like:
> >
> > [{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
> >
> > based on the format that the current non-standard-cper tracefs uses, with
> > the FRU + CPER. But we could avoid the FRU and make the FRU as node name.
> >
> > >
> > >    AMD is currently evaluating the proposed interface for error logging.
> >
> > The design of the details and the implementation is pretty much open for discussion
> > at this point.
> >
> > What I'm really looking forward is:
> >
> > to know if the path is acceptable overall
> > even if different drivers are opting for different node types?
> >
> > Is there any blocker on using this drm-ras/netlink for the CPER?
> 
> sorry for delay on this, I just had to read what CPER was :-)
> 
> I'm not offended by the idea of using tracefs here,

Right, that was my first thought as well.
Perhaps we simply use the

log_non_standard_event(sec_type, fru_id, fru_text, sec_sev, cper_data, cper_length)

provided directly by dirvers/ras/ras.c

But one limitation with that is that it is from HW/FW -> Kernel -> User Space.

There is no way for user space to query for the current/last log available.

I mean, we would only generate the CPER when passing certain threshold to avoid
flood in case of memory error storm. So, in this case, there's the need for user
to query the most recent log.

I believe it gets a bit ugly if we tell admin that in order to get the most
recent cper log you need to query the error counter through the netlink, and
up to every single error counter query we also emit the tracefs event.

Then I thought about using the netlink to query the cper, but with a separate
node, exclusively for error-log instead of abusing the error counter API.

But if you believe it is okay to emit tracefs on every counter check, then
we can take that path.

> I definitely think
> debugfs is a bad idea coming from the enterprise distro land where we
> don't like having it.

Yeap, this is why I thought that AMD was trying to find alternatives to
their debugfs solution. But the debugfs solution does have this possibility
of query...

> 
> I'm ccing a few other people that might have opinions on exposing CPER
> compatible logs for RAS purposes from devices, I assume there might be
> more than GPUs wanting to do something like this,

Thank you!

> 
> Dave.
