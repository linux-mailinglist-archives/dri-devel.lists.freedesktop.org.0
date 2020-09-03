Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21925BA06
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 07:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E1189C09;
	Thu,  3 Sep 2020 05:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0040589C09;
 Thu,  3 Sep 2020 05:16:07 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id x10so1257078ybj.13;
 Wed, 02 Sep 2020 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+/DSu106qnmvl/Gl7z3TDH0nfRFWr55e6SABDbtirw=;
 b=ntNxCOXFPZxD/sbYWXwlqJFA06hhjVdbIWOVQ9VZrlYljNeA3z9aCUPjZ+UobpMNNr
 pMdKY0Ruq6khtWsxD0CPaiim9OyuZ7aOuXBrmZInawDk3dD2/1+j+c48IHmrpDxRschY
 /mH4I39GwLlU2pdXUqX73x0snxsn1VAYZssjvqVdX5hcwypN2sfVwMWa9h2q64EQa1x0
 u2TavbFQmVywIVkW90+IVTx7h64Ien1YlveT5KnnEx2ga/p5i99z1qPBIBPpA0igNG03
 YMN+cR1he+N3ewXBYmJfMmLrgEuvOIcBJnhURWOJrCD/vfHSYA7WHjfdCwLzJO4JT9Kb
 3geQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+/DSu106qnmvl/Gl7z3TDH0nfRFWr55e6SABDbtirw=;
 b=JoClWI7CNse5vrgxjJI3zgiH0xzmaqrBZtEO+AdtECWJWRLX9YVRpWeZh1r7LRyPqm
 tWhrE0/p5e8Ecwq3UbtpsWn6up2MQItif1HNvnmGwpCZW7/zPOKC6dYGN2Gy9wn3yr2J
 kf+i1DDNr9Dj/2us6SFBFLJLusF7Q0bYOm62wjkXTMhMke8U6Um7u7ZB6tuViByqtAdx
 YCvEqqSubMIrE7ebDx9PFgeswaQU8YsE5VcAqqtR552AkuWIqdl3hDW4pYm3YwVaBO6E
 IVhqXUu8Dk7p6Pfy0l1/CCuC90EU1MpsSQY4WejBvHfoxLzPIHtSBQpYsPPI4hBBy0rL
 kY3g==
X-Gm-Message-State: AOAM533HDlvYHp2sENK8nuJ7mvsV4GOop7HXNTxdxg1dXX4hO6mwg8P0
 7Z503zWFI4ND35s/ClvYmXqB916fZIVNa6ENnNQ=
X-Google-Smtp-Source: ABdhPJxkj7rRBNuFY/WQV4ywl0uo3VNUAiVlXYwI3xiP1n6LKHr0tHpfnYcLG1drZOMcofuEWu98GW9Pgk9nyCCHaV8=
X-Received: by 2002:a25:6d04:: with SMTP id i4mr315460ybc.283.1599110167120;
 Wed, 02 Sep 2020 22:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200901233842.196818-1-lyude@redhat.com>
 <20200901234240.197917-1-lyude@redhat.com>
In-Reply-To: <20200901234240.197917-1-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 3 Sep 2020 15:15:56 +1000
Message-ID: <CACAvsv5vk_43xZF0nVZ0eTmfz_WiE0uTPzdKKFzS03uF7-kynA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v4] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Sep 2020 at 09:43, Lyude Paul <lyude@redhat.com> wrote:
>
> Not entirely sure why this never came up when I originally tested this
> (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> appears to cause the display engine to throw an exception on driver
> init, at least on my ThinkPad P72:
>
> nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b
>
> This is magic nvidia speak for "You need to have the DMA notifier offset
> programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> this by doing that, and also perform an update afterwards to prevent
> racing with the GPU when reading capabilities.
>
> v2:
> * Don't just program the DMA notifier offset, make sure to actually
>   perform an update
> v3:
> * Don't call UPDATE()
> * Actually read the correct notifier fields, as apparently the
>   CAPABILITIES_DONE field lives in a different location than the main
>   NV_DISP_CORE_NOTIFIER_1 field. As well, 907d+ use a different
>   CAPABILITIES_DONE field then pre-907d cards.
> v4:
> * Don't forget to check the return value of core507d_read_caps()
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support")
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/nouveau/dispnv50/core.h       |  2 +
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c   | 37 ++++++++++++++++++-
>  drivers/gpu/drm/nouveau/dispnv50/core907d.c   | 36 +++++++++++++++++-
>  drivers/gpu/drm/nouveau/dispnv50/core917d.c   |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h       |  2 +
>  .../drm/nouveau/include/nvhw/class/cl507d.h   |  5 ++-
>  .../drm/nouveau/include/nvhw/class/cl907d.h   |  4 ++
>  7 files changed, 83 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
> index 498622c0c670d..b789139e5fff6 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
> @@ -44,6 +44,7 @@ int core507d_new_(const struct nv50_core_func *, struct nouveau_drm *, s32,
>                   struct nv50_core **);
>  int core507d_init(struct nv50_core *);
>  void core507d_ntfy_init(struct nouveau_bo *, u32);
> +int core507d_read_caps(struct nv50_disp *disp, u32 offset);
>  int core507d_caps_init(struct nouveau_drm *, struct nv50_disp *);
>  int core507d_ntfy_wait_done(struct nouveau_bo *, u32, struct nvif_device *);
>  int core507d_update(struct nv50_core *, u32 *, bool);
> @@ -55,6 +56,7 @@ extern const struct nv50_outp_func pior507d;
>  int core827d_new(struct nouveau_drm *, s32, struct nv50_core **);
>
>  int core907d_new(struct nouveau_drm *, s32, struct nv50_core **);
> +int core907d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp);
>  extern const struct nv50_outp_func dac907d;
>  extern const struct nv50_outp_func sor907d;
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> index ad1f09a143aa4..d0f2b80a32103 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> @@ -75,18 +75,51 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
>  }
>
>  int
> -core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> +core507d_read_caps(struct nv50_disp *disp, u32 offset)
>  {
>         struct nvif_push *push = disp->core->chan.push;
>         int ret;
>
> -       if ((ret = PUSH_WAIT(push, 2)))
> +       ret = PUSH_WAIT(push, 4);
> +       if (ret)
>                 return ret;
>
> +       PUSH_MTHD(push, NV507D, SET_NOTIFIER_CONTROL,
> +                 NVDEF(NV507D, SET_NOTIFIER_CONTROL, MODE, WRITE) |
> +                 NVVAL(NV507D, SET_NOTIFIER_CONTROL, OFFSET, offset >> 2) |
> +                 NVDEF(NV507D, SET_NOTIFIER_CONTROL, NOTIFY, ENABLE));
>         PUSH_MTHD(push, NV507D, GET_CAPABILITIES, 0x00000000);
Can you send a SET_NOTIFIER_CONTROL_NOTIFY_DISABLE after
GET_CAPABILITIES() too please :)

> +
>         return PUSH_KICK(push);
>  }
>
> +int
> +core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> +{
> +       struct nv50_core *core = disp->core;
> +       struct nouveau_bo *bo = disp->sync;
> +       s64 time;
> +       int ret;
> +
> +       NVBO_WR32(bo, NV50_DISP_CAPS_NTFY1, NV_DISP_CORE_NOTIFIER_1, CAPABILITIES_1,
> +                                     NVDEF(NV_DISP_CORE_NOTIFIER_1, CAPABILITIES_1, DONE, FALSE));
You don't need these NV50_DISP_CAPS_NTFYx thingies.  These offsets are
already encoded in NVIDIA's headers
(NV_DISP_CORE_NOTIFIER_1_CAPABILITIES_1 is an offset), you're adding
an additional offset by doing this.  Just use NV50_DISP_CORE_NTFY in
all these places, and let NVIDIA's headers do the rest.

The additional offset in these macros are meant for when there's
multiple structures packed into a single nouveau_bo at different
offsets.

It doesn't actually matter here, because it gets divided away.  But
for core907d, you're actually reading CAPABILITIES_5 (which, weirdly,
seems to contain an identical value).

> +
> +       ret = core507d_read_caps(disp, NV50_DISP_CAPS_NTFY1);
> +       if (ret < 0)
> +               return ret;
> +
> +       time = nvif_msec(core->chan.base.device, 2000ULL,
> +                        if (NVBO_TD32(bo, NV50_DISP_CAPS_NTFY1,
> +                                      NV_DISP_CORE_NOTIFIER_1, CAPABILITIES_1, DONE, ==, TRUE))
> +                                break;
> +                        usleep_range(1, 2);
> +                        );
> +       if (time < 0)
> +               NV_ERROR(drm, "core caps notifier timeout\n");
> +
> +       return 0;
> +}
> +
>  int
>  core507d_init(struct nv50_core *core)
>  {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core907d.c b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
> index b17c03529c784..45505a18aca17 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core907d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
> @@ -22,11 +22,45 @@
>  #include "core.h"
>  #include "head.h"
>
> +#include <nvif/push507c.h>
> +#include <nvif/timer.h>
> +
> +#include <nvhw/class/cl907d.h>
> +
> +#include "nouveau_bo.h"
> +
> +int
> +core907d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> +{
> +       struct nv50_core *core = disp->core;
> +       struct nouveau_bo *bo = disp->sync;
> +       s64 time;
> +       int ret;
> +
> +       NVBO_WR32(bo, NV50_DISP_CAPS_NTFY4, NV907D_CORE_NOTIFIER_3, CAPABILITIES_4,
> +                                     NVDEF(NV907D_CORE_NOTIFIER_3, CAPABILITIES_4, DONE, FALSE));
> +
> +       ret = core507d_read_caps(disp, NV50_DISP_CAPS_NTFY4);
> +       if (ret < 0)
> +               return ret;
> +
> +       time = nvif_msec(core->chan.base.device, 2000ULL,
> +                        if (NVBO_TD32(bo, NV50_DISP_CAPS_NTFY4,
> +                                      NV907D_CORE_NOTIFIER_3, CAPABILITIES_4, DONE, ==, TRUE))
> +                                break;
> +                        usleep_range(1, 2);
> +                        );
> +       if (time < 0)
> +               NV_ERROR(drm, "core caps notifier timeout\n");
> +
> +       return 0;
> +}
> +
>  static const struct nv50_core_func
>  core907d = {
>         .init = core507d_init,
>         .ntfy_init = core507d_ntfy_init,
> -       .caps_init = core507d_caps_init,
> +       .caps_init = core907d_caps_init,
>         .ntfy_wait_done = core507d_ntfy_wait_done,
>         .update = core507d_update,
>         .head = &head907d,
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core917d.c b/drivers/gpu/drm/nouveau/dispnv50/core917d.c
> index 66846f3720805..1cd3a2a35dfb7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core917d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core917d.c
> @@ -26,7 +26,7 @@ static const struct nv50_core_func
>  core917d = {
>         .init = core507d_init,
>         .ntfy_init = core507d_ntfy_init,
> -       .caps_init = core507d_caps_init,
> +       .caps_init = core907d_caps_init,
>         .ntfy_wait_done = core507d_ntfy_wait_done,
>         .update = core507d_update,
>         .head = &head917d,
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
> index 92bddc0836171..a59051bd070d7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
> @@ -16,6 +16,8 @@ struct nv50_disp {
>
>  #define NV50_DISP_SYNC(c, o)                                ((c) * 0x040 + (o))
>  #define NV50_DISP_CORE_NTFY                       NV50_DISP_SYNC(0      , 0x00)
> +#define NV50_DISP_CAPS_NTFY1                      NV50_DISP_SYNC(0      , 0x01)
> +#define NV50_DISP_CAPS_NTFY4                      NV50_DISP_SYNC(0      , 0x04)
>  #define NV50_DISP_WNDW_SEM0(c)                    NV50_DISP_SYNC(1 + (c), 0x00)
>  #define NV50_DISP_WNDW_SEM1(c)                    NV50_DISP_SYNC(1 + (c), 0x10)
>  #define NV50_DISP_WNDW_NTFY(c)                    NV50_DISP_SYNC(1 + (c), 0x20)
> diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/cl507d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/cl507d.h
> index 2e444bac701dd..6a463f308b64f 100644
> --- a/drivers/gpu/drm/nouveau/include/nvhw/class/cl507d.h
> +++ b/drivers/gpu/drm/nouveau/include/nvhw/class/cl507d.h
> @@ -32,7 +32,10 @@
>  #define NV_DISP_CORE_NOTIFIER_1_COMPLETION_0_DONE_TRUE                               0x00000001
>  #define NV_DISP_CORE_NOTIFIER_1_COMPLETION_0_R0                                      15:1
>  #define NV_DISP_CORE_NOTIFIER_1_COMPLETION_0_TIMESTAMP                               29:16
> -
> +#define NV_DISP_CORE_NOTIFIER_1_CAPABILITIES_1                                       0x00000001
> +#define NV_DISP_CORE_NOTIFIER_1_CAPABILITIES_1_DONE                                  0:0
> +#define NV_DISP_CORE_NOTIFIER_1_CAPABILITIES_1_DONE_FALSE                            0x00000000
> +#define NV_DISP_CORE_NOTIFIER_1_CAPABILITIES_1_DONE_TRUE                             0x00000001
>
>  // class methods
>  #define NV507D_UPDATE                                                           (0x00000080)
> diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h
> index 34bc3eafac7d1..79aff6ff31385 100644
> --- a/drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h
> +++ b/drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h
> @@ -24,6 +24,10 @@
>  #ifndef _cl907d_h_
>  #define _cl907d_h_
>
> +#define NV907D_CORE_NOTIFIER_3_CAPABILITIES_4                                       0x00000004
> +#define NV907D_CORE_NOTIFIER_3_CAPABILITIES_4_DONE                                  0:0
> +#define NV907D_CORE_NOTIFIER_3_CAPABILITIES_4_DONE_FALSE                            0x00000000
> +#define NV907D_CORE_NOTIFIER_3_CAPABILITIES_4_DONE_TRUE                             0x00000001
>  #define NV907D_CORE_NOTIFIER_3_CAPABILITIES_CAP_SOR0_20                             0x00000014
>  #define NV907D_CORE_NOTIFIER_3_CAPABILITIES_CAP_SOR0_20_SINGLE_LVDS18               0:0
>  #define NV907D_CORE_NOTIFIER_3_CAPABILITIES_CAP_SOR0_20_SINGLE_LVDS18_FALSE         0x00000000
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
