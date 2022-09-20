Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6615BEEA7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 22:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE5A10E28D;
	Tue, 20 Sep 2022 20:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1ED10E28D;
 Tue, 20 Sep 2022 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663706458; x=1695242458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/S62SAbT+gM5akuj7/CXIGzMTjVHneXbMunqB9KPCzk=;
 b=gGddc1JY8tv3RBnuIodNCQidUZSq/5fj5QKJe35C0KRdRjFxpjc8FMw1
 eEOxp6yhqPtc8MYKBkTMWgUXKEWQYC0q4MHhaWNJmPomQARukMczb7dqR
 jpVYJgpNFEYHxwbdpchGctnMPbU39/Cb19DnTgMuhNIGpk3MGo+BumY3F
 w9sk1hem+apY2yQ7x0od2dxx6QOOpNaY/rFBplGIyH9lzujj4xb4h1RY6
 SHQ7hSP05KLbFBMRBWMom7i85D13aevpFeggaTgX6Do/Ndb1UCNpn/whn
 F7BdQvkLHmrB37aJnsuz40d5K1AxrJvMaua4LvYcJL2fkv6N6SrAh2luC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="301211883"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="301211883"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 13:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="570239460"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 20 Sep 2022 13:40:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 13:40:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 13:40:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 13:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJGZ2k2fIJ2TJTV2nkb5D6xZaaUI1P7Gpd/8nehg0AcJ5Ach2pU/JvWbzv+x2L9ByPch28yIeqOzCH99cTzWVudcAyFkk8hiEyKWKCYvNaQCHPLDg2zETQeKmPP29jjK0X9C4HyzwpG5O8u8F6LWdfCFclZgl1MhhR0frS5sgoqSJ1zrBZs3lnsc3pYtcKhs94CSXOpVNZiLvleK0N8shm1MZK6T3+rdV+60RyhsDm1bgeKnpFrlDjnR/xLumZnWT7Xqs4x00y+s2Yo3Di1sjZAamxLVOSW6DlRkOOlOyRPIK+NPI56Fbe6wWQRYcz6sn53xftKV2cFiEFuoRLVY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmOKzkV7XBJqLhHMCMHLghZom9Dpd6l8GcUm1xLKBsQ=;
 b=CqQik3TmkL+g2hped1miHrU3u5qXBeArtXCGt3qMQdQLpB46uI8ZTtZlR0Pmx8OOGNf7/Soi4JB13lrCv3bJX4Iu7TNGlKD9aPymxEv3CyTQ5xr2PD+CxRhbsl7rMfR/FK1NfJAjSH0uh6csniIHexgisHXSuwIUIImJGb3LBMrJBLIl/Xk0J/xFrVAukduXvaoMetH92Wt6LLIaUFhcPMevuoVObhXMyeH15qPVI/gRMTSK73mnvMW4UsUZcX7j7o6Lj5bMt3W8E1JZREmhmfA/W020RJBtr9Nh2rMXWBsGEJdeZ9qDA6+vmRljPOIsKabJizwxHwkyiJ+5jKKIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:40:55 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5654.014; Tue, 20 Sep
 2022 20:40:55 +0000
Date: Tue, 20 Sep 2022 13:40:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Message-ID: <YyolVATWuGbXE/HT@mdroper-desk1.amr.corp.intel.com>
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <YynxCp0OGTJ/hu3J@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YynxCp0OGTJ/hu3J@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae06c6b-2a1f-4649-a7b6-08da9b486a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2e2pYGe7H1Ab8gZ4NFQ23ouX/1JN2JRvXpeqNJPXFDAYSW1v1gnLdEajS3k/FdlzP6CbgLMjZ8AZGqrlpSszec2lTxTb8aMFNojmV+ghtJyFFq6PFT5FQzSl38JzAhXnODhwg6Fte05Bx7/jQoWrNAOGcU+EjmKqS7sTjpqDsNGAJnXJsVff0lyUYXLCZiHSXum+SA13RJ61OGSW5AzPVSkf32OBZlLqum87irAH7GNm5dcRL6RH3YXdoUI+blWjWicLPzZmFWP1i7UyBMnbtkS7s72bk0e7xoEBeLuuUdVnpneHQgTIi7XMyllLC/bbnx4tMHuoU4BrT7O8eTtK0Bo0hurfARU9daLAqMkpDP7vwDryyzmolC6kRrTchOBiDwCwcWg/WvwFWVFLUwM8XrbiKeDeItkYeZCj4hoaBVHxZThnVw6+fJdVH3p7Q2q+oENUCopJofykG6bAuXMK9rT7Z2zNxvuKWcHgynns/VzGr5F6rhKautUgf3b6ukcKnHwXmR/lgd2XRfHlm/LCUcNawhpaEvpyaszbzP4uYaFtR/Xj03YV97K9FzhtYTxMNkqzMtQBwtCK8W0uZzlT+6fhhXd1ovq9cb0k9CceYvrsKXn9hZ3kNhMs1WPmKrnRTtEVgzA4i/RixkHV7lLRoZyRXylxAgrDfRRCBJjHaAt57M5TEPgJBaiZfH8NMCwuloJDjL9qm81TGb/MfCBpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199015)(86362001)(6916009)(6486002)(316002)(6506007)(38100700002)(82960400001)(8676002)(478600001)(6512007)(26005)(6666004)(66476007)(41300700001)(4326008)(66946007)(8936002)(66556008)(186003)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3PxYlXO1s/a7536mWh+hpFWmLmPpc4s+FYXAKaOx+p12UbnUSjuQ8/Nr5yUK?=
 =?us-ascii?Q?dZwbxIGT3oCEgtbr4ax9q2YM6HM6KIgELaUAu0Ah5HmNBb5bdB8rXzSnkq3n?=
 =?us-ascii?Q?A5RfwyZpvRUw/TvruFsWj05+baY/EWAgnnjBq/imfJ/bHAs5Chi1QoyAyEaV?=
 =?us-ascii?Q?Okj/3AHFapZwTKZH1jmWreV3nFs8qXN7TVzil4DPiUOLyuuzhBYO474+gKFn?=
 =?us-ascii?Q?M1MDME6tU+8CzRW5MV9GfACRvl5ia8beu2WyBA1rcM8Za5KV6RZbi3tF+Q+E?=
 =?us-ascii?Q?aCLIYyo1ZEmR7asZxzR0k3b5Ihq16fOHEcqeggveuIMbIWFpNeueqaHEctZi?=
 =?us-ascii?Q?E/Kgf/AulAMsZywO0uMUxtEgHk1XqjWovQd4mfE+smiGyZo9WcvYv+diNjAX?=
 =?us-ascii?Q?YrAuoFRHrhT4j5DxGAnz891UQ2i3ss6f8LuIfgxJBd/nArVQOf/+ffAiDB/H?=
 =?us-ascii?Q?ha39nnWVGcUvs8oOKyMJwDwMYx7uz9oNTkQB3CEczkraQ5olWmvGmzdUUsQV?=
 =?us-ascii?Q?wq5G5Tb3eSyx2FwBCrXVWufMQpUbib55nukwcjER6s8Io5cAoEGbhxsr2I+s?=
 =?us-ascii?Q?F4lcBFIFHHbvYRY6CERotLngQxUhAiVFkFagqX4T8jW2y580OenNIcvIsiWy?=
 =?us-ascii?Q?TBhD/yO+YlVz5FEDYhw8zxKobsJCif5KS+CS7JlTTobLOGw2sh9HsnVN6E61?=
 =?us-ascii?Q?cdxGxQL0uKdMx20Zl1AEV/oYitkk1Mx8PVMaYhtZXiWOe5xAvC6irRJ046br?=
 =?us-ascii?Q?06QuU5Omw4uL3vUTwzh1M31jpT1vVT/q/n4ZhyJAlPXVneX0RlT+TgmSAxj8?=
 =?us-ascii?Q?pcykj81mVylmNUt8VqtMyfn8b2L+gOjwvaujOWB3urhwHxOn8buiSRhA64uI?=
 =?us-ascii?Q?HtLiigaJLE41aevQ66g+1hzkUHq8Yibsl4nGH65mWbVMOQxf305DqjfojdPF?=
 =?us-ascii?Q?SHyFiVf2NShZaWaWi9YUNJldn+yddTr5ajAyjoYkdPdpXFa3CEWEMY6DytBQ?=
 =?us-ascii?Q?lM8LgGMmqxst7QKbnCcueTZtIaXS+5Fxp3FzLKZh+HgS+7wuIaMpId0u/FyI?=
 =?us-ascii?Q?8RcYlWxfYxjUMzS2/CB7FC9kxRYJpBPhweyRe/n4/eVT/pAW6Xg5VfmNuqa6?=
 =?us-ascii?Q?0dl/8/Fvu8ualc7PNlvdbOkHaJn8aBC0qUrlTgJ/FZqgX1cRrl4OfPIjbtR0?=
 =?us-ascii?Q?udwYUJ+hDcaxi5s6hoR0ZrI6j4B3b/gVgWvXYVhqFVz4bUdF0fEq3c1ofHBt?=
 =?us-ascii?Q?ZxLi9f0x3yFKebuZXlAWECrxxiN+eoDRfPQSeYdNnSLiuLISpcmB2i0WcsyY?=
 =?us-ascii?Q?6/uJPEwneYDNfwIHTerLV+QK9aW1PH5EtRu8MB+6h3yf1KHDiJnSHyw+leAV?=
 =?us-ascii?Q?mBHr0qrE1I1ye6rkSpiwoAyzyWvsZFsN4T6qixQDhXn318Cwd//oRLPLfoqT?=
 =?us-ascii?Q?PC0kKsudiKEWoQvX4UOxzdkO1ZFlGVBr2e1/kCZ70GiopqQzXooUZxyIrCx7?=
 =?us-ascii?Q?qprlnbXMcRegRQRnqTX5ibNt6A8luD8vlsa2j+1/ZqEvCfo4/+MuRIzR4z3V?=
 =?us-ascii?Q?15AFuENq0lao/tN8w8omlO/6kRqnVofAVklSLS9cTwZqOMOx18Xk7kT1Uqja?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae06c6b-2a1f-4649-a7b6-08da9b486a86
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:40:55.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bfIGSyYEM7078F+jFQi49QGrNHLOb9VrzX5mG6NNboz7qV6HzLYUPvMc+LAb3UeCMYSD5V9TYiwGPgFK92r1c7N7wsbcdQkz+NGNPL7Ljo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
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
Cc: intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 06:57:46PM +0200, Andi Shyti wrote:
> Hi Aravind,
> 
> > +static int get_mtl_gms_size(struct intel_uncore *uncore)
> > +{
> > +	u16 ggc, gms;
> > +
> > +	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));
> > +
> > +	/* check GGMS, should be fixed 0x3 (8MB) */
> > +	if ((ggc & 0xc0) != 0xc0)
> > +		return -EIO;
> > +
> > +	/* return valid GMS value, -EIO if invalid */
> > +	gms = ggc >> 8;
> > +	switch (gms) {
> > +	case 0x0 ... 0x10:
> > +		return gms * 32;
> > +	case 0x20:
> > +		return 1024;
> > +	case 0x30:
> > +		return 1536;
> > +	case 0x40:
> > +		return 2048;
> > +	case 0xf0 ... 0xfe:
> 
> just a bit puzzled by the fact that case ranges are not standard
> and are supported only by GCC, unless, of course, I miss
> something. Do we still want to use them as they are widely used
> around the kernel?

i915 already has 17 other uses of this notation and the DRM subsystem in
general has about 50 today.  So it's not super common, but I think it
should be okay to use.  I believe clang supports this language extension
as well and the coding style doc doesn't say anything one way or the
other.


Matt

> 
> Andi
> 
> > +		return (gms - 0xf0 + 1) * 4;
> > +	default:
> > +		return -EIO;
> > +	}
> > +}

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
