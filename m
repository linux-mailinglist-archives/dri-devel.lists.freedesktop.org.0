Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131DE626489
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D716110E8D2;
	Fri, 11 Nov 2022 22:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9840610E8D2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 22:20:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id t25so15549200ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q2Mbc0ZkVaVOUNyIcJNqskejfXneetWbr5TA47JgcsQ=;
 b=JQm/lMmf9BM77t7b1B8SqvOa9LEE1wOGBvSu5jASYW/Y5hzgYDK/jF1CFuDs/HVPtc
 SDqG8T5NoJzl8eYtWprnjuUnguRSpBqrCBh3HURHv/lNhNSgmeP+Kuj6RQURgpkWHu4O
 ojZFWIpYrpUao0LBeN/stfRRUxppr6bMsZf20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q2Mbc0ZkVaVOUNyIcJNqskejfXneetWbr5TA47JgcsQ=;
 b=pW7rjjH/Raxh2JXu9UYXehMn59EzU8Q9/DaO/IyJ75mlidGcZYLyf37MJRps3oVx4M
 D1ZebmL4ItHjON+A0CUs1wyulATJFUy6oQbBNSvWZslxKmwlF3fSdhe9iGVfMGLjFP6i
 tcLa0Xpx1DccrXkOQ1/5GvFotmc9qkqSqPjnMT8tSUF9CFKWm/lDBWlAfGhULc+fVXb6
 6vRJAzY4bPz60jlT4GMDniPmsQSdRYnrPnSUEVLthgoHS65E5vh9FKHf/MHxhXUw02vi
 lzz4U/dE13FjLSm+rvssZZJqqBXIwRnIkMNymJuyOIkqlbs5Jl6G3eHuW4J+Vv0JrQWl
 ifEA==
X-Gm-Message-State: ANoB5pnrt4mcDgplbhtUz/GtOLFz0X5ARLogisyU9fMrEQf0fjX1KglV
 JLb7IdCBLNJXeU9zL4cjFNGaIJkjlWnhh655BE062Q==
X-Google-Smtp-Source: AA0mqf7iPxXg9/3EGeWgZSzOFRm/pSEnegM3aIiFrXxitsGrtm5ZL23z73sKlVKjjYrG00EblxOzCVczfGVdiVBQuzM=
X-Received: by 2002:a17:906:4acb:b0:781:d0c1:4434 with SMTP id
 u11-20020a1709064acb00b00781d0c14434mr3445888ejt.756.1668205208814; Fri, 11
 Nov 2022 14:20:08 -0800 (PST)
MIME-Version: 1.0
References: <899db0f8-7b8a-ed8f-30b8-4f630da1298d@quicinc.com>
 <F4D72FA8-C1D1-46ED-B56E-8BEFBB297E4A@joelfernandes.org>
In-Reply-To: <F4D72FA8-C1D1-46ED-B56E-8BEFBB297E4A@joelfernandes.org>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Fri, 11 Nov 2022 17:19:57 -0500
Message-ID: <CAEXW_YTnFsMVX6-dGap0UdbhmZeMd+fhkq9Y3tV2QT8wB9Y2DA@mail.gmail.com>
Subject: Re: [PATCH 2/2] adreno: Detect shutdown during get_param()
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: multipart/alternative; boundary="000000000000e25ec205ed394a59"
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Ross Zwisler <zwisler@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ricardo Ribalda <ribalda@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e25ec205ed394a59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2022 at 4:37 PM Joel Fernandes <joel@joelfernandes.org>
wrote:

>
>
> > On Nov 11, 2022, at 4:28 PM, Akhil P Oommen <quic_akhilpo@quicinc.com>
> wrote:
> >
> > =EF=BB=BFOn 11/12/2022 1:19 AM, Joel Fernandes (Google) wrote:
> >> Even though the GPU is shut down, during kexec reboot we can have
> userspace
> >> still running. This is especially true if KEXEC_JUMP is not enabled,
> because we
> >> do not freeze userspace in this case.
> >>
> >> To prevent crashes, track that the GPU is shutdown and prevent
> get_param() from
> >> accessing GPU resources if we find it shutdown.
> >>
> >> This fixes the following crash during kexec reboot on an ARM64 device
> with adreno GPU:
> >>
> >> [  292.534314] Kernel panic - not syncing: Asynchronous SError Interru=
pt
> >> [  292.534323] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> >> [  292.534326] Call trace:
> >> [  292.534328]  dump_backtrace+0x0/0x1d4
> >> [  292.534337]  show_stack+0x20/0x2c
> >> [  292.534342]  dump_stack_lvl+0x60/0x78
> >> [  292.534347]  dump_stack+0x18/0x38
> >> [  292.534352]  panic+0x148/0x3b0
> >> [  292.534357]  nmi_panic+0x80/0x94
> >> [  292.534364]  arm64_serror_panic+0x70/0x7c
> >> [  292.534369]  do_serror+0x0/0x7c
> >> [  292.534372]  do_serror+0x54/0x7c
> >> [  292.534377]  el1h_64_error_handler+0x34/0x4c
> >> [  292.534381]  el1h_64_error+0x7c/0x80
> >> [  292.534386]  el1_interrupt+0x20/0x58
> >> [  292.534389]  el1h_64_irq_handler+0x18/0x24
> >> [  292.534395]  el1h_64_irq+0x7c/0x80
> >> [  292.534399]  local_daif_inherit+0x10/0x18
> >> [  292.534405]  el1h_64_sync_handler+0x48/0xb4
> >> [  292.534410]  el1h_64_sync+0x7c/0x80
> >> [  292.534414]  a6xx_gmu_set_oob+0xbc/0x1fc
> >> [  292.534422]  a6xx_get_timestamp+0x40/0xb4
> >> [  292.534426]  adreno_get_param+0x12c/0x1e0
> >> [  292.534433]  msm_ioctl_get_param+0x64/0x70
> >> [  292.534440]  drm_ioctl_kernel+0xe8/0x158
> >> [  292.534448]  drm_ioctl+0x208/0x320
> >> [  292.534453]  __arm64_sys_ioctl+0x98/0xd0
> >> [  292.534461]  invoke_syscall+0x4c/0x118
> >> [  292.534467]  el0_svc_common+0x98/0x104
> >> [  292.534473]  do_el0_svc+0x30/0x80
> >> [  292.534478]  el0_svc+0x20/0x50
> >> [  292.534481]  el0t_64_sync_handler+0x78/0x108
> >> [  292.534485]  el0t_64_sync+0x1a4/0x1a8
> >> [  292.534632] Kernel Offset: 0x1a5f800000 from 0xffffffc008000000
> >> [  292.534635] PHYS_OFFSET: 0x80000000
> >> [  292.534638] CPU features: 0x40018541,a3300e42
> >> [  292.534644] Memory Limit: none
> >>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> Cc: Steven Rostedt <rostedt@goodmis.org>
> >> Cc: Ricardo Ribalda <ribalda@chromium.org>
> >> Cc: Ross Zwisler <zwisler@kernel.org>
> >> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 +-
> >>  drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
> >>  3 files changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c
> b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> index f0cff62812c3..03d912dc0130 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -612,6 +612,7 @@ static void adreno_shutdown(struct platform_device
> *pdev)
> >>  {
> >>      struct msm_gpu *gpu =3D dev_to_gpu(&pdev->dev);
> >>  +    gpu->is_shutdown =3D true;
> >>      WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
> >>  }
> >>  diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> index 382fb7f9e497..6903c6892469 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -251,7 +251,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct
> msm_file_private *ctx,
> >>      struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >>        /* No pointer params yet */
> >> -    if (*len !=3D 0)
> >> +    if (*len !=3D 0 || gpu->is_shutdown)
> >>          return -EINVAL;
> > This will race with shutdown.
>
> Could you clarify what you mean? At this point in the code, the shutdown
> is completed and it crashes here.
>


Ok so I think you meant that if the shut down happens after we sample the
is_shutdown, then we run into the same issue.

I can=E2=80=99t reproduce that but I=E2=80=99ll look into that. Another way=
 might be to
synchronize using a mutex. Though maybe the shutdown path can wait for
active pm_runtime references?

Thanks.




> > Probably, propagating back the return value of pm_runtime_get() in ever=
y
> possible ioctl call path is the right thing to do.
>
> Ok I=E2=80=99ll look into that. But the patch I posted works reliably and=
 fixes
> all crashes we could reproduce.
>
> > I have never thought about this scenario. Do you know why userspace is
> not freezed before kexec?
>
> I am not sure. It depends on how kexec is used. The userspace freeze
> happens only when kexec is called to switch back and forth between
> different kernels (persistence mode). In such scenario I believe the
> userspace has to be frozen and unfrozen. However for normal kexec, that
> does not happen.
>
> Thanks.
>
>
> >
> > -Akhil.
> >>        switch (param) {
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.h
> b/drivers/gpu/drm/msm/msm_gpu.h
> >> index ff911e7305ce..f18b0a91442b 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >> @@ -214,6 +214,9 @@ struct msm_gpu {
> >>      /* does gpu need hw_init? */
> >>      bool needs_hw_init;
> >>  +    /* is the GPU shutdown? */
> >> +    bool is_shutdown;
> >> +
> >>      /**
> >>       * global_faults: number of GPU hangs not attributed to a
> particular
> >>       * address space
> >
>

--000000000000e25ec205ed394a59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 11, 2022 at 4:37 PM Joel Fernandes &lt;<a href=
=3D"mailto:joel@joelfernandes.org">joel@joelfernandes.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On Nov 11, 2022, at 4:28 PM, Akhil P Oommen &lt;<a href=3D"mailto:quic=
_akhilpo@quicinc.com" target=3D"_blank">quic_akhilpo@quicinc.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; =EF=BB=BFOn 11/12/2022 1:19 AM, Joel Fernandes (Google) wrote:<br>
&gt;&gt; Even though the GPU is shut down, during kexec reboot we can have =
userspace<br>
&gt;&gt; still running. This is especially true if KEXEC_JUMP is not enable=
d, because we<br>
&gt;&gt; do not freeze userspace in this case.<br>
&gt;&gt; <br>
&gt;&gt; To prevent crashes, track that the GPU is shutdown and prevent get=
_param() from<br>
&gt;&gt; accessing GPU resources if we find it shutdown.<br>
&gt;&gt; <br>
&gt;&gt; This fixes the following crash during kexec reboot on an ARM64 dev=
ice with adreno GPU:<br>
&gt;&gt; <br>
&gt;&gt; [=C2=A0 292.534314] Kernel panic - not syncing: Asynchronous SErro=
r Interrupt<br>
&gt;&gt; [=C2=A0 292.534323] Hardware name: Google Lazor (rev3 - 8) with LT=
E (DT)<br>
&gt;&gt; [=C2=A0 292.534326] Call trace:<br>
&gt;&gt; [=C2=A0 292.534328]=C2=A0 dump_backtrace+0x0/0x1d4<br>
&gt;&gt; [=C2=A0 292.534337]=C2=A0 show_stack+0x20/0x2c<br>
&gt;&gt; [=C2=A0 292.534342]=C2=A0 dump_stack_lvl+0x60/0x78<br>
&gt;&gt; [=C2=A0 292.534347]=C2=A0 dump_stack+0x18/0x38<br>
&gt;&gt; [=C2=A0 292.534352]=C2=A0 panic+0x148/0x3b0<br>
&gt;&gt; [=C2=A0 292.534357]=C2=A0 nmi_panic+0x80/0x94<br>
&gt;&gt; [=C2=A0 292.534364]=C2=A0 arm64_serror_panic+0x70/0x7c<br>
&gt;&gt; [=C2=A0 292.534369]=C2=A0 do_serror+0x0/0x7c<br>
&gt;&gt; [=C2=A0 292.534372]=C2=A0 do_serror+0x54/0x7c<br>
&gt;&gt; [=C2=A0 292.534377]=C2=A0 el1h_64_error_handler+0x34/0x4c<br>
&gt;&gt; [=C2=A0 292.534381]=C2=A0 el1h_64_error+0x7c/0x80<br>
&gt;&gt; [=C2=A0 292.534386]=C2=A0 el1_interrupt+0x20/0x58<br>
&gt;&gt; [=C2=A0 292.534389]=C2=A0 el1h_64_irq_handler+0x18/0x24<br>
&gt;&gt; [=C2=A0 292.534395]=C2=A0 el1h_64_irq+0x7c/0x80<br>
&gt;&gt; [=C2=A0 292.534399]=C2=A0 local_daif_inherit+0x10/0x18<br>
&gt;&gt; [=C2=A0 292.534405]=C2=A0 el1h_64_sync_handler+0x48/0xb4<br>
&gt;&gt; [=C2=A0 292.534410]=C2=A0 el1h_64_sync+0x7c/0x80<br>
&gt;&gt; [=C2=A0 292.534414]=C2=A0 a6xx_gmu_set_oob+0xbc/0x1fc<br>
&gt;&gt; [=C2=A0 292.534422]=C2=A0 a6xx_get_timestamp+0x40/0xb4<br>
&gt;&gt; [=C2=A0 292.534426]=C2=A0 adreno_get_param+0x12c/0x1e0<br>
&gt;&gt; [=C2=A0 292.534433]=C2=A0 msm_ioctl_get_param+0x64/0x70<br>
&gt;&gt; [=C2=A0 292.534440]=C2=A0 drm_ioctl_kernel+0xe8/0x158<br>
&gt;&gt; [=C2=A0 292.534448]=C2=A0 drm_ioctl+0x208/0x320<br>
&gt;&gt; [=C2=A0 292.534453]=C2=A0 __arm64_sys_ioctl+0x98/0xd0<br>
&gt;&gt; [=C2=A0 292.534461]=C2=A0 invoke_syscall+0x4c/0x118<br>
&gt;&gt; [=C2=A0 292.534467]=C2=A0 el0_svc_common+0x98/0x104<br>
&gt;&gt; [=C2=A0 292.534473]=C2=A0 do_el0_svc+0x30/0x80<br>
&gt;&gt; [=C2=A0 292.534478]=C2=A0 el0_svc+0x20/0x50<br>
&gt;&gt; [=C2=A0 292.534481]=C2=A0 el0t_64_sync_handler+0x78/0x108<br>
&gt;&gt; [=C2=A0 292.534485]=C2=A0 el0t_64_sync+0x1a4/0x1a8<br>
&gt;&gt; [=C2=A0 292.534632] Kernel Offset: 0x1a5f800000 from 0xffffffc0080=
00000<br>
&gt;&gt; [=C2=A0 292.534635] PHYS_OFFSET: 0x80000000<br>
&gt;&gt; [=C2=A0 292.534638] CPU features: 0x40018541,a3300e42<br>
&gt;&gt; [=C2=A0 292.534644] Memory Limit: none<br>
&gt;&gt; <br>
&gt;&gt; Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" target=
=3D"_blank">robdclark@chromium.org</a>&gt;<br>
&gt;&gt; Cc: Steven Rostedt &lt;<a href=3D"mailto:rostedt@goodmis.org" targ=
et=3D"_blank">rostedt@goodmis.org</a>&gt;<br>
&gt;&gt; Cc: Ricardo Ribalda &lt;<a href=3D"mailto:ribalda@chromium.org" ta=
rget=3D"_blank">ribalda@chromium.org</a>&gt;<br>
&gt;&gt; Cc: Ross Zwisler &lt;<a href=3D"mailto:zwisler@kernel.org" target=
=3D"_blank">zwisler@kernel.org</a>&gt;<br>
&gt;&gt; Signed-off-by: Joel Fernandes (Google) &lt;<a href=3D"mailto:joel@=
joelfernandes.org" target=3D"_blank">joel@joelfernandes.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/msm/adreno/adreno_gpu.c=C2=A0 =C2=A0 | 2 +-<=
br>
&gt;&gt;=C2=A0 drivers/gpu/drm/msm/msm_gpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;&gt;=C2=A0 3 files changed, 5 insertions(+), 1 deletion(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/=
gpu/drm/msm/adreno/adreno_device.c<br>
&gt;&gt; index f0cff62812c3..03d912dc0130 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/msm/adreno/adreno_device.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c<br>
&gt;&gt; @@ -612,6 +612,7 @@ static void adreno_shutdown(struct platform_de=
vice *pdev)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct msm_gpu *gpu =3D dev_to_gpu(&amp;pdev-&=
gt;dev);<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 gpu-&gt;is_shutdown =3D true;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 WARN_ON_ONCE(adreno_system_suspend(&amp;pdev-&=
gt;dev));<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drive=
rs/gpu/drm/msm/adreno/adreno_gpu.c<br>
&gt;&gt; index 382fb7f9e497..6903c6892469 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c<br>
&gt;&gt; @@ -251,7 +251,7 @@ int adreno_get_param(struct msm_gpu *gpu, stru=
ct msm_file_private *ctx,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct adreno_gpu *adreno_gpu =3D to_adreno_gp=
u(gpu);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No pointer params yet */<br>
&gt;&gt; -=C2=A0 =C2=A0 if (*len !=3D 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*len !=3D 0 || gpu-&gt;is_shutdown)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; This will race with shutdown.<br>
<br>
Could you clarify what you mean? At this point in the code, the shutdown is=
 completed and it crashes here.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Ok so I think you meant that if the shut down happens after we =
sample the is_shutdown, then we run into the same issue.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I can=E2=80=99t reproduce that but I=E2=80=
=99ll look into that. Another way might be to synchronize using a mutex. Th=
ough maybe the shutdown path can wait for active pm_runtime references?</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
&gt; Probably, propagating back the return value of pm_runtime_get() in eve=
ry possible ioctl call path is the right thing to do.<br>
<br>
Ok I=E2=80=99ll look into that. But the patch I posted works reliably and f=
ixes all crashes we could reproduce.<br>
<br>
&gt; I have never thought about this scenario. Do you know why userspace is=
 not freezed before kexec?<br>
<br>
I am not sure. It depends on how kexec is used. The userspace freeze happen=
s only when kexec is called to switch back and forth between different kern=
els (persistence mode). In such scenario I believe the userspace has to be =
frozen and unfrozen. However for normal kexec, that does not happen.<br>
<br>
Thanks.<br>
<br>
<br>
&gt; <br>
&gt; -Akhil.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (param) {<br>
&gt;&gt; diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/m=
sm_gpu.h<br>
&gt;&gt; index ff911e7305ce..f18b0a91442b 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/msm/msm_gpu.h<br>
&gt;&gt; +++ b/drivers/gpu/drm/msm/msm_gpu.h<br>
&gt;&gt; @@ -214,6 +214,9 @@ struct msm_gpu {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* does gpu need hw_init? */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool needs_hw_init;<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 /* is the GPU shutdown? */<br>
&gt;&gt; +=C2=A0 =C2=A0 bool is_shutdown;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /**<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* global_faults: number of GPU hangs not=
 attributed to a particular<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* address space<br>
&gt; <br>
</blockquote></div></div>

--000000000000e25ec205ed394a59--
