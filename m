Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76E776041
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 15:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CB010E438;
	Wed,  9 Aug 2023 13:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E4310E438;
 Wed,  9 Aug 2023 13:11:41 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a7556e4edcso583934b6e.1; 
 Wed, 09 Aug 2023 06:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691586700; x=1692191500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bsfHSbir+1N3BPwsEF83+v9jo06cZjJVauWxQE2x88=;
 b=X39VyQ81ASYk/nBdQF2k0zkOJr/0vtM4ZpjXBKvnXgqH0R4bVOzYwN862VOzrR+xcj
 x3FpupRMsRy7LDq7LpyqF25wC6tbW75E04I9YjPO14TSPjRX6C5prULvlJsGvEEptNVm
 +KaJ1dgo9yDYvvU9xgG4hPh/jBo2jN+cWTaB9vM2sw0taGzXVXkI09vm9gjv3YdsbQfq
 fVPylz6eN+KR5L6QcKAbs2scRSlOmKkbZMpF9eiAuRUCeeiue3+fNiq6cua13K7CE3MR
 iwhCAiADw5MAtzoz2nRqhIRpteROYyPsV+/Zu+9qMzuIk9n/JNtv02kFrJu5jM+1rnUx
 ohVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691586700; x=1692191500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bsfHSbir+1N3BPwsEF83+v9jo06cZjJVauWxQE2x88=;
 b=fILUE4SrgWDIHSkLDf61gx/XFaEU5i7KWqgj059q6AddGOk0O9HuzrGHMLGpLG2rUV
 PS38aYZdlPFj8NoJqhD4T3G7gFN4F80i4OrmgabUAM6N5WFtVcNe3liAn6njApr7zXgr
 omuwhDcmq66GYuSmQGRUYI10QPPBdUbZhSuAqLz4dk/mWEWt/3IfrZ6fHsnP1HXiN77L
 0CfZWvFu4FJG8nvW94SUWiRe2KfgMiW3QDkdr6+3hfxMwBJ55uzl19E9kfxHgB0//8/p
 Uk4nqSJkHpbqJ93jQmU7I9B5GuLK7LU34QqcCSq6hbKq9mUBAmz44oJwtg0PX1LDhYXa
 hoXA==
X-Gm-Message-State: AOJu0YyDpKzzsluzgpc/5bTJDpcaYeE0c3vDoAamfbRFfiOeQDXbIIvQ
 qq6vxMMbT2pSYioTP3CVJ32FUi+NKpBapS8tK+k=
X-Google-Smtp-Source: AGHT+IGr/N7x0qp/tLHJD9vnx3F+mQLn8Qo3mYlXKDAIof/DZHtBXv2c6gcV9z6BHmLltXrWKyQrwzMGuJze0KPjlPM=
X-Received: by 2002:aca:bb0b:0:b0:3a7:46c4:e8cd with SMTP id
 l11-20020acabb0b000000b003a746c4e8cdmr8330814oif.12.1691586700314; Wed, 09
 Aug 2023 06:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
 <20230809034445.434902-2-ruanjinjie@huawei.com>
 <c2b0d96e-b768-b295-c672-3ae52e14b10b@amd.com>
In-Reply-To: <c2b0d96e-b768-b295-c672-3ae52e14b10b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Aug 2023 09:11:29 -0400
Message-ID: <CADnq5_MZXYBmxr3dJn4vmW2qAbzUDM0eL48anjCot77LinE8tg@mail.gmail.com>
Subject: Re: [PATCH -next 1/7] drm/amdkfd: Remove unnecessary NULL values
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: kherbst@redhat.com, wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, mairacanal@riseup.net, kraxel@redhat.com,
 alim.akhtar@samsung.com, marijn.suijten@somainline.org,
 arthurgrillo@riseup.net, Charlene.Liu@amd.com,
 linux-samsung-soc@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>,
 Rodrigo.Siqueira@amd.com, krzysztof.kozlowski@linaro.org,
 amd-gfx@lists.freedesktop.org, quic_vpolimer@quicinc.com,
 tony.tascioglu@amd.com, aurabindo.pillai@amd.com, bskeggs@redhat.com,
 george.shen@amd.com, kyungmin.park@samsung.com, haoping.liu@amd.com,
 javierm@redhat.com, sunpeng.li@amd.com, linux-arm-msm@vger.kernel.org,
 jiasheng@iscas.ac.cn, quic_abhinavk@quicinc.com, mripard@kernel.org,
 alexander.deucher@amd.com, davidgow@google.com, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, noralf@tronnes.org,
 paulo.miguel.almeida.rodenas@gmail.com, chiahsuan.chung@amd.com, drv@mailo.com,
 tales.aparecida@gmail.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, jaehyun.chung@amd.com, tzimmermann@suse.de,
 dmitry.baryshkov@linaro.org, jose.exposito89@gmail.com,
 freedreno@lists.freedesktop.org, sancchen@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 9, 2023 at 2:15=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 09.08.23 um 05:44 schrieb Ruan Jinjie:
> > The NULL initialization of the pointers assigned by kzalloc() first is
> > not necessary, because if the kzalloc() failed, the pointers will be
> > assigned NULL, otherwise it works as usual. so remove it.
> >
> > Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for this one=
,
> the amd display code and the radeon stuff.
>
> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu=
/drm/amd/amdkfd/kfd_mqd_manager.c
> > index 863cf060af48..d01bb57733b3 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> > @@ -48,7 +48,7 @@ int pipe_priority_map[] =3D {
> >
> >   struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev, struct que=
ue_properties *q)
> >   {
> > -     struct kfd_mem_obj *mqd_mem_obj =3D NULL;
> > +     struct kfd_mem_obj *mqd_mem_obj;
> >
> >       mqd_mem_obj =3D kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
> >       if (!mqd_mem_obj)
> > @@ -64,7 +64,7 @@ struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node =
*dev, struct queue_properti
> >   struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_node *dev,
> >                                       struct queue_properties *q)
> >   {
> > -     struct kfd_mem_obj *mqd_mem_obj =3D NULL;
> > +     struct kfd_mem_obj *mqd_mem_obj;
> >       uint64_t offset;
> >
> >       mqd_mem_obj =3D kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
>
