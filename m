Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97ED299531
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 19:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4073E6EA49;
	Mon, 26 Oct 2020 18:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224BB6EA49
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 18:23:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so13843874wrn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qA18YpLfyIMdl0nDgm8zdUQWP0JaPwyG4Kirj13Q3I=;
 b=tYyfvdlIGdSZe3GvXE7ruGXnmPVX3t3iEHmqX4CiSE/klShoTCl2Gn4/18VnwJXQ36
 8ixyiG5GRGuzS8cL77Mpoa4gqGdcaCpomzMARbs+bK/Z7t2FsJZ7IYJl/b9S/ySGXsX2
 FCxZFAXtbQaWZeILxukNYgHWdO3PxvvbDzEfYY8EFC/FxWw+5bOwa2vGqtfDXiNmlEio
 IGEv5EubjN1nrtHU7Q9D3EnvXVXeR5HT4lO7PcOHgMuxC8ME24OGgTOS3bA2nIt1VOKE
 Fpv42CfAbhCQ99F+7TjyNnaXVYbc2jpvey9IEYg5YMr4x9L1KDAty5/GNMrS+eE2VOcA
 9WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qA18YpLfyIMdl0nDgm8zdUQWP0JaPwyG4Kirj13Q3I=;
 b=hNtRsA+LSD4eaBdHqrI1IGLERbVeMhmtnu+1G+nb5im7Qd1mJi0NBp3D6cEgCsJl63
 bwZa9OReZIZE0+ePhjJ+BPLRr5YG9OUDCs9Hu9C0he0kXLaOF6HF0G1qixVV2TDZ+Yaz
 klvsHhfWZDs2mUTdYz+H2EuwWXiykdhm65bBc61Yu2jaUNyQFPljQVsAVD7cq3tqZZtK
 1W1eeCcSLpTb9uFGC7u0c/UDPk0afwM8XAevyzyAqpiW+G+mWAzFzKQvyHJVlxb2HHDb
 kczG19hRwMGghoNOP0VoBbgCU5L35CgPBGVR1B2Hdb0TVZSLxCd0C6Xo3AY97qF79oW6
 4hpA==
X-Gm-Message-State: AOAM530qLfioG1hli1EXLugO91cu5Q8NASZ6HnjAXc3/TW/7TaeKxvND
 ZrSxEzmEOYyaUU5Ved4e0/CvfeEDrLNlrOC/PCA=
X-Google-Smtp-Source: ABdhPJz+uRRdvuVo/lTqsbs9Mm8REFQjdbSjaOT7LbToLoHTleuH8LMdEvYB9Rhrd1ZyGo9YiqBbf82QSZ51F9cIQp0=
X-Received: by 2002:a5d:6642:: with SMTP id f2mr19931368wrw.374.1603736623763; 
 Mon, 26 Oct 2020 11:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <9faa1070-d46e-5340-f6a2-5826614f306b@gmail.com>
 <CAGPDPzA3+NFO5meR-YHByaRc+unQvPOU-2sjGkpBEkwcdsJwWQ@mail.gmail.com>
In-Reply-To: <CAGPDPzA3+NFO5meR-YHByaRc+unQvPOU-2sjGkpBEkwcdsJwWQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2020 14:23:32 -0400
Message-ID: <CADnq5_OfGqShN+4hzK75UKj7OiBrYgXbXE_iFSCTV_bJUyKk-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/radeon: Add new callback that exposes vddc
To: Sandeep <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I don't see them on the mailing list.  Are you sure they went out?

Alex

On Sat, Oct 24, 2020 at 1:47 PM Sandeep <sandy.8925@gmail.com> wrote:
>
> Hello,
>
> I've resent the patches in the correct format. Please review.
>
> - Sandeep
>
> On Fri, 9 Oct 2020 at 13:14, Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
> >
> > This patch adds a callback for reporting vddc, to the dpm field of the radeon_asic structure.
> >
> > Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
> >
> > ---
> >  drivers/gpu/drm/radeon/radeon.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> > index cc4f58d16589..85a1cafdf303 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -1992,6 +1992,7 @@ struct radeon_asic {
> >                 int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
> >                 u32 (*get_current_sclk)(struct radeon_device *rdev);
> >                 u32 (*get_current_mclk)(struct radeon_device *rdev);
> > +               u16 (*get_current_vddc)(struct radeon_device *rdev);
> >         } dpm;
> >         /* pageflipping */
> >         struct {
> > --
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
