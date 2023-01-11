Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A123665E9D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C771F10E757;
	Wed, 11 Jan 2023 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3A210E70C;
 Wed, 11 Jan 2023 15:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673449260; x=1704985260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5TJ/bgu+pCgyshbImZghLSq0xbo/Ufa+G1i74+3HVv0=;
 b=cSzGAdFcXI+vTURW+Jg3cyokMXvhJWF8/XFXCZzMyBTwqI5MKAlRLoo7
 tS7FI6Njm/cotUud+fbe3ZQLPY5+QuKsyvHR7QmNqbFwFwViahLvZKCCA
 yvmLBwblP9KtRmahInU+diH2njLT4OkDjh5sOnUGgdkyKrjbwjz7T1sD+
 PtZqe1HoYr5rdR7i7i4FkjCjL65Xf/oQuqOAC2+WW3F6dBumkhjGOiyx4
 lYkNSj/unLxEfldgPAeU2wkrtkIEsooCbO3U157SxG0PENqgvXFlSffhI
 dHkykRRlGhu04MxTssjGa3SaLJQ0GgoNW9Rg1ThaTnebcwt+u70MwX7Xw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303803204"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="303803204"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="725945701"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="725945701"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jan 2023 07:00:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 07:00:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 07:00:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 07:00:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 07:00:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4tGkrKGyVN62RGrK8bR2+usiEFA4HxPDXA028H/lsWZzxcv4FB5c4wmGLiBHV/FnpDgtn2qv+UPsqW8LlVyLzZaFASV3WrVry8YQsOZr+MRLUYnF8JFYN0cJXynE9XtUJYQK4Yt0iB427R/n0k8RpYQu6jKYiFum5xAQ7+NDjBGhacmOXmRR5quXGJd6GyUKUg7021NpYCKomc6KAIzWjfBCtbB/36D1JDMKsO3eTMUH1mXQpGbbDT/G/3bsn+FAEkqglGateF54i1+l0gDzT2/pL4pWftgixhrkPGivwei+7f3Q5hauPtZknnHNfN0ESX8CZiEI7onv3bch/pxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yLSM1GjiJfYS3U4/bs2osGBzsIxFjFltGfuLctmsOI=;
 b=Ef1XK2cPoqran0NMY5czfhgmCkv3UbZJ0kPwvZb6y+H9oZqUdz3OLYv1M3un0qo64bm1NBrGBXXHPuxSqIDObMWWMcnPMXsB5rEpAe8YKKwjaERaMQM90k0OTmzQBb+uHM9t5ZLGnSY3mo5bvyzoZwLYcTCCb+Z/qd7o7MFGC8i/MM2iWc9eSvq5FyG9DLfpjnU/vmBlME6NGN+Tq3MLt52q2xhNmwzFFiG8+W5qdM6QY43ShmoGR+mxg+rpCkewSKwpquNWe5wTTK8VpH0zjEby9hzVc5IlhVahoHgCCAHGTeF3goUpAjQ/eyP2TYW52dAZKOXL6dEHzbeP+Y9+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5950.namprd11.prod.outlook.com (2603:10b6:510:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 15:00:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 15:00:16 +0000
Date: Wed, 11 Jan 2023 10:00:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for vgpu_status
 debug attributes
Message-ID: <Y77O+0uGm1GRZnZd@intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com> <Y76JGj0cJpYr6/rv@intel.com>
 <Y77NfeKbLL4s/Ibg@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y77NfeKbLL4s/Ibg@ubun2204.myguest.virtualbox.org>
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 3959b9c3-5212-427d-016b-08daf3e48c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxBCAKodKGlJpYsRUEM7b6unSHo4wsh1YOBebrwOIKKD1iz+N511uVx7Ahqgxfa++BKuO/1njNsLjrKK766/RSYuCyL5Na3fIeSKiw53C2csHS9szPGauiIl8UJ27JfNATJxWJnYnlXYLme2a/mvsklmaqmj5r4L3LZ6Q6LN9+fYvjzGhQU0AGY+nE7O8oizvLDTxpA+4BpiTycGHSMBL0yC8QPqxcvXd4zRHL2zhTewLlnmXqKhhu4yqZiS7zJx0H7JlELu8T62ciiZmUGXarqTeTJ9yuKyINRbvIMJgr1qs5a2GPuOfZ+8cUiSRSe9gz1Lnm89QfQH4jZZFZiKMWua+skrZhcI7UROIcT8GJsnY7/LwxhGEUzm0UKyPYJRmns/K4mZ0BTeoIykr1jt9pq4cxtMDpoS/zW7EY1wNTb1l9lc/kWG2bSFFsFxRpvKDq1Q5uWiQy53OGCGHwQa8X0v+g3ivvaWCO8w4GDdoyLmzC8rBEczc/lT54cSCJ5gj3n4NwnN/s1fs8nye5q/vIvsrzyfZy3gUJ4voAop8+p8jPkbzQYFuYp8lnoq5b4VcMzaINisJVpRp7HJ2fZvsTvFFxzheCcr4BAAyRfRZOfxcbHVGst+fCsshKSdi2hEKLBYfhrPFVuAkyfAZl1SS7OqS/uHXInBqCv/ELThI7b01ZoVkPvJ6AhqODTrzEQU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(6506007)(26005)(6486002)(478600001)(6512007)(186003)(6916009)(66476007)(2616005)(6666004)(8676002)(41300700001)(66946007)(54906003)(316002)(4326008)(83380400001)(82960400001)(86362001)(38100700002)(44832011)(66556008)(8936002)(36756003)(5660300002)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zohsafeeQMgr17v2CqTPhHaKiL0ZHEG/qxjJip2jO6o8V04utRUsr7ekWEF4?=
 =?us-ascii?Q?MQJQXtD4gov0jKeYV6MefYpUDfiWpbWwJwEG5qfzheXsP+ZRwa0yx1j0vBXy?=
 =?us-ascii?Q?T2ZAgRXGVmYRE42x/bEERBCoM8p1Cswl1yHlXY9lrmJHytoYDa8+pD9Ijsgi?=
 =?us-ascii?Q?SCWoYA9QkmQtJT8VZW9+zWMvadHF1OXR6GQRQzfpr50XcW3vjNHUOs7QKhA/?=
 =?us-ascii?Q?Nqt3duRcQE/KcAIWx6+0YtRedRoV3RRQvcnwVjf+nWSXdhcU3KnsZmtB6LkW?=
 =?us-ascii?Q?OSIOPU55NPHoeaec4eUa6aL8IkCjnCE+CsWFvi60JLT7jrFEjXUOAdv+5TB1?=
 =?us-ascii?Q?0KrQSYHWz3zVSCLGjJwZrlY/bDn00QIXNuLJzcldhet6oyjl20jB432SA1jl?=
 =?us-ascii?Q?mRAeGq7si1BNFFq78ckU9cHCr2ssWdsANplC7eGk3ONdZwppF++1apCctc0O?=
 =?us-ascii?Q?kvIKQfoh9W1YpDYFtqHZynyqEAzqIi4OgSGd3xcPdw+H4xH4MhzA1gQ9bWgM?=
 =?us-ascii?Q?PYQH9jUiSl6TecC5/KW+L7XelM2BQ4P6RYNHlpm25pa12cnr4SFG6qeIJREf?=
 =?us-ascii?Q?JEJMZ7BO/sfM3MImC4bDQ1LdlkOrEqopQsw3uLbl8eVPjae5wzYXUARKvTZ2?=
 =?us-ascii?Q?5ZI1MQUyQ5wMSAAbyUeFRLhCbDfMbJ/tZqGUugyINIXfFntZ4sLkZualNZe+?=
 =?us-ascii?Q?UYFQkyCwtA+YqMB4pqKlMVZbOlejCsx4YAgAwsH1mtBQdWmeHu/k+Fs+Ely6?=
 =?us-ascii?Q?cDnNyREL6cem5rhvYJ6awW0LG7qS5nJbMxkWopmLC8WDyzOxjPYglymGv+xH?=
 =?us-ascii?Q?itloru51EMDc52h/NOk8RhEbNqCSFDTtldODmcr50K93ErTouGUg0XtCk2jP?=
 =?us-ascii?Q?EyC6NKniQSPfVwSxnLRlMkwxuC//52f4YgF0qE/5tujs5CyJb5cRRi3MqDs3?=
 =?us-ascii?Q?hvglsNPd94MXwn+LIs9WQec3kpxzBvI6Zk95I5VkXN8+TZeB4jx5H99M3Y4y?=
 =?us-ascii?Q?lHAXmyXQXND9pedHeQq6mecSxQU6QeZGJn9LbfbF4WuARfPmID7UeU6cMsAm?=
 =?us-ascii?Q?XGMaGV/DZWEinW9wP6axc97WxRukJk48Gi65jnPcmQMnIjtOy11B8Fjf1oL7?=
 =?us-ascii?Q?EdjBPvCZ+nJX2ywRdCoqZUyj/haRPZSdH2y8OuyFlPMaAsQSi3MHrpKDKWDm?=
 =?us-ascii?Q?Yj07SlaZQbZ0hS/MxqVaxTVrIgv1xXB5UrAAHzpYtrxfnzTVAQGsmlLz7YhC?=
 =?us-ascii?Q?IbqlMyYAmPDjff7SLvZdWtjUNdWON0zwnxcYCvNLULIvAkpZgvRLFCbHsiYN?=
 =?us-ascii?Q?jBC2dVaB5RdObw00wxDHoojLojWNg7qGf4tH5uqeA82WlJrF686oEyE1V9YO?=
 =?us-ascii?Q?WHVwVt/ttNzvE+1ZQ5jucFS4Y33+fuFulCarOr8ckiS7iUUv8BdjMACGjWMw?=
 =?us-ascii?Q?YKrG99jl0dy9YmM0gNYH7XiNCb4N0xfmLSVs+l/RWRrOd9fkMdaKtT+ojEPK?=
 =?us-ascii?Q?2TNmqXYFpVCniDxGsOmCGpgCtNh7LsbfTPb+3usgMdwVskZgr6XG6F9JO/jM?=
 =?us-ascii?Q?FeVeRkpveXaBOwbm/8ldtcSc04w3p7oSm/2IKrdO22LX3akhjEC2wMbKK35H?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3959b9c3-5212-427d-016b-08daf3e48c59
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 15:00:16.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6S5L52XSqM3tw55SVuic/CfwfljAOhYSDYR5IT431gXZ3/X6LSXihUaoUawWZxlxv7LWhp/BDjxmpp2QrSyxug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5950
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

On Wed, Jan 11, 2023 at 08:23:49PM +0530, Deepak R Varma wrote:
> On Wed, Jan 11, 2023 at 05:02:02AM -0500, Rodrigo Vivi wrote:
> > On Tue, Jan 10, 2023 at 01:49:57PM -0500, Rodrigo Vivi wrote:
> > > On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> > > > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > > > function adds the overhead of introducing a proxy file operation
> > > > functions to wrap the original read/write inside file removal protection
> > > > functions. This adds significant overhead in terms of introducing and
> > > > managing the proxy factory file operations structure and function
> > > > wrapping at runtime.
> > > > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > > > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > > > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > > > debugfs_file_put() wrappers to protect the original read and write
> > > > function calls for the debug attributes. There is no need for any
> > > > runtime proxy file operations to be managed by the debugfs core.
> > > > Following coccicheck make command helped identify this change:
> > > > 
> > > > make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > > 
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > 
> > > I believe these 2 gvt cases could be done in one patch.
> > > But anyways,
> > > 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > for both patches... and will leave these 2 patches for gvt folks
> > > to apply. Unless they ack and I apply in the drm-intel along with the other ones.
> > 
> > Actually, could you please address the checkpatch issues before we can push?
> > Sorry about that, but just noticed now when I was going to push the other ones.
> 
> Hello Rodrigo,
> The checkpatch warning is associated with the long "make coccicheck ..." command
> in the commit message. It is not part of the code, so is should not be carried
> forward into the code base.
> If you still want me to correct it, I will need to split it into two lines which
> I think still violates the commit description guidelines.

This part I would just ignore or fix myself while merging. But the next one about
the parenthesis alignment need to be fixed in the code so we need another version.
Since we try to avoid touching the code between CI and merge.

Then, since you need to change that, while changing that, also please break
the coccinelle line in the commit msg.

I'd appreciate to have the patch for the pxp as well :)

Thanks a lot,
Rodrigo.


> 
> Let me know what you think.
> 
> Thank you,
> ./drv
> 
> > 
> > > 
> > > > ---
> > > >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > index 03f081c3d9a4..baccbf1761b7 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > >  
> > > >  /**
> > > >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > > > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> > > >  			    &vgpu_mmio_diff_fops);
> > > >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> > > >  				   &vgpu_scan_nonprivbb_fops);
> > > > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > > > -			    &vgpu_status_fops);
> > > > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > > > +				   &vgpu_status_fops);
> > > >  }
> > > >  
> > > >  /**
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
> > > > 
> 
> 
