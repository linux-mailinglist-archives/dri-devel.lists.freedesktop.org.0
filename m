Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77752AEC226
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 23:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4AD10EA2A;
	Fri, 27 Jun 2025 21:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUdfQ2aL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191FD10E033;
 Fri, 27 Jun 2025 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751060360; x=1782596360;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x+WrsQTCc3r3zOUncO4vO/rFQI7VAWWw56N2aRuyDaY=;
 b=JUdfQ2aLnCkeT1w0AXy3WQYxlLxA+Mn7TP4u2YL8jjX05Hr3lMEKD4/Y
 PuF4KRgid6W8PQT7r2Sz5w2CZaMPY0ug82e0TeaBjul+ECOFY1+ldMw6/
 lE7udyuaIkXnv4zELxRxx4skZiC72T5zzEMWtzB+ziprztoeS183L5z79
 3olLhd4Cgq82ykkBlp6tS9OALnlwz80ZAWJoU8f6XpduYGWzmXTPxPJ/o
 6BlxWE1wRxZAJB3ARz80GlcwI6xTfm6UGc+xmDWcu4rkctCodMN+Nqed2
 xuoV13425ngVMTR4TSQYJFzhaHbMiSRFftaqBtAQEJrMTf6e74tibtVoL A==;
X-CSE-ConnectionGUID: Z1fE9SReSJGUv2renOajjA==
X-CSE-MsgGUID: PvCkrAizSmOwFkUlxq3Mdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70815221"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="70815221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:39:20 -0700
X-CSE-ConnectionGUID: qswp9dXPTuapt0JhDi15Rg==
X-CSE-MsgGUID: 17afg4nrRvm8uU6futwmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="153210404"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 14:39:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:39:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 14:39:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 14:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN+aA/PJeTuz9I6kopC1DDbm0s4wI16yJhUy10ZK2cNtwJyIngB51Lne7bgXjyF96R8A6Q+JVBLhx2f1jxza7pj4EBOLqDFzfmcGEWKK/7+kKY3T9ehRcIQm9r0X7La8SXcfzIvsdQefpmHDDkoO3KOT6P9Lh1Dc4nKEpfTUhou3Q8fMRIL/ZQzxb8CJlv9TjFhYsieJxBZ9G6DDqUS5MIPizwA5pquo3k90i3zs3wR1znq2ouZhM3hiX1ibLhl51VdWtNgsT0nsKvj3kXkgJzh0anSeDYQCB/ysU54xKPVSjcLXlKC0Ai3KzeQZ92TRGADvGki8jdYTfW1Ff7howA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQG7t4UoM2iqvU7qKr/Yz/GeqAjcMRYwBbQU8TJmFDM=;
 b=y1g9qBuweu0McoBqUb9dIx7qBXg51g/VjX0D5NRSaRcixSQFnAQQlYH3LMaiLYAmfRqABhWfqCbGfgMk34nw6OMmgVdEHLiTf9dCi6qWZ931OVsUIUfXZwFQHWPELgaGTHZ9Del/sYRWLgF7K6A5gfac/jwgsIGjSNYP36nw29IC4+P01njgkFmSnyi7cxfcGEGNowQDFY1A++5ln5QSe8noGA76U7hdSXwR9iBD9/VC8Sov5qwmwnM6/YE6gfvjX3kA5RqJ3R3Qfvjg5tLLxLaQow4aZQu2n6XLkkTKfWqTB6JeyQDLJioaTExEadsdadGNv455NtY4zlC+Vkw8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 21:38:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 21:38:49 +0000
Date: Fri, 27 Jun 2025 17:38:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
Message-ID: <aF8PZMuMgmWKYJgo@intel.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com>
 <aFsaXXKZSBPrcYJb@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFsaXXKZSBPrcYJb@intel.com>
X-ClientProxiedBy: BYAPR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a72765-c55f-430d-db6d-08ddb5c300b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2VWiv9CpdRwxKbVu8tmEalbP25ty6CPhY0Mj0Sz4yn7al58DcunehkXACs?=
 =?iso-8859-1?Q?TWOmn48lOC8A38qlG9xRxGUQevgVG6nLYEHV7KY+crna7Nv6KkneRxxQSV?=
 =?iso-8859-1?Q?huA77/5CG5It8K1E5N7GwF5+0SzIycvDMgOrZh1/VQL5bwmg0iSRUe10L2?=
 =?iso-8859-1?Q?77FIiaSKUyIK/D8AWYaQ7bvf9mfmgCrLy/cA5vwDrO+Jd2IZBGjWa5BSUe?=
 =?iso-8859-1?Q?FBu1a8wNwvEqTzVHTjN6dBQqYiu4vmeN/vKXrtdZCIqHLJ7ZL0xYdqkZ6v?=
 =?iso-8859-1?Q?cO8e+iFCh2+lHnKcjqJsHDsE+l5ffweJorMfmp5wm/9F2oQ2G3RpcGdvq7?=
 =?iso-8859-1?Q?47lqQ1VRdh8JYLDbaUNo5VHFF1y8vFgXVlvg8JaR4/B7GpFgi3KBqaM9r7?=
 =?iso-8859-1?Q?bOjjh0/oaqN4j/E6RUyrN8RhmyrXB8RLstGWbUm5Wr0QLX3PM/R5Q3PDCH?=
 =?iso-8859-1?Q?UtP5TI/GHchXf4gvUqWuUX2h6fwz0a9zeuovBw5+WH1YiOBj8Shu15yBaE?=
 =?iso-8859-1?Q?TQFcDvdXaByHCpfNpcZxHXEQg0pZ+4gn3pDX8fV5tZN5dlQiOpgLke+pOX?=
 =?iso-8859-1?Q?fL9e3CAlVcYS3RFnlG4JANtzassc6X/d+cYZA/ObAtrLnWHZCwM6iOZYXo?=
 =?iso-8859-1?Q?ohDQJMC2yeOR1vltr1JkRKTbzz/33m1xnAKle84+RJRUabgKbv8bHWngcd?=
 =?iso-8859-1?Q?Zj7sSdZbg41i7C4RqrmgwW1LyA2FewqOQpTO8mT2pVpRABefjNBdTZM/6z?=
 =?iso-8859-1?Q?pjPGbyzAEluArF1CeUkOalOICjmmkhtoEzwhNSdvAy7k4L55WNPRnUXoL7?=
 =?iso-8859-1?Q?J5t/fxqr5W3b4wdQy+00dUgGQLDPeDGq26TV8LNe5isOWXOAxBphIyBp7P?=
 =?iso-8859-1?Q?LngSs0WceSOePXpZJjaOVETLdDkNuvloso4wYkYF5OxYRU+E3NdItq2heZ?=
 =?iso-8859-1?Q?0YXuTs++kg2XqkMdBfd30EgcsUHKipZRDJSwYOclqu10JbL+AdllwDmTGO?=
 =?iso-8859-1?Q?SwDnhw8B9+lMmxK8A6/JD05DoNOX/c3E1M2nuvhY4PQkwVW5LLzRmXQZ5E?=
 =?iso-8859-1?Q?thpYJp8Xr7OxXeAtRL7pcAjd2H2hZ7AMtv/8dPeMHUxMFLKJ9b8GEnnSHW?=
 =?iso-8859-1?Q?E3Y2uXvMs7BskQQ9ijqm/Zy1kNd/3HjwF7/+H24hNr2Z8lTBaLqN8g+oWe?=
 =?iso-8859-1?Q?Z7Y+GR/LS6qAzOPXtU6+4VQEe7fCgI5Ew3QxekVNsvk7RiluZL/9bdS0rq?=
 =?iso-8859-1?Q?/OeVO3+3jga8oeY5rnqajX9RplN5sAbgEUYEfoSSwYTkMSaQbrpWpZ9WMU?=
 =?iso-8859-1?Q?JcwF2wi7wabOuhYjUyHjsI6PRBBiEJjFfOzNb5Cj9nrou8FTe/4g9YV/Zw?=
 =?iso-8859-1?Q?/FI+QIkZMffnPXCjRLXJLabKr+IXd53mZVKIJtti+AJYrqjIuvIVqQGNwP?=
 =?iso-8859-1?Q?7OpjDUKxjfOveJOu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OjRzyKD2r0KNbl+9ExVz85X2tTrpv26bsCEbX0TcIjqgIyrZT8FWvs5hH7?=
 =?iso-8859-1?Q?tstz//J2p1J7ZkoP9P2QMUltJHnGV5bvOp501PlPzK23u1Li0M75r0kR+v?=
 =?iso-8859-1?Q?Go5EYT7Ng7zn/VtmL1YrDkkPkTJ7Mh/MESwviLu80hgXJgw9a4XdqR52TJ?=
 =?iso-8859-1?Q?eIFKGND2XattQGNTns43v/RJN0DWglYsnjWhQU9duQufMAeaX8VC45L/x8?=
 =?iso-8859-1?Q?iJc3IjC+ePDDrdQpAoXoBrKBGEe3jFTwHucdr0KkeeVqiJcEUVORu7boWx?=
 =?iso-8859-1?Q?3aSxRR/t0U16OsSM5rqqjbuq5pl64TxxdS7x5ei1V56umqhBzbfPTPcI9N?=
 =?iso-8859-1?Q?lEUbnyT+Fn+ZlVtsEkQgjoQg81LTAvJgmLuAimnS+/7FKR+EVZtc31lqcH?=
 =?iso-8859-1?Q?BvjBr6UTRwcViHCN9NPC2TscIVE0hMR4V9zs/yc7rlKlc5tnSFvfjHgndC?=
 =?iso-8859-1?Q?xgs31550TTd0V4+zjrXnKWDBiZfRkY2kB5HyyK8sG3VW5qReEvXEwaFMHa?=
 =?iso-8859-1?Q?yLiBzUsomMQdc9h+hkZ0ohTb52qLbTbE/YWPQCbP6b1sXA9onVpcWVaciV?=
 =?iso-8859-1?Q?kLPEjrkWrns3ooJe+Afa+kB1wXvMg0UMS66SflP3omlBKcBayQAECv9Gqr?=
 =?iso-8859-1?Q?YMzzJTvAR8gQjTi6pSpDA53wTJN1I0CveLHSwuoOtWWXahX2lPPE9oqXAd?=
 =?iso-8859-1?Q?8kw5xoXzCDwlXqM2fbgu/aiVM25HlPiONcz9nkdpfD/4xWssUVB5AxcnDl?=
 =?iso-8859-1?Q?xmOhZvuCnrOdu0vMxCUfE8Lsiy747Z0+ndLxYjRoDXP0bbRT/ONet964oT?=
 =?iso-8859-1?Q?IM8UNK59+mL83ZDosugnTsmQ0GLFKVxM4LnuJgFt/jpCItqPUnGeWDRph7?=
 =?iso-8859-1?Q?mniGQ2GJq8spR8NSuOAC/XXNePl32auMkBv53JYYzFuuf8xUyQpb0TB6c6?=
 =?iso-8859-1?Q?m1bHG6P7CI90FFDeRT3DQV7RsTOC8oUB5Aljzy3JSzL3BRazFSiRgy+uam?=
 =?iso-8859-1?Q?7orGbwUiEoCf+YycMp3alXvUsex0fW2mT2Gx+Te9yzp7gIkkV4Z1tyiuzm?=
 =?iso-8859-1?Q?tGIS4gmxcY88gycvBpn3AcBML5H3E1jG4GAxYsyW+jCy+0dvkqacsPwNbg?=
 =?iso-8859-1?Q?L7gqckg1Uo/+7f5JeCQDQi5WScjYUe+7/TSeGylfKKSnM/xHMuDla8qN3J?=
 =?iso-8859-1?Q?JncM67XOoxsCBXrNl3FoazBptTNKuTawlVM4JgVagthAZPLDB7dEeRz4rf?=
 =?iso-8859-1?Q?mZGgqqljdcgCwmZCo8EFrwx4YbJCk33FEcZ/EJkM+lf21Sn3ZFGI/5VwDL?=
 =?iso-8859-1?Q?TyZ00mrVdKvkYssPWjD0oNhosQ5H427U6OEUbjbF7QOdARsZPO6W7go4qz?=
 =?iso-8859-1?Q?XC0zB3yzx8ZOEJHJmEe1M3xJDLxA2tsp46jppaCmaKevGHkAqrhTgOcbEt?=
 =?iso-8859-1?Q?aaalC8HQMvHnlgjz/pozICLPhRsHHZDjuRBZpxo+rBMbb4QyEsslD7Bbil?=
 =?iso-8859-1?Q?ukMDzY5FxFVi126JsGXyyk45W9ojuzNsDBtfU2nrqphdIyaMDnj7uZdVj+?=
 =?iso-8859-1?Q?QCXnnQ2BZKFjSmvYZSNbDjyVKFswslwPSTQtmhv3tLWe3T9uzpYomFHcen?=
 =?iso-8859-1?Q?dVj+KvCfbXSHpjVcg2+HLR1zyzTUZ3W7BKtjaUEWCX6fqslv7c8zxXpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a72765-c55f-430d-db6d-08ddb5c300b8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 21:38:49.4260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEnihYdqYd1+JYdpEivY6ussYF4dKBkLh1Qr1JsWjQcuu1SHJ4DqJu8RWkLRxa24mEhfz8bNRpm5C/RQQ+Z5NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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

On Tue, Jun 24, 2025 at 05:36:29PM -0400, Rodrigo Vivi wrote:
> On Tue, Jun 24, 2025 at 04:23:31PM +0200, Christian König wrote:
> > On 24.06.25 16:03, Riana Tauro wrote:
> > > Hi Christian
> > > 
> > > On 6/24/2025 5:56 PM, Christian König wrote:
> > >> On 23.06.25 12:01, Riana Tauro wrote:
> > >>> A device is declared wedged when it is non-recoverable from
> > >>> the driver context.
> > >>
> > >> Well, not quite.
> > > 
> > > i took this from the below document. Should it be changed?
> > 
> > The wedge event basically meant that something unexpected happened during the lifetime of the the device (crash, hang whatever).
> > 
> > It can be that the device recovered on it's own and nothing needs to be done (the none case in the documentation) and the event is just send for telemetry collection.
> > 
> > But the usual case is to trigger a bus reset, rebing or even reboot.
> > 
> > > https://www.kernel.org/doc/html/v6.16-rc3/gpu/drm-uapi.html#device-wedging
> > > 
> > >>
> > >>> Some firmware errors can also cause
> > >>> the device to enter this state and the only method to recover
> > >>> from this would be to do a firmware flash
> > >>
> > >> What? What exactly do you mean with firmware flash here?
> > >>
> > >> Usually that means updating the firmware, but I don't see how this will bring you out of a wedge state?
> > > 
> > > It means updating the firmware.
> > > 
> > > Series:  https://patchwork.freedesktop.org/series/149756/
> > > 
> > > In this xe kmd series, there are few firmware errors that cause the card to be non-functional. The device is declared wedged and a firmware-flash action is sent.
> > 
> > Ok, so let me recap that just to make sure that I did understood that correctly.
> > 
> > You find that the firmware flashed into the device is buggy and then raise a wedge event to automatically trigger a firmware update?
> > 
> > Why not fail to load the driver in the first place?
> 
> We already have that in place. If during the probe the fw machinery underneath
> identified something is so bad that it needs to be flashed we boot in the
> 'survivability mode'. The device is not discoverable for any gpu command
> submission or memory management, but only fw flashing is possible on that
> mode.
> 
> This is on top of that. If the fw machinery had a bad unrecoverable error
> and decided that fw updating is needed.
> 
> > Or at least print a big warning into the system log?
> > 
> > I mean a firmware update is usually something which the system administrator triggers very explicitly because when it fails for some reason (e.g. unexpected reset, power outage or whatever) it can sometimes brick the HW.
> > 
> > I think it's rather brave to do this automatically. Are you sure we don't talk past each other on the meaning of the wedge event?
> 
> The goal is not to do that automatically, but raise the uevent to the admin
> with enough information that they can decide for the right correctable
> action.

Christian, Andre, any concerns with this still?

> 
> Thanks,
> Rodrigo.
> 
> > 
> > Thanks,
> > Christian.
> > 
> > > 
> > > There is corresponding fwupd PR in work that uses this uevent to trigger a firmware flash
> > > 
> > > fwupd PR: https://github.com/fwupd/fwupd/pull/8944/
> > > 
> > > Thanks
> > > Riana
> > > 
> > >>
> > >> Where is the rest of the series?
> > >>
> > >> Regards,
> > >> Christian.
> > >>
> > >>> v2: modify documentation (Raag, Rodrigo)
> > >>>
> > >>> Cc: André Almeida <andrealmeid@igalia.com>
> > >>> Cc: Christian König <christian.koenig@amd.com>
> > >>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > >>> ---
> > >>>   Documentation/gpu/drm-uapi.rst | 6 +++---
> > >>>   drivers/gpu/drm/drm_drv.c      | 2 ++
> > >>>   include/drm/drm_device.h       | 1 +
> > >>>   3 files changed, 6 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > >>> index 263e5a97c080..cd2481458755 100644
> > >>> --- a/Documentation/gpu/drm-uapi.rst
> > >>> +++ b/Documentation/gpu/drm-uapi.rst
> > >>> @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
> > >>>   can use any one, multiple or none. Method(s) of choice will be sent in the
> > >>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > >>>   more side-effects. If driver is unsure about recovery or method is unknown
> > >>> -(like soft/hard system reboot, firmware flashing, physical device replacement
> > >>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > >>> -will be sent instead.
> > >>> +(like soft/hard system reboot, physical device replacement or any other procedure
> > >>> +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
> > >>>     Userspace consumers can parse this event and attempt recovery as per the
> > >>>   following expectations.
> > >>> @@ -435,6 +434,7 @@ following expectations.
> > >>>       none            optional telemetry collection
> > >>>       rebind          unbind + bind driver
> > >>>       bus-reset       unbind + bus reset/re-enumeration + bind
> > >>> +    firmware-flash  firmware flash
> > >>>       unknown         consumer policy
> > >>>       =============== ========================================
> > >>>   diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > >>> index 02556363e918..5f3bbe01c207 100644
> > >>> --- a/drivers/gpu/drm/drm_drv.c
> > >>> +++ b/drivers/gpu/drm/drm_drv.c
> > >>> @@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > >>>           return "rebind";
> > >>>       case DRM_WEDGE_RECOVERY_BUS_RESET:
> > >>>           return "bus-reset";
> > >>> +    case DRM_WEDGE_RECOVERY_FW_FLASH:
> > >>> +        return "firmware-flash";
> > >>>       default:
> > >>>           return NULL;
> > >>>       }
> > >>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > >>> index 08b3b2467c4c..9d57c8882d93 100644
> > >>> --- a/include/drm/drm_device.h
> > >>> +++ b/include/drm/drm_device.h
> > >>> @@ -30,6 +30,7 @@ struct pci_controller;
> > >>>   #define DRM_WEDGE_RECOVERY_NONE        BIT(0)    /* optional telemetry collection */
> > >>>   #define DRM_WEDGE_RECOVERY_REBIND    BIT(1)    /* unbind + bind driver */
> > >>>   #define DRM_WEDGE_RECOVERY_BUS_RESET    BIT(2)    /* unbind + reset bus device + bind */
> > >>> +#define DRM_WEDGE_RECOVERY_FW_FLASH    BIT(3)  /* firmware flash */
> > >>>     /**
> > >>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > >>
> > > 
> > > 
> > 
