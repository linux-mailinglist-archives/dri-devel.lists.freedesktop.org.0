Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1867F974390
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 21:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EA710E90D;
	Tue, 10 Sep 2024 19:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXuraSkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFB010E90D;
 Tue, 10 Sep 2024 19:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725996926; x=1757532926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s0Grb5KkY0tiayDP8Wcc46q7PQ/hc6p5TKHspaO72ME=;
 b=RXuraSkEcFZb6QwosmYc/d3dY55r8knJnoSw/Sa5IkJ458hLMpWp4Wp9
 S0dkXgNmvSGPZUpJ5Dv5JtonINs8SCQuy2kp41q2P7IlZd3H+vR4oT3AI
 1kKN8ORvh4Cfeo4oYXlqi/d9HEMn8XdEVW4BmNPdHu2RqIHwZNySfJ1Jk
 11OwES2KcuoT36kx5jm+lYF7et7azUcnOxNqzoQLGtvkGHSVq013Co1Cv
 AJBE4YE9hun2v0MxGUlXnjWCOjagnjs79I831dd8jmxDDJMEyGvXaEaY2
 XjRCaI7oGwpILurkQLej8zcK7iBNav3ApcV4KBl0seB+7yprBKDfX2J8R g==;
X-CSE-ConnectionGUID: UJFXcuhFSM6YwDVfuAXN6w==
X-CSE-MsgGUID: 7FWkkyFDTiq55DTuh86rlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35363594"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="35363594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 12:35:26 -0700
X-CSE-ConnectionGUID: zC6PF7lbSc+njOIH0NKcBg==
X-CSE-MsgGUID: iUjY2nkiRC+dOjt1yBwZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67146553"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 12:35:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 12:35:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 12:35:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 12:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTJneqFj5UDK+VAL8h63dm3RqaT5oot0s1k51xrtniY7bWEV/Jisi1DlRfmvxnsj7/BH1hBU4IhvnSZtv46RdavYCLtVUXiRD0eC1N96re8d3qQzM7DypzHWHsXbnR+w3gqUty9AW5XFnhKeVI1X3QsUXUid5p3Usl2/e9xpVKkCXK7VnBibs+xRCh/s2HgDiF4pa5sgSelOObbQWIFAWVDxewlz789rvvwORbEXqEjSTDzxHhoiEAy0TEcdbbcDl9XepkUw/qf6Pp6vS4hm3XkVWfgEp0dXF4ln7T3CLoaNBUHriygNHmJB78MtriEZu+7+pVCA9VwRpvIWIBW1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEx2Bf77xP3Cg3CzlAT8gjEf/cwnX5eLSch1NI2QGoo=;
 b=B1eIc11fmHkhBigXdQwM/+CSoOVlcN0Dh0vIxjLZWT/i0rRO4MesRdOLUdjSWGCPyYC5jf1q88VDgAlCABH97Ut+Qk82KxPn7aRruAkgjQgo/svxKIFEaky2pHjoqrEsNmI66IcSIkklM0iXceJ8qK1u33jv4YPms1Z7D9rTvlarcJ6/p891os7oaVwgT/PBsdEhg6FRCf+Ul4PCqn0iWXCAi37jCIlWmqKTXj88Hax70oe6CvqWV2aB2Nq4vLwcikAic80ubypYN4Q8DBNxJhEgsOIqKHnaCY/qzfTmXZg8jalsClT/K86hOdHEo4FYpSGvfQLRMSD9oOyAc4IVnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 19:35:22 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 19:35:22 +0000
Date: Tue, 10 Sep 2024 15:35:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <daniel@ffwll.ch>, Daniel Stone
 <daniels@collabora.com>, Helen Mae Koike Fornazier
 <helen.koike@collabora.com>, Sergi Blanch Torne
 <sergi.blanch.torne@collabora.com>, Guilherme Alcarde Gallo
 <guilherme.gallo@collabora.com>
Subject: Re: drm-ci: flaky tests for i915 driver testing
Message-ID: <ZuCfdbFZiJ-1z4pU@intel.com>
References: <af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com>
 <48fb86a9-b863-468e-ae74-35423b22b76d@collabora.com>
 <61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <61f62c86-3e82-4eff-bd3c-8123fa0ca332@collabora.com>
X-ClientProxiedBy: MW4PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:303:b5::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 143aabb2-89a5-4408-bc2d-08dcd1cfb5ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4VQVnniDoGHprdbDG4VoAhYMEAUt5Js7axR4uTwjjqn088FLdjFfHlazYfXU?=
 =?us-ascii?Q?pk4JntreEnMkDpn6uQkvZpkYCAur7NogF0lPT1IFu72oK8td6Dayb8OwEvXp?=
 =?us-ascii?Q?T/gNkb7Vj9qQdke/n9219nMlYRjON2tjuFDVk5QtvWFLq302pDiKk5HILn1u?=
 =?us-ascii?Q?RbrNUWecPpXnkz9XObz9ujgI4LfRLTc7ratCQLs/5BmqPJ7LQDYya3HRLLJB?=
 =?us-ascii?Q?zIhn/qVFXPSeBPXVzxZYWCAmV1X5An/5HPM1tU28sOvpHe95DgeclASl2mQt?=
 =?us-ascii?Q?HuK8O/gSZ/nZbrz+pgelopg6sW2jnxhdIY8mAobDyJbOSl1MUbF/TKr8j9QQ?=
 =?us-ascii?Q?ZLUMiwgU5+joGWRNKJxFv991q8VxMaERP0KR/H+asO4tW8J+KpJ2cXxOA6JM?=
 =?us-ascii?Q?Yo67B7lnucbKJnf8hz3ldOQ6DTbolhugF5mQHZ+o+vDmUKLwq0FJPMX0Ezw4?=
 =?us-ascii?Q?X0EnV1ApecIe4rrYT2M4OIq0SLvERAG8AiOwCKnFHYNxyLRtSXhMwbmnjKq8?=
 =?us-ascii?Q?etgyDH4ugPODHU08cU1JHtiw2Mgabqt7z6mVWSDYJlORiuQ5MCuElu72fYLP?=
 =?us-ascii?Q?zFZxYWaYQJbTE83qgcVyy202YOaUGC17N+33HQI9wKqlYiGsHr5DkyR5bSmH?=
 =?us-ascii?Q?6mDWoLAMDmOw8A+8Zt2CNgKDJfrH6yVTb5G+srJxcEY/xnAfYsGRdb4qbo5e?=
 =?us-ascii?Q?6UcqBchVN2lxRBGDzlcv67foTGYzDasjvdz8AJKWcnUow8aFgNLJ8FoJoOh8?=
 =?us-ascii?Q?oDyL6QDHKi0avUp+CZZ2wQlwfV7A6GdPE3fQVE3wH64FF5CsIM3EgWAwnJ0J?=
 =?us-ascii?Q?2reviTnGYecoBALQKZT6D5Hl8U7qcsqfPqqVy7uvH6JFn9wxGeGoJeq5SN9h?=
 =?us-ascii?Q?GH8cm2KZCd3nxqkLuCPGiWN2orIyqwkrANaVfzlgUhGh12egA4HWK0jvaIqG?=
 =?us-ascii?Q?ka16kNgIllBkPQInAyra3vn5hryIHqktv+vravadRuqrZdqO0xQ60PlKqopC?=
 =?us-ascii?Q?TGgn4jlt4HTDT8qdVQ5HIRldi+RScZMH7cTKrP7jaHXZdgoZrzrO0jhx7I9y?=
 =?us-ascii?Q?vGyZguB2oMD04Y+RgFtBjUdV8Uc4aM/FS2cFZHy4XarteH06jUmh8Im4Er8L?=
 =?us-ascii?Q?ZY0Fs5VNpdUYoP7IzReESRE3q3UfDmvMXry/SuiyfHPL116kLqm0E9mxn/oN?=
 =?us-ascii?Q?QCUoDBXGjbjd4cpauQPJXfqfXtnIHXf6KZXQIbU3MsDzQVzvXM3/5QAyWKyS?=
 =?us-ascii?Q?OuISLTpd0l3oq1NUGZc3VRmGZTcUloKPUQMoVr9UHQX0PJ58jWtAi2geB3rP?=
 =?us-ascii?Q?S60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tneAVmrUG8fvHAIkx+AZ9NlFGBmiC5Cc1NmR5GGPms+a4vnWWD4adOCSiNj/?=
 =?us-ascii?Q?5L7E2vHpgLjLOW2UVSUDpJJwEgjWkmCxoWPvGkNDgVEC7hZnKyKhzWja8lMp?=
 =?us-ascii?Q?VZ3IvzbzedvxwAJ5XsfiwC2T0iCNoyfKHCt/Uq43JyJ49vgaUmG0rp6bcgsv?=
 =?us-ascii?Q?vAdwN2gPuywLANlsY2dRfJmvaZjpsnYEMfSgRaaKwTQIzIdoaN2oBaltPB+1?=
 =?us-ascii?Q?oD0RzUeA3v27TUfeEM5sB7ryDTxKZINEZN7Yigff1y/xjGYq8JAF6pZns8se?=
 =?us-ascii?Q?noxMw0GwC2G1bgILvVSrNpFCJC9l/3lET1zfUQ5zZJPyZijBoWRIrTJ3DYJD?=
 =?us-ascii?Q?hF2gvO65iiVFsBuntGm/diH4vTrHEjqsvvfcXxYd4g5t22i4MX//reh0Ofl2?=
 =?us-ascii?Q?SP1pPkDWpNwYykVMvuiruc6B0Ywbe96UrNw/LnLO7I1HQ3mCNXp+94GdVHlZ?=
 =?us-ascii?Q?rsSpiCng0XngW3wGsDPvoiILc3QawhesFb1TlGjYGv/vIbNgerK7k9XjcSJj?=
 =?us-ascii?Q?zTRRInrry8CpsHctDTIZUl/V6RcuqQZaCSD83i35fFY7n3BXw52qmqHcOu5B?=
 =?us-ascii?Q?g+zacHoXT3AqTIDfZazpoAgo8+WsRc3/y7H1Asia8YqfjtbPGyt2Ux3LdHmJ?=
 =?us-ascii?Q?3gjcYMt1H7FP37d9ZMRVSyhDgyGekBTCNT0iPn+m9V/QgaMHZ+pS0CsViLjI?=
 =?us-ascii?Q?Xwd1fFRV8fYhLi7MSlMObhETu3JyZoPREBNWZQLDJ1pImff8q+LV4JohNTK7?=
 =?us-ascii?Q?PYjc2iP8zWG7U6wNVsLjbfSRKsdIazvQBvNMmeApeX3cb6yN1GN98ksfWZGo?=
 =?us-ascii?Q?pNAuU5ZAPIHhQYLqR+y1KsyOCrWKReQ9pqUHgfVFDxWLUGiTq5kiiY+HSg9D?=
 =?us-ascii?Q?Y/Tl84e1GHp9MZgON3yqFIytUS/TOK0JL6fQs+i1g7apEyWRGsJ5gdrV5Ujd?=
 =?us-ascii?Q?stGD60SxQu9CImc/yR8yGd8/QOUEnR9jK/SfJWGppwn82yJ/aP5OQbnQgUEf?=
 =?us-ascii?Q?cIVP6mClB4P2YTjGzlEyQ+VEYvTSVpt65cl0QYWTursqcLg53Ysr/9Q+L5Ag?=
 =?us-ascii?Q?SCR1u1N6AHZu6LSVNBsXTFKWBrcb4O+aHKiduLX8jzMx1iPukeKPsNVPgdY9?=
 =?us-ascii?Q?54gob6TnOvosp2tWegAxdcDIUdkrhSB7lHxgdwAlYf7DwKLDv7dv8mbFmGMx?=
 =?us-ascii?Q?A9AsRB8Z0ER5m5kpdMZ92G/RDZMdHhxE0nyk6WZT82xj1lLLRWdrdeXybpeI?=
 =?us-ascii?Q?uaXCdvutNumeyLFD8v1aO1nmP41rlWnnapEIl7qB2+tsi1hhrweO8bg2GdjO?=
 =?us-ascii?Q?YHiLMHb/KPfjt8EIEZswzfjsFLdOi/MSlrzhtBN1iXy3EVvwOecrcBsSBcXl?=
 =?us-ascii?Q?0anX9MBEKbdimZ7B7PAuHz8aIWBS4xUdZy625n1Bz2cGESEMEEqv/wL+oOMr?=
 =?us-ascii?Q?LonWhc7SU+4ClhQJ19XwOc24hxzTYSVuR2SKjDCq/Mlk/3gdsQtEt0AkdEl7?=
 =?us-ascii?Q?BR0OeU9CfmYD5mzau7r/8hHHy8doSaGpB2YQGMHPHVY1R979McMhpg9LC0B4?=
 =?us-ascii?Q?tK54Ap+aR19BjRegreZYtR95CmsXXM7OSxQVX074+QdaTQQgyBBaw5/57m8m?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 143aabb2-89a5-4408-bc2d-08dcd1cfb5ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:35:22.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eBFprqGxWEA8uuGlQCnDR0tUq9WLOQd02moIC+bTVJzGwshmQlBBOn/Ek1MXH4IMrl0Sth/s+qnmCe0Cln4mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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

On Tue, Sep 10, 2024 at 07:32:56AM +0530, Vignesh Raman wrote:
> Hi Maintainers,
> 
> On 12/07/24 11:22, Vignesh Raman wrote:
> > Hi Maintainers,
> > 
> > On 28/05/24 12:07, Vignesh Raman wrote:
> > > Hi Maintainers,
> > > 
> > > There are some flaky tests reported for i915 driver testing in
> > > drm-ci for the below boards.
> > > 
> > > *)
> > > # Board Name: asus-C523NA-A20057-coral
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > kms_fb_coherency@memset-crc
> > > 
> > > *)
> > > # Board Name: asus-C436FA-Flip-hatch
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > kms_plane_alpha_blend@constant-alpha-min
> > > 
> > > *)
> > > # Board Name: hp-x360-12b-ca0010nr-n4020-octopus
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > core_hotunplug@unplug-rescan
> > > kms_fb_coherency@memset-crc
> > > 
> > > *)
> > > # Board Name: hp-x360-14-G1-sona
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > prime_busy@hang
> > > 
> > > *)
> > > # Board Name: dell-latitude-5400-8665U-sarien
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > kms_pm_rpm@modeset-lpsp-stress
> > > 
> > > *)
> > > # Board Name: asus-C433TA-AJ0005-rammus
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > i915_hangman@engine-engine-error
> > > i915_hangman@gt-engine-hang
> > > kms_async_flips@crc
> > > kms_universal_plane@cursor-fb-leak
> > > 
> > > Will add these tests in,
> > > drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> > > drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
> > > drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> > > drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> > > drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
> > > drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70
> > > 
> > > Please could you have a look at these test results and let us know
> > > if you need more information. Thank you.
> > 
> > There are some flaky tests reported for i915 driver testing in drm-ci
> > with the recent IGT uprev in drm-ci (https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)
> > 
> > *)
> > # Board Name: asus-C433TA-AJ0005-rammus
> > # Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
> > # Failure Rate: 50
> > # IGT Version: 1.28-gf13702b8e
> > # Linux Version: 6.10.0-rc5
> > kms_sysfs_edid_timing
> > i915_hangman@engine-engine-hang
> > kms_pm_rpm@modeset-lpsp-stress
> > 
> > *)
> > # Board Name: asus-C436FA-Flip-hatch
> > # Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
> > # Failure Rate: 50
> > # IGT Version: 1.28-gf13702b8e
> > # Linux Version: 6.10.0-rc5
> > kms_atomic_transition@plane-all-modeset-transition-internal-panels
> > 
> > The expectation files have been updated with these tests,
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> > 
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> 
> There are some flaky tests reported for i915 driver testing in drm-ci with
> the recent IGT uprev in drm-ci.
> 
> *)
> # Board Name: asus-C433TA-AJ0005-rammus
> # Failure Rate: 50
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc2
> kms_pm_rpm@drm-resources-equal
> 
> *)
> # Board Name: asus-C523NA-A20057-coral
> # Failure Rate: 100
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc2
> kms_universal_plane@cursor-fb-leak
> 
> *)
> # Board Name: asus-C436FA-Flip-hatch
> # Failure Rate: 100
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc2
> kms_plane_alpha_blend@constant-alpha-min
> 
> # Board Name: asus-C436FA-Flip-hatch
> # Failure Rate: 50
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc2
> kms_async_flips@crc
> 
> The expectation files have been updated with these tests,
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> 
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
> 
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> 
> Please could you have a look at these test results and let us know if you
> need more information. Thank you.

Hi Vignesh,

Where are exactly the logs? Any gitlab/issue reported for each case?

Getting this for instance:

# Board Name: asus-C436FA-Flip-hatch
# Failure Rate: 100
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_plane_alpha_blend@constant-alpha-min

Looking to drm-tip CI:
https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=constant-alpha-min

it doesn't look like a 100% failure there.

Also, nothing special on 6.11.0-rc2 that could trigger that I'm afraid.

So, it would be good to have real individual bug reports [1] for each case
and some help on bisecting the commit level as well.

So, with more information we might get more attention to help these cases.
Otherwise I believe this list will just grow without a proper plan to move
back to the basic test list.

Thanks,
Rodrigo.

[1] - https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

> 
> Regards,
> Vignesh
