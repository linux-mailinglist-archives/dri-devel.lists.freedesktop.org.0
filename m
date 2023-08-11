Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C4779684
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 19:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7D10E6CC;
	Fri, 11 Aug 2023 17:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F0010E070
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 17:53:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bccc9ec02so315634466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1691776404; x=1692381204;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=381ZTU/OK0I85VAdXyn9Aza96NEIc6x+1uRKzMfGnfU=;
 b=1CpK3tev2eIyzUnDI2l/LDm9Du2eqO55MpV51fnIm2sREnkuoI+U+L6/pqCRMEmil9
 hzhYUWbqDarW2L1yup9p0TLrpZi00r4ak7coz5y3tIDf8zkFV4eplihlpix5TgpO1dwG
 W13wG0E9CT0CsQzSJvYHwio2bocB/qCKa9HUzRBzsb70zhmFbNow75Lx3RDkY2G8DSRM
 dPXQGMmhokMzCkiv8gHM2F01e9UCavYeH0/UmW3pkZl+WQTG/ovrcV8PEG2HKkO8KRyu
 pU879dkDBznBn5yxbKriqpxIqvRbuza02QHsSCyUX/pR1PY99ScXS2XkMK513mu5fqrK
 VLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691776404; x=1692381204;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=381ZTU/OK0I85VAdXyn9Aza96NEIc6x+1uRKzMfGnfU=;
 b=i1J8JUQK7h2UYULqWqxxa9axSrB1PPplWjIS9Lp0fOHCJjGNB7RpxglR6B2I/Lqzv/
 JpH8WO9LT5rf60hk7FZqkDOIemfUDYhF1qoMFdZbr6Z+UglulKmRDLxA8lInPiJt9Khz
 mZuBCNJ9M3w6fQtiC2h8EWia53cYzBmaNJMdf0fGR8ZoNzBMXOseiyE5STU5NHIBwfzI
 4tuz7/lpxe9vt2gIkej+3ItB/yE9HG5CNUrKjqbSfxUQ41ODR6nsO28Q6lWOITtkpPJP
 TIKlW/u/oPS4Dx72gIIOgmQs1unggb5oYd5BgW25XQy1yDGR1yLHAFZdd5Cytl5Aawig
 p20w==
X-Gm-Message-State: AOJu0Yz95BZi2YoN2yYPsvzSzhzJQS47CuHFWUeZqGIMXeZvV+UhxFJB
 aFxK1TU0MQsmIKgS9W30PZz+bsJboSEkeI8N5/W+ZQ==
X-Google-Smtp-Source: AGHT+IEVTp0bnNEFruUoI3Y5XzXG2KWUTocP7nU4mX8j7eWtt7m91A37+Xmp7ye0ogUHwt51aBTVY7hTfG8u3m66M6s=
X-Received: by 2002:a17:907:2bdc:b0:96f:a891:36cb with SMTP id
 gv28-20020a1709072bdc00b0096fa89136cbmr2452964ejc.0.1691776403796; Fri, 11
 Aug 2023 10:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230811010632.2473-1-dakr@redhat.com>
In-Reply-To: <20230811010632.2473-1-dakr@redhat.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 11 Aug 2023 12:53:12 -0500
Message-ID: <CAOFGe95PkZJLmsn6H2npPiLuwoWc109a570oOST2N110D+ajHw@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next] drm/nouveau: sched: avoid job races between
 entities
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000096864b0602a963d3"
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
Cc: matthew.brost@intel.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000096864b0602a963d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 8:06=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:

> If a sched job depends on a dma-fence from a job from the same GPU
> scheduler instance, but a different scheduler entity, the GPU scheduler
> does only wait for the particular job to be scheduled, rather than for
> the job to fully complete. This is due to the GPU scheduler assuming
> that there is a scheduler instance per ring. However, the current
> implementation, in order to avoid arbitrary amounts of kthreads, has a
> single scheduler instance while scheduler entities represent rings.
>
> As a workaround, set the DRM_SCHED_FENCE_DONT_PIPELINE for all
> out-fences in order to force the scheduler to wait for full job
> completion for dependent jobs from different entities and same scheduler
> instance.
>
> There is some work in progress [1] to address the issues of firmware
> schedulers; once it is in-tree the scheduler topology in Nouveau should
> be re-worked accordingly.
>
> [1]
> https://lore.kernel.org/dri-devel/20230801205103.627779-1-matthew.brost@i=
ntel.com/
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 3424a1bf6af3..88217185e0f3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -292,6 +292,28 @@ nouveau_job_submit(struct nouveau_job *job)
>         if (job->sync)
>                 done_fence =3D dma_fence_get(job->done_fence);
>
> +       /* If a sched job depends on a dma-fence from a job from the same
> GPU
> +        * scheduler instance, but a different scheduler entity, the GPU
> +        * scheduler does only wait for the particular job to be schedule=
d,
>

s/does only wait/only waits/

Reviewed-by: Faith Ekstrand <faith.ekstrand@collaboralcom>

+        * rather than for the job to fully complete. This is due to the GP=
U
> +        * scheduler assuming that there is a scheduler instance per ring=
.
> +        * However, the current implementation, in order to avoid arbitra=
ry
> +        * amounts of kthreads, has a single scheduler instance while
> scheduler
> +        * entities represent rings.
> +        *
> +        * As a workaround, set the DRM_SCHED_FENCE_DONT_PIPELINE for all
> +        * out-fences in order to force the scheduler to wait for full jo=
b
> +        * completion for dependent jobs from different entities and same
> +        * scheduler instance.
> +        *
> +        * There is some work in progress [1] to address the issues of
> firmware
> +        * schedulers; once it is in-tree the scheduler topology in Nouve=
au
> +        * should be re-worked accordingly.
> +        *
> +        * [1]
> https://lore.kernel.org/dri-devel/20230801205103.627779-1-matthew.brost@i=
ntel.com/
> +        */
> +       set_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &job->done_fence->flags);
> +
>         if (job->ops->armed_submit)
>                 job->ops->armed_submit(job);
>
>
> base-commit: 68132cc6d1bcbc78ade524c6c6c226de42139f0e
> --
> 2.41.0
>
>

--00000000000096864b0602a963d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 10, 2023 at 8:06=E2=80=AF=
PM Danilo Krummrich &lt;<a href=3D"mailto:dakr@redhat.com">dakr@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I=
f a sched job depends on a dma-fence from a job from the same GPU<br>
scheduler instance, but a different scheduler entity, the GPU scheduler<br>
does only wait for the particular job to be scheduled, rather than for<br>
the job to fully complete. This is due to the GPU scheduler assuming<br>
that there is a scheduler instance per ring. However, the current<br>
implementation, in order to avoid arbitrary amounts of kthreads, has a<br>
single scheduler instance while scheduler entities represent rings.<br>
<br>
As a workaround, set the DRM_SCHED_FENCE_DONT_PIPELINE for all<br>
out-fences in order to force the scheduler to wait for full job<br>
completion for dependent jobs from different entities and same scheduler<br=
>
instance.<br>
<br>
There is some work in progress [1] to address the issues of firmware<br>
schedulers; once it is in-tree the scheduler topology in Nouveau should<br>
be re-worked accordingly.<br>
<br>
[1] <a href=3D"https://lore.kernel.org/dri-devel/20230801205103.627779-1-ma=
tthew.brost@intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/dri-devel/20230801205103.627779-1-matthew.brost@intel.com/</a><br=
>
<br>
Signed-off-by: Danilo Krummrich &lt;<a href=3D"mailto:dakr@redhat.com" targ=
et=3D"_blank">dakr@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c | 22 ++++++++++++++++++++++<b=
r>
=C2=A01 file changed, 22 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouv=
eau/nouveau_sched.c<br>
index 3424a1bf6af3..88217185e0f3 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c<br>
@@ -292,6 +292,28 @@ nouveau_job_submit(struct nouveau_job *job)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (job-&gt;sync)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done_fence =3D dma_=
fence_get(job-&gt;done_fence);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If a sched job depends on a dma-fence from a=
 job from the same GPU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * scheduler instance, but a different schedule=
r entity, the GPU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * scheduler does only wait for the particular =
job to be scheduled,<br></blockquote><div><br></div><div>s/does only wait/o=
nly waits/</div><div><br></div><div>Reviewed-by: Faith Ekstrand &lt;faith.e=
kstrand@collaboralcom&gt;</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * rather than for the job to fully complete. T=
his is due to the GPU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * scheduler assuming that there is a scheduler=
 instance per ring.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * However, the current implementation, in orde=
r to avoid arbitrary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * amounts of kthreads, has a single scheduler =
instance while scheduler<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * entities represent rings.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * As a workaround, set the DRM_SCHED_FENCE_DON=
T_PIPELINE for all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * out-fences in order to force the scheduler t=
o wait for full job<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * completion for dependent jobs from different=
 entities and same<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * scheduler instance.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * There is some work in progress [1] to addres=
s the issues of firmware<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * schedulers; once it is in-tree the scheduler=
 topology in Nouveau<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * should be re-worked accordingly.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * [1] <a href=3D"https://lore.kernel.org/dri-d=
evel/20230801205103.627779-1-matthew.brost@intel.com/" rel=3D"noreferrer" t=
arget=3D"_blank">https://lore.kernel.org/dri-devel/20230801205103.627779-1-=
matthew.brost@intel.com/</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &amp;job=
-&gt;done_fence-&gt;flags);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (job-&gt;ops-&gt;armed_submit)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 job-&gt;ops-&gt;arm=
ed_submit(job);<br>
<br>
<br>
base-commit: 68132cc6d1bcbc78ade524c6c6c226de42139f0e<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--00000000000096864b0602a963d3--
