Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7096F077D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 16:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA2E10EB59;
	Thu, 27 Apr 2023 14:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301B010EB59;
 Thu, 27 Apr 2023 14:31:54 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-38e7ce73ca0so4685027b6e.2; 
 Thu, 27 Apr 2023 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682605913; x=1685197913;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRZglDXB91+6f7S2dtMlSBFPaJiJ8/S98Gq1cNjaW8Q=;
 b=ZKUcLKH4jO6eUX11CsiFYAsZQboMzOTzukH+ORISmxFF2yQ6T96vWRnvS+xlwUtwBa
 0lqB7EnRVZbvDdY3i/V2xRzDCoFsKupg4xJATdLTpURRqY/9Vxst5iEaonxWZ5wxly9z
 LuYos6Wfwy4zeY0uKGYtwiUZmPFCX6HPuEvJBMTzrjYvbgjpbo0R/rfbi6OtH/y5fokF
 ox4hlGFE/1Cd5bnL7ekHeSYnvNMGcOGVME2PuLgyDk6ln934sI8x9H/Qh2O3jR1ppVIQ
 vIYOrx0EUjA2AOMXAj+u4tkcCLv9qcWv1gxGAe0LPtm0SALsFtgQBovdiAcxxEM8PDi6
 AnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682605913; x=1685197913;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRZglDXB91+6f7S2dtMlSBFPaJiJ8/S98Gq1cNjaW8Q=;
 b=aOL+vOc7I5xT+Vt6iisSYjnNLfBDL4tJwIH5NljbHCqlinfvSdgSIzP6cTgsofBgnN
 8lpf3nhlAlTKOBzopAprQqGr3smwavbSYOkT9gNrmxfEvOe2oAdfD2W0HDO13P2ixuWp
 1/8cU8Tz2Fjbq3MswrUjsZWkfYGfY3n7FiRymFHi0dM1cCXPdzS4hGof3L8T55502pgf
 axWrjt/QirDtBYH92k0rNXCir9Gp0I896CFs3c6MnKbBy/oW2pgGV5u5bdLocfbJSUaQ
 Au9W1tKxA+4avRLIa1VzvH9ZHKRX7voQbYGjvhV4ENsbHgxjaqb7hjbex4VDX/gjwbVl
 KSpw==
X-Gm-Message-State: AC+VfDzdoiT8rUz0nb+bVFqYVgR+agfNsZyIBa4ZJpMQvZM2NpXyeJVu
 Oahic33tSSgFnE23BHPdX3Ld0U6EuiasKnMiX5E=
X-Google-Smtp-Source: ACHHUZ5vqvrwk+VgTL9ZXd2NM5nRRwBWWe3P4jFrzMD7s6MUMokZJiESSfjBOx9isBUa3M10jk9ZUbOD9YRpwoIy1vg=
X-Received: by 2002:a05:6808:914:b0:38c:1acd:e6ee with SMTP id
 w20-20020a056808091400b0038c1acde6eemr799313oih.9.1682605911323; Thu, 27 Apr
 2023 07:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-3-robdclark@gmail.com>
 <58977051-197b-f1f0-c795-9037e70d7a91@linux.intel.com>
 <ZD5WLMRNibbRkGQO@phenom.ffwll.local>
 <CAF6AEGugcuV08G_pxjUGvhTbp8DFFG4ws3=oiP5PpbRf=SJdhQ@mail.gmail.com>
 <CACvgo52gByHzwtm4gxqUxZ5yJGTQ5NucBmMHSO7nLPsba3rTfw@mail.gmail.com>
 <CAF6AEGtijkCt2uUx98auFcK0GQHY=5GV7CxbOejGz22no6J0GQ@mail.gmail.com>
 <ZEpC5xEZ4cueb881@phenom.ffwll.local>
In-Reply-To: <ZEpC5xEZ4cueb881@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Apr 2023 07:31:39 -0700
Message-ID: <CAF6AEGs5ROH0xqCwZKs2JaUvoOiEOmyqneLCW9eQDOJhPqNLFQ@mail.gmail.com>
Subject: Re: [RFC 2/3] drm/msm: Rework get_comm_cmdline() helper
To: Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, 
 Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
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

On Thu, Apr 27, 2023 at 2:39=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Fri, Apr 21, 2023 at 07:47:26AM -0700, Rob Clark wrote:
> > On Fri, Apr 21, 2023 at 2:33=E2=80=AFAM Emil Velikov <emil.l.velikov@gm=
ail.com> wrote:
> > >
> > > Greeting all,
> > >
> > > Sorry for the delay - Easter Holidays, food coma and all that :-)
> > >
> > > On Tue, 18 Apr 2023 at 15:31, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Tue, Apr 18, 2023 at 1:34=E2=80=AFAM Daniel Vetter <daniel@ffwll=
.ch> wrote:
> > > > >
> > > > > On Tue, Apr 18, 2023 at 09:27:49AM +0100, Tvrtko Ursulin wrote:
> > > > > >
> > > > > > On 17/04/2023 21:12, Rob Clark wrote:
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > Make it work in terms of ctx so that it can be re-used for fd=
info.
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > ---
> > > > > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
> > > > > > >   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
> > > > > > >   drivers/gpu/drm/msm/msm_gpu.c           | 13 ++++++-------
> > > > > > >   drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
> > > > > > >   drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
> > > > > > >   5 files changed, 21 insertions(+), 11 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/driver=
s/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > > > index bb38e728864d..43c4e1fea83f 100644
> > > > > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > > > @@ -412,7 +412,7 @@ int adreno_set_param(struct msm_gpu *gpu,=
 struct msm_file_private *ctx,
> > > > > > >             /* Ensure string is null terminated: */
> > > > > > >             str[len] =3D '\0';
> > > > > > > -           mutex_lock(&gpu->lock);
> > > > > > > +           mutex_lock(&ctx->lock);
> > > > > > >             if (param =3D=3D MSM_PARAM_COMM) {
> > > > > > >                     paramp =3D &ctx->comm;
> > > > > > > @@ -423,7 +423,7 @@ int adreno_set_param(struct msm_gpu *gpu,=
 struct msm_file_private *ctx,
> > > > > > >             kfree(*paramp);
> > > > > > >             *paramp =3D str;
> > > > > > > -           mutex_unlock(&gpu->lock);
> > > > > > > +           mutex_unlock(&ctx->lock);
> > > > > > >             return 0;
> > > > > > >     }
> > > > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/=
msm/msm_drv.c
> > > > > > > index 3d73b98d6a9c..ca0e89e46e13 100644
> > > > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > > > @@ -581,6 +581,8 @@ static int context_init(struct drm_device=
 *dev, struct drm_file *file)
> > > > > > >     rwlock_init(&ctx->queuelock);
> > > > > > >     kref_init(&ctx->ref);
> > > > > > > +   ctx->pid =3D get_pid(task_pid(current));
> > > > > >
> > > > > > Would it simplify things for msm if DRM core had an up to date =
file->pid as
> > > > > > proposed in
> > > > > > https://patchwork.freedesktop.org/patch/526752/?series=3D109902=
&rev=3D4 ? It
> > > > > > gets updated if ioctl issuer is different than fd opener and th=
is being
> > > > > > context_init here reminded me of it. Maybe you wouldn't have to=
 track the
> > > > > > pid in msm?
> > > >
> > > > The problem is that we also need this for gpu devcore dumps, which
> > > > could happen after the drm_file is closed.  The ctx can outlive the
> > > > file.
> > > >
> > > I think we all kept forgetting about that. MSM had support for ages,
> > > while AMDGPU is the second driver to land support - just a release
> > > ago.
> > >
> > > > But the ctx->pid has the same problem as the existing file->pid whe=
n
> > > > it comes to Xorg.. hopefully over time that problem just goes away.
> > >
> > > Out of curiosity: what do you mean with "when it comes to Xorg" - the
> > > "was_master" handling or something else?
> >
> > The problem is that Xorg is the one to open the drm fd, and then
> > passes the fd to the client.. so the pid of drm_file is the Xorg pid,
> > not the client.  Making it not terribly informative.
> >
> > Tvrtko's patch he linked above would address that for drm_file, but
> > not for other driver internal usages.  Maybe it could be wired up as a
> > helper so that drivers don't have to re-invent that dance.  Idk, I
> > have to think about it.
> >
> > Btw, with my WIP drm sched fence signalling patch lockdep is unhappy
> > when gpu devcore dumps are triggered.  I'm still pondering how to
> > decouple the locking so that anything coming from fs (ie.
> > show_fdinfo()) is decoupled from anything that happens in the fence
> > signaling path.  But will repost this series once I get that sorted
> > out.
>
> So the cleanest imo is that you push most of the capturing into a worker
> that's entirely decoupled. If you have terminal context (i.e. on first
> hang they stop all further cmd submission, which is anyway what
> vk/arb_robustness want), then you don't have to capture at tdr time,
> because there's no subsequent batch that will wreck the state.

It is already in a worker, but we (a) need to block other contexts
from submitting while at the same time (b) using the GPU itself to
capture its state.. (yes, the way the hw works is overly complicated
in this regard)

> But it only works if your gpu ctx don't have recoverable semantics.

We do have recoverable semantics.. but that is pretty orthogonal.  We
just need a different lock.. I have a plan to move (a copy) of the
override strings to drm_file with it's own locking decoupled from what
we need in the recovery path.. and hopefully will finally have time to
type it up today and post it (just before disappearing off into the
woods to go backpacking ;-))

BR,
-R

> If you can't do that it's a _lot_ of GFP_ATOMIC and trylock and bailing
> out if any fails :-/
> -Daniel
>
> >
> > BR,
> > -R
> >
> > >
> > > > guess I could do a similar dance to your patch to update the pid
> > > > whenever (for ex) a submitqueue is created.
> > > >
> > > > > Can we go one step further and let the drm fdinfo stuff print the=
se new
> > > > > additions? Consistency across drivers and all that.
> > > >
> > > > Hmm, I guess I could _also_ store the overridden comm/cmdline in
> > > > drm_file.  I still need to track it in ctx (msm_file_private) becau=
se
> > > > I could need it after the file is closed.
> > > >
> > > > Maybe it could be useful to have a gl extension to let the app set =
a
> > > > name on the context so that this is useful beyond native-ctx (ie.
> > > > maybe it would be nice to see that "chrome: lwn.net" is using less =
gpu
> > > > memory than "chrome: phoronix.com", etc)
> > > >
> > >
> > > /me awaits for the series to hit the respective websites ;-)
> > >
> > > But seriously - the series from Tvrtko (thanks for the link, will
> > > check in a moment) makes sense. Although given the livespan issue
> > > mentioned above, I don't think it's applicable here.
> > >
> > > So if it were me, I would consider the two orthogonal for the
> > > short/mid term. Fwiw this and patch 1/3 are:
> > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > >
> > > HTH
> > > -Emil
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
