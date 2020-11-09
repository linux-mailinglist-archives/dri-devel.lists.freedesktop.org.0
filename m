Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4D2AC68B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778208953E;
	Mon,  9 Nov 2020 21:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B73B8953E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:05:21 +0000 (UTC)
IronPort-SDR: 70Pu7HvbhMysenLv3tg5UIhUDxtDMvZri1pp5rrW71yYvVXOAadXnOy2ha4Key/yaiFSlHsWe/
 Mnba6cI97ZBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="167286725"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="167286725"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 13:05:20 -0800
IronPort-SDR: N0+dCvm+cHkF0J7rUQyZ7iKd8wa0TLfRX6ljO7oo7mlSIG/KmEBMW32qm3ZscYUID6XfSUBABY
 y3fHdb4ExBEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="327421739"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 09 Nov 2020 13:05:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Nov 2020 13:05:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Nov 2020 13:05:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 9 Nov 2020 13:05:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsBDn6Xb9iq45wLxcyJG0l6C1dsCLVLC2Cmv9sXlrZZwNvfvVhmQmiL2zO8sgfya54zHApEbpN3t8Y9y4AEDVhwD0MIfCCkzZ+JSEBmLzExqS2R2KjrJc+pP7sw6458jX5CJNmgnLdGfq2kK3LMX/tv0UUiYIBNnDFLdnvK2wYLvCSM5wzSfP/rnITGsKZIgw7ZxJ1AeRU6TIBNQWnKghfnAWgld8E5ZGICaGWSXFR08hmdc7nSb+qSYkulbw3Z5W3/hnzOw4jOfbFsWnU1uQxc0HxS4lfUqkOqsc7S5sDsMskJsKFS3C+LJFT9nKtadaxhGY+MCjhJQ9S4iUaGqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unvnIdBUAkEkuXjwTH6wevYPHtCfRXztsvEQJRN2R4g=;
 b=aA+x4gBFNDI17IaKn6nRJ91WDFpbBRPsL66YjI2uPLbLtsTFRRHTZCufZGd3Gwah7gik9sPCmkh3JO3FpsOfyBUQ2gjC0QmQHSgprDyfbWQVKeLhpJcFehIrDw/8+/4pv4Q5d5fCKJmRDkgNMqvE9tqFLLlBuJmNaidaja2fx2Ma9nrH+KLLSEENoL4JpxUl3fFMHR+750fHoyhNE88f/65XopbR91PgUYhp8UTL0WqHehNsZbWKUaX4ebi+Bu2rJNWkmmWDJglMkLK2GMItP4fkz/BT0F7WxBCK6oxKHJ4HnLOAKWmnxibz6NhL5e+z7vKxTbJGBV/oLy2xjHJEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unvnIdBUAkEkuXjwTH6wevYPHtCfRXztsvEQJRN2R4g=;
 b=o2h8XaJgBF5n8+P3cOr9ZAyYFH00Ya5OmNFi9Bo8CxmLpsR01T5h/D1RMP8lX93NYwesrg1LS7HJkw83w/smH4KIoPFJK8qO3yu2B7FCIRNx+LlFl3/DarfKdBac1tBlO/EnTKxQD0POkjgwjInG6bav1u6KU8bq1IIux7u/1Kk=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2142.namprd11.prod.outlook.com (2603:10b6:301:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Mon, 9 Nov
 2020 21:05:17 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 21:05:16 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v9 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Topic: [PATCH v9 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Thread-Index: AQHWtsvaDlLuQ6V520WjdecNcH5E7qnARuUAgAACYgA=
Date: Mon, 9 Nov 2020 21:05:16 +0000
Message-ID: <MW3PR11MB4555DC145B4286B512FB5F0CE5EA0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1604949781-20735-1-git-send-email-jianxin.xiong@intel.com>
 <1604949781-20735-5-git-send-email-jianxin.xiong@intel.com>
 <20201109205232.GH244516@ziepe.ca>
In-Reply-To: <20201109205232.GH244516@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: dd12a60b-95fb-4d90-7770-08d884f328ca
x-ms-traffictypediagnostic: MWHPR1101MB2142:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB21424BB19EDCC770970417ECE5EA0@MWHPR1101MB2142.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: edxANHCmchRmeA0mTFnP+xj7WopVl90i/s7fAShqoAB85HxlcJwxJw0UlAyy8X2bK2JW1i0B0M3p5hYBFlixM1NtEBuYYhRWoSCCNPIogx2s/040wVS6GE/5sBzda286MTReF9j5JiMpuRpry/+iPSPIq34gvoCUw5zOVICznaWlvYndOpLJLA31PgDrre5BcmZBMcLNDt0G+KzenEfe5XSpG7EGMNzBG1Pe1CY4uk4wEoXiN5+IdZlpN5EnQYkjZLkDW2VYqwwBA2VNKoQfAnG8Ye4kZqwbngjN/QlSnHkAhg3p+Gm6TmBbgXtPzi1GxBsxilED17YorZSaEBXx8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(54906003)(86362001)(9686003)(8676002)(55016002)(83380400001)(2906002)(71200400001)(33656002)(66446008)(26005)(64756008)(53546011)(66556008)(478600001)(66476007)(6506007)(66946007)(7696005)(6916009)(5660300002)(8936002)(186003)(107886003)(76116006)(52536014)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IGB/xIjHIgj2MIAtU2DoRgnYuAvYse7fPc4AAf1pGF4k600EirlYeSPqiN+9cgW2PCQ44t6by+rJXjrFYiyO611jZCd9heiDVD/2JjWbQvPwkmfKTCq/I6XbWxRSB6J9JDLok+XUz9Z9gvukAaN5gnzKB9rVHr7Ywkzw6Hh8J3q7UsJHai8UELMIxeVlvvB0PLxG/nWA2TQXOt9fYVY+RbbfX1nQMFfbk3rpSvSt3PII6Mive+psrbSi0Y1sRwo00AFN6hBF/zuX1E1SM+ZKwTj058Y/TKq6vtwjFzB5poJi0htU02yDkiP1Wh+aAvznLTUcQyy79drO2xj1E1DtWN+xQZX9ur/C8WWE92qo6/ytSxU2sI/anUqju36kF6GdYtS2X8YJmWgFqfSXXqKLC9TLLsh/d2eMXH+XOL2RGcU8EeNSgudz6MOlzaQ5ag4KlpVelC3xAE18ww0ciWgtfCn3id6PU4e9Z3PJJe8+IJa7I4I5NbilvPuZyHsqLPbdylyiwzt3KJYJ2gshJc/pX4DvGCn0qVslEGUFSqVvkQF/e/ldR2h5nNYNUi/BFXH8VL6fMSoUfuUGe6IL3/efc8MRFQ0+H8T9Olm1xD2wq0X9L88+zUIbSCv3Bu/ZDDkQCfxf8DA9jL8MlFXNDLt4y1ytSOU30OP+JqLgmfJZGo5nAm6t4aqFjaq21234GTKqX4I+N5Aklx/SzxnB4Rame8uA5KfRVwtbSbEI2hEsmSWfainyWxevB/Y9rzId+C1Dz1rHRfxVgptAz54XY+1x9uSs42UvLWNdzREfpFK/OZA9jaCPmjHvibE7rXspLe1rIwIy/EKOMde/UhzUa/mR/fcv00T18TyPq4j45uKWd2JhEPyoNHFwvlJgX85CcUHDorm1OftcNRjyPnSm6gvw0w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd12a60b-95fb-4d90-7770-08d884f328ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 21:05:16.7031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tSvVxF21JqRJeCOb10EglCboTBPRK9SGJrn6omwsUksWkC3+H8EQDOErBe4AWV+EYuyxoHJElhRRic03xjPWDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2142
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
> Sent: Monday, November 09, 2020 12:53 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v9 4/5] RDMA/mlx5: Support dma-buf based userspace memory region
> 
> On Mon, Nov 09, 2020 at 11:23:00AM -0800, Jianxin Xiong wrote:
> > @@ -1291,8 +1303,11 @@ static struct mlx5_ib_mr *reg_create(struct ib_mr *ibmr, struct ib_pd *pd,
> >  	int err;
> >  	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg));
> >
> > -	page_size =
> > -		mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> > +	if (umem->is_dmabuf)
> > +		page_size = ib_umem_find_best_pgsz(umem, PAGE_SIZE, iova);
> > +	else
> > +		page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size,
> > +						     0, iova);
> 
> Any place touching the sgl has to also hold the resv lock, and sgl might be NULL since an invalidation could come in at any time, eg before
> we get here.
> 
> You can avoid those problems by ingoring the SGL and hard wiring PAGE_SIZE here
> 
> > +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, size_t bcnt,
> > +			       u32 *bytes_mapped, u32 flags) {
> > +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> > +	u32 xlt_flags = 0;
> > +	int err;
> > +
> > +	if (flags & MLX5_PF_FLAGS_ENABLE)
> > +		xlt_flags |= MLX5_IB_UPD_XLT_ENABLE;
> > +
> > +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> > +	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
> > +	if (!err)
> > +		err = mlx5_ib_update_mr_pas(mr, xlt_flags);
> 
> This still has to call mlx5_umem_find_best_pgsz() each time the sgl changes to ensure it is still Ok. Just checking that
> 
>   mlx5_umem_find_best_pgsz() > PAGE_SIZE
> 
> and then throwing away the value is OK

ib_umem_find_best_pgsz() is already called inside ib_umem_dmabuf_map_pages(). Do we
still need to call mlx5_umem_find_best_pgsz() here?

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
