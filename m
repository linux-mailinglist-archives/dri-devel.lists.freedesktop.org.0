Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2B3760157
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B868210E36C;
	Mon, 24 Jul 2023 21:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D8310E36B;
 Mon, 24 Jul 2023 21:40:27 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-56347da4a50so3002466eaf.2; 
 Mon, 24 Jul 2023 14:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690234826; x=1690839626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMfua460X0apacBl5wqrH5vgW/88RJ55cY6fU8YFXfA=;
 b=lYGdh2YK5Fg5BkCX4oqNyWwUPhziLbMzoDETdbKONtA8QpFD85AFZjCKIcbkmTVQjw
 A5RqQGx5iyo2Z9yBn8ODp0Uh3rOiv4RrRXgfB8zqxF351PtJ1FkbDMXLcpmqeZsF9o29
 sSN68FinuSEYXQzJdt4aJvOyV4ebADAxreHn57F4uRnuYYCrnxFnXs0242YDPBTIdwe2
 zf91jhq+OmAGmLVUT2zmW/JIjDb/KR6gdQhpD8uYkVu6era/3U1tS8qzl7d9AJVfutNN
 E2TZUe4gQlfOA9F45aV8ifXO/7n07blK0+bzPw88tZ1KHPT35L2PZxKyWAt6Rbv3xG6p
 RSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690234826; x=1690839626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMfua460X0apacBl5wqrH5vgW/88RJ55cY6fU8YFXfA=;
 b=Q7inTPIzrhc7xPzAz8Z0OHrAUUcHXN5TgnRH29mzhL+TqKjXepMB27Y3tXoAvgvTLZ
 +HZKe8O7ITSMaJ++LBqHnaUvw/HPeqPdwU/20ryEo/hRmCCi90VN6l7g6gJ+dBB8wjGy
 8xn5xRAZIFH0n4ZiX4CvMQnHPxoQ0PqkC7d8Tmi9WyD4hIxY4cmuiWk2Wy+GMT2hdiZh
 DbIjbtHbqkW6wLQwbra6ZT9gY71kqt9k9ZBUfiuaH2xE+y1nq3d3HMmeC4M8EoFsKRvH
 LPPWvN0IDf1TsySLOBkWJPtySSnxUEPZDVsWqbRigFr3JwzUUseWSYyDf0k/EUU1LZWU
 LyQA==
X-Gm-Message-State: ABy/qLZF9Lv/LTxnI2dQ+N9QLML5w09IJDSZ/6NR5e07wkVi9b2pVGhO
 LiUG1XYGJrlG+TNK/b8RmwFpF8rXOjtpjjFchio=
X-Google-Smtp-Source: APBJJlE8rJYaFVv1WEucDG903MNh9x+vPzM+y7XkVmyGxftiixebysG6dVf3Mz8h4nHXdpxCd9ypl8ARGVcIR5CCaFU=
X-Received: by 2002:a4a:7607:0:b0:566:6b6a:e1f with SMTP id
 t7-20020a4a7607000000b005666b6a0e1fmr8635081ooc.7.1690234826537; Mon, 24 Jul
 2023 14:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230724033555.8039-1-xujianghui@cdjrlc.com>
 <e30b4bea0907fe4f94459e0afd5c24a9@208suo.com>
In-Reply-To: <e30b4bea0907fe4f94459e0afd5c24a9@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:40:15 -0400
Message-ID: <CADnq5_M_Mu+L2HNBbWn5Q1jEmxXSPAd-=0hg9+smWV6oG0i5tA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: that open brace { should be on the previous
 line
To: sunran001@208suo.com
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Jul 23, 2023 at 11:37=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/clearstate_si.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/clearstate_si.h
> b/drivers/gpu/drm/radeon/clearstate_si.h
> index 356219c6c7f2..7da8418704fe 100644
> --- a/drivers/gpu/drm/radeon/clearstate_si.h
> +++ b/drivers/gpu/drm/radeon/clearstate_si.h
> @@ -23,8 +23,7 @@
>
>   #include "clearstate_defs.h"
>
> -static const u32 si_SECT_CONTEXT_def_1[] =3D
> -{
> +static const u32 si_SECT_CONTEXT_def_1[] =3D {
>       0x00000000, // DB_RENDER_CONTROL
>       0x00000000, // DB_COUNT_CONTROL
>       0x00000000, // DB_DEPTH_VIEW
