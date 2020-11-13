Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD12B14F6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 05:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9446E332;
	Fri, 13 Nov 2020 04:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511486E332
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 04:02:28 +0000 (UTC)
IronPort-SDR: +zSz9hRhVQhHhCkQ/zO751b9rf3naXf+qa/BcMF5mHfSwa21CytR+XbQwh0uA3dRsJjljnDexx
 adk/MlnAjRrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="188435003"
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="188435003"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 20:02:27 -0800
IronPort-SDR: dyPsDs2ksIAbu+eph4aLCLvppH3xjzHKEdgKeVWItrD1TboSxHB1qtHnHF+6IabZqh3xOzU/uJ
 xI1t3brd0fng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="366603167"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Nov 2020 20:02:27 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 20:02:27 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 20:02:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 12 Nov 2020 20:02:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 12 Nov 2020 20:02:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiVxVw/sgmKkfZdRoXcvWlxdttf7FcBcc2Q9/pMZfZV1V2m2hXhaMKtLrByCxX4N7nDh2UURl1ZAkTUeXT6NNgVzCN3koqhTsl6PIIamK5KdJUhf8IwCin+7iK4myVaE8DF7Zi8OAnMOGms0LSBVGZbB0nNOLoZfBqGx1dgSBl0TBRCgPobKMH/WZSH/qc6N4Tlx0ONUpZDaGnxtEzdsxgdor/GgI3uNz/PIaaueZqDn/fTaA4OvWM85ns8vRm/cVukcZvRodc8I6YyXXmsRVguZLHkCGNBia8BSRFpEUYw9aRFw+AHAIulvI0iP85mqTowhWB5x15uV5Fe2x5VLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmSgndxTo9D6jbCBS9rlSzjfJe3QE8N4qWFO8pSchRs=;
 b=XY+/6Yp+ZSRQ+dpJLt2eliajGD84i3V6jcmgMiI1YrzFOXwinQMPbITgSat4r6C+593ZpPgaHCr79oYRZWT2+SMt+WJ+7BIKYLmvxQ/PUozOaiWnV9g6FAQfp6aFRh1R1fJo2CKaIWK0Ke4cMIiH2rciZEUnA50aeYC6EgDvmKcZGcEMs3uAp3xVmE3ajVaLRxGQZoV/+YdfOcIQ7Zik8+Kz5MwlriieS4joWcGcVj2WNX2WnknCvL83TPdbu6B2nNPuk4yMI9Ugf30z8oBMi79yDlBhV59Bl8up8BOKq2pdpZBX8yYAY0Eyw8NpjdNsHdL0kqNCbyXlHstbuB2Xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmSgndxTo9D6jbCBS9rlSzjfJe3QE8N4qWFO8pSchRs=;
 b=bSppdPZB/+5SqpbkHp8tj2V8WJuf1tGlUVIbiKr8O06vSw8CG1jlMU1rNqSO/of0BSGiv0MCsMXX2II0qQbCP5mUapwtl02WUIGqfohOf6ZxCpLmkH1IGDcs/BUHrg3NTdjpC6Cx+E+My5aORbrGWyJfXp/D+H+kPOUxvOMAuic=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2352.namprd11.prod.outlook.com (2603:10b6:300:7e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 04:02:23 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3541.026; Fri, 13 Nov 2020
 04:02:23 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v10 3/6] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Thread-Topic: [PATCH v10 3/6] RDMA/uverbs: Add uverbs command for dma-buf
 based MR registration
Thread-Index: AQHWt6hUi+hGF8eG30+pLw0f8vpb0KnFOggAgAA333A=
Date: Fri, 13 Nov 2020 04:02:23 +0000
Message-ID: <MW3PR11MB4555EE4E1EC56080BFF9CE4AE5E60@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-4-git-send-email-jianxin.xiong@intel.com>
 <20201113003358.GZ244516@ziepe.ca>
In-Reply-To: <20201113003358.GZ244516@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 08bfa4e7-5446-4cac-0492-08d88788ed01
x-ms-traffictypediagnostic: MWHPR1101MB2352:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB23523278805A832AA3B73CF5E5E60@MWHPR1101MB2352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sK2d6POLiMqF6o0iPOOJ4mO9oufnJeHZVLIroSsWhz81qHouq8Hpglkcye6TxAZeCaJK/RbBIPpJGxuYXEovjtXGoZi2FXugOwMUZtGcOpX2o+XW54sCpxfv9daOuvsMo3E8nSoC3ErTrF4MAePbqW7GJSOpKw8NP9NENIqZtEQrvSdBhjxcIOmJZ+nr3npDtyJG2yl1LMw5wRFJqr2wX6hY4JCjpxm7nO9WSoyfyZq0Zn1hTZKbcR8mLraH4rALlK9o85sUHFEHwEUl9BaMukRQERKWM1GATnASRsqkaSBrRSFyvxgjsvZC8GRzMUsRU2SzKsCDpCCSYj08BGdOww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(478600001)(83380400001)(6916009)(71200400001)(186003)(26005)(2906002)(8936002)(107886003)(55016002)(66556008)(64756008)(53546011)(54906003)(66946007)(6506007)(66446008)(33656002)(8676002)(9686003)(52536014)(66476007)(316002)(5660300002)(7696005)(4326008)(86362001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: E9bVwSUq+mk04udWGo3mR6MlDDRa/L1GFMYJRc2GTbyZxEyqltaJyZgfmdCqrhbA/vyBPMfc1VCicjdeR4+l6H1iSGzcjeQGRR3pngBDe0O++yxE2pFrYGewSn4D74GvVliQQ8m1SXkdll4XOisU88p6gA7v8wRaGfU7ZXCQxKK3/IbSvoirJvLF/3d9YvNqa7yA7dam2wvx0Tr/uNVoCTcRJmFBbNmDoZpgKUwu1xZYukBfzuLtbwzBLS7Cj9KVonFcKOcPfA6WaoBdASHJnBxeADxcm93yrkvBMLz+iF62Zgr7sRrBRy4+7SRENA0ewC4wz8XxMUbDccBAKhU0lt7zVUzDDTXI0qnU0OTSDh8TKTeODjqSIP4pKOt2yo+rvVaHmWFYyMSAq6DwL4Pz1LZuJUD4DP8u7mHv6O1XyBgBx6TvsV1rMWgLA2G9d3m0S5ngxc/RBDwpAPxbytfr52n5IGuoi5qWzhHzZ3bubVXSsvWUEWcxx2ZPXNRr7Xt1wrqzfhfqd3IwmYsPhz3Z+mnkW1en2s+tudlX9Fu++1Zz6Fbghykj7bG9UCBkZJOW5FVXOv1qlNYkhGD4wpRcaMLXgRsc0QETl+CbiFWrFGCln8PKjLDxgaCcJn5A6t3pzeuEMivTsM/Gj+X0g1+159AoAPdaTyC/hkugMITm9yzd9NOgs1tSalVYj5cbZOKdVWK9hgomwJe5cvcKh4Gej2v2iuOYUigop3k3ePVJYXjdk/T9xY2/ZrsTqLa9CIBkUMlK0+RVqogmivrRxzNXoVdaQwmXSOnHuMk6D7jlbLJSZUHON9ImcxuLsrhcdid8DjhU26YilVknrsJszF3lk4r5DdsC1/mi1iRR3pHLZxRVHn6hOqUODR7wHc27gvyoBNbmwv6pdNVkBKgVrGnQCQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bfa4e7-5446-4cac-0492-08d88788ed01
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 04:02:23.3508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7qwrOpm8Zkbhb+HuoeWuYT+h5cqV3lRRjZ7wfEc3aeoE5vQ4X7+KWQntKi3eM/9y7C7gKna+Uuv8RVMWxAT3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2352
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
> Sent: Thursday, November 12, 2020 4:34 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v10 3/6] RDMA/uverbs: Add uverbs command for dma-buf based MR registration
> 
> On Tue, Nov 10, 2020 at 01:41:14PM -0800, Jianxin Xiong wrote:
> > +	mr = pd->device->ops.reg_user_mr_dmabuf(pd, offset, length, virt_addr,
> > +						fd, access_flags,
> > +						&attrs->driver_udata);
> > +	if (IS_ERR(mr))
> > +		return PTR_ERR(mr);
> > +
> > +	mr->device = pd->device;
> > +	mr->pd = pd;
> > +	mr->type = IB_MR_TYPE_USER;
> > +	mr->uobject = uobj;
> > +	atomic_inc(&pd->usecnt);
> > +
> > +	uobj->object = mr;
> > +
> > +	uverbs_finalize_uobj_create(attrs,
> > +UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
> > +
> > +	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
> > +			     &mr->lkey, sizeof(mr->lkey));
> > +	if (ret)
> > +		goto err_dereg;
> > +
> > +	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
> > +			     &mr->rkey, sizeof(mr->rkey));
> > +	if (ret)
> > +		goto err_dereg;
> > +
> > +	return 0;
> > +
> > +err_dereg:
> > +	ib_dereg_mr_user(mr, uverbs_get_cleared_udata(attrs));
> 
> This isn't how the error handling works with
> uverbs_finalize_uobj_create() - you just return the error code and the caller deals with destroying the fully initialized HW object properly.
> Calling ib_dereg_mr_user() here will crash the kernel.
> 
> Check the other uses for an example.
> 

Will fix.

> Again I must ask what the plan is for testing as even a basic set of pyverbs sanity tests would catch this.
> 
> I've generally been insisting that all new uABI needs testing support in rdma-core. This *might* be the exception but I want to hear a really
> good reason why we can't have a test first...
> 

So far I have been using a user space test that focuses on basic functionality and limited parameter checking (e.g. incorrect addr, length, flags). This specific error path happens
to be untested. Will work more on the test front to increase the code coverage.

> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
