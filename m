Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E682D576F39
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CEA10F274;
	Sat, 16 Jul 2022 14:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2032010EC07;
 Fri, 15 Jul 2022 21:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657920351; x=1689456351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nDJDCMrjdqb5BI+MmektbysLrixDvNhh7fj2E4gi5uM=;
 b=ZVmBM3alKQNqKO8wLy0OFB4TLZZUp+yPhPsGHavvA5rqJmUFZ79cFrkt
 dVbgpz8Ozb+iMZW6k++5gmxeCH/nvmfKfprLEOz0NfkXxGIJyevkbHSg6
 WGM/aZbVocZq42EnimmntS2sPdRGNExq91iMsHVq0FKo9CEn5KrdVrPNR
 Lr5woCBGjeab2si2LS+oC6wInlQ7lgrA8qezC7k3EdvQ83pzNsDTehKnj
 /ueQfVJ4Je9jiVyzpqq7svuNQVWisrsvWMeUcQiiVUOnfWdrhGXcfcbA9
 Q/fLXX/Qln45NwTgNm1EmShsK3rt0J1+s0SGzVgoNQZMELUN7cierWlzi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="268923857"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="268923857"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="738810614"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2022 14:25:48 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:25:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:25:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:25:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxziHyYyHSw9I/9OLZGfUwwL4mFD6Qbbih8YaKjCsA3lRB01WvOowIPI1g3pk+UNzNsWvltFuSTg8dQemodWB7/VG4Jic2zm2rBUFusADQ0xWKZ6WFBgfLCO9x902mnhKR88Wjxb0KRJ5GuImXgv60jcwtsDccd5DRJR8t6IQLhVQAhz5+xMQ3YmAkjVAvV3ebUAA2PlMAiWRZ7u0WDs/MO6oZCvEYVFMUHsjlSSXEBPA5aU33OMAdJeVZ8JHiKXcOyuWH0vmDSF2BwLZ5p8ZkGaO7MbvzSFn2TpAaV1QyggbHP2VnjnpBPgaFUW9qr2SO4FHjBqyTA6G5GMpAxoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C5RFaMMAQolrCN91TSpR0J7R9DYN+quU2+Kw3igQ3s=;
 b=n8Is95RHSg0S+gJiPiiIASflvEIlpulQzjouBccCdThNofi6ZG7xm9VpyimTjQZZJQGJS7gZDNcO9nhktXHyN91ZGLqlScnEAKx6lWPNrIh1TWhzuTUQwZpCi9rg/zkjcFHfEEV+egiuf9XuKIyt4xetae8/TlDY2k6ZOJzeGSNw646QZroNmuz74KIQlnkW11Bsfzk5hSlHXob0nkRjGK/iWIo6QU3qs5zE21sTTLjyUykIZwpZFPiRwNZx1gFW35exevfWKPIDmVrCRbQ2j9ZI2BMDh5ojNF7TICj5BKUe3fbIZl0CCx0CRQS2IFj8ByY0NoztUdAsEbMSfia9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM5PR11MB2028.namprd11.prod.outlook.com (2603:10b6:3:d::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.17; Fri, 15 Jul 2022 21:25:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:25:44 +0000
Date: Fri, 15 Jul 2022 17:25:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 20/39] drm/i915: i915_gem_wait.c: fix a
 kernel-doc markup
Message-ID: <YtHbVHVvHjLTMIe3@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <7506a4fc57d2bf064f6a35d70c8cd7885082863e.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7506a4fc57d2bf064f6a35d70c8cd7885082863e.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb68bd2-2458-4554-16b0-08da66a893d1
X-MS-TrafficTypeDiagnostic: DM5PR11MB2028:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zlc9OiJQnkkkbKZDMNEHHEY3fnUAYc3zeFsutfIY8SrLHFaaOSzZ7XuQVyIfmFBpFx8bxEoTPCs2OQ6F/xbB5kxXuIRG+hBuFpDwGKq7eLo8/g4nSnPGUThcNHHwsFWi6QBDtYZBOucCoZ5E3RuoWpN6mxRkkgK5qQnuH1MKJg8JVrYHR6gyhKP46oY7N1gaLrAfBkxlNL9E+vK/5duoUv+hxki+3NyDZrEY6iUNJ2qR7ah4lE4qNJcseMqi7GgHO/hXPBA9cMqVFxpG7DPfnyb6mufFGTQqjEacFEU+SGqVaYhh1QQZyapLiOhTlGjWTs1M7rlP8ubavOIi1IxtwQgy7IZSIhwTjMn1QkVuWBT3M4U/2F9K1IQp1QMEabZ56EDhmHCaQ6H42ZZyDkVzarpYLfBIZHXhL7wilGm0QGR/Raz7assYzaFIipxZ+qKetNPsoXJx4EtRmZzvrODdFyoRl3qnx9UOzviyRhY9mSOmhlFI5IXZFzzU+P0DvJfsDDJ4Oynrf4eD2638REQ+KAXAUw7MFIbAdM9Q2avOS1fCRs/wjBZqCN2k9Olb0YCjDGCBEuCY5slgk/TP8c547eHUc0oYUgl0n53q1PAEatyRwXEghNYs7GpeRyWH2BVc8AVlszpouEeMuICil7Nb0Y9gnPig4ioYtGZFQC/pK5DZ12kaW+D7Uxb4d8Lt1OVWBr6X3yM5F29EOHf8Yn9LDtXrJTwgyd85TmhUigMZWZarCzYwzCcQXY+LkDh/XGrovjms6ChbFY5iws/9ggstE+vaNtHAozrOW3M/1zA9seA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(39860400002)(346002)(396003)(4326008)(66556008)(8676002)(66946007)(66476007)(8936002)(36756003)(6916009)(54906003)(316002)(86362001)(82960400001)(38100700002)(83380400001)(186003)(6512007)(26005)(6666004)(6506007)(41300700001)(966005)(478600001)(44832011)(2616005)(6486002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KsuUfPDHlVuR5Q8h9JeIoYbSx8LsCNuPGBvsneiV6nN5cceLROFshbRUqYjd?=
 =?us-ascii?Q?Wf09gtT2SF48KfCd80yTV+XOM3/eO1HlL8vrV7tga7JxApFJtNmUNsw0wJKA?=
 =?us-ascii?Q?QTGf+IFJrOdFjhyUh66qA5M1MQW/0/gM5F2WHIbsNbxNcpfBXlHEvkTPax2s?=
 =?us-ascii?Q?J5vTcwrvGlg1pewRfV2ORk5C/ZiugSCqdmypoobw87Xhq/Z9bBWf/53XCgBN?=
 =?us-ascii?Q?h54pevoCkvWCXbSy+nQOMfn11ORgduiRE0JNuJ4Wb9I67mfQWy+c1MyZwmpi?=
 =?us-ascii?Q?BBhs6a7ZUC1d465EeCbqyUqmt6Oaw6CRDokSgTDNJKfIbo04o/U67OK28Ffk?=
 =?us-ascii?Q?3ERCn20Ma+Wtk3RR6aK4o4nUl457KzbHyAA6/V9cF8KLkBuACK/tSz+L+DEz?=
 =?us-ascii?Q?ElnUZL81h+RaWkh/Uga9dNUg6cwEt3Btu+igzbEY2hLyVYLF3snBA6A38iwj?=
 =?us-ascii?Q?sCikrDHNY38sWzrdjmFw0x4vQvzviFNbK7ezqO0V3+Cmx7AE+PEnzsIjTuco?=
 =?us-ascii?Q?JKmjMVEC2+pxzsmzF4SRgL5H/teR6eTfl2iH1naM+/PZXe9t6s5+VZxPCYqx?=
 =?us-ascii?Q?V5SgRipds5THLjDFcgaTw4M9CNDSe5ucv3O/J8dKClDnIAJa1hFQWOVP6FWI?=
 =?us-ascii?Q?L8O02NU0L/y9xGtOO13rd3edFQmP5UQ4FZrKn3soD6oFZSmjyozPlxTvo6uX?=
 =?us-ascii?Q?lgH6kzU/dFh2FhINdxnyizWq7JRrH+MLeDRqniqHtV0WAIaDUn6C7KWqmAT6?=
 =?us-ascii?Q?VxETlfvHycUU9h0WaNASly53wz7o6dUHmSoefyy8qlj//PMsa5um/a6A3M8j?=
 =?us-ascii?Q?148dMszw/V5Y1BgBYvDlb5WqBFikTMS+lx8CZVOOYs+y4WzZgZ50Vb672cGd?=
 =?us-ascii?Q?j7+obMfKm/DWt1ALTNTtRPH0tGhrK6umCk2AqadU4ZY9eeqfFQl29T25VQE/?=
 =?us-ascii?Q?vMBwEg3VxQP6use5w5cH1GPhddOwXu7BMA1CE9G+oH1FG/ZyRTM70mnRdhIy?=
 =?us-ascii?Q?z8/sIdS+iUBfuu8pDXg42MI722sgwhy/B8RWK5RcFwgp2zNcaHRH+HbjOCud?=
 =?us-ascii?Q?Pfy5aMdXCgxGMxLnxx2ZT04d4R4/lRNUsvymNBl8A/7PNBUwVN6gXr0ctpFe?=
 =?us-ascii?Q?Tt0BJphE6HnpZB9wdLDATrwmxvJ8NIIrpJqS0YV6/Wr7eXr78Pq+nxE2LJWT?=
 =?us-ascii?Q?RyW2ERlkzz5mB+ZdnQZZ/eybptDCWyBBaloPIcQp26bvlbD10AaLlArcoI/u?=
 =?us-ascii?Q?plUfbA3bHZ597VNxQu4uDxWlmCjwphRIGKBx71T6J/KlCwPpiMnv+xQhob8t?=
 =?us-ascii?Q?8Yz3IafoEKNp92KFxDbmgDhKDHtToj+W9Qv/GWc2lIN0an7gFoQ/i9gmHKZk?=
 =?us-ascii?Q?ERasqnHjbBNpjZ/Ho1tWR3t6/X13IcrEB25Eyx/yz0SpO2tANb0OzmPlmWqT?=
 =?us-ascii?Q?Sdpcw6TojlSzMojlxM8MZaHKNG9VNDeZ0wGir/NeHhAuozWFa87huC895LSQ?=
 =?us-ascii?Q?GJ+3eThGJZhTpYEwd9GijD31SkE5+kRBlIqCBMI1T3E0KMe9IqnsNZmZ5/eb?=
 =?us-ascii?Q?V82V2Z9szQIv0LCG45HZAsU182SvwACLean5I4YXcjveMmnYDOpAhYGnykjO?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb68bd2-2458-4554-16b0-08da66a893d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:25:44.9494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+WfxEZ0KlZ29uF/Ih147Af5yPN6IE5J1rkA2t+4MjEbu8XhYYRbBhuRgwWOMl8DgFJG+pKJC6Nqk95DuqHFcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2028
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:08AM +0100, Mauro Carvalho Chehab wrote:
> The return codes for i915_gem_wait_ioctl() have identation issues,
> and will be displayed on a very confusing way. Use lists to improve
> its output.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 4a33ad2d122b..1fd5cff552ed 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -210,23 +210,25 @@ static unsigned long to_wait_timeout(s64 timeout_ns)
>   * @data: ioctl data blob
>   * @file: drm file pointer
>   *
> - * Returns 0 if successful, else an error is returned with the remaining time in
> - * the timeout parameter.
> - *  -ETIME: object is still busy after timeout
> - *  -ERESTARTSYS: signal interrupted the wait
> - *  -ENONENT: object doesn't exist
> - * Also possible, but rare:
> - *  -EAGAIN: incomplete, restart syscall
> - *  -ENOMEM: damn
> - *  -ENODEV: Internal IRQ fail
> - *  -E?: The add request failed
> - *
>   * The wait ioctl with a timeout of 0 reimplements the busy ioctl. With any
>   * non-zero timeout parameter the wait ioctl will wait for the given number of
>   * nanoseconds on an object becoming unbusy. Since the wait itself does so
>   * without holding struct_mutex the object may become re-busied before this
>   * function completes. A similar but shorter * race condition exists in the busy
>   * ioctl
> + *
> + * Returns:
> + * 0 if successful, else an error is returned with the remaining time in
> + * the timeout parameter.
> + * * -ETIME: object is still busy after timeout
> + * * -ERESTARTSYS: signal interrupted the wait
> + * * -ENONENT: object doesn't exist
> + *
> + * Also possible, but rare:
> + * * -EAGAIN: incomplete, restart syscall
> + * * -ENOMEM: damn
> + * * -ENODEV: Internal IRQ fail
> + * * -E?: The add request failed
>   */
>  int
>  i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> -- 
> 2.36.1
> 
