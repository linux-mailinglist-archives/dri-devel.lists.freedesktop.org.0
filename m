Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DE20FC70
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 21:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5716E14C;
	Tue, 30 Jun 2020 19:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676466E14C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:05:06 +0000 (UTC)
IronPort-SDR: eEKt2P5/FC6Gc1YjPX2QhduvRjQORvQuL7jG/JijPFR9y7JCu1wQESAYk3/T+Gs+0oDOk5J3FC
 pVvWWlGkxlgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146357816"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="146357816"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 12:05:05 -0700
IronPort-SDR: G9Az++t69Rg8T3AqfCLBAXWTAc/YO2SW1NXwpoDbaX+MxjpgCPdyHeGl3H5oP74k0LAJtkrIwQ
 +KyhAJ3w4dWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481030302"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 12:05:04 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 12:05:04 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX114.amr.corp.intel.com (10.22.240.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 12:05:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 12:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9ht8IMrtPDG/cORCg8b/vYme0jjMBclY1lnBQ7kUGOovpa7bq+FS+nrmKaPJkWqR2PQQNQ/REr9J/uY46s5BC3GIMyMq+5mKMVrgK2cXnx6hVUA1VP/u70TCxB1QumbaI/sWblZxdBW69KZzrMAqTasrYLfAFMtIMacjPW+dW6oKuKuIGnj5IdtTn/dp226xdGxsesy3ZMesp74l7IvHmT5ORowIFZ5j5UPEq0hRSULxWPGf52+CASPxcaXoRCf0k6R756g6RlBM2JKu1B4ITyidc049k3biJlJDlxF5adjvb1tAORL54JxfdQAXHrze6L88+1C/9HwmATOJqDL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3inuTWc8YNyxky1aB6sboNGNowkgJp5O3LeU5/ufcyQ=;
 b=UVOdxXCeoSW/sbferEXyFbDsmxYt+sNY6q7EYZZ31GD/eJccI6Sbi4ybNWpJjrBZ++Ak2zGLeo+HfqFcjgqSha8DgGK5Vmjdpbxofw0puddzXkx/EaWCh2JCh02r1xuFDNyfw/MEP1rj+a6cntYF44JMTWhOFAyrl9ZbVUaKafRDklc8zRntiA+0sB0QmnkRMOpJfNnNFTAKLIYzJCBuKZO777ld92AzdYV1EjcitmUmY8E/xgl9N+1aMU9YCNXjJ1Gk4tSnr3pwYCfxPKi5LKa06qsScrIWhobEi+sj7Fu7skPal/jLcMetfVXZ1/3pIyvO8Oje2gYFa1sZoFLe5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3inuTWc8YNyxky1aB6sboNGNowkgJp5O3LeU5/ufcyQ=;
 b=Gbd76le2R/1hiUHevnM1ygXAcBb8lR0GxFK9AEWPrQirkpZUpOhe4DvmGtkGzyjYONVakurOYvTjyeCEn6LnyD8QOSxKp9e/4EY3HRv/eANjN2VM2DcOiuYA24Ktt64kmfojqfQy5Ngn9xhaliNV7RcHk+4Xg2dnoxUmIzlUduo=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1983.namprd11.prod.outlook.com (2603:10b6:300:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Tue, 30 Jun
 2020 19:05:02 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf%8]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 19:05:02 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: RE: [RFC PATCH v2 3/3] RDMA/uverbs: Add uverbs command for dma-buf
 based MR registration
Thread-Topic: [RFC PATCH v2 3/3] RDMA/uverbs: Add uverbs command for dma-buf
 based MR registration
Thread-Index: AQHWTjmgdCm64aggH0CREKOfboOpjKjxhi0w
Date: Tue, 30 Jun 2020 19:05:02 +0000
Message-ID: <MW3PR11MB455545E6FD3E74A87C4442FAE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <1593451903-30959-4-git-send-email-jianxin.xiong@intel.com>
In-Reply-To: <1593451903-30959-4-git-send-email-jianxin.xiong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63a4a9a5-3087-4fda-45db-08d81d287e22
x-ms-traffictypediagnostic: MWHPR11MB1983:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1983FF13C5B88EB6FD3F8E59E56F0@MWHPR11MB1983.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P/KIi85RV3veX8aaX9XCMTumixyzTUDkUXJ1Z0jsuIflUbNcuW10Ot0vSgOwPNS8mMTHx35+895JB24R53mOUyQr2AlakxxORxjTGVMq4/c1/a/NZo5JX1A4zPd/hBg/6BqSB3ayogxgqFHtc8ofq9pcEOIITeGvreFdjOVKszBVsWAHEYePvARTbtsw5tYf18/F7UimUFAweHUyd8KIvfC26jCxDs3aJkrbLYvmQ0leMe+IdxzTPlgl54oSY5bl9lbu2oGGic/LwmZ7RTpVqvQplbEO5aGShzHj1doW7R7xajZ5AIUDXqFh8nMgg8cZJe6ZIteYHM3Qn96vBQjK+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(9686003)(2906002)(55016002)(5660300002)(71200400001)(8676002)(83380400001)(6916009)(8936002)(4326008)(86362001)(316002)(478600001)(26005)(76116006)(33656002)(7696005)(66556008)(66476007)(52536014)(66946007)(64756008)(186003)(66446008)(6506007)(53546011)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Fr/O+b/AkBGk8gQrr04dzNBzP5qc3IYNqYTQy1lh52Wec9yCKJq7ZPuDmuvzpzKtA8QPdHcsXF+gglfEsHlMwe7qZfTCpFGi4OIm5GUFPRoUi/Ma68GXCkXzeWIm0ZTkIWcm9iCFcbM1Xgmb9s4WLq2PMqlkJtr/j7LVj9DgXCFx9/ikZ5nGVRuiA1TL22L35C03A6y/5r6nDIGWpPb1TJQ+GbzMSDYPi/HVUShcgsIEHf9DoKtjhFM/bm23PscaPsoSHpuVmGQHco+9WpcKhqJERF4+PpnAOARna+GcidM90O5aqgyrWunSDzuHxRFAU2AUW/YJotHX0bc04LF1JHo1OpLYP5tu7u9iYF15LNfISchOlBBeKvQUKRfcctkTLNv2RGTUNV8omo/rsFzD6LF9D2iGUXKi8W0sAt+9p1IiHlg9Fl2o+BZ08qdApjkvpl9J/CJcl74pKluZfjyPB5yPct1ZUSkKCPI2ZSST/sked5tJnrVSxmn2gUwkjlcb
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a4a9a5-3087-4fda-45db-08d81d287e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 19:05:02.4071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YmTlm9UQXH5YLqvvjGgTICBZz4AstGLOzL+9eng9C5e83Q+HDrQLA5Lf4eQOr7kvUiuZ+TGctYFZSD6ZflIcGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1983
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc'd drm people.

> -----Original Message-----
> From: Xiong, Jianxin <jianxin.xiong@intel.com>
> Sent: Monday, June 29, 2020 10:32 AM
> To: linux-rdma@vger.kernel.org
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>; Sumit Semwal
> <sumit.semwal@linaro.org>; Leon Romanovsky <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>
> Subject: [RFC PATCH v2 3/3] RDMA/uverbs: Add uverbs command for dma-buf based MR registration
> 
> Add uverbs command for registering user memory region associated with a dma-buf file descriptor.
> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/infiniband/core/uverbs_std_types_mr.c | 112 ++++++++++++++++++++++++++
>  include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 ++++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/drivers/infiniband/core/uverbs_std_types_mr.c b/drivers/infiniband/core/uverbs_std_types_mr.c
> index c1286a5..2c9ff7c 100644
> --- a/drivers/infiniband/core/uverbs_std_types_mr.c
> +++ b/drivers/infiniband/core/uverbs_std_types_mr.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
> + * Copyright (c) 2020, Intel Corporation.  All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU @@ -154,6 +155,85 @@ static int
> UVERBS_HANDLER(UVERBS_METHOD_DM_MR_REG)(
>  	return ret;
>  }
> 
> +static int UVERBS_HANDLER(UVERBS_METHOD_REG_DMABUF_MR)(
> +	struct uverbs_attr_bundle *attrs)
> +{
> +	struct ib_uobject *uobj =
> +		uverbs_attr_get_uobject(attrs, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
> +	struct ib_pd *pd =
> +		uverbs_attr_get_obj(attrs, UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE);
> +	struct ib_device *ib_dev = pd->device;
> +
> +	u64 addr, length, hca_va;
> +	u32 fd;
> +	u32 access_flags;
> +	struct ib_mr *mr;
> +	int ret;
> +
> +	if (!ib_dev->ops.reg_user_mr)
> +		return -EOPNOTSUPP;
> +
> +	ret = uverbs_copy_from(&addr, attrs, UVERBS_ATTR_REG_DMABUF_MR_ADDR);
> +	if (ret)
> +		return ret;
> +
> +	ret = uverbs_copy_from(&length, attrs,
> +			       UVERBS_ATTR_REG_DMABUF_MR_LENGTH);
> +	if (ret)
> +		return ret;
> +
> +	ret = uverbs_copy_from(&hca_va, attrs,
> +			       UVERBS_ATTR_REG_DMABUF_MR_HCA_VA);
> +	if (ret)
> +		return ret;
> +
> +	ret = uverbs_copy_from(&fd, attrs,
> +			       UVERBS_ATTR_REG_DMABUF_MR_FD);
> +	if (ret)
> +		return ret;
> +
> +	ret = uverbs_get_flags32(&access_flags, attrs,
> +				 UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
> +				 IB_ACCESS_SUPPORTED);
> +	if (ret)
> +		return ret;
> +
> +	ret = ib_check_mr_access(access_flags);
> +	if (ret)
> +		return ret;
> +
> +	mr = pd->device->ops.reg_user_mr(pd, addr, length, hca_va,
> +					   (int)(s32)fd, access_flags,
> +					   &attrs->driver_udata);
> +	if (IS_ERR(mr))
> +		return PTR_ERR(mr);
> +
> +	mr->device  = pd->device;
> +	mr->pd      = pd;
> +	mr->type    = IB_MR_TYPE_USER;
> +	mr->uobject = uobj;
> +	atomic_inc(&pd->usecnt);
> +
> +	uobj->object = mr;
> +
> +	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
> +			     &mr->lkey, sizeof(mr->lkey));
> +	if (ret)
> +		goto err_dereg;
> +
> +	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
> +			     &mr->rkey, sizeof(mr->rkey));
> +	if (ret)
> +		goto err_dereg;
> +
> +	return 0;
> +
> +err_dereg:
> +	ib_dereg_mr_user(mr, uverbs_get_cleared_udata(attrs));
> +
> +	return ret;
> +}
> +
>  DECLARE_UVERBS_NAMED_METHOD(
>  	UVERBS_METHOD_ADVISE_MR,
>  	UVERBS_ATTR_IDR(UVERBS_ATTR_ADVISE_MR_PD_HANDLE,
> @@ -200,6 +280,37 @@ static int UVERBS_HANDLER(UVERBS_METHOD_DM_MR_REG)(
>  			    UVERBS_ATTR_TYPE(u32),
>  			    UA_MANDATORY));
> 
> +DECLARE_UVERBS_NAMED_METHOD(
> +	UVERBS_METHOD_REG_DMABUF_MR,
> +	UVERBS_ATTR_IDR(UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
> +			UVERBS_OBJECT_MR,
> +			UVERBS_ACCESS_NEW,
> +			UA_MANDATORY),
> +	UVERBS_ATTR_IDR(UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE,
> +			UVERBS_OBJECT_PD,
> +			UVERBS_ACCESS_READ,
> +			UA_MANDATORY),
> +	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_ADDR,
> +			   UVERBS_ATTR_TYPE(u64),
> +			   UA_MANDATORY),
> +	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
> +			   UVERBS_ATTR_TYPE(u64),
> +			   UA_MANDATORY),
> +	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_HCA_VA,
> +			   UVERBS_ATTR_TYPE(u64),
> +			   UA_MANDATORY),
> +	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_REG_DMABUF_MR_FD,
> +			   UVERBS_ATTR_TYPE(u32),
> +			   UA_MANDATORY),
> +	UVERBS_ATTR_FLAGS_IN(UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
> +			     enum ib_access_flags),
> +	UVERBS_ATTR_PTR_OUT(UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
> +			    UVERBS_ATTR_TYPE(u32),
> +			    UA_MANDATORY),
> +	UVERBS_ATTR_PTR_OUT(UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
> +			    UVERBS_ATTR_TYPE(u32),
> +			    UA_MANDATORY));
> +
>  DECLARE_UVERBS_NAMED_METHOD_DESTROY(
>  	UVERBS_METHOD_MR_DESTROY,
>  	UVERBS_ATTR_IDR(UVERBS_ATTR_DESTROY_MR_HANDLE,
> @@ -210,6 +321,7 @@ static int UVERBS_HANDLER(UVERBS_METHOD_DM_MR_REG)(
>  DECLARE_UVERBS_NAMED_OBJECT(
>  	UVERBS_OBJECT_MR,
>  	UVERBS_TYPE_ALLOC_IDR(uverbs_free_mr),
> +	&UVERBS_METHOD(UVERBS_METHOD_REG_DMABUF_MR),
>  	&UVERBS_METHOD(UVERBS_METHOD_DM_MR_REG),
>  	&UVERBS_METHOD(UVERBS_METHOD_MR_DESTROY),
>  	&UVERBS_METHOD(UVERBS_METHOD_ADVISE_MR));
> diff --git a/include/uapi/rdma/ib_user_ioctl_cmds.h b/include/uapi/rdma/ib_user_ioctl_cmds.h
> index d4ddbe4..31aacbf 100644
> --- a/include/uapi/rdma/ib_user_ioctl_cmds.h
> +++ b/include/uapi/rdma/ib_user_ioctl_cmds.h
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
> + * Copyright (c) 2020, Intel Corporation. All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU @@ -161,6 +162,7 @@ enum uverbs_methods_mr {
>  	UVERBS_METHOD_DM_MR_REG,
>  	UVERBS_METHOD_MR_DESTROY,
>  	UVERBS_METHOD_ADVISE_MR,
> +	UVERBS_METHOD_REG_DMABUF_MR,
>  };
> 
>  enum uverbs_attrs_mr_destroy_ids {
> @@ -174,6 +176,18 @@ enum uverbs_attrs_advise_mr_cmd_attr_ids {
>  	UVERBS_ATTR_ADVISE_MR_SGE_LIST,
>  };
> 
> +enum uverbs_attrs_reg_dmabuf_mr_cmd_attr_ids {
> +	UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
> +	UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE,
> +	UVERBS_ATTR_REG_DMABUF_MR_ADDR,
> +	UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
> +	UVERBS_ATTR_REG_DMABUF_MR_HCA_VA,
> +	UVERBS_ATTR_REG_DMABUF_MR_FD,
> +	UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
> +	UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
> +	UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
> +};
> +
>  enum uverbs_attrs_create_counters_cmd_attr_ids {
>  	UVERBS_ATTR_CREATE_COUNTERS_HANDLE,
>  };
> --
> 1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
