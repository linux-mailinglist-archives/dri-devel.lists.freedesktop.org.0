Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E722C8F8E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 22:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565BC89CF2;
	Mon, 30 Nov 2020 20:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B31689CF2;
 Mon, 30 Nov 2020 20:59:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbEACLEvQMLiGLZzy4V+7A3TcecZ8i7cBU/sriWaTVFfdeALnSq0N0YSbwygMWQI1cSbKU7Jtm/9sjC+MAEW/QxojggYNytdJgzKqprP0v9ggxp6iVtqR4ddpidKHUQmzbW3HYfFT1CU8Tli8NGq9P5X7X+kcY7II+Mf1kiNB/my11Ib9ABm3kgEb4+g0280pWW9AemCB1yDVMMX5ShiqbYof0wHoA8nwOlCbGne27hc2jjL83HvXFpLdaNoyGX/HevMbjXbFS3igpNO+QRpnlGZYZ4QiBZPcm44fFNS/AwNVV7SthupY9FK3hR98TS5vyAEkMsCNXKqKm+Q1iEGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU8qXTDuZDWl8ptwgkY0Wk8RC9Ca0AQO3aOswrUCdGo=;
 b=LmYdxr/Cff0BQNRrgLfbab1lnPoQn9MM+1u2syujdjDvJ5fAkecWHbgUgLPiCcafteqTmMpyJp/6rDM9r0Z+qMcmXxmiUnLeOnGxyvG33VQbbvbwxxxqce3SF2OzBPaLusuTEqxW9VbLRe/Cze2IjX7pVn3xn2ZuRLX7bzsuXO/hje1DHCcDy/0HY+xIph83Rcsen+IUEa7qPmp8dTnOQYCi3YlgeM9LxIfwVEKllOlknWXImsQQUTZOOp/xu2mPaduFW8qBVM7i4+TKbPkLH88YO4scuaIKYfUQyrzMdzAuTXLykiuv6f6kpFWaorrDzvkvqCP7ADM2qu/aEjcAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU8qXTDuZDWl8ptwgkY0Wk8RC9Ca0AQO3aOswrUCdGo=;
 b=vDizNmFwWwGnFYj3K/RfUogG1E19b1vb7+r/6k9CVOrKPM4o1UlOUJ3K0B7VEPuyHSyt7s/zz4MXCVdW/ogyIotVW6cEPHA8kKmzZt6NviXTMnvGxhNq5915xSHS9exgTkkoFkzQRYHpBLMErzADN5jVnVKVAc+fhMpbYGYYmqo=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by BL0PR05MB5588.namprd05.prod.outlook.com (2603:10b6:208:6e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Mon, 30 Nov
 2020 20:59:52 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3632.016; Mon, 30 Nov 2020
 20:59:52 +0000
From: Zack Rusin <zackr@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Topic: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Index: AQHWwlaG5WlZT6CPxU6T7GsrbIaTjanhMtCA
Date: Mon, 30 Nov 2020 20:59:52 +0000
Message-ID: <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
In-Reply-To: <20201124113824.19994-15-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f0214c3-2da1-4d3b-3b52-08d89572e1e8
x-ms-traffictypediagnostic: BL0PR05MB5588:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR05MB5588E4B29C9638548FE9B5D9CEF50@BL0PR05MB5588.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iN0W7nqmJ+GRtCOPNL2IJ1GerLvIBkK+KUyM8yaOY7Ecj0rfJTt8WpPKVuEXgVZyJyIyxMxD8joOgrYmYSp3w3+ngJ7a9KXXi3tCmXQuHk03llmnkVG68Bvw/Qr4IYcqxr3cMSbJ7BfPrHlImI8/7RPYAUveQ70CNwSVnRS/vB60JToUo+pPybHt5wYi7g7OpFoZDBabiL3TQOKdjSIbMiEKZtxA5UeYUX5Npd9xbDIuFlX1bw91Y+AtCCcdSJj1ghbKT3q3GYrcJNx8ewQJm5K9HTJmKzSh6OZlRtLqY4IX4GSlXrJ+DyNk61s9Rvmt/Ik0kBCEhEmgpT36Eip4QA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(8676002)(8936002)(6512007)(5660300002)(2906002)(6486002)(2616005)(36756003)(4744005)(66446008)(316002)(54906003)(66556008)(76116006)(64756008)(71200400001)(66476007)(26005)(33656002)(66946007)(186003)(478600001)(7416002)(86362001)(4326008)(6506007)(6916009)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PYtjGb518O0ip1gT/S8MkSKTcfym9HafySjrLzNtj/K9p29AtHi22Nz9bLgs?=
 =?us-ascii?Q?Xs2tNeuqgD0+AZbNAfkhGKpCvcLYG/h3Yuu16YOAy+/0bHMQyUI+D7Owa1Cz?=
 =?us-ascii?Q?DN+wygOXlXWzo/srHCn7P8YBPVscfuhkF2UkLsVXGFnQnfJyJeoHQGEUzWIf?=
 =?us-ascii?Q?+aLOlAaL7+9eoXnjMKE6AYzD1B5+3x5z8Ar413CU1RxpoGbXyHxaJ6KPIo92?=
 =?us-ascii?Q?RY2hok4hC1HkyTK9W0O1+Eee+8GwC3po3xi8t5qv5brwQJP44gEthr3Nr/an?=
 =?us-ascii?Q?nB4j1tjpPHTMdBuVvxPfoEWscQ8rd/3Zs5slbJbvpLF/cZCHfQWWZvpboYm6?=
 =?us-ascii?Q?HGCLNymIy+xrTHdfQ1fugkxP3Ylg2LF0bvo7pXCyD4Ak3GRbfS6ece4N0sNC?=
 =?us-ascii?Q?mqBVuWqQsLM7B9BWjKzJ97s/+h94ZUw3+0F+8d6hZYP70fVjiCGxCYntRTSH?=
 =?us-ascii?Q?9dMu8UrmcVGmzd9jZVOAU1K2Q5QJrC2a8c6NUPstyrhY7KPal+3DeKWuk33J?=
 =?us-ascii?Q?j1nIj+TGjgIzwSeiym25zWAPtkUfYtTesb3yXkhG/LiO2X1THcS6OVQ0BsXO?=
 =?us-ascii?Q?AUSGci/LQELrlURpnXOKsP4QomhItf3UoUqiYoXcEbRtL2J8ksEpRptm3Ptg?=
 =?us-ascii?Q?zA4xcgZB22emHi0YiDy+0KKHF83FpIZp42Dd0TEmxINRehIov+EWWLrLvBvB?=
 =?us-ascii?Q?ryjBRbRIZ3sLUF8tLc1C11D+JBMkFlcx65hrvwyUXPidMLD+u8IZoDntwLGh?=
 =?us-ascii?Q?Jd3GAt7ml5msPPHCu2Knoq+Kn44Ij34vjpIQylyUC+7ISL7Oz6EiHA21oGv0?=
 =?us-ascii?Q?cI8mHctWACpva3XBaWptAIcZtstO7r/tW7Hj8l9pEn/g1Et83OtFMLaxLX/p?=
 =?us-ascii?Q?wQVucnUd4pc1X/ADjMCpT1gzKmnbuE71ueWjTUNWRa/WYgHEe3ogxTUtR+FZ?=
 =?us-ascii?Q?d6KkxBtaG4W9edqAUHojYKYTjPyI8MEoOOWfqDhXJd0ChFqAxclLAqu4/TTo?=
 =?us-ascii?Q?swvr?=
Content-ID: <DA00B6650FD7A948A321344693A5973A@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0214c3-2da1-4d3b-3b52-08d89572e1e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:59:52.0089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feIN9tRtxBM3IDeKho3X1g0E3JzY61Bh/tu1Qw5z1F1LYdR1Qb/YLWYFjDQuAm1vV1hcvbFSS83OXdj88UXK9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB5588
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Nov 24, 2020, at 06:38, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
> Using struct drm_device.pdev is deprecated. Convert vmwgfx to struct
> drm_device.dev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Roland Scheidegger <sroland@vmware.com>
> ---
> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  8 ++++----
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    | 27 +++++++++++++-------------
> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  2 +-

Reviewed-by: Zack Rusin <zackr@vmware.com>

z

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
