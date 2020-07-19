Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78833225155
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 12:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5903B6E0A8;
	Sun, 19 Jul 2020 10:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038006E0A8;
 Sun, 19 Jul 2020 10:41:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h19so17175431ljg.13;
 Sun, 19 Jul 2020 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tpiqpv1gw8Qt8TQiOSBJnRPDhT4Eutjht4m8N7q1QPo=;
 b=LPLt8+jHWJALIMFD643FlHu8V/cERXVjrO7geDEy00OLmHQydu3UBXYwMoOqSM96KK
 7iogFBQhVGkN6oAvd4LQHApRkcrlSHDwqbjMOKmoBIYXxQdsSdVzjkan5TBGcOy0YUnc
 KMpM58/sJ8m9G4QxYuCn/MBY7f2waMMNNHutNEj+YAV6FFof/CH205ifRD6SjgOIykM0
 B7Aqs/s7g5QhoaSvDO5dTzFgDj6pmyC+NmSdZvDnAjfpT1fz3YQ5z3Nx2EqPOaTwRxBS
 HzUl/nzjdidS/IyaY8dYdFTkM915w5XSG1kOfGjs8NM//kyGRhfZVwuEE0kfhEx42qjC
 Qx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tpiqpv1gw8Qt8TQiOSBJnRPDhT4Eutjht4m8N7q1QPo=;
 b=Qji8C3w6WAyWXgPBRwtctuMvLxPxWi5bp2qv5hj6nR2ZcZnE1++OouvtXxWi12wh5c
 m6Sw/r8A69sVNsFv7V4f6CnfpLP2L2v+aEPgoI74O1KQFTUGkBJrIjWKt9pH//xOHiz9
 TXk65MwtklSiT19uk++SFmZIvNv3SB1KPV/3hH4yfWx7Haa0xrJIzWqaR0tvi4aCY1z0
 NbW5iFqxGxmGhweVAQa0HbyjFXLjtcHSaTH175tXF0Chjcgf31e2YEvGsCr1YrZC5Nkn
 r/jyeM+crBC5ulJcvUTXG8ODcrHvsHzMi+dRTY2bRuG35apoL3WgrpWpYjn9RrK5LE28
 ZdIg==
X-Gm-Message-State: AOAM530d8UwO/i1oW5GxBAN5ws6gV+bBgAAEimpIOFkb7agnuHRuLqL5
 2a5Nc1eegIeGTTsF/v2TGLzWRYgRnLRtrYlYvVY=
X-Google-Smtp-Source: ABdhPJwBOo4PDueymBif4+SfKfpUPsblZIr4z3pCDgfIJfTgdqDDYkCB1mXRGdq6mZ+bYF8ghzbVRKmxHvfF11J6LAI=
X-Received: by 2002:a05:651c:1186:: with SMTP id
 w6mr7730409ljo.123.1595155302445; 
 Sun, 19 Jul 2020 03:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200719073050.776962-1-yuq825@gmail.com>
In-Reply-To: <20200719073050.776962-1-yuq825@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 19 Jul 2020 12:41:31 +0200
Message-ID: <CAK4VdL3dDBUK_jpb8Q08XBpKdmFF9MomMnb4mKJr1wotfnzppA@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix wait pp reset timeout
To: Qiang Yu <yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 19, 2020 at 9:31 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> PP bcast is marked as doing async reset after job is done.
> When resume after suspend, each PP is reset individually,
> so no need to reset in PP bcast resume. But I forgot to
> clear the PP bcast async reset mark so call into async wait
> before job run and gets timeout.
>
> Fixes: 3446d7e9883d ("drm/lima: add resume/suspend callback for each ip")
> Signed-off-by: Qiang Yu <yuq825@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_pp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
> index 33f01383409c..a5c95bed08c0 100644
> --- a/drivers/gpu/drm/lima/lima_pp.c
> +++ b/drivers/gpu/drm/lima/lima_pp.c
> @@ -271,6 +271,8 @@ void lima_pp_fini(struct lima_ip *ip)
>
>  int lima_pp_bcast_resume(struct lima_ip *ip)
>  {
> +       /* PP has been reset by individual PP resume */
> +       ip->data.async_reset = false;
>         return 0;
>  }
>
> --

Reviewed-by: Erico Nunes <nunes.erico@gmail.com>

This fixes the issue reported at
https://gitlab.freedesktop.org/lima/linux/-/issues/34 .
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
