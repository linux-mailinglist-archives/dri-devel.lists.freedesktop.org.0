Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8966A29FFAC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715816E992;
	Fri, 30 Oct 2020 08:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9FF6E5BD;
 Thu, 29 Oct 2020 18:20:54 +0000 (UTC)
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9b08050000>; Fri, 30 Oct 2020 02:20:53 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 18:20:49 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS)
 id
 15.0.1473.3 via Frontend Transport; Thu, 29 Oct 2020 18:20:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/p/amyxrsRx2mUjoD8mQHpOCuE8MvqPN9P4nMWApfbclHsV/ZXFam7DlICsuVUQsVAHY3+VCz/Zs87h7aTuWHNEA97hoTcRB1mtP7eqHT3NuoRZMzHP+kQGD5z6ZEjGTAZJP87JVSn0Ef7UMREqRk31PYDxI4he+Z+y33LBcSpMoGAwcDmEuERL45uvKuIyhFVqq3CovEGdHuvMMYAFjF2DopCF255+3cOqiAJnqm6hT20rwbdusfMiv99h1vaXFR7VKvSixjBdUcQN3SYXKRVn1EkH5oedL5MMr1PfewkF1Vzx7zZQcxCeQlIUCRli3ymssWq/6QxKJ2LJWE8HUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXxOuMUworQNjFEmSk5oN1bBxXcl4ComX2Ky2bnmcts=;
 b=KpJaoFB9ioE8FCMaHwCQis35s+QTdn3qXkv231glt/lyxmArfiLIlAqgpUGpIi8KM9YQDBKBQFphfGscOH7t5vqqxUnRIZ0UTWdoYi2ug1y5wDwrgOK5DX0roW1rXBvzArOv761eFK0alAIPJ6jg0ZSmhZyl16md/W00FX8OpVPHqjj+h93jvWqqTQPH+gRBNnqBs8QNxu++sGVsVkFpjQERANRaBHp/hIpXPZSDG2W3hxW438xOLJUt4Da5JCHkg3Rl4XqhRujYyInG9ZcuGdQXcuGbO6LAkuAEnuPDIXwSC1DGGfR+5923KFv31d9MgenkhyPuGgoHRvGqaGv8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 18:20:42 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 18:20:42 +0000
Date: Thu, 29 Oct 2020 15:20:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Remove SCATTERLIST_MAX_SEGMENT
Message-ID: <20201029182040.GB2620339@nvidia.com>
References: <0-v1-44733fccd781+13d-rm_scatterlist_max_jgg@nvidia.com>
 <20201028194911.GY401619@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20201028194911.GY401619@phenom.ffwll.local>
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:23a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 18:20:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kYCXQ-00C6eQ-FP; Thu, 29 Oct 2020 15:20:40 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603995653; bh=SXxOuMUworQNjFEmSk5oN1bBxXcl4ComX2Ky2bnmcts=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=EeTaMgZnGMqj8wXI2VD/AqCuV37CAYABxH+CEJ9upQKCqdyWzHUGnHwVip3fZhICy
 fgozca+Rr/PsOgj6OA6xmwUT679VXtEslsc6oD0wAyibTfXlY/+yrI4ndHW3pXa8V7
 6BuSiIdJeWMHF7yXDvMEGsmc+mBq0o1f3fqIFVYKl2/aFGoeHeCRWvw2c6x0i36qqp
 joXS/IGNfNU7byrDjvmvEgT04zd28QsG8pM/nlLbc71ek4yaXlIQSNGfFSOIneY2PR
 zjWffK23rOV8oP2dD1TmRkS4NQcoQ833vaXK+NuFiXUAI3MWU3zz1Qn7XnOinBPlv1
 Jd4pqrjtbojAg==
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>, intel-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Qian Cai <cai@lca.pw>,
 Christoph Hellwig <hch@lst.de>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 08:49:11PM +0100, Daniel Vetter wrote:
> On Wed, Oct 28, 2020 at 04:15:26PM -0300, Jason Gunthorpe wrote:
> > Since commit 9a40401cfa13 ("lib/scatterlist: Do not limit max_segment to
> > PAGE_ALIGNED values") the max_segment input to sg_alloc_table_from_pages()
> > does not have to be any special value. The new algorithm will always
> > create something less than what the user provides. Thus eliminate this
> > confusing constant.
> > 
> > - vmwgfx should use the HW capability, not mix in the OS page size for
> >   calling dma_set_max_seg_size()
> > 
> > - i915 uses i915_sg_segment_size() both for sg_alloc_table_from_pages
> >   and for some open coded sgl construction. This doesn't change the value
> >   since rounddown(size, UINT_MAX) == SCATTERLIST_MAX_SEGMENT
> > 
> > - drm_prime_pages_to_sg uses it as a default if max_segment is zero,
> >   UINT_MAX is fine to use directly.
> > 
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Thomas Hellstrom <thellstrom@vmware.com>
> > Cc: Qian Cai <cai@lca.pw>
> > Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
> > Suggested-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> lgtm. Do you want to push this through some other queue, or should I put
> this into drm trees? Prefer 5.10 or 5.11?

I think DRM tree is best

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
