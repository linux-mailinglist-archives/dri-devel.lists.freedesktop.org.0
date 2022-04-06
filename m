Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A34F6D9B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883C810E5ED;
	Wed,  6 Apr 2022 21:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95F610E10A;
 Wed,  6 Apr 2022 21:57:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h4so5114234wrc.13;
 Wed, 06 Apr 2022 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qAcCBP/+ZSzwYJGJ9gvUIoDtgI7O2SQ2trBbIpD71+I=;
 b=b+bR7RUDmCQwJ2yT9nAg78XxAL1yLdKf6CphYmF9XkPnpejvRPJCO3uVK2TZFqoqPq
 NXAj4s9bvDWdGqFPylNttIMPxnTU+Lil93emJKsknSoFPcxPlNX69UVLQlPmedgWlEmD
 eH10BkzrX+k6M0bUUpclWsRmnb0K3jVvdoXeH1/p1lCapGkhQefThWvS4g8Oq1uidbc5
 91tCCRnVgQzs5RyznN5AAOH+pF93GUwRLTBOwzYKfK4Nn0I/1ovZ+E8IKW2FEfz/baga
 3jLYUyN7YxA301NVHcPEcH6S4zczFxfm4O/A/1xu8OuN2ymawlqfSVsfL61Yu/fcj2+n
 YKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qAcCBP/+ZSzwYJGJ9gvUIoDtgI7O2SQ2trBbIpD71+I=;
 b=SWE434L3csEtOn+4dnmK/eAgQmJ69Avw3S4JQ3uiW5M2j9Oo47sC+pGdqnu3E6mgJd
 qP6a9uFpRkhwzgJqft1d81aTmRtvtCCi8nE6ibp384AYuAxs0KzuMnBocxpBr5HvtU1R
 0ggl2OUU8BNy1elyXfHCxnS3YPwz1ECfgyPfij07TVLtSsiqtvTl2uo8IQb3s8kSZeQ4
 NcTr7zmw5ukTMvGZoO7aMURoMUfFx/QPnbfJXFJPSTw3ticusvVqltyif3HWLQuW5bH8
 heP0tXeTAk6rVtnfJ9utyZzwpS9aY4N3ZKpCzell+uJIB7ZXUNq2F+QUIXwdTCd89HLn
 //Ig==
X-Gm-Message-State: AOAM531+ze/HGreSa3E+4MOTjIl90FTWfCXyyxzjJP12SPaGcF86Z6gt
 iAR9qTwaaDtYQ3KZLHHW/Hcv/Z7bn73v1cpV0iQ=
X-Google-Smtp-Source: ABdhPJwgcqrNyQWhgyhTE0gYYfYvDoZhbR4ga6RFuFaORX5tdRnxk3iAoVIz4YcJSyKYLYOvoVZifqGmmHxq6nzZhT4=
X-Received: by 2002:a5d:6c66:0:b0:204:1175:691c with SMTP id
 r6-20020a5d6c66000000b002041175691cmr8373638wrz.328.1649282276216; Wed, 06
 Apr 2022 14:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Apr 2022 14:57:43 -0700
Message-ID: <CAF6AEGuYgANRUfeJsHiskCbUMnuCcDxxN01dSRdAjb+Rk=+afw@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 8:20 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> The stuff never really worked, and leads to lots of fun because it
> out-of-order frees atomic states. Which upsets KASAN, among other
> things.
>
> For async updates we now have a more solid solution with the
> ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> for msm and vc4 landed. nouveau and i915 have their own commit
> routines, doing something similar.
>
> For everyone else it's probably better to remove the use-after-free
> bug, and encourage folks to use the async support instead. The
> affected drivers which register a legacy cursor plane and don't either
> use the new async stuff or their own commit routine are: amdgpu,
> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
>
> Inspired by an amdgpu bug report.
>
> v2: Drop RFC, I think with amdgpu converted over to use
> atomic_async_check/commit done in
>
> commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Date:   Wed Dec 5 14:59:07 2018 -0500
>
>     drm/amd/display: Add fast path for cursor plane updates
>
> we don't have any driver anymore where we have userspace expecting
> solid legacy cursor support _and_ they are using the atomic helpers in
> their fully glory. So we can retire this.
>
> v3: Paper over msm and i915 regression. The complete_all is the only
> thing missing afaict.
>
> v4: Fixup i915 fixup ...
>
> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@ce=
rno.tech/
> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> Cc: Maxime Ripard <maxime@cerno.tech>
> Tested-by: Maxime Ripard <maxime@cerno.tech>
> Cc: mikita.lipski@amd.com
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: harry.wentland@amd.com
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>  drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
>  drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
>  drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
>  3 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 9603193d2fa1..a2899af82b4a 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_devi=
ce *dev,
>         int i, ret;
>         unsigned int crtc_mask =3D 0;
>
> -        /*
> -         * Legacy cursor ioctls are completely unsynced, and userspace
> -         * relies on that (by doing tons of cursor updates).
> -         */
> -       if (old_state->legacy_cursor_update)
> -               return;
> -
>         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, ne=
w_crtc_state, i) {
>                 if (!new_crtc_state->active)
>                         continue;
> @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atom=
ic_state *state,
>                         continue;
>                 }
>
> -               /* Legacy cursor updates are fully unsynced. */
> -               if (state->legacy_cursor_update) {
> -                       complete_all(&commit->flip_done);
> -                       continue;
> -               }
> -
>                 if (!new_crtc_state->event) {
>                         commit->event =3D kzalloc(sizeof(*commit->event),
>                                                 GFP_KERNEL);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index d2abe0e430bf..6ca5a6e7703b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8799,6 +8799,20 @@ static int intel_atomic_commit(struct drm_device *=
dev,
>                 intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakere=
f);
>                 return ret;
>         }
> +
> +       /*
> +        * FIXME: Cut over to (async) commit helpers instead of hand-roll=
ing
> +        * everything.
> +        */
> +       if (state->base.legacy_cursor_update) {
> +               struct intel_crtc_state *new_crtc_state;
> +               struct intel_crtc *crtc;
> +               int i;
> +
> +               for_each_new_intel_crtc_in_state(state, crtc, new_crtc_st=
ate, i)
> +                       complete_all(&new_crtc_state->uapi.commit->flip_d=
one);
> +       }
> +
>         intel_shared_dpll_swap_state(state);
>         intel_atomic_track_fbs(state);
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_a=
tomic.c
> index 1686fbb611fd..b3cfabebe5d6 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -222,6 +222,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *=
state)
>                 /* async updates are limited to single-crtc updates: */
>                 WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));
>
> +               complete_all(&async_crtc->state->commit->flip_done);
> +
>                 /*
>                  * Start timer if we don't already have an update pending
>                  * on this crtc:
> --
> 2.34.1
>
