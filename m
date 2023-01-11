Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D2665871
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 11:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8A010E54B;
	Wed, 11 Jan 2023 10:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B558610E02D;
 Wed, 11 Jan 2023 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673431330; x=1704967330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3sOTMSiF0bXnUDWPJJUoCShU6VqAJ+rg5WjKZ6G0HSY=;
 b=XvfqvNiYP8Zymwd+KFmIsaf4CmGJ+GXi1kEK+hXb8Je59MPuA69ErC0p
 U6vAebDrY9kgOjOs8I7QguxCWdnSQz4v7IN3NQcXrPy4WNvbi57m2xcpQ
 CyLLzuzkHnoO0UVTXryvF3Rhln5/5oO/d2usfNJyhB3ZAvWc00HTZO2YN
 IqfX19uhhC8GdbK8XvIAJGsAbMyvGRhPTZchKWsFzceuxbbAJ19QNZoJZ
 /2FYeyWFrGyls+DfPiwe3WV3yIOObcQxPTvzQCIszlpA88nrz6rxXiROE
 lrzoyi7kmE9Wx85mCUKhoH7N9wqIBBD8AFdUffP58f+s5PTxCnle1Ul06 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322076418"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="322076418"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 02:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="902696549"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="902696549"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jan 2023 02:02:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 02:02:09 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 02:02:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 02:02:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 02:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLgDq4h/LLf/nG69ChrHo5IIWWRmfCL5SZ3ldLj7zh/PE2nmMm8ix33xuwhwV4v/iun7VIfaBJV8TBSU/h1hgi1Q7Qw/9sdO8/IjppMc1b48UWEuJJzCGptwGjsO1EVIsnINvP93dlfzh0rHKIjg43GY3V//07B34rOZ1mzqNGPn3AyH/Wq+FSk+wSSytOsBVPIjFuz/g83g5ywK/BWELQTwpTQdBNnwr+4CpHdW5r/uazTKg9QIgFqPskO4mAojtDehSUX9mUxnqOzq+VrH4nKRmUpgrVQjYrq1Ux+a4IiNfuVyxrkFbNyKhgf+q22sYS0g1SY0XpKp4Q4Y3eYY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Itlfl3sTMWVdFw8W57x1CUlu2zZgAHhsAociZpBzK8=;
 b=fUWYzXq7TXYS6glr8O6Wi0EX5srLXqaBfo8yyRYsw3HYWIeWQxzUqXA3eqTNN5bOvn4iUOLgpIDXgVag4wKhh+Lknb/QVwYEN59qX8Lb61bqfBGjdRCk1HVl78XDD+Eg2UkUmYwzmx0DruIGPl5t+f4i2G71dgmbutHkewBVaM3pMFn6wC6brQSGPCUCJd1ya2ATTZF+Z1pkCzr/NP4XqnKSzv5PJGOW38ecBFbky/YXTmsF9yfsKK58t1PLRrz5bS/UdygvWllcHNozIfB0/hltnBsKt4kHDz6MUkIcms9CJBGGiYAxCc3xhZeupstU94uJxoUvUaWyM+0OVuT5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7105.namprd11.prod.outlook.com (2603:10b6:930:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 11 Jan
 2023 10:02:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 10:02:07 +0000
Date: Wed, 11 Jan 2023 05:02:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for vgpu_status
 debug attributes
Message-ID: <Y76JGj0cJpYr6/rv@intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y72zVXYLVHXuyK05@intel.com>
X-ClientProxiedBy: BYAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:74::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5ff15b-3a01-491b-07e8-08daf3bae5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XoksU/LBG1EUx0GtvDVGB+ZxqcKp6syQIQmiUmh6/+EBS3NCAcOUaQy3h4/ncmJC0TP6InTSg3N9NKTxVq/nuYwUVumb31OhFpGExcjOzq+79vJX7xaUOgx6Uyn0Tk57TvBjsY4U8trD+s/Wj/bvBLyKEI9J3LlMfu7YXYu0G/ZNn15vhEpUaUsiDvN7tOz8MiDXAJBE77Y3vVK36cmDzk+JzBekkaVWMWzo56Kxh5zKXS77XNTCAMAnfjZ5nuLDKda+Kb6A1t8f0YWDzZVl1FPAYYQWMBVBDGaOyjSxvE7RtioAF7OrWucMdsmFir9s6HXrm5VcGf3LRVorVbKOj7WPgk+itHBiLckSKlq1M0mxVclns6HnMMCxPcNrt9RI6DhDT8zkPZIAcCfDCKa2Kcc775dLpH5JljG6QnOf2kvwgPHYaH+/3eqOXdGRA5Rz95lhZ3AoxH7GQyPpLq2C2ZusTC8eKeEoR77IBJnucDpvfB8cB6crj4PwoMcpn8XUl/6tfZ1cu7IFBzi748kJ3nx2ik5xqzILci74loxqfeEl99nSKLDJ42oykn6X3gSmHbZ1qfdjBowe8v6f5zBPfc6e+qpnww0HIMSC7bK446O8Ny2GeRql+PiuqRrvNj5GmOdimwFgHGUosJuD+ihdxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(82960400001)(478600001)(6486002)(41300700001)(38100700002)(6512007)(86362001)(54906003)(316002)(2616005)(186003)(26005)(66556008)(66476007)(66946007)(8676002)(4326008)(6916009)(36756003)(5660300002)(6666004)(6506007)(2906002)(44832011)(8936002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ta8uFXFzIdcIJ16A2wlH7kksYT0wyBntsjmJ2zv2oU6tgiIAZ7EXSCVHHWmU?=
 =?us-ascii?Q?ku9pEhCr43tPXblkc2DHrt3+8uMGeXNJYF4q4KnrLqc1KL2f+oeyIVXulqqB?=
 =?us-ascii?Q?DcHCJLdUd+Z/yyBWr7jDE9eCBrgsNce2qhpmGfOmNO22kOU2/4FEg7V0xj6S?=
 =?us-ascii?Q?24PXXmqhq+u0JbxdZR1kmjMo9DM4YbXJ2UH2iWeLSpWSWF3Np70zTqGN54Yr?=
 =?us-ascii?Q?/EjTR/XKPpVheHP2Ip51glWuZ0fXIePm5IQho2NnHddh+EiyGTDegur/cfeO?=
 =?us-ascii?Q?e9bdIWOcU/X9shn13RNkYD85svMUaEpxYyZy4QXbDKkaYEL3Eb0j46/V5Ofv?=
 =?us-ascii?Q?Z5F+Pul2lyz7yQBrvHUFFpQu5RqaHFWAYKTnM/gJ9vfUGd49izr+BH18/8vA?=
 =?us-ascii?Q?YATp18R/t+vAdr9uwNhknnUDE7HLewa4YUMZxBFrEjJy0CGnrWAXUokyIHT7?=
 =?us-ascii?Q?9OVeAAl1yGuWRvy3cI0lSx0GWN3O9OHuV9Ex/vFqBIBnovrhallcQ8LHmJmh?=
 =?us-ascii?Q?RUKIU2X0w3HUFXdpi2JhX6PApHzAa+9Smrat5o/OpPaSfZ8dkf6yy7pmfezM?=
 =?us-ascii?Q?sTc69YUvwX9iBNP35mMRDs/ztf2dAf+F3dQxcbi0J9r7dfodNI+fXji4bSm6?=
 =?us-ascii?Q?LUhZxIXhmnmAtMOU68QmQoHdMyVkaDCj/coQHzzcDwKeCRIZMcXea7Xm3Ne2?=
 =?us-ascii?Q?q+4uPdFajRPg0eKXvkEwe7+pUcbY9D5oba9EqDacLpEMcNLMis10Yd86Ig4F?=
 =?us-ascii?Q?sN5KwjSJq86nI0YNEZ2FzfxJfYzrHLZOzd9UV+IFUSNlJyk0hJ4UVTc6FbGp?=
 =?us-ascii?Q?s7b75vhQKvjldLjVA+1LtU5fEIp0rnNHPU2o/j57m0V71AaBMqa69av32frq?=
 =?us-ascii?Q?LEpF9L5Ic+PMm1xcLTLCnDu2Q2DrBHNOYLU3Mr6s0fE6o7qJB4w2znYC2Krq?=
 =?us-ascii?Q?nEF/8RDnfesiOyO/zlU1uWWXK2+7yqy2pk8ibzCQ2jtlvMItZ/qhkBxitj2Q?=
 =?us-ascii?Q?j6qVIC35nHyakVBWW+ODuTaFQkJ99Oav7+Jx30TH3RKOpVwMiim/DOIYDKzW?=
 =?us-ascii?Q?QoDODO9ZtYK8fr4gEtXqDFw1jrcuo8Dl1Q9EMk4y6B62TCXfc6DOXBC0oDr2?=
 =?us-ascii?Q?frXxAm3lpVb/KGIhp0ZSsLGrj8kaI7rZjfQOzBoLyBaguern3ccJ6BNpVqeL?=
 =?us-ascii?Q?WjWLi/29a0S8u0Mw2N9fwjB+5XUY2B1fyMgxeVM1f5XOSs9p2o2WQcxDFbFl?=
 =?us-ascii?Q?YCNDZi/ffZHprHeqn4Wq+3nD6tGjl/JEXLtcc+fnzGBES0y+N4HX34filDd5?=
 =?us-ascii?Q?CQPzLWWclDN/sYF/Upq/a9Gy2o7CcRsCI2tik3Y4l+Iu7g6qrP/q7zc1hA8g?=
 =?us-ascii?Q?qBv6Z4rLrHzBFQqjGL8gQKUt46ohzzA5WRTfIuoSPVZgZw1VojXQW3XlD6gf?=
 =?us-ascii?Q?E+OnXJsij0Bf1GIxL5DCVud+xkaTN6LhJii4ecnWEQ9bfOJhAoXeCbtNx/0c?=
 =?us-ascii?Q?F6/BrJK7wH8G6R21pcw5yA6IVncWF9Jr4kdL3qLDrlTCqzJ0gNNi0DFYlpOR?=
 =?us-ascii?Q?BN/pXFQirDHe3m4maDmeFx3D2w7u23jfg2qmVuiesGP8HBeCJo9xVvZXLtLk?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5ff15b-3a01-491b-07e8-08daf3bae5e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 10:02:07.5161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AS+E7NNs0ZzaY9FANFoWa4/IS0xszIHgD0ksRFTNVI5sVuZvi1e4czsIVzGXH0naEoZxu1ZBSTwTKXEleKZucg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7105
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

On Tue, Jan 10, 2023 at 01:49:57PM -0500, Rodrigo Vivi wrote:
> On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > function adds the overhead of introducing a proxy file operation
> > functions to wrap the original read/write inside file removal protection
> > functions. This adds significant overhead in terms of introducing and
> > managing the proxy factory file operations structure and function
> > wrapping at runtime.
> > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > debugfs_file_put() wrappers to protect the original read and write
> > function calls for the debug attributes. There is no need for any
> > runtime proxy file operations to be managed by the debugfs core.
> > Following coccicheck make command helped identify this change:
> > 
> > make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> 
> I believe these 2 gvt cases could be done in one patch.
> But anyways,
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> for both patches... and will leave these 2 patches for gvt folks
> to apply. Unless they ack and I apply in the drm-intel along with the other ones.

Actually, could you please address the checkpatch issues before we can push?
Sorry about that, but just noticed now when I was going to push the other ones.

> 
> > ---
> >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > index 03f081c3d9a4..baccbf1761b7 100644
> > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> >  	return 0;
> >  }
> >  
> > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> >  
> >  /**
> >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> >  			    &vgpu_mmio_diff_fops);
> >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> >  				   &vgpu_scan_nonprivbb_fops);
> > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > -			    &vgpu_status_fops);
> > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > +				   &vgpu_status_fops);
> >  }
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
> > 
> > 
