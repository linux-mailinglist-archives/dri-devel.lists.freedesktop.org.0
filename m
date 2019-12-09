Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631B311828E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284C86E839;
	Tue, 10 Dec 2019 08:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760108.outbound.protection.outlook.com [40.107.76.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526AC89B45
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 16:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6S3cQAK32CpOXDwGb0UQ3WvDMmC1oAhAQVMaGUVediB05J/3LQPWpO9JeR263y4tH+E8JHhDrCVPFHWbYaUvb1ZFccsuKzDOwbX7lvVrJnW74G7uKaqwnwKGguZheTAPx/QBJh1olOVomFyVoffPU83+7wFsqfz7xMgpCaj96SGmv5GZtaEApZw7J7dCVLD3TxSUBJSWzq7o7I1oom27HBQo0R3ucup7/MFyeZO4f3akYK8GsukW7xouz+XsjWcAKuImMYPl7zYjUlOVzO0Osm5/uiirMLOE2w6axQn77l0+bdavO8kYHXfiZEkAY8dlFOs1z61CzH2T4++BZrhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0Ffas/q/Y3tLeUbbMJ2MuijRLHt8xo9dskRmIqZJFE=;
 b=EZ0sYuOYdvPZsjhQzw/qILP7rRbfjLJafMv3cPYqLUQ8dUVQbFQyGHSZzwwMlAyDSBiqNjBulKOKSWUEQgeN6DfAQEwND8mTybKDKWqbzQWK0oHGfvr1vGXmjJ4CcECXucFDjOIRwDc+5apUz0K+lVTD2wFkUgrkFXI5srmsUIfRCSMfxDLJR9msf4WRtzLJBR5XSuziTFDy6B8DvDmoIrzf+YKCApBTA+o8JdX76F0Gr5M25WFVAu2MzXb0FBrh3kEco49x92rVTy2sEI4rDASu1PrEzeZVQ60hR7UYg4d/lyF+OGWZ6DN1Y6QIMDLEjCVpNKH8TGhqqwZPlZbtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0Ffas/q/Y3tLeUbbMJ2MuijRLHt8xo9dskRmIqZJFE=;
 b=eoMARXfHbk3T4J8Y29HJYLa//Be9pBZqPxOQmZIyjYvzgDA/musnD90iDuDUTskzLvbaRLmNm+dORkaL7kmVV3Y5o0iib6+ArMOBDxodfNTAadMYxgKsce10ksGxDvV9bhMqT1ER2wHZu6tRenULUbj4bsJ5uepQb3TWqfBLLjI=
Received: from CY4PR21MB0629.namprd21.prod.outlook.com (10.175.115.19) by
 CY4PR21MB0776.namprd21.prod.outlook.com (10.173.192.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.1; Mon, 9 Dec 2019 16:32:56 +0000
Received: from CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::ed94:4b6d:5371:285c]) by CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::ed94:4b6d:5371:285c%4]) with mapi id 15.20.2516.003; Mon, 9 Dec 2019
 16:32:56 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "b.zolnierkie@samsung.com"
 <b.zolnierkie@samsung.com>, KY Srinivasan <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 "sashal@kernel.org" <sashal@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "info@metux.net" <info@metux.net>,
 "arnd@arndb.de" <arnd@arndb.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, Dexuan Cui <decui@microsoft.com>
Subject: RE: [PATCH v4] video: hyperv: hyperv_fb: Use physical memory for fb
 on HyperV Gen 1 VMs.
Thread-Topic: [PATCH v4] video: hyperv: hyperv_fb: Use physical memory for fb
 on HyperV Gen 1 VMs.
Thread-Index: AQHVrmZuqb39dWYaSUm935aoaGIqtqex/3Gg
Date: Mon, 9 Dec 2019 16:32:56 +0000
Message-ID: <CY4PR21MB06293C21EC5338C98080F6AED7580@CY4PR21MB0629.namprd21.prod.outlook.com>
References: <20191209075749.3804-1-weh@microsoft.com>
In-Reply-To: <20191209075749.3804-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-09T16:32:55.0594936Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=32db805d-f982-4dfd-985a-2183a1a1211d;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [2001:4898:80e8:3:c90f:8e80:4f56:c155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1f1ca711-2ff0-4503-2b9a-08d77cc5727f
x-ms-traffictypediagnostic: CY4PR21MB0776:|CY4PR21MB0776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR21MB0776E75CC3BF747C6D6BD552D7580@CY4PR21MB0776.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(136003)(346002)(366004)(376002)(199004)(189003)(4326008)(1250700005)(305945005)(316002)(8990500004)(6636002)(8936002)(71200400001)(10290500003)(8676002)(71190400001)(6506007)(33656002)(81166006)(86362001)(110136005)(10090500001)(55016002)(81156014)(9686003)(64756008)(66476007)(2906002)(66556008)(52536014)(66446008)(186003)(7416002)(478600001)(76116006)(5660300002)(7696005)(66946007)(229853002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0776;
 H:CY4PR21MB0629.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FZparn5y1WXp5KCVwwPxbVWpWN7OSeqort0cPeePXjIYcDTihCoLWRtO/HQ53jlqTbWUieGDbcAI2u9zgajqIprfgWmqLeOTT597gcCVqN7o0DmulEigJVS1buWnWbqO6cCxETrjuC2IL7yAul5scibdVNrjn69Bc4JxuwqNw3pLwDc6LarVDFTp6xTxUPlPX8UCDr63IprahpCveMx7Fri8H+OtmucszEAmusAZvPyDvIS4P9USVK7cZbrGcQKuJfWwso4OvXkD5dj5H9YpoyjGOS9Y3kVZhGAqMeiuez4BaU7BR/jWVTmpGiH93QFetcmFv2T8Ie2dvmJKH66675FqA7g0ZO77WiK0/BB7QgobkC7uyOPgIGHoiGp9bKl3YKcqSu3YOLrIvFtO/oWNX8NYJyJScdC30dEVlL7EIM4VXjs/GKadJ0yu1YFs1t9Hqu4AsiMZwGX+UfH/RLaqDemlYT6ezgVpZaDmSpeV2v4a/aC1bNaLlDoALVgBG8Yu
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1ca711-2ff0-4503-2b9a-08d77cc5727f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 16:32:56.6293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HuJw88ClTw+6Ku9WiDxI5sq0OzCYwpb1f7xYErJNZAvktc6MVfbD5XFyqpBVi7XnPdzGh7AwaXSoEEmaJmUvraUbEpRTEy68zcWugCW7f0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0776
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Hu <weh@microsoft.com> Sent: Sunday, December 8, 2019 11:58 PM
> 
> On Hyper-V, Generation 1 VMs can directly use VM's physical memory for
> their framebuffers. This can improve the efficiency of framebuffer and
> overall performence for VM. The physical memory assigned to framebuffer
> must be contiguous. We use CMA allocator to get contiguouse physicial
> memory when the framebuffer size is greater than 4MB. For size under
> 4MB, we use alloc_pages to achieve this.
> 
> To enable framebuffer memory allocation from CMA, supply a kernel
> parameter to give enough space to CMA allocator at boot time. For
> example:
>     cma=130m
> This gives 130MB memory to CAM allocator that can be allocated to
> framebuffer. If this fails, we fall back to the old way of using
> mmio for framebuffer.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Wei Hu <weh@microsoft.com>
> ---
>     v2: Incorporated review comments form hch@lst.de, Michael Kelley and
>     Dexuan Cui
>     - Use dma_alloc_coherent to allocate large contiguous memory
>     - Use phys_addr_t for physical addresses
>     - Corrected a few spelling errors and minor cleanups
>     - Also tested on 32 bit Ubuntu guest
>     v3: Fixed a build issue reported by kbuild test robot and incorported
>     some review comments from Michael Kelley
>     - Add CMA check to avoid link failure
>     - Fixed small memory leak introduced by alloc_apertures
>     - Cleaned up so code
>     v4: Removed request_pages variable as it is no longer needed
> 
>  drivers/video/fbdev/Kconfig     |   1 +
>  drivers/video/fbdev/hyperv_fb.c | 182 +++++++++++++++++++++++++-------
>  2 files changed, 144 insertions(+), 39 deletions(-)
> 

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
