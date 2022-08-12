Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C007591221
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2728FB4FD7;
	Fri, 12 Aug 2022 14:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415ACB52A3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxmeVa8gO/Djojnq12CccQGJWKyIGIJwKsX/nDc0evj0raX8hrlBTcBXiOcx93tuArzAwNajsmZJumIgWGpQOQ/bdkecqOU8YfGzUA0nFpKlsnQLYiGIs0rDLp9ANgOy+ak2UPYLqSQndqmlvkW8lUHv6QnrWGp0mIGyPEJw8bOGN3CBZufKkWgNgEZU3zYc1EzaEiwmCmI6k6fysiVMJGr79e3Uqo0ZuVNFK00fp0W4hDnMP168WdZdooUCQHjeIXcCILyOarXwJU5nvhnjF6n1sxf1nNiz9jzg3H0rs5MTUskDiAKjNMwOToED2lUPtWB/z3M0HtvYTVArukzl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bk1OvH0wetftxHW7fMxLz5U/bC0vMNi+YclFeihksOw=;
 b=kSCOhvq9MPYW6XhgJ5tfbnHL/pa6QRERHjcG7dfzbhgR3yAnEXQPi/lU4NwhtrEVwOw3Kw4/VwlBtd1AJ2LlWH2HMbjQ75ekdNzF7VCVAYV6n8OIiPz9LL/2Vq+C43fS7nnzbkl/NVPtaCXwDjk/3bSUl3ieGZxhvITUu4ELB4hRVP+ZVeNAFlti6+ObxCz52dpLbzm8dvhqY1iKwcmkDOb/IcdxBGp2KPQ2SAJruVbbeaYEdHenVJJFKx7UjtXTFF4km1nxy5tu92/g7dlxKjldM8KFe633NmxVOA89JTTuYYjw/uaH2TgNMxxWJmdbas0EzQ9jdZUmRlEPlfpnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bk1OvH0wetftxHW7fMxLz5U/bC0vMNi+YclFeihksOw=;
 b=RKWYnG3guWtqeR0gxkI2ZXMTUa5V1twqCmYdUiyWIGAdIbEwFmioqh0510bAduPRHs4f6pFdL8f307w1AbpfN8tFgXW3LymZ3ZgahW4hWQ34PovZP9e3+ECk4edxgmr/Nzt0AM5wWQNG5fgx26ae7o+lKneQT91vi/X2UiWfZ/I=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Fri, 12 Aug
 2022 14:23:57 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 14:23:57 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "sumit.garg@linaro.org" <sumit.garg@linaro.org>
Subject: Re: [EXT] Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
Thread-Topic: [EXT] Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from
 a dmabuf file descriptor
Thread-Index: AQHYrYowyLS8ANpaFEi7X96euJxGEa2rTmMAgAAEggA=
Date: Fri, 12 Aug 2022 14:23:57 +0000
Message-ID: <86dbc0dee12038953f2e5f9ada343df952f7568b.camel@nxp.com>
References: <20220811135637.6332-1-olivier.masse@nxp.com>
 <20220811135637.6332-2-olivier.masse@nxp.com>
 <CAFA6WYOKW8=HQbWRRZfvYXXyzN6wov3KLmUiBCFzxz8=+tpenQ@mail.gmail.com>
In-Reply-To: <CAFA6WYOKW8=HQbWRRZfvYXXyzN6wov3KLmUiBCFzxz8=+tpenQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0c600b5-effe-4ec7-0fa3-08da7c6e4ae7
x-ms-traffictypediagnostic: AM9PR04MB7522:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3k+ldki3MJKOgwyBDNlXD9uUrSFc2F5hSD3dAlrYuB239Ue7ltc17F2Sb7qyMMau4vLvRH054gUihmCWikU/mfQlCvrCX9hXA1j7oQbfwUpqeHfh6cheFVtbXfrYk+Qv+D2w0hYufdYTtgMuRL9C84IyCBPXhjATw12DUcZJ/+6Avvp0Hzi9yEyELfDYTJyA21TeJn2t9iBrhRLLxp1XQVVyBDD7oMPM4NsZUlGRNuDYV7SItfg8XSAhQYdpT6+Txxl6CX2jFFBCuX2Up4wR1ICbpNi1Bwgb8Yg42puBe2R0SIvE6nE0ScLXRXMT8/dGj+Se/pP9VDUEHUDYSwTVg64cs8u5Ijqul/iiHjlP/GpW6YAMMY1xXztCfp83RpzroSnyzp/vRmAa1n7/u2PWGHFNyPt9H6uIqBPm7SsEPRfFGEucfZzlV2zsVIhKeo49P00VZDenidCxqxbLtoP+ihl6Y+Nbl/TOD7boUPWi/RHIlb8oGYLshhpxD/Ez/YZCIshW2XEsDeuQh0dkzDxpXu3D3uofB3mY225IfgTjxt+yUcYMBTOrjW1Jw4sKF3geHqMwaqFyCJPTytCH0UDXYYT0frFhKSJL3ip7iUdtZbMkAH95KYaoTjcsQhliN8gNzicnzSdi1m//hih8CBvWRATqjLWGzSy5VYPBE+/Q4MiWFflIwqnyL1KtBuAI76zAZDPRFoXuAf/fTqksPapcO9jBbsZih2pALI9sjv7HHUWLXjunrDkEH3Mcj3eRmGaLTafUXKkWr1cREZo7rEMUeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(122000001)(45080400002)(36756003)(478600001)(6506007)(38070700005)(71200400001)(86362001)(6486002)(966005)(41300700001)(2616005)(26005)(6512007)(186003)(54906003)(83380400001)(8936002)(66946007)(76116006)(316002)(66556008)(30864003)(66446008)(64756008)(4326008)(91956017)(44832011)(8676002)(66476007)(6916009)(2906002)(38100700002)(5660300002)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?k203SzhqDI8OhmL8PQLQGmUVsmwLRSwIjji5pfvw+DFdj/iNJOC05mA3s?=
 =?iso-8859-15?Q?VhqQYwgld1hD+p39efXEiPnG75RH0YA9JgcQn6Ayit5GtAg+DI2DZ5CtG?=
 =?iso-8859-15?Q?0mSJvwoHnEXqNWMW5hi1K8wPbJFciPKt8YPXmmViWal1Br8F7mH4bnay/?=
 =?iso-8859-15?Q?9ohF67EOw60jdA55LpbsB7sBTXqv66LVv47YM3JA/GzMfe0+xLP53SoB9?=
 =?iso-8859-15?Q?jK8pQis9vYTStIz1RIWbC6dMk05rJbmFdvtziVG1Xiwy0BX86VXwToOGq?=
 =?iso-8859-15?Q?RDpGwz4FBIx8Q/rl4eWzyAJZIDWLcy5HaRkjQZS1HBadorlJNQJy7qVFP?=
 =?iso-8859-15?Q?4LPUAIt0M+1Brc1kwvo3Jy4aPyvMtQqZbbb3aWjKlGZbqMqdMyHZD0RN3?=
 =?iso-8859-15?Q?xRj6mYhtVOtztzTHyuHoXm4w67dHhZtnk67SCbwHBDjzjDCqmD8vobcI3?=
 =?iso-8859-15?Q?agl8Dt8kXB75lLnXSK6vhVL3Hz4s1R+qvjOmQoLGFEbtYWTmKx8fIR4Fi?=
 =?iso-8859-15?Q?anwNUAFI5gRGd9RDy/esli1A8kgn6BQDjHqrgxr/4BnUkAvkrUsshKdmI?=
 =?iso-8859-15?Q?5cQt/oqYyYbEDsNOOxMNTHgs5ewTon42vf5WTa9BI10tsrILdsN4XvEp+?=
 =?iso-8859-15?Q?C2SPnxg/qMtGk9pvdAEcYYRy4aDyofXz0i1Fa/b0RXQm2PpTTJ4HRtpjh?=
 =?iso-8859-15?Q?ijVN2jvqvQ3eaKJ/GZblHoBHbEEJBQIGgXl3c4UEV76nYM88fvaKuZMLm?=
 =?iso-8859-15?Q?JR0dKDI5zX9oz0HNZFlxv/FX99VC2sJpemJVi0gXrByoh5Pjz0DrwOXrb?=
 =?iso-8859-15?Q?HIvIFC2p1Dxlyuk2Tts5Ov4xn07R/+B/bFp13WakMT1XM63Ir9F2CRTod?=
 =?iso-8859-15?Q?5saLZDvKTk9MB80WDzAhMNbSaIat93GsyuxwwGY+gRNn+ylrt5rxzVRhY?=
 =?iso-8859-15?Q?jdENRWz8BCLEHT2QE45kWTbdO99C+xfaZBHUQ1zGCWVLHZTQKffY0syAD?=
 =?iso-8859-15?Q?5zOsdkcgU+2QlIzZiJcfGG6220icnvIcXHhSlTynUCcFR4sCJRw5E9WCV?=
 =?iso-8859-15?Q?TM6MgtdM6SJPzYIkOwumlk3OIX/wOkjAJVWIJL5h+RAo063ykSReCAsNd?=
 =?iso-8859-15?Q?Of0FzlGuX0OFBozhXcK0tmTHzgUYyK3v4poTm6Jl3s9EeXyF5DL/L2Dtd?=
 =?iso-8859-15?Q?PYHFIdRaX0UxNOFeyuso6pu0CP3QeJfXEc03h6gsnEiuVDB1VRqX9yzEI?=
 =?iso-8859-15?Q?c+uC8ptmnV9wglmr53JxGR6wLkWCUpfVBV6+Y8xhQksYxZ13kIy5FhaV0?=
 =?iso-8859-15?Q?8r7I3iG1JThKvV1eB2Vxijf7aVnOR8EAn/VUvWaieQdfBRMsTFz92+Lkz?=
 =?iso-8859-15?Q?WrefI/iua8f0zCzMhqUKf3cchdbMT0OLA5Dio5SAFCVHUD6B3Vb/3neld?=
 =?iso-8859-15?Q?hz/E/vpN7yGW1B+y6FctjNTn4rq1fjEwEgeAjSgG0GvwlWY6M4iXQSQ5h?=
 =?iso-8859-15?Q?GzfefnGc6G8ULkpDvIXVGJfmHxscDLydIJQK2nxfNRCfgGZAvt6I5CzWS?=
 =?iso-8859-15?Q?DrqYzbstRxmaI0VTaz67jxlLa1jr6jMHX5N7Euo44O5smbD4avwoo070y?=
 =?iso-8859-15?Q?g2malHD07YsPkWPtJJMO5qbYQx7LAkrzJQdmG3Q5nHzW6dI6XtZqZSe7X?=
 =?iso-8859-15?Q?jx4+?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <4A14F60FD82E1C41B4DB9B4026AC3649@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c600b5-effe-4ec7-0fa3-08da7c6e4ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 14:23:57.1093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ii7RcWUdrufv9bl52t5NOBmK/GzL6pM15EWbZpn2xAvaOk9hUgpHYmJpJODkmgNqpWOP+edWK6pEUbZnMXjCKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522
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
Cc: =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sumit,

Thanks for your comments, please find my answer below.

On ven., 2022-08-12 at 19:36 +0530, Sumit Garg wrote:
> Caution: EXT Email
>=20
> Hi Olivier,
>=20
> On Thu, 11 Aug 2022 at 19:26, Olivier Masse <olivier.masse@nxp.com>
> wrote:
> >=20
> > From: Etienne Carriere <etienne.carriere@linaro.org>
> >=20
> > This change allows userland to create a tee_shm object that refers
> > to a dmabuf reference.
> >=20
> > Userland provides a dmabuf file descriptor as buffer reference.
> > The created tee_shm object exported as a brand new dmabuf reference
> > used to provide a clean fd to userland. Userland shall closed this
> > new
> > fd to release the tee_shm object resources. The initial dmabuf
> > resources
> > are tracked independently through original dmabuf file descriptor.
> >=20
> > Once the buffer is registered and until it is released, TEE driver
> > keeps a refcount on the registered dmabuf structure.
> >=20
> > This change only support dmabuf references that relates to
> > physically
> > contiguous memory buffers.
>=20
> What limits you to extend this feature to non-contiguous memory
> buffers? I believe that should be possible with OP-TEE dynamic shared
> memory which gives you the granularity to register a list of pages.

But it will need more logic in OPTEE OS to verify that all pages are in
the Secure Data Path protected area.
Our solution use a fixed protected reserved memory region and do not
rely on a dynamic protection set in secure.

Best regards,
Olivier

>=20
> -Sumit
>=20
> >=20
> > New tee_shm flag to identify tee_shm objects built from a
> > registered
> > dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged
> > with
> > TEE_SHM_EXT_DMA_BUF.
> >=20
> > Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > From:=20
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Flinaro-swg%2Flinux.git&amp;data=3D05%7C01%7Colivier.masse%40nxp.c=
om%7C204e0821d1c84355ed4208da7c6be5c6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C=
0%7C0%7C637959100100176447%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DMRfn=
QNbwAIj%2Bnd9tSjSb5Nzrv3sQVpVMIdOxxRfu6U4%3D&amp;reserved=3D0
> > (cherry picked from commit
> > 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> > ---
> >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> >  drivers/tee/tee_shm.c    | 99
> > +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_drv.h  | 11 +++++
> >  include/uapi/linux/tee.h | 29 ++++++++++++
> >  4 files changed, 175 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index 8aa1a4836b92..7c45cbf85eb9 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context
> > *ctx,
> >         return ret;
> >  }
> >=20
> > +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                                    struct
> > tee_ioctl_shm_register_fd_data __user *udata)
> > +{
> > +       struct tee_ioctl_shm_register_fd_data data;
> > +       struct tee_shm *shm;
> > +       long ret;
> > +
> > +       if (copy_from_user(&data, udata, sizeof(data)))
> > +               return -EFAULT;
> > +
> > +       /* Currently no input flags are supported */
> > +       if (data.flags)
> > +               return -EINVAL;
> > +
> > +       shm =3D tee_shm_register_fd(ctx, data.fd);
> > +       if (IS_ERR(shm))
> > +               return -EINVAL;
> > +
> > +       data.id =3D shm->id;
> > +       data.flags =3D shm->flags;
> > +       data.size =3D shm->size;
> > +
> > +       if (copy_to_user(udata, &data, sizeof(data)))
> > +               ret =3D -EFAULT;
> > +       else
> > +               ret =3D tee_shm_get_fd(shm);
> > +
> > +       /*
> > +        * When user space closes the file descriptor the shared
> > memory
> > +        * should be freed or if tee_shm_get_fd() failed then it
> > will
> > +        * be freed immediately.
> > +        */
> > +       tee_shm_put(shm);
> > +       return ret;
> > +}
> > +
> >  static int params_from_user(struct tee_context *ctx, struct
> > tee_param *params,
> >                             size_t num_params,
> >                             struct tee_ioctl_param __user *uparams)
> > @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp,
> > unsigned int cmd, unsigned long arg)
> >                 return tee_ioctl_shm_alloc(ctx, uarg);
> >         case TEE_IOC_SHM_REGISTER:
> >                 return tee_ioctl_shm_register(ctx, uarg);
> > +       case TEE_IOC_SHM_REGISTER_FD:
> > +               return tee_ioctl_shm_register_fd(ctx, uarg);
> >         case TEE_IOC_OPEN_SESSION:
> >                 return tee_ioctl_open_session(ctx, uarg);
> >         case TEE_IOC_INVOKE:
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index 836872467dc6..55a3fbbb022e 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -4,6 +4,7 @@
> >   */
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/idr.h>
> >  #include <linux/mm.h>
> >  #include <linux/sched.h>
> > @@ -12,6 +13,14 @@
> >  #include <linux/uio.h>
> >  #include "tee_private.h"
> >=20
> > +/* extra references appended to shm object for registered shared
> > memory */
> > +struct tee_shm_dmabuf_ref {
> > +     struct tee_shm shm;
> > +     struct dma_buf *dmabuf;
> > +     struct dma_buf_attachment *attach;
> > +     struct sg_table *sgt;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t
> > page_count)
> >  {
> >         size_t n;
> > @@ -71,7 +80,16 @@ static void release_registered_pages(struct
> > tee_shm *shm)
> >=20
> >  static void tee_shm_release(struct tee_device *teedev, struct
> > tee_shm *shm)
> >  {
> > -       if (shm->flags & TEE_SHM_POOL) {
> > +       if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> > +               struct tee_shm_dmabuf_ref *ref;
> > +
> > +               ref =3D container_of(shm, struct tee_shm_dmabuf_ref,
> > shm);
> > +               dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +                                        DMA_BIDIRECTIONAL);
> > +
> > +               dma_buf_detach(ref->dmabuf, ref->attach);
> > +               dma_buf_put(ref->dmabuf);
> > +       } else if (shm->flags & TEE_SHM_POOL) {
> >                 teedev->pool->ops->free(teedev->pool, shm);
> >         } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >                 int rc =3D teedev->desc->ops->shm_unregister(shm-
> > >ctx, shm);
> > @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct
> > tee_context *ctx, size_t size)
> >   * tee_client_invoke_func(). The memory allocated is later freed
> > with a
> >   * call to tee_shm_free().
> >   *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR
> > on failure
> >   */
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,
> > size_t size)
> >  {
> > @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct
> > tee_context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >=20
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > fd)
> > +{
> > +       struct tee_shm_dmabuf_ref *ref;
> > +       int rc;
> > +
> > +       if (!tee_device_get(ctx->teedev))
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       teedev_ctx_get(ctx);
> > +
> > +       ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > +       if (!ref) {
> > +               rc =3D -ENOMEM;
> > +               goto err_put_tee;
> > +       }
> > +
> > +       refcount_set(&ref->shm.refcount, 1);
> > +       ref->shm.ctx =3D ctx;
> > +       ref->shm.id =3D -1;
> > +
> > +       ref->dmabuf =3D dma_buf_get(fd);
> > +       if (IS_ERR(ref->dmabuf)) {
> > +               rc =3D PTR_ERR(ref->dmabuf);
> > +               goto err_put_dmabuf;
> > +       }
> > +
> > +       ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx-
> > >teedev->dev);
> > +       if (IS_ERR(ref->attach)) {
> > +               rc =3D PTR_ERR(ref->attach);
> > +               goto err_detach;
> > +       }
> > +
> > +       ref->sgt =3D dma_buf_map_attachment(ref->attach,
> > DMA_BIDIRECTIONAL);
> > +       if (IS_ERR(ref->sgt)) {
> > +               rc =3D PTR_ERR(ref->sgt);
> > +               goto err_unmap_attachement;
> > +       }
> > +
> > +       if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +               rc =3D PTR_ERR(ref->sgt->sgl);
> > +               goto err_unmap_attachement;
> > +       }
> > +
> > +       ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> > +       ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> > +       ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> > +
> > +       mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +       ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref-
> > >shm,
> > +                               1, 0, GFP_KERNEL);
> > +       mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +       if (ref->shm.id < 0) {
> > +               rc =3D ref->shm.id;
> > +               goto err_idr_remove;
> > +       }
> > +
> > +       return &ref->shm;
> > +
> > +err_idr_remove:
> > +       mutex_lock(&ctx->teedev->mutex);
> > +       idr_remove(&ctx->teedev->idr, ref->shm.id);
> > +       mutex_unlock(&ctx->teedev->mutex);
> > +err_unmap_attachement:
> > +       dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > DMA_BIDIRECTIONAL);
> > +err_detach:
> > +       dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +       dma_buf_put(ref->dmabuf);
> > +       kfree(ref);
> > +err_put_tee:
> > +       teedev_ctx_put(ctx);
> > +       tee_device_put(ctx->teedev);
> > +
> > +       return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> >  static struct tee_shm *
> >  register_shm_helper(struct tee_context *ctx, unsigned long addr,
> >                     size_t length, u32 flags, int id)
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index 911cad324acc..40ddd5376c2d 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -25,6 +25,7 @@
> >  #define TEE_SHM_USER_MAPPED    BIT(1)  /* Memory mapped in user
> > space */
> >  #define TEE_SHM_POOL           BIT(2)  /* Memory allocated from
> > pool */
> >  #define TEE_SHM_PRIV           BIT(3)  /* Memory private to TEE
> > driver */
> > +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
> > handle */
> >=20
> >  struct device;
> >  struct tee_device;
> > @@ -276,6 +277,16 @@ struct tee_shm
> > *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
> >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context
> > *ctx,
> >                                             void *addr, size_t
> > length);
> >=20
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file
> > descriptor
> > + *
> > + * @ctx:       Context that allocates the shared memory
> > + * @fd:                Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR
> > on failure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > fd);
> > +
> >  /**
> >   * tee_shm_is_dynamic() - Check if shared memory object is of the
> > dynamic kind
> >   * @shm:       Shared memory handle
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index 25a6c534beb1..6f84060ad005 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> >  #define TEE_IOC_SHM_ALLOC      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE +
> > 1, \
> >                                      struct
> > tee_ioctl_shm_alloc_data)
> >=20
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory
> > registering argument
> > + * @fd:                [in] File descriptor identifying the shared
> > memory
> > + * @size:      [out] Size of shared memory to allocate
> > + * @flags:     [in] Flags to/from allocation.
> > + * @id:                [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by
> > the call
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
> > below.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +       __s64 fd;
> > +       __u64 size;
> > +       __u32 flags;
> > +       __s32 id;
> > +} __aligned(8);
> > +
> > +/**
> > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file
> > descriptor
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor refers to the shared memory object
> > in kernel
> > + * land. The shared memory is freed when the descriptor is closed.
> > + */
> > +#define TEE_IOC_SHM_REGISTER_FD        _IOWR(TEE_IOC_MAGIC,
> > TEE_IOC_BASE + 8, \
> > +                                    struct
> > tee_ioctl_shm_register_fd_data)
> > +
> >  /**
> >   * struct tee_ioctl_buf_data - Variable sized buffer
> >   * @buf_ptr:   [in] A __user pointer to a buffer
> > --
> > 2.25.0
> >=20
