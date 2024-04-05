Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191F899E74
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 15:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34357113C0D;
	Fri,  5 Apr 2024 13:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn/gGadH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CEB113C0D;
 Fri,  5 Apr 2024 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712324227; x=1743860227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N3ZvLix1kaVqWSc7ZgBv+so5BMChVxRYhWhR/pDGFb8=;
 b=Zn/gGadHyd1hDCaRkBCi2p7gY4BLXZl+XV57yfkKaGVcKzAJn3werfPb
 EJoGI08a927Qqf6Ptg+AQ9VmuFqruj6hdEzWT8bm+vgFAs12UK2ISfOKz
 HiiuzWYBc8qVPd+e25P13bX917fUUAS4Dtq4GOm5ZwAu2OTQCntxM1rSS
 SNDYHe/YuPUUiX/Lv+TxE5MXszIBwnztBnGj9EHA5RNSApZcKwlMvXe5G
 s/mqVYd63s/h7UPCVvnTxrDK77BbIEwkPWBSLfoxlp+ewUWsReGAoaGLt
 P9DooAdc/nL/+8PJK7aRtlcoTLTsj57ri19RuxHMZlOddPuso4r7fm0OY Q==;
X-CSE-ConnectionGUID: RE8QT7VFTYq25w+ft0i1Mw==
X-CSE-MsgGUID: W8Q0lEomRjKks1xJaJr7HA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7551387"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7551387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:37:06 -0700
X-CSE-ConnectionGUID: VD+lS4WiQOWqlsc182b6Jw==
X-CSE-MsgGUID: Mb2yvhLiQjWP0qWAui3fzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="56641232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 06:37:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 06:37:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 06:37:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 06:37:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYx5fRYEDlJmfqksCQO2sqefFJAQ1OhjlIuYuR5rf0rGHa7yHUQRVoxwTdNwgyrXIoXV3zmqRgBDypTHxzwlv5CAi4gnfoLhEzDdlNpkB9rvRP8YJA2HkU7uJ/3Rt++LFRz5H+xg9Y8jjR7OAZjpMqdYn3vpy9fvJLDeEojpeyGGQscYFojsQfIKzhljMjQc1H7gY3V5ojNBJziYbyCiGICH1bukdBrWY58q98O/BnTI8l+SZQDRNxnwUNg0jMqqm23UT4uyLnvM7PE+fZ0PsFL3rKx0Y/S1pnyQlAxtwFc/1qXamXgpJpQOUvlEIIFBjI6gyjOxfswp8v73uOZBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPEb7jloCQuqKOQA3X2trDm6G61+y/qljURGQFW4/f0=;
 b=aXdu3ocI/08Kcj9am5gNZ2YXzGD24qdNosgNkriOrsY1oc1+kYVJlYK71ceu2g/Riw/77bKdkuoA70HjqnCW/d75JY7zMV4HS9I+SZbgelSQA2D7Moh8QDc2tZCl84WTH0kf2RuAhON48IyNKFkLhmFo0lES4weY2Bwwmg4CsHLwVf+kx7SOlRZocXmX6dbVkWXByA1XTDaSSX5VEjjYcvbBuvp3nrLvJ6p+RxEMUhaYV1SL4c/0bkAJoMjh/9lSz+9c4aYI+nSN/F21pjpO2ljrAKgjIw8DG4btz1Pv8Fa8dLfkteNx7+mdhD8sO7t/koPpWMP4tg6Xsa/+yjM2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 13:36:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 13:36:57 +0000
Date: Fri, 5 Apr 2024 08:36:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Maarten Lankhorst <dev@lankhorst.se>, <dri-devel@lists.freedesktop.org>
Subject: Re: [rebase 1/3] drm: Add drm_vblank_work_flush_all().
Message-ID: <smeojxujor4l3bfq4leozrbqvqufbe7elznkrbhwtvduqzqu2p@op4kymwaxudz>
X-Patchwork-Hint: comment
References: <20240404104813.150030-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240404104813.150030-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4821:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZqjvkwH7nHtB3Rp9A2/78QPBk6XogvQ+LSVoVkJuAPvMnmsOPRLgquhfTCliK5F8T+9hpnjqbSaFkKtSY9LeayUNOtNrUOgW4oKLrZyuKONBsapjIDvC9CBxXTq/OJ69Xj36Elpt7Acr4eOI8KT71a1z4chLVW/Vk8nmIjmrp4N5zGtzm9rqon2YUweO34OtXVW1y/bJYi5sFUcqrFS8QJXedK9kiu4IwFz1AiXGg4ftuNeV74/oT/LCc91cq6/o0kIgmSmC55eviP6Pg8+PxQTVl/CkDFyAhp1rXU2kWLGLXRLc+DfEYepJXpLcr9Ms2OzRXs6tjXKAOjkM5wXh31TXMLzZonEvzBbJXgvcICSMFhUIz4DsdT1a1jCehZe40u0UJUvWauajbGOIke3kptb0SBv8r/EucHyveaSykWN+rk83Q1Xqp1XMCLJFcDs0xV8z89dT0tb5Tk8w2Ing4EuTT3mC6XJ4+BN6vTk4r642lhS20ckMDr7O/8dbDU+9j/BSDEGMkCa/oAOGMM5P5tj+f0FD9j8vEAtzPKB1jd1pC7S1JYqrILMgpsSuAln3/7hieTuU4bhQcokrUG3WM0uCCMq3Iu8ELhxZDgI4mGq1GQF4aNGrDpiL9XLGOilW9W71nWHnt1ZDLu+3UevGzD/Dj34kO8n2lYuDgAq9H74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HuqQCxsFSwCrWuIngTPfg7bApl4QYDENsrucoipiAXAy3c42vtdtkM3T4NYW?=
 =?us-ascii?Q?uqwOLFjEWgO3jHZoVUgiJhzudZvU0Si+cbP5mz4H/YCfEe/OLdnm/I1mtoMC?=
 =?us-ascii?Q?cGAN45zndaNcqRdtr8JlyO4sxWhdVoOwvaLIE943aYTQYbZmOKy9VF+UAyq9?=
 =?us-ascii?Q?Kq/jv1rO2FomPrqGpwRVtG+r0SRWJRSjkr+gC0Blg26Ups1MoRGZVALW51Pn?=
 =?us-ascii?Q?t4a4ir3/sWwgnVXr3kuNwwkXcZG4mQYfu8KkkFrTvTEQJcSSfi9tZkr5twLY?=
 =?us-ascii?Q?fHcE1sCiI00KxjqkMZHBahaU1cqTO4Wml1bRPl+Rxg3ARcP53vxgn4hVpekb?=
 =?us-ascii?Q?i7swYX/fNESAFcyf2Sz7mqHBKUgScw8hn1n1GIIlQ9mhGNnJUWRLttsUX0RK?=
 =?us-ascii?Q?4j6GHPAbPiTx4MEDwLaUXoWZvnEDcNGoG5WHHcaPRkXFlI7hbGsMI6bL1AnE?=
 =?us-ascii?Q?178wKpAj2JPXk0C9Y9qJbN/9X6wIEVQ44vf5O7XOpe/XTEQx+AyFD6Ododlm?=
 =?us-ascii?Q?FqEgRjty7GVG6gI7fTNZnJOVpEit92drxW+GffRSa92uuvOKoS5BgHYTzNzC?=
 =?us-ascii?Q?oFb1zfSA1n5uo8sW+9C0IepPYJww4EE+6uwDXJlUoMjBVbAdeGWN7X3a/RzD?=
 =?us-ascii?Q?+0Hk3OV8ZxXO81HaEyK/9sbn8oRPb0iJbDaw4W0TuQOM8vbqKjLJEPhM8bAV?=
 =?us-ascii?Q?24bzIbAeWNbT4E0BZ6CW2SbbzEtEZoYKmiZJJeso0Ra1VjtJH+qZsqx7YHs/?=
 =?us-ascii?Q?CvFS+crXS+p8NSmUghjn6F5cCda09ubS3Gpnj0g52YaLPtoo9NFaUOS3yuV8?=
 =?us-ascii?Q?+1oybdz6YaQjnniPAS3LQhrFd6fDaQjlsdNAUNWxRsiaPbvvpMSIrvrvapPH?=
 =?us-ascii?Q?LUTMu/PzJVhVe+Q30+EqlAFNcVhYeAOg0JMTxDkWcY9ZSkk8gws/4P10usWI?=
 =?us-ascii?Q?Fb9c5LAfFe/clBo5CzMXkNxSeBbZ3N7nsIP5W/t9JsAsxgqYcS+44k6k2NTW?=
 =?us-ascii?Q?GxJAwIZOq3bagpRDgbWneEZ+LbIp1QukAmGZKA8VoOKxlmORXwW4v8zMVJiq?=
 =?us-ascii?Q?9G298H2zfD9G6O6oP6ryfUxGRovXZY0zzK7bX2iLpjwhnQiy2r8P/B/tuRvE?=
 =?us-ascii?Q?drjquDiTfDTOxXekmOPXFZt+Lr/gBiwjeq4aFElwFdXx/0OTPWwGTMPCvgSY?=
 =?us-ascii?Q?Hn2fymqioqW3ECsDXHr+rxuQhg25CZ5tCU04Q8ofMee/6gcmSf+RWB2Pos/W?=
 =?us-ascii?Q?zI/IZvHSDPRKm4+KDehbhcMAAeDuhdtvNuh627+MZVHrCoDpY6/Z1J1+ojG/?=
 =?us-ascii?Q?LlHp1UogfX9KtrXLPh5o2472h5dvLHuAV9GwbJa9j0ykc/uFuMZyzXejv6m+?=
 =?us-ascii?Q?J2CtBSLBlAMW/Pt2/Soc7YdDHkxkEg6TKl3Pk7SKLApk38wov8YkQfbf814R?=
 =?us-ascii?Q?TRftyDTAcDQYotsUgz+aYOl3tVVO6kW2G0FmkjXhOt3Wkdsj6IiMVbWyNy87?=
 =?us-ascii?Q?+JozrMMdH+oL9SNkz2i+CwsOMedQIhxQixyTt6Dq+ROzdFp5RoUANOtahUEr?=
 =?us-ascii?Q?FtuYWZjoyewzzk4vFLmbit1FpsoouU21gOgRip2Pom1/ndIHolr0Yk0fcigo?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b8699b-1abb-4aa1-c971-08dc55757689
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 13:36:57.0516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxhRsrzQaaSsCV3VO3gR5hLxGlrQG/z01RCulx4mWjtTFXOn38hsbNF9yuVVO/eXhWteEe6e5JDmsOosCTgzE/BUtxGqLelRQbUQQv8ynZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
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

what does "rebase" instead of "PATCH" is supposed to mean here?
And then we have a "PATCH v2" as reply to this one.

Shouldn't this go to dri-devel (too)?

Lucas De Marchi

On Thu, Apr 04, 2024 at 12:48:11PM +0200, Maarten Lankhorst wrote:
>From: Maarten Lankhorst <dev@lankhorst.se>
>
>In some cases we want to flush all vblank work, right before vblank_off
>for example. Add a simple function to make this possible.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/drm_vblank_work.c | 22 ++++++++++++++++++++++
> include/drm/drm_vblank_work.h     |  2 ++
> 2 files changed, 24 insertions(+)
>
>diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
>index 43cd5c0f4f6f..ff86f2b2e052 100644
>--- a/drivers/gpu/drm/drm_vblank_work.c
>+++ b/drivers/gpu/drm/drm_vblank_work.c
>@@ -232,6 +232,28 @@ void drm_vblank_work_flush(struct drm_vblank_work *work)
> }
> EXPORT_SYMBOL(drm_vblank_work_flush);
>
>+/**
>+ * drm_vblank_work_flush_all - flush all currently pending vblank work on crtc.
>+ * @crtc: crtc for which vblank work to flush
>+ *
>+ * Wait until all currently queued vblank work on @crtc
>+ * has finished executing once.
>+ */
>+void drm_vblank_work_flush_all(struct drm_crtc *crtc)
>+{
>+	struct drm_device *dev = crtc->dev;
>+	struct drm_vblank_crtc *vblank = &dev->vblank[drm_crtc_index(crtc)];
>+
>+	spin_lock_irq(&dev->event_lock);
>+	wait_event_lock_irq(vblank->work_wait_queue,
>+			    waitqueue_active(&vblank->work_wait_queue),
>+			    dev->event_lock);
>+	spin_unlock_irq(&dev->event_lock);
>+
>+	kthread_flush_worker(vblank->worker);
>+}
>+EXPORT_SYMBOL(drm_vblank_work_flush_all);
>+
> /**
>  * drm_vblank_work_init - initialize a vblank work item
>  * @work: vblank work item
>diff --git a/include/drm/drm_vblank_work.h b/include/drm/drm_vblank_work.h
>index eb41d0810c4f..e04d436b7297 100644
>--- a/include/drm/drm_vblank_work.h
>+++ b/include/drm/drm_vblank_work.h
>@@ -17,6 +17,7 @@ struct drm_crtc;
>  * drm_vblank_work_init()
>  * drm_vblank_work_cancel_sync()
>  * drm_vblank_work_flush()
>+ * drm_vblank_work_flush_all()
>  */
> struct drm_vblank_work {
> 	/**
>@@ -67,5 +68,6 @@ void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc *crtc,
> 			  void (*func)(struct kthread_work *work));
> bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work);
> void drm_vblank_work_flush(struct drm_vblank_work *work);
>+void drm_vblank_work_flush_all(struct drm_crtc *crtc);
>
> #endif /* !_DRM_VBLANK_WORK_H_ */
>-- 
>2.43.0
>
