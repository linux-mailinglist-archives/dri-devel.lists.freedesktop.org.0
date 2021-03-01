Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287C329503
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE106E0A0;
	Mon,  1 Mar 2021 23:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE21D6E0A0;
 Mon,  1 Mar 2021 23:14:59 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603d75730000>; Mon, 01 Mar 2021 15:14:59 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 23:14:58 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.54) by
 HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 1 Mar 2021 23:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKXbUwTBqMNE05YNH9/Q/4drz3eC3Jg2QTgwkvxQxVYdHLSQ0+hjDTg7eRanBtDM/LE4lTQQqRNczZ5FOKpC26PSYcfu2mOE967U7f9tVCJH2ymlY315z3JdH/fMc9F9Um/Gg5APBl6w6+ONiAlEUzp9Nq6dW4+PGrV9lgBlxPqGRbNBKFgLe5XX3TN9z57qllC+9wt/70f415L6GptwEVVqpVcJQOX7IbmAQbgbF71GSs5+4XS+fJfB4Ki2unD0msf95pvcdOeCVNeuipPgSl4JrqKFk6wAl4cSN4yn3qC9bgYReev5UF2gu8+xtjE4b/ZuBX5/YKVFPL/zYtNxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swE9ZQpc+3LuQoZlzfLTtvT5aWiX/1n0QYmtvCFHb6I=;
 b=VDI7IaHWl/+nW0yTySAmgJLiAVM4N/AE0gkEdXmLcH5BCb7KyVJcRLVpMUmHM1R4Qn67WWc8XQceKszkZ0dzdFphFs7/Yug9ikWxBCacyCQU2X+rexqdbkTieThlHHVYLRhhcnriZe4Q9sv9fmBmF+2snkW7ZVfr/Ob2ipCdSkwMwCpMFYNp+WFL9A8SWbYuHi6/aQtkek1qqy3uaBQFLG1EGr0dEC86xpmcxpE9hkI/qCjOo/1rb7xX4A/rWm7+lQ4JA3BVUv1KityCH66i1kZbeor6Me0YdJlpRxPjdyMqFmx8FGVXPPGeaUc2oWjfe3mKoEZ3BwrWKjDommhJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 by MN2PR12MB4799.namprd12.prod.outlook.com (2603:10b6:208:a2::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 23:14:57 +0000
Received: from MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6412:fe3d:f2:87db]) by MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6412:fe3d:f2:87db%8]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 23:14:57 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: RE: [PATCH v3 6/8] mm: Selftests for exclusive device memory
Thread-Topic: [PATCH v3 6/8] mm: Selftests for exclusive device memory
Thread-Index: AQHXDA+10DMlRgXFfUuy1T9vHkceyqpvyHZQ
Date: Mon, 1 Mar 2021 23:14:56 +0000
Message-ID: <MN2PR12MB43440D6E37E35DAF962F556EC29A9@MN2PR12MB4344.namprd12.prod.outlook.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-7-apopple@nvidia.com>
In-Reply-To: <20210226071832.31547-7-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=rcampbell@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2021-03-01T23:14:59.6412486Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=d6a14d98-c9fa-43e7-b670-24821d8db878;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [2601:646:8e80:c510:10c8:3f69:ba2e:72f8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32e2604a-d354-4073-280b-08d8dd07d462
x-ms-traffictypediagnostic: MN2PR12MB4799:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB47999329D512DE756CAF9988C29A9@MN2PR12MB4799.namprd12.prod.outlook.com>
x-header: ProcessedBy-CMR-outbound
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d8f4v+YSmqhUDbYPl+kDCviPlVGAen40eAxyzPbU2tCvudkNBk0Vl+kEOARhRfCWzFUlNXTn1s5fnAOfFv8AIeVCP6PzwCv/YMrP/gj29X0WOaLYDG9V4zu7OxMIqpj/pCSww4cBJyz2FoSgXsSnkeCxFNBFy/Pt9zIe8ri2glmcFqVFW8+Kvjm4tzMpUeq9fgH7IXahT2y+jDK6PwnyCqER6mbJqtF2Yv/yJnO/76VmgEN7K429O7sjLkjJULk2p5iWX0+zGrQ+R8NS7EYm/ydEPBan8FlOtflzV/4m5GMQMEeNqGPigesomsEbB+CT8BxZgLcST1UmdNw1ir8nFcATK0x6cU+c+uZA5tBR8swbSzpnSoBRvUepD6ylLFc8QsjyTSowMILbUKK9JWZXHNG5yly2mkzSSkqUakw3IVLg8a2s0Tp6hfDQcrxtZyB2GlBJypyHmeSf15IWZTKk0+sF33XUP9n44xfCpDjvXIOFDdJ2IBml5vIXy1rt/5pUiT+CjTj4k9ZYwfhDWZMTfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4344.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(7696005)(76116006)(66476007)(8676002)(86362001)(186003)(4326008)(66946007)(33656002)(64756008)(316002)(83380400001)(66556008)(66446008)(7416002)(110136005)(478600001)(8936002)(71200400001)(5660300002)(54906003)(55016002)(2906002)(53546011)(52536014)(9686003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7/f4R4ZBXgwAHx2N1cXJ9T0OS9vfdzbdYUenfettKWKdYbqaQN6cxrEkf1Yf?=
 =?us-ascii?Q?Twzbl6xkrB5LptWGjlWd+InbGfeDnuCfBCoU3mMMolQabtTsEbFYpQZMazmh?=
 =?us-ascii?Q?1xJIztTlkfYBR7pOTaYYbiifbMkrtPq2VlOy3EwvJn/V7Y98Q1AqV0LeU3Cg?=
 =?us-ascii?Q?f9Z01bI5lC+Ub7NKXOxMJzcq22/8fN9Qe0HaMRvXJSCPJLnTfnkkZL8ul+Ri?=
 =?us-ascii?Q?EP/vBLxKcc1huZ5O+j+E+iLTxY7HpykdyNrqQWh7N/mwdRfOkgx2GOT0J/Hk?=
 =?us-ascii?Q?BvQz34/IxYBBgItvj3tc5valstF5doydrzK/lsCEkMGeKoalLqOcvVMYY0le?=
 =?us-ascii?Q?qOUs9KDg/PUrXzrf0cN3pS/vN0615oCRq0/Xb9jhEZwyAfU6IwXccWNXI5e1?=
 =?us-ascii?Q?tbLluPGd2h5aXMRtaqx8etUDPtaIC4fYayn+JX1A5h3Is2sRsMXi33XLDyHs?=
 =?us-ascii?Q?OnU1xSZ6fscGgrglKQtqrm6Km0F9I7I0aflpPdWkFgrFdjaH0v+AjKrLsBFe?=
 =?us-ascii?Q?CCIDTi99wvxEJxu8586wtoWN4eUa1ejqh1rXROpRxED1gtrNhS0uCUY16YrB?=
 =?us-ascii?Q?Dt6HeXWymLxj5U7nUzAzdCyPoGWtT2MDN90hx5UwaPjqWcNKumJadH7IgwRU?=
 =?us-ascii?Q?U4XTqb+5IQYskrfJq9n77QUoXwPBK0rP3PNNgG29Qf7cbiJiTZI1hGEatg1P?=
 =?us-ascii?Q?860yxjDnB3vvU1fVTLp0Rhm8H16kqlJ+VXauJ2BfOsnumZi/zWsjbG9cwWFi?=
 =?us-ascii?Q?XFre+Kxu2Iaf7/nAF6sdYuQPGM9JRKQpGBq4RWvZDN5U1FOtNMrbRUtmZPQG?=
 =?us-ascii?Q?H2x91OAP3qZMtnZOIziV1osKQszXFDdmDmdPPWian9I6XaAI63id2z/5Kode?=
 =?us-ascii?Q?r85GItX7qGN2+H5I3m+0kJGCMA/1eCwt76VdgFMm3VCg3pNLKGLSRfKN9cwm?=
 =?us-ascii?Q?6n3Ycf0XJREqzjGXCpPT5Afzc98fjY5Xl8iCCLnK0iHxOw7b3nZeRAcboVty?=
 =?us-ascii?Q?YKS2CNs6PEcaQRR7Y/Lb2wRuXz8c6JVI36CtcwJhI54iRHsWqGBtfUuin1li?=
 =?us-ascii?Q?R6G3TkhVhPJ/2SXSoInlx8snIyWEnhqLwpxLG2JjYSbpFgLnFUnerLsLVPsq?=
 =?us-ascii?Q?dhfElhI/B+0Jo5tMgctkBe6HTthrPtbCQHqprL4Ra9ThnOJoIlY5FDybMVZP?=
 =?us-ascii?Q?9OgTGRgqbL3MKTFaGRS+9yxUPrwv92Xobf/nJ0VGSilH2k39MuYdT1uuCUUb?=
 =?us-ascii?Q?XMHi9lvpuVEJiqOray+hQxekPLWzQZnEcvq57abE4BQuZtpGSYPSnyMN6FO3?=
 =?us-ascii?Q?5NTDfaYSo2exIXLUjgF9p5bqMuxaMGUUIvEFRtUBf71VFVECO404HQ0/ENxH?=
 =?us-ascii?Q?2pPkLbV53lOyqEzVkUXJFFIEwYJ8?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4344.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e2604a-d354-4073-280b-08d8dd07d462
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 23:14:56.9153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5KT809MxI4g2ZKTssfILoaGMWkAl1xdLi5kjmqgYVCuKk5RXtkTrLaq0zRWwSDkFOhMXh+Mro8tEEGX/EdLcgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4799
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614640499; bh=swE9ZQpc+3LuQoZlzfLTtvT5aWiX/1n0QYmtvCFHb6I=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:msip_labels:authentication-results:
 x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-ms-exchange-transport-forked:x-microsoft-antispam-prvs:x-header:
 x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
 Content-Type:Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=QRd/w8PZnSad4GbdfMaGRpdFJdfzmK7mQ7X7m8xtwD7//U7HOOnqC0WzOLfcq/xZ/
 dccfIHIrK7xMzFvnlIVDpx9Jl1fQvGPfkQTKIgsMAtARG0GJccKxEHuYlvtYmQJ5nc
 JMnCRaGvuN7wk030YVtMCALliZqdLf5MQyld3+krWaebZKWBZdw/XhIqnMKSm3VEvN
 /ZHelcQLG4a3EvJ7uzAZCO8v3LqAHyHFmivRGvX+HrlYvLaA+vHSaY5XlNh5nR67eg
 weOu0rU6MAnsEIQtSdBDItahghe/5gdre9PGZfhEx2hIVyW/cS8zCj2sKlWlevGC3L
 wahJaiF53jRxQ==
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, John
 Hubbard <jhubbard@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Alistair Popple <apopple@nvidia.com>
> Sent: Thursday, February 25, 2021 11:19 PM
> To: linux-mm@kvack.org; nouveau@lists.freedesktop.org;
> bskeggs@redhat.com; akpm@linux-foundation.org
> Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; dri-
> devel@lists.freedesktop.org; John Hubbard <jhubbard@nvidia.com>; Ralph
> Campbell <rcampbell@nvidia.com>; jglisse@redhat.com; Jason Gunthorpe
> <jgg@nvidia.com>; hch@infradead.org; daniel@ffwll.ch; Alistair Popple
> <apopple@nvidia.com>
> Subject: [PATCH v3 6/8] mm: Selftests for exclusive device memory
> 
> Adds some selftests for exclusive device memory.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

One minor nit below, but you can add
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> +static int dmirror_exclusive(struct dmirror *dmirror,
> +			     struct hmm_dmirror_cmd *cmd)
> +{
> +	unsigned long start, end, addr;
> +	unsigned long size = cmd->npages << PAGE_SHIFT;
> +	struct mm_struct *mm = dmirror->notifier.mm;
> +	struct page *pages[64];
> +	struct dmirror_bounce bounce;
> +	unsigned long next;
> +	int ret;
> +
> +	start = cmd->addr;
> +	end = start + size;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	/* Since the mm is for the mirrored process, get a reference first. */
> +	if (!mmget_not_zero(mm))
> +		return -EINVAL;
> +
> +	mmap_read_lock(mm);
> +	for (addr = start; addr < end; addr = next) {
> +		int i, mapped;
> +
> +		if (end < addr + (64 << PAGE_SHIFT))
> +			next = end;
> +		else
> +			next = addr + (64 << PAGE_SHIFT);

I suggest using ARRAY_SIZE(pages) instead of '64' to make the meaning clear.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
