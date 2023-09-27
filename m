Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA47B0C3F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 20:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9ED10E599;
	Wed, 27 Sep 2023 18:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A307010E599
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 18:54:15 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35137ab766dso25735ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695840855; x=1696445655;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgknUwnq9gIV+tvRlScN3zfltL029CTlXmtn1qWfZ48=;
 b=luFebkUn9YTt3oDr6YHP9z5hoD2umM3lqI0A5tcOeuXft2/+RrjYIoRnyROKGf+OWU
 zQxYYjGzx1LXHi5hkEaeWA6jqGodK+IOvlvsjOj+F3TyeJ9cqa92UoUJjuqzcvjL6K/J
 xwrVy6j6zLCAkQFeMAK7XD0DXQfWHqrJObK7+nV8Zt+VexEsvg4O7wvG8bTYi+wQWz4b
 JmzAD1HtPwKbqaVLw3ISWgnLRP9iQRn6GmQGxBuTFhAhzmPRKDKx6uOcafuHOxUK5Yo1
 oNB7083rwmJRR28UWGUP2LGPeJHTZhry6NRVSH3xkZHKxUSqYU7kavKiUM7RQ8uHG0oB
 Nh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695840855; x=1696445655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgknUwnq9gIV+tvRlScN3zfltL029CTlXmtn1qWfZ48=;
 b=bkhFRYzkiyc4ux568Y2hhiRFOr8Kzn8+gRVIDN8m0qnlEsL7YZxzZrWdT55wxgh/Cm
 uXX72qIJ+K8nU+LdoDLykw9xh56e+sk2Zi4YVfKJNJcrJlJinEZxFPXc0qKkFd5KvWdG
 djh8548hA7fB3s2trZj10nCdqL6ZgXuqYvPqef8Jt/pJGLqNLN4aahdh4PD0b6/ILecu
 4RIzGe+LOXoc8MhC0BoRrHMfD+Nw9UpczOumhrzARv1JmHGmNC6uRHhEauRF3Vz6qiJx
 veStnnjlAe2qPa9o/H2vhE0CMsAB52xC+zubrgEE+vqHkQX2o2lU44HhboK2tiQrSoqz
 CLmQ==
X-Gm-Message-State: AOJu0Yz2Aez733Yhdl042VlGIbuw09hF2KdN0DR/bHImjnCH6r84LiTL
 C5nHcBxNAAHKXQ6Qufwp6D00sPyRwaqcRESj8RoB
X-Google-Smtp-Source: AGHT+IGFTNOeIjY0z4z1jsppqGQ/+DkN5LKNzVhtRpc1fe/Zjm0L6bfMROX9KjJp8peSFpnQgwJTEYqVV/8DUuyxQQM=
X-Received: by 2002:a92:c242:0:b0:34d:ff4c:5e3a with SMTP id
 k2-20020a92c242000000b0034dff4c5e3amr748810ilo.10.1695840854718; Wed, 27 Sep
 2023 11:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
 <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
 <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com>
 <a4ecc2792f3a4d3159e34415be984ff7d5f5e263.camel@mediatek.com>
 <20230927134614.kp27moxdw72jiu4y@pop-os.localdomain>
In-Reply-To: <20230927134614.kp27moxdw72jiu4y@pop-os.localdomain>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 27 Sep 2023 11:54:03 -0700
Message-ID: <CA+ddPcNDOsd4+1a3W5ufA-FaCc801bKkA-OapNKOC8snXrntAw@mail.gmail.com>
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
To: Joakim Bech <joakim.bech@linaro.org>
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 6:46=E2=80=AFAM Joakim Bech <joakim.bech@linaro.org=
> wrote:
>
> On Mon, Sep 25, 2023 at 12:49:50PM +0000, Yong Wu (=E5=90=B4=E5=8B=87) wr=
ote:
> > On Tue, 2023-09-12 at 11:32 +0200, AngeloGioacchino Del Regno wrote:
> > > Il 12/09/23 08:17, Yong Wu (=E5=90=B4=E5=8B=87) ha scritto:
> > > > On Mon, 2023-09-11 at 11:29 +0200, AngeloGioacchino Del Regno
> > > > wrote:
> > > > > Il 11/09/23 04:30, Yong Wu ha scritto:
> > > > > > The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't
> > > > > > work
> > > > > > here since this is not a platform driver, therefore initialise
> > > > > > the
> > > > > > TEE
> > > > > > context/session while we allocate the first secure buffer.
> > > > > >
> > > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > > ---
> > > > > >    drivers/dma-buf/heaps/mtk_secure_heap.c | 61
> > > > > > +++++++++++++++++++++++++
> > > > > >    1 file changed, 61 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c
> > > > > > b/drivers/dma-
> > > > > > buf/heaps/mtk_secure_heap.c
> > > > > > index bbf1c8dce23e..e3da33a3d083 100644
> > > > > > --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> > > > > > +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> > > > > > @@ -10,6 +10,12 @@
> > > > > >    #include <linux/err.h>
> > > > > >    #include <linux/module.h>
> > > > > >    #include <linux/slab.h>
> > > > > > +#include <linux/tee_drv.h>
> > > > > > +#include <linux/uuid.h>
> > > > > > +
> > > > > > +#define TZ_TA_MEM_UUID               "4477588a-8476-11e2-ad15-
> > > > > > e41f1390d676"
> > > > > > +
> > > > >
> > > > > Is this UUID the same for all SoCs and all TZ versions?
> > > >
> > > > Yes. It is the same for all SoCs and all TZ versions currently.
> > > >
> > >
> > > That's good news!
> > >
> > > Is this UUID used in any userspace component? (example: Android
> > > HALs?)
> >
> > No. Userspace never use it. If userspace would like to allocate this
> > secure buffer, it can achieve through the existing dmabuf IOCTL via
> > /dev/dma_heap/mtk_svp node.
> >
> In general I think as mentioned elsewhere in comments, that there isn't
> that much here that seems to be unique for MediaTek in this patch
> series, so I think it worth to see whether this whole patch set can be
> made more generic. Having said that, the UUID is always unique for a
> certain Trusted Application. So, it's not entirely true saying that the
> UUID is the same for all SoCs and all TrustZone versions. It might be
> true for a family of MediaTek devices and the TEE in use, but not
> generically.
>
> So, if we need to differentiate between different TA implementations,
> then we need different UUIDs. If it would be possible to make this patch
> set generic, then it sounds like a single UUID would be sufficient, but
> that would imply that all TA's supporting such a generic UUID would be
> implemented the same from an API point of view. Which also means that
> for example Trusted Application function ID's needs to be the same etc.
> Not impossible to achieve, but still not easy (different TEE follows
> different specifications) and it's not typically something we've done in
> the past.
>
> Unfortunately there is no standardized database of TA's describing what
> they implement and support.
>
> As an alternative, we could implement a query call in the TEE answering,
> "What UUID does your TA have that implements secure unmapped heap?".
> I.e., something that reminds of a lookup table. Then we wouldn't have to
> carry this in UAPI, DT or anywhere else.
>

I think that's a good idea. If we add kernel APIs to the tee for
opening a session for secure memory allocation and for performing the
allocation, then the UUID, TA commands and TA parameters can all be
decided upon in the TEE specific driver and the code in dma-heap
becomes generic.

> --
> // Regards
> Joakim
>
> >
> > > If it is (and I somehow expect that it is), then this definition
> > > should go
> > > to a UAPI header, as suggested by Christian.
> > >
> > > Cheers!
> > >
> > > > >
> > > > > Thanks,
> > > > > Angelo
> > > > >
> > > > >
> > > > > > +#define MTK_TEE_PARAM_NUM            4
> > > > > >
> > > > > >    /*
> > > > > >     * MediaTek secure (chunk) memory type
> > > > > > @@ -28,17 +34,72 @@ struct mtk_secure_heap_buffer {
> > > > > >    struct mtk_secure_heap {
> > > > > >       const char              *name;
> > > > > >       const enum kree_mem_type mem_type;
> > > > > > +     u32                      mem_session;
> > > > > > +     struct tee_context      *tee_ctx;
> > > > > >    };
> > > > > >
> > > > > > +static int mtk_optee_ctx_match(struct tee_ioctl_version_data
> > > > > > *ver,
> > > > > > const void *data)
> > > > > > +{
> > > > > > +     return ver->impl_id =3D=3D TEE_IMPL_ID_OPTEE;
> > > > > > +}
> > > > > > +
> > > > > > +static int mtk_kree_secure_session_init(struct mtk_secure_heap
> > > > > > *sec_heap)
> > > > > > +{
> > > > > > +     struct tee_param t_param[MTK_TEE_PARAM_NUM] =3D {0};
> > > > > > +     struct tee_ioctl_open_session_arg arg =3D {0};
> > > > > > +     uuid_t ta_mem_uuid;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     sec_heap->tee_ctx =3D tee_client_open_context(NULL,
> > > > > > mtk_optee_ctx_match,
> > > > > > +                                                 NULL,
> > > > > > NULL);
> > > > > > +     if (IS_ERR(sec_heap->tee_ctx)) {
> > > > > > +             pr_err("%s: open context failed, ret=3D%ld\n",
> > > > > > sec_heap-
> > > > > > > name,
> > > > > >
> > > > > > +                    PTR_ERR(sec_heap->tee_ctx));
> > > > > > +             return -ENODEV;
> > > > > > +     }
> > > > > > +
> > > > > > +     arg.num_params =3D MTK_TEE_PARAM_NUM;
> > > > > > +     arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> > > > > > +     ret =3D uuid_parse(TZ_TA_MEM_UUID, &ta_mem_uuid);
> > > > > > +     if (ret)
> > > > > > +             goto close_context;
> > > > > > +     memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
> > > > > > +
> > > > > > +     ret =3D tee_client_open_session(sec_heap->tee_ctx, &arg,
> > > > > > t_param);
> > > > > > +     if (ret < 0 || arg.ret) {
> > > > > > +             pr_err("%s: open session failed, ret=3D%d:%d\n",
> > > > > > +                    sec_heap->name, ret, arg.ret);
> > > > > > +             ret =3D -EINVAL;
> > > > > > +             goto close_context;
> > > > > > +     }
> > > > > > +     sec_heap->mem_session =3D arg.session;
> > > > > > +     return 0;
> > > > > > +
> > > > > > +close_context:
> > > > > > +     tee_client_close_context(sec_heap->tee_ctx);
> > > > > > +     return ret;
> > > > > > +}
> > > > > > +
> > > > > >    static struct dma_buf *
> > > > > >    mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
> > > > > >                     unsigned long fd_flags, unsigned long
> > > > > > heap_flags)
> > > > > >    {
> > > > > > +     struct mtk_secure_heap *sec_heap =3D
> > > > > > dma_heap_get_drvdata(heap);
> > > > > >       struct mtk_secure_heap_buffer *sec_buf;
> > > > > >       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > > > > >       struct dma_buf *dmabuf;
> > > > > >       int ret;
> > > > > >
> > > > > > +     /*
> > > > > > +      * TEE probe may be late. Initialise the secure session
> > > > > > in the
> > > > > > first
> > > > > > +      * allocating secure buffer.
> > > > > > +      */
> > > > > > +     if (!sec_heap->mem_session) {
> > > > > > +             ret =3D mtk_kree_secure_session_init(sec_heap);
> > > > > > +             if (ret)
> > > > > > +                     return ERR_PTR(ret);
> > > > > > +     }
> > > > > > +
> > > > > >       sec_buf =3D kzalloc(sizeof(*sec_buf), GFP_KERNEL);
> > > > > >       if (!sec_buf)
> > > > > >               return ERR_PTR(-ENOMEM);
> > > > >
> > > > >
> > >
> > >
