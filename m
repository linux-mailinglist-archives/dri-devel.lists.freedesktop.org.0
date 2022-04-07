Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8144F8A65
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 00:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D9010ECCA;
	Thu,  7 Apr 2022 22:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A7410ECB4;
 Thu,  7 Apr 2022 22:50:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b19so10143742wrh.11;
 Thu, 07 Apr 2022 15:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u6o9vTRYKHEXbMoIz2iS/TzwQfRhBiIL5J1+77bot7w=;
 b=cU6R6SgUXQ7DTj9ehBzc3gOOtumcx01lbL+f6XLFleqcQF4QsarZgtjfM+K+Ol4GzC
 P86QWpkK5UNT9bhoZCeB8C8+UWgtVRB8/fANRqz62Ra+mYu5mbumgMxSZWyGbL/FFSEh
 pwlFGrzc5STg+TGYLPwCP2kpPkjF5FHACStcIFnfksjX1xBW7Dcdel/3kMBvgGaKCB3E
 P8VN7P9URVB863NMXRIBCmAi+RFeyZvKr2XbTz0D6h9JAqwNtx4qbyeIGlyt7eno6Crp
 kHXkY4Jf7/NPyU8c0WXQydRPlYqReUhhUpTpBl4HBlDzM6SR5zvtI7GUXhhCsG3U0VSV
 I2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u6o9vTRYKHEXbMoIz2iS/TzwQfRhBiIL5J1+77bot7w=;
 b=BJ1U9j2c6Vuxw8ij611s5HDx0aZG1u6NmZHba/gB0IyTKETUOl1moKbIwQ6iwCngrR
 gTLrRkGCyHdrNtm2qLrUchbEkNHDRFWHQ+Oom+nHF99RLPO5S2yrY2bjDkYxVGxkAIvo
 9X32cPg3b9DFgvM1lsNDdF/4sq/ZFtJUKVFxfuSQUoh4vqPVXekVsFLanQ6fmlkuN8pp
 CG0aZfmQynZaMBQBk9RmzDHFYahg51YrQyGGxEJJmIgJrOvfrpWf0JdSv2VFzPWZEEeR
 5FkG7qjL67hoYWInTL86e29hzONEHE63S72amutdIM72scYXgBB/4DlnYCJwfRsI8UCS
 +gZA==
X-Gm-Message-State: AOAM532Mqg+IbfjdzPpGnkbLYuKa9iI+y2/Ycgudpe8ODwPifqui9q8G
 baM65dWhM9Nq3ELVnNLI++Heg1LRGwZkyu7qt4s=
X-Google-Smtp-Source: ABdhPJzt4sJwvj2c2Q7X9lSWOFzxfRkal7yaMfDEBzeOs72VF+ThMrxt7faRU0gKZhdWXqJtbYLtdLMWEKh0bCMgd3w=
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id
 w22-20020a1cf616000000b0037d1e1cf90amr14874429wmc.148.1649371812436; Thu, 07
 Apr 2022 15:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
 <823b3f2c-b624-f7a3-8bdc-4c069571c810@quicinc.com>
In-Reply-To: <823b3f2c-b624-f7a3-8bdc-4c069571c810@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Apr 2022 15:51:07 -0700
Message-ID: <CAF6AEGvLY-+v0ZCvtoZDsW-0z5a8UH8suN9cp22m_ec=Ggb9Mw@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 6, 2022 at 6:27 PM Jessica Zhang <quic_jesszhan@quicinc.com> wr=
ote:
>
>
>
> On 3/31/2022 8:20 AM, Daniel Vetter wrote:
> > The stuff never really worked, and leads to lots of fun because it
> > out-of-order frees atomic states. Which upsets KASAN, among other
> > things.
> >
> > For async updates we now have a more solid solution with the
> > ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> > for msm and vc4 landed. nouveau and i915 have their own commit
> > routines, doing something similar.
> >
> > For everyone else it's probably better to remove the use-after-free
> > bug, and encourage folks to use the async support instead. The
> > affected drivers which register a legacy cursor plane and don't either
> > use the new async stuff or their own commit routine are: amdgpu,
> > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
> >
> > Inspired by an amdgpu bug report.
> >
> > v2: Drop RFC, I think with amdgpu converted over to use
> > atomic_async_check/commit done in
> >
> > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Date:   Wed Dec 5 14:59:07 2018 -0500
> >
> >      drm/amd/display: Add fast path for cursor plane updates
> >
> > we don't have any driver anymore where we have userspace expecting
> > solid legacy cursor support _and_ they are using the atomic helpers in
> > their fully glory. So we can retire this.
> >
> > v3: Paper over msm and i915 regression. The complete_all is the only
> > thing missing afaict.
> >
> > v4: Fixup i915 fixup ...
> >
> > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@=
cerno.tech/
> > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Tested-by: Maxime Ripard <maxime@cerno.tech>
> > Cc: mikita.lipski@amd.com
> > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > Cc: harry.wentland@amd.com
> > Cc: Rob Clark <robdclark@gmail.com>
>
> Hey Rob,
>
> I saw your tested-by and reviewed-by tags on Patchwork. Just curious,
> what device did you test on?

I was testing on strongbad.. v5.18-rc1 + patches (notably, revert
80253168dbfd ("drm: of: Lookup if child node has panel or bridge")

I think the display setup shouldn't be significantly different than
limozeen (ie. it's an eDP panel).  But I didn't do much start/stop
ui.. I was mostly looking to make sure cursor movements weren't
causing fps drops ;-)

BR,
-R

> I'm hitting several instances of this error when doing a start/stop ui
> on Lazor Chromebook with this patch:
>
> [ 3092.608322] CPU: 2 PID: 18579 Comm: DrmThread Tainted: G        W
>       5.17.0-rc2-lockdep-00089-g7f17ab7bf567 #155
> e5912cd286513b064a82a38938b3fdef86b079aa
> [ 3092.622880] Hardware name: Google Lazor Limozeen without Touchscreen
> (rev4) (DT)
> [ 3092.630492] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [ 3092.637664] pc : dpu_crtc_atomic_flush+0x9c/0x144
> [ 3092.642523] lr : dpu_crtc_atomic_flush+0x60/0x144
> [ 3092.647379] sp : ffffffc00c1e3760
> [ 3092.650805] x29: ffffffc00c1e3760 x28: ffffff80985dd800 x27:
> 0000000000000425
> [ 3092.658164] x26: ffffff80985dc500 x25: ffffff80985ddc00 x24:
> ffffffdf8ae3b6f0
> [ 3092.665522] x23: 0000000000000000 x22: 0000000000000000 x21:
> ffffff809b82da00
> [ 3092.672890] x20: ffffff80840e1000 x19: ffffff80840e2000 x18:
> 0000000000001000
> [ 3092.680255] x17: 0000000000000400 x16: 0000000000000100 x15:
> 000000000000003b
> [ 3092.687622] x14: 0000000000000000 x13: 0000000000000002 x12:
> 0000000000000003
> [ 3092.694979] x11: ffffff8084009000 x10: 0000000000000040 x9 :
> 0000000000000040
> [ 3092.702340] x8 : 0000000000000300 x7 : 000000000000000c x6 :
> 0000000000000004
> [ 3092.709698] x5 : 0000000000000320 x4 : 0000000000000018 x3 :
> 0000000000000000
> [ 3092.717056] x2 : 0000000000000000 x1 : 7bfb38b2a3a89800 x0 :
> ffffff809a1eb300
> [ 3092.724424] Call trace:
> [ 3092.726958]  dpu_crtc_atomic_flush+0x9c/0x144
> [ 3092.731463]  drm_atomic_helper_commit_planes+0x1bc/0x1c4
> [ 3092.736944]  msm_atomic_commit_tail+0x23c/0x3e0
> [ 3092.741627]  commit_tail+0x7c/0xfc
> [ 3092.745145]  drm_atomic_helper_commit+0x158/0x15c
> [ 3092.749998]  drm_atomic_commit+0x60/0x74
> [ 3092.754055]  drm_atomic_helper_update_plane+0x100/0x110
> [ 3092.759449]  __setplane_atomic+0x11c/0x120
> [ 3092.763685]  drm_mode_cursor_universal+0x188/0x22c
> [ 3092.768633]  drm_mode_cursor_common+0x120/0x1f8
> [ 3092.773310]  drm_mode_cursor_ioctl+0x68/0x8c
> [ 3092.777721]  drm_ioctl_kernel+0xe8/0x168
> [ 3092.781770]  drm_ioctl+0x320/0x370
> [ 3092.785289]  drm_compat_ioctl+0x40/0xdc
> [ 3092.789257]  __arm64_compat_sys_ioctl+0xe0/0x150
> [ 3092.794030]  invoke_syscall+0x80/0x114
> [ 3092.797905]  el0_svc_common.constprop.3+0xc4/0xf8
> [ 3092.802765]  do_el0_svc_compat+0x2c/0x54
> [ 3092.806811]  el0_svc_compat+0x4c/0xe4
> [ 3092.810598]  el0t_32_sync_handler+0xc4/0xf4
> [ 3092.814914]  el0t_32_sync+0x174/0x178
> [ 3092.818701] irq event stamp: 55940
> [ 3092.822217] hardirqs last  enabled at (55939): [<ffffffdf8ad617a4>]
> exit_to_kernel_mode+0x10c/0x11c
> [ 3092.831523] hardirqs last disabled at (55940): [<ffffffdf8ad62728>]
> el1_dbg+0x28/0x70
> [ 3092.839577] softirqs last  enabled at (55938): [<ffffffdf8a2103a8>]
> __do_softirq+0x1e8/0x480
> [ 3092.848256] softirqs last disabled at (55923): [<ffffffdf8a28d668>]
> __irq_exit_rcu+0xdc/0x140
> [ 3092.857022] ---[ end trace 0000000000000000 ]---
>
>
>
>
> Thanks,
>
> Jessica Zhang
>
> > Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> > Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >   drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
> >   drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
> >   3 files changed, 16 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 9603193d2fa1..a2899af82b4a 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_de=
vice *dev,
> >       int i, ret;
> >       unsigned int crtc_mask =3D 0;
> >
> > -      /*
> > -       * Legacy cursor ioctls are completely unsynced, and userspace
> > -       * relies on that (by doing tons of cursor updates).
> > -       */
> > -     if (old_state->legacy_cursor_update)
> > -             return;
> > -
> >       for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, ne=
w_crtc_state, i) {
> >               if (!new_crtc_state->active)
> >                       continue;
> > @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_at=
omic_state *state,
> >                       continue;
> >               }
> >
> > -             /* Legacy cursor updates are fully unsynced. */
> > -             if (state->legacy_cursor_update) {
> > -                     complete_all(&commit->flip_done);
> > -                     continue;
> > -             }
> > -
> >               if (!new_crtc_state->event) {
> >                       commit->event =3D kzalloc(sizeof(*commit->event),
> >                                               GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index d2abe0e430bf..6ca5a6e7703b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -8799,6 +8799,20 @@ static int intel_atomic_commit(struct drm_device=
 *dev,
> >               intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakere=
f);
> >               return ret;
> >       }
> > +
> > +     /*
> > +      * FIXME: Cut over to (async) commit helpers instead of hand-roll=
ing
> > +      * everything.
> > +      */
> > +     if (state->base.legacy_cursor_update) {
> > +             struct intel_crtc_state *new_crtc_state;
> > +             struct intel_crtc *crtc;
> > +             int i;
> > +
> > +             for_each_new_intel_crtc_in_state(state, crtc, new_crtc_st=
ate, i)
> > +                     complete_all(&new_crtc_state->uapi.commit->flip_d=
one);
> > +     }
> > +
> >       intel_shared_dpll_swap_state(state);
> >       intel_atomic_track_fbs(state);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm=
_atomic.c
> > index 1686fbb611fd..b3cfabebe5d6 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -222,6 +222,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state=
 *state)
> >               /* async updates are limited to single-crtc updates: */
> >               WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));
> >
> > +             complete_all(&async_crtc->state->commit->flip_done);
> > +
> >               /*
> >                * Start timer if we don't already have an update pending
> >                * on this crtc:
> > --
> > 2.34.1
> >
