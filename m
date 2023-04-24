Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0936ED2C9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544C10E1AF;
	Mon, 24 Apr 2023 16:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E8710E0D7;
 Mon, 24 Apr 2023 16:45:31 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-505934ccc35so8067791a12.2; 
 Mon, 24 Apr 2023 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682354730; x=1684946730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hYQKcBjiiOyw2ggjeCgQ7QYIqIA61gJtV/vmnt8ad8M=;
 b=ULL2efyQCdjXanu/dUzSuSMOIc9L4S49TsnWE+sH8GII/k2aWff+S8ByMMWrbChfiH
 fCwFzNSmVwnnGJFTr7pgjIaczmOW1SYnWYPsjIvSDABiVB5cOpz2uPKiohYvdEBtoDA3
 e8w9kxsj/kqECzPDM87S1fiQ848vJmJZFNns2DUipF/X88rvvfosMvPpDam9+jUlAeeA
 lheH2m6oV+JK/69zmU96YAOaVHXJcQidAphgPcsXu7CWMQWv/AkkeUqJ3QLuuGmQBvFn
 S49cRZRm8fM5Ax9OQ4liEDIYh4kX/ZVo3S7S+V6UOYFivPHXAkzU8QTpf83q38Nw+VQ/
 RFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682354730; x=1684946730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYQKcBjiiOyw2ggjeCgQ7QYIqIA61gJtV/vmnt8ad8M=;
 b=f2jWipjRV9tGTEv5+4pQcI5VAQhYY3AVJ6+abMKOv+RGJh0Mbf9AzksAAcXXoVerNf
 8mJbuYSOwzomaxlR8XpxaGJJ0XHkEkV88BjWNP3L85dGQ0P9iI3dEfrz7JtfiAk+IGXb
 F6vl1cFncQQqPdNd2QwN4+2HfxjyscqpaIj6u1B/1C11o0HFUKpuW3RLVJzUzvnrAnZP
 BxmwkpxJHKQMcp07bVkO3cW8xOrqfuUR1xWYWmpg6R2tL6DH1SZ+uIN6RX8AEgNyY2hu
 I7uCoIDcfO20ZgqzyuO9U7TfdCpms6j9oChqPXfbF8ClrHgjzYyQYSmZSVINhjrgjW4I
 kjCw==
X-Gm-Message-State: AAQBX9cCPhMyWA5S0OzaZ+bpwqjqyWjk1ngvE6ijc2eBd4cXOvLgKU9q
 hMQ/aws4kWZYvy9k8QhG60WCkzDIC3Mcx2vFnQo=
X-Google-Smtp-Source: AKy350ZlFwORCgTLSmzs+EI1IExUKbjPKP8+YyRmFYqxRHOLoSEEBcV3LV2mEjd7BP7H0a5BYkT/dG9oi/jVrTScG2Y=
X-Received: by 2002:a05:6402:2c7:b0:4fa:3b3:c867 with SMTP id
 b7-20020a05640202c700b004fa03b3c867mr12356495edx.17.1682354729833; Mon, 24
 Apr 2023 09:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
In-Reply-To: <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 24 Apr 2023 12:45:16 -0400
Message-ID: <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="0000000000000ed65d05fa17bc24"
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
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-dev@igalia.com, "Deucher, Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000ed65d05fa17bc24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Soft resets are fatal just as hard resets, but no reset is "always fatal".
There are cases when apps keep working depending on which features are
being used. It's still unsafe.

Marek

On Mon, Apr 24, 2023, 03:03 Christian K=C3=B6nig <christian.koenig@amd.com>
wrote:

> Am 24.04.23 um 03:43 schrieb Andr=C3=A9 Almeida:
> > When a DRM job timeout, the GPU is probably hang and amdgpu have some
> > ways to deal with that, ranging from soft recoveries to full device
> > reset. Anyway, when userspace ask the kernel the state of the context
> > (via AMDGPU_CTX_OP_QUERY_STATE), the kernel reports that the device was
> > reset, regardless if a full reset happened or not.
> >
> > However, amdgpu only marks a context guilty in the ASIC reset path. Thi=
s
> > makes the userspace report incomplete, given that on soft recovery path
> > the guilty context is not told that it's the guilty one.
> >
> > Fix this by marking the context guilty for every type of reset when a
> > job timeouts.
>
> The guilty handling is pretty much broken by design and only works
> because we go through multiple hops of validating the entity after the
> job has already been pushed to the hw.
>
> I think we should probably just remove that completely and use an
> approach where we check the in flight submissions in the query state
> IOCTL. See my other patch on the mailing list regarding that.
>
> Additional to that I currently didn't considered soft-recovered
> submissions as fatal and continue accepting submissions from that
> context, but already wanted to talk with Marek about that behavior.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 +++++++-
> >   2 files changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index ac78caa7cba8..ea169d1689e2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -4771,9 +4771,6 @@ int amdgpu_device_pre_asic_reset(struct
> amdgpu_device *adev,
> >
> >       amdgpu_fence_driver_isr_toggle(adev, false);
> >
> > -     if (job && job->vm)
> > -             drm_sched_increase_karma(&job->base);
> > -
> >       r =3D amdgpu_reset_prepare_hwcontext(adev, reset_context);
> >       /* If reset handler not implemented, continue; otherwise return *=
/
> >       if (r =3D=3D -ENOSYS)
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > index c3d9d75143f4..097ed8f06865 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -51,6 +51,13 @@ static enum drm_gpu_sched_stat
> amdgpu_job_timedout(struct drm_sched_job *s_job)
> >       memset(&ti, 0, sizeof(struct amdgpu_task_info));
> >       adev->job_hang =3D true;
> >
> > +     amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> > +
> > +     if (job && job->vm) {
> > +             DRM_INFO("marking %s context as guilty", ti.process_name)=
;
> > +             drm_sched_increase_karma(&job->base);
> > +     }
> > +
> >       if (amdgpu_gpu_recovery &&
> >           amdgpu_ring_soft_recovery(ring, job->vmid,
> s_job->s_fence->parent)) {
> >               DRM_ERROR("ring %s timeout, but soft recovered\n",
> > @@ -58,7 +65,6 @@ static enum drm_gpu_sched_stat
> amdgpu_job_timedout(struct drm_sched_job *s_job)
> >               goto exit;
> >       }
> >
> > -     amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> >       DRM_ERROR("ring %s timeout, signaled seq=3D%u, emitted seq=3D%u\n=
",
> >                 job->base.sched->name,
> atomic_read(&ring->fence_drv.last_seq),
> >                 ring->fence_drv.sync_seq);
>
>

--0000000000000ed65d05fa17bc24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Soft resets are fatal just as hard resets, but no reset i=
s &quot;always fatal&quot;. There are cases when apps keep working dependin=
g on which features are being used. It&#39;s still unsafe.<div dir=3D"auto"=
><div dir=3D"auto"><div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=
=3D"auto">Marek</div></div></div></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 24, 2023, 03:03 Christia=
n K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com">christian.koen=
ig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Am 24.04=
.23 um 03:43 schrieb Andr=C3=A9 Almeida:<br>
&gt; When a DRM job timeout, the GPU is probably hang and amdgpu have some<=
br>
&gt; ways to deal with that, ranging from soft recoveries to full device<br=
>
&gt; reset. Anyway, when userspace ask the kernel the state of the context<=
br>
&gt; (via AMDGPU_CTX_OP_QUERY_STATE), the kernel reports that the device wa=
s<br>
&gt; reset, regardless if a full reset happened or not.<br>
&gt;<br>
&gt; However, amdgpu only marks a context guilty in the ASIC reset path. Th=
is<br>
&gt; makes the userspace report incomplete, given that on soft recovery pat=
h<br>
&gt; the guilty context is not told that it&#39;s the guilty one.<br>
&gt;<br>
&gt; Fix this by marking the context guilty for every type of reset when a<=
br>
&gt; job timeouts.<br>
<br>
The guilty handling is pretty much broken by design and only works <br>
because we go through multiple hops of validating the entity after the <br>
job has already been pushed to the hw.<br>
<br>
I think we should probably just remove that completely and use an <br>
approach where we check the in flight submissions in the query state <br>
IOCTL. See my other patch on the mailing list regarding that.<br>
<br>
Additional to that I currently didn&#39;t considered soft-recovered <br>
submissions as fatal and continue accepting submissions from that <br>
context, but already wanted to talk with Marek about that behavior.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Andr=C3=A9 Almeida &lt;<a href=3D"mailto:andrealmeid@ig=
alia.com" target=3D"_blank" rel=3D"noreferrer">andrealmeid@igalia.com</a>&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0 =C2=A0 | 8 +=
++++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 7 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c<br>
&gt; index ac78caa7cba8..ea169d1689e2 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; @@ -4771,9 +4771,6 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_d=
evice *adev,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_fence_driver_isr_toggle(adev, false);=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (job &amp;&amp; job-&gt;vm)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_sched_increase_ka=
rma(&amp;job-&gt;base);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_reset_prepare_hwcontext(adev, r=
eset_context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If reset handler not implemented, continu=
e; otherwise return */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D -ENOSYS)<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_job.c<br>
&gt; index c3d9d75143f4..097ed8f06865 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c<br>
&gt; @@ -51,6 +51,13 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(=
struct drm_sched_job *s_job)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;ti, 0, sizeof(struct amdgpu_task=
_info));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;job_hang =3D true;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0amdgpu_vm_get_task_info(ring-&gt;adev, job-&gt;pa=
sid, &amp;ti);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (job &amp;&amp; job-&gt;vm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;markin=
g %s context as guilty&quot;, ti.process_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_sched_increase_ka=
rma(&amp;job-&gt;base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (amdgpu_gpu_recovery &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_soft_recovery(ring=
, job-&gt;vmid, s_job-&gt;s_fence-&gt;parent)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;=
ring %s timeout, but soft recovered\n&quot;,<br>
&gt; @@ -58,7 +65,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(s=
truct drm_sched_job *s_job)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0amdgpu_vm_get_task_info(ring-&gt;adev, job-&gt;pa=
sid, &amp;ti);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;ring %s timeout, signaled se=
q=3D%u, emitted seq=3D%u\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0job-&gt;b=
ase.sched-&gt;name, atomic_read(&amp;ring-&gt;fence_drv.last_seq),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ring-&gt;=
fence_drv.sync_seq);<br>
<br>
</blockquote></div>

--0000000000000ed65d05fa17bc24--
