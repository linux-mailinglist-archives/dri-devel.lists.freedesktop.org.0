Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C29D1493
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B155910E515;
	Mon, 18 Nov 2024 15:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OJrzEOIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F5510E514;
 Mon, 18 Nov 2024 15:38:10 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ea456f1029so114006a91.2; 
 Mon, 18 Nov 2024 07:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731944290; x=1732549090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTYbN1OsvdU5Dd4t4uAh14jyVMSTfclkWku0ijH9Wm8=;
 b=OJrzEOIGKfg4Vq3A8VleTcl30xJE7XGHpB86HxPyL3TB8vnzUTCTZgHx/aSKa43zMM
 YWC4JynjgLcmZ93Hkd6RFDL3/UpiJPbb17hW1wdpugs5fJfMWyzOpCbABCpbiZ+lHMXR
 Ld4+g3UqDq7lMHGIqsKYwx8od8qyxpCSY1qc3lrAaYQgGjNOqW+FVWBjDrBQQhfRDRxY
 cgwHh8ocA/+rzmOe3rwhSYr7YPOMf9I1dSlKjtNsMdML/1SMZzcDLr4Q9nB5pN/WCrQH
 pGnC2yY3GkAQ/deMkW0kvZrmNUR4DUdLQNnQ3a28mKBtKF3yB3tR3VKheSgSlvNKwsQY
 NnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731944290; x=1732549090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nTYbN1OsvdU5Dd4t4uAh14jyVMSTfclkWku0ijH9Wm8=;
 b=Vq5ET5nrYlNMowDayIIptqbpoEOvZ6h14A/rnFNAOKK52xdSSY4wvFxVGSc6bIcsQk
 D08RrZq6lgcPAX0r/f7DYCJPf1TKb5Vr6c1rq/sPRXT/6pQOQ1i+RvmqLw4NELF5SU/P
 oKwjdPxDzpXyKq2AxqJLHGUsZzB1xwPalpjxNgPgi3JPG03VFQyl6YsoM/M82JvhXnVa
 CrzyBRl1uM59YEHha08LF/q8e3flnEVdlSmGFXnrp4PJb/iPNoe/sBYQNvwRnYK8twln
 ySHRv6Tn68+l76HDstfo6Tiu9Kk99pjICrfRgkb+i5psWVaOG5+Y3ru4w1U/hsfS0G4W
 M9zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS2O3LWFePX9YSlVAhQSEmAQ2YW9ylWRWXEZgqDB6grrKiRZUsfvyuGuTmxudpNH2Kx/a83KqIlSNy@lists.freedesktop.org,
 AJvYcCXCi3LfgUNUA84RmM9oAj5JhwWjA5x1P3zG23dFxGxPtUretsePFNV0ti4J7RBvekm+8KHklEQC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNrcQmDNt4wSnBWHIETPgD34IWby1saSXQ6i749ukILhYn2Hq8
 tmwWYx4KFQPwfhVubEqxZXUvP5QhtDaOT9GcQHCpGFSvJDGkY+rN3QiOgs0H6qSnrDotU2GJb6I
 YsbzNh4pP9IbPNy7xwuohMaO9dRA=
X-Google-Smtp-Source: AGHT+IEN02qRQSfSFYKEmvCrxizXKdSQjzhxs2MHTfZpG06Cqh+0iQYE11DVNoao0qWezYQn+s8IlKyg0rbWaOn2IjI=
X-Received: by 2002:a17:90b:3803:b0:2e2:a60f:289e with SMTP id
 98e67ed59e1d1-2ea151f4782mr6268389a91.0.1731944290121; Mon, 18 Nov 2024
 07:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20241115-hdmi-audio-radeon-connectors-v1-1-d6d66d3128dd@chromium.org>
In-Reply-To: <20241115-hdmi-audio-radeon-connectors-v1-1-d6d66d3128dd@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2024 10:37:58 -0500
Message-ID: <CADnq5_MmRYfd-Be-GYs6cowfcjX6XLfmD-FVoM_FpZA6so+y2w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Fix spurious unplug event on radeon HDMI
To: "Steven 'Steve' Kendall" <skend@chromium.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Takashi Iwai <tiwai@suse.de>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, Nov 16, 2024 at 4:51=E2=80=AFAM Steven 'Steve' Kendall
<skend@chromium.org> wrote:
>
> On several HP models (tested on HP 3125 and HP Probook 455 G2),
> spurious unplug events are emitted upon login on Chrome OS.
> This is likely due to the way Chrome OS restarts graphics
> upon login, so it's possible it's an issue on other
> distributions but not as common, though I haven't
> reproduced the issue elsewhere.
> Use logic from an earlier version of the merged change
> (see link below) which iterates over connectors and finds
> matching encoders, rather than the other way around.
> Also fixes an issue with screen mirroring on Chrome OS.
> I've deployed this patch on Fedora and did not observe
> any regression on these devices.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1569#note_1603002
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3771
> Fixes: 20ea34710f7b ("drm/radeon: Add HD-audio component notifier support=
 (v6)")
> Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
> ---
>  drivers/gpu/drm/radeon/radeon_audio.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
> index 47aa06a9a942..5b69cc8011b4 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -760,16 +760,20 @@ static int radeon_audio_component_get_eld(struct de=
vice *kdev, int port,
>         if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initiali=
zed)
>                 return 0;
>
> -       list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.enco=
der_list, head) {
> +       list_for_each_entry(connector, &dev->mode_config.connector_list, =
head) {
> +               const struct drm_connector_helper_funcs *connector_funcs =
=3D
> +                               connector->helper_private;
> +               encoder =3D connector_funcs->best_encoder(connector);
> +
> +               if (!encoder)
> +                       continue;
> +
>                 if (!radeon_encoder_is_digital(encoder))
>                         continue;
>                 radeon_encoder =3D to_radeon_encoder(encoder);
>                 dig =3D radeon_encoder->enc_priv;
>                 if (!dig->pin || dig->pin->id !=3D port)
>                         continue;
> -               connector =3D radeon_get_connector_for_encoder(encoder);
> -               if (!connector)
> -                       continue;
>                 *enabled =3D true;
>                 ret =3D drm_eld_size(connector->eld);
>                 memcpy(buf, connector->eld, min(max_bytes, ret));
>
> ---
> base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
> change-id: 20241115-hdmi-audio-radeon-connectors-f8ffac989b0d
>
> Best regards,
> --
> Steven 'Steve' Kendall <skend@chromium.org>
>
