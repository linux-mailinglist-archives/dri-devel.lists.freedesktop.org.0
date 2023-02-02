Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F3E68799F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3737510E4C3;
	Thu,  2 Feb 2023 09:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F95810E4C3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:58:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dr8so4292931ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 01:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kku2DhhU4VWgvfyOCU5nzUE3POH4k+SsLMWcUvaMZuQ=;
 b=d3JMFgsKkm45dGp7zv/adGjs4L/Gp2Q4SPdCLvaKmBIWCEyYpFJqjteI0sdyKvac2p
 AmKihJbDIU7+nBwd7FeOyZHxV57m2X7YstituxEaFR2raDC9y3o9mJCuMtGNbQrSD4AA
 U4g+/aRfGloVlLvA8p1cSX+ooq8VwNNAmG1FyTPQJs5DYO5UxbJkISZwBGavjQq+MQ7Q
 Hfkdyt1wwrQwC0gE3Q3ZwXW01js9eATZTal5n1rl0togMLXfAF2OewVTU9/JBr33Ws/O
 ECy+n1m7Xj6fnldvSKWGCeNCEqnHpMUWaXNMrHNEb03vaquITnooypN8dcX/97+Ur5RO
 fVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kku2DhhU4VWgvfyOCU5nzUE3POH4k+SsLMWcUvaMZuQ=;
 b=TIksMYtkT0WQRoMbFWZQd2uehZeocIp/Ro7dogeYq8oSaB/mX8CVlx4JgujYSeg0JX
 Gp3MGG2xmy3csBCmK4JZwR6mKxVmLGuT3HLkp9aDXsmylGpnwQeI5RfjIV2/D3lH3k68
 Bg9H36Zgl7EASMTx24qUoq3vUs8cTH6/YxCHv4P9monq2Gvt9LjmGlHWMjWJUPmeiRj3
 vnkx8DLtkGzTIXi4lCvHeaEYnZxtNb7Z/kkIjK87go3P3o8sLbM+ANAI8YZer6MAR2vS
 mQ8X6YfVDPUJTF00TunbZHGwdAnRM36IXdYRnpI2lu7lNTxk6TLdd7BDPI9XR6I1Ld6L
 0wRA==
X-Gm-Message-State: AO0yUKUWyUz5LuKf+t5DjjWrLJ4U5iPMEfyTjIXcJPBp9Dq1omXhXc1J
 g0GLZ4s/yrncl9cw95mEoB+etZpT7yreg07Ev45/JQ==
X-Google-Smtp-Source: AK7set+cpMZoUBbLi7y62qKLOfzTpowS10SFktJUS64MEwyyN0nazQkW2SZ0qBCAUtin9d4sf1E9nAl+TK9Tnd013IM=
X-Received: by 2002:a17:906:ca41:b0:88b:a2de:ed92 with SMTP id
 jx1-20020a170906ca4100b0088ba2deed92mr1679750ejb.193.1675331918961; Thu, 02
 Feb 2023 01:58:38 -0800 (PST)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
In-Reply-To: <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 2 Feb 2023 10:58:27 +0100
Message-ID: <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
To: Sumit Garg <sumit.garg@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?Q?Cl=C3=A9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Cyrille Fleury <cyrille.fleury@nxp.com>, Olivier Masse <olivier.masse@nxp.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Cyrille,
>
> Please don't top post as it makes it harder to follow-up.
>
> On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury <cyrille.fleury@nxp.com> wrot=
e:
> >
> > Hi Sumit, all
> >
> > Upstream OP-TEE should support registering a dmabuf since a while, give=
n how widely dmabuf is used in Linux for passing buffers around between dev=
ices.
> >
> > Purpose of the new register_tee_shm ioctl is to allow OPTEE to use memo=
ry allocated from the exiting linux dma buffer. We don't need to have secur=
e dma-heap up streamed.
> >
> > You mentioned secure dma-buffer, but secure dma-buffer is a dma-buffer,=
 so the work to be done for secure or "regular" dma buffers by the register=
_tee_shm ioctl is 100% the same.
> >
> > The scope of this ioctl is limited to what existing upstream dma-buffer=
s are:
> >         -> sharing buffers for hardware (DMA) access across multiple de=
vice drivers and subsystems, and for synchronizing asynchronous hardware ac=
cess.
> >        -> It means continuous memory only.
> >
> > So if we reduce the scope of register tee_shm to exiting dma-buffer are=
a, the current patch does the job.
>
> Do you have a corresponding real world use-case supported by upstream
> OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is the one
> supported in OP-TEE upstream but without secure dmabuf heap [1]
> available, the new ioctl can't be exercised.
>
> [1] https://github.com/OP-TEE/optee_test/blob/master/host/xtest/sdp_basic=
.h#L15

OP-TEE has some SDP test taht can exercice SDP: 'xtest regression_1014'.
https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/regression_1000=
.c#L1256

The test relies on old staged ION + local secure dmabuf heaps no more
maintained, so this test is currently not functional.
If we upgrade the test to mainline dmabuf alloc means, and apply the
change discussed here, we should be able to regularly test SDP in
OP-TEE project CI.
The part to update is the userland allocation of the dmabuf:
https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/sdp_basic.c#L91

br,
etienne


>
> -Sumit
>
> >
> > Regards.
> >
> > -----Original Message-----
> > From: Sumit Garg <sumit.garg@linaro.org>
> > Sent: Wednesday, February 1, 2023 6:34 AM
> > To: Olivier Masse <olivier.masse@nxp.com>
> > Cc: fredgc@google.com; linux-media@vger.kernel.org; linaro-mm-sig@lists=
.linaro.org; afd@ti.com; op-tee@lists.trustedfirmware.org; jens.wiklander@l=
inaro.org; joakim.bech@linaro.org; sumit.semwal@linaro.org; Peter Griffin <=
peter.griffin@linaro.org>; linux-kernel@vger.kernel.org; etienne.carriere@l=
inaro.org; dri-devel@lists.freedesktop.org; christian.koenig@amd.com; Cl=C3=
=A9ment Faure <clement.faure@nxp.com>; Cyrille Fleury <cyrille.fleury@nxp.c=
om>
> > Subject: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm =
from a dmabuf file descriptor
> >
> > Caution: EXT Email
> >
> > Hi Olivier,
> >
> > On Fri, 27 Jan 2023 at 16:24, Olivier Masse <olivier.masse@nxp.com> wro=
te:
> > >
> > > Hi Joakim,
> > > Hi Etienne,
> > >
> > > Let me bring back this pull request for OPTEE Linux driver.
> > >
> > > Last feedback was from Christian K=C3=B6nig and Sumit Garg.
> > > From Christian:
> > > > Just two comments:
> > > >
> > > > 1. Dmitry is working on a change which renames some functions and
> > > > makes it mandatory to call them with the dma_resv lock held.
> > > >
> > > > Depending on how you want to upstream this change you will certainl=
y
> > > > run into conflicts with that.
> > >
> > > Is there any update on these changes ?
> > >
> > > >
> > > > 2. Would it be possible to do this dynamically? In other words does
> > > > the tee driver has a concept of buffers moving around?
> > >
> > > We do not support dynamic secure memory heap.
> > >
> > > From Sumit:
> > > > What limits you to extend this feature to non-contiguous memory
> > > > buffers? I believe that should be possible with OP-TEE dynamic
> > > > shared memory which gives you the granularity to register a list of=
 pages.
> > >
> > > Our solution use a fixed protected reserved memory region and do not
> > > rely on a dynamic protection managed in secure.
> > >
> > > The scope of this implementation rely on a static memory region
> > > handled by a specific DMA Heap type.
> > >
> >
> > AFAIR, the last review for v2 is here [1]. So we need to have this secu=
re DMA heap upstream in order for ioctl added by this patch to be usable.
> >
> > [1] https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.trustedfirmware.org%2Farchives%2Flist%2Fop-tee%40lists.trustedfirmwa=
re.org%2Fmessage%2FM3WLO7RNG22OR4744BY6XNG2GLIYMNHN%2F&data=3D05%7C01%7Ccyr=
ille.fleury%40nxp.com%7Cb24461a4e7284314dff408db0415f23e%7C686ea1d3bc2b4c6f=
a92cd99c5c301635%7C0%7C0%7C638108264533221384%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&sdata=3D6pRAqnMlJ0TX000YmlgTkPKn411VBC%2Bj29O9KhJjJOg%3D&reserved=3D0
> >
> > -Sumit
> >
> > > Best regards,
> > > Olivier MASSE
> > >
> > >
> > > On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
> > > > From: Etienne Carriere <etienne.carriere@linaro.org>
> > > >
> > > > This change allows userland to create a tee_shm object that refers
> > > > to a dmabuf reference.
> > > >
> > > > Userland provides a dmabuf file descriptor as buffer reference.
> > > > The created tee_shm object exported as a brand new dmabuf reference
> > > > used to provide a clean fd to userland. Userland shall closed this
> > > > new fd to release the tee_shm object resources. The initial dmabuf
> > > > resources are tracked independently through original dmabuf file
> > > > descriptor.
> > > >
> > > > Once the buffer is registered and until it is released, TEE driver
> > > > keeps a refcount on the registered dmabuf structure.
> > > >
> > > > This change only support dmabuf references that relates to
> > > > physically contiguous memory buffers.
> > > >
> > > > New tee_shm flag to identify tee_shm objects built from a registere=
d
> > > > dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged
> > > > with TEE_SHM_EXT_DMA_BUF.
> > > >
> > > > Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > From:
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgi
> > > > thub.com%2Flinaro-swg%2Flinux.git&data=3D05%7C01%7Ccyrille.fleury%4=
0nx
> > > > p.com%7Cb24461a4e7284314dff408db0415f23e%7C686ea1d3bc2b4c6fa92cd99c=
5
> > > > c301635%7C0%7C0%7C638108264533221384%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
o
> > > > iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7
> > > > C%7C%7C&sdata=3D8jbFPaF%2B5JBed4Uvo1hsJiB%2BP71KUgJmnW%2BIi3zLfok%3=
D&r
> > > > eserved=3D0 (cherry picked from commit
> > > > 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> > > > ---
> > > >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> > > >  drivers/tee/tee_shm.c    | 99
> > > > +++++++++++++++++++++++++++++++++++++++-
> > > >  include/linux/tee_drv.h  | 11 +++++  include/uapi/linux/tee.h | 29
> > > > ++++++++++++
> > > >  4 files changed, 175 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c index
> > > > 8aa1a4836b92..7c45cbf85eb9 100644
> > > > --- a/drivers/tee/tee_core.c
> > > > +++ b/drivers/tee/tee_core.c
> > > > @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx=
,
> > > >       return ret;
> > > >  }
> > > >
> > > > +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > > > +                                  struct
> > > > tee_ioctl_shm_register_fd_data __user *udata)
> > > > +{
> > > > +     struct tee_ioctl_shm_register_fd_data data;
> > > > +     struct tee_shm *shm;
> > > > +     long ret;
> > > > +
> > > > +     if (copy_from_user(&data, udata, sizeof(data)))
> > > > +             return -EFAULT;
> > > > +
> > > > +     /* Currently no input flags are supported */
> > > > +     if (data.flags)
> > > > +             return -EINVAL;
> > > > +
> > > > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > > > +     if (IS_ERR(shm))
> > > > +             return -EINVAL;
> > > > +
> > > > +     data.id =3D shm->id;
> > > > +     data.flags =3D shm->flags;
> > > > +     data.size =3D shm->size;
> > > > +
> > > > +     if (copy_to_user(udata, &data, sizeof(data)))
> > > > +             ret =3D -EFAULT;
> > > > +     else
> > > > +             ret =3D tee_shm_get_fd(shm);
> > > > +
> > > > +     /*
> > > > +      * When user space closes the file descriptor the shared memo=
ry
> > > > +      * should be freed or if tee_shm_get_fd() failed then it will
> > > > +      * be freed immediately.
> > > > +      */
> > > > +     tee_shm_put(shm);
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  static int params_from_user(struct tee_context *ctx, struct
> > > > tee_param *params,
> > > >                           size_t num_params,
> > > >                           struct tee_ioctl_param __user *uparams) @=
@
> > > > -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned
> > > > int cmd, unsigned long arg)
> > > >               return tee_ioctl_shm_alloc(ctx, uarg);
> > > >       case TEE_IOC_SHM_REGISTER:
> > > >               return tee_ioctl_shm_register(ctx, uarg);
> > > > +     case TEE_IOC_SHM_REGISTER_FD:
> > > > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> > > >       case TEE_IOC_OPEN_SESSION:
> > > >               return tee_ioctl_open_session(ctx, uarg);
> > > >       case TEE_IOC_INVOKE:
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c index
> > > > 836872467dc6..55a3fbbb022e 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -4,6 +4,7 @@
> > > >   */
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > > +#include <linux/dma-buf.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/mm.h>
> > > >  #include <linux/sched.h>
> > > > @@ -12,6 +13,14 @@
> > > >  #include <linux/uio.h>
> > > >  #include "tee_private.h"
> > > >
> > > > +/* extra references appended to shm object for registered shared
> > > > memory */
> > > > +struct tee_shm_dmabuf_ref {
> > > > +     struct tee_shm shm;
> > > > +     struct dma_buf *dmabuf;
> > > > +     struct dma_buf_attachment *attach;
> > > > +     struct sg_table *sgt;
> > > > +};
> > > > +
> > > >  static void shm_put_kernel_pages(struct page **pages, size_t
> > > > page_count)
> > > >  {
> > > >       size_t n;
> > > > @@ -71,7 +80,16 @@ static void release_registered_pages(struct
> > > > tee_shm *shm)
> > > >
> > > >  static void tee_shm_release(struct tee_device *teedev, struct
> > > > tee_shm *shm)  {
> > > > -     if (shm->flags & TEE_SHM_POOL) {
> > > > +     if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> > > > +             struct tee_shm_dmabuf_ref *ref;
> > > > +
> > > > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref,
> > > > shm);
> > > > +             dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > > > +                                      DMA_BIDIRECTIONAL);
> > > > +
> > > > +             dma_buf_detach(ref->dmabuf, ref->attach);
> > > > +             dma_buf_put(ref->dmabuf);
> > > > +     } else if (shm->flags & TEE_SHM_POOL) {
> > > >               teedev->pool->ops->free(teedev->pool, shm);
> > > >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> > > >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx=
,
> > > > shm);
> > > > @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct
> > > > tee_context *ctx, size_t size)
> > > >   * tee_client_invoke_func(). The memory allocated is later freed
> > > > with a
> > > >   * call to tee_shm_free().
> > > >   *
> > > > - * @returns a pointer to 'struct tee_shm'
> > > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR
> > > > + on
> > > > failure
> > > >   */
> > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx,
> > > > size_t size)  { @@ -229,6 +247,83 @@ struct tee_shm
> > > > *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)  }
> > > > EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > > >
> > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > > > +fd) {
> > > > +     struct tee_shm_dmabuf_ref *ref;
> > > > +     int rc;
> > > > +
> > > > +     if (!tee_device_get(ctx->teedev))
> > > > +             return ERR_PTR(-EINVAL);
> > > > +
> > > > +     teedev_ctx_get(ctx);
> > > > +
> > > > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > > > +     if (!ref) {
> > > > +             rc =3D -ENOMEM;
> > > > +             goto err_put_tee;
> > > > +     }
> > > > +
> > > > +     refcount_set(&ref->shm.refcount, 1);
> > > > +     ref->shm.ctx =3D ctx;
> > > > +     ref->shm.id =3D -1;
> > > > +
> > > > +     ref->dmabuf =3D dma_buf_get(fd);
> > > > +     if (IS_ERR(ref->dmabuf)) {
> > > > +             rc =3D PTR_ERR(ref->dmabuf);
> > > > +             goto err_put_dmabuf;
> > > > +     }
> > > > +
> > > > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx-
> > > > >teedev->dev);
> > > > +     if (IS_ERR(ref->attach)) {
> > > > +             rc =3D PTR_ERR(ref->attach);
> > > > +             goto err_detach;
> > > > +     }
> > > > +
> > > > +     ref->sgt =3D dma_buf_map_attachment(ref->attach,
> > > > DMA_BIDIRECTIONAL);
> > > > +     if (IS_ERR(ref->sgt)) {
> > > > +             rc =3D PTR_ERR(ref->sgt);
> > > > +             goto err_unmap_attachement;
> > > > +     }
> > > > +
> > > > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > > > +             rc =3D PTR_ERR(ref->sgt->sgl);
> > > > +             goto err_unmap_attachement;
> > > > +     }
> > > > +
> > > > +     ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> > > > +     ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> > > > +     ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> > > > +
> > > > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > > > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->s=
hm,
> > > > +                             1, 0, GFP_KERNEL);
> > > > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > > > +     if (ref->shm.id < 0) {
> > > > +             rc =3D ref->shm.id;
> > > > +             goto err_idr_remove;
> > > > +     }
> > > > +
> > > > +     return &ref->shm;
> > > > +
> > > > +err_idr_remove:
> > > > +     mutex_lock(&ctx->teedev->mutex);
> > > > +     idr_remove(&ctx->teedev->idr, ref->shm.id);
> > > > +     mutex_unlock(&ctx->teedev->mutex);
> > > > +err_unmap_attachement:
> > > > +     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > > > DMA_BIDIRECTIONAL);
> > > > +err_detach:
> > > > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > > > +err_put_dmabuf:
> > > > +     dma_buf_put(ref->dmabuf);
> > > > +     kfree(ref);
> > > > +err_put_tee:
> > > > +     teedev_ctx_put(ctx);
> > > > +     tee_device_put(ctx->teedev);
> > > > +
> > > > +     return ERR_PTR(rc);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > > > +
> > > >  static struct tee_shm *
> > > >  register_shm_helper(struct tee_context *ctx, unsigned long addr,
> > > >                   size_t length, u32 flags, int id) diff --git
> > > > a/include/linux/tee_drv.h b/include/linux/tee_drv.h index
> > > > 911cad324acc..40ddd5376c2d 100644
> > > > --- a/include/linux/tee_drv.h
> > > > +++ b/include/linux/tee_drv.h
> > > > @@ -25,6 +25,7 @@
> > > >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user spac=
e
> > > > */
> > > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool
> > > > */
> > > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driv=
er
> > > > */
> > > > +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf
> > > > handle */
> > > >
> > > >  struct device;
> > > >  struct tee_device;
> > > > @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struc=
t
> > > > tee_context *ctx, size_t size);  struct tee_shm
> > > > *tee_shm_register_kernel_buf(struct tee_context *ctx,
> > > >                                           void *addr, size_t
> > > > length);
> > > >
> > > > +/**
> > > > + * tee_shm_register_fd() - Register shared memory from file
> > > > descriptor
> > > > + *
> > > > + * @ctx:     Context that allocates the shared memory
> > > > + * @fd:              Shared memory file descriptor reference
> > > > + *
> > > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR
> > > > + on
> > > > failure
> > > > + */
> > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int
> > > > fd);
> > > > +
> > > >  /**
> > > >   * tee_shm_is_dynamic() - Check if shared memory object is of the
> > > > dynamic kind
> > > >   * @shm:     Shared memory handle
> > > > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > > > index 25a6c534beb1..baf3cd7cfdac 100644
> > > > --- a/include/uapi/linux/tee.h
> > > > +++ b/include/uapi/linux/tee.h
> > > > @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> > > >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1=
,
> > > > \
> > > >                                    struct tee_ioctl_shm_alloc_data)
> > > >
> > > > +/**
> > > > + * struct tee_ioctl_shm_register_fd_data - Shared memory
> > > > +registering
> > > > argument
> > > > + * @fd:              [in] File descriptor identifying the shared
> > > > memory
> > > > + * @size:    [out] Size of shared memory to allocate
> > > > + * @flags:   [in] Flags to/from allocation.
> > > > + * @id:              [out] Identifier of the shared memory
> > > > + *
> > > > + * The flags field should currently be zero as input. Updated by
> > > > + the
> > > > call
> > > > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > > > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD
> > > > below.
> > > > + */
> > > > +struct tee_ioctl_shm_register_fd_data {
> > > > +     __s64 fd;
> > > > +     __u64 size;
> > > > +     __u32 flags;
> > > > +     __s32 id;
> > > > +} __attribute__ ((aligned (8)));
> > > > +
> > > > +/**
> > > > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file
> > > > descriptor
> > > > + *
> > > > + * Returns a file descriptor on success or < 0 on failure
> > > > + *
> > > > + * The returned file descriptor refers to the shared memory object
> > > > in kernel
> > > > + * land. The shared memory is freed when the descriptor is closed.
> > > > + */
> > > > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC,
> > > > TEE_IOC_BASE + 8, \
> > > > +                                  struct
> > > > tee_ioctl_shm_register_fd_data)
> > > > +
> > > >  /**
> > > >   * struct tee_ioctl_buf_data - Variable sized buffer
> > > >   * @buf_ptr: [in] A __user pointer to a buffer
