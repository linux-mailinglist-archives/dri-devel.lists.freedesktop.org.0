Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1497A89D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 23:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F75110E1AB;
	Mon, 16 Sep 2024 21:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AlbwODHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DAF10E0B8;
 Mon, 16 Sep 2024 21:12:31 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2d88ec20283so409227a91.0; 
 Mon, 16 Sep 2024 14:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726521151; x=1727125951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAbP4b2QjvrKLx9SqOhnM4gtxKV8osDm1elhFRlMK3w=;
 b=AlbwODHeOJaNtaemTb0ccDeEb98EEUWMW1dCw5G7RD+J2QDkEc/H4VYPElTWJ8XL1Z
 ZJzyQ+cXCyr8Z3vTMYhkaZJyqgd0NSRereFHLHJDwER1ZKyhqrJ1xFKVN7EYyt+suNIV
 +snZoz9eC/IVMyP005N6vgWaI42UqKMg2gv49WrLKHdTkJCOWxn+KAC1WzES4nnEQwT4
 YIcuQhPfZgs9KaUUqvheJRt7+UR76qR8VIGgn3RCbihs5h6KCRmjRxv+1j6DdZg9ajWz
 1QwbVa/bnGq471Ateg94CoH64OQFLmxoOxcRl+o5rvPa4/pUmTbmIZ78GgrY8JB2b40g
 VZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726521151; x=1727125951;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xAbP4b2QjvrKLx9SqOhnM4gtxKV8osDm1elhFRlMK3w=;
 b=l9UMkvXY+d7qfVDt4uwWvde3qcwI+fvq+yDUAvgJOqryOFrX6MReP/q7gYrXu9kSE9
 X9I99PidRlUrb5eWiO+TabJb3MXHi85f+1SEgcgMwKRUqC1Wgjv2aF5ZccZbNKobeCU3
 PH6+cdH9U87UBlRNRdbP+CatQrcjOhnhqu+qkEG8FA+Yo0SfuMaCjimV/oKkgRHTImJY
 l/mYRTXtHzBBnkdOb8+EMhdW7/LEDeaFHkllCJcWdd2Z9teVNdJGM7J7TuBCEGymnbYe
 TZmSSzYxmtOCb/6e89IcAt7yc78G7z5jEEb4u89lW+VDh3a5hLMwOhU92QEt+HT3/zL9
 sigA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW29sbxVjcFVpAZsfGTfd90MfkeShNIw0HybCT/SIhezhjuBqKrVJy9cgmtZF5L4KzQ+fBqoigA@lists.freedesktop.org,
 AJvYcCWF1gsbj509PWAiFTWQQXeM3JL7Fjfb+cQlqBqQAwIMAhkMn485/v1l4N38984MmHVP1r3DG7S9V5Cu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnP19n57vJ/NFBiTKfewp1t6rXFCezoBj9PUXJodTzyI16RTXY
 GWam/87LUVyTpdosURviMOIbat5JZFFz8TOL3uz8wm/UDM8urvcS9Gf/H7++JabZgYwM9FyBCxR
 qyHEIyigyZ4VOoDmsMc2pgnNM/k4=
X-Google-Smtp-Source: AGHT+IFRrNEmKtbJ19RItAc5lDSWsHbDbxi/uYfqJjYD4JxA1G6o1DQn01TL1PPolbqBg/Dhpyu2JdwgHzd6trRYmE4=
X-Received: by 2002:a17:902:e845:b0:207:d98:52ec with SMTP id
 d9443c01a7336-2076e448080mr105306865ad.14.1726521150347; Mon, 16 Sep 2024
 14:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726490926.git.tjakobi@math.uni-bielefeld.de>
 <24dcaa14eba59e211355d4798df02ccb64d460ba.1726490926.git.tjakobi@math.uni-bielefeld.de>
In-Reply-To: <24dcaa14eba59e211355d4798df02ccb64d460ba.1726490926.git.tjakobi@math.uni-bielefeld.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Sep 2024 17:12:18 -0400
Message-ID: <CADnq5_OxGp6AH+H3igpZNs_OK1wN=hu5AkQK9EBwfrJ2T2etLw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amd/display: handle nulled pipe context in
 DCE110's set_drr()
To: tjakobi@math.uni-bielefeld.de
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org, 
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>

And applied.

Thanks!

On Mon, Sep 16, 2024 at 9:03=E2=80=AFAM <tjakobi@math.uni-bielefeld.de> wro=
te:
>
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> As set_drr() is called from IRQ context, it can happen that the
> pipe context has been nulled by dc_state_destruct().
>
> Apply the same protection here that is already present for
> dcn35_set_drr() and dcn10_set_drr(). I.e. fetch the tg pointer
> first (to avoid a race with dc_state_destruct()), and then
> check the local copy before using it.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> Fixes: 06ad7e164256 ("drm/amd/display: Destroy DC context while keeping D=
ML and DML2")
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  .../amd/display/dc/hwss/dce110/dce110_hwseq.c | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/=
drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> index 0d3ea291eeee..666dfc6d192e 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> @@ -1970,13 +1970,20 @@ static void set_drr(struct pipe_ctx **pipe_ctx,
>          * as well.
>          */
>         for (i =3D 0; i < num_pipes; i++) {
> -               pipe_ctx[i]->stream_res.tg->funcs->set_drr(
> -                       pipe_ctx[i]->stream_res.tg, &params);
> -
> -               if (adjust.v_total_max !=3D 0 && adjust.v_total_min !=3D =
0)
> -                       pipe_ctx[i]->stream_res.tg->funcs->set_static_scr=
een_control(
> -                                       pipe_ctx[i]->stream_res.tg,
> -                                       event_triggers, num_frames);
> +               /* dc_state_destruct() might null the stream resources, s=
o fetch tg
> +                * here first to avoid a race condition. The lifetime of =
the pointee
> +                * itself (the timing_generator object) is not a problem =
here.
> +                */
> +               struct timing_generator *tg =3D pipe_ctx[i]->stream_res.t=
g;
> +
> +               if ((tg !=3D NULL) && tg->funcs) {
> +                       if (tg->funcs->set_drr)
> +                               tg->funcs->set_drr(tg, &params);
> +                       if (adjust.v_total_max !=3D 0 && adjust.v_total_m=
in !=3D 0)
> +                               if (tg->funcs->set_static_screen_control)
> +                                       tg->funcs->set_static_screen_cont=
rol(
> +                                               tg, event_triggers, num_f=
rames);
> +               }
>         }
>  }
>
> --
> 2.44.2
>
