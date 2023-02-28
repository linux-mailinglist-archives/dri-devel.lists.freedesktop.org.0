Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1D6A6222
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B3610E0DE;
	Tue, 28 Feb 2023 22:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282C710E0DE;
 Tue, 28 Feb 2023 22:09:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f41so15108628lfv.13;
 Tue, 28 Feb 2023 14:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xv67qzxGclMcpdDe36C3dibAMdrOR8c/MjH6Fi3vh9o=;
 b=Q7ZTDwAtiKKN18sskJY+1mdBKnQgwp70eQbtgddJ0WqDJg74yN0b7IeehBo0DdsdTm
 b9iDtDMPrnMJ3LCC+HUYJ7EGPJMHaTn1ZSor46yYGXhVPaFlpRFEj/oEAqJJKAdtoFbm
 eYcxNhnEUrGisoIv7jB4PCj9BQ5V67WO/WmkRVXBXHivJm5LTgCMyWnyZ2aFpF2zGEUr
 0gdVohSnHx/RblGqEHS9wcCQYEGmDjw7cjhPFY2Ec9KaTp70KddHIzYvNYi/zbwmbZXC
 gU1T5Ob4TAF4dQDohFeIoT5GSEFboa/BsZ9/JF6hvfgO09je1lx5g/JCCGuaJ99WxZWq
 o5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xv67qzxGclMcpdDe36C3dibAMdrOR8c/MjH6Fi3vh9o=;
 b=ujxGZpIGr6IUhKyHwVtWcYVen2I4mPqxHujs78ABLbY1Qbi2KeUkqvsIFeCjxM4F3l
 J0JURK836uaK4LJ9HNo5ZsLW33FeuaBpybPICO5ahV1PF64QldTuvUB0lE+RPfeaD+Py
 oC1CB8jZ+jYXMAXHu9t9nlOH+wH9la8UtTO7gmj4/rcifRukebvh+9s+VcSD3b+3FYDr
 nX79XY3dErIykAu2bHmgXsyt9aiVfdzEppFwym+qLz45lAmQnN8muK5K73PM1bWlDzHT
 WOEwcLfpw8v4usF+wKPur+CVOKW7QMhWLw2VELgOFYQDMdJJ2cZQP/cdj0EvIm+wFjFd
 FZ7g==
X-Gm-Message-State: AO0yUKXb688pM2Yn34DADDTHvX56FoOzSwo8/IWVfpVHH9a9hyaTfDmp
 HMT8/fL+Wrd9cYVqRX8V6VVv5WXpEalM5VY2Oko=
X-Google-Smtp-Source: AK7set8KctyBL1YEwG/1Vqm/4vpaQZfPBsRCMEuS4dYiTirU4x5y/sYqOto4nHXlGmRji9ombJQxPU7b+WF8chqidC0=
X-Received: by 2002:ac2:44c1:0:b0:4df:1d72:8e87 with SMTP id
 d1-20020ac244c1000000b004df1d728e87mr1204685lfm.2.1677622140050; Tue, 28 Feb
 2023 14:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <20230227193535.2822389-11-robdclark@gmail.com>
In-Reply-To: <20230227193535.2822389-11-robdclark@gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Tue, 28 Feb 2023 23:08:23 +0100
Message-ID: <CAEsyxyhNB-TLBEH7sqF1+_uLB1ad_uVZ9hYgJ59fUDF6ffZeZA@mail.gmail.com>
Subject: Re: [PATCH v7 10/15] drm/vblank: Add helper to get next vblank time
To: Rob Clark <robdclark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b9a24805f5c9d7df"
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b9a24805f5c9d7df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM. This one is

Reviewed-by: Mario Kleiner <mario.kleiner.de@gmail.com>

-mario


On Mon, Feb 27, 2023 at 8:36=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:

> From: Rob Clark <robdclark@chromium.org>
>
> Will be used in the next commit to set a deadline on fences that an
> atomic update is waiting on.
>
> v2: Calculate time at *start* of vblank period, not end
> v3: Fix kbuild complaints
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 53 ++++++++++++++++++++++++++++++------
>  include/drm/drm_vblank.h     |  1 +
>  2 files changed, 45 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 2ff31717a3de..299fa2a19a90 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -844,10 +844,9 @@ bool
> drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crtc,
>  EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);
>
>  /**
> - * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recen=
t
> - *                             vblank interval
> - * @dev: DRM device
> - * @pipe: index of CRTC whose vblank timestamp to retrieve
> + * drm_crtc_get_last_vbltimestamp - retrieve raw timestamp for the most
> + *                                  recent vblank interval
> + * @crtc: CRTC whose vblank timestamp to retrieve
>   * @tvblank: Pointer to target time which should receive the timestamp
>   * @in_vblank_irq:
>   *     True when called from drm_crtc_handle_vblank().  Some drivers
> @@ -865,10 +864,9 @@
> EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);
>   * True if timestamp is considered to be very precise, false otherwise.
>   */
>  static bool
> -drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
> -                         ktime_t *tvblank, bool in_vblank_irq)
> +drm_crtc_get_last_vbltimestamp(struct drm_crtc *crtc, ktime_t *tvblank,
> +                              bool in_vblank_irq)
>  {
> -       struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
>         bool ret =3D false;
>
>         /* Define requested maximum error on timestamps (nanoseconds). */
> @@ -876,8 +874,6 @@ drm_get_last_vbltimestamp(struct drm_device *dev,
> unsigned int pipe,
>
>         /* Query driver if possible and precision timestamping enabled. *=
/
>         if (crtc && crtc->funcs->get_vblank_timestamp && max_error > 0) {
> -               struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
> -
>                 ret =3D crtc->funcs->get_vblank_timestamp(crtc, &max_erro=
r,
>                                                         tvblank,
> in_vblank_irq);
>         }
> @@ -891,6 +887,15 @@ drm_get_last_vbltimestamp(struct drm_device *dev,
> unsigned int pipe,
>         return ret;
>  }
>
> +static bool
> +drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
> +                         ktime_t *tvblank, bool in_vblank_irq)
> +{
> +       struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
> +
> +       return drm_crtc_get_last_vbltimestamp(crtc, tvblank,
> in_vblank_irq);
> +}
> +
>  /**
>   * drm_crtc_vblank_count - retrieve "cooked" vblank counter value
>   * @crtc: which counter to retrieve
> @@ -980,6 +985,36 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc
> *crtc,
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
>
> +/**
> + * drm_crtc_next_vblank_start - calculate the time of the next vblank
> + * @crtc: the crtc for which to calculate next vblank time
> + * @vblanktime: pointer to time to receive the next vblank timestamp.
> + *
> + * Calculate the expected time of the start of the next vblank period,
> + * based on time of previous vblank and frame duration
> + */
> +int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktim=
e)
> +{
> +       unsigned int pipe =3D drm_crtc_index(crtc);
> +       struct drm_vblank_crtc *vblank =3D &crtc->dev->vblank[pipe];
> +       struct drm_display_mode *mode =3D &vblank->hwmode;
> +       u64 vblank_start;
> +
> +       if (!vblank->framedur_ns || !vblank->linedur_ns)
> +               return -EINVAL;
> +
> +       if (!drm_crtc_get_last_vbltimestamp(crtc, vblanktime, false))
> +               return -EINVAL;
> +
> +       vblank_start =3D DIV_ROUND_DOWN_ULL(
> +                       (u64)vblank->framedur_ns * mode->crtc_vblank_star=
t,
> +                       mode->crtc_vtotal);
> +       *vblanktime  =3D ktime_add(*vblanktime, ns_to_ktime(vblank_start)=
);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_next_vblank_start);
> +
>  static void send_vblank_event(struct drm_device *dev,
>                 struct drm_pending_vblank_event *e,
>                 u64 seq, ktime_t now)
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 733a3e2d1d10..7f3957943dd1 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev)=
;
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>                                    ktime_t *vblanktime);
> +int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t
> *vblanktime);
>  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>                                struct drm_pending_vblank_event *e);
>  void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
> --
> 2.39.1
>
>

--000000000000b9a24805f5c9d7df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>LGTM. This one is</div><div><br></div><div>Reviewed-b=
y: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com">mario.kl=
einer.de@gmail.com</a>&gt;</div><div><br></div><div>-mario</div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Feb 27, 2023 at 8:36=E2=80=AFPM Rob Clark &lt;<a href=3D"mailto=
:robdclark@gmail.com">robdclark@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Rob Clark &lt;<a href=3D"mai=
lto:robdclark@chromium.org" target=3D"_blank">robdclark@chromium.org</a>&gt=
;<br>
<br>
Will be used in the next commit to set a deadline on fences that an<br>
atomic update is waiting on.<br>
<br>
v2: Calculate time at *start* of vblank period, not end<br>
v3: Fix kbuild complaints<br>
<br>
Signed-off-by: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" targ=
et=3D"_blank">robdclark@chromium.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_vblank.c | 53 ++++++++++++++++++++++++++++++-----=
-<br>
=C2=A0include/drm/drm_vblank.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 45 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c<br=
>
index 2ff31717a3de..299fa2a19a90 100644<br>
--- a/drivers/gpu/drm/drm_vblank.c<br>
+++ b/drivers/gpu/drm/drm_vblank.c<br>
@@ -844,10 +844,9 @@ bool drm_crtc_vblank_helper_get_vblank_timestamp(struc=
t drm_crtc *crtc,<br>
=C2=A0EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);<br>
<br>
=C2=A0/**<br>
- * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recent<=
br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vblank interval<br>
- * @dev: DRM device<br>
- * @pipe: index of CRTC whose vblank timestamp to retrieve<br>
+ * drm_crtc_get_last_vbltimestamp - retrieve raw timestamp for the most<br=
>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recent vblank interval<br>
+ * @crtc: CRTC whose vblank timestamp to retrieve<br>
=C2=A0 * @tvblank: Pointer to target time which should receive the timestam=
p<br>
=C2=A0 * @in_vblank_irq:<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0True when called from drm_crtc_handle_vblank().=
=C2=A0 Some drivers<br>
@@ -865,10 +864,9 @@ EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timest=
amp);<br>
=C2=A0 * True if timestamp is considered to be very precise, false otherwis=
e.<br>
=C2=A0 */<br>
=C2=A0static bool<br>
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ktime_t *tvblank, bool in_vblank_irq)<br>
+drm_crtc_get_last_vbltimestamp(struct drm_crtc *crtc, ktime_t *tvblank,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool in_vblank_irq)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc =3D drm_crtc_from_index(d=
ev, pipe);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ret =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Define requested maximum error on timestamps=
 (nanoseconds). */<br>
@@ -876,8 +874,6 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsig=
ned int pipe,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Query driver if possible and precision times=
tamping enabled. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (crtc &amp;&amp; crtc-&gt;funcs-&gt;get_vbla=
nk_timestamp &amp;&amp; max_error &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *cr=
tc =3D drm_crtc_from_index(dev, pipe);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D crtc-&gt;fu=
ncs-&gt;get_vblank_timestamp(crtc, &amp;max_error,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tvblank, in_vblank_irq);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -891,6 +887,15 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsi=
gned int pipe,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
+static bool<br>
+drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ktime_t *tvblank, bool in_vblank_irq)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc =3D drm_crtc_from_index(d=
ev, pipe);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_crtc_get_last_vbltimestamp(crtc, tvb=
lank, in_vblank_irq);<br>
+}<br>
+<br>
=C2=A0/**<br>
=C2=A0 * drm_crtc_vblank_count - retrieve &quot;cooked&quot; vblank counter=
 value<br>
=C2=A0 * @crtc: which counter to retrieve<br>
@@ -980,6 +985,36 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *cr=
tc,<br>
=C2=A0}<br>
=C2=A0EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);<br>
<br>
+/**<br>
+ * drm_crtc_next_vblank_start - calculate the time of the next vblank<br>
+ * @crtc: the crtc for which to calculate next vblank time<br>
+ * @vblanktime: pointer to time to receive the next vblank timestamp.<br>
+ *<br>
+ * Calculate the expected time of the start of the next vblank period,<br>
+ * based on time of previous vblank and frame duration<br>
+ */<br>
+int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)=
<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int pipe =3D drm_crtc_index(crtc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_vblank_crtc *vblank =3D &amp;crtc-&g=
t;dev-&gt;vblank[pipe];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode =3D &amp;vblank-&=
gt;hwmode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 vblank_start;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vblank-&gt;framedur_ns || !vblank-&gt;line=
dur_ns)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_crtc_get_last_vbltimestamp(crtc, vblan=
ktime, false))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vblank_start =3D DIV_ROUND_DOWN_ULL(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(u64)vblank-&gt;framedur_ns * mode-&gt;crtc_vblank_start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mode-&gt;crtc_vtotal);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*vblanktime=C2=A0 =3D ktime_add(*vblanktime, ns=
_to_ktime(vblank_start));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+EXPORT_SYMBOL(drm_crtc_next_vblank_start);<br>
+<br>
=C2=A0static void send_vblank_event(struct drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_pending_=
vblank_event *e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 seq, ktime_t no=
w)<br>
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h<br>
index 733a3e2d1d10..7f3957943dd1 100644<br>
--- a/include/drm/drm_vblank.h<br>
+++ b/include/drm/drm_vblank.h<br>
@@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);<=
br>
=C2=A0u64 drm_crtc_vblank_count(struct drm_crtc *crtc);<br>
=C2=A0u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ktime_t *vblanktime);<b=
r>
+int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)=
;<br>
=C2=A0void drm_crtc_send_vblank_event(struct drm_crtc *crtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pending_vblank_event *e);<=
br>
=C2=A0void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,<br>
-- <br>
2.39.1<br>
<br>
</blockquote></div>

--000000000000b9a24805f5c9d7df--
