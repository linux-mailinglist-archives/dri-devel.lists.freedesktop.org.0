Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8816A69A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 13:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC626E48E;
	Mon, 24 Feb 2020 12:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B4C6E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPKfcjEtGmhim1jfeveDMBmTq5ZTdwepQbUgvdoRTwE=;
 b=0h0DubpXTZMkhmECCPqnGwQl7cTJD9snWHvH0kemLpqBFVfKdVKt5Id+XjsXORpio/56lAcLyIZWJO0rgzgLAOAxxEAfNLHct2jPKMItJ21pXZpt2E30c7/2qHhzwfWMVA0zC6BduqWOekEBiNYzMSIG0eKBz81uHR6hen75w3M=
Received: from VI1PR08CA0144.eurprd08.prod.outlook.com (2603:10a6:800:d5::22)
 by AM0PR08MB5091.eurprd08.prod.outlook.com (2603:10a6:208:15e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Mon, 24 Feb
 2020 12:59:13 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR08CA0144.outlook.office365.com
 (2603:10a6:800:d5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Mon, 24 Feb 2020 12:59:12 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Mon, 24 Feb 2020 12:59:12 +0000
Received: ("Tessian outbound 846b976b3941:v42");
 Mon, 24 Feb 2020 12:59:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from b3947bd5956c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B41BC74F-A90E-450F-B1C8-C3D700DC902D.1; 
 Mon, 24 Feb 2020 12:59:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3947bd5956c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Feb 2020 12:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmcEozAaTqSt7upXQfCfWcRekFulM6bCpRceGjwk/KRFZ2e5KJRo2Uc3pkhK+C7fCesIBqpF8Pzr8vUcsG6UegekY1XwO/qAHFXWyTwP7h6ACWb92HfVD/XdOWeosAAwxXcT/oe72R1UbX42TSVy8uF7taGzjusyYrA+JgxHQpOeo+HpNQI7XIaO0dXVgqujWcdn1eAwJF6mv26E+00BtT80ogfZ/Su2dp1fkDD7kw4ZJA+dXpTwXL0s1ktepjlctgfToFED5SM2oHS/3KO04GFS5qxGy70Ox6BBFy1v8L6R1BHi7iZ9Sp2QbdF/5wSGtUe5iD633fheRqC/FM6Z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPKfcjEtGmhim1jfeveDMBmTq5ZTdwepQbUgvdoRTwE=;
 b=TiQ/T5Vlucz+XLlpiKQUdff/1ekOh5QtzDQ4QMbceXhcFt/U9YgOnhlgVw7qzc7wLIx9tmcKHL4A9tNpmnfcpqY/IzhOkdU3YhLGEzeYI6VgQ186CCWLNV3GGNnVV/eo7TOb2p76uVxXovKYonis58b9jI7X7JyLN6vx6MybjPtXMiBfi4ihRzaLsfVX2rmESFr6UlN/DXdTVZia1bPBs+s8SrcAtfgov/MRu9XSZWiKhQySyP01xq5WRohHAkhqxa7L/czVhF0jOBWf6E5WWrc1NnoESyphuFjzze43xWk1NXsqxpIj2So/pHz2gBLYWIzB2AbrdyK8lqBmzlRiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPKfcjEtGmhim1jfeveDMBmTq5ZTdwepQbUgvdoRTwE=;
 b=0h0DubpXTZMkhmECCPqnGwQl7cTJD9snWHvH0kemLpqBFVfKdVKt5Id+XjsXORpio/56lAcLyIZWJO0rgzgLAOAxxEAfNLHct2jPKMItJ21pXZpt2E30c7/2qHhzwfWMVA0zC6BduqWOekEBiNYzMSIG0eKBz81uHR6hen75w3M=
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com (10.172.12.145) by
 VI1PR0802MB2542.eurprd08.prod.outlook.com (10.172.255.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Mon, 24 Feb 2020 12:59:05 +0000
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113]) by VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113%9]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 12:59:05 +0000
From: Guillaume Gardet <Guillaume.Gardet@arm.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: RE: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Topic: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Index: AdXn61yFYQwTcGDvSs6HxocaeVOz6gAMeNQAACAl4YAAEibPAAAMzTeAAH2qipA=
Date: Mon, 24 Feb 2020 12:59:04 +0000
Message-ID: <VI1PR0802MB2237E9434683CE980CA7163B83EC0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
 <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Snxz=AwRMeDPokuHmZyQrptmySS9tUtsW4f7GwgJ06Tw@mail.gmail.com>
 <CAAfnVBnsXW7sdOp=b6gxSczntBOa5O9JUaxMHqUE_CKN9kQe9Q@mail.gmail.com>
In-Reply-To: <CAAfnVBnsXW7sdOp=b6gxSczntBOa5O9JUaxMHqUE_CKN9kQe9Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: a6e5cc6d-b9c7-4160-814b-182bc8ed75b3.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:891c:366d:c423:a9d]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5ad7a10-75c7-41b7-fc81-08d7b929589b
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2542:|VI1PR0802MB2542:|AM0PR08MB5091:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB50918CA6E09A57CCDD9CF3BB83EC0@AM0PR08MB5091.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 032334F434
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(2906002)(52536014)(66946007)(76116006)(64756008)(66446008)(71200400001)(66476007)(66556008)(966005)(33656002)(81166006)(81156014)(478600001)(8936002)(86362001)(66574012)(7696005)(54906003)(55016002)(186003)(9686003)(8676002)(6916009)(53546011)(4326008)(6506007)(5660300002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2542;
 H:VI1PR0802MB2237.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: knuIQ58iSPUgHQGmm/l5h8RhJJy27GEVlOneTBfZF7URFH6cV/DQ4fIsjEhWghftE/6Ti1OAL9ooB+IMBk6fori1ZXB6aJTlYc0Gm5O5mTAbhxkmQHrxnWZ6UCb2OgrXiKzqeN0liLZDwFQ5Bedia6JhHDEvL7Ass4Xu38b43DuW+7otiZ0LWoGD8N5sBgce1J+gj7s/KtK4SetMD1+ynS7hwfJkevhEzhjOYkvp7JC3QWnvTSXdKbmdOi3n/oPTnZusWKnK+BqVZPMCUOaiZYQM3Y+14OHSw5yKjVS2xYqyW7rbjEEEFdG+Wh/mo1s2VisKtbJy8NL3XOLxjaHD3TDJOnYX4qIHAR3HhGWYOhFJuPiZZjmqifaYtfgwZAfDpj0l2cCTypWBUmLr8y04LiwombS8sPCVuCqshQS17tVqk9KX9mPx8oJ8Axo94WjT4V0CeQgzTVHw+gRrs6wR+Srt5sjFxI8vyttyB26Rrko1lHQiKJnL+qT1ZtRlk2fFW76J6rEf1gLdcCTfzYCEbw==
x-ms-exchange-antispam-messagedata: uvEILKfrTfdu4a5pH/s5HULs/PdxZnvUD11fdEHEp6Kh9Rlv28nXKgLp+AvBHHLc9yacKdfUFJfUGglxDSnP4ljY636CmUvdWKQ5MwiCGaqyKJdXdG58E1tyBsbNf4EAg/LVADEDA8fsgw8wQPjLaFMwpzX529mgZQQ6SdymRBkbvpU0c0mkHSjhzQ35ccYzjibdtrRsWrTroki0RY3IUg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2542
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(189003)(199004)(4326008)(6862004)(5660300002)(8936002)(33656002)(55016002)(26826003)(81166006)(478600001)(9686003)(26005)(81156014)(6506007)(8676002)(52536014)(107886003)(53546011)(66574012)(336012)(86362001)(966005)(356004)(54906003)(2906002)(7696005)(186003)(316002)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5091;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 549e5803-127c-4634-7d60-08d7b929541b
X-Forefront-PRVS: 032334F434
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hh/plb3i5LYdlwE1rNh+HN4Yj99LquIUrx6SeAtYeSoNOo2v7fHue1Ww+a+x4SE7f3bULkIP7ZLOXqILrKwtrWvY8j+WbuGnQ8awK7Du6taAQkDZEJd4V9bIBZorVqQSM0KDsQfQwi6ut3bXi0hXW5lef2ivkhoUq5e30/FtyqTSz33ZMIZaqwJ0upOa8UIKUv4dNrlPHbE1isprgBU26ImG/fG9wt5YZpcQXLZLmyhua0aiE6xCMG/GPOnsS9vSCrUOt3p6ypfLY3048o59FN77LPEGkZr1Ouej0Ly64RxvKRvT+zzd6LuY7kzd77Umv8slWmxM8J6dagCyCgu2mXFnXYeW2YLJ4moI6Jc3jiBXHo2UCPjIH78dNVrLwVbOgekTuW0qe0I+ptPbskWzoFODNFV8oM/xdC+Bua1fU/j7mdzng2QIQEWSk3s8X+ABahkbiuY5rKFrml0TC08cPDj+Ucm4eY8BBd1KrOYEuc2PIL9YOjKCqZ3Xj5sIHc4RNhtJEntggWK+UnpnJ/Ouag==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 12:59:12.7569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ad7a10-75c7-41b7-fc81-08d7b929589b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5091
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Catalin Marinas <Catalin.Marinas@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Gurchetan Singh <gurchetansingh@chromium.org>
> Sent: 22 February 2020 01:47
> To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> Cc: dri-devel@lists.freedesktop.org; Gerd Hoffmann <kraxel@redhat.com>;
> Daniel Vetter <daniel.vetter@ffwll.ch>; Catalin Marinas
> <Catalin.Marinas@arm.com>; nd <nd@arm.com>; Chia-I Wu
> <olvaffe@gmail.com>
> Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
> 
> On Fri, Feb 21, 2020 at 10:41 AM Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > On Fri, Feb 21, 2020 at 2:06 AM Guillaume Gardet
> > <Guillaume.Gardet@arm.com> wrote:
> > >
> > > Hi,
> > >
> > > > -----Original Message-----
> > > > From: Chia-I Wu <olvaffe@gmail.com>
> > > > Sent: 20 February 2020 19:41
> > > > To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > > > Cc: dri-devel@lists.freedesktop.org; Gerd Hoffmann
> > > > <kraxel@redhat.com>; Daniel Vetter <daniel.vetter@ffwll.ch>;
> > > > Catalin Marinas <Catalin.Marinas@arm.com>; nd <nd@arm.com>
> > > > Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on
> > > > kernel 5.5+
> > > >
> > > > On Thu, Feb 20, 2020 at 4:44 AM Guillaume Gardet
> > > > <Guillaume.Gardet@arm.com>
> > > > wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > With (guest) kernel 5.5+ with qemu/kvm on arm64, I get lots of
> > > > > display
> > > > corruptions leading to this kind of screen:
> > > > > https://openqa.opensuse.org/tests/1174521#step/yast2_i/24
> > > > Looking at the screenshot, it seems cacheline-related?
> > >
> > > It could be.
> > >
> > > >
> > > > There was a change of memory type
> > > >
> > > >
> > > > https://lists.freedesktop.org/archives/dri-devel/2019-August/23345
> > > > 6.html
> > > >
> > > > While the guest memory type is ignored on Intel, it is honored on ARM.
> > > > This attempt to fix it
> > > >
> > > >
> > > > https://lists.freedesktop.org/archives/dri-devel/2019-December/248
> > > > 271.html
> > > >
> > > > does not seem to land.
> > >
> > > I applied this patch on top of 5.5.4, but it does not fix the problem.
> > > Maybe more similar changes are required?
> > The patch looks legit.  Maybe the memory type is not the root cause?
> 
> Perhaps try the entire series?
> 
> https://patchwork.kernel.org/cover/11300619/

Applied entire series on top of 5.5.6, but still the same problem.

Guillaume

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
