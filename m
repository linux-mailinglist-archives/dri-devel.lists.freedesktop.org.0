Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566076F387
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 21:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5716410E19D;
	Thu,  3 Aug 2023 19:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E1D10E210
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 19:39:05 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so178443566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1691091544; x=1691696344;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vVOBVduElgri36E1u/H2UuiePhRABHZhPushWIL49t0=;
 b=SQLEp9WctijXwAs3Dfuszg8AqjC+FlPALMmsqx+t/EOME/rF03A0+Hya53d9Sggp77
 7Sqc42/kxMkTD3BUE4/k+TP3h+x4OcJxsSKTu5S7uGhjJtUuAdoILWnJWjautb+XSUNJ
 kFjyHuihB6+kYBMMhgAn3kg/Ay4X0sDrOhQ7B7bntGDgHsdqEWEaHieMLtJ3MocMhxLV
 NlZh0ZoI85yd/HrPY8QpSljDMDJ4J2zERnAksSdonA0P0PusqsP3x8ZpfJx0N4rKkktA
 ypg1y1WAqgXBmBQC2v0Z0gZcJMaRlafHfGdpuNNzxip7zaiy8FMyr09BA9Cv4tu7u+oC
 nVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691091544; x=1691696344;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vVOBVduElgri36E1u/H2UuiePhRABHZhPushWIL49t0=;
 b=ReFx84SdhpS443xzzaIIZ/QJX47P6QSO4EGbUhRiFR6Rm6Z+O5pc2jBl2R6i30a7PP
 Rv0TL9L+kHkYnH0NEScR5lovUnSx/Q8ZmHDFzQIhcl6YtX3RqBTYUd/Dv9VMsHEwGHRq
 h2XmxUrZMflr3XwQBiZrEJzHrtG7wSJ4XlJbvDcB+rpkvMcJDx5MqKaonVrgldkgsipu
 LNXfMALKQM/KCC7c0nYbUfErdRsWCQYGpnG6qt0SHeC2zcZaZsTiuYwozaIX38CHuY/z
 0+Cbgsx4ZrVWjaFHqUeOLI/XFa1UAyVcxiVBxlqt8xtUE+Ui685md5vX5Zylq2YJ2UYp
 ESbA==
X-Gm-Message-State: ABy/qLYxuZsJPaFN4aot5doA6VfGQf1WDTC92zU45rxitkAe+mNiv+S1
 0e4j8XsrwSg+RHcCg2br4ekLY5EI3OqQDo+KUiGe7ChSpYQvBznS
X-Google-Smtp-Source: APBJJlHZdjQQfBYN1ccl6I1JhZBFLLkWK/s/+Rj/gOH8GtRCYEreyRjJHa/qPVc/vIRYSomOpDs8Q07YOx20qfH51cM=
X-Received: by 2002:a17:906:cc52:b0:977:95f4:5cca with SMTP id
 mm18-20020a170906cc5200b0097795f45ccamr7302109ejb.54.1691091543798; Thu, 03
 Aug 2023 12:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230803193240.137555-1-airlied@gmail.com>
In-Reply-To: <20230803193240.137555-1-airlied@gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Thu, 3 Aug 2023 14:38:51 -0500
Message-ID: <CAOFGe94k4typC0wmVCpCXmnx_A=722KQD2CdYQubcALHEWn-zg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fixup the uapi header file.
To: Dave Airlie <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c04f81060209eef0"
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

--000000000000c04f81060209eef0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 2:33=E2=80=AFPM Dave Airlie <airlied@gmail.com> wrot=
e:

> From: Dave Airlie <airlied@redhat.com>
>
> nouveau > 10 years ago had a plan for new multiplexer inside a multiplexe=
r
> API using nvif. It never fully reached fruition, fast forward 10 years,
> and the new vulkan driver is avoiding libdrm and calling ioctls, and
> these 3 ioctls, getparam, channel alloc + free don't seem to be things
> we'd want to use nvif for.
>
> Undeprecate and put them into the uapi header so we can just copy it
> into mesa later.
>
> v2: use uapi types.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
>

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>


> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 ---------------------
>  include/uapi/drm/nouveau_drm.h          | 48 +++++++++++++++++++++++--
>  2 files changed, 45 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> index 27eae85f33e6..d5d80d0d9011 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -43,28 +43,6 @@ int  nouveau_abi16_usif(struct drm_file *, void *data,
> u32 size);
>  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
>
> -struct drm_nouveau_channel_alloc {
> -       uint32_t     fb_ctxdma_handle;
> -       uint32_t     tt_ctxdma_handle;
> -
> -       int          channel;
> -       uint32_t     pushbuf_domains;
> -
> -       /* Notifier memory */
> -       uint32_t     notifier_handle;
> -
> -       /* DRM-enforced subchannel assignments */
> -       struct {
> -               uint32_t handle;
> -               uint32_t grclass;
> -       } subchan[8];
> -       uint32_t nr_subchan;
> -};
> -
> -struct drm_nouveau_channel_free {
> -       int channel;
> -};
> -
>  struct drm_nouveau_grobj_alloc {
>         int      channel;
>         uint32_t handle;
> @@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {
>         uint32_t handle;
>  };
>
> -#define NOUVEAU_GETPARAM_PCI_VENDOR      3
> -#define NOUVEAU_GETPARAM_PCI_DEVICE      4
> -#define NOUVEAU_GETPARAM_BUS_TYPE        5
> -#define NOUVEAU_GETPARAM_FB_SIZE         8
> -#define NOUVEAU_GETPARAM_AGP_SIZE        9
> -#define NOUVEAU_GETPARAM_CHIPSET_ID      11
> -#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
> -#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
> -#define NOUVEAU_GETPARAM_PTIMER_TIME     14
> -#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> -#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> -struct drm_nouveau_getparam {
> -       uint64_t param;
> -       uint64_t value;
> -};
> -
>  struct drm_nouveau_setparam {
>         uint64_t param;
>         uint64_t value;
>  };
>
> -#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>  #define DRM_IOCTL_NOUVEAU_SETPARAM           DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +
> DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>  #define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC        DRM_IOW (DRM_COMMAND_BASE +
> DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
>  #define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC  DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
>  #define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE        DRM_IOW (DRM_COMMAND_BASE +
> DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
> diff --git a/include/uapi/drm/nouveau_drm.h
> b/include/uapi/drm/nouveau_drm.h
> index 853a327433d3..ca917e55b38f 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -33,6 +33,44 @@
>  extern "C" {
>  #endif
>
> +#define NOUVEAU_GETPARAM_PCI_VENDOR      3
> +#define NOUVEAU_GETPARAM_PCI_DEVICE      4
> +#define NOUVEAU_GETPARAM_BUS_TYPE        5
> +#define NOUVEAU_GETPARAM_FB_SIZE         8
> +#define NOUVEAU_GETPARAM_AGP_SIZE        9
> +#define NOUVEAU_GETPARAM_CHIPSET_ID      11
> +#define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
> +#define NOUVEAU_GETPARAM_GRAPH_UNITS     13
> +#define NOUVEAU_GETPARAM_PTIMER_TIME     14
> +#define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> +#define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> +struct drm_nouveau_getparam {
> +       __u64 param;
> +       __u64 value;
> +};
> +
> +struct drm_nouveau_channel_alloc {
> +       __u32     fb_ctxdma_handle;
> +       __u32     tt_ctxdma_handle;
> +
> +       __s32     channel;
> +       __u32     pushbuf_domains;
> +
> +       /* Notifier memory */
> +       __u32     notifier_handle;
> +
> +       /* DRM-enforced subchannel assignments */
> +       struct {
> +               __u32 handle;
> +               __u32 grclass;
> +       } subchan[8];
> +       __u32 nr_subchan;
> +};
> +
> +struct drm_nouveau_channel_free {
> +       __s32 channel;
> +};
> +
>  #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
>  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
> @@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {
>         __u32 handle;
>  };
>
> -#define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
> +#define DRM_NOUVEAU_GETPARAM           0x00
>  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> -#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> -#define DRM_NOUVEAU_CHANNEL_FREE       0x03 /* deprecated */
> +#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> +#define DRM_NOUVEAU_CHANNEL_FREE       0x03
>  #define DRM_NOUVEAU_GROBJ_ALLOC        0x04 /* deprecated */
>  #define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05 /* deprecated */
>  #define DRM_NOUVEAU_GPUOBJ_FREE        0x06 /* deprecated */
> @@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {
>  #define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM               (1UL << 31)
>
>
> +#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +
> DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +
>  #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>  #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE +
> DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
>
> --
> 2.41.0
>
>

--000000000000c04f81060209eef0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Aug 3, 2023 at 2:33=E2=80=AFPM Dave Airlie &lt;<a href=3D"ma=
ilto:airlied@gmail.com">airlied@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Dave Airlie &lt;<a href=3D"m=
ailto:airlied@redhat.com" target=3D"_blank">airlied@redhat.com</a>&gt;<br>
<br>
nouveau &gt; 10 years ago had a plan for new multiplexer inside a multiplex=
er<br>
API using nvif. It never fully reached fruition, fast forward 10 years,<br>
and the new vulkan driver is avoiding libdrm and calling ioctls, and<br>
these 3 ioctls, getparam, channel alloc + free don&#39;t seem to be things<=
br>
we&#39;d want to use nvif for.<br>
<br>
Undeprecate and put them into the uapi header so we can just copy it<br>
into mesa later.<br>
<br>
v2: use uapi types.<br>
<br>
Signed-off-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=
=3D"_blank">airlied@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Faith Ekstrand &lt;<a href=3D"mailto:faith.ekstrand@collabora.=
com">faith.ekstrand@collabora.com</a>&gt;<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.h | 41 ---------------------<br=
>
=C2=A0include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 48=
 +++++++++++++++++++++++--<br>
=C2=A02 files changed, 45 insertions(+), 44 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouv=
eau/nouveau_abi16.h<br>
index 27eae85f33e6..d5d80d0d9011 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h<br>
@@ -43,28 +43,6 @@ int=C2=A0 nouveau_abi16_usif(struct drm_file *, void *da=
ta, u32 size);<br>
=C2=A0#define NOUVEAU_GEM_DOMAIN_VRAM=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br=
>
=C2=A0#define NOUVEAU_GEM_DOMAIN_GART=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 2)<br=
>
<br>
-struct drm_nouveau_channel_alloc {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0fb_ctxdma_handle;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0tt_ctxdma_handle;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 channel;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0pushbuf_domains;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Notifier memory */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0notifier_handle;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* DRM-enforced subchannel assignments */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handle;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t grclass;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} subchan[8];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t nr_subchan;<br>
-};<br>
-<br>
-struct drm_nouveau_channel_free {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int channel;<br>
-};<br>
-<br>
=C2=A0struct drm_nouveau_grobj_alloc {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 channel;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t handle;<br>
@@ -83,31 +61,12 @@ struct drm_nouveau_gpuobj_free {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t handle;<br>
=C2=A0};<br>
<br>
-#define NOUVEAU_GETPARAM_PCI_VENDOR=C2=A0 =C2=A0 =C2=A0 3<br>
-#define NOUVEAU_GETPARAM_PCI_DEVICE=C2=A0 =C2=A0 =C2=A0 4<br>
-#define NOUVEAU_GETPARAM_BUS_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
-#define NOUVEAU_GETPARAM_FB_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
-#define NOUVEAU_GETPARAM_AGP_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
-#define NOUVEAU_GETPARAM_CHIPSET_ID=C2=A0 =C2=A0 =C2=A0 11<br>
-#define NOUVEAU_GETPARAM_VM_VRAM_BASE=C2=A0 =C2=A0 12<br>
-#define NOUVEAU_GETPARAM_GRAPH_UNITS=C2=A0 =C2=A0 =C2=A013<br>
-#define NOUVEAU_GETPARAM_PTIMER_TIME=C2=A0 =C2=A0 =C2=A014<br>
-#define NOUVEAU_GETPARAM_HAS_BO_USAGE=C2=A0 =C2=A0 15<br>
-#define NOUVEAU_GETPARAM_HAS_PAGEFLIP=C2=A0 =C2=A0 16<br>
-struct drm_nouveau_getparam {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t param;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t value;<br>
-};<br>
-<br>
=C2=A0struct drm_nouveau_setparam {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t param;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t value;<br>
=C2=A0};<br>
<br>
-#define DRM_IOCTL_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_get=
param)<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_SETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SETPARAM, struct drm_nouveau_=
setparam)<br>
-#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 DRM_IOWR(DRM_C=
OMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)<=
br>
-#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOW (=
DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_fre=
e)<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_a=
lloc)<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC=C2=A0 DRM_IOWR(DRM_COMMAN=
D_BASE + DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_allo=
c)<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_=
free)<br>
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.=
h<br>
index 853a327433d3..ca917e55b38f 100644<br>
--- a/include/uapi/drm/nouveau_drm.h<br>
+++ b/include/uapi/drm/nouveau_drm.h<br>
@@ -33,6 +33,44 @@<br>
=C2=A0extern &quot;C&quot; {<br>
=C2=A0#endif<br>
<br>
+#define NOUVEAU_GETPARAM_PCI_VENDOR=C2=A0 =C2=A0 =C2=A0 3<br>
+#define NOUVEAU_GETPARAM_PCI_DEVICE=C2=A0 =C2=A0 =C2=A0 4<br>
+#define NOUVEAU_GETPARAM_BUS_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
+#define NOUVEAU_GETPARAM_FB_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
+#define NOUVEAU_GETPARAM_AGP_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
+#define NOUVEAU_GETPARAM_CHIPSET_ID=C2=A0 =C2=A0 =C2=A0 11<br>
+#define NOUVEAU_GETPARAM_VM_VRAM_BASE=C2=A0 =C2=A0 12<br>
+#define NOUVEAU_GETPARAM_GRAPH_UNITS=C2=A0 =C2=A0 =C2=A013<br>
+#define NOUVEAU_GETPARAM_PTIMER_TIME=C2=A0 =C2=A0 =C2=A014<br>
+#define NOUVEAU_GETPARAM_HAS_BO_USAGE=C2=A0 =C2=A0 15<br>
+#define NOUVEAU_GETPARAM_HAS_PAGEFLIP=C2=A0 =C2=A0 16<br>
+struct drm_nouveau_getparam {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 param;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 value;<br>
+};<br>
+<br>
+struct drm_nouveau_channel_alloc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0fb_ctxdma_handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0tt_ctxdma_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__s32=C2=A0 =C2=A0 =C2=A0channel;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0pushbuf_domains;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Notifier memory */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0notifier_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* DRM-enforced subchannel assignments */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 grclass;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} subchan[8];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 nr_subchan;<br>
+};<br>
+<br>
+struct drm_nouveau_channel_free {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__s32 channel;<br>
+};<br>
+<br>
=C2=A0#define NOUVEAU_GEM_DOMAIN_CPU=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
0)<br>
=C2=A0#define NOUVEAU_GEM_DOMAIN_VRAM=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br=
>
=C2=A0#define NOUVEAU_GEM_DOMAIN_GART=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 2)<br=
>
@@ -126,10 +164,10 @@ struct drm_nouveau_gem_cpu_fini {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 handle;<br>
=C2=A0};<br>
<br>
-#define DRM_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00 =
/* deprecated */<br>
+#define DRM_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00<=
br>
=C2=A0#define DRM_NOUVEAU_SETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x01 /* deprecated */<br>
-#define DRM_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 0x02 /* deprecated *=
/<br>
-#define DRM_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A00x03 /* depreca=
ted */<br>
+#define DRM_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 0x02<br>
+#define DRM_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A00x03<br>
=C2=A0#define DRM_NOUVEAU_GROBJ_ALLOC=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04 /* de=
precated */<br>
=C2=A0#define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC=C2=A0 0x05 /* deprecated */<br>
=C2=A0#define DRM_NOUVEAU_GPUOBJ_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x06 /* de=
precated */<br>
@@ -188,6 +226,10 @@ struct drm_nouveau_svm_bind {<br>
=C2=A0#define NOUVEAU_SVM_BIND_TARGET__GPU_VRAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(1UL &lt;&lt; 31)<br>
<br>
<br>
+#define DRM_IOCTL_NOUVEAU_GETPARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_get=
param)<br>
+#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC=C2=A0 =C2=A0 =C2=A0 DRM_IOWR(DRM_C=
OMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)<=
br>
+#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOW (=
DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_fre=
e)<br>
+<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_SVM_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_=
svm_init)<br>
=C2=A0#define DRM_IOCTL_NOUVEAU_SVM_BIND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_=
svm_bind)<br>
<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--000000000000c04f81060209eef0--
