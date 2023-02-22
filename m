Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDA69FF61
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 00:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AAA10E1F8;
	Wed, 22 Feb 2023 23:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB1410E1F8;
 Wed, 22 Feb 2023 23:21:22 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1722c48a773so8881133fac.2; 
 Wed, 22 Feb 2023 15:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBQjWreD5YceHGAm3SljA5uXbeQChUwHxJ9vgJBly4g=;
 b=BIUqtXs6ZC4lcSzsCiRtjlqqmnfD+oVi3pNQXD/lrRwGLfGpnxlsteLZZitjNAAdl/
 HB1/0mXen40LmBLk9zgl/OodDsXk2aepm2SNgbffvKVyOYnw8ODgLOiBSnILYzTVxehK
 57EUW2FPNM/mk7MelBxTuQsLquaSAgnCIVLnE6pkmuWMEB+cIFmyJOzWnNVbYUbS8sCR
 TiFhjNXik8wyPtw0Y4QJtJTbIr0cv15HxWv1F0X6hZoU3sGHpSJS1Z+FluHhOjd5la+o
 Stl7c+jLcl5RKLurfpXTDx5SFG7GvXchENKKfTeMps+YkjGGPDQnT5HIu3RKhdW94hfC
 l2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBQjWreD5YceHGAm3SljA5uXbeQChUwHxJ9vgJBly4g=;
 b=QrNuCh5P6SAdf/ZbF/vWc/MhB8fS+rSUbXfO4lTtwdQyx4VffbqdRxDPRz8ObiHxRu
 gLUFvoyfGPh+jESsolhyviA8X/pRIgu//A+guOH9hqwXWVT3wpfLofYTj6L8LSLA0TO8
 +uDV60NZvLGyeHz/LavGHjqlqJ88dvyc0112yPwTxXi33lzGCcbsGuXBrCpEjOogFN6H
 hrfEOHkwf4zNcvUuGPaV2AOOKZKsJoFsldk1L077CaSlkGqcSWSaOpz3x2Bx0oQ1Rf7c
 U3RleRNmiHG93ymlnhnWum9Sk2luQQyF15NlxTrzb9Lr+P330BkIrsZSsl/LC2Ck/OL6
 y2vg==
X-Gm-Message-State: AO0yUKWXus+UQVBwiUznvDFYAv3wWtHvJw1URnBqbyc74CF83ouaMvMm
 /oYqThtnFxp8QqoG99zJ2jyD19/ka0fA6M14IcI=
X-Google-Smtp-Source: AK7set8Vn9OcME7Hn72aIHIFRq64owG0Eqv9emogmG1BJgmD5Zi85rMaudzShrlI/k0Eg3hVMrCA5DH9pi6YtaX7lhg=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr1458724oab.38.1677108081698; Wed, 22
 Feb 2023 15:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <CAF6AEGvFN-9_cr2EyGxuW5NVgk8CA99rVuv_Y80M+gvMviPcuA@mail.gmail.com>
In-Reply-To: <CAF6AEGvFN-9_cr2EyGxuW5NVgk8CA99rVuv_Y80M+gvMviPcuA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 15:21:10 -0800
Message-ID: <CAF6AEGs63gz_ja8gV_CYwG1jd912BrgKXz+kJH++Vc8oLYWOPA@mail.gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-arm-msm@vger.kernel.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, Matthias Brugger <matthias.bgg@gmail.com>,
 mikita.lipski@amd.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Feb 16, 2023 at 3:12 AM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> >
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
> >     drm/amd/display: Add fast path for cursor plane updates
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
> > v5: Unallocate the crtc->event in msm to avoid hitting a WARN_ON in
> > dpu_crtc_atomic_flush(). This is a bit a hack, but simplest way to
> > untangle this all. Thanks to Abhinav Kumar for the debug help.
>
> Hmm, are you sure about that double-put?
>
> [  +0.501263] ------------[ cut here ]------------
> [  +0.000032] refcount_t: underflow; use-after-free.
> [  +0.000033] WARNING: CPU: 6 PID: 1854 at lib/refcount.c:28
> refcount_warn_saturate+0xf8/0x134
> [  +0.000043] Modules linked in: uinput rfcomm algif_hash
> algif_skcipher af_alg veth venus_dec venus_enc xt_cgroup xt_MASQUERADE
> qcom_spmi_temp_alarm qcom_spmi_adc_tm5 qcom_spmi_adc5 qcom_vadc_common
> cros_ec_typec typec 8021q hci_uart btqca qcom_stats venus_core
> coresight_etm4x coresight_tmc snd_soc_lpass_sc7180
> coresight_replicator coresight_funnel coresight snd_soc_sc7180
> ip6table_nat fuse ath10k_snoc ath10k_core ath mac80211 iio_trig_sysfs
> bluetooth cros_ec_sensors cfg80211 cros_ec_sensors_core
> industrialio_triggered_buffer kfifo_buf ecdh_generic ecc
> cros_ec_sensorhub lzo_rle lzo_compress r8153_ecm cdc_ether usbnet
> r8152 mii zram hid_vivaldi hid_google_hammer hid_vivaldi_common joydev
> [  +0.000189] CPU: 6 PID: 1854 Comm: DrmThread Not tainted
> 5.15.93-16271-g5ecce40dbcd4 #46
> cf9752a1c9e5b13fd13216094f52d77fa5a5f8f3
> [  +0.000016] Hardware name: Google Wormdingler rev1+ INX panel board (DT=
)
> [  +0.000008] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> [  +0.000013] pc : refcount_warn_saturate+0xf8/0x134
> [  +0.000011] lr : refcount_warn_saturate+0xf8/0x134
> [  +0.000011] sp : ffffffc012e43930
> [  +0.000008] x29: ffffffc012e43930 x28: ffffff80d31aa300 x27: 0000000000=
00024e
> [  +0.000017] x26: 00000000000003bd x25: 0000000000000040 x24: 0000000000=
000040
> [  +0.000014] x23: ffffff8083eb1000 x22: 0000000000000002 x21: ffffff8084=
5bc800
> [  +0.000013] x20: 0000000000000040 x19: ffffff80d0cecb00 x18: 0000000060=
014024
> [  +0.000012] x17: 0000000000000000 x16: 000000000000003c x15: ffffffd97e=
21a1c0
> [  +0.000012] x14: 0000000000000003 x13: 0000000000000004 x12: 0000000000=
000001
> [  +0.000014] x11: c0000000ffffdfff x10: ffffffd97f560f50 x9 : 5749cdb403=
550d00
> [  +0.000014] x8 : 5749cdb403550d00 x7 : 0000000000000000 x6 : 372e313320=
20205b
> [  +0.000012] x5 : ffffffd97f7b8b24 x4 : 0000000000000000 x3 : ffffffc012=
e43588
> [  +0.000013] x2 : ffffffc012e43590 x1 : 00000000ffffdfff x0 : 0000000000=
000026
> [  +0.000014] Call trace:
> [  +0.000008]  refcount_warn_saturate+0xf8/0x134
> [  +0.000013]  drm_crtc_commit_put+0x54/0x74
> [  +0.000013]  __drm_atomic_helper_plane_destroy_state+0x64/0x68
> [  +0.000013]  dpu_plane_destroy_state+0x24/0x3c
> [  +0.000017]  drm_atomic_state_default_clear+0x13c/0x2d8
> [  +0.000015]  __drm_atomic_state_free+0x88/0xa0
> [  +0.000015]  drm_atomic_helper_update_plane+0x158/0x188
> [  +0.000014]  __setplane_atomic+0xf4/0x138
> [  +0.000012]  drm_mode_cursor_common+0x2e8/0x40c
> [  +0.000009]  drm_mode_cursor_ioctl+0x48/0x70
> [  +0.000008]  drm_ioctl_kernel+0xe0/0x158
> [  +0.000014]  drm_ioctl+0x214/0x480
> [  +0.000012]  __arm64_sys_ioctl+0x94/0xd4
> [  +0.000010]  invoke_syscall+0x4c/0x100
> [  +0.000013]  do_el0_svc+0xa4/0x168
> [  +0.000012]  el0_svc+0x20/0x50
> [  +0.000009]  el0t_64_sync_handler+0x20/0x110
> [  +0.000008]  el0t_64_sync+0x1a4/0x1a8
> [  +0.000010] ---[ end trace 35bb2d245a684c9a ]---
>

without the double-put it "works" (as in doesn't immediately crash)
but we are queuing up a _lot_ of updates (ie. cursor is lagging
somewhat behind)

BR,
-R

>
> BR,
> -R
>
>
>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Maxime Ripard <maxime@cerno.tech>
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
> > Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> > Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
> > Cc: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
> >  drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
> >  drivers/gpu/drm/msm/msm_atomic.c             | 15 +++++++++++++++
> >  3 files changed, 29 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index d579fd8f7cb8..f6b4c3a00684 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1587,13 +1587,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_de=
vice *dev,
> >         int i, ret;
> >         unsigned int crtc_mask =3D 0;
> >
> > -        /*
> > -         * Legacy cursor ioctls are completely unsynced, and userspace
> > -         * relies on that (by doing tons of cursor updates).
> > -         */
> > -       if (old_state->legacy_cursor_update)
> > -               return;
> > -
> >         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, =
new_crtc_state, i) {
> >                 if (!new_crtc_state->active)
> >                         continue;
> > @@ -2244,12 +2237,6 @@ int drm_atomic_helper_setup_commit(struct drm_at=
omic_state *state,
> >                         continue;
> >                 }
> >
> > -               /* Legacy cursor updates are fully unsynced. */
> > -               if (state->legacy_cursor_update) {
> > -                       complete_all(&commit->flip_done);
> > -                       continue;
> > -               }
> > -
> >                 if (!new_crtc_state->event) {
> >                         commit->event =3D kzalloc(sizeof(*commit->event=
),
> >                                                 GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index 3479125fbda6..2454451fcf95 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -7651,6 +7651,20 @@ static int intel_atomic_commit(struct drm_device=
 *dev,
> >                 intel_runtime_pm_put(&dev_priv->runtime_pm, state->wake=
ref);
> >                 return ret;
> >         }
> > +
> > +       /*
> > +        * FIXME: Cut over to (async) commit helpers instead of hand-ro=
lling
> > +        * everything.
> > +        */
> > +       if (state->base.legacy_cursor_update) {
> > +               struct intel_crtc_state *new_crtc_state;
> > +               struct intel_crtc *crtc;
> > +               int i;
> > +
> > +               for_each_new_intel_crtc_in_state(state, crtc, new_crtc_=
state, i)
> > +                       complete_all(&new_crtc_state->uapi.commit->flip=
_done);
> > +       }
> > +
> >         intel_shared_dpll_swap_state(state);
> >         intel_atomic_track_fbs(state);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm=
_atomic.c
> > index 1686fbb611fd..b7151767b567 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -189,6 +189,19 @@ void msm_atomic_commit_tail(struct drm_atomic_stat=
e *state)
> >         bool async =3D kms->funcs->vsync_time &&
> >                         can_do_async(state, &async_crtc);
> >
> > +       /*
> > +        * FIXME: Convert to async plane helpers and remove the various=
 hacks to
> > +        * keep the old legacy_cursor_way of doing async commits workin=
g for the
> > +        * dpu code, like the expectation that these don't have a crtc-=
>event.
> > +        */
> > +       if (async) {
> > +               /* both ->event itself and the pointer hold a reference=
! */
> > +               drm_crtc_commit_put(async_crtc->state->commit);
> > +               drm_crtc_commit_put(async_crtc->state->commit);
> > +               kfree(async_crtc->state->event);
> > +               async_crtc->state->event =3D NULL;
> > +       }
> > +
> >         trace_msm_atomic_commit_tail_start(async, crtc_mask);
> >
> >         kms->funcs->enable_commit(kms);
> > @@ -222,6 +235,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state=
 *state)
> >                 /* async updates are limited to single-crtc updates: */
> >                 WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));
> >
> > +               complete_all(&async_crtc->state->commit->flip_done);
> > +
> >                 /*
> >                  * Start timer if we don't already have an update pendi=
ng
> >                  * on this crtc:
> > --
> > 2.39.0
> >
