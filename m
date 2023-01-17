Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91A66E6F6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 20:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997010E332;
	Tue, 17 Jan 2023 19:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D9010E32B;
 Tue, 17 Jan 2023 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673983786; x=1705519786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FQS3185SpEKdEa+CroQgGAHPOTN/+eaWBWCiK2CiPDc=;
 b=guFpTUrMKcDRyOw2kVX5gYzEAuZcjEKD9q70A2qvyjkL1N4/31Jvcpb/
 VTtrExya4no0UBtThVAfAmvADgnqTOGjHntqF+nHCwSJD3CQwADy2lD4x
 2ZDw5YyOOM3dkKQqW6189V1aC8xqSCG9y99XFbcL3kGlfkigIsYtA71Sn
 OrP6wwWIn+JX4n03tM77xfRVqrQSD+8dNadlz3pvKJz8Rn50BW2fvVnHJ
 vBF1LD1/JNEMyJXqhdERTfVJT/XQkqivYGYzO26L+HoS1fhHttWCQHFfg
 xdzHGwiwcVx/BOu7yp/bpkSX36STUDzJQ6X4/3EGA1u/+KnKa4r2zSoUc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326868740"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="326868740"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 11:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="727889784"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="727889784"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2023 11:29:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 11:29:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 11:29:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 11:29:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 11:29:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5pNHaJQBmTLkbOw4+8v/+F1oc6qzPPv0KYSuhYfNp5GywpMYBUwfSYJEbeYRxBh4Uo9XE8yb3H2S2iMgfKUqZ7IvUcWuIzUdYLeg4gQsDLwKatGvcfvoBsB08WKxKgMDNQ5CxRTp9qobPzKlN7liXaUIS9UtE4fT3zjF7PNPCmdLxpGLMUsjT4ldjrlQL+pUX2ckjBwR4ShJ+grHZ8Tw7ZbbZxf+SHlLw52XCmwd+M+km7IVI6e6zyMKhjjNsv0bvCfhoPv2D1M8uxe8U1Ozf3fruiKR1at/11w97XzklLow9UQCGd/vlMl2UmDpvmpDrAhm87MKhQRVzK+WBN+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za3smGz9hTD0pm0cZSB+4jK2Wz9UP3IoUP/LVLR92hI=;
 b=XB1rrQWGZO0Cqq3fn1qW947c8CIJvUd6wtiYoOtSqtZdQlpkmDIMCYVaQG+JehMIdwmx5mFVQx3aB9is9Iq50VMi/Q80wRisn8jUYmfGfPwvu1Spezd9v1HLgRAy0+g0w16CE+6osTvFN2v/ACb4CwNdbsvrC3xDROJxXY9V68N0A8kPd2TFyX0VMNUP6sjfYZb5JpWeJcXhm9kBqH7G2vOhQeCYEdIQG8bD+lNj5L5kGBFQMJl0Gt8aDjGSp68bzWg+0GrzqqgGSaSwt0KnXOM7gLOIcWv7t3Er4j459Un3r13D4c4CD8/wCFkzcxlItDBSvp6nnAyYhyN3m6PTtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB6376.namprd11.prod.outlook.com (2603:10b6:8:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 19:29:41 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b%5]) with mapi id 15.20.5986.018; Tue, 17 Jan 2023
 19:29:41 +0000
Date: Tue, 17 Jan 2023 14:29:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for
 vgpu_status debug attributes
Message-ID: <Y8b3IRhx976Ke99X@intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com>
 <Y8TkTi+/GQwhiMvO@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y8TkTi+/GQwhiMvO@zhen-hp.sh.intel.com>
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|DS0PR11MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: adbfb7f5-d4d7-4fa8-2356-08daf8c12dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bI6yAnnTh86UuzmcL8yAq6YYmv3siy77KnV+yPYwCd4fNYwX/qKyGqSBtxk0vCkQ0IzuA8d9XjiV0ApS+BhNMH9DUKoZWL2bNiZfLOS7MFwEewYue4SmN0hft7AL/GTkNx2/phvJC5sVXfMKh7iR71lnj0t58EM4dpIZgAn8O0MYaSi/NW4BMiDN3zmY7nObkuKuM73XZGIQMoHTc8xsj45wcJJTomwH8pGlC10dlYIIzaXXZv3ispSyXv9EhhDnBJE/P/1EtgisxTG+uckZwRL3myIc4oPRNHcIQ8Te+X/rAzmHi/BWtzxgr6H3+Bku263ba3RVH1L0RKmW/0ZDOLj1VIvtNGe7oC37QLBSe1uWR79DYmhdJD/2LfowQRQhQnn/DHF0cDU1CMZjVXsNzmRjoamvZCfRneew/zT9PdqqkbmfWhcUD5+eyt7VsjALtrdZ/81B59gTifpbKznpyyq/gmQh9Lox+MMhbQCSHDGixxCTCdREh5UhpodWiTnyZowW3m0tT43OyPCaNOFbhc3Zb7dySElzejHAOxCI66HX+zR8I2kjrYd9wXH8ejbP9CC12J2uR1sV42wKDaatL4sQmOp5S45GBWhu19jb5jZjT5B+1sUk2Nf9+qNX5DAXLztYi1I5hUqTTvtiNV6XyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(82960400001)(83380400001)(38100700002)(8936002)(86362001)(8676002)(2906002)(7416002)(6916009)(4326008)(66476007)(44832011)(66946007)(5660300002)(66556008)(6666004)(41300700001)(26005)(6512007)(6506007)(186003)(53546011)(2616005)(54906003)(478600001)(316002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2bGorMeAV1vpzJ+0NoERC/U/NcAl9Mfd2nUzQd5p7SJFa4oXKAAopXgyfSQY?=
 =?us-ascii?Q?jfyTcqPrO97j1emIY7i8qIWinBzzDtameBFinBtzM61STXnfJM+gqGDmjgXk?=
 =?us-ascii?Q?2A75zygPpe+fcdJuBrn4kaRKOoaXAdGJp2v1et0io1/9RunXVbpE+BvsMNQt?=
 =?us-ascii?Q?LrU7RlIwxEpISk2/P+5DuhEwPcCk7dZuGJU59IZc8Sz/pds2HwCOwqtgKAVC?=
 =?us-ascii?Q?Tf8t4BZ+60N7dtfupb/dBJx5vNazCgu/DIEqBHihzaY69tAFNSLgaMltB7f9?=
 =?us-ascii?Q?EjWelqzWut/SphOwVPPICneCQWJh11C6WU3lWbRyV0NyWJdI4H0X1nSWIrkN?=
 =?us-ascii?Q?RS+csMj9ll9YggzhM/yzXOXbIvA1paN40tMY4GYw26qwDgnptVMxsAqlVMET?=
 =?us-ascii?Q?4+rJoXJ6mTdsOZQsKgqztiW6V9NARlOlTgcN2a7IiC/FfAm5iZ5BNy6+wY/M?=
 =?us-ascii?Q?nEmzNH/pAZ1uDa0h+fnccGRZeXujcEGYi9XaDIkMGM92wexAGOIyYmTRa3pZ?=
 =?us-ascii?Q?AE4z+JwFMPlDbmvVFC582P4qpUGyXI9IWzoyANq4lCrFyspoZKZbfBRwtaib?=
 =?us-ascii?Q?/8JFyp29jfSsRy968Ks13L0ubv3Lg2o52SoDPij9HIq1ZyrD0o450yx/77Ej?=
 =?us-ascii?Q?aGw7Us1Kqj9SPp98q7f+zSxxhtOmUslWbetZiEuKTDJeYbhr1SOE/1LcxVf4?=
 =?us-ascii?Q?JB4FLAgkR3siiNZW55BOxc2ZB/iFxfaQn9DInQ2Zv9OeSt9FRGZEbuhAcw3b?=
 =?us-ascii?Q?GouGdsMkrjPNs0nJIAvsBcqI2sIXCnTRDc8wdgFOva7e0f1k35MK7Yto2l4f?=
 =?us-ascii?Q?fJwA0hWDr/1GkVHjODe7mQy/3v5LEIxtyyVlDwnVPeVHtuuYE+iVsw2fnzhh?=
 =?us-ascii?Q?pxV11t+hUv9foSWAiQrwfy7JhNR+OR3dTyneTCx1Dpq8fK3rdhWcFvkUmFN4?=
 =?us-ascii?Q?ZeLz8/0i0ggq11fjmsfDBfULJADb1h6mDOLBx2FPu1n2/P197f27vwf/6Qio?=
 =?us-ascii?Q?NaKArhvF1gB4Q7nmPkbAhhn34UfJghO5myZ5l80T9kObq5k4APSQCLGjX0Fv?=
 =?us-ascii?Q?HNMI1zzrF44+KyhDvc1kMhzR6bRaZd+TA4sWAxxk42Yrmenm6D38DjOgqAM2?=
 =?us-ascii?Q?GeN1bF+p5LxENJuwT5krLFb8Q7UX1nLpqfuUHjMafgiTimVxoKLBIsiuDe5X?=
 =?us-ascii?Q?OqfKbRuEvFqJtI+108vJOQpHricyBU5xH2sUeJJfR39uxn/EhclXyB4FuG2J?=
 =?us-ascii?Q?wyDcydxZ1PTTFIEbHMi95t47F5ha+n8fpZ1TkIbDiev4BZCS/prilWcxVHI5?=
 =?us-ascii?Q?hy1+077v8gVtcOhXCwow2IeawYhKK5GfItR2OFgUFlL99uve2AkCCkyOHQdA?=
 =?us-ascii?Q?LdXN0tXO5R3dolLgyXhT6CaCV4XD169wLXupxeKxAzCUhgfm1kiKUcY8Xw4z?=
 =?us-ascii?Q?31euFq/fh5+Vibk4IPvi3k5Q1E34QZLQscgddCwaFzZEd6vmOgFBoUMSKXAj?=
 =?us-ascii?Q?XdSNqNUq43VrPy6Pv6x0jTjwxwCgbaaK7vL9shQNAbBrKkVlXe3sy02CGMFA?=
 =?us-ascii?Q?gNkkNtN4nzKTCZ68DF09uLfGUyDhmtjypo6DJPoJh3vbtEe72z6bubXGUvYM?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adbfb7f5-d4d7-4fa8-2356-08daf8c12dee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 19:29:41.2116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qV25pRF7ru/nodOeo2eSaPs5B/rhxli5N/UClDViDhIuqo5aztWLCKrhhv7ELyF/3WPnAK8wYdr5f9NO3zANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6376
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
Cc: Deepak R Varma <drv@mailo.com>, intel-gfx@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 01:44:46PM +0800, Zhenyu Wang wrote:
> On 2023.01.10 13:49:57 -0500, Rodrigo Vivi wrote:
> > On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> > > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > > function adds the overhead of introducing a proxy file operation
> > > functions to wrap the original read/write inside file removal protection
> > > functions. This adds significant overhead in terms of introducing and
> > > managing the proxy factory file operations structure and function
> > > wrapping at runtime.
> > > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > > debugfs_file_put() wrappers to protect the original read and write
> > > function calls for the debug attributes. There is no need for any
> > > runtime proxy file operations to be managed by the debugfs core.
> > > Following coccicheck make command helped identify this change:
> > > 
> > > make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > 
> > I believe these 2 gvt cases could be done in one patch.
> > But anyways,
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > for both patches... and will leave these 2 patches for gvt folks
> > to apply. Unless they ack and I apply in the drm-intel along with the other ones.
> >
> 
> yeah, they're fine with me, feel free to apply them directly.
> 
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Unfortunately I got some conflicts when trying to apply on drm-intel-next.

We probably need a new version, and probably through gvt branches it
will be easier to handle conflicts if they appear.

> 
> thanks!
> 
> > > ---
> > >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > index 03f081c3d9a4..baccbf1761b7 100644
> > > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> > >  	return 0;
> > >  }
> > >  
> > > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > >  
> > >  /**
> > >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> > >  			    &vgpu_mmio_diff_fops);
> > >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> > >  				   &vgpu_scan_nonprivbb_fops);
> > > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > > -			    &vgpu_status_fops);
> > > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > > +				   &vgpu_status_fops);
> > >  }
> > >  
> > >  /**
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > 


