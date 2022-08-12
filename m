Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D5591154
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60059B328E;
	Fri, 12 Aug 2022 13:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B59A8DB61
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 13:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7TKRXS7+dgNYDDSAmpG+sXRH5JtvrzRRJb+ES/JovQMwQdBmfrQ5YaBYyf0Wr77Y+y79b9KlEO5MFJmBt1HBktLCTNZYG6KJ9OGEoqumfQ6l8wDTAo6NAM0n1jywJi/JdUoVIVry40M4fQB7OYzsxT5B97a9h+V5bEgk5je+fr/p9l4SWJNXsag/0TG+Ws2cHJNK+uSCbA6sepWXU3JRJ7iHUDbzc1N2c385bE57ysGXS2LuR8BYGUPcqtiHx/20G8vKoWQxMcXqhTd0sgZvwMX1XWA77Zk27DZco2SidJq7xif6WttHRqeBMMv3Uto4SVQ4QbsbHFj7AGCsDAHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCMMmo1J916vkbQPOV4JMJrcJzcLZI8Txkh4PuytXdc=;
 b=RstbzyIV6gzfeGODQFKuk3OG/8MloI9RoOwtjfN9KUjJw6FK+MMfiIf88xvMbTS0KzV0y8wqsrC7Xkq1siw96isMP6rhH5OfKz/5jOkVCelC3Ke0VnUWuNjxROXw1ltl3GlK9pLwBSBv8qB4Y7Bl84sAI4RurVcWkk8a4mvK35p5268TvWnWB8CoY6F+9n/SmX/rmIkTylTNDeRPpZo2Jqrp5PwCf4Ke+byLzf90bIg8n6QK/EFiivVXUuMA1epSD3LRxvG0f2X8IDGv0jcns1yfQltkP2i0PMOV5bHIH5RCu2zQhHndGVIZePuxre9+sxUBEhmDGsmd7WV6IfuStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCMMmo1J916vkbQPOV4JMJrcJzcLZI8Txkh4PuytXdc=;
 b=YZcTvZ9vFxqZ3O4ouOEIQHdUtbSv3nfmQmzHppLtQKbFhi1oKRC0W8pRtjUpxswSU6ZQSzGzwFusdvwvgg7cK8zpAhfkD+MH1rsC31r0Oq1aSMUecTxHQAn+xUXQDMCUVs0Qg0o7Xmw6bkKD7UjQA3oLCn1iL7lWMz72YvsjK/w=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM0PR04MB4180.eurprd04.prod.outlook.com (2603:10a6:208:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 13:24:55 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 13:24:55 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>
Subject: Re: [EXT] Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
Thread-Topic: [EXT] Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from
 a dmabuf file descriptor
Thread-Index: AQHYrYowyLS8ANpaFEi7X96euJxGEa2rDocAgAAznwA=
Date: Fri, 12 Aug 2022 13:24:54 +0000
Message-ID: <e40c24ae91414f979e257009d71dd66c6459b348.camel@nxp.com>
References: <20220811135637.6332-1-olivier.masse@nxp.com>
 <20220811135637.6332-2-olivier.masse@nxp.com>
 <c92f34ca-db00-5709-f534-a95f1275461b@amd.com>
In-Reply-To: <c92f34ca-db00-5709-f534-a95f1275461b@amd.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2948a79e-d15c-425c-419f-08da7c660b96
x-ms-traffictypediagnostic: AM0PR04MB4180:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t2YcDsasfIhIcQ3gn/fhM0hps53TxKDnThaTuGx3ZR5kENUgYM+P5+KULKeFVnqW7Z1/slXoNDAyrQF3LW4zjeMFEiM9gPjYqYyDewzzUvKvuwE6ufl2R8Yol35vcWhdDDsxtiyLLTPDXFf8wONn2yghLe9sKz0AWHed3iRUyvUnGqHt6f/mQW2M78yxM3zmxNz/Rulg9Hno5E37Jb6sTOMElvNycvHsa+XU0MtmTvL266l1sXh5WKr1bkqa2AGfGhJ5RkaTzi7otUHGnB1naQ8lxKMrDCp+BFnuaG1odmv9Vk8vgk7a9XMynUF3EbVSVnvkkonEiklmhptwKa5KcWH7SRVFIlhAa0vmO8dBG3+70L/apbvMK9RkmmDQk9/ew0ersByUc7BJehDv+NCq3y9bx6TfGVNDnV2RMv00ybwErZK9WOuIVgMPqf3xNzmt2BkwMo6TE2lGuerZ98i2ePEQkXDOuQXRcaySuM1yBguYzp3BzWbu2gLwkykCllQBBMZMB4SsI6Tq5/s6Cppw8yY5j6dgV00/Rlsf5pE5kKqKvham5mod1JYusfKD2koCanwA8M+b/Tw/cHUhWenudFGp3gxVnPT+30dgwIcJT7FleS2OQO/3aMIvY4Qsl8IVyOjhMuSIggu3053KMyFntTaujNWmFyZuM6ZmfUUe5pBpM5DQueKHWZmQpiD1Ualr2Dk9znKU0IX4nkGFKRy8yduqKeaCfIM9DMCotKd3cUtvlhgvR8E39g2cmv2+UXpO0ipsFQjGvZI0qKLthvwYJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(186003)(316002)(54906003)(36756003)(38070700005)(2616005)(2906002)(45080400002)(66574015)(6512007)(83380400001)(26005)(30864003)(41300700001)(86362001)(478600001)(6486002)(966005)(8676002)(66446008)(4326008)(66476007)(66556008)(66946007)(64756008)(6506007)(76116006)(91956017)(5660300002)(110136005)(38100700002)(8936002)(44832011)(122000001)(71200400001)(7416002)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?dwpk4p2Ihw8LKpH5CQnAeEsUs26vzXa3FfG8rAuqi8IirHUDimx72TmJr?=
 =?iso-8859-15?Q?VPlWycRP6G5xP7UDcysGN96vW766E4LGeXhHLATnivWd8Lo/Di4w9Bjve?=
 =?iso-8859-15?Q?3Sqpeuu2UmkK9N5PpqAcoPMRrpH1KgoiX78WGPe5IE7obSTCTWaezES8z?=
 =?iso-8859-15?Q?q/NE1MsmZ9vvBq6LhgkIK3XvUiPOY5z87pm7GuyBuWclakkv5f9hIcwVn?=
 =?iso-8859-15?Q?stPph0J40iFcRQYs3diAYomoHp9836dq4VuP6DqYnwoFFRQ1gDH0dWR1A?=
 =?iso-8859-15?Q?Nrs6k/spstC4QKeEjzlTkfpqtS7a9eHuh+WLzfWLF4nWNZ9145uaByiC9?=
 =?iso-8859-15?Q?vXZk8yWPbJIWVQ3ZXs47Lq3xnWlCeDTvA+Ub9yQxSiTtnuqnt2auGQ9LW?=
 =?iso-8859-15?Q?b3tfZNI5v6FOELqJBrjTq1QDcVYhyjtabMtIkTZYUkmwuxhQdZ6zh0Z+X?=
 =?iso-8859-15?Q?rntf5GxyG8/pyG16Uc3RBxBdHKjjg+/GzPZpE1EGCxvJLaUS7i4H1RsFU?=
 =?iso-8859-15?Q?QeyuISWWlsPvlK1o2vPN4OHLkNrA96+avLspD81PeMa3qgYVYSLpDX8nh?=
 =?iso-8859-15?Q?ix5HA3gvjZdyYSB3lc+flt6f+fzbH/MYv4YTWg57WZlVQtUSHoXPUv3u2?=
 =?iso-8859-15?Q?5n0hYZccrOtc469VkENRNWrSQD1OokqNLgl3ACmAEOzf8aaKb+r6GIzH4?=
 =?iso-8859-15?Q?E/KP4QVeaX59KxrVep1o/gR9AFHk80ni8+olHUNuqTJfOhhNnRTD71kE5?=
 =?iso-8859-15?Q?uYCirl5CBd28YVKtfFcyvtb+dZwu085sNSemlndV8kHi2ikEdAo7d02jM?=
 =?iso-8859-15?Q?9frm6fNwjPTz+LkqAbmLrnT062YnBRuWwgTwPzGXy7k7OFMcV4WGCjKQA?=
 =?iso-8859-15?Q?2yhFl/PDZL3sMbZCYUbii6tyjjIgn7nth2Ezq0x3BjrCqBUOWg46McRgR?=
 =?iso-8859-15?Q?4UQ4FprV6HccSpgtminVz6no5aHr3kFQb2NaD8qc+VLJgIxjNF3fPdpR3?=
 =?iso-8859-15?Q?zfZ+KmO1jxRyAOB4S/ctIAk2t0NEx0IOhBvts/EMtiSg8V5De493J55xe?=
 =?iso-8859-15?Q?MCDRUt1wWcZG8x0pbojsli3Mrd8kSOfp2IiKtzYIVRpJ2yzLW1SVL2aD+?=
 =?iso-8859-15?Q?2fSm+w1eV7N+f9JzAdPwHlT2MkBE/BKRN/3kkJAPgw9XSfrzxRGn9s2tT?=
 =?iso-8859-15?Q?ZlQeM4ZXCgplzwoyXC++QbpyCCuyMNkt+Ko3bTc6PwNl7R+ecq/epE3BX?=
 =?iso-8859-15?Q?JrbOpf3tq9EieaHdgtGvamAOn1af6t7In/cPqlY2GL85VE2s8F/E5dqw2?=
 =?iso-8859-15?Q?+FAzwTEkHtai8BAGdAjiwm6SIIcFT4TunpXcVrgkeGuJ29X29jBGw5ABc?=
 =?iso-8859-15?Q?bcIJDBXS00QhIy9Bqy+cSjg99IJi7UWAaqr2GV+Dbd58QgE9I+ABgDOMP?=
 =?iso-8859-15?Q?UgyPEpRPBT/xcW5yiRvEt0cfbjW1cxk/6GEhWnp1v+FQGhvxJgwTGn+Rf?=
 =?iso-8859-15?Q?GvHqk1B39LJ5iTDW2YATHzO/3rJhsIKCmCbRe+LcxRu/87xNLZbGqBEXb?=
 =?iso-8859-15?Q?2Q4mP+lTJ0Yo4n8lq0PLdKnEACci6BkTTdqX1yhFhcB5yROve+4y2SEOq?=
 =?iso-8859-15?Q?9HxT6Fb882g0+M3W8PHgS6zsWhfksC2qZHNTY7FMOBAB1HVJh7qQP8dRZ?=
 =?iso-8859-15?Q?pEaH?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <F3DFE1B5BA84D9459D722CD846B8EB18@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2948a79e-d15c-425c-419f-08da7c660b96
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 13:24:54.8626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZtnAOPBdUu9DSKvrUER+CXfKZl7FUtN42ZA6sSPgAa5QH0hD77Dx/NCGqFTWK/l+V220HQVC0aSTI704buXneQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4180
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
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On ven., 2022-08-12 at 12:18 +0200, Christian K=F6nig wrote:
> Caution: EXT Email
>=20
> Hi Etienne,
>=20
> at least I don't see anything obvious broken.
>=20
> Just two comments:
>=20
> 1. Dmitry is working on a change which renames some functions and
> makes
> it mandatory to call them with the dma_resv lock held.
>=20
> Depending on how you want to upstream this change you will certainly
> run
> into conflicts with that.

ok could you send me some link to his changes ?

>=20
> 2. Would it be possible to do this dynamically? In other words does
> the
> tee driver has a concept of buffers moving around?

I'm not sure to understand what you mean by a moving buffer ?
For information the TEE need to map the buffer in secure which is done
when calling the invoke operation function.

>=20
> Am 11.08.22 um 15:56 schrieb Olivier Masse:
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
> That sounds like a pretty hard restriction, but I obviously don't see
> how to avoid it either.
>=20
> Regards,
> Christian.
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
om%7C03c2d3cc95b8429693c108da7c4bf7a7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C=
0%7C0%7C637958962989857231%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dvz8Y=
7ZwKXteePpWQVO8EhmZ1oyIX0xOCRd%2BGH7xHjII%3D&amp;reserved=3D0
> > (cherry picked from commit
> > 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> > ---
> >   drivers/tee/tee_core.c   | 38 +++++++++++++++
> >   drivers/tee/tee_shm.c    | 99
> > +++++++++++++++++++++++++++++++++++++++-
> >   include/linux/tee_drv.h  | 11 +++++
> >   include/uapi/linux/tee.h | 29 ++++++++++++
> >   4 files changed, 175 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index 8aa1a4836b92..7c45cbf85eb9 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context
> > *ctx,
> >       return ret;
> >   }
> >=20
> > +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                                  struct
> > tee_ioctl_shm_register_fd_data __user *udata)
> > +{
> > +     struct tee_ioctl_shm_register_fd_data data;
> > +     struct tee_shm *shm;
> > +     long ret;
> > +
> > +     if (copy_from_user(&data, udata, sizeof(data)))
> > +             return -EFAULT;
> > +
> > +     /* Currently no input flags are supported */
> > +     if (data.flags)
> > +             return -EINVAL;
> > +
> > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > +     if (IS_ERR(shm))
> > +             return -EINVAL;
> > +
> > +     data.id =3D shm->id;
> > +     data.flags =3D shm->flags;
> > +     data.size =3D shm->size;
> > +
> > +     if (copy_to_user(udata, &data, sizeof(data)))
> > +             ret =3D -EFAULT;
> > +     else
> > +             ret =3D tee_shm_get_fd(shm);
> > +
> > +     /*
> > +      * When user space closes the file descriptor the shared
> > memory
> > +      * should be freed or if tee_shm_get_fd() failed then it will
> > +      * be freed immediately.
> > +      */
> > +     tee_shm_put(shm);
> > +     return ret;
> > +}
> > +
> >   static int params_from_user(struct tee_context *ctx, struct
> > tee_param *params,
> >                           size_t num_params,
> >                           struct tee_ioctl_param __user *uparams)
> > @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp,
> > unsigned int cmd, unsigned long arg)
> >               return tee_ioctl_shm_alloc(ctx, uarg);
> >       case TEE_IOC_SHM_REGISTER:
> >               return tee_ioctl_shm_register(ctx, uarg);
> > +     case TEE_IOC_SHM_REGISTER_FD:
> > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> >       case TEE_IOC_OPEN_SESSION:
> >               return tee_ioctl_open_session(ctx, uarg);
> >       case TEE_IOC_INVOKE:
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index 836872467dc6..55a3fbbb022e 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -4,6 +4,7 @@
> >    */
> >   #include <linux/anon_inodes.h>
> >   #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >   #include <linux/idr.h>
> >   #include <linux/mm.h>
> >   #include <linux/sched.h>
> > @@ -12,6 +13,14 @@
> >   #include <linux/uio.h>
> >   #include "tee_private.h"
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
> >   static void shm_put_kernel_pages(struct page **pages, size_t
> > page_count)
> >   {
> >       size_t n;
> > @@ -71,7 +80,16 @@ static void release_registered_pages(struct
> > tee_shm *shm)
> >=20
> >   static void tee_shm_release(struct tee_device *teedev, struct
> > tee_shm *shm)
> >   {
> > -     if (shm->flags & TEE_SHM_POOL) {
> > +     if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> > +             struct tee_shm_dmabuf_ref *ref;
> > +
> > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref,
> > shm);
> > +             dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +                                      DMA_BIDIRECTIONAL);
> > +
> > +             dma_buf_detach(ref->dmabuf, ref->attach);
> > +             dma_buf_put(ref->dmabuf);
> > +     } else if (shm->flags & TEE_SHM_POOL) {
> >               teedev->pool->ops->free(teedev->pool, shm);
> >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx,
> > shm);
> > @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct
> > tee_context *ctx, size_t size)
> >    * tee_client_invoke_func(). The memory allocated is later freed
> > with a
> >    * call to tee_shm_free().
> >    *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR
> > on failure
> >    */
> >   struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,
> > size_t size)
> >   {
> > @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct
> > tee_context *ctx, size_t size)
> >   }
> >   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >=20
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > fd)
> > +{
> > +     struct tee_shm_dmabuf_ref *ref;
> > +     int rc;
> > +
> > +     if (!tee_device_get(ctx->teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > +     if (!ref) {
> > +             rc =3D -ENOMEM;
> > +             goto err_put_tee;
> > +     }
> > +
> > +     refcount_set(&ref->shm.refcount, 1);
> > +     ref->shm.ctx =3D ctx;
> > +     ref->shm.id =3D -1;
> > +
> > +     ref->dmabuf =3D dma_buf_get(fd);
> > +     if (IS_ERR(ref->dmabuf)) {
> > +             rc =3D PTR_ERR(ref->dmabuf);
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx-
> > >teedev->dev);
> > +     if (IS_ERR(ref->attach)) {
> > +             rc =3D PTR_ERR(ref->attach);
> > +             goto err_detach;
> > +     }
> > +
> > +     ref->sgt =3D dma_buf_map_attachment(ref->attach,
> > DMA_BIDIRECTIONAL);
> > +     if (IS_ERR(ref->sgt)) {
> > +             rc =3D PTR_ERR(ref->sgt);
> > +             goto err_unmap_attachement;
> > +     }
> > +
> > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +             rc =3D PTR_ERR(ref->sgt->sgl);
> > +             goto err_unmap_attachement;
> > +     }
> > +
> > +     ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> > +     ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> > +     ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> > +
> > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref-
> > >shm,
> > +                             1, 0, GFP_KERNEL);
> > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +     if (ref->shm.id < 0) {
> > +             rc =3D ref->shm.id;
> > +             goto err_idr_remove;
> > +     }
> > +
> > +     return &ref->shm;
> > +
> > +err_idr_remove:
> > +     mutex_lock(&ctx->teedev->mutex);
> > +     idr_remove(&ctx->teedev->idr, ref->shm.id);
> > +     mutex_unlock(&ctx->teedev->mutex);
> > +err_unmap_attachement:
> > +     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > DMA_BIDIRECTIONAL);
> > +err_detach:
> > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +     dma_buf_put(ref->dmabuf);
> > +     kfree(ref);
> > +err_put_tee:
> > +     teedev_ctx_put(ctx);
> > +     tee_device_put(ctx->teedev);
> > +
> > +     return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> >   static struct tee_shm *
> >   register_shm_helper(struct tee_context *ctx, unsigned long addr,
> >                   size_t length, u32 flags, int id)
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index 911cad324acc..40ddd5376c2d 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -25,6 +25,7 @@
> >   #define TEE_SHM_USER_MAPPED BIT(1)  /* Memory mapped in user
> > space */
> >   #define TEE_SHM_POOL                BIT(2)  /* Memory allocated
> > from pool */
> >   #define TEE_SHM_PRIV                BIT(3)  /* Memory private to
> > TEE driver */
> > +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
> > handle */
> >=20
> >   struct device;
> >   struct tee_device;
> > @@ -276,6 +277,16 @@ struct tee_shm
> > *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
> >   struct tee_shm *tee_shm_register_kernel_buf(struct tee_context
> > *ctx,
> >                                           void *addr, size_t
> > length);
> >=20
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file
> > descriptor
> > + *
> > + * @ctx:     Context that allocates the shared memory
> > + * @fd:              Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR
> > on failure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > fd);
> > +
> >   /**
> >    * tee_shm_is_dynamic() - Check if shared memory object is of the
> > dynamic kind
> >    * @shm:    Shared memory handle
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index 25a6c534beb1..6f84060ad005 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> >   #define TEE_IOC_SHM_ALLOC   _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE +
> > 1, \
> >                                    struct tee_ioctl_shm_alloc_data)
> >=20
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory
> > registering argument
> > + * @fd:              [in] File descriptor identifying the shared
> > memory
> > + * @size:    [out] Size of shared memory to allocate
> > + * @flags:   [in] Flags to/from allocation.
> > + * @id:              [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by
> > the call
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
> > below.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +     __s64 fd;
> > +     __u64 size;
> > +     __u32 flags;
> > +     __s32 id;
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
> > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC,
> > TEE_IOC_BASE + 8, \
> > +                                  struct
> > tee_ioctl_shm_register_fd_data)
> > +
> >   /**
> >    * struct tee_ioctl_buf_data - Variable sized buffer
> >    * @buf_ptr:        [in] A __user pointer to a buffer
>=20
>=20
