Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2502A995B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 17:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78E66E0B7;
	Fri,  6 Nov 2020 16:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8566E0B7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:20:39 +0000 (UTC)
IronPort-SDR: io4wRnjinzv3exvS+2pnBCrmMSdZohYqGzcb7CqQVanhD/lb2LGuD06azksXIk7O8yszPjLGyW
 5aunJYJh+3GQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="254270507"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="254270507"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 08:20:39 -0800
IronPort-SDR: ZEEgBQ4CnZvJxY0YAND64xjO6IB0L1ixXjrEjvL3oLi44836K2qVHXYQtz93RZGl9HqLmKlR0a
 5Y4YuJnRLaXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="337617213"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 06 Nov 2020 08:20:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 6 Nov 2020 08:20:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 6 Nov 2020 08:20:38 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.54) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 6 Nov 2020 08:20:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwA0D/COhwr1dkZmvdP1uqvds4EbL3/+92kjG9HSmxu6s1jNK7PQ/l5NcvH1SdFfIA+cLB+3v/wC986WNxK7zW8Oy0dyTbXdqXlRu3dGHR3wHqtBNC+mdr1m7eJ32XoYxLHhd9+bsjwu7HPeYRdBAZS27rMgixNHhi+YBSJXO8dFgD2yXqp/N5aiKwjJuxuaB4FO587HmM6SxUOsJQyKwd5QADLfnBI8DURpOlqS68E/8t4h1KbeWWVvF7E+gIuJKRoVFxKkGm7miDeBEsWvZ1iIw9/YQpzeJ9U50Wxy/2pRlI58t9mI6cYac9GNuGa9Sj07OlvxqHRVmkmYq9vlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vM+x+7vjGMNFmJzlSxIiSw0Y/PDDcxiihAmJjjgnTz4=;
 b=Wnp0KR2sGVdv/pLqewaG/9ziH37nipwsvAOedOyiXYGSUXfQ2Thd6zXbwQwbZBoKJYKS9zfZjgzG95xwTdwOclrYXEguZT+ZI0amyEXmagXlHSnBlwP+iU5zl1+wvs2GcA/hBUYdRBxgFb9+4Zk+UcgJnFSBxdkX05lmi+bsCK/rmMkDbaQT9zwBmUAYuSSFWrVuvhwnzLAzd8QH149S6qScq25bAjX31KeI/Xlj7OHsJogSfn/+rFpoMlKTiF9YSDjpvDK3J/2ZNNzEiSkrSf4a3rgpQaq7hPz6j6NtqDl8M2sg7Y/2Jp4OohcSxcZB8rGIVsSuVTInIstrK5rS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vM+x+7vjGMNFmJzlSxIiSw0Y/PDDcxiihAmJjjgnTz4=;
 b=TG6KBp7I3OfLr267gkcd0h8+0iPItbVHkDRL7rHxdlwyvOXoEmkooD6ZmThSJH51BlPOcPxBnFeKPGHJSv6FhHT93yPqm+ddXFkjpmrgxPeorZHn2xTmQHBzZIQA6cSsGPi+eOCj+YzbR6fgOnQywIV4ypxs0a/iK610QCJoFos=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 16:20:34 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 16:20:34 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v8 3/5] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Thread-Topic: [PATCH v8 3/5] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Thread-Index: AQHWs8PVatDxbJtfDUKGWwXaJSy5Kam6O6eAgAEL70A=
Date: Fri, 6 Nov 2020 16:20:34 +0000
Message-ID: <MW3PR11MB4555B5ABCE53B195B5EF0AE7E5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-4-git-send-email-jianxin.xiong@intel.com>
 <20201106001303.GL36674@ziepe.ca>
In-Reply-To: <20201106001303.GL36674@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: a1ae8b1f-1f5e-4bf9-35b0-08d8826fe3ce
x-ms-traffictypediagnostic: MW3PR11MB4763:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4763A40DD5186C352E37C1DCE5ED0@MW3PR11MB4763.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EFieMLKx8AIuY4SalV4FALVmtVy2qK0FfVHwGtAVFzNDYJdzND1i/EmHrZJYxgBVdTTpZm8YRTVKu80NRcjPs3pILkd2SvuRTOIYXbpO2UUDAjDEPFr02avx9/lvrVAfDR5CgfBRZblL9BIDNknOmSN7q1XyZlGyI2hAqacO+CLz5Ynwb63GciZaWY6tVpoUWU7Rl7uIIRK0xzr2cAmxPUQ1AMCOhqMEEZUfvAfJWz2ktosc+LdkHdfSf26A/oG7iFKVT4i7zorW982Z1zYQlLPYKYMiHYqPAQnesD0emxgsl/D0NuGkclHSKBzMJW1xZhT5uIXmF/SvxvBONri7fw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(6506007)(33656002)(52536014)(66946007)(8936002)(7696005)(53546011)(76116006)(86362001)(55016002)(71200400001)(2906002)(478600001)(4326008)(66556008)(66476007)(64756008)(66446008)(186003)(5660300002)(6916009)(83380400001)(107886003)(9686003)(26005)(54906003)(316002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tGoE8kBUE99n4t7KQFA7Yyomu50+kdOKz/v9PzzQWhPKiM/fKDZO+J5orlgl9q8nHIV4+7w1hR313oYxZiMxWjp1dagzGChFeTN6mCyHBtCRW92VmOitvudOPZ4+QD3VbnjHNXWacL6k/olOPxcgyml5woNFYejEOTagrGXLkmJhM7xB2dVO4Yt2MoyX+hckxh9qnf9HykmS2TzaqpES/5m6p+M7y89ZwjJt92IpjNQ24VOXViaOiqsamtsi96hR9ZF61RVcLuNbZwyaEug2xQElJqw2C348yJW8gyu0+wIudMS+W1puZbhMrKd723PxfybufRUiII61ZZYe5mgwqVpJK3uz3zshNzbTfBR2nQTwMCR9wLCmr0cXZeQrJMICjH9Ej9YK6UolSopPh09rDb7m4vURVNI+/vjS9t62SJxQXpL63kEF1BYGU7HUeL2IMkfdFZ2KtTVzkgxENNfLL6PCddDLk3uT7JnaHX9F6NjpJES3vL3Bnk36guFggWDkJTb6FbPXGhKG/wj6UKZhOphI7eCvyePhFcP52ftqD89R2ap/DDCLdVTWtDzMdQhYHvu/IojYQtrXIXm9vO9tck5RPpCVfl9yBnoYZLpbUJsITXU6LYlRDgUDzYBYhSm5VdFmimznxPL5zLN6l8pI1g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ae8b1f-1f5e-4bf9-35b0-08d8826fe3ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 16:20:34.7300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fP6YuCgLVQaIOjNom/1fBIlIsBkOz4SrG8pWLIyw0Gb8u3RI+QJHLHaiUPVp5IHmfNbYzn21hDOyxkvPcrgDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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
> Sent: Thursday, November 05, 2020 4:13 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v8 3/5] RDMA/uverbs: Add uverbs command for dma-buf based MR registration
> 
> On Thu, Nov 05, 2020 at 02:48:07PM -0800, Jianxin Xiong wrote:
> 
> > +	ret = ib_check_mr_access(access_flags);
> > +	if (ret)
> > +		return ret;
> 
> This should also reject unsupportable flags like ACCESS_ON_DEMAND and HUGETLB

Will do.

> 
> > +
> > +	mr = pd->device->ops.reg_user_mr_dmabuf(pd, offset, length, virt_addr,
> > +						fd, access_flags,
> > +						&attrs->driver_udata);
> > +	if (IS_ERR(mr))
> > +		return PTR_ERR(mr);
> > +
> > +	mr->device  = pd->device;
> > +	mr->pd      = pd;
> > +	mr->type    = IB_MR_TYPE_USER;
> > +	mr->uobject = uobj;
> > +	atomic_inc(&pd->usecnt);
> 
> Fix intending when copying code please

It could be due to a mix of tab and space. They look aligned in the source file. Will fix.

> 
> > +
> > +	uobj->object = mr;
> 
> Also bit surprised this works at all, it needs to call
> 
>   uverbs_finalize_uobj_create()
> 
> Right here.
> 

Will fix.

> Seems like the core code is missing some check that the API is being used properly.
> 
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
> > +
> > +	return ret;
> > +}
> > +
> >  DECLARE_UVERBS_NAMED_METHOD(
> >  	UVERBS_METHOD_ADVISE_MR,
> >  	UVERBS_ATTR_IDR(UVERBS_ATTR_ADVISE_MR_PD_HANDLE,
> 
> > @@ -253,6 +364,7 @@ static int UVERBS_HANDLER(UVERBS_METHOD_QUERY_MR)(
> >  DECLARE_UVERBS_NAMED_OBJECT(
> >  	UVERBS_OBJECT_MR,
> >  	UVERBS_TYPE_ALLOC_IDR(uverbs_free_mr),
> > +	&UVERBS_METHOD(UVERBS_METHOD_REG_DMABUF_MR),
> >  	&UVERBS_METHOD(UVERBS_METHOD_DM_MR_REG),
> >  	&UVERBS_METHOD(UVERBS_METHOD_MR_DESTROY),
> >  	&UVERBS_METHOD(UVERBS_METHOD_ADVISE_MR),
> 
> I trie to keep these sorted, but I see it has become unsorted. You can re-sort it in this patch

Will do.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
