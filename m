Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF44322FC5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07216E849;
	Tue, 23 Feb 2021 17:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D7689FD1;
 Tue, 23 Feb 2021 17:42:16 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id f33so3142323otf.11;
 Tue, 23 Feb 2021 09:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VuxpnNTlbfa73guZtbI9Nhw2M5eDcrgPYdz+56/6dWc=;
 b=nL7g6q8SnspLBcq5aEvtCrCr3oFPtCOiDmIqpH/qqMlZziUJUYYGB1TYNT+enHAzgr
 Z/OFIDGQk12kO0nGCzONaDmuuJkcrMZW3UcTYlvGR3x01ZHu4IubuwwkkEsbGEx6rfB9
 Gp4r62k2MmPgvJZ2mcXa2KPrtsuGyggwln1hhuuinLpX2/BXFTN8W+xUY2JFqSGQwqVg
 UfuMuwBpwNUNjETK1v+CMb9oBmAX8WW3TbhX15OdSdenJdqRXNEOIs4pig9/Cu8oSbs3
 m1a9vdSG/Qn5S2k4wq3EUYQXMdDk050JMfAay/4u7wdx5YeQJadfrZhpZYSAiKcrTdhX
 lPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VuxpnNTlbfa73guZtbI9Nhw2M5eDcrgPYdz+56/6dWc=;
 b=nwsLsmtJO6nPhUcFu6TQyqKO8kRhPEXolxTcWKkbncAYw40KiPkKfA/WL7MHZTOM8i
 Ag4VjkpWHm4/Ftt98NuA2tRb/GfGlafXIYL8arilL29pcTFx62izSqhN/R5ASwcwObvJ
 Vfop2+oHUOyffua1qltCaqaim7s6cOXTBQUujDC/WixB2kGhv7vXNBw9EEOVqJl/td68
 r5rO2ug42Wl95XYmy8H3JFAVykliq51C52xgKKY5xXL9BgbPigUDf2PfmqdfFw6ibrbu
 uF0SDc+7rTu1Do+qgWArFiIu2fQRru+1FkvRkW91PK8xpxitlxgUSVN+7b/Huh1yg7r5
 EZOg==
X-Gm-Message-State: AOAM531AdbYlDnGgrYTW24Na+7A4XjvcbQE777GSxI6eX/yEs2Immiy6
 HXqgSIAUfBHrN8yRMKa0qH5fD6GLb8C1gb+TuxQ=
X-Google-Smtp-Source: ABdhPJyjUKxqV7AOCUKsVQCtpD9QXKbaGWwKvSlqdCwpSOtCsB5w2Yrh1m7QIxBjt6ChpY/dQqLXO/Ytyja4DaevaZg=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr10635173oti.132.1614102136101; 
 Tue, 23 Feb 2021 09:42:16 -0800 (PST)
MIME-Version: 1.0
References: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
 <32vjVDssCxltB75h5jHin2U3-cvNjmd_HFnRLiKohhbXkTfZea3hw2Knd80SgcHoyIFldMNwqh49t28hMBvta0HeWed1L0q_efLJ8QCgNw8=@emersion.fr>
 <20210222234457.GA36153@24bbad8f3778>
 <yHvp7KbQD2pF5dR6krMc_Zuq9a8GxkYSSiIpjBenuiCjwpFmFxpAOpfzhp0DfHQhH2Z3P81-CGpwmmXp0zjifT93vBXXYd5kJsSucQgXFZI=@emersion.fr>
 <CAP+8YyGdr0jkf5_K8ofKMzZn5Koy_vkxyKKHkyVDqDz2sWvL_g@mail.gmail.com>
In-Reply-To: <CAP+8YyGdr0jkf5_K8ofKMzZn5Koy_vkxyKKHkyVDqDz2sWvL_g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Feb 2021 12:42:05 -0500
Message-ID: <CADnq5_MXK_H-g4GReU1dGca2PAXsGjbzg47kcWjXFQ4DrYG8tg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: initialize the variable 'i'
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Dave Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

yeah, fdo ran out of disk space so I moved to gitlab:
https://gitlab.freedesktop.org/agd5f/linux/-/commits/drm-next

Alex

On Mon, Feb 22, 2021 at 7:26 PM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> I think Alex moved to gitlab for his branches
>
> On Tue, Feb 23, 2021, 12:50 AM Simon Ser <contact@emersion.fr> wrote:
>>
>> On Tuesday, February 23rd, 2021 at 12:44 AM, Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> > On Mon, Feb 22, 2021 at 11:05:17PM +0000, Simon Ser wrote:
>> > > On Monday, February 22nd, 2021 at 8:25 PM, Souptick Joarder <jrdr.linux@gmail.com> wrote:
>> > >
>> > > > >> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9804:38:
>> > > > >> warning: variable 'i' is uninitialized when used here
>> > > > >> [-Wuninitialized]
>> > > >                            timing  = &edid->detailed_timings[i];
>> > > >                                                              ^
>> > > >    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9714:7:
>> > > > note: initialize the variable 'i' to silence this warning
>> > > >            int i;
>> > > >                 ^
>> > > >                  = 0
>> > > >    1 warning generated.
>> > > >
>> > > > Initialize the variable 'i'.
>> > >
>> > > Hm, I see this variable already initialized in the loop:
>> > >
>> > >     for (i = 0; i < 4; i++) {
>> > >
>> > > This is the branch agd5f/drm-next.
>> >
>> > That is in the
>> >
>> >       if (amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT
>> >               || amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_EDP) {
>> >
>> > branch not the
>> >
>> >       } else if (edid && amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
>> >
>> > branch, where i is indeed used uninitialized like clang complains about.
>> >
>> > I am not at all familiar with the code so I cannot say if this fix is
>> > the proper one but it is definitely a legitimate issue.
>>
>> I think you have an outdated branch. In my checkout, i is not used in the first
>> branch, and is initialized in the second one.
>>
>> https://cgit.freedesktop.org/~agd5f/linux/tree/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c?h=drm-next#n9700
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
