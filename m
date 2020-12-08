Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D742D32BA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 20:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDDF6E05D;
	Tue,  8 Dec 2020 19:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C688C6E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 19:33:08 +0000 (UTC)
IronPort-SDR: fikAJ5wh89etyuYMkem1UN++LUJPzq/KQCzvcsV11o+Ueom/mu5so6QubkHCTLldrC345+8VLG
 ptSSK4wFx9oQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="192249571"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="192249571"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:33:08 -0800
IronPort-SDR: VLYQXBJiuOdU7jXLhSv1vpYlrVnQFD07/OeoldA60KOPW66x2L7fZwAYvtW6t4gIJ1GgrGAIZ3
 3EEjtu1P8YGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="317943671"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2020 11:33:08 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 8 Dec 2020 11:33:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 8 Dec 2020 11:33:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 8 Dec 2020 11:33:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5cQvusD82AXXFHfWbvY80rU5MrjUZOI0X6k1PcQVUgC56YWNwmSRDqR4b94PvwqvNWo5UEeCebB71kJiKysnu9v+rGbQvR0x5MJ4MWA4mcDNnBMhfyUZts1IDOzItnZwqE6HZ9m1WhtccLP0akothDeuSlV5BkmdiHVSF4BiyZ7CWAHQ/VAzFzb6pJpDdVoZ+Hek/AyvHOcK6MjCr+avyusQ/iHkzbP6guTT/mmJou3xwKY3K845CiHP3xsO0Xvnhsr0CmK73pDQGW2HGiWXxr+UGyAHNdcuPhUZ63zrWgDUoKGT0uDj2AcLXzAjSxXdvm5LsdBt2/5g3xZ/EHxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZbCFl9SsNidwfk8jIIYXgkh0iplGQTumzFVLtDVvZM=;
 b=RSIgfeUlirCAma93vvhyR0g/kKsT4r29jgG5svsAATHXZOaN7cLTEpvHMqgKD0Fj5fkmBm55ClegzekTIGrsJ+U40FgBqfep6sS0RWtctCdq/6AqCMhQmddCeRJfkk5UN1Xk2SXPj5TjZpgjlZUxjb8pNFRkOtgJrn/puP3Kqfs4FDjq11YaV8s5yyoiA6RjZu9+Dssgl3EFxsk4v7L89YQpmuvZFdXOswnfbdmFxw51KbkAJ2WUOtr4ug16Ji8TON4b7eL1MZXjEIvR36EIUDdNZ+kPfd7QLubWyI9Q0c4+KVAIJRBVChv/0JiKJU9zviBHaQ16Pa/xSGe32j1TfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZbCFl9SsNidwfk8jIIYXgkh0iplGQTumzFVLtDVvZM=;
 b=DmdyG2/52qgnFavkboRVSTNqw8Z0KRbcUgwT0qxeAILeAmmA0AIOc7z930+ip2FRHwEQhsFmX0yOWSmqS9S/6cGUNJUSqF+gNwD6//5zvj30K/01bOe/H21HhZajKtJFtHo2opertSVvs/1hlssKyPnvcfs8klF4K55XEESN6ZU=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 19:33:04 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 19:33:03 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWzORzAl0zVkuiI06perwGejvid6nsx0AAgACvZRCAABgEgIAACR8A
Date: Tue, 8 Dec 2020 19:33:02 +0000
Message-ID: <MW3PR11MB4555793868036FEB1E600F05E5CD0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1607379353-116215-1-git-send-email-jianxin.xiong@intel.com>
 <1607379353-116215-2-git-send-email-jianxin.xiong@intel.com>
 <20201208070532.GE4430@unreal>
 <MW3PR11MB45554A727DA7940D81FE1C14E5CD0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201208185915.GO5487@ziepe.ca>
In-Reply-To: <20201208185915.GO5487@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: bbab24e6-44f0-43cd-8f17-08d89bb01466
x-ms-traffictypediagnostic: MW3PR11MB4618:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4618BD1341C1C72DB8DC9C6EE5CD0@MW3PR11MB4618.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7EezD52WsTrzP39Y83jY21Z/E8CgcpSW3mP76LhO29mDheqL8QlA1dk0Wb0thtp5VhQAv9drn//wYZ9D/VT36L+8Q8Sb8LHTLx2AFRT37ip2ip9z/HQ6wzRGtDWM0GpXSwGuQyL6/ZKsUjmOACVmP9yVqJQTciTKRoBIFgzfobyuHrg15P1lNQ4fEknc17q/3BDwIxqEuUUvQ/GLnZcykN60mgLrZA46zhv5+RuU3rAjpsWcWqFKaZrYBUNxN2wSE/3xNkbrkEOb/85EaPxOOJrV7gePBfkKuGw8fJwDz7Jj7tDnD1Lv29/joj/sbQGlBjsuJaQN5CC7tx1kvOJEnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(76116006)(7696005)(33656002)(55016002)(2906002)(64756008)(54906003)(71200400001)(83380400001)(4326008)(52536014)(508600001)(6916009)(4744005)(66556008)(107886003)(8676002)(66946007)(8936002)(5660300002)(9686003)(66446008)(26005)(6506007)(66476007)(86362001)(53546011)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8hPYlmjip0MH97nk6ZZGI/wGeJ1hu/I99xwWVvGZD7v/kOLRn6qZM73F8oti?=
 =?us-ascii?Q?YR6PTFurZdLWlclnwnLA+Wvl/jk3faZ5oraZMBmFm7GYqEzIeudZkvXNer9n?=
 =?us-ascii?Q?QwGtH/UIpPFWmka1/BSdOYioa8Pc+aPEfcnDMsL+AfhHhM3LGOK+eN/u9aJY?=
 =?us-ascii?Q?2ypqFxJkFnKUPRCsNXpUTLwwO0K8gHUhCoZmBZSWfYDHYdVhV/EXyPznlLYW?=
 =?us-ascii?Q?eE/SdIUqZ771ZZ+uFhTJICTTKSqXVyBHTFujJrbYJqOy9g0Xrd+4S+FrQ5RO?=
 =?us-ascii?Q?Vb921eIZ2C4R3G2eCxtY0FSqf6PXiZXaHBEILGU3CBjuBu1uMh6ineLb19Hu?=
 =?us-ascii?Q?XehdEwGchtl70/x7Mju0aGF1AQNLKIZVm8gUxTpfGhlAlosMCYNCdLYpKoTF?=
 =?us-ascii?Q?Z6o3+heikFNtiJGGmvTC9qp0lryevfkeemf19QT48Crtfnm4qQ62gW5vXuG7?=
 =?us-ascii?Q?Qxe7BW+medeTl0F6gw6AsLrN1G2k1o+vF0nW+IEB+kChUhrZ1zmI3E6thwzL?=
 =?us-ascii?Q?40j03ZY4a0vSUMfEL8HcPL5Aw39mmdPMP9gfF7ugMUswtVQskhg7P+QZATz5?=
 =?us-ascii?Q?MB0txBX6zuSsRxqv7RZlfCaFq/EyQhl4geZfDiT0yTOJZPl4q9v0NNP5uZgL?=
 =?us-ascii?Q?riaKCFqf8AicH/lS5rh7m6L+p3MivIRxAjuHnWkmtaiIIINFi7IY5z/yva8F?=
 =?us-ascii?Q?kjNpLwmbxaBdHiqm2CwTFOS2kH/0JRbHmaD9xjmAT+ddiC7hWHsqYIhL7EPu?=
 =?us-ascii?Q?sHIFvfbS1C3mzspofCJxYCvj/xLTgVKV8sIItZbF2Lr6bp9rE5Wla77JIQbk?=
 =?us-ascii?Q?n2SEMEUabrb4LroPDUUMAlECp8CmEG/j9gBfzZNkBqn+YRXP3KdE85sVjR/V?=
 =?us-ascii?Q?N/PmhX8VRaJtwCmTZHC67ad718M8j2bOYpUjPnfy5XoRl20AKfYqUO9Ohdi5?=
 =?us-ascii?Q?Eunc56DDeV5IH55AMMMUbdw3NlnDTKPIGw0RStaDovE=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbab24e6-44f0-43cd-8f17-08d89bb01466
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 19:33:02.9340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilWYzFXRYw5BlMo6C9gNzutNyU8PASDNpR0Ns9vSRcin6DBEiyt6jCX3Lq0gcrhm6/S1o92IKHZA0PbjdqXgwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Tuesday, December 08, 2020 10:59 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford
> <dledford@redhat.com>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Tue, Dec 08, 2020 at 06:13:20PM +0000, Xiong, Jianxin wrote:
> 
> > > > +static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > > +						 unsigned long offset,
> > > > +						 size_t size, int fd,
> > > > +						 int access,
> > > > +						 struct dma_buf_attach_ops *ops) {
> > > > +	return ERR_PTR(-EINVAL);
> > >
> > > Probably, It should be EOPNOTSUPP and not EINVAL.
> >
> > EINVAL is used here to be consistent with existing definitions in the same file.
> 
> They may be wrong, EOPNOTSUPP is right for this situation

Ok, let me change all of them to EOPNOTSUPP.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
