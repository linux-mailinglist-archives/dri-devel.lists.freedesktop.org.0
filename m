Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8256981C7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 18:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C610E119;
	Wed, 15 Feb 2023 17:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE2D10E119;
 Wed, 15 Feb 2023 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676481563; x=1708017563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ToFxUZNYH9/ZVrbatudkqzMXg4NCk8rnL9PAvvCHuoQ=;
 b=l+2pHzVCEDrs7Y0TuYhEcKUIEc+g6P/z9b8g2GlHkRDJmqvBKuJU9Ycd
 k4wpOl1AV1sC9rAkfQYr+HaHvv3aQVHqtT+3NjW1yZE99X1GCSuPOgjiu
 94GyTBk/0CKd9sMgJ9thvSYssj/alrm9L1s6M2AIz2yD/C6DLYWr5FtWM
 PUZ23ZNh7dOpcUWPtjWdz4mHI8KZHMxZiwfGJYhf+MfKaGH0JkYa9gVTL
 nxysvwljcLiwexLpkKvD1UbuI/8EV+H9frZWkPTGCKcdH2MNwvUywYzVc
 6hHCn0Doht90rfPpdp1+WAurLyVnrwj2/mfvI9gCjttyJkZbEs+31owPG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396110723"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="396110723"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 09:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="663042016"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="663042016"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 15 Feb 2023 09:19:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 09:19:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 09:19:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 09:19:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHcdZrEEAHWRpaMM3A1wGXLPVqeCjponfuN06tg5ZEfC769R8wSLcan3H7Dw5RmNhaaVTSp3CJcd9cMJN+lZUUzdCOOZ6ckj2a3I85frISw1lhub7xz/PeBCV5P6uAFy/vS0vPsWomn9BHIMw/1ugnvOHHu4DFAM4gtHEKml0kUK/pmdseX0Na7fgOHD80vgNthT5lmOD2+bb7QW2lUZCvc5tgFKndhOcMLIrK946H4VraTxDmjAX//lCWZmBLvSy4roKBtnE9mB08xnsnJNLuBW27+qBKc2UgDbrZ7AWpIL3BTdSaLwRp56sJrN8LnIL5Xg4g7aKHoeibM/+lyhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBWbvgyHvCenFLQROCL3dkhIfOSSzcO3zJoUxW4NIzs=;
 b=N58MeUELAfTUP8v+hs2e2H5Ioti/guy0KNT5AkgIjkg8PeXdaYGjehWDdAzQQglaRUOY3UAEm3//dUq4U9quRIk0fBmp/wIfy9wHwKeC8eoflxKO0DBNLyKQvoTq1OLK7Ao4oRRQqDy9l9zrg0/svIFopatQ+OL+woojD32ZYDOULHw2d8eswVLotAgmSIyqKfOO8828Qz7ZWol6onnkkpxLR719oZiwWY6xXo407ErzTptV1+qOMyYxzw+qPlQXL9ejkJsp8f0Rit3/RD/4AXkqh8z2KKN5JAUk0ESQv2Fro4v3TyU58US9F6vwAxh2ogNPmZ1WExDPNTz0ciX5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 17:19:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 17:19:14 +0000
Date: Wed, 15 Feb 2023 12:19:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915/hwmon: Enable PL1 power
 limit"
Message-ID: <Y+0UC5H5BSbMWFNa@intel.com>
References: <20230208190312.1611335-1-ashutosh.dixit@intel.com>
 <Y+QBJLXJ7uTo3p7l@intel.com> <877cwjq6rp.fsf@intel.com>
 <875yc2oq0c.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875yc2oq0c.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: ccea5255-3bb8-4a4f-2558-08db0f78c285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aerc4d8pqJA1uD2gTFQMYb8gR+uUJf4DHLptG3s3xphMmG3jAVQJVXjSKoY7eR5B7inkWGzabAs66FaFEmWbTyLZWYpPZHBNjLn6Gfr85TyNunwud3a7gFNmVLU7O6Mcru8RnhQwKpPLXieUOjkvIW62CzX3kduEygIk8jYKsNjF9zzglEg9q4EUG/2m0tClddywMUHj47GjCy5v9vVwV7FYst3/Qm4+WvbZ4MUR/wooJwEf1hfz2i1YKqRmD+0c9SR6a3sGSUcZ8VC521/nmfmd0iOw8jE7lq9Z9vHYAcpOBq7GvHUERn5UKD840ApIb0j6m3AmfH6ez6VBX5n2uEmw9Jg1BCGcHILLRQUqpJhNZhbxP8Jxf2+kuBkIeOocLOjXFYbvsv3RJsucDkbnNAMZMlR3kxkBn9ce7xAAXwUBUOhsFKNKzPHmdgEMmzX1mNGGBoC4SCAI5jOlnNGjBhXyj3kK5fNkKd4G/ElFQ52uZk0zkkAGJJTYZXjrkJbV2j1KvtE9LM9x0npxywEHuV2YATRdW/WtiHBohZqnSwgi/TA8F0WNpfspeK+AgYsN83xaoMyQVJ1iwgIp8Zk/2PK0Pf2jFgk+rqJG+lXdFrBWPrcCJ1IlOIxTJnsn1fMQiMjBpo28ayMMPD0YlHLy9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(83380400001)(2906002)(6862004)(8936002)(36756003)(5660300002)(41300700001)(44832011)(8676002)(66946007)(4326008)(66556008)(66476007)(37006003)(6636002)(54906003)(316002)(478600001)(6486002)(966005)(6506007)(2616005)(6666004)(186003)(6512007)(26005)(86362001)(38100700002)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pazn37K7P1Jg+fmKQcSvWsH6Knkheoy5LTDcP5Ajx0IqU1INxyczfNzA7qab?=
 =?us-ascii?Q?7gpkZ6Oo95I2oyfYDclRNIcu0WTzjEPfSOdjYOGRGZXWbaKAUxu/MCHGHcEt?=
 =?us-ascii?Q?+HS0JhgeQ35BOSTalLTVw8sj/p6hMLbE0yz6mFPIRMdXO6UdQvUjQ3qbWEeH?=
 =?us-ascii?Q?SXhXGJ3Htv7A+ybhd0WdRgFoA4MFrmqfWlpoN2pauDftPVj6Kb9frqJ+Mq3l?=
 =?us-ascii?Q?Iq1IGLzmNkUb1p5avz0TO4StmqkbpTGMP6rnAG6b6cJN3r9sYpih/V7c6v0+?=
 =?us-ascii?Q?XfQY8yVoOkITLE/FPgBVPqn4yXXgs8d9aEXzhD/ykOraV5Ae4daC7wNWYQ4D?=
 =?us-ascii?Q?BdIU4LjBGSr81YHUlHn68fqHi0Q031KZ3bwNW0OhncGkuM2aEIck+nNYjFU9?=
 =?us-ascii?Q?D5MBRDQTMfOk4Ky1JHQFFvSyapMEluRqBHnqrUFcH2CLndCAEGZSv4da1Lji?=
 =?us-ascii?Q?5C8Bpl2EkRNKcm5QKaRWYzrjIGd3Y6TbYpFQNjZy5OM4ifJmL3ZP/Fb6ZEKy?=
 =?us-ascii?Q?VIxE3IdceM9ghljO7lth5tscltKIstG2GN4ZA9/HatEqsS/vaM32US4nP84p?=
 =?us-ascii?Q?LyqhgfR0j9j5gK9XspYEOpMjqakeCs2crIKoW0sRHIHQgEBVvPEbyAAzZIeZ?=
 =?us-ascii?Q?klRqULaoSY/J4upE62oEBhkQVEsQBJrrGXiU6gYZtf9822HvG9n9y1fFdGrp?=
 =?us-ascii?Q?aD/Mo9ldYX6OAN8tL2MM5ZPQtLPNw5/1oTdNX+fVvkv5iImi+5I5G7PBvKVl?=
 =?us-ascii?Q?bJ1N/1uXx8+jOgq49HSTqQJA5D1byxm+EmiWq8jh8bsLyLhKrh15ka4pM1xM?=
 =?us-ascii?Q?CF+awV/v72hrdqu6PGBKUn8OTpG7iDMeLKKdCuOVaZrro3WX2tDy70ViJ+EH?=
 =?us-ascii?Q?M9aMHG0v2NdIZQiUEi0FxoUJM7BOAJKnSKMkJ+jHeRRwuW4kS5XH6RO1EC6e?=
 =?us-ascii?Q?lUFX2HnpweNOUU0R2RQDi9JBHck00jOBPlrWdyNWN5MlEsE7p5u7HEvvNQOI?=
 =?us-ascii?Q?hZpZExTGNhrR5e0SdAmBwNToLIuQ1Ag7z/iGrShAxn7WNXTxwnzhxti4hPLU?=
 =?us-ascii?Q?GuGLCQdj80A/FCBdGG+WwruhwZ7JVxGs1V6Z7DFtDMspBTeiozPiX6HY0DDG?=
 =?us-ascii?Q?51rWzVhOZ/koqtw8Iojp9zllag4wwtVtcZjROC7vkXh3sGFqHXeifHDg/s+g?=
 =?us-ascii?Q?e0pS62rygPZauaEzDE4TjGsGz16CAJfrSaMp4vJLT+eT1LGPvk7R1fdY3FqB?=
 =?us-ascii?Q?i0s65XortuCrYz8lfOPAxpYQYx5Wg7vH0jacZJ8Sq4F/KhexWS+8Hckciv4p?=
 =?us-ascii?Q?+Xg9w6sToJ+wUNLwlC3XzE8tu1C3t/z67z3FTZ1LGjB2QtdUo6ETkP2PZClL?=
 =?us-ascii?Q?L59SV4omClPEusNUjyXBgOzg9yhknMSoyR5XjRNQzXjWNRhVp84O1teyVa/F?=
 =?us-ascii?Q?jrtacZe2NoWodoLODRX40KoENJtLUOhd4Xqd0QIKM1/YX5B8Fzb/GELWSeuZ?=
 =?us-ascii?Q?OCMs6q/4DIVURrSaxxPA/s2eCfAaL7zqr2LcYmRJ2aEwgywsCl6Jo6uD+VOD?=
 =?us-ascii?Q?6k9U/ZnyPYyvl8LvIY65hfhVf5wjMMknV8Sb4d2EwnzRc82JXsgynzrcadAd?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccea5255-3bb8-4a4f-2558-08db0f78c285
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:19:14.0335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BirAGNKUgYa64iY05A89mzVOOVqp20Pj70dvk+MWmYjZyzculhXj2BOSY4lxvkL0MhhdN8R84Vz00/NIQWx82A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 08:24:51AM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Feb 2023 07:37:30 -0800, Jani Nikula wrote:
> >
> > On Wed, 08 Feb 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > > On Wed, Feb 08, 2023 at 11:03:12AM -0800, Ashutosh Dixit wrote:
> > >> This reverts commit 0349c41b05968befaffa5fbb7e73d0ee6004f610.
> > >>
> > >> 0349c41b0596 ("drm/i915/hwmon: Enable PL1 power limit") is incorrect and
> > >> caused a major regression on ATSM. The change enabled the PL1 power limit
> > >> but FW sets the default value of the PL1 limit to 0 which implies HW now
> > >> works at minimum power and therefore the lowest effective frequency. This
> > >> means all workloads now run slower resulting in even GuC FW load operations
> > >> timing out, rendering ATSM unusable.
> > >>
> > >> A different solution to the original issue of the PL1 limit being disabled
> > >> on ATSM is needed but till that is developed, revert 0349c41b0596.
> > >>
> > >> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> > >
> > > pushed to drm-intel-next and removed from drm-intel-fixes.
> > >
> > > Thanks for the quick reaction.
> >
> > Please always add Fixes: tags also to reverts.
> >
> > I suppose we should fix dim to also detect reverts, but I ended up
> > cherry-picking and pushing the original commit out to
> > drm-intel-next-fixes before realizing it's been reverted.
> 
> Oops, sorry!

That's my mistake. I should had thought about this when pushing
and removing from the fixes. I just realized yet, when this patch
showed up in my -fixes cherry-pick again, but without the revert.

I'm sorry.
