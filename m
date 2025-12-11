Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53504CB662C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240B410E557;
	Thu, 11 Dec 2025 15:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ntaAuvbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC0D10E557
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:53:13 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-64455a2a096so210379d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765468392; x=1766073192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dBGjpPP9YE4qDIRAWgDomHdulI38A9FYt2FyWSnbZc=;
 b=ntaAuvbYf7vYH+M3+X2c4+BpJeujEilmJJfTf07GHQ9rv4nBVjRtNLQY2xOnwPYZIJ
 EMXzYixQnoqeiJHxfoOBUwLoeEntnmBUge9PV7E40ZNr5/XS5XBml/E5LyI77ytNNvK5
 uQ53JK+Kf3Aoii4N2yXS2/jcgs+c38Dv2ndJbs+tj4bcUkYMNtxqwotAD4dk0zCGk460
 wR1Zi9Um6G760PuJIq9WUZxLP1DSBUu7UK8bZpEYYHxDMTYgojRvV+tIh7oY5azcxBxM
 ZMMH5rNFwsVwJSCWJUgJ4mIpTJ3S2wVoeYzQFgDr6wDaZDWznWbEFP/4PRfVKQhYlHp1
 cmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765468392; x=1766073192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+dBGjpPP9YE4qDIRAWgDomHdulI38A9FYt2FyWSnbZc=;
 b=S4HvOdpgJG97F9vrItOuHtyB9JunSqMKait4iAFemzii6SIqe6eg0jUlOda+a9yYkI
 9HV3sUho1RYx6ro3Yyelpd7qtiywcwyGjzxYafockHeKI+arl2ewRItCWCtBw7ziR2o7
 BL2Sqzzuk2daKTC0PAsObr97Je89XMVZHPJh5/sRi4GrhNqE3c6wlzOsgJQkSwGMhDOC
 wSiAOQ64qAPhT2qVczrqW+jvlQtGJ2ayPc0bc+DV1EqfKxUPGcG3oTV16XLRwXnyU9nD
 uRFVsPZK2BrR+TxvPFy9fumCYA1O3QAGMumg6iowpQDSB0MHkiQPhBOe2t3dqzyK1qtO
 JyeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdFetKMMxDKcq8UPpIC3td/u8anExIsHsgJRJDTGcqtWHcz8+XgBQtmHFYIRtV8IrKZmb6owB92z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzPvWhRqEebPkLYwxq4sOpMn1TvaOJC+Bpfvt4iTczchxKNa4N
 Sb3Z7oSY2yB8TOFr2M3GMN0hYdVj2xd082WMA4ORczhEOGP2AgCJQNkfY0pusIniNcy04fWd9o+
 Q0Fbkfnphasb9HU4NeiyxxRcZxI85sfGWk1mZGZZAIg==
X-Gm-Gg: AY/fxX5r8lzAdBL8/Kt+2LEor9jpSIo5YOSLBeF7Dg1P0M0CLjtFfhPi5qxLKmNQ49a
 iuzO7/1EKwP3/Yt1nRVIaa8QTZEHmx4Om7T3Pk+RZJRqeZU2jWttrbB2XT9vjh8tLI1zAj01Vfk
 iubzgj3qcbLuHMF0Upk5Q+FRIaehih7vzgW8ECT7TKYheXM1dMfhQwkImvXIQgtTSp/2G0YYly0
 JhfckMy1YcLcT4b6GgiSH1M9nnZ1q+hZfShh1DOhswHakJKWp1vRUSDNil2rlnVvXYEy0/m
X-Google-Smtp-Source: AGHT+IGUsgtLkKLPoU+swAXCvd5pN2AtL71+QRCilZtTLV74Ki6ExMqENzFZ32j2du28KaBbdflguLNUhqYGK/g3wsw=
X-Received: by 2002:a05:690c:48c9:b0:787:e3c0:f61f with SMTP id
 00721157ae682-78c9d79d6damr110404867b3.57.1765468391890; Thu, 11 Dec 2025
 07:53:11 -0800 (PST)
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
 <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
 <i234zyh7ajsxdvbkzindyk5h6wilds226jqmh32kml4aweesav@frlk2l7zgmg4>
In-Reply-To: <i234zyh7ajsxdvbkzindyk5h6wilds226jqmh32kml4aweesav@frlk2l7zgmg4>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 11 Dec 2025 23:53:00 +0800
X-Gm-Features: AQt7F2owJprXjxEiZG8aZ_nuD-7s3hT0ej3bNeUC-m6nLc4sVw6LJdRemDoFFrU
Message-ID: <CABymUCNm5fpFN-Zpw7WkqP4EdBGXR9JCFyppOkuWs-r9MFx3dg@mail.gmail.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
12=E6=9C=8811=E6=97=A5=E5=91=A8=E5=9B=9B 03:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Nov 29, 2025 at 05:37:43PM +0100, Marijn Suijten wrote:
> > On 2025-09-18 21:29:02, Jun Nie wrote:
> > > To support high-resolution cases that exceed the width limitation of
> > > a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate=
,
> > > additional pipes are necessary to enable parallel data processing
> > > within the SSPP width constraints and MDP clock rate.
> > >
> > > Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> > > and dual interfaces are enabled. More use cases can be incorporated
> > > later if quad-pipe capabilities are required.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++++++++++=
+++------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++------=
----------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > >  6 files changed, 35 insertions(+), 32 deletions(-)
> >
> > With this patch applied, I get the following crash on the Sony Xperia 1=
 III, a
> > dual-DSI dual-DSC device:
> >
> >       Unable to handle kernel NULL pointer dereference at virtual addre=
ss 0000000000000020
> >       Mem abort info:
> >         ESR =3D 0x0000000096000004
> >         EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >         SET =3D 0, FnV =3D 0
> >         EA =3D 0, S1PTW =3D 0
> >         FSC =3D 0x04: level 0 translation fault
> >       Data abort info:
> >         ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> >         CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> >         GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> >       user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000012d4e1000
> >       [0000000000000020] pgd=3D0000000000000000, p4d=3D0000000000000000
> >       Internal error: Oops: 0000000096000004 [#1]  SMP
> >       Modules linked in: msm drm_client_lib ubwc_config drm_dp_aux_bus =
gpu_sched drm_gpuvm drm_exec
> >       CPU: 5 UID: 0 PID: 3081 Comm: (sd-close) Tainted: G     U        =
      6.18.0-rc7-next-20251127-SoMainline-12422-g10b6db5b056d-dirty #21 NON=
E
> >       Tainted: [U]=3DUSER
> >       Hardware name: Sony Xperia 1 III (DT)
> >       pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >       pc : dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm]
> >       lr : dpu_plane_atomic_check_sspp.isra.0+0x84/0x3f4 [msm]
> >       sp : ffff800081e23940
> >       x29: ffff800081e23950 x28: ffff0000bf2700d0 x27: 0000000000000a00
> >       x26: ffff0000bf270000 x25: 0000000000000a00 x24: ffff0000bd0e5c18
> >       x23: ffff000087a6c080 x22: 0000000000000224 x21: ffff00008ce88080
> >       x20: 0000000000000002 x19: ffff0000bf270138 x18: ffff8000818350b0
> >       x17: 000000040044ffff x16: ffffc488ae2e37e0 x15: 0000000000000005
> >       x14: 0000000000000a00 x13: 0000000000000000 x12: 0000000000000138
> >       x11: 0000000000000000 x10: 0000000000000012 x9 : 0000000000000000
> >       x8 : 0000000000000a00 x7 : 0000000000000000 x6 : 0000000000000000
> >       x5 : 0000000000000002 x4 : 0000000000000000 x3 : ffffc48897741db0
> >       x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> >       Call trace:
> >        dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm] (P)
> >        dpu_plane_atomic_check+0x100/0x1a0 [msm]
> >        drm_atomic_helper_check_planes+0xd8/0x224
> >        drm_atomic_helper_check+0x50/0xb4
> >        msm_atomic_check+0xd0/0xe0 [msm]
> >        drm_atomic_check_only+0x4e0/0x928
> >        drm_atomic_commit+0x50/0xd4
> >        drm_client_modeset_commit_atomic+0x200/0x260
> >        drm_client_modeset_commit_locked+0x64/0x180
> >        drm_client_modeset_commit+0x30/0x60
> >        drm_fb_helper_lastclose+0x60/0xb0
> >        drm_fbdev_client_restore+0x18/0x38 [drm_client_lib]
> >        drm_client_dev_restore+0xac/0xf8
> >        drm_release+0x124/0x158
> >        __fput+0xd4/0x2e4
> >        fput_close_sync+0x3c/0xe0
> >        __arm64_sys_close+0x3c/0x84
> >        invoke_syscall.constprop.0+0x44/0x100
> >        el0_svc_common.constprop.0+0x3c/0xe4
> >        do_el0_svc+0x20/0x3c
> >        el0_svc+0x38/0x110
> >        el0t_64_sync_handler+0xa8/0xec
> >        el0t_64_sync+0x1a0/0x1a4
> >       Code: 2a1403e5 52800082 94008e28 f9400380 (f940101b)
> >       ---[ end trace 0000000000000000 ]---
> >       pstore: backend (ramoops) writing error (-28)
> >       [drm:dpu_encoder_frame_done_timeout:2726] [dpu error]enc33 frame =
done timeout
> >
> > I don't see any thought given to it in the extremely terse patch descri=
ption,
> > but this patch seems to unconditionally select 4 DSCs and 4 LMs on this=
 device
> > because the underlying SM8350 SoC has 4 available in its catalog - whil=
e it
> > was previously affixed to 2:2:2 matching the downstream and known-worki=
ng
> > configuration of this device - and I can only imagine things are rollin=
g
> > downhill from there.
> >
> > faddr2line seems to be failing for me, but this is the line
> > `dpu_plane_atomic_check_sspp.isra.0+0x88` seems to be referring to:
> >
> >       aarch64-linux-gnu-objdump .output/drivers/gpu/drm/msm/msm.ko -dS =
| grep dpu_plane_atomic_check_sspp.isra.0\> -A80
> >       00000000000671ac <dpu_plane_atomic_check_sspp.isra.0>:
> >       static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >       ...
> >          67234:       f940101b        ldr     x27, [x0, #32]
> >               if (!(sblk->scaler_blk.len && pipe->sspp->ops.setup_scale=
r) &&
>
> I think it is:
>
>         pipe_hw_caps =3D pipe->sspp->cap;
>     14bc:       f9401018        ldr     x24, [x0, #32]
>
>
> So, please check why pipe->sspp becomes NULL (or where do we miss the
> NULL check for pipe->sspp).

Yeah, per panic log and objdump, it should be due to this line. But no
clue is found
with code analysis.
Did you reproduce it? If so, what's the platform and git commit id? I
tested with
HDK8650 dual-DSI HDMI bridged monitor, but kernel does not panic.

resource mapping:
        pingpong=3D104 104 # # # # - - # # # # -
        mixer=3D104 104 # # # # - -
        ctl=3D104 # # # # # - -
        dspp=3D# # # # - - - -
        dsc=3D# # # # # # - -
        cdm=3D#
        sspp=3D# # # # - - - - 104 # # # # # - -
        cwb=3D# # # #


Hi Marijn,
Could you help collect debug info with this change? Thanks!
BTW: my irc id: niej

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d07a6ab6e7ee1..fc61c2fbb0699 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -886,6 +886,7 @@ static int dpu_plane_atomic_check_nosspp(struct
drm_plane *plane,
                        new_plane_state->fb->width, new_plane_state->fb->he=
ight,
                        new_plane_state->rotation);

+       memset(&pstate->pipe_cfg[0], 0, PIPES_PER_PLANE *
sizeof(struct dpu_sw_pipe_cfg));
        /*
         * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer p=
air
         * configs for left and right half screen in case of 4:4:2 topology=
.
@@ -1055,6 +1056,13 @@ static int dpu_plane_atomic_check_sspp(struct
drm_plane *plane,
                if (!drm_rect_width(&pipe_cfg->src_rect))
                        continue;
                DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i=
);
+               if(!pipe->sspp) {
+                       WARN(1, "%svirtual plane pipe %d is null with
width %d height %d!!\n",
+                               dpu_use_virtual_planes ? " " : "non-",
+                               i,
+                               drm_rect_width(&pipe_cfg->src_rect),
+                               drm_rect_height(&pipe_cfg->src_rect));
+               }
                ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
                                                  &crtc_state->adjusted_mod=
e,
                                                  new_plane_state);
>
>
> --
> With best wishes
> Dmitry
