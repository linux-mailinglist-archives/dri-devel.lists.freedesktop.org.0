Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48145694C32
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B44F10E60A;
	Mon, 13 Feb 2023 16:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151F10E60A;
 Mon, 13 Feb 2023 16:16:24 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bj22so10606901oib.11;
 Mon, 13 Feb 2023 08:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3+M7WtemNip/UJvGhOQX8hNfkWUyxL/twEyAekdKObY=;
 b=FS0X5VFg/YFXbL6u6zZoIt3SzuxfTpvN95kD2y5SzyJnr1o4689pb+wARuSrUhiH1O
 G3AkvOikpY9FK1242nbEWxw+tEJIntXD6sGZ0SeXAwvdtJ8VPGNIrn/IE7fBmnH/v2zD
 3nDiLWmBhCap7k5kXMyWCgoFKmWPjpzEIML0mgWCRdtHBU6e6YogxJZw5eDyQdPieVEK
 ynBx5MpB99ZmjGLgpOdR1OijMaCs7ac3zMWwPPzdPMG5FjdVnx2taim7juH0eDvTBmy2
 Yt2k7mUkkGcm+VUf+0L3ySTW8p4OLIwb1obdiIPXDTPIZa+5CJbo7Quc3d5IEacZuIgC
 Y5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3+M7WtemNip/UJvGhOQX8hNfkWUyxL/twEyAekdKObY=;
 b=v1jwJBKDJ9G8aetRcaI3Est/cb0F6AevWA5N+pPUDssQcxa4Dkoq4528DnkwzpUArD
 ETDDtUpC+5n0o3A80KQPxX1A5ASnlnm+VKK0BZapgRLfnBoM12ZZs/BGXDZPulsu6iFE
 gktfiEWnKcJ/O87Z8sBTCauoXENhJFbxC9/CS9D/V5qx6451/kshmmnyqXxvuY1nR+k6
 tiWlSVU6oZJTAvJ3LENzwiO62re8x+uS3IcWVR/KDxf4P8tTngqNPGKpgqqQHYeL6MO4
 74ysfNGU2RrwcW8ilM1e1/uUJj/qol0OWpozwCFW1VZZLK2lFaqgfptW5Ou6HYbm3RKJ
 CkPA==
X-Gm-Message-State: AO0yUKWqIRCR6OiFYXsfwBNZjSXZjED6ZRQDXkTNA3dJyiI3Xao44NE4
 Y3rT7SNCthvJnmcERQCX7uoJq0waFr80gwTJR7U=
X-Google-Smtp-Source: AK7set/69DU7Esqov48oCY93FnjRw6qc7JKs9WQo+x54lEtrHwEU+0tqMbfjGKFPZ7t7V1t1018RdoZ6dgu9fHInmLU=
X-Received: by 2002:aca:3dd4:0:b0:378:4edd:a89c with SMTP id
 k203-20020aca3dd4000000b003784edda89cmr2010642oia.46.1676304984022; Mon, 13
 Feb 2023 08:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20230210024343.26220-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230210024343.26220-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Feb 2023 11:16:12 -0500
Message-ID: <CADnq5_O_byNv=MVKQSL8hCXy-ENtLo31vq5zdmrE_dKZwif=nA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove the unused variable
 pre_connection_type
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Feb 9, 2023 at 9:44 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Variable pre_connection_type is not effectively used, so delete it.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4031
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 63e75c392031..d224a44c4cc8 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -886,7 +886,6 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>         struct dc_sink *prev_sink = NULL;
>         struct dpcd_caps prev_dpcd_caps;
>         enum dc_connection_type new_connection_type = dc_connection_none;
> -       enum dc_connection_type pre_connection_type = dc_connection_none;
>         const uint32_t post_oui_delay = 30; // 30ms
>
>         DC_LOGGER_INIT(link->ctx->logger);
> @@ -923,7 +922,6 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>
>         link_disconnect_sink(link);
>         if (new_connection_type != dc_connection_none) {
> -               pre_connection_type = link->type;
>                 link->type = new_connection_type;
>                 link->link_state_valid = false;
>
> --
> 2.20.1.7.g153144c
>
