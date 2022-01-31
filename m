Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B34A4FFB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A8110E340;
	Mon, 31 Jan 2022 20:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AD910E1B2;
 Mon, 31 Jan 2022 20:15:48 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id m10so3938770oie.2;
 Mon, 31 Jan 2022 12:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TxO4HL3vAUhTJBcsBoRP4TU58IoGPRrYl5E2aI+f7nc=;
 b=bJUvEOlOmzuahvjm4AL/eskyk6nm7kknB7gdgCoRtytffbzI7Y8Umw8GfH8gWjXxv0
 +BraKxwV8fIuPoZdC6KxyIFMs34RKEUsc49ejqN1OZktRqS86vNNW+J2cDRowmICfANz
 7XOsjc3UEpD2oAb/wKcAYVP3uYxBEb1CVH6POqUvwP9jDgNagLJ1LXHzngSvHuH/CKuZ
 eWs2opiuALnQwFACnDkhZHiQMtkFbL/vWb/9pfp3BvyKvVTLr3omLhmjJ4rNj4i0kokh
 loYtA7IRRYI1wX7m6I0RV+ukTZmXBnn6xaQvEctBRYIj3Ur+hSV7fyo2uYdX4AgWZh2G
 hUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxO4HL3vAUhTJBcsBoRP4TU58IoGPRrYl5E2aI+f7nc=;
 b=rBGSR3hYu0ow9+HuQn7RCuxv7ewGGvnk9Vcd4UNZ/GZL4poAUEq1dLv8D+CocSJKTL
 dvaHds1YyoWciGJG4ZgZcTOV4TXA+3GUAlK9QvEkgRxaDu1lHcReuaezFW1BvCMCJOQ5
 tpQOAYPF1bmlFmQZiG5pcWaZLeyK1d1YB8OLmYwXyeFiwPwj0B3Utv+pD5ZmYjLxz/7W
 u077LpAbcSNaN1xmqWzYzRWSccOM1jsbWtfb02mt7T3PIoQ6F6IzaUiA+7CWBCQf3ZIO
 2axYZWUar/q+zUJn1MnjkgPVnZqvD4sfLnllr4ef/aCrxjwhmfChTDPvALeKpYrm7c5O
 WdzA==
X-Gm-Message-State: AOAM531WrvXq8rNEeoPxqYM6McPCpkLoupcSX0QYDHDvxiiwasO434dh
 zV81k1GYiIORx4asQRak98cozdVfBHRYq3ug34s=
X-Google-Smtp-Source: ABdhPJx02+YhKKrAKsIA1dCwlj38aSZeZERiRuIhZ3Bzmu2lMWl16k7vYqt1gJcAhp3LjC9+q6lVD3Zm3Sd2V5KTaRk=
X-Received: by 2002:a05:6808:2011:: with SMTP id
 q17mr19415786oiw.199.1643660147527; 
 Mon, 31 Jan 2022 12:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20220129010413.97801-1-yang.lee@linux.alibaba.com>
 <75ab0f37-a55e-8e81-8cbf-c0de3002c3e4@amd.com>
In-Reply-To: <75ab0f37-a55e-8e81-8cbf-c0de3002c3e4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Jan 2022 15:15:36 -0500
Message-ID: <CADnq5_OhatwsjXzhtb0F0mu0K7BQHCSvH=9nnwkk94njmtda2w@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: clean up some inconsistent
 indenting
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
Cc: Dave Airlie <airlied@linux.ie>, Abaci Robot <abaci@linux.alibaba.com>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 31, 2022 at 10:17 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-01-28 20:04, Yang Li wrote:
> > Eliminate the follow smatch warning:
> > drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:2246
> > dp_perform_8b_10b_link_training() warn: inconsistent indenting
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > index daaec3164875..34ffcd5bb1d7 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -2243,11 +2243,11 @@ static enum link_training_result dp_perform_8b_10b_link_training(
> >
> >       if (status == LINK_TRAINING_SUCCESS) {
> >               status = perform_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
> > -     if (status == LINK_TRAINING_SUCCESS) {
> > -             status = perform_channel_equalization_sequence(link,
> > -                                     link_res,
> > -                                     lt_settings,
> > -                                     DPRX);
> > +             if (status == LINK_TRAINING_SUCCESS) {
> > +                     status = perform_channel_equalization_sequence(link,
> > +                                                                    link_res,
> > +                                                                    lt_settings,
> > +                                                                    DPRX);
> >               }
> >       }
> >
>
