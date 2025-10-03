Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4DBB78B1
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 18:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E399410E051;
	Fri,  3 Oct 2025 16:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QS2bKJh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6807D10E051
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 16:27:53 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-42571b8abbaso22318195ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759508872; x=1760113672; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=USCXpsbsAQD0Nk5BOjl8HGSN1iDwitl7j+jcF5M3I7I=;
 b=QS2bKJh3IoVaRki0SVXt2EtFGHnuGkNiZ0kxlqkIJOQnwKvTefGc47Q5NdG2UA4wEH
 DbvGXCGiWmDXP0alzaYh+muxUvxnvIYtIOT1t8quB0e/H6SdtCMH7zP8aPPV9pW6yswE
 KNTQ/eD/72dFFKb5JvCz/3txQywQD/z/Xy4JH8FTQDA0R4H2/PlvBPYiZFACVIkzCH7V
 ubi9XOlCnzp/u/hnTF7zk7R5z3T6A9wzHbv8nCL4K0Zq0AbbhgJ/gR5ZfzlCdvLbC7w/
 6ZXCv8eW2yvBfDcfchiTPFXTDPQjO/+C+joohHNBUTb74LHuw7Nj7YZQTtKUSi1MWrxT
 Ui2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759508872; x=1760113672;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=USCXpsbsAQD0Nk5BOjl8HGSN1iDwitl7j+jcF5M3I7I=;
 b=n8Rhj9/2KQSS8tEEZaEUhkipogVg+FwFhxCC9FJpAQfKGVWnlEcwSe1Cu8vr7y2VAU
 ZIKNThhOen7Rtkhd8ynEiNN8pObSsWcCSjuSTO8TzQyiLI+55/xDDPftCTxISkQleSx1
 UYJAPEDU0LvOrLDlIUDDy9JdpLKfMcu96aR8F2YXst89EtjeBYRGHWmJQdN895pcHCdF
 Hr4bP1lXIUFRSHTDQfsS/mPp5GOnZj9Ue0V/4giEKPW1LIlCSxPSzV8uz69WNj7jWne0
 bhWJmuMTSETT+Ka/UfUojnuJUV0+oR+KVLa7rjVUBf3gyK3oELwjvtOZ9qrQuQFNc5ge
 x0AQ==
X-Gm-Message-State: AOJu0YzCGwJ3TTXSVpvjY2P1+oHi29/7oXIloGcLuFGpyGyiuSp5PclI
 hm+a+soM5SQngknxKMnudblVJIqiHO/1xyWmdS6AtFjCQZygte6EqUuJ1sSJGeXAjYKdupf2WNh
 yJlmGfqCosZQIgEJ2rLIyv1aWcuFBbqc=
X-Gm-Gg: ASbGncsFIseNDnI4fhop9VLf2q8Aate2wRBLYnexoI5I3kJB7ezwkmjmVVrghLHmtpl
 9vq41Fm/FYbAQPmhM5DDDW5WcGZnjtnYp0BN2Kp22G/JL6q3Krw/duyjKU2xAonOUIuZdVkmLK/
 MupaY7ekC9egFDKeMV0aUlBU/nS6cLxxK2PRGgSVQz5xFC4WeGh4rxA/5W4i2MDTe8bWZH1ltSS
 hBiT9TN6wJeYB6JuLdeWWstEw9whIY+3vtzhuIZ7w==
X-Google-Smtp-Source: AGHT+IG5U0Eumdkhgs3ZTkKPMS/4Rb73f9mP3aRqyn6uSv8WeH/xE+vmhbGPGRxYn5U9jd62L36Ma2NvyTZnXTEMvR4=
X-Received: by 2002:a05:6e02:1fcb:b0:42d:8a3f:ec97 with SMTP id
 e9e14a558f8ab-42e7acec115mr39864895ab.7.1759508872113; Fri, 03 Oct 2025
 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250926093008.1949131-1-rk0006818@gmail.com>
In-Reply-To: <20250926093008.1949131-1-rk0006818@gmail.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Fri, 3 Oct 2025 21:57:41 +0530
X-Gm-Features: AS18NWDZ_gXdepyRkdwU1-tDYNyL9KYbRkfzf6IcxW7mLWHegU6DwrwHAm3T6WM
Message-ID: <CAKY2RybB1CRtXLCeyPq3Ja+xbhDo8DChK+U=JiCxw99ynmoCOA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: Liviu Dudau <liviu.dudau@arm.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-kernel-mentees <linux-kernel-mentees@lists.linux.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000004d36dd06404395c8"
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

--0000000000004d36dd06404395c8
Content-Type: text/plain; charset="UTF-8"

Hi Liviu,

Just following up to ask if anything more is needed from my side for this
patch, or if you plan to pick it up in this merge window.

Thanks,
Rahul

On Fri, 26 Sept, 2025, 3:00 pm Rahul Kumar, <rk0006818@gmail.com> wrote:

> Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
> calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
>
> The new drm_*() logging functions take a struct drm_device * as the
> first argument. This allows the DRM core to prefix log messages with
> the specific DRM device name and instance, which is essential for
> distinguishing logs when multiple GPUs or display controllers are present.
>
> This change aligns komeda with the DRM TODO item: "Convert logging to
> drm_* functions with drm_device parameter".
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
> Changes since v2:
> - Added Reviewed-by tag from Liviu Dudau
>
> Link to v1:
> https://lore.kernel.org/all/aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com/
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 31 +++++++++++--------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 2ad33559a33a..5a66948ffd24 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
>  static int
>  komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  {
> +       struct drm_device *drm = kcrtc->base.dev;
>         struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
>         struct komeda_pipeline *master = kcrtc->master;
>         struct komeda_crtc_state *kcrtc_st =
> to_kcrtc_st(kcrtc->base.state);
> @@ -128,8 +129,8 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>
>         err = mdev->funcs->change_opmode(mdev, new_mode);
>         if (err) {
> -               DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> -                         mdev->dpmode, new_mode);
> +               drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
> +                       mdev->dpmode, new_mode);
>                 goto unlock;
>         }
>
> @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>         if (new_mode != KOMEDA_MODE_DUAL_DISP) {
>                 err = clk_set_rate(mdev->aclk,
> komeda_crtc_get_aclk(kcrtc_st));
>                 if (err)
> -                       DRM_ERROR("failed to set aclk.\n");
> +                       drm_err(drm, "failed to set aclk.\n");
>                 err = clk_prepare_enable(mdev->aclk);
>                 if (err)
> -                       DRM_ERROR("failed to enable aclk.\n");
> +                       drm_err(drm, "failed to enable aclk.\n");
>         }
>
>         err = clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
>         if (err)
> -               DRM_ERROR("failed to set pxlclk for pipe%d\n", master->id);
> +               drm_err(drm, "failed to set pxlclk for pipe%d\n",
> master->id);
>         err = clk_prepare_enable(master->pxlclk);
>         if (err)
> -               DRM_ERROR("failed to enable pxl clk for pipe%d.\n",
> master->id);
> +               drm_err(drm, "failed to enable pxl clk for pipe%d.\n",
> master->id);
>
>  unlock:
>         mutex_unlock(&mdev->lock);
> @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  static int
>  komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  {
> +       struct drm_device *drm = kcrtc->base.dev;
>         struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
>         struct komeda_pipeline *master = kcrtc->master;
>         u32 new_mode;
> @@ -180,8 +182,8 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>
>         err = mdev->funcs->change_opmode(mdev, new_mode);
>         if (err) {
> -               DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> -                         mdev->dpmode, new_mode);
> +               drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
> +                       mdev->dpmode, new_mode);
>                 goto unlock;
>         }
>
> @@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>                               struct komeda_events *evts)
>  {
> +       struct drm_device *drm = kcrtc->base.dev;
>         struct drm_crtc *crtc = &kcrtc->base;
>         u32 events = evts->pipes[kcrtc->master->id];
>
> @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc
>  *kcrtc,
>                 if (wb_conn)
>                         drm_writeback_signal_completion(&wb_conn->base, 0);
>                 else
> -                       DRM_WARN("CRTC[%d]: EOW happen but no
> wb_connector.\n",
> +                       drm_warn(drm, "CRTC[%d]: EOW happen but no
> wb_connector.\n",
>                                  drm_crtc_index(&kcrtc->base));
>         }
>         /* will handle it together with the write back support */
> @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc
>  *kcrtc,
>                         crtc->state->event = NULL;
>                         drm_crtc_send_vblank_event(crtc, event);
>                 } else {
> -                       DRM_WARN("CRTC[%d]: FLIP happened but no pending
> commit.\n",
> +                       drm_warn(drm, "CRTC[%d]: FLIP happened but no
> pending commit.\n",
>                                  drm_crtc_index(&kcrtc->base));
>                 }
>                 spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct
> komeda_crtc *kcrtc,
>
>         /* wait the flip take affect.*/
>         if (wait_for_completion_timeout(flip_done, HZ) == 0) {
> -               DRM_ERROR("wait pipe%d flip done timeout\n",
> kcrtc->master->id);
> +               drm_err(drm, "wait pipe%d flip done timeout\n",
> kcrtc->master->id);
>                 if (!input_flip_done) {
>                         unsigned long flags;
>
> @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_funcs =
> {
>  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>                            struct komeda_dev *mdev)
>  {
> +       struct drm_device *drm = &kms->base;
>         struct komeda_crtc *crtc;
>         struct komeda_pipeline *master;
>         char str[16];
> @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>                 else
>                         sprintf(str, "None");
>
> -               DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
> +               drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
>                          kms->n_crtcs, master->id, str);
>
>                 kms->n_crtcs++;
> @@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev,
>                                 struct komeda_pipeline *pipe,
>                                 struct drm_encoder *encoder)
>  {
> +       struct drm_device *drm = encoder->dev;
>         struct drm_bridge *bridge;
>         int err;
>
> @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
>
>         err = drm_bridge_attach(encoder, bridge, NULL, 0);
>         if (err)
> -               dev_err(dev, "bridge_attach() failed for pipe: %s\n",
> +               drm_err(drm, "bridge_attach() failed for pipe: %s\n",
>                         of_node_full_name(pipe->of_node));
>
>         return err;
> --
> 2.43.0
>
>

--0000000000004d36dd06404395c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p>Hi Liviu,</p>
<p>Just following up to ask if anything more is needed from my side for thi=
s patch, or if you plan to pick it up in this merge window.</p>
<p>Thanks,<br>
Rahul</p></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 26 Sept, 2025, 3:00 pm Rahul Kumar, =
&lt;<a href=3D"mailto:rk0006818@gmail.com">rk0006818@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Replace all dev_err(), dev_warn(=
), dev_info() and DRM_ERROR/WARN/INFO()<br>
calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the<br>
corresponding drm_err(), drm_warn(), and drm_info() helpers.<br>
<br>
The new drm_*() logging functions take a struct drm_device * as the<br>
first argument. This allows the DRM core to prefix log messages with<br>
the specific DRM device name and instance, which is essential for<br>
distinguishing logs when multiple GPUs or display controllers are present.<=
br>
<br>
This change aligns komeda with the DRM TODO item: &quot;Convert logging to<=
br>
drm_* functions with drm_device parameter&quot;.<br>
<br>
Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rk0006818@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">rk0006818@gmail.com</a>&gt;<br>
Reviewed-by: Liviu Dudau &lt;<a href=3D"mailto:liviu.dudau@arm.com" target=
=3D"_blank" rel=3D"noreferrer">liviu.dudau@arm.com</a>&gt;<br>
---<br>
Changes since v2:<br>
- Added Reviewed-by tag from Liviu Dudau<br>
<br>
Link to v1:<br>
<a href=3D"https://lore.kernel.org/all/aJshoswGslcYQFLI@e110455-lin.cambrid=
ge.arm.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.k=
ernel.org/all/aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com/</a><br>
---<br>
=C2=A0.../gpu/drm/arm/display/komeda/komeda_crtc.c=C2=A0 | 31 +++++++++++--=
------<br>
=C2=A01 file changed, 18 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu=
/drm/arm/display/komeda/komeda_crtc.c<br>
index 2ad33559a33a..5a66948ffd24 100644<br>
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c<br>
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c<br>
@@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,<br>
=C2=A0static int<br>
=C2=A0komeda_crtc_prepare(struct komeda_crtc *kcrtc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D kcrtc-&gt;<a href=3D=
"http://base.dev" rel=3D"noreferrer noreferrer" target=3D"_blank">base.dev<=
/a>;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_dev *mdev =3D kcrtc-&gt;base.dev-=
&gt;dev_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_pipeline *master =3D kcrtc-&gt;ma=
ster;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_crtc_state *kcrtc_st =3D to_kcrtc=
_st(kcrtc-&gt;base.state);<br>
@@ -128,8 +129,8 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mdev-&gt;funcs-&gt;change_opmode(mdev, =
new_mode);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;fai=
led to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mdev-&gt;dpmode, new_mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
failed to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mdev-&gt;dpmode, new_mode);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unlock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_mode !=3D KOMEDA_MODE_DUAL_DISP) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D clk_set_rat=
e(mdev-&gt;aclk, komeda_crtc_get_aclk(kcrtc_st));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DRM_ERROR(&quot;failed to set aclk.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_err(drm, &quot;failed to set aclk.\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D clk_prepare=
_enable(mdev-&gt;aclk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DRM_ERROR(&quot;failed to enable aclk.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_err(drm, &quot;failed to enable aclk.\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D clk_set_rate(master-&gt;pxlclk, mode-&g=
t;crtc_clock * 1000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;fai=
led to set pxlclk for pipe%d\n&quot;, master-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
failed to set pxlclk for pipe%d\n&quot;, master-&gt;id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D clk_prepare_enable(master-&gt;pxlclk);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;fai=
led to enable pxl clk for pipe%d.\n&quot;, master-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
failed to enable pxl clk for pipe%d.\n&quot;, master-&gt;id);<br>
<br>
=C2=A0unlock:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;mdev-&gt;lock);<br>
@@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)<br>
=C2=A0static int<br>
=C2=A0komeda_crtc_unprepare(struct komeda_crtc *kcrtc)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D kcrtc-&gt;<a href=3D=
"http://base.dev" rel=3D"noreferrer noreferrer" target=3D"_blank">base.dev<=
/a>;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_dev *mdev =3D kcrtc-&gt;base.dev-=
&gt;dev_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_pipeline *master =3D kcrtc-&gt;ma=
ster;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 new_mode;<br>
@@ -180,8 +182,8 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mdev-&gt;funcs-&gt;change_opmode(mdev, =
new_mode);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;fai=
led to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mdev-&gt;dpmode, new_mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
failed to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mdev-&gt;dpmode, new_mode);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unlock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)<br>
=C2=A0void komeda_crtc_handle_event(struct komeda_crtc=C2=A0 =C2=A0*kcrtc,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_events *evts)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D kcrtc-&gt;<a href=3D=
"http://base.dev" rel=3D"noreferrer noreferrer" target=3D"_blank">base.dev<=
/a>;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc *crtc =3D &amp;kcrtc-&gt;base;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 events =3D evts-&gt;pipes[kcrtc-&gt;master-=
&gt;id];<br>
<br>
@@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc=C2=A0 =
=C2=A0*kcrtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wb_conn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 drm_writeback_signal_completion(&amp;wb_conn-&gt;base, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DRM_WARN(&quot;CRTC[%d]: EOW happen but no wb_connector.\n&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_warn(drm, &quot;CRTC[%d]: EOW happen but no wb_connector.\n&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_index(&amp;kcrtc-&gt;=
base));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* will handle it together with the write back =
support */<br>
@@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc=C2=A0 =
=C2=A0*kcrtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 crtc-&gt;state-&gt;event =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 drm_crtc_send_vblank_event(crtc, event);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DRM_WARN(&quot;CRTC[%d]: FLIP happened but no pending commit.\n&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_warn(drm, &quot;CRTC[%d]: FLIP happened but no pending commit=
.\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_index(&amp;kcrtc-&gt;=
base));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrest=
ore(&amp;crtc-&gt;dev-&gt;event_lock, flags);<br>
@@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_=
crtc *kcrtc,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* wait the flip take affect.*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wait_for_completion_timeout(flip_done, HZ) =
=3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;wai=
t pipe%d flip done timeout\n&quot;, kcrtc-&gt;master-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
wait pipe%d flip done timeout\n&quot;, kcrtc-&gt;master-&gt;id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!input_flip_don=
e) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned long flags;<br>
<br>
@@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_funcs =
=3D {<br>
=C2=A0int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_dev *mdev)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D &amp;kms-&gt;base;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_crtc *crtc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_pipeline *master;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char str[16];<br>
@@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sprintf(str, &quot;None&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;CRTC=
-%d: master(pipe-%d) slave(%s).\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_info(drm, &quot=
;CRTC-%d: master(pipe-%d) slave(%s).\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0kms-&gt;n_crtcs, master-&gt;id, str);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kms-&gt;n_crtcs++;<=
br>
@@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct komeda_pipeline *pipe,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_encoder *encoder)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D encoder-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge *bridge;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
<br>
@@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D drm_bridge_attach(encoder, bridge, NULL=
, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
bridge_attach() failed for pipe: %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
bridge_attach() failed for pipe: %s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 of_node_full_name(pipe-&gt;of_node));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--0000000000004d36dd06404395c8--
