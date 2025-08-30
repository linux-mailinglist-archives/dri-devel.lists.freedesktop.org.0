Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6FAB3C92A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 10:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888C910E10A;
	Sat, 30 Aug 2025 08:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="P+DVXkog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327C10E10A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 08:12:46 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4b30f73cb05so12908041cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756541565; x=1757146365;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfWv4prrdowDTBmUkPtfk9uVwo5ON7JamPmwAZU/yVc=;
 b=P+DVXkog8ytY82PNPia0PNC1esWOEr7taHyL56/dYWIMf7VjrZEGtuRvLMgr+EKz99
 029aKToyWv7LabwbzSKMe3rSH6T8GcYLPnVvovqakRZHl+XzOy/7cfa7bAGRzZvC6UzG
 HWUPhD2TCserK7bdLtKMdX1mDPjNBaWY6074rZvIjHYMswipNFGLrH1dJ1wpF1aaOtGB
 AaCOzp0JNJ/Xhtai1bcuFmyX0P9SyIW1CVnfNgvua6PNxr03/RAdLB6Ap7DnP2GRsA6j
 gnoFFTEKozg708tK/qlj8SIas09befQAd3L2mxIRnVYz5ujdqw2NR6aN+4BCKRIZT9KX
 Xfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756541565; x=1757146365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfWv4prrdowDTBmUkPtfk9uVwo5ON7JamPmwAZU/yVc=;
 b=iVf7UphJ25WOWh4svtvF2+uXP7z+GcQofDUuAHq2m3IhyBGFKSVd1Nz1zrIv3xmzm0
 F+wmJUvV1PISl3dkcfPHDsqXTTW+Ofcn+Y8kfwBw/z3++A0gC3qZfpMgkvbBuURwE/1O
 13XZlDUcE4MHRmlUuv0K6VL7/B3gOFEvth1Zt+phPHvgOVzbQzXYwlLeXLbP05uh21Rm
 ytI3AIX9tmIEYp2ADmKAZXaL8rX6p9JVJrAnVEhrXtR7lKs3vQeKgCe+9NIx/D1VFR8p
 Yax3eHLTiPHhzclYE3JEsP4OXTxE2Hv/59/6w2iLdv5rYYpA5q106e68W+QvxNFWxi7e
 /EGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpENbYqxLSNlDa/Mq7cnguEc84VfdhrMxSCiYBJ0YJzXO4fabF/1te914xO1OcaDgesU09ghqdgXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhJnSwnzlO/BA/hnmVA1yIxZyy8k+W+YihOebtYlaSzUIBxT2D
 Nt6V7imp76uSd4JEwVmKMqg7W9WVsHSESeMT5UOsa1mNd86cHHyAVrNbrN0gXiU0WRe/wH4oLjU
 J9fum+cX8ePUqS216HXsCoarJ56Fh5qaOqZC6SX+Ibw==
X-Gm-Gg: ASbGncuulTKFyn7fCD4HmqzZFhcgiQode2W2b+alnkXjymGHwU15/bKBrNE1aqm7UjW
 kX2ksVWe4CXWdDM5N9kjaXqDENH21qWE08xAEWd2nbUYL91PSB439ylQaX4mEkyjBo+zK0l2tlM
 hS4WMNrcr6fQlLamDNJyIN/66my8MamQ8N2otFKVPPSb1KFDNSniATEDy+H03JTHZtrwXd4bC9m
 3Z8YB+0vRz+auJX
X-Google-Smtp-Source: AGHT+IHXCe3+isolSowvj52vPfZFAqc+RvEUdglTXP7OQ69Qhl6T6sywHroI7ZM8kmbDsLRCBAYAnPdmB2rOENhB2BU=
X-Received: by 2002:ac8:5d49:0:b0:4b2:8ac4:ef72 with SMTP id
 d75a77b69052e-4b31dcd0d89mr14606561cf.65.1756541564953; Sat, 30 Aug 2025
 01:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
 <20250828023422.2404784-4-adrian.larumbe@collabora.com>
In-Reply-To: <20250828023422.2404784-4-adrian.larumbe@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 10:12:32 +0200
X-Gm-Features: Ac12FXxaaZz1i24uI1HHJ8SGYKOXczq00VFZTcqupeELMswfWEFcq2TpaHOaYmQ
Message-ID: <CAPj87rMRkmkG2MJVnh-zMiNXJ-=fW2jzS_mX7WWWQi3hZmHUyg@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panfrost: Introduce JM context for manging job
 resources
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

Hi Adrian,

On Thu, 28 Aug 2025 at 04:35, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
> +int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
>  {
> -       struct panfrost_device *pfdev =3D panfrost_priv->pfdev;
> -       int i;
> +       struct panfrost_file_priv *priv =3D file->driver_priv;
> +       struct panfrost_device *pfdev =3D priv->pfdev;
> +       struct panfrost_jm_ctx *jm_ctx;
>
> -       for (i =3D 0; i < NUM_JOB_SLOTS; i++)
> -               drm_sched_entity_destroy(&panfrost_priv->sched_entity[i])=
;
> +       jm_ctx =3D xa_erase(&priv->jm_ctxs, handle);
> +       if (!jm_ctx)
> +               return -EINVAL;
> +
> +       for (u32 i =3D 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
> +               if (jm_ctx->slots[i].enabled)
> +                       drm_sched_entity_destroy(&jm_ctx->slots[i].sched_=
entity);
> +       }
>
>         /* Kill in-flight jobs */
>         spin_lock(&pfdev->js->job_lock);
> -       for (i =3D 0; i < NUM_JOB_SLOTS; i++) {
> -               struct drm_sched_entity *entity =3D &panfrost_priv->sched=
_entity[i];
> -               int j;
> +       for (u32 i =3D 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
> +               struct drm_sched_entity *entity =3D &jm_ctx->slots[i].sch=
ed_entity;
> +
> +               if (!jm_ctx->slots[i].enabled)
> +                       continue;
>
> -               for (j =3D ARRAY_SIZE(pfdev->jobs[0]) - 1; j >=3D 0; j--)=
 {
> +               for (int j =3D ARRAY_SIZE(pfdev->jobs[0]) - 1; j >=3D 0; =
j--) {
>                         struct panfrost_job *job =3D pfdev->jobs[i][j];
>                         u32 cmd;
>
> @@ -980,18 +1161,7 @@ void panfrost_job_close(struct panfrost_file_priv *=
panfrost_priv)
>                 }
>         }
>         spin_unlock(&pfdev->js->job_lock);
> -}
> -
> -int panfrost_job_is_idle(struct panfrost_device *pfdev)
> -{
> -       struct panfrost_job_slot *js =3D pfdev->js;
> -       int i;
> -
> -       for (i =3D 0; i < NUM_JOB_SLOTS; i++) {
> -               /* If there are any jobs in the HW queue, we're not idle =
*/
> -               if (atomic_read(&js->queue[i].sched.credit_count))
> -                       return false;
> -       }
>
> -       return true;
> +       panfrost_jm_ctx_put(jm_ctx);
> +       return 0;
>  }

It seems odd that both panfrost_jm_ctx_destroy() and
panfrost_jm_ctx_release() share lifetime responsibilities. I'd expect
calling panfrost_jm_ctx_destroy() to just release the xarray handle
and drop the refcount.

I can see why calling panfrost_jm_ctx_destroy() is the one to go try
to cancel the jobs - because the jobs keep a refcount on the context,
so we need to break that cycle somehow. But having both the
handle-release and object-release function drop a ref on the sched
entity seems odd?

It doesn't help much that panfrost_job is used both for actual jobs
(as the type) and the capability for a device to have multiple
job-manager contexts (as a function prefix). Would be great to clean
that up, so you don't have to think about whether e.g.
panfrost_job_close() is actually operating on a panfrost_job, or
operating on multiple panfrost_jm_ctx which operate on multiple
panfrost_job.

Cheers,
Daniel
