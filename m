Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD069755E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 05:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EA010EA08;
	Wed, 15 Feb 2023 04:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C5A10E670;
 Wed, 15 Feb 2023 04:24:49 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 y11-20020a05683009cb00b0068dbf908574so5322787ott.8; 
 Tue, 14 Feb 2023 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qvKOU4avZmIzyYVOQhc+tG6rthx234MXp5OMVmckZE4=;
 b=eqTQxYMDRwfuhuWV1ksdh9A4ydfNEzp9bKF5eyEZzsG3hUWaZwHsDP7efqyQBqkjD9
 wVdSZKokaZmPnLw1U2uc9MBuUWt8j++nL8CM1GnsfE8f0EfESfYSEY2Tjyp0D17gDTdr
 IKPiN/AomHuqD5c9FBwVO3IIk4BUdrznl1sEvjM9BwzpX8Io/b11CX7hy4Er+LaKpQma
 ZJmrg9KZUeYQwELBCju4G/OTfNNpvSUQrW7i3wTCYr7g7KqAeDwCjjU+KjgRnoY4+njX
 3CHArQQQ26+b0z1HDtdKsmwDld3mJP2eSNneaznZSB4wYv+FJe/juLuUGHxCrV350r00
 LMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qvKOU4avZmIzyYVOQhc+tG6rthx234MXp5OMVmckZE4=;
 b=Sbd5U3lvcDg0T0JYebg6IEUKYxKQKZTH1RE/AZ6030f4RYaDZ7xfRZljua9ZuonPCf
 J0Zo3XDDxUadpCORdKtQibOtybIUEcK+3DHzXRRDFlsBpGIh2Co+rDgtNkYMoyRD5eOo
 KeGXmAt7V90AqatZdpZxDwv0FVvaPqoTs8wxN7I+0KcmKN8cBoc2G4BOY9tGnIMpe5pT
 up4fZ+AEU8xDD5qnOUgH2eFqeIs+II4QrY/iOZFTUZytmyuQRRWEgWxfK7/0Jq03/GTh
 lYftvu7ETUUfo2NwRqGb1DEuT2cgtPXZGgVG7RejMw993aty8cuWcsyK17z4qtUr8ykT
 dPqA==
X-Gm-Message-State: AO0yUKXwuCLwLAhOaHPB4OmBpjCMnwvBQb9v5cuBbSDM2PLKHa/KtmZm
 XUA13FHFi2J+KLGMCCQyglLd88D16boQwrJwC6Q=
X-Google-Smtp-Source: AK7set/nmdEuYU4bOBmZL00qZ5LjEiIikomugFMgVVCc/KYC3xw9K5W7h/Co7ljZmIYYraSFevN21vtJ1EiVpWa46PM=
X-Received: by 2002:a05:6830:18e8:b0:68d:4133:fd26 with SMTP id
 d8-20020a05683018e800b0068d4133fd26mr29701otf.56.1676435088248; Tue, 14 Feb
 2023 20:24:48 -0800 (PST)
MIME-Version: 1.0
References: <Y+YVy7RaxnXokJ3l@ubun2204.myguest.virtualbox.org>
 <49a3244a-1416-12c4-9dfa-661cf5b5d569@amd.com>
In-Reply-To: <49a3244a-1416-12c4-9dfa-661cf5b5d569@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 23:24:36 -0500
Message-ID: <CADnq5_M5JeSU4WwkbWM55HKPtaxsjkJ29JScdWq=OgHkBfNdEw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate/repeating expressions
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
 Deepak R Varma <drv@mailo.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Feb 10, 2023 at 2:37 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2/10/23 05:00, Deepak R Varma wrote:
> > Remove duplicate or repeating expressions in the if condition
> > evaluation. Issue identified using doubletest.cocci Coccinelle semantic
> > patch.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c    | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > index 4b8f5fa0f0ad..ae89760d887d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > @@ -2335,8 +2335,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
> >
> >                       if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.ForcedOutputLinkBPP[k] != 0)
> >                               mode_lib->vba.DSCOnlyIfNecessaryWithBPP = true;
> > -                     if ((mode_lib->vba.DSCEnable[k] || mode_lib->vba.DSCEnable[k])
> > -                                     && mode_lib->vba.OutputFormat[k] == dm_n422
> > +                     if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.OutputFormat[k] == dm_n422
> >                                       && !mode_lib->vba.DSC422NativeSupport)
> >                               mode_lib->vba.DSC422NativeNotSupported = true;
> >
> > @@ -3639,7 +3638,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
> >                       if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
> >                                       && mode_lib->vba.SourcePixelFormat[k] != dm_444_32
> >                                       && mode_lib->vba.SourcePixelFormat[k] != dm_444_16
> > -                                     && mode_lib->vba.SourcePixelFormat[k] != dm_444_16
> >                                       && mode_lib->vba.SourcePixelFormat[k] != dm_444_8
> >                                       && mode_lib->vba.SourcePixelFormat[k] != dm_rgbe) {
> >                               if (mode_lib->vba.ViewportWidthChroma[k] > mode_lib->vba.SurfaceWidthC[k]
>
