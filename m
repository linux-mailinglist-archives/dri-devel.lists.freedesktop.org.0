Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D46EA702
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 11:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7F310EDD6;
	Fri, 21 Apr 2023 09:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C76010EDD6;
 Fri, 21 Apr 2023 09:33:33 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-54f945a7bddso16692937b3.0; 
 Fri, 21 Apr 2023 02:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682069612; x=1684661612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5p6bvHwMyW7lziwaSul4O5r1HMCPQXOQK/D0l6nW90=;
 b=g8MjhIQdjGxLoIgiSzKatFf1xYtIgKS+bgDQB5OL6VoUyZdmddgHFb5qfO5OJill7Z
 8dQb6jeaSwzQQtj2TqMXja/EAPmlhsau7pg4EMgeBLOYNGFWk/pQdKHbnOfhm+NCAxaK
 +gsMoJaptHLN+8nd6dK03DF7CWAUayErFT4o6Lerc4z06gz8O1Hty3S01Sy3+ZuTmUx9
 BOdYy+2ttz5CteUy7k6Q+DUfdU9FjDbmMB9VlI2uRzvqP+9ep4U/2TzbPpcT8Y9v42+5
 v4pTtgw93Fm8ERP2TDy4amJR9Fmc8falWud21v6z1OBwlY/I3vyKeGhpwuaGnvIZY0jI
 BuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069612; x=1684661612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5p6bvHwMyW7lziwaSul4O5r1HMCPQXOQK/D0l6nW90=;
 b=bWLbpsm5AjvnT9ZZJK3kRCe1JxlTDhjvI9LBleFCCdObvIjWdVaFDCiZiuvDgVDRTs
 EkMsnEhumypyFMzeuVi4HS+35KqPcCqcNuOJH8HUxiNgH9Y/lRrFv7RpZNUPW0OLTm0J
 FT3vQv6/WqrNccuzM2KEkk9wcgfKML0vbGEYr6dTm+wjxF5Zanuds7mF+urBlawIyTjw
 WdCH/naoO9HA/pSf2pjc5YLRYEhpA8UCmXk6KXRDLJlJgfLjsldtfIWpG4oE3ere8DTP
 ZAV27Mhd8W7xLnF1aMtGswtiPKnij+VYywxO6g3oVAc8yFxwUt9SCtCQbSgQiLMa4E+M
 ujmQ==
X-Gm-Message-State: AAQBX9f7csPwVEo4gAh4dK9eGkHTv8QMpTLDLLeH6kER3d7JaKvwe/dh
 Zat+Afk23c7Zv2AIToetb+wMMpRPwj1IXSMfrgE=
X-Google-Smtp-Source: AKy350aJAz949U56arY/RpcI9y4j/0DW6OJo5Grq9qVA9gs8hIZAx1lt/+6V34ibq32dXRhlt1z8YItoigsBMzaWfQQ=
X-Received: by 2002:a0d:c2c1:0:b0:552:c551:9cff with SMTP id
 e184-20020a0dc2c1000000b00552c5519cffmr1131888ywd.21.1682069611741; Fri, 21
 Apr 2023 02:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-3-robdclark@gmail.com>
 <58977051-197b-f1f0-c795-9037e70d7a91@linux.intel.com>
 <ZD5WLMRNibbRkGQO@phenom.ffwll.local>
 <CAF6AEGugcuV08G_pxjUGvhTbp8DFFG4ws3=oiP5PpbRf=SJdhQ@mail.gmail.com>
In-Reply-To: <CAF6AEGugcuV08G_pxjUGvhTbp8DFFG4ws3=oiP5PpbRf=SJdhQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Apr 2023 10:33:20 +0100
Message-ID: <CACvgo52gByHzwtm4gxqUxZ5yJGTQ5NucBmMHSO7nLPsba3rTfw@mail.gmail.com>
Subject: Re: [RFC 2/3] drm/msm: Rework get_comm_cmdline() helper
To: Rob Clark <robdclark@gmail.com>
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

Greeting all,

Sorry for the delay - Easter Holidays, food coma and all that :-)

On Tue, 18 Apr 2023 at 15:31, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Apr 18, 2023 at 1:34=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> w=
rote:
> >
> > On Tue, Apr 18, 2023 at 09:27:49AM +0100, Tvrtko Ursulin wrote:
> > >
> > > On 17/04/2023 21:12, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Make it work in terms of ctx so that it can be re-used for fdinfo.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
> > > >   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
> > > >   drivers/gpu/drm/msm/msm_gpu.c           | 13 ++++++-------
> > > >   drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
> > > >   drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
> > > >   5 files changed, 21 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/=
drm/msm/adreno/adreno_gpu.c
> > > > index bb38e728864d..43c4e1fea83f 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > @@ -412,7 +412,7 @@ int adreno_set_param(struct msm_gpu *gpu, struc=
t msm_file_private *ctx,
> > > >             /* Ensure string is null terminated: */
> > > >             str[len] =3D '\0';
> > > > -           mutex_lock(&gpu->lock);
> > > > +           mutex_lock(&ctx->lock);
> > > >             if (param =3D=3D MSM_PARAM_COMM) {
> > > >                     paramp =3D &ctx->comm;
> > > > @@ -423,7 +423,7 @@ int adreno_set_param(struct msm_gpu *gpu, struc=
t msm_file_private *ctx,
> > > >             kfree(*paramp);
> > > >             *paramp =3D str;
> > > > -           mutex_unlock(&gpu->lock);
> > > > +           mutex_unlock(&ctx->lock);
> > > >             return 0;
> > > >     }
> > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/ms=
m_drv.c
> > > > index 3d73b98d6a9c..ca0e89e46e13 100644
> > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > @@ -581,6 +581,8 @@ static int context_init(struct drm_device *dev,=
 struct drm_file *file)
> > > >     rwlock_init(&ctx->queuelock);
> > > >     kref_init(&ctx->ref);
> > > > +   ctx->pid =3D get_pid(task_pid(current));
> > >
> > > Would it simplify things for msm if DRM core had an up to date file->=
pid as
> > > proposed in
> > > https://patchwork.freedesktop.org/patch/526752/?series=3D109902&rev=
=3D4 ? It
> > > gets updated if ioctl issuer is different than fd opener and this bei=
ng
> > > context_init here reminded me of it. Maybe you wouldn't have to track=
 the
> > > pid in msm?
>
> The problem is that we also need this for gpu devcore dumps, which
> could happen after the drm_file is closed.  The ctx can outlive the
> file.
>
I think we all kept forgetting about that. MSM had support for ages,
while AMDGPU is the second driver to land support - just a release
ago.

> But the ctx->pid has the same problem as the existing file->pid when
> it comes to Xorg.. hopefully over time that problem just goes away.

Out of curiosity: what do you mean with "when it comes to Xorg" - the
"was_master" handling or something else?

> guess I could do a similar dance to your patch to update the pid
> whenever (for ex) a submitqueue is created.
>
> > Can we go one step further and let the drm fdinfo stuff print these new
> > additions? Consistency across drivers and all that.
>
> Hmm, I guess I could _also_ store the overridden comm/cmdline in
> drm_file.  I still need to track it in ctx (msm_file_private) because
> I could need it after the file is closed.
>
> Maybe it could be useful to have a gl extension to let the app set a
> name on the context so that this is useful beyond native-ctx (ie.
> maybe it would be nice to see that "chrome: lwn.net" is using less gpu
> memory than "chrome: phoronix.com", etc)
>

/me awaits for the series to hit the respective websites ;-)

But seriously - the series from Tvrtko (thanks for the link, will
check in a moment) makes sense. Although given the livespan issue
mentioned above, I don't think it's applicable here.

So if it were me, I would consider the two orthogonal for the
short/mid term. Fwiw this and patch 1/3 are:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

HTH
-Emil
