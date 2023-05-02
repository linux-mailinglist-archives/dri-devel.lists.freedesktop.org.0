Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3284D6F4783
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A4210E375;
	Tue,  2 May 2023 15:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96110E2E5;
 Tue,  2 May 2023 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683042078; x=1714578078;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ACjY+Or27UC+155ZLa/60MqpXendwVNhGlficzZbviM=;
 b=IRLoWYNoYxD6OMs2FmyRzms0Y0iIhXtCFtjiSGHS2gzC/L8Lftj2mvns
 yPyhPKdr06VOOUBIF+sQkXPoGK2yr8/iwF3/1CjOWWouTY3s895GlsLH6
 RR635+xMRbmZg1kNAAofjoRmoJ7ehUNlIWvPjhPhRiKom3GJZYYY9GpXP
 K1ZBIrAHKvCs/cQ5N0d+AY5r2Tf8SSZOZWvBPMv0dpG5q5hCOpjlqB3hc
 nJYalgdXaUbr7QLjZPufQtD6+D362VOWYLBgvPQUNx//gYy83SyFAqFPD
 YDp6/7NvhYkTkU25dos3hVbhTb56URh99pBU8hTxOSWyMN7dGhsdDup+R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347252211"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="347252211"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="942471832"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="942471832"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 02 May 2023 08:41:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:41:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 08:41:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 08:41:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SswTiOoyCKyZLrz9iKS7iXoFoCs0dC77GE8ykhiGkSvRlD2tE2xJ+rTvtQH07TphbBlH+zNi7tt9uY//Z9alOpx7ylI2pv/HgHrY1shnvpnpZobzqLHocOpGhxz6xempxtHziu7o0GjcF6HDS6oqZAlIO1989PkfUm5yAtIoIrGA5jco6Cjh3usoQgMjS2OoQzBmFEWhxCH4QeJYE9cAXNLisEls7j/TbVv8gIJuoaMX3MXGed6v9FIFN43x3z1i81Z+xZ4jBjst9dG5pDXg9RKlsM+FShqmSivt22duRXOAkckdq4CTWdDiwexl+5KwIeubzk6py9BEHm6FC9674w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFhAgaE/rbbI6wiz6N7M5+luVOPoB/HHWedYUBKGN8s=;
 b=hU8NKcP0IUizqexj6ZWi6Q9NhBgBJkKajM7WoicZQkCBjiwjGG2an6tGvQ39PcDrbLeKT/vB7YFS0q3WFuttL4FW0v0Z7mol2KqxkrO1n1/9Pu+Mz7SV1Lgol8AGTf/9nruzoDXqdebXwnM9ATo3YbgK7N6DRSxp2YpeXK4XHj/f/Ff8oxgdbY3G1yfpfeU0NjukNbThS4DNzATYa4izo4kIVLZ/x7g1f2igdvQhZxn7EGBLvlLo992TYl+5Po1rSWiTXkKRAL2kbYiwtXgmxWnieJtSRQELz7U/+m9+qn4D65GrSuAJ6LYXgPR3NcPP/KFfEHE32MlQ9ylYitkYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 15:41:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:41:06 +0000
Date: Tue, 2 May 2023 15:40:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 03/14] drm/xe: Do not take any action if our
 device was removed.
Message-ID: <ZFEvAuZRXl5U6ntH@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:74::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b1c3fb-4a4e-4513-a334-08db4b23a486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DKNTjpbh11aBLFQREuIEXRvPuVKN04Zg0yf+LdmDjScnnbdrEd1iKul6fhL0en6SmoNY4lLwNdkhKu2oeTiBU6+/dXsidR0L/n+rkocaIU/pXGEaOIV5CxtKyOzucSoiK76Q1GmgkwVR9MqBTvfS1Xr1Z6zZBrwhSBge25nc+II3N0Nkxz96F7NW2vw9Szt5bL0EKI3MgRxlw5KLATJnyhNS/yPEEtuiJqIEAZW61tdXzJNNxyyM1u52exkpBeNl8PF4WHsMLgYaGf4gQqWxQYI/Xdj569y83Lzwa4pSJ7OiYU8f5Rm1PuLNQR1nP4Jk+hanCe864frVxEw9Rp/18CJyK4p0a2fGuiYTAg6hE6KVgm2Vw7rLQmz4lVJXL/4qWGUrkhlTZe4dJfpnKeXGGduksuTHFKbaDgqz9AbrMn6tDu4I7OOGjOBB1wN0iFISwDeNwsboeuYG4wtJJ8W2lg2MBH8s0+PetRlZjKAsJw/5eoP8uRoSCU85dzVUdF6iVLvXEqg0gHDhN7+yYwZVtLhu5xnRH6MRDZ63oh8I/cbCrfmuBFrtToMgiVjXemoJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(66476007)(66556008)(66946007)(2906002)(44832011)(86362001)(6862004)(5660300002)(8936002)(8676002)(41300700001)(316002)(6666004)(4326008)(6636002)(450100002)(478600001)(6486002)(186003)(82960400001)(6512007)(26005)(83380400001)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMZkkWvF1pHnT5VyaV1L1E8Twu5A4aOYRlxeNlXsRFCapwJEATGJJAD4S1rO?=
 =?us-ascii?Q?LFG5d+JmpJmFizTNV6i0/8MXESQKKnPiz+m3lMXKYjRWlhA4MKBDT/EoZ8sE?=
 =?us-ascii?Q?dzT7zaNbUtVbkzmXoW8A7FQKPuI9DLtrjoDB1o8HCsihxBK0Qi9vWxo8930o?=
 =?us-ascii?Q?pZZqdlTsMi+dnbfW9VMo/13ufdOQ4/iIggDC5snabvipzXCDapPQF8N2dL9O?=
 =?us-ascii?Q?zPtJ7wtfFj4kt/ODYAndydCQQH+wfposJdqhDZ39yBWA2b57koEdp8OU/brb?=
 =?us-ascii?Q?GTLVW8OLsy3OsBN1X4morRYFkd1dm25OwJp9q6JwxbcxtZUfImgxcE0LwJFr?=
 =?us-ascii?Q?/1HUL0QnqQ5Mbh83Ls9ocTgf1sB/lN2Oc8dNdLX0XUAGAj3EHBwCuqfWXUwI?=
 =?us-ascii?Q?ikTIO/cyj6+Oq/9VVcwKFo6iqn36P2FrCy/NMA8qRBJyRDxDp3UXbLt0zxfN?=
 =?us-ascii?Q?/Ae7N6LaEclHp6xbfTDSDGP8An45uA85S+tLhVf6VJu6pdcnEUZE7wvZJCid?=
 =?us-ascii?Q?78GhI8dU/QenPU83WYLKHG2KAdZ0uqyPeOIG7rLVh6zc4fTafRt4g/o2XoRb?=
 =?us-ascii?Q?iFpaGWVAHew5sT2pznQZgzTZ6tr9TsF1qKciJArdSkJcY5Aeo5/CoxNKl1jT?=
 =?us-ascii?Q?ihEhZ8KbrkKQYMaMAsAu4Z0AiCtbAEYa4Q40F5G68Iuax66uCFJMRaCCrqS6?=
 =?us-ascii?Q?vwKknWVRc5+h4DD92jIgVbccQ2fhd1yOqDdjCkvdD1qu9duyTTyI2039EvRD?=
 =?us-ascii?Q?V/Jn2ubDYbJleAh6m0RpyDYs/eM8+GGscyoL97RAyupB+U7ld66P+qWkxFRU?=
 =?us-ascii?Q?3y63G+/dyR1TtXdCF5XE/j73J5c9KH1NueNiu0dx3GG1x1j/ceUASYsQL22E?=
 =?us-ascii?Q?sxoDquz1qZ4vA/ijTv8LxMzbqrkvq0nJ0mPn6kMU9u0WjH8Mrck7KUvMK6zN?=
 =?us-ascii?Q?q1kvJcnjmz9QEkXQs4Y3612WoY6hyejIqYTuLfxnhE+J3uIjTNgjCUlqi0cT?=
 =?us-ascii?Q?c6lu2/MdmxItr4OHHqgVV/jkidIcbVBq7N+RIdrbDhG19/vMM1WhABksByrV?=
 =?us-ascii?Q?4ROILH3h+rwuADGyqdMHkDdcJcgolDGk1vfRmcrb5EYFNZjy6kb+DIe+BgUa?=
 =?us-ascii?Q?CSugGe5Os5WJbQw4xck/4mxsXmfVvv/ZAZex76dU/Dgp+Q6rpA2uap7AZ3+r?=
 =?us-ascii?Q?zFRLKfUNPMmBCWbNeOeBREHV5kVOAZBJfSR0N1pcL2ST0Rfh1lOzZJm6chMr?=
 =?us-ascii?Q?BZLi8g09R3SB5AIKKXo9CQbR3tn6wxj5TiLjXo3SlBtASGKqeTOvc6Eqdv9y?=
 =?us-ascii?Q?A54yhyfYgW5a8faAwVwZo03X2e/wJlaTAXrxBO9Y4nV5IX2Xx0TT+pf2f78F?=
 =?us-ascii?Q?ss2Umi3QGdFuo4CXaHPgmJK6rHqhTBsqv4YB46bKol68tQX5QiufdLwZ/Kor?=
 =?us-ascii?Q?lwKC9bPhOfY1QoDaTspYMaSqQtdsenEB0evSzqlAC5vSgOofJutbu1PXm/pl?=
 =?us-ascii?Q?T5l2mSy5p7ArZ7+Q/l54+x3cvdO2+/VOGKb3DAZL9Q+fVTX0S7SBPZn0FKw0?=
 =?us-ascii?Q?39dvgD22Ex6sudDkrMTAoHfMRhKU3uGEHIXts+inUbH3gQRfUFnh74JOIcb9?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b1c3fb-4a4e-4513-a334-08db4b23a486
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:41:06.0600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2uRHbhTK10ZRFF5DlC7gc7GYztQ4OF+2UoBeT1xfexovfU3HkLzg9uWNA9eziEKQS8csNVHt63Wd5x20Wt0QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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

On Wed, Apr 26, 2023 at 04:57:02PM -0400, Rodrigo Vivi wrote:
> Unfortunately devcoredump infrastructure does not provide and
> interface for us to force the device removal upon the pci_remove
> time of our device.
> 
> The devcoredump is linked at the device level, so when in use
> it will prevent the module removal, but it doesn't prevent the
> call of the pci_remove callback. This callback cannot fail
> anyway and we end up clearing and freeing the entire pci device.
> 
> Hence, after we removed the pci device, we shouldn't allow any
> read or free operations to avoid segmentation fault.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index d9531183f03a..a08929c01b75 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -42,6 +42,11 @@
>   * hang capture.
>   */
>  
> +static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
> +{
> +	return container_of(coredump, struct xe_device, devcoredump);

Confused how still would ever return NULL, can you explain?

Matt

> +}
> +
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
> @@ -51,6 +56,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	struct drm_print_iterator iter;
>  	struct timespec64 ts;
>  
> +	/* Our device is gone already... */
> +	if (!data || !coredump_to_xe(coredump))
> +		return -ENODEV;
> +
>  	iter.data = buffer;
>  	iter.offset = 0;
>  	iter.start = offset;
> @@ -80,12 +89,16 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  static void xe_devcoredump_free(void *data)
>  {
>  	struct xe_devcoredump *coredump = data;
> -	struct xe_device *xe = container_of(coredump, struct xe_device,
> -					    devcoredump);
> +
> +	/* Our device is gone. Nothing to do... */
> +	if (!data || !coredump_to_xe(coredump))
> +		return;
> +
>  	mutex_lock(&coredump->lock);
>  
>  	coredump->faulty_engine = NULL;
> -	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> +	drm_info(&coredump_to_xe(coredump)->drm,
> +		 "Xe device coredump has been deleted.\n");
>  
>  	mutex_unlock(&coredump->lock);
>  }
> -- 
> 2.39.2
> 
