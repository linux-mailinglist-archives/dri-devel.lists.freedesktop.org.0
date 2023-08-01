Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E1976B850
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 17:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04A110E40B;
	Tue,  1 Aug 2023 15:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A68F10E40B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 15:15:36 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so649637566b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1690902935; x=1691507735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D2fr4llh8QF9+8/MYj5l2qMqH1e+8yQ19n/WF18BWRk=;
 b=maLWNPX/e6luVIOwWin8TSV2gJDc7ItyW2tO0bSezp02Cp/RHPDQpkjp4MFmKdQ/aQ
 fadeR5hfo1l9BPDY1WzmTFXVpUadxp2J7vIfvJ+h82Ua7R8QiadPed8pDK/K6C1gpa7Z
 vvmxtrHWlliGpEiMGy/Gm3EfbF6jlay6NdiBYipiOLZKU/M9m+qa14eN3sJ29U6zd6La
 BLJmjRhbrnIwTRGmlLXGP5Hct0LkLKbBH/kCvJzSn/vcPYZODdJJFpq3Y8UA2fXjxOgq
 6ObvKM2iYrnXPsUUeALHfkBGW9fiYjYqGyzxORbqJWL4FWSBBLO5t0CWVpQf9k1qYPLs
 cAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690902935; x=1691507735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2fr4llh8QF9+8/MYj5l2qMqH1e+8yQ19n/WF18BWRk=;
 b=K+o227GveRMRv5rM/3QU6tk2CCzW5MnDj4zRPSGlTOskMIR0+IfxPqZ4LVZFHR0g9Q
 /OVJv0awqbg323ry32tcwMIicHn1L8gN6MYpJ+91ZpvKV+Qcev93rJ302eczCKGNBT2M
 GdMvYwGF3CUqISDPdGnDnWIJU4PeINh0bJW6ZCnuSVhOn3nCbeeWi3f3qH7YsrnFpJhL
 W4b3ZYfyRmP3OMErF41fBlnnWBfncGgA135+z2EkNUz4gpLkZ1YrZq1QFLmCKP7mbBNz
 z9rz5316nyk0ErErKBOjvGrjkpl1QXACgcE6MI028Wq5ntZggM3/zvfTcpcovukq0Fgw
 a/5Q==
X-Gm-Message-State: ABy/qLaDW250ACsztaic9kYaUzwHKETFTPJhf+vBkpLjTwedUDNzbPWe
 Iz6mD+Hah5vGLabhHOGX6kJ3u3ZYSCQdLxlBMp/Eaw==
X-Google-Smtp-Source: APBJJlE7uox+xSmDrq7sgSGUbkfxmKUkIyPdPNtrWz7hPSia2WgVxQ7934XsxXUZd9LO3/OHZdBBm42C3Xsi0ZjCHSs=
X-Received: by 2002:a17:906:648e:b0:99b:493b:63b1 with SMTP id
 e14-20020a170906648e00b0099b493b63b1mr3058156ejm.38.1690902934778; Tue, 01
 Aug 2023 08:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230731191557.4179175-1-airlied@gmail.com>
 <CACO55tuV8A_sLmQ=7yBdmsW7WWGoMs1oLmfszUg+RHW4_P8sNQ@mail.gmail.com>
In-Reply-To: <CACO55tuV8A_sLmQ=7yBdmsW7WWGoMs1oLmfszUg+RHW4_P8sNQ@mail.gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Tue, 1 Aug 2023 10:15:23 -0500
Message-ID: <CAOFGe94=eT9JUqtdrWb42pRybZ9E5TP2P144eT=pBXu+V2HUyA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fixup the uapi header file.
To: Karol Herbst <kherbst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c7092f0601de04ec"
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

--000000000000c7092f0601de04ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 4:37=E2=80=AFAM Karol Herbst <kherbst@redhat.com> wr=
ote:

> On Mon, Jul 31, 2023 at 9:16=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > From: Dave Airlie <airlied@redhat.com>
> >
> > nouveau > 10 years ago had a plan for new multiplexer inside a
> multiplexer
> > API using nvif. It never fully reached fruition, fast forward 10 years,
> > and the new vulkan driver is avoiding libdrm and calling ioctls, and
> > these 3 ioctls, getparam, channel alloc + free don't seem to be things
> > we'd want to use nvif for.
> >
> > Undeprecate and put them into the uapi header so we can just copy it
> > into mesa later.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 ---------------------
> >  include/uapi/drm/nouveau_drm.h          | 48 +++++++++++++++++++++++--
> >  2 files changed, 45 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > index 27eae85f33e6..d5d80d0d9011 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > @@ -43,28 +43,6 @@ int  nouveau_abi16_usif(struct drm_file *, void
> *data, u32 size);
> >  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
> >  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
> >
> > -struct drm_nouveau_channel_alloc {
> > -       uint32_t     fb_ctxdma_handle;
> > -       uint32_t     tt_ctxdma_handle;
> > -
> > -       int          channel;
> > -       uint32_t     pushbuf_domains;
> > -
> > -       /* Notifier memory */
> > -       uint32_t     notifier_handle;
> > -
> > -       /* DRM-enforced subchannel assignments */
> > -       struct {
> > -               uint32_t handle;
> > -               uint32_t grclass;
> > -       } subchan[8];
> > -       uint32_t nr_subchan;
> > -};
> > -
> > -struct drm_nouveau_channel_free {
> > -       int channel;
> > -};
> > -
> >  struct drm_nouveau_grobj_alloc {
> >         int      channel;
> >         uint32_t handle;
> > @@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {
> >         uint32_t handle;
> >  };
> >
> > -#define NOUVEAU_GETPARAM_PCI_VENDOR      3
> > -#define NOUVEAU_GETPARAM_PCI_DEVICE      4
> > -#define NOUVEAU_GETPARAM_BUS_TYPE        5
> > -#define NOUVEAU_GETPARAM_FB_SIZE         8
> > -#define NOUVEAU_GETPARAM_AGP_SIZE        9
> > -#define NOUVEAU_GETPARAM_CHIPSET_ID      11
> > -#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
> > -#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
> > -#define NOUVEAU_GETPARAM_PTIMER_TIME     14
> > -#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> > -#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> > -struct drm_nouveau_getparam {
> > -       uint64_t param;
> > -       uint64_t value;
> > -};
> > -
> >  struct drm_nouveau_setparam {
> >         uint64_t param;
> >         uint64_t value;
> >  };
> >
> > -#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
> >  #define DRM_IOCTL_NOUVEAU_SETPARAM           DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
> > -#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> > -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE
> + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> >  #define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC        DRM_IOW (DRM_COMMAND_BASE
> + DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
> >  #define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC  DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
> >  #define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE        DRM_IOW (DRM_COMMAND_BASE
> + DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
> > diff --git a/include/uapi/drm/nouveau_drm.h
> b/include/uapi/drm/nouveau_drm.h
> > index 853a327433d3..1cd97b3d8eda 100644
> > --- a/include/uapi/drm/nouveau_drm.h
> > +++ b/include/uapi/drm/nouveau_drm.h
> > @@ -33,6 +33,44 @@
> >  extern "C" {
> >  #endif
> >
> > +#define NOUVEAU_GETPARAM_PCI_VENDOR      3
> > +#define NOUVEAU_GETPARAM_PCI_DEVICE      4
> > +#define NOUVEAU_GETPARAM_BUS_TYPE        5
> > +#define NOUVEAU_GETPARAM_FB_SIZE         8
> > +#define NOUVEAU_GETPARAM_AGP_SIZE        9
> > +#define NOUVEAU_GETPARAM_CHIPSET_ID      11
> > +#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
> > +#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
> > +#define NOUVEAU_GETPARAM_PTIMER_TIME     14
> > +#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> > +#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> > +struct drm_nouveau_getparam {
> > +       uint64_t param;
> > +       uint64_t value;
> > +};
> > +
> > +struct drm_nouveau_channel_alloc {
> > +       uint32_t     fb_ctxdma_handle;
>

Do we want to use `uint32_t` or `__u32` here? It looks like the original
headers used `uint32_t` and then it got switched to `__u32` after the
deprecation happened.  We probably want `__u32` given that this is a uapi
header.


> > +       uint32_t     tt_ctxdma_handle;
> > +
> > +       int          channel;
>

IDK what to do about this one. I want to make it __s32. I think that should
be safe on all the hardware we care about. Having an unsized type in a UAPI
header is concerning.

~Faith


> > +       uint32_t     pushbuf_domains;
> > +
> > +       /* Notifier memory */
> > +       uint32_t     notifier_handle;
> > +
> > +       /* DRM-enforced subchannel assignments */
> > +       struct {
> > +               uint32_t handle;
> > +               uint32_t grclass;
> > +       } subchan[8];
> > +       uint32_t nr_subchan;
> > +};
> > +
> > +struct drm_nouveau_channel_free {
> > +       int channel;
> > +};
> > +
> >  #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
> >  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
> >  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
> > @@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {
> >         __u32 handle;
> >  };
> >
> > -#define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
> > +#define DRM_NOUVEAU_GETPARAM           0x00
> >  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> > -#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> > -#define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
> > +#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> > +#define DRM_NOUVEAU_CHANNEL_FREE       0x03
> >  #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
> >  #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
> >  #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
> > @@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {
> >  #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM               (1UL << 31)
> >
> >
> > +#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
> > +#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> > +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE
> + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> > +
> >  #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
> >  #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE
> + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
> >
> > --
> > 2.41.0
> >
>
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
>
>

--000000000000c7092f0601de04ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Aug 1, 2023 at 4:37=E2=80=AFAM Karol Herbst &lt;<a href=3D"m=
ailto:kherbst@redhat.com">kherbst@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Mon, Jul 31, 2023 at 9:16=E2=
=80=AFPM Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_bl=
ank">airlied@gmail.com</a>&gt; wrote:<br>
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
<br></div><div>~Faith<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
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

--000000000000c7092f0601de04ec--
