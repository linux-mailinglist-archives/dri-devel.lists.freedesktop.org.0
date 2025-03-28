Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95270A7508B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADED110EAB7;
	Fri, 28 Mar 2025 18:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="csZnllke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D1C10EAB6;
 Fri, 28 Mar 2025 18:47:49 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ff67f44fcaso640741a91.3; 
 Fri, 28 Mar 2025 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743187669; x=1743792469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZaBQSGCWBE4y8Yxfb/IZp7h2QC6U5lj6cYuHqPma8Y=;
 b=csZnllkecfd0fKny+DWOG0WJaxOuI7pm2Wi/LUvMqIygQt1etd/DSg96EW1hy8JZCJ
 3gJpw4nGGuDtcsiV4ke51eE2Mi9rfHLoICk1vClvA1vZcgUoRZDpOc5TGpuzSDsQh0gl
 uHaW37S48iMCt0mqDbh0W3vvVQ3HmLWyVzFDXRv2hy3YT42UHDVXvF/J0loFg698mgHr
 8uMboBqvep3skSiv8KDkbzV8n3ky5yVw4DU6dQbxQPmkM9frGcRe9zv9wu3MJlxni350
 Ij1OplsXGdcaTMOx33EXDQZ2MTSN9b2lhzw0R8H0aXL12fZy5Bd2VYb1mlYpauj8K9sm
 4eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743187669; x=1743792469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZaBQSGCWBE4y8Yxfb/IZp7h2QC6U5lj6cYuHqPma8Y=;
 b=aPVd4HEejhSSEKjNtU2uK8JmNNRHoKwQktxS67qF+TiZx6BZSLuX0m2So00cxyHlHi
 yZIC5om2YG1SF+yMYrGJRYY4WCOlaU6m+olNJeY06FhPBBeds7o9k7ty1JMI6MOTxigp
 UoLplkCOX15aCuu7YqwxJ3C1Mfmeec3OyoWIFJUTzbFM9l+FIc7Tx3AbGaMZiQydC1VE
 5M5htjAPsVgIvRiAZReoRCvGtRSBt/wAIVBPkbbQXw5M3MbCDRJ2X/lvbdzn943VWArM
 1C8FQEWNJUTUIbk8TYKPiWnimM6j5tX//JbPOfJmn7DU0LQXzsKTut9glTUqNIoTw2P9
 T2iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGK2PADf1B92IVnGhpG4SbaC5V2+KmMidfuu95Um7CZ+W1WXttFlo73WC8+E9fDGGcZv0aLFHV@lists.freedesktop.org,
 AJvYcCWLn9ATavQ4tPQeuCeKhsZfTrdWSS2Z6x9kl0F4pR7rduvNokw6s14WLF5NIQJDJkRByFzVRKIPbCH3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzt97jIbD44fA3Aqs4jR2rV0clTi2cyOcx1447egMtABijznRt
 E38Z87c+2giISTaOSd0NVO31B1qlq9l5RPFObrBb2CyxB2Mp6Gehlho6DSQ8fW+mPRP8sD3O/lS
 jbYoOAgTaIUVPLAcjX/2USH+Le9c=
X-Gm-Gg: ASbGncv96a4n8OCf2VRrk0VOrzVNz+zU6NkwngrqLLVychFDz5WMm2FL0QmzuQSZijY
 QGewDGR/IVEw81JrOgfFDhIB3HVX7xHvH1i5OiVHw31Kbqz1EH5kiiNdUKBGpeQfjjrp/iSfapS
 EK0hAw/JEUaePwo8KxnUTb7wQjmA==
X-Google-Smtp-Source: AGHT+IGged0fiKJixaESzWEycujCFhGP10Um4mqXsySmBso06gxn7OacXwS/hBBtYkJHKWSaCbjdAnUtABiTT1XdSmY=
X-Received: by 2002:a17:90b:3e8d:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-305321512bdmr184984a91.3.1743187668589; Fri, 28 Mar 2025
 11:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250328032942.16264-1-bold.zone2373@fastmail.com>
In-Reply-To: <20250328032942.16264-1-bold.zone2373@fastmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Mar 2025 14:47:36 -0400
X-Gm-Features: AQ5f1Jq8EA08dieD66Twx8lZwHUaFgRa-kOz_qrrVj6oWZ2bGitqfzj7vLQrjb4
Message-ID: <CADnq5_M63JAhaqoe4OndwmcQN-Sw2NOYfGsd2wgsix_LqNnnjA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: removed unused function
To: James Flowers <bold.zone2373@fastmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev
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

Applied.  Thanks!

Alex

On Thu, Mar 27, 2025 at 11:37=E2=80=AFPM James Flowers
<bold.zone2373@fastmail.com> wrote:
>
> Removed unused function mpc401_get_3dlut_fast_load_status.
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h     | 17 -----------------
>  .../drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c  | 11 -----------
>  .../drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h  | 14 --------------
>  3 files changed, 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/dr=
m/amd/display/dc/inc/hw/mpc.h
> index 3a89cc0cffc1..eaef3899da7b 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -967,23 +967,6 @@ struct mpc_funcs {
>         */
>
>         void (*update_3dlut_fast_load_select)(struct mpc *mpc, int mpcc_i=
d, int hubp_idx);
> -       /**
> -       * @get_3dlut_fast_load_status:
> -       *
> -       * Get 3D LUT fast load status and reference them with done, soft_=
underflow and hard_underflow pointers.
> -       *
> -       * Parameters:
> -       * - [in/out] mpc - MPC context.
> -       * - [in] mpcc_id
> -       * - [in/out] done
> -       * - [in/out] soft_underflow
> -       * - [in/out] hard_underflow
> -       *
> -       * Return:
> -       *
> -       * void
> -       */
> -       void (*get_3dlut_fast_load_status)(struct mpc *mpc, int mpcc_id, =
uint32_t *done, uint32_t *soft_underflow, uint32_t *hard_underflow);
>
>         /**
>         * @populate_lut:
> diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c b/dri=
vers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> index ad67197557ca..98cf0cbd59ba 100644
> --- a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> @@ -47,16 +47,6 @@ void mpc401_update_3dlut_fast_load_select(struct mpc *=
mpc, int mpcc_id, int hubp
>         REG_SET(MPCC_MCM_3DLUT_FAST_LOAD_SELECT[mpcc_id], 0, MPCC_MCM_3DL=
UT_FL_SEL, hubp_idx);
>  }
>
> -void mpc401_get_3dlut_fast_load_status(struct mpc *mpc, int mpcc_id, uin=
t32_t *done, uint32_t *soft_underflow, uint32_t *hard_underflow)
> -{
> -       struct dcn401_mpc *mpc401 =3D TO_DCN401_MPC(mpc);
> -
> -       REG_GET_3(MPCC_MCM_3DLUT_FAST_LOAD_STATUS[mpcc_id],
> -                       MPCC_MCM_3DLUT_FL_DONE, done,
> -                       MPCC_MCM_3DLUT_FL_SOFT_UNDERFLOW, soft_underflow,
> -                       MPCC_MCM_3DLUT_FL_HARD_UNDERFLOW, hard_underflow)=
;
> -}
> -
>  void mpc401_set_movable_cm_location(struct mpc *mpc, enum mpcc_movable_c=
m_location location, int mpcc_id)
>  {
>         struct dcn401_mpc *mpc401 =3D TO_DCN401_MPC(mpc);
> @@ -618,7 +608,6 @@ static const struct mpc_funcs dcn401_mpc_funcs =3D {
>         .set_bg_color =3D mpc1_set_bg_color,
>         .set_movable_cm_location =3D mpc401_set_movable_cm_location,
>         .update_3dlut_fast_load_select =3D mpc401_update_3dlut_fast_load_=
select,
> -       .get_3dlut_fast_load_status =3D mpc401_get_3dlut_fast_load_status=
,
>         .populate_lut =3D mpc401_populate_lut,
>         .program_lut_read_write_control =3D mpc401_program_lut_read_write=
_control,
>         .program_lut_mode =3D mpc401_program_lut_mode,
> diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h b/dri=
vers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> index ce6fbcf14d7a..8e35ebc603a9 100644
> --- a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> @@ -241,23 +241,9 @@ void mpc401_update_3dlut_fast_load_select(
>         int mpcc_id,
>         int hubp_idx);
>
> -void mpc401_get_3dlut_fast_load_status(
> -       struct mpc *mpc,
> -       int mpcc_id,
> -       uint32_t *done,
> -       uint32_t *soft_underflow,
> -       uint32_t *hard_underflow);
> -
>  void mpc401_update_3dlut_fast_load_select(
>         struct mpc *mpc,
>         int mpcc_id,
>         int hubp_idx);
>
> -void mpc401_get_3dlut_fast_load_status(
> -       struct mpc *mpc,
> -       int mpcc_id,
> -       uint32_t *done,
> -       uint32_t *soft_underflow,
> -       uint32_t *hard_underflow);
> -
>  #endif
> --
> 2.49.0
>
