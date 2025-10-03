Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DB1BB7CE6
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 19:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F262F10E0EB;
	Fri,  3 Oct 2025 17:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfDu1JKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7D10E0EB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 17:51:37 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-9032edd72c1so275081039f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759513897; x=1760118697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iybLh8+L4TkpxzlAmZmGQVw8GbTyDtpsUZyNN32bmfc=;
 b=UfDu1JKsA+tWG0w3XFFV7EpMr/H7niLnORxO6uS4wLAJ8G778qKgjEbTlTFvSAieJT
 YI7AEc9OqTQ8u6k5nB4UZUkSlO1QkvtZgxF1wPukGNx0kFrgk6Jvo6HOnHz0CAe0CuQr
 3Ru/vH9Bzwi+vLzmS8NjrAISm41JWpq7KN6B6mZ0drhfrg8ISWG8V80QB2eASHBKk6p8
 kSeIr7o5TkxombFt8iSjGCPsDHlFznZB58hJHST5H05YvTISMDTD28mDi08E2wYqU8Nr
 xxCGeHd5pBWwLmi79NMTGvQ/3qFjX4SubXM+t25kzFHBT2jKulq4R/G4S+2GtYEgjSRZ
 h96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759513897; x=1760118697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iybLh8+L4TkpxzlAmZmGQVw8GbTyDtpsUZyNN32bmfc=;
 b=Vht0Fkj10vrBIHqLOgAPxkH3O1QodhdLsgv/2iDQeEWUU9Ky4QpWGSuGH4yHM4J7jH
 BI9VvDWTdlbexbqByBj2KBUZkmdaV+7NVC0002c2g/3L40xvWOSfiVUAyCZmV/RyWvPE
 jEUjJRKkQKhYU6q5VWoFvGdsguO0dC0Y9maOVN5hLzZVgfC6vTRk7WbFVQ377tATxCPO
 YN02zqOXeYXQq+iIQwxR+kMJIgSc5WPcPvtA/+f9YzEpgdhy2b5HIqMOCsj5sh08dmDM
 Lpp6HNL94zqG/oT3fwiG+/KNa72bn4T6zVzDqjQxYmEcyp94Ifpy1TUoHP17EtWs1csT
 pywA==
X-Gm-Message-State: AOJu0Ywc8sHgaB25GanO7sX4q6rcPDzUP+LfsyXyQyh4a6qSczFa3YkI
 vggaYMW9hPN3LimtPyxOCccIq1cfXLENZJK43BRxSvspX0jLF1H6jL5EMNNZmEIuA57v/DFsTAT
 3385wmhRgcKTliDqbrViD4VOMuECQDec=
X-Gm-Gg: ASbGncvjaVtwEnIWKSZbg39T2KnnCtvHFalgJWX5qnfdX6P9qiV6s9E/YWY2lvUN1q0
 O0keVyHx09802InuWvdB9dcolQcONKA+xcALYFZeFRElLG0T4cAM0p9kz3BnupDTrDwhi5q68tv
 HlZAD5nZCo8vWXYKSHRaBhkn0qqhdyu3aatP87DRrbalbq1avidyteVQ2KpUGFSNX3c/4O1nuGA
 54Yr59dfxIOq7s4vzcYk3zqiX0AgUEotFyRI43J
X-Google-Smtp-Source: AGHT+IFxWCl0H0bEwNJ/yNAdI7wLJSC6u/LbBfSQHxB1RSf9qUdhZbywkYmPtERI6GanAV013KE1aJ3+27znXww1NtI=
X-Received: by 2002:a05:6602:6416:b0:914:9a7:c25b with SMTP id
 ca18e2360f4ac-93b96941af7mr584315739f.4.1759513896580; Fri, 03 Oct 2025
 10:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250926093008.1949131-1-rk0006818@gmail.com>
In-Reply-To: <20250926093008.1949131-1-rk0006818@gmail.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Fri, 3 Oct 2025 23:21:25 +0530
X-Gm-Features: AS18NWBAqDBk-brZQipmIu4JtjsscgcOTEoPvU74Cba7HGt69_ZDe9ZZhSKTIwM
Message-ID: <CAKY2RybMM5jcOzO_mknsdH+m9-T+Qe3yMhRrdpV_VE4paUrAKw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
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

Hi Liviu,

Just following up to ask if anything more is needed from my side for
this patch, or if you plan to pick it up in this merge window.

Thanks,
Rahul

On Fri, Sep 26, 2025 at 3:00=E2=80=AFPM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
> calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
>
> The new drm_*() logging functions take a struct drm_device * as the
> first argument. This allows the DRM core to prefix log messages with
> the specific DRM device name and instance, which is essential for
> distinguishing logs when multiple GPUs or display controllers are present=
.
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
> https://lore.kernel.org/all/aJshoswGslcYQFLI@e110455-lin.cambridge.arm.co=
m/
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 31 +++++++++++--------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/g=
pu/drm/arm/display/komeda/komeda_crtc.c
> index 2ad33559a33a..5a66948ffd24 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
>  static int
>  komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  {
> +       struct drm_device *drm =3D kcrtc->base.dev;
>         struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
>         struct komeda_pipeline *master =3D kcrtc->master;
>         struct komeda_crtc_state *kcrtc_st =3D to_kcrtc_st(kcrtc->base.st=
ate);
> @@ -128,8 +129,8 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>
>         err =3D mdev->funcs->change_opmode(mdev, new_mode);
>         if (err) {
> -               DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> -                         mdev->dpmode, new_mode);
> +               drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
> +                       mdev->dpmode, new_mode);
>                 goto unlock;
>         }
>
> @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>         if (new_mode !=3D KOMEDA_MODE_DUAL_DISP) {
>                 err =3D clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kcr=
tc_st));
>                 if (err)
> -                       DRM_ERROR("failed to set aclk.\n");
> +                       drm_err(drm, "failed to set aclk.\n");
>                 err =3D clk_prepare_enable(mdev->aclk);
>                 if (err)
> -                       DRM_ERROR("failed to enable aclk.\n");
> +                       drm_err(drm, "failed to enable aclk.\n");
>         }
>
>         err =3D clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
>         if (err)
> -               DRM_ERROR("failed to set pxlclk for pipe%d\n", master->id=
);
> +               drm_err(drm, "failed to set pxlclk for pipe%d\n", master-=
>id);
>         err =3D clk_prepare_enable(master->pxlclk);
>         if (err)
> -               DRM_ERROR("failed to enable pxl clk for pipe%d.\n", maste=
r->id);
> +               drm_err(drm, "failed to enable pxl clk for pipe%d.\n", ma=
ster->id);
>
>  unlock:
>         mutex_unlock(&mdev->lock);
> @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>  static int
>  komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>  {
> +       struct drm_device *drm =3D kcrtc->base.dev;
>         struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
>         struct komeda_pipeline *master =3D kcrtc->master;
>         u32 new_mode;
> @@ -180,8 +182,8 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>
>         err =3D mdev->funcs->change_opmode(mdev, new_mode);
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
> +       struct drm_device *drm =3D kcrtc->base.dev;
>         struct drm_crtc *crtc =3D &kcrtc->base;
>         u32 events =3D evts->pipes[kcrtc->master->id];
>
> @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *k=
crtc,
>                 if (wb_conn)
>                         drm_writeback_signal_completion(&wb_conn->base, 0=
);
>                 else
> -                       DRM_WARN("CRTC[%d]: EOW happen but no wb_connecto=
r.\n",
> +                       drm_warn(drm, "CRTC[%d]: EOW happen but no wb_con=
nector.\n",
>                                  drm_crtc_index(&kcrtc->base));
>         }
>         /* will handle it together with the write back support */
> @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *k=
crtc,
>                         crtc->state->event =3D NULL;
>                         drm_crtc_send_vblank_event(crtc, event);
>                 } else {
> -                       DRM_WARN("CRTC[%d]: FLIP happened but no pending =
commit.\n",
> +                       drm_warn(drm, "CRTC[%d]: FLIP happened but no pen=
ding commit.\n",
>                                  drm_crtc_index(&kcrtc->base));
>                 }
>                 spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komed=
a_crtc *kcrtc,
>
>         /* wait the flip take affect.*/
>         if (wait_for_completion_timeout(flip_done, HZ) =3D=3D 0) {
> -               DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->maste=
r->id);
> +               drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->ma=
ster->id);
>                 if (!input_flip_done) {
>                         unsigned long flags;
>
> @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_funcs =
=3D {
>  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>                            struct komeda_dev *mdev)
>  {
> +       struct drm_device *drm =3D &kms->base;
>         struct komeda_crtc *crtc;
>         struct komeda_pipeline *master;
>         char str[16];
> @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms=
,
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
> +       struct drm_device *drm =3D encoder->dev;
>         struct drm_bridge *bridge;
>         int err;
>
> @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
>
>         err =3D drm_bridge_attach(encoder, bridge, NULL, 0);
>         if (err)
> -               dev_err(dev, "bridge_attach() failed for pipe: %s\n",
> +               drm_err(drm, "bridge_attach() failed for pipe: %s\n",
>                         of_node_full_name(pipe->of_node));
>
>         return err;
> --
> 2.43.0
>
