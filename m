Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9C576EF8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607D610FBCE;
	Sat, 16 Jul 2022 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E6F10E153;
 Fri, 15 Jul 2022 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657920822; x=1689456822;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YUQOtcAINVp3CVTiky2bllghjNtDat5EK9ciYrx56h0=;
 b=P2dnM1IaScx4hKtCmFiB+NRPB73E/t7bz44T2IW/VTlc4RPJ34q0kdoj
 VKAiSwQw59psWIVz5vNX8JqHhaPrNUIu16MmnKwcHAtOpNsG1IAytFpEr
 l4b3LvU9AmWVYyAHXTqpHMZfDNVfeeFmMC48wztKxxViHPFzL6LnS+/Ef
 qsD5KARUJCyXfiuknISjc5MTqG2w9UEBvrEIJi0KDql/DE50arx+KGT+u
 KynhX1C6NSubt/PXG1pf/y/3E1zYsfna+R7O+53tgw68dhy1BkcCfLnoa
 xu08OPlOjaUwPVPrBq9LQ9RelUbM8yNMAP8nVxw+tjio3tG9EEMwpXj6S Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="287044478"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="287044478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="546805209"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 15 Jul 2022 14:33:41 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:33:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:33:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp+y+nWfSWALlMmRwScPfC7v0nY05xPNe6BfUUmd9apCwLh75xcgpzqgTgKHhUjBlje9fSPHuKESnpav+pf1fGg1GBcIPyBWyIHpykOPfSuM/0TjXtxqVmlki9FZM/K4JR3CDcQAjrM2XI2Xos9rGdNnP+VgUTRcxcB5qpTne+W4eb/MNTOBCtVEG7rx+QR7b4vcZcc5R/BIhCYUwOMMOJRFocVl+3v2baUJBqDyU3xtGShtJOZ+HBSYp+6b0TyBR0IdZXvG3OFyORZ9KJJUr3W7xZtb3A4jByFHDa+QehQJIG1KbCf/XQfMgK44hlhSkHljVVYajBNHnGChJWfueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdb8iTH4JsP8nxdZZdE568QX1CQgh9d3TmO14BAKGQw=;
 b=PEZqn+LcRwEXv/lrgQhRlINLMSjFj0wFVsahctElOqulkWjd4ScitatQ0oC3Ku7syK/7VJwnIxe+tfYwrwY67lQ4tFiWODo++ZktiB7wBqK7bf3Imk1tuuHSqWUC97+0LnxjSWLzU9e5BQOBpthIscHQOLDpyP0lKulj9oTqVeJirLFIxiIYgv5h2nSlrsSmgYJdwrsmNBYCW88SG1DkXqn/DNTyD55yoMnj2pydyShVoMOx9lwQsi2Xj5njqTGS4YYm5sjwqhE4TRDnc4m8gTOrEpW1heV28eskaFm2Ajh1/YM6XaKKwJD5eIiZ7IE7qkOSeqAMHVPGFmpMx0I21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BYAPR11MB3016.namprd11.prod.outlook.com (2603:10b6:a03:81::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Fri, 15 Jul
 2022 21:33:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:33:39 +0000
Date: Fri, 15 Jul 2022 17:33:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 27/39] drm/i915: i915_scatterlist.h: fix some
 kernel-doc markups
Message-ID: <YtHdL+Q3anh7o7QI@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <a8448975d949b77379939e11ccbb794d8fcbeee7.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a8448975d949b77379939e11ccbb794d8fcbeee7.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR06CA0046.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 745adbcf-2a9e-4b4b-e4e1-08da66a9ae97
X-MS-TrafficTypeDiagnostic: BYAPR11MB3016:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cS6EY+e71xsL/fw4TdcmBqPFkmrSQkoq3jtHP+SdyEYLE0hYMd4x7DcB78RKUN+BdMmjxoCyRzOOznV7nR3zionDHj9wgOEuIYrlMidO6pBYFG1fLzX+PjufzHx01zWOhvaIv6PdZ8NReMAF66/h8mJ4ucodAujVDmms1yFbvbZObPkAa6W/uwqZMU4d/myzLPL6o/IVqFM/KpaEI2qzIXhs5bFwM7FUDoB/dcqvBEWsOlUBhl4GEC1bxoKRmKCH26qyvey53ZN2STkwWBdKchzcDxf86fKhzrCVnTpN1flM+6ZIOd0kh1btUxt5jQpDcTYi2oEk9cbB0mdWnmJlGA36Jwl+HJrH/L3dhev9Em4GQ+QRf3DeiQb6xImD+EZwvAdwUjbfJq4+Sq2TI192PuAZIEYdchOnq6Wy0r42CCzy8t2wKQasgszHH6pt85S0rw3v//dq0iqxwYDvL7LpbmwJdMFJNveKxBWGGbwN6BdSTC3Z9ZpNi3tZ4HPcmeifGwnX//l4XwxX8LC8EQklXwrOqP7gthRlZdNk+mN3uoVAuxrRRZE4dRvX+W5Y9CkS5TbuE3MX74WN/DsLqGNvwurnypN7Lp/tuafRs325HUVpv1r823TEf+q2WtD1jigU7LaeWhvpSItY3AYJGGCiS/p/222tteei2MZcWMMp9DFJzcW3Y5xcdZGiMFvhWgGSwVG8Z5CqKzg+aD7cXPap9Btjb+kaLuXDPs6Dm+x4MOinBlo3Q8K27hv3zV1/lOIEUGIyKB7hiNdEiknuSTH3CMtO9ic769rTdc3DCQr4GvD6+M3Nw/1PsvN2Fxo9Gi68W1xaEtjKYdQhzq4BxOnopw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(346002)(396003)(39860400002)(26005)(66946007)(44832011)(83380400001)(186003)(2616005)(2906002)(6486002)(478600001)(66476007)(6506007)(6512007)(8676002)(38100700002)(66556008)(5660300002)(86362001)(54906003)(82960400001)(8936002)(6666004)(316002)(4326008)(966005)(36756003)(6916009)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1kRwx8lcr+2IU+oERf9XmytEpsHN9nCSfM4uZv0DeJj/o1HKpNyq8po1/fTc?=
 =?us-ascii?Q?qTQUrFNuW+klmqI9K5/D9aNBn8Iffl2M0kI/P/h3Ot4Kg3L0tE2Ekdl7CPOD?=
 =?us-ascii?Q?kgaA3uYmw8SpT+GeDoPWzzgyp5Ei+VoPvS7qrvMo+NKbKamXqFvdqjZAzoyQ?=
 =?us-ascii?Q?rfo7JouNIpTQWorcpQg4l9NyjQkmju1/BebwI3xvVukS7aQkOdeihWSBKeva?=
 =?us-ascii?Q?QFVpdt0a+ni1DFFckRwVM8y5VQhjFLc049DiiZyP8Jb0BtuW5wgrowCCRSIT?=
 =?us-ascii?Q?195xxo41Y7QkswTbVyLAWiTNsVefFD2Bhz/S3L1RwcCctVZEWEXuffC7MXvU?=
 =?us-ascii?Q?8zhDM9CJjUgRhbbPPpWw9wTgFk0QaEzGzldeD4JKJgsDVSJapodZkx5Bb9Sb?=
 =?us-ascii?Q?q30C5n2p6H9Ij067pDTIiZXshDOsYtOGboNKwSWa4RKf//murMzdNXku9W67?=
 =?us-ascii?Q?iIYZRetD6UDVyzxIrcHOh55zcnFk6NR4e8omVLely9vxnrL+Hb6UnMZuJrEc?=
 =?us-ascii?Q?j5MetipUUhKSbN8i0FWgnAtseW46qqAqG9bcVWGWHDo7qvFnrpAzp5FTJBnP?=
 =?us-ascii?Q?qXge2Gyiu1IWJeBpVKP7SC5uDPJrmOr3eT5qahSl9xSfZdJ4X1DokkPmusKG?=
 =?us-ascii?Q?+wzjexEZhAP6JyqZ2F/bt1pZgcX0G6AQubOGcyfbKCRkapA74WGHt5iX3ARN?=
 =?us-ascii?Q?lA/VZZcEzKkRILdq5+V/Wrj1npY0XfOy5npAqLpQY3/ORMcBTtzji371NW1R?=
 =?us-ascii?Q?JOuC0LAh5OyRH5Pjgg2Nqz3e4ax2U5ATcsMtkcDIjS25ScsnMoCwJv0WZ63g?=
 =?us-ascii?Q?Xw62RTuj2dHHlQuwmfaQiVPVCmMAQ6bFk1+6QGwFN3W0nLOVljE8sHivpM0Q?=
 =?us-ascii?Q?/94DAWG5BZH4LROE4GoBRSjlVOr1YmcivXuxbGV8CoyEnbi0blqXfzMNKmLI?=
 =?us-ascii?Q?LFwITmAirMCEVD7FeihERWcn56o+nZsBcdtj0gSWssxYLYT0kYT6mztSlvgj?=
 =?us-ascii?Q?ExWfmTa5BuwH0rq7Kr5YBEPArVZNzp05KkW//lYDw1XZftKlefhm+KXMo0EX?=
 =?us-ascii?Q?t/mMEIeQmmXMRb1ehqW1Oazf01detf7dVtFH/rAM1RJC7ZYwRQsIXVoWHB6N?=
 =?us-ascii?Q?6MPGgP60hAUik9vgCanWttnOc04GtBAsJ3GqX5v4+1yDrSwHMVC4z2IfO6J5?=
 =?us-ascii?Q?CnTCjqHF8p3KEh2w4Kkf5r7gWQONXK6oB1C5IQF/OizePviyON17GTWAY+tv?=
 =?us-ascii?Q?ShiEzgjwsc5HOkKmQURI4GwxC/cw0vv/APwU4zvyw5vygj8F7Z5d4KzPBuTO?=
 =?us-ascii?Q?DWb7sl+eezt+gqGRYbgUEY4JfsLB6YVd9Pj5698geSJMAZcWqpVWA73DIC3I?=
 =?us-ascii?Q?ateY+ert2o6vegT1kOlU+8WNSjSBS0UlSWnG9novNppUOx3TsaADuvtroi71?=
 =?us-ascii?Q?z+UOwfyOxUvFV2LUzZcakYUjeW0jFWSsOJ4deiql/xscEzFjUQeQpnwSj6yE?=
 =?us-ascii?Q?gqf0YUu4wYaQgyphKYAzzoLrTmuoTzM3uaUN5RjQUodXaw2+tGJLTZKjtmge?=
 =?us-ascii?Q?MmzhvOwjs92JLSY5igeRtakd+BQOrr4SBsRfHk2zu5p9ErAIXgT8agVbBPFk?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 745adbcf-2a9e-4b4b-e4e1-08da66a9ae97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:33:39.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijjFfylAeCLe0Qy8POExQjE9yhf3eV2E0E9fmg3/YeJXdFLjbhI81+HzeCKwK4+pUXGxv565BiCYHd/BHBlc4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3016
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
Cc: David Airlie <airlied@linux.ie>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:15AM +0100, Mauro Carvalho Chehab wrote:
> Building docs currently produces this warning:
> 
> 	Documentation/foo/i915:159: ./drivers/gpu/drm/i915/i915_scatterlist.h:73: WARNING: Inline strong start-string without end-string.
> 
> That's because @foo evaluates into **foo**, and placing anything
> after it without spaces cause Sphinx to warn and do the wrong
> thing.. So, replace them by a different Sphinx-compatible tag.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/i915_scatterlist.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index 0b8bf4be4330..5b5c4eee0f44 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -70,7 +70,7 @@ static inline struct scatterlist *____sg_next(struct scatterlist *sg)
>   *
>   * Description:
>   *   If the entry is the last, return NULL; otherwise, step to the next
> - *   element in the array (@sg@+1). If that's a chain pointer, follow it;
> + *   element in the array (``sg@+1``). If that's a chain pointer, follow it;
>   *   otherwise just return the pointer to the current element.
>   **/
>  static inline struct scatterlist *__sg_next(struct scatterlist *sg)
> -- 
> 2.36.1
> 
