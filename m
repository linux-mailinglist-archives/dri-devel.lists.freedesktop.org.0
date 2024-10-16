Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48539A00F3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 07:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF46810E67A;
	Wed, 16 Oct 2024 05:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrIrR7an";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF210E67A;
 Wed, 16 Oct 2024 05:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729057828; x=1760593828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3a48kjwV7utaolIcxVNGj7HAaGUgcYWs+Yk62oFyyQI=;
 b=QrIrR7anuXrTFaU+6kHCgNnW1DA3der0RUs7k4yRiDLVPUMl67ZLl/Qt
 EkHFyqrkebjO8FKS6TN3Y+q3IFZHg5lvz40SJkZYZwfj2XS0BSiTq/WZI
 B31BflC8WunHjBjxD/GP00NG2P2jIGfTQig+xs6hePOxIbai2qHRG18cd
 /gsUmL6y02G3LxpOc9XmPV8fI9JejKUIpU5lGWKunYpfj1VA8WQPhy1BI
 xCDNmuKeXbYEWWLNG5DdYepu1yOoJdehi1BFlAzD5jt/v4Lw3EG1fOLcN
 YIUfKXHsdeXB8Ejly3EgvBIm9gQR/bb9TnQkM5DZAP/cM8M0xexC5PnP3 w==;
X-CSE-ConnectionGUID: GimifyIeTZSQHOfS7V7+Iw==
X-CSE-MsgGUID: YomPaVvgRqyZ8IHjf1XhwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32287609"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="32287609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 22:50:28 -0700
X-CSE-ConnectionGUID: 7hPCB7I2SPqPxmhup+LciQ==
X-CSE-MsgGUID: RavAm/68QEGH9ea+eOcNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="108862311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 22:50:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 22:50:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 22:50:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 22:50:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPJgdZw16M2fH02vU4AGdcjk2x/TfqlgNer7NLhnQn1ZpPddlBXHPWE1obkdkmFn8piIccbBstBQf3jvWbe4+9ZaznsvDa8WBL4WLnKvsNzE1v3VlwPgTICyti2eSVWGn6cGLhg7bRukR8sjMUCawOpL87G2VCzDDibKdx/zbu+HXV83+Msrwp+JUDBJ2br2nvY+fErHoXsOJ1yfa5NYC9paUomxeNlGgSPhAc6Us9G6kQlL/tEdDi09rIeisLboUJpS2gO6JlN03/QxRqWfFKm8lZbKvWmtAc4DvksxkkpIRTqclC6dL6PKMp2ykyeBOd2jiYRKAIEZOS6lcgN5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/7ZrZg8Q2PxuVcwaYh/JuebrrMN00BEtUDhu/6US+Q=;
 b=kqonVtnnc8SIcPBn8JasvgEcZveRud62RLaLGJN7hVIRik4fBrVtULrjyJ97IXkwTJS+CrTF9BxH+am20VwbaH0S79SxiJBzNg974Qm5ajrwwaHLo21pnITkm2A/IwaeMkRYL/BHzwAVTpvkXSlku4io7keCuY2jI1qBM4mOSq97KJBRk4T0eupPj7AUwDTOYz4OZ/jgFt94Sp2F/4RH8YbHTzP4rsNaSjfKN41uQ7QXOqRfDZej733NDp+srW5DiR8xdfqPMIVWQDWew2BeCt/gElRnBMOI6QIwxivi4YpHYJo6b/vWy59yMJcvZeNeiXAxMgNLgXFr8oS0pZ9kJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 05:50:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 05:50:23 +0000
Date: Wed, 16 Oct 2024 13:50:12 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
CC: Christian Brauner <brauner@kernel.org>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-fsdevel@vger.kernel.org>,
 <ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
 <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [fs]  d91ea8195e:
 stress-ng.ring-pipe.ops_per_sec -5.1% regression
 (stress-ng.ring-pipe.pipe_read+write_calls_per_sec 7.3% improvement)
Message-ID: <Zw9UFJdFq8B0KAO1@xsang-OptiPlex-9020>
References: <202410151611.f4cd71f2-oliver.sang@intel.com>
 <20241016022532.GC1138@sol.localdomain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241016022532.GC1138@sol.localdomain>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BY1PR11MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: dffb5fd2-9784-4e6b-9c2d-08dceda66d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CF8dbGnw2lQGo7hftSa+WN66l3OhwRxUBi4rzeWjS5nkvk+TlKCI8e9srMmL?=
 =?us-ascii?Q?6KNK5jsyB/pWCNqII8Xg7WEhPf2UhCOo9Awr19XB+wmoQOe/XO3RY5oprovP?=
 =?us-ascii?Q?S6AOB7UXJgjgZZ8nByLz2RwqJdQgj34/ikUeQM91NFcznMaiuWAN20lnSd7P?=
 =?us-ascii?Q?xMk+J5hgwb6Jxecq5ZGU2byo50fWzDUnEdUsmLdIufulgBBWI6q13TGPivKP?=
 =?us-ascii?Q?ts9EIZTLxLq489m5zrsbkiUwsPeVh93JKKXrq/W5FHEjV2L9LvVlGHIVa35U?=
 =?us-ascii?Q?Abm9H6BTcwzDjPT4Q4aI4s1T4/91et4LvSyKMG+W3LOefPPbWrao31jWsTZT?=
 =?us-ascii?Q?XS8zCxChhkAM3OHBhOMbzyaieolRZyDZTrbjXRuMgZzAWwecwf047uQV9d2P?=
 =?us-ascii?Q?XJQK2ZwkWd+iK9eel1yypS6izoGacEPJPmqcZaDS2jJQN30sDB1gn9ijluqi?=
 =?us-ascii?Q?mwym+z2ScYshGvUQKfKwlwBbwJB578oPxvgoLpMolGPzgadn7JL4nEVG7nVr?=
 =?us-ascii?Q?HL4rmWFe6KThzYwWdSqYgwt+pWHiddEyU1/IXJLPubOHruzPmvQ/dTAoVK/Q?=
 =?us-ascii?Q?apTuGCsm0QGzkWLFiuryOAICVYYCajkTbCwzkzwSPnTdZEq9Kw5aVIvuxciL?=
 =?us-ascii?Q?eRYt5kTKNkBPwG2JlY+h5CQH4iyOAx3F+dVkRvjaPqTDKGktmTfFJrZf+drt?=
 =?us-ascii?Q?1GCIH1M54YQGuRCMcVym2UU7O7k2K8f/lxp58S0+RHCW+5nQotYS0ZVEFU0F?=
 =?us-ascii?Q?pAt9M6ysWzKQdD/oQKxLI5ovnYY9mA2gJFeWzU73DGM0xJT0vA8AJT7N3i1B?=
 =?us-ascii?Q?d8vhQBb7Iu/OYOOXyYWZ39mxbqbpzZBkmmM4SXdPJST4pYcaml6CZ7yfEMnu?=
 =?us-ascii?Q?Q26qK75vPZ/gFbnlFotbZZjQ6H+6Nr+xJXOk3CKHOr3bKmZwJJxieLCwM0uj?=
 =?us-ascii?Q?HXkuOtcjqeE8CQa07ppTPd4mJnw8+7QunDUjrQI5mxoNNkqPw6Op42MN3K8t?=
 =?us-ascii?Q?nj/JnOToXb1waa/g27HbIg7DEC5HtDmoU8JFwubypITQEfzE+ryOPo6cEOD8?=
 =?us-ascii?Q?rZ5jNj666aHDe+HYkD1+fGO/mPmtIRYCUsSb0kgahjXOzE0QetUC8XZTKlq1?=
 =?us-ascii?Q?Sgascr0CRRZaUQZiCtpCt0ebzf834iXZG5M8jIWBLhDtq0cGfhMp2kguH0QJ?=
 =?us-ascii?Q?r8lrpCOH8bt60a3Q0ukBJgPjyr3gjCyobMKO7ebRoU2gNDMrt7kWkPbBwM++?=
 =?us-ascii?Q?iPK/QAw1bdku/meH7pZRgJ3ch9dNegnQFP+bB5p06A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gYEiSMtRGsQyqA3YEyh14i/z6S4lYnMO4TsFxmP4PckM0YIssKw3fOjyxgDI?=
 =?us-ascii?Q?bL3XX4wC1f0YlwqZ5hnqfpdhNzqWIJkOMNRRqMZtatD0y5qFRsbxxA+TFJ/G?=
 =?us-ascii?Q?+OOLb8MzJh1W67eihVR8DZKWzEobYn6tiEO/8iatOpNd2cTtOBkRKEpiHVXM?=
 =?us-ascii?Q?cUqqKfoBgIZ4RNBDTshKGBYVHHG4P6XpQhbSYRHTBize6qrrSZqOcglBnUaY?=
 =?us-ascii?Q?g9I51EShZKIaQlysL0LzmTl++WOfsnVgdHwVv4EADFBPx6CMOETk3w/h5Uhs?=
 =?us-ascii?Q?+JhXDsLmjXTbKmZOh5hWjzLUSL+UKAQPSIKYUWAsT94jYTd8qGdXq/f1gY1T?=
 =?us-ascii?Q?FZ7t1fP9K+ptDhKVUnwyrwqgb/YQJYkm/cEXh8adHnAXtuFD6GwzIRiHbhUU?=
 =?us-ascii?Q?d2LkiOakLUW+oedLiGaSzCSNOtucfk50Cd25VKGeHllKv8MG+hoxoj4WOaaQ?=
 =?us-ascii?Q?AH9LJ6SkVDj5LLTJ6gxdFPdTjw1phZogu87g1wthD7MdpR8gT31a0ubQ9L1y?=
 =?us-ascii?Q?WU8cv1zo30tctpCrO8yIRaNSKa00SaFLbzhQnx0EI2kGn+2KfGbJIv0PZ7qo?=
 =?us-ascii?Q?8Faj7nZ0An2l2ip2aKNvmvjnWkIoFIrMRamWKrv7qEJbg0CmJ9e1+7/WDVF1?=
 =?us-ascii?Q?L+YdocyG2vyllIvlumn39u8OahFRQa9zFtASMnZe7+3BpTETqTkF0X+Kntdm?=
 =?us-ascii?Q?9yhrL3OqZwDGaPlcgxiK2M9rfyiMdPMaliPwbBWk8+3UAdLDBXYnnaoYO2GO?=
 =?us-ascii?Q?C8EOyZSotlkg1/jHhAozhy54eUIyd6v7mzynlNGVdesQSJRnxZkaRORcZFcU?=
 =?us-ascii?Q?M8sLFwFeNcliool/keXScTjDq7EhK7kJWp2dpkPwSiRbOswT8okuRUjV5sLG?=
 =?us-ascii?Q?zY74i6YN7zBszubGBhnFl3tL5JIttQKJMev7lMfvEVXj9RX4yp3BJgwnF/IM?=
 =?us-ascii?Q?iv3CeHneIDKxz8Q8KPFscyd5mrnl+Kk4OldvGziLT9PBh1uh+WWjrEmuDJkQ?=
 =?us-ascii?Q?Dcgz7Jr7pPAjfrK81TbDbkFewR54IBdF8yuvRFRlx54lBDC/4nN4v+xHaxBG?=
 =?us-ascii?Q?WLFwr3+JBaIP0p05TPyIysWE1h7NqDq4dgLgtiWDIWIj/cBblJvCb9ZGS2oG?=
 =?us-ascii?Q?gkdyNO2DmJmqNXEinA6oHZ60i+fZfLfp+t+t3UBN+m2Iz+e02jk2buuny+Xo?=
 =?us-ascii?Q?Mz+WOi1k4nqiQO8UsEkiiNgbDUarj/TVoYnVAREPei9cETIFvBcwZfDZGK3o?=
 =?us-ascii?Q?qF66H6WPsj75nT37dJ/Sx4Ed0U0OUQIMJDCpW6ALZEB/1/Wo/RTbasvZ8gmG?=
 =?us-ascii?Q?jyEPPwlOA751RBhJFZz6xtZxo5SDkdzM4BtzMqCsKXB1jWXOTKo/9Jbal/Lk?=
 =?us-ascii?Q?/8YmkmOLrZjXxPLf/4655qLw7cDQikje1DWd7SrcYyDMoD2/JxGi9VP7Tq57?=
 =?us-ascii?Q?uSq2/HAHxs3zjMeL9tHS6AIoq6lVwTLjl/hCwOiMLf21B+/bWfaDgzlosveU?=
 =?us-ascii?Q?SAQA48THhEKLNXVSwuIkYELWJ3dr1SmK0gsXFek8P4+KFAmlYy0GB5Dt9IRt?=
 =?us-ascii?Q?KQ4IVgolsDN8bzcf/k78/TF+3A77eD8e1rAdYxsdgAky7lSCZwqtWZ0WY97J?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dffb5fd2-9784-4e6b-9c2d-08dceda66d09
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 05:50:23.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MI3bN1R71fJHTmYubaLLgAWPOvExlCcTF/qN0GRBb291GSStKOO4/Av8/QwD9PmCIs01MHfKO2niSaynXGKsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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

hi, Eric,

On Tue, Oct 15, 2024 at 07:25:32PM -0700, Eric Biggers wrote:
> On Wed, Oct 16, 2024 at 10:19:25AM +0800, kernel test robot wrote:
> > kernel test robot noticed a -5.1% regression of stress-ng.ring-pipe.ops_per_sec
> 
> These emails that talk about negative regressions keep confusing me.  A negative
> regression would be an improvement.  But that is not actually what is meant.
> 
> Wondering if the wording can be fixed to remove the minus sign.

thanks for suggestion! we will refine wording in the future.

> 
> - Eric
> 
