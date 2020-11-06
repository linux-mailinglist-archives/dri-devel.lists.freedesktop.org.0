Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247832A991F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 17:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608286EA97;
	Fri,  6 Nov 2020 16:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C5A6EA97
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:10:38 +0000 (UTC)
IronPort-SDR: 5Tz3k55ZALs1rtRJ4yTOPRpRsELOTz0L17DqkLSIDIjr8N9LVpnbg3+jURnmOufuSG/dnaGRrt
 46isyp11iYDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="149414338"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="149414338"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 08:10:37 -0800
IronPort-SDR: 94bN0ANm9W7UQoe08EBLyjk3DHRkeJ6gtskarO0kbWbdWpl0+KZYwiuaoi6BGCYe4y8uDwhcRt
 s1zGH/6yTeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="326459661"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 06 Nov 2020 08:10:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 6 Nov 2020 08:10:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 6 Nov 2020 08:10:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 6 Nov 2020 08:10:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 6 Nov 2020 08:10:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBMS3ELET224DrYOu6LUJks8jOGFKod+ufjC2wP/TqpuZf3g7eaV334SfkVsUtPmsXmuyygUIm4JLKuOSrGha7TXReRFD/p2UxrXo83AQfUySWxTz0+2xvmHv0/Jqc66+oAUNZDRs4cIOByugnKwRzkUq01grVuceGJLSIPNcXvVNhpku4caXoJV8eVcW8obluep7sQFYqGcJ70SakhA3jliudibc+k2cW4Taw7rVbqICB3PPTIUt8qo3bKCVdGCmNmmaU10yZ96pX9tjQ3rIlVLXwMFMxC9BIetaCSkcZ/yjnMhqb6lnZlCgqaEsqRh/gkUn40SDTvwOFJ58sRtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co1dCQTczwOFU6Xo9QM+SuTRqg742T2qh4n/Ism4rkc=;
 b=BgX+I3FF1mdOVHBVRnTxhPrsB1F7/1AxGYbA7vytVSGUMc0UjNOhQlxhgAFBxEBr1poTQr/cNJBqSGEVPp8i04kNiUmpZWz/MDI880aQY/g3xZ2INPOktCISbtet/WD56yCZmpT4F3JLUPSLYN+qEynvnEuGZkwLwjxi7llKhgwkgwkSgCduYyCSDz6OMb6RKGZRCSxZ7eYVMNOoSCrh0hcBPaPMfGRQnr67ehnIM6zdwMYU1WmWQwWFiFU9HD/gAYFh1Nib6hQZySxrBF9b9s87jG4nosKh/+bvcpDZMJR15aeRKj4thyBxm5CXOtX7fMss/m+Y7GWPdyatJNY1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co1dCQTczwOFU6Xo9QM+SuTRqg742T2qh4n/Ism4rkc=;
 b=n80ZAWFK4gRX6LK2vp79XslP99nr0Vi5C0fDVxkNpuwzBtgDrcMCWvnvugVOPXHjBKwMjHekiqNqeUrcz89esjU/QH+N1h454sHFteNl63mrgW8CIzoYDob2+sq28uTOX9wa5z4pJw43rnfOi5DJiY1nMDg87Y47pHfwZFd/WLI=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 16:10:34 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 16:10:34 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v8 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v8 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Index: AQHWs8PUPSOsvCazDkuCn814worrwKm6PxCAgAAGexCAAMkygIAANKYw
Date: Fri, 6 Nov 2020 16:10:34 +0000
Message-ID: <MW3PR11MB4555BE389789516DC31AD534E5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-5-git-send-email-jianxin.xiong@intel.com>
 <20201106002515.GM36674@ziepe.ca>
 <MW3PR11MB45556A1524ABE605698B9A8EE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201106124833.GN36674@ziepe.ca>
In-Reply-To: <20201106124833.GN36674@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0bb3607-dbef-440d-e961-08d8826e7e2d
x-ms-traffictypediagnostic: CO1PR11MB4802:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB48021A96A4E2963F5F50C37BE5ED0@CO1PR11MB4802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KVTw+6W5o/9P6+cXEVZux+EvyPiXjVO77AVyhD0bqN8KCcEKGIO6wks75+O6f3WF5sfdb0x6PnFy8DpDZA6LHxMvz/9VYfIxbX5DY6Z2U+XaTKvCDLKL8dgrKw7wJBqQzoOFenkLWnouHLR4Cu2/ePMnKj/jWkfd6y3A+fRSntPHgwiY+oxjZUrEsv2Ecrlko/15q3pYRHRTmSvoEfGMe535dFvKvVMIdJSjnyDB5a2CyLPQaho8AxIAG7kEUP1sMVDD6lsibx1eqxgrescaPg2HbDfB57tj8L9nQm2r7pzFR27BpdpzIQnnUXhTaUTCJHhGhozVJpG1FYVRvycypg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(4326008)(83380400001)(33656002)(316002)(55016002)(5660300002)(7696005)(64756008)(478600001)(66946007)(26005)(86362001)(66446008)(2906002)(66476007)(66556008)(107886003)(6506007)(8676002)(54906003)(71200400001)(9686003)(8936002)(52536014)(6916009)(186003)(76116006)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xH8vd5q6N9yFStXG6p1JtDX1d9vtawP30NqCsXKjLGbFBwdX8IC2SY3ONmf3RS/WR/j2MabSYA4DXWLPuPdHwCEr1PIdvI/piLY0uCEMdQOzb1iSZE8Zst0xHVSAwagR/C5j/4AQ8BGXkdwA5xpqdqz4g8G0oFe1N/SNB2GsGGaEunD3VM/8Ax1drSahv9m3Q404OLLztlRzbHKVABfIzjDkMOZkN8lTRhsoiUsZBpC9m8k/c3xSxIff5l737cRyPNhxPHnnB4HIHgIMsV7IBzGLskWhgfi+hk5T07BTMITEpx5yfVsmlSFzbfR3YJlyIXqTxXmxbIV/Mikst97j35xtEfTUmTfvXY3ldDBmvReL+MW2HUKluY24izDGwkV1Gya4g0szp7MTb3WEVBcdVtLoRNhGg0AHxzScODkRfJr/XiD2xuD73Gpc9fBxapCq4S+CJw2S5nCASJIvPoau+dMsY9wVYI7WpbmGvWYcPPkX/tQrle1q4eQEo0UOUszcA/LcAwkvw7G24PP5KqahO2CMR1s2zlTo199JwxqufgPOmF0joMsIa3kfR7AGR/iU0ZYjE/jyJqwah2+UUlQ8I0QZnV7C90oVoXS51r5i5o03/Rn6h4JD63Udh5P0ab26Qk1vCfp0SITdMdc8qzq92A==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bb3607-dbef-440d-e961-08d8826e7e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 16:10:34.7149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPsums5K/uMHNXa/JvGcO1jK3cnNqvCJRU+tUltEXuxyvHCTSSkyXOv/L4dPRmcgM56UwmScFvchmgEFz5fz1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Friday, November 06, 2020 4:49 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v8 4/5] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Fri, Nov 06, 2020 at 01:11:38AM +0000, Xiong, Jianxin wrote:
> > > On Thu, Nov 05, 2020 at 02:48:08PM -0800, Jianxin Xiong wrote:
> > > > @@ -966,7 +969,10 @@ static struct mlx5_ib_mr *alloc_mr_from_cache(struct ib_pd *pd,
> > > >  	struct mlx5_ib_mr *mr;
> > > >  	unsigned int page_size;
> > > >
> > > > -	page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> > > > +	if (umem->is_dmabuf)
> > > > +		page_size = ib_umem_find_best_pgsz(umem, PAGE_SIZE, iova);
> > >
> > > You said the sgl is not set here, why doesn't this crash? It is certainly wrong to call this function without a SGL.
> >
> > The sgl is NULL, and nmap is 0. The 'for_each_sg' loop is just skipped and won't crash.
> 
> Just wire this to 4k it is clearer than calling some no-op pgsz

Ok

> 
> 
> > > > +	if (!mr->cache_ent) {
> > > > +		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
> > > > +		WARN_ON(mr->descs);
> > > > +	}
> > > > +}
> > >
> > > I would expect this to call ib_umem_dmabuf_unmap_pages() ?
> > >
> > > Who calls it on the dereg path?
> > >
> > > This looks quite strange to me, it calls ib_umem_dmabuf_unmap_pages() only from the invalidate callback?
> >
> > It is also called from ib_umem_dmabuf_release().
> 
> Hmm, that is no how the other APIs work, the unmap should be paired with the map in the caller, and the sequence for destroy should be
> 
>  invalidate
>  unmap
>  destroy_mkey
>  release_umem
> 
> I have another series coming that makes the other three destroy flows much closer to that ideal.
> 

Can fix that.

> > > I feel uneasy how this seems to assume everything works sanely, we
> > > can have parallel page faults so pagefault_dmabuf_mr() can be called multiple times after an invalidation, and it doesn't protect itself
> against calling ib_umem_dmabuf_map_pages() twice.
> > >
> > > Perhaps the umem code should keep track of the current map state and
> > > exit if there is already a sgl. NULL or not NULL sgl would do and seems quite reasonable.
> >
> > Ib_umem_dmabuf_map() already checks the sgl and will do nothing if it is already set.
> 
> How? What I see in patch 1 is an unconditonal call to
> dma_buf_map_attachment() ?

My bad. I misread the lines. It used to be there (in v3) but somehow got lost. 

> 
> > > > +		if (is_dmabuf_mr(mr))
> > > > +			return pagefault_dmabuf_mr(mr, umem_dmabuf, user_va,
> > > > +						   bcnt, bytes_mapped, flags);
> > >
> > > But this doesn't care about user_va or bcnt it just triggers the whole thing to be remapped, so why calculate it?
> >
> > The range check is still needed, in order to catch application errors
> > of using incorrect address or count in verbs command. Passing the
> > values further in is to allow pagefault_dmabuf_mr to generate return
> > value and set bytes_mapped in a way consistent with the page fault
> > handler chain.
> 
> The HW validates the range. The range check in the ODP case is to protect against a HW bug that would cause the kernel to malfunction.
> For dmabuf you don't need to do it

Ok.  So the handler can simply return 0 (as the number of pages mapped) and leave bytes_mapped untouched?

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
