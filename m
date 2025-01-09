Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9D5A081FD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 22:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F9110E392;
	Thu,  9 Jan 2025 21:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HV5ogA08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92DD10E10B;
 Thu,  9 Jan 2025 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736457067; x=1767993067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S91ysM4Lt7SjaXdOkXizbrOZT23YvLWjX2JrgEqMksM=;
 b=HV5ogA08WX2vOoCVlPawdGVrDBSAXVgmysRQBRkW7XvL4xtV0HjlB27n
 cjgO0F+vcTwJIzJNrll+5lzhmCbQAtdrZZKfjiUswlcyOgT2vv90z2XPc
 mZXsbdicPAUtSkLZH3m8auCzh4+21KJpt/Zn5/KvsaP/65GRfMZqtiLAK
 tcBDos8pJuTY4pkpLEq+tQQqWem0MUeEUoltf90wi6prbXhsWKjLSNzrX
 +xkH5gZLsZ1v7FdtbPQczxBxNSczLqEfD2Vg82xWix/2y179jSHI2dXWf
 mS3FqqRxs8ehSf1Nq1yut47hxj2Eb5ZwNrbnLT84L3ti2AOYqV4FWVEP/ g==;
X-CSE-ConnectionGUID: uAf5FfPORdGbi0qhstA/Yg==
X-CSE-MsgGUID: h3b2taxTS3ChJ4UDngPiUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36898823"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36898823"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 13:10:39 -0800
X-CSE-ConnectionGUID: wsObGL7NRwqbn4RU5Dp3RA==
X-CSE-MsgGUID: k0S1JV/CSvyzTXYXr0U16Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="108436408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 13:10:38 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 13:10:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 13:10:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 13:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjcyzIahO95vW1H3NNMreHdSDRf3Plwmbxz3rEWUOVSAA0HElk7ocZRcIt1dR/sLVN4aAK0xtRDV2zHSwmQ/TiPb48si3G/VAssre0NsJweGV4L2NdCMnX55AiN3ubcPXU+6RKk63InXim1+D0r3YycJfwSl0cmfuXC1jyD8yU6DOOqXl068STBNZWh/Pn/K1Jd5NeWBbHoV1dyDXFjdpNaS5KMbw4oVqCUPLUUFqdZ/4MObCcW/gQx2265O47L0SMi6IhB6UVDboLPUCvvDSyfRa7AiCg8qxaFz/XhoGF0ACT4NYQ9Ck0/4osBCyGlYLsKWrtJkdytnx4syVXHoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URbIv9Bc+nmkQhj0eRssnggIQymDmfN3dZxPdbh1fi8=;
 b=TDEPje8URQisAwUo0vyIVn6DRCdJPuhQzU7MSweGZO4ovPT0Wo1zvarWDwVEH60YgcP9jNFPYhGMLQq4yTikoTdgp8kWGoLm3PA/jUCtu1P0lcxpCg99hWg4LvgMq/Iao+eBZ1BmFsW5IV+DZsvgptm3aosZ8unYx2qBZh29QlsjyBR9G3SKnvoclgAybyUeYi7i5cfMtSOBwdbfLb6LXqOVEWVAtuRt5B9aDRguITcb0GtU0+epBt+A0dc+KivwiAqGaf9n0so2bzDYlPAFVXuNhViuNAvmB2Y9M+vuD/7ApfHjPlBbVtPtQp8/BC2yYOWSpLpbiCEnoG/m1sec4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 21:10:28 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 21:10:28 +0000
Date: Thu, 9 Jan 2025 16:10:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
CC: "Dr. David Alan Gilbert" <linux@treblig.org>, <zhi.wang.linux@gmail.com>, 
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding
Message-ID: <Z4A7QDtTrU6w2Yhv@intel.com>
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey> <Z3uGjO36tfhQsnfp@dell-wzy>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z3uGjO36tfhQsnfp@dell-wzy>
X-ClientProxiedBy: MW4PR04CA0124.namprd04.prod.outlook.com
 (2603:10b6:303:84::9) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1300d7-889f-41cf-2e31-08dd30f20ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rq4s6E6yp8+fo+Et5snYrK79+8W+N6in/JK6GGo+o6UtaL8/TxkM4jWPQVTn?=
 =?us-ascii?Q?2c1W10zIX2d60baqbk4sZFeXR6hAeJn3TDcOhNMyMBO/o46DkEvx4eWFUHcR?=
 =?us-ascii?Q?F5ggzA21X/r3Xei97M/c90MwPmh3Xu8onHFBFxRgHNe9XLGBmUNyWU8N6ANl?=
 =?us-ascii?Q?Ce4bQPnhNd9Rune8/2r5+ro4NOWcIDivtfuC2U7jdHu7vDhM8czaxt7wVBCz?=
 =?us-ascii?Q?udjNqLDu14DptJ/u03UH0mIS2auQPgc4C+rXQr3PcP4nj356ggmmV6YbGCyz?=
 =?us-ascii?Q?wGUTcwGLbqb+aal5FeSCEHyn+6sE0wUkL1Sw7rLupgvCbSxEoyFkXP11nPef?=
 =?us-ascii?Q?CwPA1n85Jva/1ohzKM9e3ep0Xj5jfFTRA+qyRFjG31uY5GOidEz2oVW/TczK?=
 =?us-ascii?Q?npb8kWPzaRoRX+ARmpBcpVTFMO9j16v4boFhL0GFshZkZ+BVw0gcpWwrX+6W?=
 =?us-ascii?Q?wmnYzAwRfIH/NOnXLCij8xHZIQyt9PUbRT3CowOpV7+4jrD6WAVXw6Cl0rOu?=
 =?us-ascii?Q?pE6kAXnTRs+ByzPGsNJjFrvR9Z07gOVstftQJ6yC8Xj1Mrx2NeoGG36Rs2fU?=
 =?us-ascii?Q?qe1m00fyxQB/L07jQbjbnnbtzN2YhLclpeCSOwozkxjI0spe+75lWS+nJkJq?=
 =?us-ascii?Q?/mEdtb4NRxPsXUDOvM7Bu/zDX6G7lUNP7dGkayAQqDeMY1jPhFgLHfr73j5A?=
 =?us-ascii?Q?Mo5EbxNPbSLGyZoVW6YrLEH75pIdCoOPbiylaH+MeRtJn3Ol9mtfMfzC0fdg?=
 =?us-ascii?Q?t4vVKhpI2hUaEmcjXFPfWrQJX8QIZs/TvQp8XRfzxUkN4urU6eb1xD5yXioC?=
 =?us-ascii?Q?Eri2TjymHgU3u5dGoZpPhpXme5k5SAhRG+S8lruaAo2p29N0OD8zmRrmah6s?=
 =?us-ascii?Q?SidnpQt9s71HpZey2pPKiShoWf+D+L5q+k6GCmNIMRn6jsTtl2x4HIP0RIbq?=
 =?us-ascii?Q?OxYckKA6/SmnvrBYdmzXqMXs7/KHhzZXNBlFDC/wL44bTrQ6/DjMA4p/k6Fp?=
 =?us-ascii?Q?w2P31qUoYoliT6tHVAc2muZibd58vPiPR8RJBAS6DkpMp5TujMb91R762IpW?=
 =?us-ascii?Q?Vjid3e08ckldt1/2dHjqnrnZO0XkhwpODLwhOOpdSSY9NlAobF1kDjdxHVs2?=
 =?us-ascii?Q?3BvW4cvxAGCO7XQ+b9fo0xpCmXxuY0LHRn9RlIBNYf+WbwtCw/uOnAE2R5X+?=
 =?us-ascii?Q?D1wmjRuB318HMhfu+ZePjulkXprMd4DHZXaTgdLA0D4JS30lyafq5VNTFPtK?=
 =?us-ascii?Q?tcEtSsriwlWHPBw9oBoeZLsJNLP1M0bDL/AUfknE8sYz4KfB4yd3WX0V6i0c?=
 =?us-ascii?Q?jFwu+3TWYSFP1ZbJ4ww/sRfjVpRDCYynx/oax2a62hpbZzLkh2szjSbZ3ffI?=
 =?us-ascii?Q?sksB7Z5T8oM53S6heEByNDBTudVt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZxZOZsaOhLTV1j8Ru9EvnM9fGZjHk/+Mpy0sO/BVDe7KgQvOaQnD8uuETzV?=
 =?us-ascii?Q?eRCje2LM4r25Ig7v9ZMcrZIp6CkGKEoxxOmsh6cn2+5XOg37+E9kFFt26q/d?=
 =?us-ascii?Q?fXYbDltkjqDO7Es8Kvre/b/Z2nxuM2pZqBbLBmUuL0Nzqmea35zlONtFYNZk?=
 =?us-ascii?Q?L9St5wV9Icp4/Wev/373yYINqicCyIKIY98p4o4Zrn5TpdT95xu4tVnDK4n3?=
 =?us-ascii?Q?htKwe+5nyJB7pN1fG+or2LJtvHzoZk8KuyALsA2qf7NjQsJQadyAdT+QJLlV?=
 =?us-ascii?Q?lk7jkHoDuNW3H9iQpiLoCFGvV0Vkr4RirOwaq87L4Qa/AhGEo6u5HqG2MBMU?=
 =?us-ascii?Q?RLUZqsjOL3qeW4tiFNE3EYoOnbscbm8NLeith/G2daz37YHVUHImUFkLypmw?=
 =?us-ascii?Q?YYWTGCmj2p9p3P4A+az3X/Oz6QvCBoChA9NkkjF4cPHq93yd17R5gDwlB1U4?=
 =?us-ascii?Q?0CfVU+H0WC6PmTUPLjpn7zvqlq2oUoCNKM9qcTiWP3QAJWQkNjgUdVOGbzDG?=
 =?us-ascii?Q?cOMp2URohGI+8kk3BkSJxCd9OB7EAG2OZxot6Jdr9M2qFjIO0LnuQP45e2Yp?=
 =?us-ascii?Q?AqSIOkbaH8lNoQlYEqJHdD1b/A1h3t8ADwg+bIVqa3qqdZEyIjh+Z9nFeo7A?=
 =?us-ascii?Q?EBylIsLjt0iTpEcc2ROLOEVYp+TGb8rhZ22/tqP4QP2le1CpCQoa/IDqJGuQ?=
 =?us-ascii?Q?P49U+prRTckOHHQKjxJWD/e5gn/HtGQ5KldVIbbbKGx91PFUrYWCxioR0iqs?=
 =?us-ascii?Q?+LnUGtdLKZv7jzwGuc/r4Wd8Ear/0+u/+QT3P9u1slCEdPlrJf3sNCdNAUjw?=
 =?us-ascii?Q?ii0PORLzdsx0cMEiS6Cwi9gAcqcfegugAlKrrQeYZj3H0wav6nXiAz3tYbjT?=
 =?us-ascii?Q?3jRsIBrR6QWxIw7oguIWtR5tTwMm0SnJeMDUgVmM4Q/W2GgwvXWz/alnREi7?=
 =?us-ascii?Q?Ih+EMvjKmSwcYDLXHu53S2S4/1QEyh5yVdPei4caBJ5Tw+p6WokZRbsPDIxT?=
 =?us-ascii?Q?YQ9I+U1SAMUSaHd62DSvkkwanRs+UIp+MQQyBOGw7w0JTaXqY4k78skobIb6?=
 =?us-ascii?Q?h+UUlSMEqTQ5mlLX6IFIqsxJoZ6ePX7BsBNbLdLtdLXjXUfNISan0Mam7VgE?=
 =?us-ascii?Q?vNiq9GoyWRJpJXvFrVuJcpQYltYugCMv2SSxDM6swit4hirK149w8RTqCTxk?=
 =?us-ascii?Q?95EypEipFpHEbIR6dE9Qjfb+QHMf9zpQRvxkOdEAw++eIzynUME7I7Yc5eyU?=
 =?us-ascii?Q?Q2s0Q3MkuKdru0NFDe3P84+9uvj+fILEZNXKEFYyLt2EhPciKeLuxuPY2AqY?=
 =?us-ascii?Q?lLU4I0JGpfVrxE/E3xhCVJbc/4Y7Vm+ifJl07+XX7/iJDZV73IuYAkG/eVOn?=
 =?us-ascii?Q?lIAN/zGlWTKDaemFR8pYjh4OFlhWeU7oetuziQiM6lZqU6GEeq8CqA4/TPhj?=
 =?us-ascii?Q?oMm8ztgpbxbwKRoqQV350549UMJ9qLvO+DKkpY4d0z3lwGkJi45GhflDfAJL?=
 =?us-ascii?Q?tKwcnN9eNtbu2UeEDkZ96cZm0sr2UsbXT/s4Orv2n/7W58xgD0eim0qFE6GE?=
 =?us-ascii?Q?rN5K7as4rM0ZpJqg5azm0CL+m5NVODT9uTXkbBwm+zb+KL5W2epa7YpP4dhX?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1300d7-889f-41cf-2e31-08dd30f20ace
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 21:10:28.0156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sZM1Nla+oBOCnKo6BQZY4IkfHWx82kEaJM1lSRGTWMJlkoesfTFdfNaCHFP/ruzGiOc7IK93zRBdspm8K6/NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
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

On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:
> On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert wrote:
> > Note: zhenyuw@linux.intel.com's address bounces:
> > 
> 
> yeah, I've left Intel so can't use that box any more, looks Rodrigo hasn't
> queue up my address change patch yet. Rodrigo?

pushed to drm-intel-next now, although I was assuming this to come
on a gvt pull request...

what about this patch here? coming in a PR or should I take this
directly at drm-intel-next as well?

Thanks,
Rodrigo.
