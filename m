Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9E433C565
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 19:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E735F6E0F0;
	Mon, 15 Mar 2021 18:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F03B6E0E9;
 Mon, 15 Mar 2021 18:19:38 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so5602855ota.9; 
 Mon, 15 Mar 2021 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JeDHtCDxywj9r6bA/2S0wPWpH9Q9pfJGq85V9QGOnw8=;
 b=TF7MqunSHLZhiqjjd5eKS6a1ZWsfyx6blhMKMqPybtS5JPw4NzQcK2xItEXkpphYPJ
 8QWlhHoSOyzKbsUYUrrJ8yHht6KEqZrPPGtbwD5vToVHROi8GIgPXOsTOd91WY4e1f1w
 4dj7qN2iBYJ/+ATjMLTpc+Cd0PZSe4yCx+UkRyBpQrdLKcZBlvac67lr3gUbQksGfNZe
 obIT8L8nKImSEVfNCG/qXXqb5HIOC1JKKJyaqEEExdW3l/qu1sO96+BI0qs5nrTte4rF
 MraIQVxq0DmDE4LXZFC+Qfacc+wu3XVpX6PVV5O/9IEdRCE5UULjnCCNRpKeAvJ0PE76
 3c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JeDHtCDxywj9r6bA/2S0wPWpH9Q9pfJGq85V9QGOnw8=;
 b=FM8fox0vlAmn1b+zad3dfAWxjiYfN8SlBzmaMQWp7lF7b205oAU7xKBD9KU5HUJBIa
 5FJD+nMkEhVtGH08mkyh+AVacMfUodNWhWOX7/lXPp2MbqhFJfTbJBiLTwthhrQNXy8A
 iJirkCNQ9ys66VV6lErMvs9Va60xBWzAbGJ0UjD+LKcYLqRFYcc/dLBhus4sFztoAC9/
 +S6pj6+oXSz6gyVwQt71W55dz/DLN4okUii2ayg8NpWI4Ag7epQnxwlu94PyjxGUGUAi
 lGu0UOqDI0JZn2ydSC9pZ2hzR+ITUaklEbg0uBzwTlNhkBHcKv/3lD2uic4tofra5D3R
 t2Ng==
X-Gm-Message-State: AOAM532IigtCZIQ6GdVBecnvalq4EVmWqzNpLvzOfckcio2FThrsYDwA
 iZny03bJgL1Rc2mynXC0frYlWvswdDcTjFyYZEQ=
X-Google-Smtp-Source: ABdhPJyAxg+bB/x4V9sYZuqgUOEM6BOJkUKpErYFa5jBJaxeSIB/YQj4BCsKJcWuMzSE93UQTMd/eX9jCImPxzpIB5k=
X-Received: by 2002:a9d:760a:: with SMTP id k10mr333800otl.23.1615832377776;
 Mon, 15 Mar 2021 11:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210312100842.127242-1-colin.king@canonical.com>
In-Reply-To: <20210312100842.127242-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Mar 2021 14:19:26 -0400
Message-ID: <CADnq5_PUo9cLui_B81Kn2LB8jmyZG2HsgWLQ=WqOWP+_wqcfsw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: Fix spelling mistake "disble" ->
 "disable"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 12, 2021 at 5:08 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an assert message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> index 0d725b66fb78..7edafef095a3 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> @@ -1300,7 +1300,7 @@ static int smu7_start_dpm(struct pp_hwmgr *hwmgr)
>                                 (0 == smum_send_msg_to_smc(hwmgr,
>                                                 PPSMC_MSG_PCIeDPM_Disable,
>                                                 NULL)),
> -                               "Failed to disble pcie DPM during DPM Start Function!",
> +                               "Failed to disable pcie DPM during DPM Start Function!",
>                                 return -EINVAL);
>         }
>
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
