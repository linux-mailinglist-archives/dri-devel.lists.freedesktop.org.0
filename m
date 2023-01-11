Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B289D665F02
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D849510E2AB;
	Wed, 11 Jan 2023 15:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0E610E2AB;
 Wed, 11 Jan 2023 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673450689; x=1704986689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UYAQLyTzyr4+hanG3m/DwwQ1JXrtbUB18Ltn11rXAnY=;
 b=GwIIBgoMH0I3Rq7BlthFSTcVTUCosa9XDhQ3DBgfMaCH26Il+p31QyIH
 jG4JAwIVg7IqgAW+RXDv4xptUxysN8QIlX5x7EXP07d73N8ACojhN1YSN
 hmVHCUzlutUbYWAUFgQaDsvwGRa/OJZ+dO3ACePyoWNmqLU/qHhQ1+YZL
 Ke1egAn0PjAZrnksbMZ4ZHNSk17eY8L4buwOYJcQDtZEC9S9DQKiew5OW
 g6hB1XmKwrMszOyDaeR9cCTz5RW4Dt+SR9ZC6hopBP5MPM66IbVpSRHzV
 Gl3NVqORrfBexQtmBluX0DNwPTuzDBq8W/5k8dXJnHoYVghhTpfjOFlEF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311251354"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="311251354"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986191391"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="986191391"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 07:24:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 07:24:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 07:24:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 07:24:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 07:24:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPf4mieXoB1L5u/tW+EvD8KdBXiY42HMNTna28LJQ1VB48wafqtVIF4mtp9h9kSXQzdZ0Ti3u0GNkv1WPFLKSVknZ3VGTz+d6Tbh/Zy0/RGWh4dwbMysa0LkOodu1JJ84sJ8RPWgRokU87ubk/DXRBWiNcwlSHmatiqAlbPudGVhZKxcPjGrHMKCE0Ym7LMEp0ot7wGBSqLGi77QOWyjDGo07XAlImAcSlp3vlkVLfk9+zg7cqgRj5Gyts/pr/Zi4w+GQBDPXFQsHAuA4UGZkdudWvZzHqWbbDDXDnprelbvUOvQpZhTXf6r4pGMqapSI/70oyGXLasTHXbj1j20aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3a/izfeMlaIOgOwA/vigYGgbw57DC5jiJbgGwGDFXMA=;
 b=Ppg4PVCEhYACq9Vrytfu5+lyud3Zse4OAp4ARsGaOvrJY8R2IvPrraw+diZJ5fCTnfAuFLVBkbAfYPMB0539Dae1odjxN1Eb46OKUFFrlcbZU8eqMs67zk53bU2OawkhmjsxyUByAJf+0cKiPYwg1cbJdHWWhwMVg0oPC4jsFOHntqkWTMkMl7OiNUn7J6R5GLqUAjQRO83YU7Hlpj/dMHGXPrIBvA603updLGht65LIV38JKqU5j5fIeXY4qGcXxJjnN/xETud9Ap26uMo8go50eRZCUIz795OsTKbUYzW/WMme9EYzpaaS8Wfwxb+1EDVh9l+txWJkyUCpE85mmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 15:24:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 15:24:27 +0000
Date: Wed, 11 Jan 2023 10:24:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for vgpu_status
 debug attributes
Message-ID: <Y77UpjMG9t3SIkMo@intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com> <Y76JGj0cJpYr6/rv@intel.com>
 <Y77NfeKbLL4s/Ibg@ubun2204.myguest.virtualbox.org>
 <Y77O+0uGm1GRZnZd@intel.com>
 <Y77SsDGaZ8+BjXel@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y77SsDGaZ8+BjXel@ubun2204.myguest.virtualbox.org>
X-ClientProxiedBy: BYAPR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: cc848206-8e65-4a3f-2333-08daf3e7ece2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z8wrtJUY6NzKZItU2gnxdKU+LjLGNxXpbaV167VGWAzZrtigmpNxOblrS+wxO+FUu5/TgHlzMA6g3renQ/naOQIaQpp6KSf2ZL0hmbrGDe7EZn6PoU8g20bf/HMsrOsEMPBqabGSXdxcsrNXoPkTmhBl/jivJd2QZgFBYS+IvlvWlxB0OK0ruZHkfMGX4mj2xdYPRLi6kPjfYEZclnebv9Wde50wi43vOOIir+8MiWkhoWe83wvBukCUED/8j/GhlPi8nri+Hd3id16l82w/mLYGH0rYt+mbmfJRsCQIxb2f4wZbR1fMul9FMua/S9xsmyNI+LrA8AnDfVp0trBDWSC3CBtWeacC/YDOZRszeGDjifstIHP9GG2FbqMiXcvkrpPPKcSf469rvr2cW4sNSobXRbFZt85pNFK8+pSgEDPKIM8lmc8UUa8FTT7ArnCBVD8JklFBlfrdpdpvmLPCmCborVTJmG81D1YA/DrSKDYcbAdt32S7XSwBP6HCi0jIuzPRyO6t+37mXjTDXxmUkqadZnzuBxvNFQhR6aqhCRWbGBnKZGldZaFOIbkQGLkKlsdZt0QWwMz8XhExW1rQowvEhWv3XXPFBJnFt+XEwW6sAEHxkSmPUfQ3UaqO6UW1BoZ1yx7xbTgqxAyleWHb7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(36756003)(26005)(186003)(6666004)(8936002)(6486002)(6512007)(6506007)(2616005)(66946007)(5660300002)(66476007)(66556008)(6916009)(316002)(4326008)(86362001)(38100700002)(82960400001)(478600001)(54906003)(8676002)(41300700001)(83380400001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1PsoCFlpjgbVFQ8DpsaEe4ebIDzrpKMGu8PI/AHO4jup9uWcN/3peQ1DPbGj?=
 =?us-ascii?Q?Mn2I0EYpEYrfIJv2kXxMf3Cl+4/oz0jNiS6CJ/b8rRj/hLqPpRyykllQJttV?=
 =?us-ascii?Q?0LYtS6TJ/ZvnirFZ/sZpJU9+/RJIE9bJ4C6FwK9dWu0x/P0WG69Q8ErS30Qk?=
 =?us-ascii?Q?DVeIrVhn1GLCgbDLzSreFD5I2Fh6osBh4MteIXkXs3+2z+9EMVsy4smAtStE?=
 =?us-ascii?Q?2c8DBJmFx6/KLiGEYKIG3fxTF+FPdRorr+9V32UblY29wKj1L+KWH3fSpDxO?=
 =?us-ascii?Q?svBbi0dLzSSrUtF29KxxCP0veud4L5HRG6NPFUQpuQCdwYVRnGhyP3RQfWBo?=
 =?us-ascii?Q?5V0JR+mbZitYuKbt2fNcBAYutOhLRkfzHcp9lUGiClKalS0JAWDcYKjTmXAE?=
 =?us-ascii?Q?W2KDh3nRDr0l+b2Nsc1VTrlbPIoMBnnxq7V/uTL5i/4G5uX4kcVNy1ZTZQqN?=
 =?us-ascii?Q?J3Z+U9IGnujGA2CGoVgmgz90M7OgPJg1n+fmB9xP3BCT5Hto1Ar+eV3K8++g?=
 =?us-ascii?Q?iTnZ4FHi4ZxRCqogv+gfd4asNQo+fO5ptxKshTmOnhD4BOHH5iTEx7QSro+p?=
 =?us-ascii?Q?W0ceUbhlE9NrGuHTPHS9d9OzlHZJlxTtfW8vTkQSQvPZIKNGrY0/p5CAYokr?=
 =?us-ascii?Q?6pjAt2sz1A4fRmPvH2ei8+BJICJfZNEEUhU3h8r6TuAJpTJbHrLU8ruHfiyk?=
 =?us-ascii?Q?UUVVO8dTtLCIzEnGyJFc8iyedEYxhCqW3KmmNFwq8ryEJnZTyBqzl8k2WDuj?=
 =?us-ascii?Q?YZGe8zX9CPJpb10i5L0ZTT06Qozqe1gh93R+GbWmMnWk6tEexswiOX34o6RX?=
 =?us-ascii?Q?8woBDGdKUVdXGhT17t89mH5khjaTArt5MXOO7od4Id8xf5BY8AaXgOeWAAbi?=
 =?us-ascii?Q?ltBgwOD97Ivf9eYRg0n2croB6R7VmxAw4VVuQbIsS5OH6vGojUPjlog+bVq9?=
 =?us-ascii?Q?mw3qdCxmWj5hX8lyXENUfa/T63RjciphX2eW96ZvD7YtDjMHk0o99lnhqtjb?=
 =?us-ascii?Q?DGiLyMII/rzel1wMqUFLJIGuAfNRWS+jyf8rtHCQDypBVSEn60ziea0rJU42?=
 =?us-ascii?Q?t7zTkkQpu57g2URfnlYO9DKM3tyqoGpab7H0pHNmGmfhaDjprGGvQzCND3Uo?=
 =?us-ascii?Q?OpdotJAQCTuBd8Nkux5XElq4wm0WbvoQpbNh1L1q9P5ihWMIaW9R99CN2RXV?=
 =?us-ascii?Q?pwess5bMmeyjkE8wSvsbSlpIJuIePz3j4jHpQdq+7LY23DJSOOlnYrUuxr+O?=
 =?us-ascii?Q?MwVOwwRZ2IjLRGrovLZUJKOAwjnc5nrTbwpPLqozO6PBEAZs8ilCoJ8CldGM?=
 =?us-ascii?Q?ZWyUCBWV6wzz/gRs3YEmXr3Phxn+NlSHKx3s4s12aN6sGxuHp04N/d4DgTxG?=
 =?us-ascii?Q?OXT8OfbO0t3HjRDKFWwpVxLRuh/Z/afTCgEFZ6yH9S58kq77I9hSDrB97YSd?=
 =?us-ascii?Q?4Uj9v6kJ74lNAjYpBo9xYKeel1cpUGcVVN7w/UuPiX6cZn35qGk+4AQD5GlA?=
 =?us-ascii?Q?0OK2/aL2bS1v0/zsNsvWQ0SGB2P8UtwjOdfR3yb4wHMgB0P0wPFH0k75P81q?=
 =?us-ascii?Q?OTNwBWgGVbloLMgBo0aZVFJqrvw+QjHg6y6mdtW45MFIAvYlW1R3XG9O1tRK?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc848206-8e65-4a3f-2333-08daf3e7ece2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 15:24:27.2336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSloRoZpximqVlu2EOqYhVs1LII4BM85va0x0J48m+V5qblrkP4PuSa2vo+tAzgTmtFyYhbYpk38U5828ZPkxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, Saurabh Singh Sengar <ssengar@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 08:46:00PM +0530, Deepak R Varma wrote:
> On Wed, Jan 11, 2023 at 10:00:11AM -0500, Rodrigo Vivi wrote:
> > > > Actually, could you please address the checkpatch issues before we can push?
> > > > Sorry about that, but just noticed now when I was going to push the other ones.
> > > 
> > > Hello Rodrigo,
> > > The checkpatch warning is associated with the long "make coccicheck ..." command
> > > in the commit message. It is not part of the code, so is should not be carried
> > > forward into the code base.
> > > If you still want me to correct it, I will need to split it into two lines which
> > > I think still violates the commit description guidelines.
> > 
> > This part I would just ignore or fix myself while merging. But the next one about
> > the parenthesis alignment need to be fixed in the code so we need another version.
> > Since we try to avoid touching the code between CI and merge.
> 
> I am sorry, but I am unable to locate the "second checkpatch complaint" you are
> referring to. I have received only the following from the checkpatch robot:
> 
> == Summary ==
> 
> Error: dim checkpatch failed
> 4c95e9b71212 drm/i915/gvt: Avoid full proxy f_ops for scan_nonprivbb debug attributes
> -:21: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #21:
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> total: 0 errors, 1 warnings, 0 checks, 22 lines checked
> 33d68a01cad3 drm/i915/gvt: Avoid full proxy f_ops for vgpu_status debug attributes
> -:21: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #21:
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> total: 0 errors, 1 warnings, 0 checks, 18 lines checked
> 

doh, my bad! this gvt patch is indeed right. up to gvt folks to modify this line
when merging or to ignore...

The problem I mentioned was in the other series. Sorry for the noise.

but for the record:

-:47: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#47: FILE: drivers/gpu/drm/i915/display/intel_drrs.c:386:
+	debugfs_create_file_unsafe("i915_drrs_ctl", 0644, crtc->base.debugfs_entry,
+				    crtc, &intel_drrs_debugfs_ctl_fops);


> ===============================
> 
> > 
> > Then, since you need to change that, while changing that, also please break
> > the coccinelle line in the commit msg.
> > 
> > I'd appreciate to have the patch for the pxp as well :)
> 
> Sure. As mentioned in the other thread, I am looking into it and would submit a
> patch accordingly.
> 
> Thank you,
> ./drv
> 
> > 
> > Thanks a lot,
> > Rodrigo.
> > 
> > 
> > > 
> > > Let me know what you think.
> > > 
> > > Thank you,
> > > ./drv
> > > 
> > > > 
> > > > > 
> > > > > > ---
> > > > > >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > > index 03f081c3d9a4..baccbf1761b7 100644
> > > > > > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> > > > > >  	return 0;
> > > > > >  }
> > > > > >  
> > > > > > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > > > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > > >  
> > > > > >  /**
> > > > > >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > > > > > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> > > > > >  			    &vgpu_mmio_diff_fops);
> > > > > >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> > > > > >  				   &vgpu_scan_nonprivbb_fops);
> > > > > > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > > > > > -			    &vgpu_status_fops);
> > > > > > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > > > > > +				   &vgpu_status_fops);
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > -- 
> > > > > > 2.34.1
> > > > > > 
> > > > > > 
> > > > > > 
> > > 
> > > 
> 
> 
