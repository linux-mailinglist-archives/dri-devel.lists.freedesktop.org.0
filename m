Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430D6E5513
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 01:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8307B10E638;
	Mon, 17 Apr 2023 23:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0997C10E638
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 23:17:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506b2a08877so559319a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 16:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681773451; x=1684365451;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o4l096Mraw7O1+4wBxJFTR6i3Az8WhMI1Ule/XuVLk4=;
 b=HljNTBlLnuv9h9YpPs83Q4p/Qib/cmO6nlTs6GL5/XnNv+7BHOd3qWODlXiOxZgQBJ
 dz3ef/Q8ECN8Ah/mtFZgsDwWF2qkJ1TsdGiqKMvtfieI4XQRPZ9CPxNG/NTww+QHlTHw
 gEL6GFxL5SvOChghrM2h/tYA8vcKXuNjnKckALk/oHhQwVdCkjMT+T8rtaZudLtqzqQd
 3KmJeJqnPAeTxkT24iloLboiRqyef8bw6/PzPUbzdfFxfIM4684jA3sz9veR/UQhZ+s9
 jPnY7mmtbO6ftbLzcPzZqmq3MR4GKrAlkxpJ7dG3Fhh3jce3FE5cPEhDfYs+XyVGEN78
 gjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681773451; x=1684365451;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4l096Mraw7O1+4wBxJFTR6i3Az8WhMI1Ule/XuVLk4=;
 b=g/mV6be45atdSdnAbrsC4RHc2Kag5Cu9DgyUp/hUR/cbSWSv6DA9F4NgNJM0oH0cxC
 paD3jI2PdYmxeblfUhJstPL/y+92QzlJ2A5VX5qi7xAfrBqUtJUg45Zcgrur7Mtr4Fdb
 9ypM/B5SBXLVJkrJ4dFF5s+Wur3wQ1/3uoClRSWUSJC9ucLlBkFsqjo4bwhEA0IuB410
 4T5xwbjBYIr5Rtf4P2/yGHIPtoarPkLeqK4PZrSsVrSgOOyfyn35C1vjmNvFxLSAk5gT
 q95SJqBO3oc6UYSWLfQxxsZTw8I7Y+/QRV0++OSks0EOwDTpZUyx+7PTvL98IMmhpSAg
 7iiQ==
X-Gm-Message-State: AAQBX9fJqSERL4EJsa/H6DZT65E8E8eNiKeUiZFAPwYhtjRY9rC/DBgc
 EibVeCKVgvexL77jqOyGXKdfhQb8kK9Zbxy0dmVkew==
X-Google-Smtp-Source: AKy350YzECnfgAJnvX2nWUR0iyzYEougHYYAIpZI9GYV1xs4syG+RAkk7H3z61N2tPzfGuB+mrOruoRfHJLGYD2RiBU=
X-Received: by 2002:a50:d783:0:b0:504:e957:2926 with SMTP id
 w3-20020a50d783000000b00504e9572926mr290679edi.1.1681773450719; Mon, 17 Apr
 2023 16:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
From: Gurchetan Singh <gurchetansingh@google.com>
Date: Mon, 17 Apr 2023 16:17:19 -0700
Message-ID: <CAAfnVB=5TVKxUmLhNMLMdgAPx7KoSKTsZQtq7Hv36FcP7bmgLA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="00000000000020078a05f99065de"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dominik Behr <dbehr@google.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000020078a05f99065de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 16, 2023 at 4:53=E2=80=AFAM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> We have multiple Vulkan context types that are awaiting for the addition
> of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
>
>  1. Venus context
>  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
>
> Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a
> generic fencing implementation that we want to utilize.
>
> This patch adds initial sync objects support. It creates fundament for a
> further fencing improvements. Later on we will want to extend the
> VirtIO-GPU
> fencing API with passing fence IDs to host for waiting, it will be a new
> additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU
> context
> drivers in works that require VirtIO-GPU to support sync objects UAPI.
>
> The patch is heavily inspired by the sync object UAPI implementation of t=
he
> MSM driver.
>

The changes seem good, but I would recommend getting a full end-to-end
solution (i.e, you've proxied the host fence with these changes and shared
with the host compositor) working first.  You'll never know what you'll
find after completing this exercise.  Or is that the plan already?

Typically, you want to land the uAPI and virtio spec changes last.
Mesa/gfxstream/virglrenderer/crosvm all have the ability to test out
unstable uAPIs ...


>
> Changelog:
>
> v6: - Added zeroing out of syncobj_desc, as was suggested by Emil Velikov=
.
>
>     - Fixed memleak in error code path which was spotted by Emil Velikov.
>
>     - Switched to u32/u64 instead of uint_t. Previously was keeping
>       uint_t style of the virtgpu_ioctl.c, in the end decided to change
>       it because it's not a proper kernel coding style after all.
>
>     - Kept single drm_virtgpu_execbuffer_syncobj struct for both in/out
>       sync objects. There was a little concern about whether it would be
>       worthwhile to have separate in/out descriptors, in practice it's
>       unlikely that we will extend the descs in a foreseeable future.
>       There is no overhead in using same struct since we want to pad it
>       to 64b anyways and it shouldn't be a problem to separate the descs
>       later on if we will want to do that.
>
>     - Added r-b from Emil Velikov.
>
> v5: - Factored out dma-fence unwrap API usage into separate patch as was
>       suggested by Emil Velikov.
>
>     - Improved and documented the job submission reorderings as was
>       requested by Emil Velikov. Sync file FD is now installed after
>       job is submitted to virtio to further optimize reorderings.
>
>     - Added comment for the kvalloc, as was requested by Emil Velikov.
>
>     - The num_in/out_syncobjs now is set only after completed parsing
>       of pre/post deps, as was requested by Emil Velikov.
>
> v4: - Added r-b from Rob Clark to the "refactoring" patch.
>
>     - Replaced for/while(ptr && itr) with if (ptr), like was suggested by
>       Rob Clark.
>
>     - Dropped NOWARN and NORETRY GFP flags and switched syncobj patch
>       to use kvmalloc.
>
>     - Removed unused variables from syncobj patch that were borrowed by
>       accident from another (upcoming) patch after one of git rebases.
>
> v3: - Switched to use dma_fence_unwrap_for_each(), like was suggested by
>       Rob Clark.
>
>     - Fixed missing dma_fence_put() in error code path that was spotted b=
y
>       Rob Clark.
>
>     - Removed obsoleted comment to virtio_gpu_execbuffer_ioctl(), like wa=
s
>       suggested by Rob Clark.
>
> v2: - Fixed chain-fence context matching by making use of
>       dma_fence_chain_contained().
>
>     - Fixed potential uninitialized var usage in error code patch of
>       parse_post_deps(). MSM driver had a similar issue that is fixed
>       already in upstream.
>
>     - Added new patch that refactors job submission code path. I found
>       that it was very difficult to add a new/upcoming host-waits feature
>       because of how variables are passed around the code, the
> virtgpu_ioctl.c
>       also was growing to unmanageable size.
>
> Dmitry Osipenko (3):
>   drm/virtio: Refactor and optimize job submission code path
>   drm/virtio: Wait for each dma-fence of in-fence array individually
>   drm/virtio: Support sync objects
>
>  drivers/gpu/drm/virtio/Makefile         |   2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c    |   3 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 182 --------
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 530 ++++++++++++++++++++++++
>  include/uapi/drm/virtgpu_drm.h          |  16 +-
>  6 files changed, 552 insertions(+), 185 deletions(-)
>  create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c
>
> --
> 2.39.2
>
>

--00000000000020078a05f99065de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 16, 2023 at 4:53=E2=80=AF=
AM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com">dmi=
try.osipenko@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">We have multiple Vulkan context types that are aw=
aiting for the addition<br>
of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:<br>
<br>
=C2=A01. Venus context<br>
=C2=A02. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)<br=
>
<br>
Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a<br=
>
generic fencing implementation that we want to utilize.<br>
<br>
This patch adds initial sync objects support. It creates fundament for a<br=
>
further fencing improvements. Later on we will want to extend the VirtIO-GP=
U<br>
fencing API with passing fence IDs to host for waiting, it will be a new<br=
>
additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU cont=
ext<br>
drivers in works that require VirtIO-GPU to support sync objects UAPI.<br>
<br>
The patch is heavily inspired by the sync object UAPI implementation of the=
<br>
MSM driver.<br></blockquote><div><br></div><div>The changes seem good, but =
I would recommend getting a full end-to-end solution (i.e, you&#39;ve proxi=
ed the host fence with these changes and shared with the host compositor) w=
orking first.=C2=A0 You&#39;ll never know what you&#39;ll find after comple=
ting this exercise.=C2=A0 Or is that the plan already?=C2=A0=C2=A0</div><di=
v><br></div><div>Typically, you want to land the uAPI and virtio spec chang=
es last.=C2=A0 Mesa/gfxstream/virglrenderer/crosvm all have the ability to =
test out unstable uAPIs ...=C2=A0=C2=A0</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Changelog:<br>
<br>
v6: - Added zeroing out of syncobj_desc, as was suggested by Emil Velikov.<=
br>
<br>
=C2=A0 =C2=A0 - Fixed memleak in error code path which was spotted by Emil =
Velikov.<br>
<br>
=C2=A0 =C2=A0 - Switched to u32/u64 instead of uint_t. Previously was keepi=
ng<br>
=C2=A0 =C2=A0 =C2=A0 uint_t style of the virtgpu_ioctl.c, in the end decide=
d to change<br>
=C2=A0 =C2=A0 =C2=A0 it because it&#39;s not a proper kernel coding style a=
fter all.<br>
<br>
=C2=A0 =C2=A0 - Kept single drm_virtgpu_execbuffer_syncobj struct for both =
in/out<br>
=C2=A0 =C2=A0 =C2=A0 sync objects. There was a little concern about whether=
 it would be<br>
=C2=A0 =C2=A0 =C2=A0 worthwhile to have separate in/out descriptors, in pra=
ctice it&#39;s<br>
=C2=A0 =C2=A0 =C2=A0 unlikely that we will extend the descs in a foreseeabl=
e future.<br>
=C2=A0 =C2=A0 =C2=A0 There is no overhead in using same struct since we wan=
t to pad it<br>
=C2=A0 =C2=A0 =C2=A0 to 64b anyways and it shouldn&#39;t be a problem to se=
parate the descs<br>
=C2=A0 =C2=A0 =C2=A0 later on if we will want to do that.<br>
<br>
=C2=A0 =C2=A0 - Added r-b from Emil Velikov.<br>
<br>
v5: - Factored out dma-fence unwrap API usage into separate patch as was<br=
>
=C2=A0 =C2=A0 =C2=A0 suggested by Emil Velikov.<br>
<br>
=C2=A0 =C2=A0 - Improved and documented the job submission reorderings as w=
as<br>
=C2=A0 =C2=A0 =C2=A0 requested by Emil Velikov. Sync file FD is now install=
ed after<br>
=C2=A0 =C2=A0 =C2=A0 job is submitted to virtio to further optimize reorder=
ings.<br>
<br>
=C2=A0 =C2=A0 - Added comment for the kvalloc, as was requested by Emil Vel=
ikov.<br>
<br>
=C2=A0 =C2=A0 - The num_in/out_syncobjs now is set only after completed par=
sing<br>
=C2=A0 =C2=A0 =C2=A0 of pre/post deps, as was requested by Emil Velikov.<br=
>
<br>
v4: - Added r-b from Rob Clark to the &quot;refactoring&quot; patch.<br>
<br>
=C2=A0 =C2=A0 - Replaced for/while(ptr &amp;&amp; itr) with if (ptr), like =
was suggested by<br>
=C2=A0 =C2=A0 =C2=A0 Rob Clark.<br>
<br>
=C2=A0 =C2=A0 - Dropped NOWARN and NORETRY GFP flags and switched syncobj p=
atch<br>
=C2=A0 =C2=A0 =C2=A0 to use kvmalloc.<br>
<br>
=C2=A0 =C2=A0 - Removed unused variables from syncobj patch that were borro=
wed by<br>
=C2=A0 =C2=A0 =C2=A0 accident from another (upcoming) patch after one of gi=
t rebases.<br>
<br>
v3: - Switched to use dma_fence_unwrap_for_each(), like was suggested by<br=
>
=C2=A0 =C2=A0 =C2=A0 Rob Clark.<br>
<br>
=C2=A0 =C2=A0 - Fixed missing dma_fence_put() in error code path that was s=
potted by<br>
=C2=A0 =C2=A0 =C2=A0 Rob Clark.<br>
<br>
=C2=A0 =C2=A0 - Removed obsoleted comment to virtio_gpu_execbuffer_ioctl(),=
 like was<br>
=C2=A0 =C2=A0 =C2=A0 suggested by Rob Clark.<br>
<br>
v2: - Fixed chain-fence context matching by making use of<br>
=C2=A0 =C2=A0 =C2=A0 dma_fence_chain_contained().<br>
<br>
=C2=A0 =C2=A0 - Fixed potential uninitialized var usage in error code patch=
 of<br>
=C2=A0 =C2=A0 =C2=A0 parse_post_deps(). MSM driver had a similar issue that=
 is fixed<br>
=C2=A0 =C2=A0 =C2=A0 already in upstream.<br>
<br>
=C2=A0 =C2=A0 - Added new patch that refactors job submission code path. I =
found<br>
=C2=A0 =C2=A0 =C2=A0 that it was very difficult to add a new/upcoming host-=
waits feature<br>
=C2=A0 =C2=A0 =C2=A0 because of how variables are passed around the code, t=
he virtgpu_ioctl.c<br>
=C2=A0 =C2=A0 =C2=A0 also was growing to unmanageable size.<br>
<br>
Dmitry Osipenko (3):<br>
=C2=A0 drm/virtio: Refactor and optimize job submission code path<br>
=C2=A0 drm/virtio: Wait for each dma-fence of in-fence array individually<b=
r>
=C2=A0 drm/virtio: Support sync objects<br>
<br>
=C2=A0drivers/gpu/drm/virtio/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<=
br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<b=
r>
=C2=A0drivers/gpu/drm/virtio/virtgpu_ioctl.c=C2=A0 | 182 --------<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_submit.c | 530 +++++++++++++++++++++++=
+<br>
=C2=A0include/uapi/drm/virtgpu_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 16 +-<br>
=C2=A06 files changed, 552 insertions(+), 185 deletions(-)<br>
=C2=A0create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--00000000000020078a05f99065de--
