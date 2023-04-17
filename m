Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DD6E50EC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 21:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26210E190;
	Mon, 17 Apr 2023 19:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E080D10E18D;
 Mon, 17 Apr 2023 19:28:35 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1878504c22aso18236127fac.8; 
 Mon, 17 Apr 2023 12:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681759713; x=1684351713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4g+hmFG2hUra6SC/fsLnmP46WQx2KRuK2G3ZEHGCWs=;
 b=UV93IM6N/SBFjFRKZoUVrsBH/AHHXGJNLxt+tHJsZ90TTOcFg/fp2wfoWCKAvdnSc+
 lUjqCYrCMsR9yRnbBDjSENLH7jNlyBsTdJH17jTw68KrEV4nmPQNjc7uPD/iYCsanN8O
 Y32mQBkCqzy9M4bRaPwHvvnGF3z7Dd6UUFHbNNRZrSv1j+pVRtCQsU/Md2pd0BBLZtnS
 Acq5mbPspUjVLl2FWAyftyTNlWD4vBNEygapFN5yDuqFfKKl4rlGN2V6OMx8O1TMb8AY
 6+zA43YlW5+1xSRPEjL+nuQ3VothVYnr7EQ1GWb4j3bmlK0oGwrvzB3BeZGWc7h3P4pU
 lohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681759713; x=1684351713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4g+hmFG2hUra6SC/fsLnmP46WQx2KRuK2G3ZEHGCWs=;
 b=AXGEPHMpY6bH5E7ecDZcSR4/7Ms2C3tyBkWG0x1UvnDJY5XGWbwFgbt03PhTG12eOb
 Nx4Tef4qPgElHLYW8DyWhBhkfpOUSFsT3PGEYjWMkLZy70oNL39NUDj+6dvUSggILeLe
 nAfB3QUQ45U/lt82d53BTgjARs1hXDUMIaE8Let2BQ6pmUWW0UsNdk9HC0LWgDf8dDPE
 gTSn0MpcMa+v+XP7gtFUxzic2mdxXfonwBVtVe0Ohcd652wnwQS3kFToXMLqlssWCEiy
 66NUJgbnnj76GibzFCVC6fP4bcp3WjZBZ8IVtWB6dE3/0nblvCGnWTb7z7zhlNbwyk6Q
 mj9g==
X-Gm-Message-State: AAQBX9dIfNCK0MjZh2bCotgGL8Dskoxe3LIkFqncGrDzRwL0D2UXzMRB
 RsTFT3YIlDYeAGb+vpzCQdya6tejcXT49zwwcvE=
X-Google-Smtp-Source: AKy350Ype+Viup2qX4/8PJj4TAhayZgd5LJav0NCFhC/hTj2y7gBSdREXeexNBhmWfjamHynt0zsvFQrK9hx1hnLZJY=
X-Received: by 2002:a05:6870:2e0e:b0:187:7524:9a8d with SMTP id
 oi14-20020a0568702e0e00b0018775249a8dmr7534364oab.4.1681759712906; Mon, 17
 Apr 2023 12:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230414150830.3173504-1-trix@redhat.com>
In-Reply-To: <20230414150830.3173504-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Apr 2023 15:28:21 -0400
Message-ID: <CADnq5_OHu7kJGvTVg_oDMadqQFBrhFAZBM9H76y6tiYNsWT+4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused variable oldest_index
To: Tom Rix <trix@redhat.com>
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
Cc: HaoPing.Liu@amd.com, felipe.clark@amd.com, Dillon.Varone@amd.com,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Mike.Hsieh@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, hanghong.ma@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Apr 14, 2023 at 11:08=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> cpp_check reports
> drivers/gpu/drm/amd/display/modules/freesync/freesync.c:1143:17: style: V=
ariable
>   'oldest_index' is assigned a value that is never used. [unreadVariable]
>    oldest_index =3D 0;
>                 ^
>
> This variable is not used so remove.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/dr=
ivers/gpu/drm/amd/display/modules/freesync/freesync.c
> index 5c41a4751db4..5798c0eafa1f 100644
> --- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> +++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> @@ -1137,10 +1137,6 @@ void mod_freesync_handle_preflip(struct mod_freesy=
nc *mod_freesync,
>
>         if (in_out_vrr->supported &&
>                         in_out_vrr->state =3D=3D VRR_STATE_ACTIVE_VARIABL=
E) {
> -               unsigned int oldest_index =3D plane->time.index + 1;
> -
> -               if (oldest_index >=3D DC_PLANE_UPDATE_TIMES_MAX)
> -                       oldest_index =3D 0;
>
>                 last_render_time_in_us =3D curr_time_stamp_in_us -
>                                 plane->time.prev_update_time_in_us;
> --
> 2.27.0
>
