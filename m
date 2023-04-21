Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47606EAD60
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A3210E136;
	Fri, 21 Apr 2023 14:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFF310E117;
 Fri, 21 Apr 2023 14:47:38 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-54506afdf60so1087324eaf.3; 
 Fri, 21 Apr 2023 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682088458; x=1684680458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAwI0yg9WCInaUBDZHNmqnH27+7wnxjMyrBSbxHa2mc=;
 b=ADEXJC7ZMvrax6r5VbF0oOv00n80OjXuX8m3+mi/eo/TrXRCaA6eL//tKK+39bvKxl
 wBMppQyLnM+zWtqDBkmcz7qN4/6ZPOrBJEZ+of2C/GFfhLml6fiShuFHmZwc15W8ofGq
 3VV6wjUVzRF8uP+ZK2zqr2nc1jv4aMDyWI41b/3oWpkb9PqZoD3vbG69C55COF4WEkpc
 KhfmOWTlmZm9h8AaWQWaF37t3wOoh9jTJIEi4IaEaCzcmdtnQIAMn+Vpdnu6qzyYbF7H
 qjrZvbC+YtrMqnHTDmDDxFeOm2EvjX/ayGbHNesrlrhjRwNoopCbsVi0BUic8Xc0pCRF
 4grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682088458; x=1684680458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAwI0yg9WCInaUBDZHNmqnH27+7wnxjMyrBSbxHa2mc=;
 b=ikeKaIGatWNpgaDAFw+fcHvii41Ae6Gby1BFLN2PglknaUCkK+e12RO2FyZvitYoZS
 IjUrPSlsWywASjMp+qASJ/Qj/kk9iwsS4PGYbzCZp+3P+hRQm/vg3CHSPntGIfLNTxkV
 5jdFKCQH+92Wx1CSufpAov1FhSddoXlCufgrMv25FxauA9/6b5V7kjRVIGCqF3DAmxpo
 F8Xoa9H30UTZws7ugjM7nnT2UYIBUR8NiF4ncnVutvXnp/7Fz2A4p9m1ibtowcCSW/9X
 IcNyHYOTwx9rnb4pLAMUBll0UKjZo0yU6GVu5HovE1S1TStkArd+o6KeYG6I7FYvJm5d
 SZzg==
X-Gm-Message-State: AAQBX9dIXGL4dILezTwKhkQXYc//SVM7xDw/x8oODGxBvcewUSILXqjy
 RPWKg4q/U1CcdmlT72rDypclC//Jom8LYQvgVSE=
X-Google-Smtp-Source: AKy350Y+MqFWS9h4a70MQIbv/HzLMSpc59V2UkYw8fGc23sK45NtH3EMLjTtxDvOjUWpZHPMk9T+QSHE0EtXYKQoDrs=
X-Received: by 2002:a05:6820:134b:b0:545:d0b1:33a9 with SMTP id
 b11-20020a056820134b00b00545d0b133a9mr1290318oow.1.1682088457873; Fri, 21 Apr
 2023 07:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-3-robdclark@gmail.com>
 <58977051-197b-f1f0-c795-9037e70d7a91@linux.intel.com>
 <ZD5WLMRNibbRkGQO@phenom.ffwll.local>
 <CAF6AEGugcuV08G_pxjUGvhTbp8DFFG4ws3=oiP5PpbRf=SJdhQ@mail.gmail.com>
 <CACvgo52gByHzwtm4gxqUxZ5yJGTQ5NucBmMHSO7nLPsba3rTfw@mail.gmail.com>
In-Reply-To: <CACvgo52gByHzwtm4gxqUxZ5yJGTQ5NucBmMHSO7nLPsba3rTfw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Apr 2023 07:47:26 -0700
Message-ID: <CAF6AEGtijkCt2uUx98auFcK0GQHY=5GV7CxbOejGz22no6J0GQ@mail.gmail.com>
Subject: Re: [RFC 2/3] drm/msm: Rework get_comm_cmdline() helper
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 2:33=E2=80=AFAM Emil Velikov <emil.l.velikov@gmail.=
com> wrote:
>
> Greeting all,
>
> Sorry for the delay - Easter Holidays, food coma and all that :-)
>
> On Tue, 18 Apr 2023 at 15:31, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Apr 18, 2023 at 1:34=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > >
> > > On Tue, Apr 18, 2023 at 09:27:49AM +0100, Tvrtko Ursulin wrote:
> > > >
> > > > On 17/04/2023 21:12, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Make it work in terms of ctx so that it can be re-used for fdinfo=
.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
> > > > >   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
> > > > >   drivers/gpu/drm/msm/msm_gpu.c           | 13 ++++++-------
> > > > >   drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
> > > > >   drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
> > > > >   5 files changed, 21 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gp=
u/drm/msm/adreno/adreno_gpu.c
> > > > > index bb38e728864d..43c4e1fea83f 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > @@ -412,7 +412,7 @@ int adreno_set_param(struct msm_gpu *gpu, str=
uct msm_file_private *ctx,
> > > > >             /* Ensure string is null terminated: */
> > > > >             str[len] =3D '\0';
> > > > > -           mutex_lock(&gpu->lock);
> > > > > +           mutex_lock(&ctx->lock);
> > > > >             if (param =3D=3D MSM_PARAM_COMM) {
> > > > >                     paramp =3D &ctx->comm;
> > > > > @@ -423,7 +423,7 @@ int adreno_set_param(struct msm_gpu *gpu, str=
uct msm_file_private *ctx,
> > > > >             kfree(*paramp);
> > > > >             *paramp =3D str;
> > > > > -           mutex_unlock(&gpu->lock);
> > > > > +           mutex_unlock(&ctx->lock);
> > > > >             return 0;
> > > > >     }
> > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/=
msm_drv.c
> > > > > index 3d73b98d6a9c..ca0e89e46e13 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > @@ -581,6 +581,8 @@ static int context_init(struct drm_device *de=
v, struct drm_file *file)
> > > > >     rwlock_init(&ctx->queuelock);
> > > > >     kref_init(&ctx->ref);
> > > > > +   ctx->pid =3D get_pid(task_pid(current));
> > > >
> > > > Would it simplify things for msm if DRM core had an up to date file=
->pid as
> > > > proposed in
> > > > https://patchwork.freedesktop.org/patch/526752/?series=3D109902&rev=
=3D4 ? It
> > > > gets updated if ioctl issuer is different than fd opener and this b=
eing
> > > > context_init here reminded me of it. Maybe you wouldn't have to tra=
ck the
> > > > pid in msm?
> >
> > The problem is that we also need this for gpu devcore dumps, which
> > could happen after the drm_file is closed.  The ctx can outlive the
> > file.
> >
> I think we all kept forgetting about that. MSM had support for ages,
> while AMDGPU is the second driver to land support - just a release
> ago.
>
> > But the ctx->pid has the same problem as the existing file->pid when
> > it comes to Xorg.. hopefully over time that problem just goes away.
>
> Out of curiosity: what do you mean with "when it comes to Xorg" - the
> "was_master" handling or something else?

The problem is that Xorg is the one to open the drm fd, and then
passes the fd to the client.. so the pid of drm_file is the Xorg pid,
not the client.  Making it not terribly informative.

Tvrtko's patch he linked above would address that for drm_file, but
not for other driver internal usages.  Maybe it could be wired up as a
helper so that drivers don't have to re-invent that dance.  Idk, I
have to think about it.

Btw, with my WIP drm sched fence signalling patch lockdep is unhappy
when gpu devcore dumps are triggered.  I'm still pondering how to
decouple the locking so that anything coming from fs (ie.
show_fdinfo()) is decoupled from anything that happens in the fence
signaling path.  But will repost this series once I get that sorted
out.

BR,
-R

>
> > guess I could do a similar dance to your patch to update the pid
> > whenever (for ex) a submitqueue is created.
> >
> > > Can we go one step further and let the drm fdinfo stuff print these n=
ew
> > > additions? Consistency across drivers and all that.
> >
> > Hmm, I guess I could _also_ store the overridden comm/cmdline in
> > drm_file.  I still need to track it in ctx (msm_file_private) because
> > I could need it after the file is closed.
> >
> > Maybe it could be useful to have a gl extension to let the app set a
> > name on the context so that this is useful beyond native-ctx (ie.
> > maybe it would be nice to see that "chrome: lwn.net" is using less gpu
> > memory than "chrome: phoronix.com", etc)
> >
>
> /me awaits for the series to hit the respective websites ;-)
>
> But seriously - the series from Tvrtko (thanks for the link, will
> check in a moment) makes sense. Although given the livespan issue
> mentioned above, I don't think it's applicable here.
>
> So if it were me, I would consider the two orthogonal for the
> short/mid term. Fwiw this and patch 1/3 are:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> HTH
> -Emil
