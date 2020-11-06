Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 620EB2A9A20
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 18:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D687B6E0F1;
	Fri,  6 Nov 2020 17:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BA16E0F1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 17:01:30 +0000 (UTC)
IronPort-SDR: 3Q62eLTCZAHmrcbO+mecOQNt4WFLunLZvJfcyucziwBInZPQOEMkkcm6fic+BX6w/aRIS6X5EX
 eKEO0woZLe5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="148849979"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="148849979"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 09:01:14 -0800
IronPort-SDR: M4LfvqcKPqXaHSVN4MWp0GltC7taYi6Nn/nRQfpIReTrMuckXWCoUpchyrz3a+xgX6q2MMUiJS
 3bfiL6+OQnJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="528406894"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2020 09:01:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 6 Nov 2020 09:01:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 6 Nov 2020 09:01:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 6 Nov 2020 09:01:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 6 Nov 2020 09:01:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieUfuyp4LaJeAfAcoiQFpZoOEtALqVST9fiaE1Z7YKQF0eKs1KVdXaxK6YIlmVxzJ1fT+B1wal2FIOdPE6WuPa8CqUvy0Ur6XmzPnZMpU7tVNLcLUek72TljhiV090gtvYLSaghVAQV4LUdTpe8WEDF/IaxDVo+gSoPM8BYFX9CisgkQPQDRcBSp8Pc0lgEYGAA7M8m/H0Ox5WngXGKNs6LDQc4PI5vs/xsaK8H62DjjjfuqtTZSZvZyShipDjLLKLL5mCCidy/R4Syb3aKX0PiZzlxObqQqGKmHhPn5tUgQgmtQf0pwwWLU/tvqUwJd5sGRoU3D/f8dwB8sgdM81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJfYJ5zhT1jYU+clJG4je4rLmCG8VWQ0SkVe115Y9QI=;
 b=Cvfcp09n7dKmDaPY/jlyOGDojpg/0V5QyWyRVmMi279UcKd8zm//7oB4MYXCovL5cr0Si9cfw2fgJqTKO7MtqV/nxhJHyfcazywPFqXkyTJ4BMIcQ8O4pMfmfkoWvdoAzRvxoXd/D9oOoGPExqkpgzyUgd6EBVooJdsoT41Px/68i3Zvpunel6dnjI3++OykzdvS3ckuIkExft5Mk1T9AICU2lAl5/CJbh8xdB1O2NPh+uuTE5eStTjKKnnKyw89w/li81CPrlqKzLFGoWxMrn2aJIjXkfTtsKQ4nP5xs3sgyIqlqeDuOl8XJaYqcH3L8VL2rrVrnIH1ohhCfWk0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJfYJ5zhT1jYU+clJG4je4rLmCG8VWQ0SkVe115Y9QI=;
 b=lHldcATuH0LqJeTUBpJR/BMkbn2/w3DZzeZ1eQjBZ5rSu/fv77vrR1LQgx7nnTY6s78QuvQ8vP7WvHlKINjq33OkKEkr95IJJn69Fmr08ZsccGPoVuHZShrQYLtXOTqagDrGF0YON4Y0639ZXoUvrkmgYb6Gn0gE6bXHlilJg3Q=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1855.namprd11.prod.outlook.com (2603:10b6:300:10e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 17:01:06 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 17:01:06 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWs8PR1fXMlpsAzEa77sJjy3Zc0Km6OnuAgAEPmYCAAAVLgIAAAPPA
Date: Fri, 6 Nov 2020 17:01:06 +0000
Message-ID: <MW3PR11MB45556244E010E7E0F7D58CD7E5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-2-git-send-email-jianxin.xiong@intel.com>
 <20201106000851.GK36674@ziepe.ca>
 <MW3PR11MB45552DC0851F4490B2450EDFE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201106163953.GR36674@ziepe.ca>
In-Reply-To: <20201106163953.GR36674@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 8d73a54e-33e8-45f4-4582-08d882758d36
x-ms-traffictypediagnostic: MWHPR11MB1855:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB185581A075641B469B50A60DE5ED0@MWHPR11MB1855.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3NAMaBNOpY9HYtqoG7YcGDklOlWo2YfqsCT0P9Oj7+bpUzKJ2bEq7EcZcjGzDU+W/AtdMxoMka/rxgA1SQp+zCXt0TyUfcAXP4bXzAwMjjUSF4l9chj86K1LhoK2L00NvRkYvdaKR93OnuAI+soZTzcSPIz3nEtLDbyGofbCoh7dglK98ZyUMmLQ1WBTLeCsWRP9vAB7FHH3s/xYTOzEJipYGF9qQV+80QjfNzk7yVVdAD8NhNUpv1cbbZtk2wZ0Rex2AHodtQpFLO2HK/j2G7TRI7XwzHl4LnWrZK4jqhq6xeLnlYU80PbJUKmRZ88embLG0XRt4Nde9cEnRgH39A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(66946007)(4326008)(66446008)(86362001)(83380400001)(8676002)(66476007)(66556008)(7696005)(6506007)(316002)(64756008)(53546011)(107886003)(186003)(26005)(71200400001)(2906002)(54906003)(478600001)(33656002)(6916009)(52536014)(5660300002)(55016002)(9686003)(8936002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wdfDOoU0zZoSuKWPAXeRTCiZ57HxCEPTOqojRXAM6E0hy/OCGFjNkcY70zjopXPn1MPeQgjVSzMOBCRC2DtE6bKxcVoUL9kPwHisPGLSZGPDmb/4UIRDLd5fDb5QZVjLFW2nx6SGfxHNIj6dSXPqqn8cYZ0/MXvb0VP3aKE7zyjRcJoSBylC3HRiaGzWKBgbOjSB+sBYbFHuH7j39TptAXs9ieBdN1zT8o8WMG5AoUeZE/NuMRloXS04mD1xEnF2bJe0Q7r/TDWq9qa14SfjMENZK5deQviNQIpB7TeprQF9SYtsVhBfNUpGuP0MQ8Ffw3HPI/eMGbCPHA1LHe3QNNHaNH40g76dujJYprDhPKvd1LMC/8V/2WsGcCMAmy8r6ZXq6wwWXm5AMNwD/++ATtjG2gwBfqosH7Mr2SbAFyvjfQgsBA0IK5kXASRqAqD0HIOnoU4tA1RtRc5vn1+LrfCwXKm9oIn3FpX0e3uS098V0CnKQc0F/0qjqooHCPjscY7BK9wi9qqnT/kdsbdm+wz3awoLkBlbky+bfm4GpbkXD+IB8g2Y1xAV5OoiHfJvf76wEAQ9kNTaqQClxuZvKHbGMBhGx/kLRW3CoPaJRJPk8LDTLG1+3uq7oR+yp0OsghWh40IPjugsgwqhgcgY4g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d73a54e-33e8-45f4-4582-08d882758d36
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 17:01:06.4047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPtzwQW5pL4H7+dhIfgbzZSnp6WZs9I/4UCwIvt+A5z9q3lkGfZJ5h7f/x+CF4y/aI2wvBnHqoFOUTZpW2EoJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1855
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
> Sent: Friday, November 06, 2020 8:40 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Fri, Nov 06, 2020 at 04:34:07PM +0000, Xiong, Jianxin wrote:
> 
> > > The user could specify a length that is beyond the dma buf, can the
> > > dma buf length be checked during get?
> >
> > In order to check the length, the buffer needs to be mapped. That can be done.
> 
> Do DMA bufs even have definitate immutable lengths? Going to be a probelm if they can shrink

Good question. The buffer itself has fixed size. If for whatever reason the mapping
is not full it must be temporary. If that does happen ib_umem_dmabuf_map_pages
will undo the mapping and return error. It will be retried later via the pagefault handler.

> 
> > > Also page_size can be 0 because iova is not OK. iova should be
> > > checked for alignment during get as well:
> > >
> > >   iova & (PAGE_SIZE-1) == umem->addr & (PAGE_SIZE-1)
> >
> > If ib_umem_dmabuf_map_pages is called during get this error is automatically caught.
> 
> The ib_umem_find_best_pgsz() checks this equation, yes.
> 
> So you'd map the sgl before allocating the mkey? This then checks the length and iova?

Yes

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
