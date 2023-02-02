Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE836876FF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3531610E459;
	Thu,  2 Feb 2023 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823BA10E03A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 07:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlQWGsZhJMcZhxfH8wNETu5osiSmQORokPSiNDVOevRo+aox9DF0tG6uoAxXjIjfkLlqzfp/BfA598chxBRZcH0X+GtkJs8ILYhW5TC+ttkJNvsgl4nL6WHZhA0snYflbU1lbxYmD3uwcWZMOSIh3+RB6L9RFsxNY8g798YrY8Fcp0vB+iN4dy6+gX3g/YCWKTv5HcHzy3HhSx8cHLUH44HSyWBotqyolaf3+dc8DAhTgjs58ErDktLdangnQX4xuHzZZfbG/z1gFAdnUVJjUE+XwffpnkovuRux0isCVs5WRqwnITIxIILSItLaDHfTN2USRtSbQ9I/K3kNpdYzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1DqVC5PEIO5vPTzHHZV88ragBnSLjEUx26iHWJQpew=;
 b=fF5oQl4bjeiAEuKLrVcRBpUnR+NG4EiFIpTW3cWlqkpk5UMZD4GMsbCx4JptJjSZjd89eygh+uaUf+0nHlzGHPfkDyMqUffeQAkkZHVjAbTrXEq03/2BPVieGoI8CgNhZNJGSJWkuLGdWTuT2OzarLRz4d4iiCbu3njjfNoFVYEtTbr5YZZvN8jYcYaz37IK9U8D4oonCVZvdIsIv90bX+j+4OefFSZbEzpamfoejFKp10xOf4D/SiIcrn28wV9dkljUstNtaPFqDJFoPaTxHwsHjL5yOevWZdyNVOxe4lBEaESk3JAMoI1/+/fSzUM9/WxdXNUJ7HgKtRIUProAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1DqVC5PEIO5vPTzHHZV88ragBnSLjEUx26iHWJQpew=;
 b=QyRviXoBGdEfQWzzy7XA6+6UyUu5ODDm9F+t1bjz5eb/lQW7dsJ1d94/Y+AUBjiMTvo5LRAMwkxw1RPBlkP3wxMfM0ZbrXeLuCsByC2islTbufGBjtSLNGDV+/49aWo6F7Jdi1ROJO4OO4Z/9oIvxy6cR6hrvJDh7wzBnVkMM9U=
Received: from PA4PR04MB7520.eurprd04.prod.outlook.com (2603:10a6:102:e9::5)
 by AM9PR04MB8066.eurprd04.prod.outlook.com (2603:10a6:20b:3eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 07:56:24 +0000
Received: from PA4PR04MB7520.eurprd04.prod.outlook.com
 ([fe80::a605:8cb9:97af:4089]) by PA4PR04MB7520.eurprd04.prod.outlook.com
 ([fe80::a605:8cb9:97af:4089%9]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 07:56:24 +0000
From: Cyrille Fleury <cyrille.fleury@nxp.com>
To: Sumit Garg <sumit.garg@linaro.org>, Olivier Masse <olivier.masse@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Topic: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Index: AQHZMj2tcBtqkaJcQUCvE2iCWyqqy665mRQAgAGzCXA=
Date: Thu, 2 Feb 2023 07:56:24 +0000
Message-ID: <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
In-Reply-To: <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7520:EE_|AM9PR04MB8066:EE_
x-ms-office365-filtering-correlation-id: b15dfd16-8f11-436e-9ee3-08db04f2fb48
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dOpySZa+49e+s+IaJLoTN2dY9bwXo5iWuE5p38Wa0eLBPVPapWUs1QsM0Zrr7ARXTUvsk6kvFL94WZMhyfIBHiLnPFLy5a14JxnTIqCXEpWlGTnl7Nuu2nL/bUxeY47bLRIQldpVn6KrNtFy0RibINbIKfst2qqQSHLUoSentrlrFociiF8auOI16FRdC7YInidzmtxXp9zwO0WxkBoOZyE3CpuikewDKQuwlo3Aq2IXyJDhJdqmP2wCt/U9zYTlqjy4mLoXpPatvL0MFFhXtIIEBgOzFIGfpiLK5fltDYYo2+AOeH92LXEeNT6WEMWUT3GhR9vDfmaFkNC3goGoykrXUvsfewY9S6jQvaRJWugUyUMvH7xsYWa+C11uelcvqVDerZ84ZtVXUxf4sEHqipJhpQ/Ya+OCy/VT29JRhiGIB9IJg6zX2SVniy2obV0fXjlCuM1Aghr5CNSTBByhOLSBXDOGGtFBazHN/dXaxo38rxtUT3bVyQEWRgRkdK5oe7blAb+AwqP40lSIVg/749YcT/U8wFWtJ6/oqDvGUVkDiVlq6UlW7/p78bJj1qCRg/KBPb59taHqzQTCdSwY8vUp45J4rWhfxZ+lC68Fi/kIX0SjPVq2d/hTWrm+9CRLOQVK0YqMpsPjIiTOnLKYDy3V92bgG1zamiQvZAKec87sZJrmROBAgA5zYiRhesgDwInjbnnnJiihb1wbivU6kzVGXS2FXqnZTvzaqN1frEQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7520.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199018)(66446008)(45080400002)(55016003)(316002)(4326008)(41300700001)(52536014)(8676002)(66946007)(76116006)(66476007)(110136005)(54906003)(6636002)(38070700005)(122000001)(33656002)(86362001)(64756008)(38100700002)(66556008)(26005)(6506007)(53546011)(9686003)(7696005)(71200400001)(966005)(186003)(44832011)(478600001)(2906002)(7416002)(8936002)(66574015)(83380400001)(5660300002)(30864003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3M2UK/KCssXKvlwWTkuZxh0ED+2kH5LbcZCJs5io0OnyFq/8Z14+UIdiI1?=
 =?iso-8859-1?Q?HSzDTwi2WLeTEBPURc10DTgNrlUWwJyqND2pfnbkzTc+eBu3DCc1JRstpR?=
 =?iso-8859-1?Q?EHDx5RlbxjUTfY7bpBM5o8wYEuBdPlGAIDnPUskbpKrz0FyZXR/2c7etT4?=
 =?iso-8859-1?Q?ey767s8fWg5Yb+4bm0EmTls0frWffGg1LajwT4MCaL4sQP9OA9xJJfDx8i?=
 =?iso-8859-1?Q?lRrbWCjmbV3Ca6Vh89oeyitOBXTyS5BStkmnTKRlPiKyLGQd/RcO6EALL4?=
 =?iso-8859-1?Q?oTVC8U4WkdAhk50fo0nDS9H5Wm+p7P7L4FyY0dzGlazTQ9R0crT1FEmdAQ?=
 =?iso-8859-1?Q?8Xrbvhu1z1ucznXASlcOXCgABBh4O7ajKa2SNoFngU/Kv531hGoVopPBo5?=
 =?iso-8859-1?Q?JcovoEupYvG2oUjI2GKWS7N2s16gVh54FMvA4UmcvNi7FBp+rGguxXXCsI?=
 =?iso-8859-1?Q?T4c/Q2AAJDSYoY1UH6QHZRHKY60YwFeXDYtnhou+Q3J0w0QblFwespZjk2?=
 =?iso-8859-1?Q?VqtT2vHcEYokQiPsDYWmwbkTXY0kNxNnc7TA+FTeTP2eHehJwhZx1wD9Zd?=
 =?iso-8859-1?Q?7xyNTrCkKFr1v9h0HCv6agDi2hFhPvqlailvBjg/Gfoo/7nG7N6SIQ/F4f?=
 =?iso-8859-1?Q?Gw7JZIfmuidXV/aJIopQd9yoaec3RYi6Ohd1lr2ujodMajzcbxsspZlroY?=
 =?iso-8859-1?Q?/o7yr3sewnhWBDMEj4OdpjBHYkY8v9g5X9QBBPyCXM9zfTeeLkO7dbhwtx?=
 =?iso-8859-1?Q?fZVcIM19gWKZkU3n9otNR7fZxdvfhhHP3kVCcwAQs2AF5v+ddC8Q/qm2rR?=
 =?iso-8859-1?Q?8EqJDQggYb4/xoeYNuf4G6hnUSkoTV5XdCSpdXNz0XMulnFUdWq+hqpoCR?=
 =?iso-8859-1?Q?hzqiWwhOu3WV95wI8zeJeyRlbVpMBYQUmwmYBF81omMIu1AJPfRQ6GrD0Q?=
 =?iso-8859-1?Q?Hf2IJAR6mD3js4nwnpkwpB//iVuLf4lZJSf0YKv1CK2D45qmv/6fbdaLiR?=
 =?iso-8859-1?Q?4zJk/rBsJb+qH2IUuUoBLSKU56g+G24Ner0T5Jz3HjfDD5RmPAtYcScDpK?=
 =?iso-8859-1?Q?pb/Pt8pDqpR3hKquC3Q6zUZUVKBSZGNzZrzSzsZNya4YvCU4V0JNY5hpCB?=
 =?iso-8859-1?Q?zaGE/cKU6KgUsyno/cjWUi20RcEpj1rrI3ylbYRuq96oFaVjC2q37OvD8Z?=
 =?iso-8859-1?Q?EWbwe2OBdGa9faDOcFZfMCLLOWM/3YAsvOK5l1hCoUbTRtCpadqJfuK5dF?=
 =?iso-8859-1?Q?5KG24KouJ5FtO7XSMGr/JKs+7j7z8Jm9Yq6vn4IAI+H7BCptb2DPJkfmAp?=
 =?iso-8859-1?Q?pQXAG6X0AtqoCIV0dg4+5d1i5C0BCJuYEYZDYhTibfuSpeLsaL+TMkLA4G?=
 =?iso-8859-1?Q?vv2Rc7WW6PlL5/2a6baNCIXXkzIvRZN8bqTOcB5GB6nKbKaD7Y5lzTeZvz?=
 =?iso-8859-1?Q?rODGywJ1JmjxvNIrXRUcQSdNs6KlF7xwyISIzztvg+9funmLtGHVz4+h05?=
 =?iso-8859-1?Q?pmI//03am/hgv7sOIYpi1XivMq5zoSd7v2bEJ4uwIxm8mpzfVgb1xEUKS1?=
 =?iso-8859-1?Q?uZfGb4fVsr2fDd9BaP4G2TkqT6CTXEslTtJl6oA2HVbQiOX3F/jS1noLLk?=
 =?iso-8859-1?Q?WFQzGbd+Nzq9SSKQmeHgaE2W4G33tO30/a?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7520.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15dfd16-8f11-436e-9ee3-08db04f2fb48
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 07:56:24.6869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+AFVCZMACdP77LyjFZKC6ktwqUwv3ZPA+8nJXoIapvqnZ+L5cnORwEdHqmmZUJmAXUjANuJ6fJ8q1pKe4g51g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8066
X-Mailman-Approved-At: Thu, 02 Feb 2023 08:07:39 +0000
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
Cc: Peter Griffin <peter.griffin@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sumit, all

Upstream OP-TEE should support registering a dmabuf since a while, given ho=
w widely dmabuf is used in Linux for passing buffers around between devices=
.

Purpose of the new register_tee_shm ioctl is to allow OPTEE to use memory a=
llocated from the exiting linux dma buffer. We don't need to have secure dm=
a-heap up streamed.=20

You mentioned secure dma-buffer, but secure dma-buffer is a dma-buffer, so =
the work to be done for secure or "regular" dma buffers by the register_tee=
_shm ioctl is 100% the same.

The scope of this ioctl is limited to what existing upstream dma-buffers ar=
e:
        -> sharing buffers for hardware (DMA) access across multiple device=
 drivers and subsystems, and for synchronizing asynchronous hardware access=
.
       -> It means continuous memory only.=20

So if we reduce the scope of register tee_shm to exiting dma-buffer area, t=
he current patch does the job. =20

Regards.

-----Original Message-----
From: Sumit Garg <sumit.garg@linaro.org>=20
Sent: Wednesday, February 1, 2023 6:34 AM
To: Olivier Masse <olivier.masse@nxp.com>
Cc: fredgc@google.com; linux-media@vger.kernel.org; linaro-mm-sig@lists.lin=
aro.org; afd@ti.com; op-tee@lists.trustedfirmware.org; jens.wiklander@linar=
o.org; joakim.bech@linaro.org; sumit.semwal@linaro.org; Peter Griffin <pete=
r.griffin@linaro.org>; linux-kernel@vger.kernel.org; etienne.carriere@linar=
o.org; dri-devel@lists.freedesktop.org; christian.koenig@amd.com; Cl=E9ment=
 Faure <clement.faure@nxp.com>; Cyrille Fleury <cyrille.fleury@nxp.com>
Subject: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm from=
 a dmabuf file descriptor

Caution: EXT Email

Hi Olivier,

On Fri, 27 Jan 2023 at 16:24, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Hi Joakim,
> Hi Etienne,
>
> Let me bring back this pull request for OPTEE Linux driver.
>
> Last feedback was from Christian K=F6nig and Sumit Garg.
> From Christian:
> > Just two comments:
> >
> > 1. Dmitry is working on a change which renames some functions and=20
> > makes it mandatory to call them with the dma_resv lock held.
> >
> > Depending on how you want to upstream this change you will certainly=20
> > run into conflicts with that.
>
> Is there any update on these changes ?
>
> >
> > 2. Would it be possible to do this dynamically? In other words does=20
> > the tee driver has a concept of buffers moving around?
>
> We do not support dynamic secure memory heap.
>
> From Sumit:
> > What limits you to extend this feature to non-contiguous memory=20
> > buffers? I believe that should be possible with OP-TEE dynamic=20
> > shared memory which gives you the granularity to register a list of pag=
es.
>
> Our solution use a fixed protected reserved memory region and do not=20
> rely on a dynamic protection managed in secure.
>
> The scope of this implementation rely on a static memory region=20
> handled by a specific DMA Heap type.
>

AFAIR, the last review for v2 is here [1]. So we need to have this secure D=
MA heap upstream in order for ioctl added by this patch to be usable.

[1] https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.trustedfirmware.org%2Farchives%2Flist%2Fop-tee%40lists.trustedfirmware.o=
rg%2Fmessage%2FM3WLO7RNG22OR4744BY6XNG2GLIYMNHN%2F&data=3D05%7C01%7Ccyrille=
.fleury%40nxp.com%7Cb24461a4e7284314dff408db0415f23e%7C686ea1d3bc2b4c6fa92c=
d99c5c301635%7C0%7C0%7C638108264533221384%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&s=
data=3D6pRAqnMlJ0TX000YmlgTkPKn411VBC%2Bj29O9KhJjJOg%3D&reserved=3D0

-Sumit

> Best regards,
> Olivier MASSE
>
>
> On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
> > From: Etienne Carriere <etienne.carriere@linaro.org>
> >
> > This change allows userland to create a tee_shm object that refers=20
> > to a dmabuf reference.
> >
> > Userland provides a dmabuf file descriptor as buffer reference.
> > The created tee_shm object exported as a brand new dmabuf reference=20
> > used to provide a clean fd to userland. Userland shall closed this=20
> > new fd to release the tee_shm object resources. The initial dmabuf=20
> > resources are tracked independently through original dmabuf file=20
> > descriptor.
> >
> > Once the buffer is registered and until it is released, TEE driver=20
> > keeps a refcount on the registered dmabuf structure.
> >
> > This change only support dmabuf references that relates to=20
> > physically contiguous memory buffers.
> >
> > New tee_shm flag to identify tee_shm objects built from a registered
> > dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged=20
> > with TEE_SHM_EXT_DMA_BUF.
> >
> > Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > From:=20
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
> > thub.com%2Flinaro-swg%2Flinux.git&data=3D05%7C01%7Ccyrille.fleury%40nx
> > p.com%7Cb24461a4e7284314dff408db0415f23e%7C686ea1d3bc2b4c6fa92cd99c5
> > c301635%7C0%7C0%7C638108264533221384%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> > iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> > C%7C%7C&sdata=3D8jbFPaF%2B5JBed4Uvo1hsJiB%2BP71KUgJmnW%2BIi3zLfok%3D&r
> > eserved=3D0 (cherry picked from commit=20
> > 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> > ---
> >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> >  drivers/tee/tee_shm.c    | 99
> > +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_drv.h  | 11 +++++  include/uapi/linux/tee.h | 29=20
> > ++++++++++++
> >  4 files changed, 175 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c index=20
> > 8aa1a4836b92..7c45cbf85eb9 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >       return ret;
> >  }
> >
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
> > +      * When user space closes the file descriptor the shared memory
> > +      * should be freed or if tee_shm_get_fd() failed then it will
> > +      * be freed immediately.
> > +      */
> > +     tee_shm_put(shm);
> > +     return ret;
> > +}
> > +
> >  static int params_from_user(struct tee_context *ctx, struct=20
> > tee_param *params,
> >                           size_t num_params,
> >                           struct tee_ioctl_param __user *uparams) @@=20
> > -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned=20
> > int cmd, unsigned long arg)
> >               return tee_ioctl_shm_alloc(ctx, uarg);
> >       case TEE_IOC_SHM_REGISTER:
> >               return tee_ioctl_shm_register(ctx, uarg);
> > +     case TEE_IOC_SHM_REGISTER_FD:
> > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> >       case TEE_IOC_OPEN_SESSION:
> >               return tee_ioctl_open_session(ctx, uarg);
> >       case TEE_IOC_INVOKE:
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c index=20
> > 836872467dc6..55a3fbbb022e 100644
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
> >
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
> >       size_t n;
> > @@ -71,7 +80,16 @@ static void release_registered_pages(struct=20
> > tee_shm *shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct=20
> > tee_shm *shm)  {
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
> > @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct=20
> > tee_context *ctx, size_t size)
> >   * tee_client_invoke_func(). The memory allocated is later freed=20
> > with a
> >   * call to tee_shm_free().
> >   *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR=20
> > + on
> > failure
> >   */
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,=20
> > size_t size)  { @@ -229,6 +247,83 @@ struct tee_shm=20
> > *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)  } =20
> > EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int=20
> > +fd) {
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
> > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
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
> >  static struct tee_shm *
> >  register_shm_helper(struct tee_context *ctx, unsigned long addr,
> >                   size_t length, u32 flags, int id) diff --git=20
> > a/include/linux/tee_drv.h b/include/linux/tee_drv.h index=20
> > 911cad324acc..40ddd5376c2d 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -25,6 +25,7 @@
> >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user space=20
> > */
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool
> > */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver
> > */
> > +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
> > handle */
> >
> >  struct device;
> >  struct tee_device;
> > @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct=20
> > tee_context *ctx, size_t size);  struct tee_shm=20
> > *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >                                           void *addr, size_t=20
> > length);
> >
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file
> > descriptor
> > + *
> > + * @ctx:     Context that allocates the shared memory
> > + * @fd:              Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR=20
> > + on
> > failure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > fd);
> > +
> >  /**
> >   * tee_shm_is_dynamic() - Check if shared memory object is of the=20
> > dynamic kind
> >   * @shm:     Shared memory handle
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h=20
> > index 25a6c534beb1..baf3cd7cfdac 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1,
> > \
> >                                    struct tee_ioctl_shm_alloc_data)
> >
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory=20
> > +registering
> > argument
> > + * @fd:              [in] File descriptor identifying the shared
> > memory
> > + * @size:    [out] Size of shared memory to allocate
> > + * @flags:   [in] Flags to/from allocation.
> > + * @id:              [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by=20
> > + the
> > call
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
> > below.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +     __s64 fd;
> > +     __u64 size;
> > +     __u32 flags;
> > +     __s32 id;
> > +} __attribute__ ((aligned (8)));
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
> >  /**
> >   * struct tee_ioctl_buf_data - Variable sized buffer
> >   * @buf_ptr: [in] A __user pointer to a buffer
