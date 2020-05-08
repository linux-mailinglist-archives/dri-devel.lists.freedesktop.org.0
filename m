Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEFF1CA676
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4A46E2DC;
	Fri,  8 May 2020 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4426E141
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 07:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL4iEETBB9dNaWgerJOu0cp66WrkVNOiP8Y2YVTdyRUyJRHm6CsEXTOyN0zTnhZ4OhA1DdR08um998nO57EriFBBX5NT5xGPSzyyshfv/heOK1FqpQa5uuofdSbiAulujXIBoqW4y9M8GANKZ+76LfOtGu0/HcpMCe6KPoZr1afzuoXHxaRZw327aRlDmj/5PJHK/xX4bAArcjMKYTUXI8Tpo2mWfRs8lnk7HK9UPgaUhScYUuM0R5MDBk4FIf51wzrwSNhvPkwEOF80WROCRGkHDmwL/mS6APYyxWWxSfmSQaCDydh0iJi3Wg0P3PVzOQoJdJeiV1h6t1ryl22WsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nurOTnXNAH6y5TE/bgfWbV4zWOoQBSLQbBmndLpMI3w=;
 b=IDTnBW4iH8hj+mMQmWwZojCN6tABM27OSoFxNXm/5NvUBq+Q56QXnp3yLwhr+Rxhxi1NpKPsN8OXBZsIJTx4VPXLlnl3rSzBbgR99bi7yh6K5+9NiisY+ekuD2GyEZWbnTaytwDs9gPBYA+aXOJrW18vWjZIaJdR58WpOA+5XCgrlRmW73DMBEJHPpca1gcEtU/YdLvnTSgjWnFoUqgzYpEcUAN6xDz4Y4aOx5s+Z1kk5N6i0pDHiZojvlURJP+kffQeaEhDkwNoEP5Dc8AlIR8CZ2WBGzVqcAfLyKyujPk8/A4neyoaCNMVEf0lAm4ndRHpZypSHePrCwglXlW29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nurOTnXNAH6y5TE/bgfWbV4zWOoQBSLQbBmndLpMI3w=;
 b=IbuDY2mu52M3uZcmFCAQb0lDdsbU3IKASyUMgGNStzw5tcDUNhvsXPbNDWRX4F0aUUioiVq3ZQzYlimYVHpIz8z38aZfxx0a1JebTHhyryPtHdLMU39DnY+n0ykmYzMUOgOjPU6G0tuFU8J3Zbe5K2bp5D+hhRApFlmIuiHzsZk=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Fri, 8 May
 2020 07:34:57 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.2979.028; Fri, 8 May 2020
 07:34:56 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Topic: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Index: AQHWF8n8HYXBbl5N3kSvZpSjxllEBqiDciuAgAAEjwCAGnAHgA==
Date: Fri, 8 May 2020 07:34:56 +0000
Message-ID: <84a349ac-d162-48c6-afc1-38f1bbf49b75@epam.com>
References: <20200421104522.GA86681@mwanda>
 <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com> <20200421115112.GB2682@kadam>
In-Reply-To: <20200421115112.GB2682@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd28cdd0-365f-4883-b0af-08d7f3224e99
x-ms-traffictypediagnostic: VI1PR03MB3998:
x-microsoft-antispam-prvs: <VI1PR03MB399814E6195BA3111FB3089FE7A20@VI1PR03MB3998.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U2NH65MU5yihgeBr21gTBaNA5pKSOS93VNPSe2cV03t8cpycM2JUhd4aGmbQK1YZRXnUlmgdimPzhvTM0PGe0bx9FrOn3NDdHeM3T/JmJjzFGd6BeBEliiUFPwHuaz7smbrgPVLQ7DfeCCqW8Q3u2EcnZ/N9DhFfjiY6SmNI/ruNWFyBtCdNTAbuQXqu34F++jbWJS15wcgvFb8yRyEAIlWqb5uekAr1IQLFV27PUBRRUnxhmTt4i/8t+hHbCEcEw1x6ygBYYRCAxxexXw3vDSntkMD89bDQSwrqeToY5tSV9v0MG8G8S9Ag5j7P3ZCO++xWTyETHnIKCx/vKEx3gB9FLVEBEKIIX3/y+I0wMvsa4H2gSwInMbp4cSvLWuH/9rpVUawiWPmD6DEPQX7MBCdTjxZp00Zt+9sFhn0hDrJrmiAutfM032R1OJOjDPKhRWJTeZZnRFYkNjza0uhwBN13Sgat2rCitWuRBFdTfEH4ByYxDXjdA3/L/qFfTuvyocfhnzWEWHkTGTLtKgRrgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(33430700001)(6486002)(86362001)(8936002)(2616005)(83300400001)(76116006)(2906002)(6506007)(53546011)(26005)(83280400001)(83310400001)(83320400001)(83290400001)(6512007)(478600001)(54906003)(6916009)(66556008)(64756008)(4326008)(66446008)(8676002)(36756003)(66946007)(31696002)(31686004)(66476007)(33440700001)(5660300002)(316002)(71200400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uvhbIQP+mk4LaOqVaEVv86UkpTCe85lkumWC8aLALk20DnfxSADF5zg63GdExLyCLaGt9QAJNhKu02vCf1JTsUr2dyaLALypTFULsXoQF38Cg4/TW3ARbrmRKyetAUjGdDZooZ1xqU3ajY0wK2XLITN2RNHDIcJnbVQJIc5exr6sez6+LYdnhw9ZOtyncn7fdncNp11AgZbCXcLuo7CrTVhFunXJiCav+6BDEBPBlkyJljoK4VkllLXhyCBGr1LSbMUKkXh9iYB3FEZB0GL+1ApqWm4HgG+djSgCUo2FrXonPLkkvqKjjXrD0XiYsy/HNYMX71XPrI+UK/OQHN0t+jCjYExMV6QxKkKLdfFzXvK1ulBhl21POB44OL6Yv4LriXi7i0+Ty7WG5NwGw4RjpiMEbIL2RsqAjv4B9HmBAhyzRhs8x1Xr3IrH4T3WAn2rEDwEqAvQDSbqAGwGO7ROe/OGIfp8zJL4n6LkXk8CmD0=
x-ms-exchange-transport-forked: True
Content-ID: <148263C525E6EE48AA2FDEDE1FF7B131@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd28cdd0-365f-4883-b0af-08d7f3224e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 07:34:56.8057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbW1+S+PzWbhvHr9Hd/dWx37wuj/UWGvNrVACYOfvY7CP08gnIqDY1ks6QAbaYRFgirlSXyuJxVb3YjYM4s1JRZYFjw1pK9pX3Ki8eXCctH4y92UvyO+bIBS0lEgsmQ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3998
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/21/20 2:51 PM, Dan Carpenter wrote:
> It turns out there aren't that many of these in xen.
>
> $ grep IS_ERR_OR_NULL drivers/gpu/drm/xen/ -Rn
> drivers/gpu/drm/xen/xen_drm_front_kms.c:63:     if (IS_ERR_OR_NULL(fb))
> drivers/gpu/drm/xen/xen_drm_front_gem.c:86:     if (IS_ERR_OR_NULL(xen_obj))
> drivers/gpu/drm/xen/xen_drm_front_gem.c:120:    if (IS_ERR_OR_NULL(xen_obj->pages)) {
> drivers/gpu/drm/xen/xen_drm_front_gem.c:139:    if (IS_ERR_OR_NULL(xen_obj))
> drivers/gpu/drm/xen/xen_drm_front_gem.c:197:    if (IS_ERR_OR_NULL(xen_obj))
> drivers/gpu/drm/xen/xen_drm_front.c:403:        if (IS_ERR_OR_NULL(obj)) {
>
> They're all wrong, because if the pointer was really NULL then it's
> not handled correctly and would eventually lead to a runtime failure.

It seems that you were right and I can simply change all IS_ERR_OR_NULL 
to just IS_ERR

I am planning a series of patches later on, so I'll include this fix as well

>
> Normally Smatch is smart enough to know that the pointer isn't NULL so
> it doesn't generate a warning but yesterday I introduced a bug in Smatch
> by mistake.  It's fixed now.
>
> regards,
> dan carpenter
>
Thank you,

Oleksandr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
