Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB5A07C31
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCECC10EEC2;
	Thu,  9 Jan 2025 15:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2tH1iUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A0410EEC7;
 Thu,  9 Jan 2025 15:44:36 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so32619539f.0; 
 Thu, 09 Jan 2025 07:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736437476; x=1737042276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyvHFgAQemGUxOtGmKefldysG5aDz/1ceoYMUjX+3Nc=;
 b=O2tH1iUn4Wbd/DWy91kUlufnuxg7uERPbJ0PCZ7kiqtnmb8ByrFy/TRXpARyo6IKl0
 yGepvF75sBSTbC7gMw3msD8W7NY/6qlkSuTEOvxIEa3iyiDiCR3hB2pVVdY+CzGrKzJs
 cJ+LA9P725JWexMY+NY+k8fxfPpQycG7QUVnfXCcY/CRGTqIrtp4P2s1+QfQ5x5SMNvy
 jKhNVLL/IF2jT8enTlg1APKhw8gRUGtaGDISRf2MfiN9242EPxaAioVKv4EGIFuyp0N1
 fey894E1UimZgh97C6+Dk9Y4SuZzyIMLFn6P6rSPpTjBpBMXNCOyjhoKu5D/L96+utw5
 uvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736437476; x=1737042276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RyvHFgAQemGUxOtGmKefldysG5aDz/1ceoYMUjX+3Nc=;
 b=jcjb8LPUaJ1v63sQjXLbLiq+EVX9xuZDqu+lNDOHhzQ5hi/Ozt+tgbnefGmc1S1boa
 4Nb/pE2foYAjaclUneN1framm6ztwnzBU4MwSo00HpVDk5BajYot740i93ocbXCuDxCN
 0GFzkMQiyDrGggGI8JaXnsGtUfFRFKPjaNgOBhm701O5zRo7GI+QZ9+Gj2IycAXOqn8E
 PWQFWG4xAH5wajlDLy8DDnIJ+mi4HYDyKOLp9s86XqR64jvPBy4tIHR6rtU6AjbnQR7D
 r1+dHm9PU4nWuTgeGX514g7k9u0yOicYWiHb+aGv+/abnpsPOxO2FtsRu0WSUqeOxfw4
 BuyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLTk1mWoRja9w2f4QVpXuGaLA+SRgNdY1XdYhHnqA7WyYTzwW4XhkoveV15NU6wgOYBxggWMS6XpQ=@lists.freedesktop.org,
 AJvYcCWT7H2N1ltVIXhnWX+BYW3I11+PlTqoWi9rCbThIHQJDfdcpvuh495gkC5hnxdYTyJU2NrOD52wrfDw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi3k3iQr3zdPKuYesFsWZxGXgbftXR19tbxDFsFR9jxLS4rMew
 UIlz5Vz28T+bYade3O7hNTmx/FjUMjtI5RDK0oJEnO7mDRiXCd84kfeF2IFleyBgo0x4+5DVEhg
 nZ0KHV7Kccx0q7PUJd4O/KEvO2wM=
X-Gm-Gg: ASbGnctiinP2veFZEeudrBcY+B3BCW8KHWaw+wGt05BpIueJ6hlcRLlYoEXLf//H2VN
 YnmnFBv6O3NMJpUDXOl9YdFE8Qf3eabmqNjhWebiu9xDWLWmwy6A1kpw7JWbLilnNi9Tl
X-Google-Smtp-Source: AGHT+IH1uHRChV+q9fG3nQmU9PjOCTRBD0DeSzOQ4/o+oVqmyFmooEnJ9LKjoMSqbPXYgcjXxVq5cgZ+OAqRKJgySXs=
X-Received: by 2002:a05:6e02:1d84:b0:3a7:6c5c:9aa4 with SMTP id
 e9e14a558f8ab-3ce3a888392mr56333685ab.12.1736437476062; Thu, 09 Jan 2025
 07:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
 <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
 <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
 <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com>
 <CAF6AEGuFTW4hVursv-EKQ7GfVuUDJ4C0qWS0F+j1jPi+mP_xnA@mail.gmail.com>
 <f9863c54-ca35-476b-b6aa-0eb1c18ec29e@quicinc.com>
In-Reply-To: <f9863c54-ca35-476b-b6aa-0eb1c18ec29e@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Jan 2025 07:44:24 -0800
X-Gm-Features: AbW1kvZyFraHcis8-8bS-LzWqZzHknSnK9_IGXuJYlkQtzj04wvflqCRVla3TE4
Message-ID: <CAF6AEGu26n2LELtkGYJnUNahNqvwhZnUDeoyZaSC3dPRg75K+w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async
 path
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, 
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

On Wed, Jan 8, 2025 at 7:14=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
>
>
> On 1/8/2025 7:04 PM, Rob Clark wrote:
> > On Wed, Jan 8, 2025 at 6:22=E2=80=AFPM Abhinav Kumar <quic_abhinavk@qui=
cinc.com> wrote:
> >>
> >>
> >>
> >> On 1/8/2025 6:14 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
> >>>>
> >>>> On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@=
quicinc.com> wrote:
> >>>>>
> >>>>> Force commit that are disabling a plane in the async_crtc to take t=
he
> >>>>> non-async commit tail path.
> >>>>>
> >>>>> In cases where there are two consecutive async cursor updates (one
> >>>>> regular non-NULL update followed by a disabling NULL FB update), it=
 is
> >>>>> possible for the second NULL update to not be queued (due to the
> >>>>> pending_crtc_mask check) or otherwise not be run before the cursor =
FB is
> >>>>> deallocated by drm_atomic_helper_cleanup_planes(). This would cause=
 a
> >>>>> context fault since the hardware would try to fetch the old plane s=
tate
> >>>>> with the stale FB address.
> >>>>>
> >>>>> Avoid this issue by forcing cursor updates that will disable the cu=
rsor
> >>>>> plane to be blocking commits. This will ensure that hardware clears=
 and
> >>>>> stops fetching the FB source address before the driver deallocates =
the FB
> >>>>>
> >>>>> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
> >>>>>    1 file changed, 13 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm=
/msm_atomic.c
> >>>>> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34c=
a631dd28d4cdc2b8c7dc0 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_atomic.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> >>>>> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_stat=
e *state,
> >>>>>           struct drm_connector_state *connector_state;
> >>>>>           struct drm_connector *connector;
> >>>>>           struct drm_crtc_state *crtc_state;
> >>>>> +       struct drm_plane_state *plane_state;
> >>>>>           struct drm_crtc *crtc;
> >>>>>           int i, num_crtcs =3D 0;
> >>>>>
> >>>>> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_sta=
te *state,
> >>>>>                   *async_crtc =3D crtc;
> >>>>>           }
> >>>>>
> >>>>> +       /*
> >>>>> +        * Force a blocking commit if the cursor is being disabled.=
 This is to
> >>>>> +        * ensure that the registers are cleared and hardware doesn=
't try to
> >>>>> +        * fetch from a stale address.
> >>>>> +        */
> >>>>> +       if (*async_crtc) {
> >>>>> +               plane_state =3D drm_atomic_get_new_plane_state(stat=
e,
> >>>>> +                                                            (*asyn=
c_crtc)->cursor);
> >>>>> +               if (plane_state && !plane_state->fb)
> >>>>> +                       return false;
> >>>>
> >>>> hmm, I suppose we want the same even if the fb changes?  Or
> >>>> alternatively somewhere hold an extra ref to the backing obj until h=
w
> >>>> has finished scanout?
> >>>
> >>
> >> Hi Rob
> >>
> >> Do you mean we need to also check if old_plane_state->fb !=3D
> >> new_plane_state->fb, then use blocking commit?
> >
> > yeah, basically.. if we release any outgoing fb the backing bo could
> > be potentially freed+unmapped leading to the same problem.
> >
>
> Yeah true, this case also we can hit this. Will add it and check.
>
> > idk if this more conservative approach would cause fps issues..
> > holding an extra ref would avoid potential issues, but offhand I'm not
> > sure if it would be a perf problem in practice.  Maybe with animated
> > cursors?
> >
>
> hmmm.... we did not see any significant lags or drops when we tested
> this (that was also our major concern to make sure we dont)

It's tricky because it is very much at the mercy of what userspace
does.. and different userspace does different things.

I remember issues back in the gtk2 days with something (gdm?) trying
to update a spinning cursor at 1000fps.  When that was clamped at
60fps it would literally take 5min to login!

> If we do have to hold an extra ref, we will have to do something like bel=
ow:
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003..97d9e056038c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -649,8 +649,10 @@ static int dpu_plane_prepare_fb(struct drm_plane
> *plane,
>          struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
>          int ret;
>
> -       if (!new_state->fb)
> +       if (!new_state->fb) {
> +               refcount_inc(&msm_fb->dirtyfb);
>                  return 0;
> +       }
>
>          DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", fb->base.id);
>
> @@ -682,8 +684,10 @@ static void dpu_plane_cleanup_fb(struct drm_plane
> *plane,
>          struct dpu_plane *pdpu =3D to_dpu_plane(plane);
>          struct dpu_plane_state *old_pstate;
>
> -       if (!old_state || !old_state->fb)
> +       if (!old_state || !old_state->fb) {
> +               refcount_dec(&msm_fb->dirtyfb);
>                  return;
> +       }
>
>          old_pstate =3D to_dpu_plane_state(old_state);
>
> I dont know if this is clean though. WDYT?

The dirtyfb ref is not what you want.  It is tracking if any attached
display changes need dirtyfb to flush changes to the panel.  See [1]

The other issue is that cleanup_fb will be called when drm core
_thinks_ the atomic commit is completed, not when it _actually_ has.

Probably the dpu_plane should hold a ref of the scanout bo until
vblank, rather than rely on the plane state holding a ref to the fb
(which holds a ref to the bo)?  drm_flip_work might be helpful for
this sort of thing.

BR,
-R

[1] https://lore.kernel.org/all/20220223191118.881321-1-robdclark@gmail.com=
/

>
>
> > BR,
> > -R
> >
> >> We can try that out.
> >>
> >> holding extra ref gets tricky IMO. In this way, the calls are balanced
> >> in places we know.
> >>
> >>> I think a more correct approach would be to run a worker, waiting for
> >>> the commit to happen and then freeing the FBs.
> >>>
> >>
> >> Hi Dmitry
> >>
> >> This option was tried . It gets very messy to handle it this way. Then
> >> we realized that, the worker is going to try to do the same thing a
> >> blocking commit does which is to wait for hw to finish scanout and the=
n
> >> cleanup planes. Hence this was preferred and is better IMO.
> >>
> >>>>
> >>>> BR,
> >>>> -R
> >>>>
> >>>>> +       }
> >>>>> +
> >>>>>           return true;
> >>>>>    }
> >>>>>
> >>>>>
> >>>>> ---
> >>>>> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> >>>>> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
> >>>>>
> >>>>> Best regards,
> >>>>> --
> >>>>> Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>
> >>>
> >>>
> >>>
