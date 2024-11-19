Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D939D310A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 00:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6E210E0E3;
	Tue, 19 Nov 2024 23:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kP78+rgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FFC10E06C;
 Tue, 19 Nov 2024 23:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732059838; x=1763595838;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kCTyw2ClqQDMaFH4CIOXLViwT0wSr8+1f/50fLqL+jw=;
 b=kP78+rgLI06+IdQMRA3NQnryon5SkimEsgBUzfmTBiI6ykoS4oQBf8nB
 SW9w9olrqOPMlssrV9K/WqBObqbOkgUNddQhMZEJ1dfvErOXvv0CiilgY
 7+60bZhmA+VsE6GgI0QOqjKqslxBd3ead5Ko0+8mLFfbvmic7hMNmMNhe
 Pom+bXfJWAMKJZtiGhwFXAKUj+Pn4b57sSDNqLCmPe8mbcUDJ56L+IwoD
 QChD6xAn+x7Q+X2sjv+r+kXDqUXJcTiZTclW13ZASXGmWjAgWHMV/rRbD
 9ii80cf8O0EygIlsRyttLJlESEEQLzWFLOElNpYh0ppToGGp0yGKGlE7G g==;
X-CSE-ConnectionGUID: rV0eODDKTFK529cV37bo0Q==
X-CSE-MsgGUID: /jCCqR6hTPehM7jBtneb+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31500069"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31500069"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 15:43:57 -0800
X-CSE-ConnectionGUID: rqaBL+YhQGmKrGSpGf4wYw==
X-CSE-MsgGUID: bag8hC9ARQCvmRPjKXTPSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89720192"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 15:43:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 15:43:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 15:43:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 15:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPUySrsHhJCjNYgQCHQA2jKipybQOdOPo5TA3U/tIBGD0ZJmqwvsjbYGf9NtjG66gLGaFZD8rBWVIkZeTWO/ySx3GwjLtL88x4HIcf63wrnDrObtMBbFL4uAUjexOYRsPvDppLqdUh7H/kKwSf/tgkYbZ0b0vjUI2kD4DgBd2dZ0h37rcxSeoczThqL3KKowqP3pU6ZhWWtmKa868RBzCxvD4ZE0tXLHm5jlWYzoqeb/WcijUki2+Pn8n7WCR3TeE+YVymbWNoBq7aUFPh6v3XuTm9c9dftLSkmHzlklBo1P99uZtIAqyntVrwhY2xNaVvuKK73PcFlIePS4IcsaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRsdCj6dPpA3plkfl2uetqyXNsYPReFlPO+7UOQOnN4=;
 b=Otkd+O0Pu5LWqnaJgJobNtzPwgQzamVm8Jg7C1FOUO+J/SykTQfAgpt7tUE2QxfiVKRlXmCrRkNhR5XCKkW8tfKjR0MrtyJn4LTBCn+95IV4qzzOV6Qw75B3/RH9wuFkk9YkcqhoFDdwVrp9s+x+U4et6VPn6weXb8Y3jrtCfrIDScAJfAg/JpIcOjFyrbO/5misqzFuf60hFThlS5DMzjhszBJigkZ7fhOsDXX9uGE9SC6rJA/Cx07V9JAW0KW73hX4OhMKH4DnELPbLFTt1fnfvpx7d6zn0SnmS3SSkNcVBI5ijvwK27yyyu1NTOVUWY2TACCTdPziscVG3SCxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 23:43:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 23:43:54 +0000
Date: Tue, 19 Nov 2024 15:44:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 13/29] drm/xe: Add unbind to SVM garbage collector
Message-ID: <Zz0i3XiEijt/9e7y@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-14-matthew.brost@intel.com>
 <e30f24553810cf10774201b39262e63fd7f664d7.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e30f24553810cf10774201b39262e63fd7f664d7.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: be9383d5-f64d-45b0-8bd3-08dd08f4074b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?P10N2yiW2wu3BEirJgUWxTSOsPsn+7bPP70p/Ns2vHYsBdc7zM4FcXX1XC?=
 =?iso-8859-1?Q?9f1Z/Vxkq7ukyhuqX3GRjx0GUNPOtwvt+i1g0f1+SS2zS/pRnXGBUOyZgE?=
 =?iso-8859-1?Q?s0HmFFkW9PjIuInYjDAi1Xrxx3USJwnmWKfGBKsY9bnW9ZyJm4zIoO0jMC?=
 =?iso-8859-1?Q?kTm9Oz8aZE68xbDOjtHSW8df1kpLojWMjY5aUr0t/zslt6X2vh3LyVHy6O?=
 =?iso-8859-1?Q?UFtxl7sE7c28D2nbR7j2PZb4dGWAOqO3EQMuM07Kf9IEYwltTFdhKAC+UG?=
 =?iso-8859-1?Q?/4S+iRbL01KAoKBeHufhORDSrgYtJ8dVhXlkwQIRNperxIW3v84bR7giOe?=
 =?iso-8859-1?Q?Tt9m3YjFobR9Rj05eE8xk9OgWtydp7+bxZrdT5uglBtLh8DPIdfV02XZ9C?=
 =?iso-8859-1?Q?q+Tii62L9srDyfrpRtSHiOzhWMeR6yoAWzBaTVfuBNBmoIXZ2SKRaAkxu/?=
 =?iso-8859-1?Q?PLY+Ru6u2o9WBVNa0VQezkTJQJJnf0GON2Y7VDg//fcfVWoTd4SNsh2SBH?=
 =?iso-8859-1?Q?YU5fwVEpoIhzjMgKorAd2P8qKEZHED20+X8lTH0mQ4A8md2XSsP+YS6cJo?=
 =?iso-8859-1?Q?SCHZLY68u+js2uYV70bJ0JdFVdCs6u0n6THBMnQ9HlqM2bduZ//yaVti0I?=
 =?iso-8859-1?Q?pc/mtaylHLaBK4vxP4qhTO2i/dirSau2188gtL/K6/BxIyk5pvk+QNJ7xk?=
 =?iso-8859-1?Q?jhOe0r2QDJ+UsJUjH6p3lhZmc6kL0Cm1bYnloGZupwVnZfCEB+9Q4uimw0?=
 =?iso-8859-1?Q?wwAROuFM3cFVetmjyx8rRbX+CVkxvRYV/M8fFBOytvR9mf+u2At/Dzvd/t?=
 =?iso-8859-1?Q?X7//pjPeYiEoCmE40CWZldy2p7wk9G14onODMVULzVRQ6SpRThFsHph7aW?=
 =?iso-8859-1?Q?qRirGoqXpFcs4pWBd73MtC1SX9AmFpNEXczJgAzpqvbKfqx3EC2P2UrFTF?=
 =?iso-8859-1?Q?emaPQz3fcQBuN1lqsgYvubtSoJJ7pVtS3+3LYKEe5L3NaBDVOHKF/J+pWc?=
 =?iso-8859-1?Q?ARLn5YAgrK6lGUFDPEYIpFxq6c2+pWro1g+BNYM0CeAEIcFtx41bWe+PcA?=
 =?iso-8859-1?Q?OjVk+qVq9AFopUY+eyCy0tmpdotfoacKRlHxKUZQDETNtaV9lDY+OK1VpM?=
 =?iso-8859-1?Q?zNEIxrClqEX0opyHwkE9yEpr9mlQJUBfQz9icWIqAfYzZZkJx2ABVmUFn5?=
 =?iso-8859-1?Q?Z6P5Im+pRkF1QY+GV6WNaLOyOJmPSa76mU5yRkIc1eIOTFfD9gZnozBDqc?=
 =?iso-8859-1?Q?gZsINpERdI7KTuxt3uzCyVhZW06tWAh79Bqhpc0TQDr8UVETAjiGuaC+a7?=
 =?iso-8859-1?Q?W11teltBHRZXRFZnVE34nBbsk6Ru20NR7r5cOiSmhRx2IOqm6/3kNo9uaL?=
 =?iso-8859-1?Q?Y6Rq+G9p9e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Lhyag6iKec8Q1QCx3K2U4b7aQp+gJ1oewknLlteyAOfQborL7jYHEXl9P3?=
 =?iso-8859-1?Q?7ZdYhPVvsdlMdJg7UuWYNP1ytQvPuBga/YY354+o0y6Aj/WN9Gh0RoNosv?=
 =?iso-8859-1?Q?cxTbQYNcDVg3yH0STbY+Cf/IyDyReAtq6Ta2F+dK/3UlRP0NAX/n//Fw6U?=
 =?iso-8859-1?Q?iRrEAWS2t6vIxX79ui5Q748FER2Bp0cxl+wbC4xAyNPguHBQkDwn9NXoox?=
 =?iso-8859-1?Q?ipSnaJwNEJf1pemZ8yUHhDoA3VNfg03x108mQ/yDGPJeMD417xSU22Q/0W?=
 =?iso-8859-1?Q?4syc4swC17B/cUHTVSKNtkN2AKsckwXGxs9Ahj/l83uJBGviBSrZavp/cY?=
 =?iso-8859-1?Q?nXsVv0VMLhR+LfnzoqdjQ81VYaDRF1652JpR8PY6zEOWkL+hX5LLrmuxmP?=
 =?iso-8859-1?Q?taADSzsqbYtKuLLKPVH6BBwUrqIh0PXCMkmaowo1AxmdejJjgrv5BfESqs?=
 =?iso-8859-1?Q?H/MUtW57rAZkCsH6VNg259BjnJy7gN/XG810n6sbfLpurFPAWvl0kLPT1q?=
 =?iso-8859-1?Q?WszV4rBPGk/b0qZnw1/+tt7uXSuCbAxMsLt31he5/gT29OMfVO70Pb2uNG?=
 =?iso-8859-1?Q?jXg75SDumvoPf38vSoz7iBW9k8QNYMHvXVjy/qvzWWfu0zfCm/hWi8klhY?=
 =?iso-8859-1?Q?ahcfqqNEE1qqStDQvU0ef/GgXtP7SqaSfjV/eaTBloCIWH5A9d7pXZHgyo?=
 =?iso-8859-1?Q?nH8HmOZ0C3VN0QYIH8A3qAi6mFkBGT9Cbw2MPuE3o+JayLAcDn8Ihimedc?=
 =?iso-8859-1?Q?I1M8HKqAfs5WkqQMveR5seKn0UUXhjhvZeD+0eoujMR2X6oNCCrS+1GhNg?=
 =?iso-8859-1?Q?NiWoj/EeZyYGDTWeoP23S5RsY0KdzqeDNVpgJWwRFIZecqsspfNWWDAyNF?=
 =?iso-8859-1?Q?S4aZJnyFOSAGD+GtW8LC168xtAGlIVpy1jOir97HY5XbD1uXwFlhUf3XA2?=
 =?iso-8859-1?Q?rbFGPA28FApgbBuLwNrDdxehNF8+lo6uLT9Jc+ne3mxjIfv95fCxbVZ6Bv?=
 =?iso-8859-1?Q?uCqhH95SK0jIKEUiBrqEHGusQwwm9PT3yqkFRtpvSoAvxIwvhe/5vsp0Sr?=
 =?iso-8859-1?Q?Ii5q4EvJjt3NVWbJSc0NwZKIyP8Kca7qXUPC5S+dDpZubhB/Ctt8cX5xoQ?=
 =?iso-8859-1?Q?uZ5mOxxX+ses04TZ3qwb8XrpTbzRwrpbqy/hwzGDG3lBXuImvNZEdVV2oX?=
 =?iso-8859-1?Q?dS/YJbcYrigvEfWfYto9lAA2diV4qO16+i0Nk4KeW2ztfSjSFSVwaWDdN0?=
 =?iso-8859-1?Q?wYCV3ZhnvvrDfilCANCBmbNsDpH4DM3JIbuJtkN9850SoKZjiHgnS167Ki?=
 =?iso-8859-1?Q?yqapg5a3nyQTfrELhx0/ZlIjioRTz68t/shoU+RXcvDFXS8H9wg1GAUGf9?=
 =?iso-8859-1?Q?RMCgCky1+N1dWFyKqbN1aqNQUNkBI2TbEKWUD5D2v0AiH5D5TKtDmSd5dC?=
 =?iso-8859-1?Q?bt6hXwGw5Ik4ctw72DWENQiO+8F0uBTPOAiMnv74FjCENV+sckDOPun45J?=
 =?iso-8859-1?Q?ms/KprLBhXyQlOnE4JG+f2lWiygYdiPV5QTFAocUmkNkio3VUg2WwVLVBv?=
 =?iso-8859-1?Q?wTXAX2Yo/0Jn68tSJfQlfKZKGDq40X2TpzZ1GsEntGFyQjiKgpu80Jcoic?=
 =?iso-8859-1?Q?Ie/+/WnwNuIHEgjihJZpD3s0kz2H+CXDczMfiuQ9p6vaawGS35dr3KQQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be9383d5-f64d-45b0-8bd3-08dd08f4074b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 23:43:54.5615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lwcenL+ce1yJ/M/bQXMXXSNVgTwoEjRh1d7TgseSgDY5D7fYJElKBxICx0+/3C4A8eAIt5Lsuj1kY1Ph10LOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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

On Tue, Nov 19, 2024 at 04:31:05PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add unbind to SVM garbage collector. To facilitate add unbind support
> > function to VM layer which unbinds a SVM range. Also teach PY layer
> > to
> > understand unbinds of SVM ranges.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       | 84 ++++++++++++++++++++++++++----
> > --
> >  drivers/gpu/drm/xe/xe_svm.c      |  9 +++-
> >  drivers/gpu/drm/xe/xe_vm.c       | 73 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h       |  2 +
> >  drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++-
> >  5 files changed, 162 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 024e4eb83408..687abd1a5e74 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -925,10 +925,16 @@ static void xe_pt_cancel_bind(struct xe_vma
> > *vma,
> >  	}
> >  }
> >  
> > +#define INVALID_VMA	(struct xe_vma*)(0xdeaddeadull)
> 
> Please prefix with XE_ to avoid future name clashes.
> 

Good idea.

> > +
> >  static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >  {
> > -	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_vm *vm;
> >  
> > +	if (vma == INVALID_VMA)
> > +		return;
> > +
> > +	vm = xe_vma_vm(vma);
> >  	lockdep_assert_held(&vm->lock);
> >  
> >  	if (!xe_vma_has_no_bo(vma))
> > @@ -954,7 +960,8 @@ static void xe_pt_commit(struct xe_vma *vma,
> >  		for (j = 0; j < entries[i].qwords; j++) {
> >  			struct xe_pt *oldpte =
> > entries[i].pt_entries[j].pt;
> >  
> > -			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags,
> > deferred);
> > +			xe_pt_destroy(oldpte, (vma == INVALID_VMA) ?
> > 0 :
> > +				      xe_vma_vm(vma)->flags,
> > deferred);
> >  		}
> >  	}
> >  }
> > @@ -1387,6 +1394,9 @@ static int xe_pt_svm_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> >  	list_for_each_entry(op, &vops->list, link) {
> >  		struct xe_svm_range *range = op->map_range.range;
> >  
> > +		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > +			continue;
> > +
> >  		xe_assert(vm->xe, xe_vma_is_system_allocator(op-
> > >map_range.vma));
> >  		xe_assert(vm->xe, op->subop ==
> > XE_VMA_SUBOP_MAP_RANGE);
> >  
> > @@ -1585,7 +1595,9 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_unbind_ops = {
> >   * xe_pt_stage_unbind() - Build page-table update structures for an
> > unbind
> >   * operation
> >   * @tile: The tile we're unbinding for.
> > + * @vm: The vm
> >   * @vma: The vma we're unbinding.
> > + * @range: The range we're unbinding.
> >   * @entries: Caller-provided storage for the update structures.
> >   *
> >   * Builds page-table update structures for an unbind operation. The
> > function
> > @@ -1595,9 +1607,14 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_unbind_ops = {
> >   *
> >   * Return: The number of entries used.
> >   */
> > -static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > +static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
> > +				       struct xe_vm *vm,
> > +				       struct xe_vma *vma,
> > +				       struct xe_svm_range *range,
> >  				       struct xe_vm_pgtable_update
> > *entries)
> >  {
> > +	u64 start = range ? range->base.va.start :
> > xe_vma_start(vma);
> > +	u64 end = range ? range->base.va.end : xe_vma_end(vma);
> >  	struct xe_pt_stage_unbind_walk xe_walk = {
> >  		.base = {
> >  			.ops = &xe_pt_stage_unbind_ops,
> > @@ -1605,14 +1622,14 @@ static unsigned int xe_pt_stage_unbind(struct
> > xe_tile *tile, struct xe_vma *vma,
> >  			.max_level = XE_PT_HIGHEST_LEVEL,
> >  		},
> >  		.tile = tile,
> > -		.modified_start = xe_vma_start(vma),
> > -		.modified_end = xe_vma_end(vma),
> > +		.modified_start = start,
> > +		.modified_end = end,
> >  		.wupd.entries = entries,
> >  	};
> > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > +	struct xe_pt *pt = vm->pt_root[tile->id];
> >  
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > -				xe_vma_end(vma), &xe_walk.base);
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
> > +				&xe_walk.base);
> >  
> >  	return xe_walk.wupd.num_used_entries;
> >  }
> > @@ -1854,13 +1871,6 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  	       "Preparing unbind, with range [%llx...%llx)\n",
> >  	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> >  
> > -	/*
> > -	 * Wait for invalidation to complete. Can corrupt internal
> > page table
> > -	 * state if an invalidation is running while preparing an
> > unbind.
> > -	 */
> > -	if (xe_vma_is_userptr(vma) &&
> > xe_vm_in_fault_mode(xe_vma_vm(vma)))
> > -		mmu_interval_read_begin(&to_userptr_vma(vma)-
> > >userptr.notifier);
> > -
> >  	pt_op->vma = vma;
> >  	pt_op->bind = false;
> >  	pt_op->rebind = false;
> > @@ -1869,7 +1879,8 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  	if (err)
> >  		return err;
> >  
> > -	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op-
> > >entries);
> > +	pt_op->num_entries = xe_pt_stage_unbind(tile,
> > xe_vma_vm(vma),
> > +						vma, NULL, pt_op-
> > >entries);
> >  
> >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> >  				pt_op->num_entries, false);
> > @@ -1884,6 +1895,42 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  	return 0;
> >  }
> >  
> > +static int unbind_range_prepare(struct xe_vm *vm,
> > +				struct xe_tile *tile,
> > +				struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> > +				struct xe_svm_range *range)
> > +{
> > +	u32 current_op = pt_update_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> > +
> > +	if (!(range->tile_present & BIT(tile->id)))
> > +		return 0;
> > +
> > +	vm_dbg(&vm->xe->drm,
> > +	       "Preparing unbind, with range [%llx...%llx)\n",
> > +	       range->base.va.start, range->base.va.end - 1);
> > +
> > +	pt_op->vma = INVALID_VMA;
> > +	pt_op->bind = false;
> > +	pt_op->rebind = false;
> > +
> > +	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL,
> > range,
> > +						pt_op->entries);
> > +
> > +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > +				pt_op->num_entries, false);
> > +	xe_pt_update_ops_rfence_interval(pt_update_ops, range-
> > >base.va.start,
> > +					 range->base.va.end);
> > +	++pt_update_ops->current_op;
> > +	pt_update_ops->needs_svm_lock = true;
> > +	pt_update_ops->needs_invalidation = true;
> > +
> > +	xe_pt_commit_prepare_unbind(INVALID_VMA, pt_op->entries,
> > +				    pt_op->num_entries);
> > +
> > +	return 0;
> > +}
> > +
> >  static int op_prepare(struct xe_vm *vm,
> >  		      struct xe_tile *tile,
> >  		      struct xe_vm_pgtable_update_ops
> > *pt_update_ops,
> > @@ -1951,6 +1998,9 @@ static int op_prepare(struct xe_vm *vm,
> >  			err = bind_range_prepare(vm, tile,
> > pt_update_ops,
> >  						 op->map_range.vma,
> >  						 op-
> > >map_range.range);
> > +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> > +			err = unbind_range_prepare(vm, tile,
> > pt_update_ops,
> > +						   op-
> > >unmap_range.range);
> >  		}
> >  		break;
> >  	default:
> > @@ -2139,6 +2189,8 @@ static void op_commit(struct xe_vm *vm,
> >  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> >  			op->map_range.range->tile_present |=
> > BIT(tile->id);
> >  			op->map_range.range->tile_invalidated &=
> > ~BIT(tile->id);
> > +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> > +			op->unmap_range.range->tile_present &=
> > ~BIT(tile->id);
> >  		}
> >  		break;
> >  	}
> 
> I think this further stresses the need to provide a pt code interface
> that is oblivious of vmas, userptr and ranges so that we can get rid of
> all special-casing, but for now code looks good as is IMO.
> 

I agree eventually it would be nice drop vmas / userptr / ranges from
the bind code. I believe I even opened a Jira for this task. The main
issue I see is tile_present, tile_invalidated needs to be moved to the
PT state which is a fairly large refactor. We also short circuit in
bunch of places based on this state which would turn into a page table
walk which also needs to be considered too.

As long as you ok with this for now, I agree let's scope / do in a
follow up.

> 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 9c2f44cba166..0762126f65e0 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -208,7 +208,14 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> >  				      struct xe_svm_range *range)
> >  {
> > -	/* TODO: Do unbind */
> > +	struct dma_fence *fence;
> > +
> > +	xe_vm_lock(vm, false);
> > +	fence = xe_vm_range_unbind(vm, range);
> > +	xe_vm_unlock(vm);
> > +	if (IS_ERR(fence))
> > +		return PTR_ERR(fence);
> > +	dma_fence_put(fence);
> >  
> >  	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 399cbbdbddd5..76a20e96084e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -972,6 +972,79 @@ struct dma_fence *xe_vm_range_rebind(struct
> > xe_vm *vm,
> >  	return fence;
> >  }
> >  
> > +static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
> > +					struct xe_svm_range *range)
> > +{
> > +	INIT_LIST_HEAD(&op->link);
> > +	op->tile_mask = range->tile_present;
> > +	op->base.op = DRM_GPUVA_OP_USER;
> > +	op->subop = XE_VMA_SUBOP_UNMAP_RANGE;
> > +	op->unmap_range.range = range;
> > +}
> > +
> > +static int
> > +xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
> > +			   struct xe_svm_range *range)
> > +{
> > +	struct xe_vma_op *op;
> > +
> > +	op = kzalloc(sizeof(*op), GFP_KERNEL);
> > +	if (!op)
> > +		return -ENOMEM;
> > +
> > +	xe_vm_populate_range_unbind(op, range);
> > +	list_add_tail(&op->link, &vops->list);
> > +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> > +
> > +	return 0;
> > +}
> > +
> > +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > +				     struct xe_svm_range *range)
> 
> Kerneldoc.
> 

Yep.

Matt

> 
> > +{
> > +	struct dma_fence *fence = NULL;
> > +	struct xe_vma_ops vops;
> > +	struct xe_vma_op *op, *next_op;
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +	int err;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +	xe_vm_assert_held(vm);
> > +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> > +
> > +	if (!range->tile_present)
> > +		return dma_fence_get_stub();
> > +
> > +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> > +	for_each_tile(tile, vm->xe, id) {
> > +		vops.pt_update_ops[id].wait_vm_bookkeep = true;
> > +		vops.pt_update_ops[tile->id].q =
> > +			xe_tile_migrate_exec_queue(tile);
> > +	}
> > +
> > +	err = xe_vm_ops_add_range_unbind(&vops, range);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	err = xe_vma_ops_alloc(&vops, false);
> > +	if (err) {
> > +		fence = ERR_PTR(err);
> > +		goto free_ops;
> > +	}
> > +
> > +	fence = ops_execute(vm, &vops);
> > +
> > +free_ops:
> > +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> > +		list_del(&op->link);
> > +		kfree(op);
> > +	}
> > +	xe_vma_ops_fini(&vops);
> > +
> > +	return fence;
> > +}
> > +
> >  static void xe_vma_free(struct xe_vma *vma)
> >  {
> >  	if (xe_vma_is_userptr(vma))
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 8bd921b33090..d577ca9e3d65 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -222,6 +222,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm
> > *vm,
> >  				     struct xe_vma *vma,
> >  				     struct xe_svm_range *range,
> >  				     u8 tile_mask);
> > +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > +				     struct xe_svm_range *range);
> >  
> >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 2eae3575c409..d38cf7558f62 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -348,6 +348,12 @@ struct xe_vma_op_map_range {
> >  	struct xe_svm_range *range;
> >  };
> >  
> > +/** struct xe_vma_op_unmap_range - VMA unmap range operation */
> > +struct xe_vma_op_unmap_range {
> > +	/** @range: SVM range to unmap */
> > +	struct xe_svm_range *range;
> > +};
> > +
> >  /** enum xe_vma_op_flags - flags for VMA operation */
> >  enum xe_vma_op_flags {
> >  	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> > @@ -362,6 +368,8 @@ enum xe_vma_op_flags {
> >  enum xe_vma_subop {
> >  	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
> >  	XE_VMA_SUBOP_MAP_RANGE,
> > +	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
> > +	XE_VMA_SUBOP_UNMAP_RANGE,
> >  };
> >  
> >  /** struct xe_vma_op - VMA operation */
> > @@ -384,8 +392,10 @@ struct xe_vma_op {
> >  		struct xe_vma_op_remap remap;
> >  		/** @prefetch: VMA prefetch operation specific data
> > */
> >  		struct xe_vma_op_prefetch prefetch;
> > -		/** @map: VMA map range operation specific data */
> > +		/** @map_range: VMA map range operation specific
> > data */
> >  		struct xe_vma_op_map_range map_range;
> > +		/** @unmap_range: VMA unmap range operation specific
> > data */
> > +		struct xe_vma_op_map_range unmap_range;
> >  	};
> >  };
> >  
> 
> Thanks,
> Thomas
> 
