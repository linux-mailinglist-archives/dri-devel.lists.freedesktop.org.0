Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED20CB9B277
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 19:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4935F10E7A6;
	Wed, 24 Sep 2025 17:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LPxt7aTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D264B10E7A6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 17:59:10 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2698d47e6e7so120745ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758736750; x=1759341550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYxzPl4txcDtBsDgUFMQiABFR95EJgZY6ii1JhXVVI8=;
 b=LPxt7aTm2alTEcvD2E9PKlCiYu5XoV3fkdmxsl1JFPrxBHwca34UmzFWBPFW0ChYFk
 F+ln9/xl1WlsMOdug4BICiae2J1AcnK0AGPQ/IBqpTVSWWjj3wUzoPIOmYTZXA+qFuf9
 HMSCN8b5XsW2jHlEcuzhGubMV8XN16BUCu02A5A5zBh3P8V41+dCYkCj09xz69K0+Iq8
 eNNG8AZuljnIRIJeXNezSmXh8/0T3M+lzBxEObXXjQUxkalkkfTsARKoodVlczF5Ngt/
 3bJBY0Kiw9xa6zcojyxTfiPkpxmduA1TEPiNrt5c77RLCpWyt9qykccBeaEwahI+zyau
 01pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758736750; x=1759341550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYxzPl4txcDtBsDgUFMQiABFR95EJgZY6ii1JhXVVI8=;
 b=FMuRfgBrk0+BsT8tF5xXhEJENi4Ca/jhqv7BTL/pJyjiIrFMeE+y8ip92uvhFDPTmY
 9Og4yNj/xs/TWzXD1WkvTecb/lbOL1SjQPcQNXdqfkye+AEXE3sKUwPdrhy7fPwXbhli
 GMERKOxCCPLjxabkF+UVd28kofcWX5negiX4tcY2U8yINhEiR6N5pBtIn+3WKJ/72AFj
 3pdWOQQOKV97qSfWDiRpErZ7FwkCXhtzbwWUP3oKXRqmxttIYgLJOt5lrpSxgTcQ3ZlU
 S39CdCHewy7Ywf9bmGCeo1m9czskZTfAK3mBFdRSoViveq6anEW6dsB2xkjLp7I77Eko
 uUZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPXzvEFXpMlhTPMq8R4PvJqVILhdDzFBgoU6mO0NnX8DG+5dun7Cs43aeha6Dlr1YaiOPcPxIkYdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMdO5YbLv+/U639hcMJHIm9eFKpY8bZlzfQ13AEnqXoYMB85rN
 P2OTDcVOO9dS+x953TbAz14gmYYFMz+bE1NzexFX1L9OspnuuVKzVUp4qyA8Eld2JW/5j/j5zGm
 40ypd0HItGNqzPmbahJY+wTQ0frgNR6Y=
X-Gm-Gg: ASbGncsyf/YQfSoGWzuyOtolpn1MeK2+/+wnE/l+M/Q807NNSyLeOui9kruFTZGPlYI
 FlBiYF5LUcQQMtlDDZBnq5WNbHImy22JFQqzW9wRDLDIGaapyJ33xH885Jmdar3ohs5xGBS0j8R
 TYuwpnzHMCsKjPMSLriNk7OQnHFARd+GgHtGKOsz3uhS2NrC+lw9dUQlPk9O2liL678haFsReQN
 hrtXyvdjJMaXKJuZQ==
X-Google-Smtp-Source: AGHT+IHtmTWOHSGgYcdz8PkfFJmwvin/TwYsBXRKFtdnnBmyjBC8YY/e52r2/3CWmsd7o/0M3YI4RSTRvcUs/JavpQ0=
X-Received: by 2002:a17:902:d508:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-27ed5b0a538mr1060065ad.0.1758736750323; Wed, 24 Sep 2025
 10:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_A8BB4A0E44BDCF1DEC33942D2144C521AF07@qq.com>
In-Reply-To: <tencent_A8BB4A0E44BDCF1DEC33942D2144C521AF07@qq.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Sep 2025 13:58:59 -0400
X-Gm-Features: AS18NWABn1U1ZnqDyt6w4crHZgXq-GwZsjSJiYpEOu3bz9xtozY2P_noK06Meps
Message-ID: <CADnq5_PCGv7a4azG+mhv+=Jmp74-O73iUnZctLkNYKabRGcwMg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Solve the problem of the audio options not
 disappearing promptly after unplugging the HDMI audio.
To: 2564278112@qq.com
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Wang Jiang <jiangwang@kylinos.cn>
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

On Wed, Sep 24, 2025 at 7:44=E2=80=AFAM <2564278112@qq.com> wrote:
>
> From: Wang Jiang <jiangwang@kylinos.cn>
>
> The audio detection process in the Radeon driver is as follows:
> radeon_dvi_detect/radeon_dp_detect -> radeon_audio_detect -> radeon_audio=
_enable -> radeon_audio_component_notify -> radeon_audio_component_get_eld
> When HDMI is unplugged, radeon_dvi_detect is triggered.
> At this point, radeon_audio_detect is triggered before radeon_dvi_detect =
has finished (which also means the new state of the connector has not been =
reported).
> In this scenario, radeon_audio_detect can detect that the connector is di=
sconnected (because the parameter is passed down),
>  but it is very likely that the audio callback function radeon_audio_comp=
onent_get_eld cannot detect the disconnection of the connector.
> As a result, when the audio component (radeon_audio_component_get_eld) pe=
rforms detection, the connector's state is not shown as disconnected,
> and connector->eld is not zero, causing the audio component to think the =
audio driver is still working.
> I have added a new member (enable_mask) to the audio structure to record =
the audio enable status.
> Only when radeon_audio_component_get_eld detects that enable_mask is not =
zero will it continue to work.
> There might be other solutions, such as placing radeon_audio_detect/radeo=
n_audio_component_notify after the completion of radeon_XX_detect.
> However, I found that this would require significant changes (or perhaps =
it's just my limited coding skills?).

This still looks like a race.  I think the get_eld() callback can get
called whenever.  The proper fix is probably to hold the
connector->eld_mutex in radeon_audio_detect().

Alex

>
> Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
> ---
>  drivers/gpu/drm/radeon/radeon.h       | 1 +
>  drivers/gpu/drm/radeon/radeon_audio.c | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
> index 63c47585afbc..2d0a411e3ed6 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -1745,6 +1745,7 @@ struct r600_audio_pin {
>         u32                     offset;
>         bool                    connected;
>         u32                     id;
> +       u8                      enable_mask;
>  };
>
>  struct r600_audio {
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
> index 8d64ba18572e..a0717895cc8a 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -212,6 +212,7 @@ static void radeon_audio_enable(struct radeon_device =
*rdev,
>         if (rdev->audio.funcs->enable)
>                 rdev->audio.funcs->enable(rdev, pin, enable_mask);
>
> +       rdev->audio.pin[pin->id].enable_mask =3D enable_mask;
>         radeon_audio_component_notify(rdev, pin->id);
>  }
>
> @@ -274,6 +275,7 @@ int radeon_audio_init(struct radeon_device *rdev)
>                 rdev->audio.pin[i].connected =3D false;
>                 rdev->audio.pin[i].offset =3D pin_offsets[i];
>                 rdev->audio.pin[i].id =3D i;
> +               rdev->audio.pin[i].enable_mask =3D 0;
>         }
>
>         radeon_audio_interface_init(rdev);
> @@ -760,6 +762,9 @@ static int radeon_audio_component_get_eld(struct devi=
ce *kdev, int port,
>         if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initiali=
zed)
>                 return 0;
>
> +       if (rdev->audio.pin[port].enable_mask =3D=3D 0)
> +               return 0;
> +
>         list_for_each_entry(connector, &dev->mode_config.connector_list, =
head) {
>                 const struct drm_connector_helper_funcs *connector_funcs =
=3D
>                                 connector->helper_private;
> --
> 2.25.1
>
