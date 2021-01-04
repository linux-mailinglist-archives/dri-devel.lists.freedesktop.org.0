Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6F2E9BE3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 18:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C898979E;
	Mon,  4 Jan 2021 17:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077778979E;
 Mon,  4 Jan 2021 17:21:57 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id w3so26703893otp.13;
 Mon, 04 Jan 2021 09:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OHkwo95cf4KutEaWyT4gAn6XzpYTSZLdpJFt9bn4zyY=;
 b=vOG82DYj4Jk2GQEep/efWaD7lM6x8IemKMz18A6W0v3CUTowhdhIiGN/GSuw6deff7
 mpPMeJOxXolsNSbRYBXZvrtFVGlkks2MtUuEH0CSpGe6/1c1GDvZS99LW9qcxa4Ywf1C
 zJr+BOds+aLaRc94WcHbzja5XSkoOYZYyKH3IFmV5mlsQN6/zTTUnnelBrBSrj1m4MT8
 OPX4k4WYPZss2kSQfXkLPgVWLmCBJ1LWwDWFSY2O8vQURP6F+GcBXALj2kW8qx869wet
 xYYoCHgtWTSB8im4eHL49GwDqgqrY13q1gv1MvVwMhYvWBFt7oZX8eg33JWqFHmpvjaC
 ei3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OHkwo95cf4KutEaWyT4gAn6XzpYTSZLdpJFt9bn4zyY=;
 b=gr2OLAI5sOmmY1VcUUP65N9GCeMmFqe8LXseMRfpXTHFP1Ekc0FyftuKdRwD9e5I46
 wzTkn5TuRdHxrQkxhrFuZJHgKqY06jtaprcu2LzlB4Fcz0vZVddDFJvyl1cGUNwau/f4
 v5BGqSrWW2mOQ713q7+QLqkaNs+0XkdK3zJv0zi73+hSzJgQzV/Dh4+J9t7iiqCDIo/v
 7Ebd08MeG1HMljbT4q+KBR37ov7DBR4A59ledZ3P2EqMYyomDYQ/8/X3cbFLf1GCKtTM
 sJuVlgAlq0AtLZy4XF47wuMzRBrrbNyyX5Usw4FA11eYROsVT4GL0Ksk83I7elp5SroE
 REcQ==
X-Gm-Message-State: AOAM53317uGu0DS3+Gg6ZOcUHH2XsZqgkedtSYkIGengi7zenVPzs0fo
 FFraDTWucTDj972kEG0OiE0EGCDM2buZgmMgoWs=
X-Google-Smtp-Source: ABdhPJxj5d5/6UOHNpBETcFvPEbS3qx3lwPq/FDuHPmO6D3xgg1lUBolISGB8+dMAszkYGuqc5vlmosWrpPK+z1DFmg=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr38895316otl.311.1609780916392; 
 Mon, 04 Jan 2021 09:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Jan 2021 12:21:45 -0500
Message-ID: <CADnq5_PYBEgtnCWk1EkYju8Qnwsr-BgcRL5x09SxFBi1ptTDEg@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Zhan Liu <zhan.liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 2, 2021 at 9:02 AM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> With modifiers one can actually have different format_info structs
> for the same format, which now matters for AMDGPU since we convert
> implicit modifiers to explicit modifiers with multiple planes.
>
> I checked other drivers and it doesn't look like they end up triggering
> this case so I think this is safe to relax.
>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index e6231947f987..f5085990cfac 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>         if (ret)
>                 goto out;
>
> -       if (old_fb->format != fb->format) {
> +       if (old_fb->format->format != fb->format->format) {
>                 DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
>                 ret = -EINVAL;
>                 goto out;
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
