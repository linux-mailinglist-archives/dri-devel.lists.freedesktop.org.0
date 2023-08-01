Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF176B94E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 18:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382D10E0FC;
	Tue,  1 Aug 2023 16:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98A610E0FC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690905866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2xvxAjTZTVFuohtIYJxPv7bAPL31i5GsKzilxWZ+d9Q=;
 b=YHmT5C/QgQLUKQhx6K+Dc3UYVvCLRNKJANWGD9xiCb3LVBVTq5YOs+8cFhYW1RbwiyZXb6
 RcesK8DvJHtC0OGCH/pf0KbHvR6kwggsXyoDcmlyqJvJ4pUl3SVyji/JsRD0U8pOoYC0B1
 M+/NwT7mVT7rPf7gSM8nUoNVBks8uOw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-viq64c9kPkKZ5co4cithHg-1; Tue, 01 Aug 2023 12:04:25 -0400
X-MC-Unique: viq64c9kPkKZ5co4cithHg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b9b7375e49so11120361fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 09:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690905864; x=1691510664;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2xvxAjTZTVFuohtIYJxPv7bAPL31i5GsKzilxWZ+d9Q=;
 b=W6IvW7fY1AT9sSE7g5MyHbXkA9iIKjCrON3QoBZPGJpuoBp4Uuyxui8NGlywTb2Vu8
 +GXY5OyrHS0nIqJAcGdqcAutXW1RBa2F8FM90/3RarZrW3T2sZaMIYPN2AFCnDyBhhY8
 JDRemcREjBAjXyrIrPQxSBTcKSecu+AGoXDr/8NfsTedhQvFejTO77oEr9MjKfXvN1bv
 Fxg4lRtuFlLjCfPSq+1GzHrdKlCIVZG0zyPQbaPKrPD0FNs+kKNdiqKWdcsEnMJKgfpF
 guwaZxawLs0d/2fTGlflT94V17Bdu45ZCC2kCYavteJ2sQRk61sYQW4ERLLAZ8PYRgQb
 v/Og==
X-Gm-Message-State: ABy/qLYL3kdvresZr9iVEfR9b/lAWzmgPMXvAMm5uBYn+iKbtDfop5s3
 29ncfoURCaiFRMsADsYxoO1ZyV0XQ3KrWUVUCvxm3gV8DPMgHoRnrG8SBwbjlcpacGjQdsHxOjP
 3OyfziGUMgpV8ELEL9Qfqj6oi3dSUwrBZPZAdznbMfNu8
X-Received: by 2002:a2e:b54b:0:b0:2b9:7034:9bbe with SMTP id
 a11-20020a2eb54b000000b002b970349bbemr5308830ljn.4.1690905863806; 
 Tue, 01 Aug 2023 09:04:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEEMaBoarKbBDTM6yLIZdPpavLk/2T8UHs7ooJEOSP5S5OlRnvxTK6DE4Gt1dKtIWTVW5mCYzcRKUZV2OiKrd0=
X-Received: by 2002:a2e:b54b:0:b0:2b9:7034:9bbe with SMTP id
 a11-20020a2eb54b000000b002b970349bbemr5308818ljn.4.1690905863478; Tue, 01 Aug
 2023 09:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230731191557.4179175-1-airlied@gmail.com>
 <CACO55tuV8A_sLmQ=7yBdmsW7WWGoMs1oLmfszUg+RHW4_P8sNQ@mail.gmail.com>
 <CAOFGe94=eT9JUqtdrWb42pRybZ9E5TP2P144eT=pBXu+V2HUyA@mail.gmail.com>
In-Reply-To: <CAOFGe94=eT9JUqtdrWb42pRybZ9E5TP2P144eT=pBXu+V2HUyA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Aug 2023 18:04:11 +0200
Message-ID: <CACO55tt=jn+1JUyb14bZGQ4nc3E+yXP8dcEhpOJ7a-8pxqYspQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fixup the uapi header file.
To: Faith Ekstrand <faith@gfxstrand.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005772150601deb34e"
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
Cc: nouveau@lists.freedesktop.org, skeggsb@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005772150601deb34e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 5:15=E2=80=AFPM Faith Ekstrand <faith@gfxstrand.net>=
 wrote:

> On Tue, Aug 1, 2023 at 4:37=E2=80=AFAM Karol Herbst <kherbst@redhat.com> =
wrote:
>
>> On Mon, Jul 31, 2023 at 9:16=E2=80=AFPM Dave Airlie <airlied@gmail.com> =
wrote:
>> >
>> > From: Dave Airlie <airlied@redhat.com>
>> >
>> > nouveau > 10 years ago had a plan for new multiplexer inside a
>> multiplexer
>> > API using nvif. It never fully reached fruition, fast forward 10 years=
,
>> > and the new vulkan driver is avoiding libdrm and calling ioctls, and
>> > these 3 ioctls, getparam, channel alloc + free don't seem to be things
>> > we'd want to use nvif for.
>> >
>> > Undeprecate and put them into the uapi header so we can just copy it
>> > into mesa later.
>> >
>> > Signed-off-by: Dave Airlie <airlied@redhat.com>
>> > ---
>> >  drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 ---------------------
>> >  include/uapi/drm/nouveau_drm.h          | 48 +++++++++++++++++++++++-=
-
>> >  2 files changed, 45 insertions(+), 44 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> b/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> > index 27eae85f33e6..d5d80d0d9011 100644
>> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> > @@ -43,28 +43,6 @@ int  nouveau_abi16_usif(struct drm_file *, void
>> *data, u32 size);
>> >  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>> >  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
>> >
>> > -struct drm_nouveau_channel_alloc {
>> > -       uint32_t     fb_ctxdma_handle;
>> > -       uint32_t     tt_ctxdma_handle;
>> > -
>> > -       int          channel;
>> > -       uint32_t     pushbuf_domains;
>> > -
>> > -       /* Notifier memory */
>> > -       uint32_t     notifier_handle;
>> > -
>> > -       /* DRM-enforced subchannel assignments */
>> > -       struct {
>> > -               uint32_t handle;
>> > -               uint32_t grclass;
>> > -       } subchan[8];
>> > -       uint32_t nr_subchan;
>> > -};
>> > -
>> > -struct drm_nouveau_channel_free {
>> > -       int channel;
>> > -};
>> > -
>> >  struct drm_nouveau_grobj_alloc {
>> >         int      channel;
>> >         uint32_t handle;
>> > @@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {
>> >         uint32_t handle;
>> >  };
>> >
>> > -#define NOUVEAU_GETPARAM_PCI_VENDOR      3
>> > -#define NOUVEAU_GETPARAM_PCI_DEVICE      4
>> > -#define NOUVEAU_GETPARAM_BUS_TYPE        5
>> > -#define NOUVEAU_GETPARAM_FB_SIZE         8
>> > -#define NOUVEAU_GETPARAM_AGP_SIZE        9
>> > -#define NOUVEAU_GETPARAM_CHIPSET_ID      11
>> > -#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
>> > -#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
>> > -#define NOUVEAU_GETPARAM_PTIMER_TIME     14
>> > -#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
>> > -#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
>> > -struct drm_nouveau_getparam {
>> > -       uint64_t param;
>> > -       uint64_t value;
>> > -};
>> > -
>> >  struct drm_nouveau_setparam {
>> >         uint64_t param;
>> >         uint64_t value;
>> >  };
>> >
>> > -#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>> >  #define DRM_IOCTL_NOUVEAU_SETPARAM           DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
>> > -#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
>> > -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>> >  #define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC        DRM_IOW (DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
>> >  #define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC  DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
>> >  #define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE        DRM_IOW (DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
>> > diff --git a/include/uapi/drm/nouveau_drm.h
>> b/include/uapi/drm/nouveau_drm.h
>> > index 853a327433d3..1cd97b3d8eda 100644
>> > --- a/include/uapi/drm/nouveau_drm.h
>> > +++ b/include/uapi/drm/nouveau_drm.h
>> > @@ -33,6 +33,44 @@
>> >  extern "C" {
>> >  #endif
>> >
>> > +#define NOUVEAU_GETPARAM_PCI_VENDOR      3
>> > +#define NOUVEAU_GETPARAM_PCI_DEVICE      4
>> > +#define NOUVEAU_GETPARAM_BUS_TYPE        5
>> > +#define NOUVEAU_GETPARAM_FB_SIZE         8
>> > +#define NOUVEAU_GETPARAM_AGP_SIZE        9
>> > +#define NOUVEAU_GETPARAM_CHIPSET_ID      11
>> > +#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
>> > +#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
>> > +#define NOUVEAU_GETPARAM_PTIMER_TIME     14
>> > +#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
>> > +#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
>> > +struct drm_nouveau_getparam {
>> > +       uint64_t param;
>> > +       uint64_t value;
>> > +};
>> > +
>> > +struct drm_nouveau_channel_alloc {
>> > +       uint32_t     fb_ctxdma_handle;
>>
>
> Do we want to use `uint32_t` or `__u32` here? It looks like the original
> headers used `uint32_t` and then it got switched to `__u32` after the
> deprecation happened.  We probably want `__u32` given that this is a uapi
> header.
>
>
>> > +       uint32_t     tt_ctxdma_handle;
>> > +
>> > +       int          channel;
>>
>
> IDK what to do about this one. I want to make it __s32. I think that
> should be safe on all the hardware we care about. Having an unsized type =
in
> a UAPI header is concerning.
>
>
Do we have any architectures we care about where `int` isn't `__s32`? I
think on all 32/64 bit x86, ppc and arm it's that way and I don't think we
care about anything else?



> ~Faith
>
>
>> > +       uint32_t     pushbuf_domains;
>> > +
>> > +       /* Notifier memory */
>> > +       uint32_t     notifier_handle;
>> > +
>> > +       /* DRM-enforced subchannel assignments */
>> > +       struct {
>> > +               uint32_t handle;
>> > +               uint32_t grclass;
>> > +       } subchan[8];
>> > +       uint32_t nr_subchan;
>> > +};
>> > +
>> > +struct drm_nouveau_channel_free {
>> > +       int channel;
>> > +};
>> > +
>> >  #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
>> >  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>> >  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
>> > @@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {
>> >         __u32 handle;
>> >  };
>> >
>> > -#define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>> > +#define DRM_NOUVEAU_GETPARAM           0x00
>> >  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>> > -#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>> > -#define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
>> > +#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
>> > +#define DRM_NOUVEAU_CHANNEL_FREE       0x03
>> >  #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
>> >  #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
>> >  #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
>> > @@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {
>> >  #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM               (1UL << 31)
>> >
>> >
>> > +#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>> > +#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
>> > +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>> > +
>> >  #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>> >  #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BAS=
E
>> + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
>> >
>> > --
>> > 2.41.0
>> >
>>
>> Reviewed-by: Karol Herbst <kherbst@redhat.com>
>>
>>

--0000000000005772150601deb34e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif"><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 1, 2023 at 5:15=E2=80=AFPM=
 Faith Ekstrand &lt;<a href=3D"mailto:faith@gfxstrand.net">faith@gfxstrand.=
net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Aug 1, 2023 at 4:37=E2=80=AFAM Karol Herbst &lt;<a href=
=3D"mailto:kherbst@redhat.com" target=3D"_blank">kherbst@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
Jul 31, 2023 at 9:16=E2=80=AFPM Dave Airlie &lt;<a href=3D"mailto:airlied@g=
mail.com" target=3D"_blank">airlied@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=3D"=
_blank">airlied@redhat.com</a>&gt;<br>
&gt;<br>
&gt; nouveau &gt; 10 years ago had a plan for new multiplexer inside a mult=
iplexer<br>
&gt; API using nvif. It never fully reached fruition, fast forward 10 years=
,<br>
&gt; and the new vulkan driver is avoiding libdrm and calling ioctls, and<b=
r>
&gt; these 3 ioctls, getparam, channel alloc + free don&#39;t seem to be th=
ings<br>
&gt; we&#39;d want to use nvif for.<br>
&gt;<br>
&gt; Undeprecate and put them into the uapi header so we can just copy it<b=
r>
&gt; into mesa later.<br>
&gt;<br>
&gt; Signed-off-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" t=
arget=3D"_blank">airlied@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 -------------------=
--<br>
&gt;=C2=A0 include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 48 +++++++++++++++++++++++--<br>
&gt;=C2=A0 2 files changed, 45 insertions(+), 44 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm=
/nouveau/nouveau_abi16.h<br>
&gt; index 27eae85f33e6..d5d80d0d9011 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h<br>
&gt; @@ -43,28 +43,6 @@ int=C2=A0 nouveau_abi16_usif(struct drm_file *, voi=
d *data, u32 size);<br>
&gt;=C2=A0 #define NOUVEAU_GEM_DOMAIN_VRAM=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; =
1)<br>
&gt;=C2=A0 #define NOUVEAU_GEM_DOMAIN_GART=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; =
2)<br>
&gt;<br>
&gt; -struct drm_nouveau_channel_alloc {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0fb_ctxdma_hand=
le;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0tt_ctxdma_hand=
le;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chan=
nel;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0pushbuf_domain=
s;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Notifier memory */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0notifier_handl=
e;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* DRM-enforced subchannel assignments */<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handl=
e;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t grcla=
ss;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} subchan[8];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t nr_subchan;<br>
&gt; -};<br>
&gt; -<br>
&gt; -struct drm_nouveau_channel_free {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int channel;<br>
&gt; -};<br>
&gt; -<br>
&gt;=C2=A0 struct drm_nouveau_grobj_alloc {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 channel;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handle;<br>
&gt; @@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handle;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -#define NOUVEAU_GETPARAM_PCI_VENDOR=C2=A0 =C2=A0 =C2=A0 3<br>
&gt; -#define NOUVEAU_GETPARAM_PCI_DEVICE=C2=A0 =C2=A0 =C2=A0 4<br>
&gt; -#define NOUVEAU_GETPARAM_BUS_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
&gt; -#define NOUVEAU_GETPARAM_FB_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<b=
r>
&gt; -#define NOUVEAU_GETPARAM_AGP_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
&gt; -#define NOUVEAU_GETPARAM_CHIPSET_ID=C2=A0 =C2=A0 =C2=A0 11<br>
&gt; -#define NOUVEAU_GETPARAM_VM_VRAM_BASE=C2=A0 =C2=A0 12<br>
&gt; -#define NOUVEAU_GETPARAM_GRAPH_UNITS=C2=A0 =C2=A0 =C2=A013<br>
&gt; -#define NOUVEAU_GETPARAM_PTIMER_TIME=C2=A0 =C2=A0 =C2=A014<br>
&gt; -#define NOUVEAU_GETPARAM_HAS_BO_USAGE=C2=A0 =C2=A0 15<br>
&gt; -#define NOUVEAU_GETPARAM_HAS_PAGEFLIP=C2=A0 =C2=A0 16<br>
&gt; -struct drm_nouveau_getparam {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t param;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t value;<br>
&gt; -};<br>
&gt; -<br>
&gt;=C2=A0 struct drm_nouveau_setparam {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t param;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t value;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -#define DRM_IOCTL_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_=
getparam)<br>
&gt;=C2=A0 #define DRM_IOCTL_NOUVEAU_SETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SETPARAM, struct drm_n=
ouveau_setparam)<br>
&gt; -#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 DRM_IOWR(=
DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_al=
loc)<br>
&gt; -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_=
IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channe=
l_free)<br>
&gt;=C2=A0 #define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_gr=
obj_alloc)<br>
&gt;=C2=A0 #define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC=C2=A0 DRM_IOWR(DRM_C=
OMMAND_BASE + DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj=
_alloc)<br>
&gt;=C2=A0 #define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gp=
uobj_free)<br>
&gt; diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau=
_drm.h<br>
&gt; index 853a327433d3..1cd97b3d8eda 100644<br>
&gt; --- a/include/uapi/drm/nouveau_drm.h<br>
&gt; +++ b/include/uapi/drm/nouveau_drm.h<br>
&gt; @@ -33,6 +33,44 @@<br>
&gt;=C2=A0 extern &quot;C&quot; {<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; +#define NOUVEAU_GETPARAM_PCI_VENDOR=C2=A0 =C2=A0 =C2=A0 3<br>
&gt; +#define NOUVEAU_GETPARAM_PCI_DEVICE=C2=A0 =C2=A0 =C2=A0 4<br>
&gt; +#define NOUVEAU_GETPARAM_BUS_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
&gt; +#define NOUVEAU_GETPARAM_FB_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<b=
r>
&gt; +#define NOUVEAU_GETPARAM_AGP_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
&gt; +#define NOUVEAU_GETPARAM_CHIPSET_ID=C2=A0 =C2=A0 =C2=A0 11<br>
&gt; +#define NOUVEAU_GETPARAM_VM_VRAM_BASE=C2=A0 =C2=A0 12<br>
&gt; +#define NOUVEAU_GETPARAM_GRAPH_UNITS=C2=A0 =C2=A0 =C2=A013<br>
&gt; +#define NOUVEAU_GETPARAM_PTIMER_TIME=C2=A0 =C2=A0 =C2=A014<br>
&gt; +#define NOUVEAU_GETPARAM_HAS_BO_USAGE=C2=A0 =C2=A0 15<br>
&gt; +#define NOUVEAU_GETPARAM_HAS_PAGEFLIP=C2=A0 =C2=A0 16<br>
&gt; +struct drm_nouveau_getparam {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t param;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t value;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_nouveau_channel_alloc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0fb_ctxdma_hand=
le;<br></blockquote><div><br></div><div>Do we want to use `uint32_t` or `__=
u32` here? It looks like the original headers used `uint32_t` and then it g=
ot switched to `__u32` after the deprecation happened.=C2=A0 We probably wa=
nt `__u32` given that this is a uapi header.<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0tt_ctxdma_hand=
le;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chan=
nel;<br></blockquote><div><br></div><div>IDK what to do about this one. I w=
ant to make it __s32. I think that should be safe on all the hardware we ca=
re about. Having an unsized type in a UAPI header is concerning.</div><div>=
<br></div></div></div></blockquote><div><br></div><div><div style=3D"font-f=
amily:arial,sans-serif" class=3D"gmail_default">Do we have any architecture=
s we care about where `int` isn&#39;t `__s32`? I think on all 32/64 bit x86=
, ppc and arm it&#39;s that way and I don&#39;t think we care about anythin=
g else?<br></div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><=
div>~Faith<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0pushbuf_domain=
s;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Notifier memory */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0notifier_handl=
e;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* DRM-enforced subchannel assignments */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handl=
e;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t grcla=
ss;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} subchan[8];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t nr_subchan;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_nouveau_channel_free {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int channel;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 #define NOUVEAU_GEM_DOMAIN_CPU=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;=
&lt; 0)<br>
&gt;=C2=A0 #define NOUVEAU_GEM_DOMAIN_VRAM=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; =
1)<br>
&gt;=C2=A0 #define NOUVEAU_GEM_DOMAIN_GART=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; =
2)<br>
&gt; @@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -#define DRM_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x00 /* deprecated */<br>
&gt; +#define DRM_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x00<br>
&gt;=C2=A0 #define DRM_NOUVEAU_SETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x01 /* deprecated */<br>
&gt; -#define DRM_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 0x02 /* depreca=
ted */<br>
&gt; -#define DRM_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A00x03 /* de=
precated */<br>
&gt; +#define DRM_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 0x02<br>
&gt; +#define DRM_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A00x03<br>
&gt;=C2=A0 #define DRM_NOUVEAU_GROBJ_ALLOC=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04 =
/* deprecated */<br>
&gt;=C2=A0 #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC=C2=A0 0x05 /* deprecated *=
/<br>
&gt;=C2=A0 #define DRM_NOUVEAU_GPUOBJ_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x06 =
/* deprecated */<br>
&gt; @@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {<br>
&gt;=C2=A0 #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1UL &lt;&lt; 31)<br>
&gt;<br>
&gt;<br>
&gt; +#define DRM_IOCTL_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_=
getparam)<br>
&gt; +#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 DRM_IOWR(=
DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_al=
loc)<br>
&gt; +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_=
IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channe=
l_free)<br>
&gt; +<br>
&gt;=C2=A0 #define DRM_IOCTL_NOUVEAU_SVM_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_n=
ouveau_svm_init)<br>
&gt;=C2=A0 #define DRM_IOCTL_NOUVEAU_SVM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_n=
ouveau_svm_bind)<br>
&gt;<br>
&gt; --<br>
&gt; 2.41.0<br>
&gt;<br>
<br>
Reviewed-by: Karol Herbst &lt;<a href=3D"mailto:kherbst@redhat.com" target=
=3D"_blank">kherbst@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000005772150601deb34e--

