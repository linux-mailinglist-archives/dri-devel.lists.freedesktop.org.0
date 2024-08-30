Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724F966897
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 20:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51B710EAC5;
	Fri, 30 Aug 2024 18:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ndVDx+w8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0936010EAC5;
 Fri, 30 Aug 2024 18:01:38 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-45680233930so12158611cf.3; 
 Fri, 30 Aug 2024 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725040897; x=1725645697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLvYg5qPZOuBa2bLwjdlcUDAONbv8N/Y0QijdwRkes4=;
 b=ndVDx+w89MqQoTO2E5Kwe5sQSo0PlcseBz/awqVwXtZBPCEpzOUmQhRjfuQ0eYNdd4
 qm9bEBIR79hndoNduMD82CPt/bBE1XMrTD81/UtySARXULCAiVGVQI+9Trwg9YFLUUhH
 OJXbh94eQ8PyE1Hi3oJwVIw0kDpmJ8zODLWIwX/TIIiEP9bjwqGLc6LHecc5CvzuR+nW
 P9PWFxDbxgX5pcZZYY8BdNuRxZbe4gimTZ5SXzHl+QXudIBZgE2548RbJQGMO8V7rSMn
 MNE/RvInb2EtKAKXEGo1UFaterQUi63CSa7ZWtwQBpTYpFjYge9kpHr7+JWKWJZCOGvt
 aePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725040897; x=1725645697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HLvYg5qPZOuBa2bLwjdlcUDAONbv8N/Y0QijdwRkes4=;
 b=frEbmqZWvjFf/LJ1k1iDkkx9GBhDcuiyFQCk1H/9x79MdR76e72pad5jxW1WoMjUQw
 97GOrUGXEwKAm5VE/YhrgBJqV4OCDKx748VI/Bl13O5fgbxImvMOwdqqEm9VTEwjrXlN
 rq5O6pHkMcEOIelQW/nxYX7Jxbnb+rv4AjdJc69B+ySp0B2eqyvg+K9qogM6hobOqew4
 6WPyu6aYjuGoJqELVkKTsABUSPMnMpp3+30LIx0oi8u1koxhF9Utf70o0TsEEjY0Vjj/
 f+GWvoRTB2hY3wBCO6hsplgbWI4YZ+HX2ST/1nhIq9+uZgvXQ1dzSRLd1G+MD2y8ODZG
 gppQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVORpNtp5WUbJGzZmf0OEzkMV1sH2E6+Vm3qeFbgY89czZmMdRc+5Hd/VNnqlbeiehG6HOBA4l77QTl@lists.freedesktop.org,
 AJvYcCWL1vjpaB4OQz7MXhDEkAmmi/Dm1lMYipkKnyyeCJnc/smVCaFdJ6t3XFEWXCl+tU4GwnvubC77eaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV0am+Jv2XJi4NakHj+EifQ7Knzn9U9DmrlB+blS7YhzjT407C
 blZVT9FBVNa6P1P9qjct3oNlvBnvGv1eQ2sRTbIx48pHLNeF9G4U+5fRecBW9a4/AT9Wy2HbNsb
 UVj/LRVYKksO+aqlc6GAEEzlipa8=
X-Google-Smtp-Source: AGHT+IFu///hBMmZWnVnZFXWWl3sgqFDNwBWJcs8tlCbuU7dA43zOW8J5u4FcLF2SJo5g8r7eT05NQ0pWhwY2DhDSV0=
X-Received: by 2002:a05:622a:2b4a:b0:44f:f11a:63de with SMTP id
 d75a77b69052e-4567f6fae93mr77951991cf.61.1725040896527; Fri, 30 Aug 2024
 11:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 11:01:23 -0700
Message-ID: <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 921 insertions(+), 9 deletions(-)
>

[snip]

> +
> +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> +               struct msm_gpu_submitqueue *queue)
> +{
> +       void *ptr;
> +
> +       /*
> +        * Create a per submitqueue buffer for the CP to save and restore=
 user
> +        * specific information such as the VPC streamout data.
> +        */
> +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECORD_SIZ=
E,
> +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue->bo_io=
va);

Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
by other proceess's userspace generated cmdstream.

And a similar question for the scratch_bo..  I'd have to give some
thought to what sort of mischief could be had, but generall kernel
mappings that are not MAP_PRIV are a thing to be careful about.

BR,
-R
