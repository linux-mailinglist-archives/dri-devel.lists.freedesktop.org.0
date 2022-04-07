Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15E4F865C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 19:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB1A10E29A;
	Thu,  7 Apr 2022 17:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CA210E295;
 Thu,  7 Apr 2022 17:37:32 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w127so6340297oig.10;
 Thu, 07 Apr 2022 10:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IhwtG6Mpj++51CRDNyUdO0/f3e0kql8qZIvoDM7w7AM=;
 b=p0tm3Dr9M8k6vxeTj5K1WpvlPdo+2WU/3HP7qUd5b0y88h3H8cdU8Q2RgYI0a6S/jD
 VbaunWWhJHD29s4I+9QEJQXkEh8/YV/71c7W1B+Qo+a6y4VWHElYokC3kPyWMyf2J4Mn
 53SFi5qJ1u9qFCYXP6gHqf/blhHEe6QlmfYUWrTvvQLzOHLzk0AZWnYJ2ENsE9ZWcq0s
 kiYMDqY0eCT9/zOicOkts0cC9ONJ3ftGQiUvTUXqoOiIZJDlar0mSmOTiF6EKx8GYj4h
 aSAP/XynSSnX7ZyikTsT/QQ/S99IojYHYyNuxy9fhBWuo+6J8Z1ivVotUVMtX5k5T2zL
 ngpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IhwtG6Mpj++51CRDNyUdO0/f3e0kql8qZIvoDM7w7AM=;
 b=t+NVZzce7KwGDnuKcobP31wJIS7T3oRMVYp1rWeMkKOY93iEU84Ykzic+Z/Cgpw7aF
 8mbYE3COqZjKFAcXT8rGU2r0RL9z/oONqbXrDjwaSShm32x40myEmXkaS/TQWzKEsJyU
 EgQ1iJwLSEYp4g8SfEjZWEpsMf/2l8bED0LTooDySNk2GCvK4nUkS4dLLOh2IBBpeAcU
 XFxe/a/fBKr0CCMzTDai22VePD4RZeMRGzUlnXVUPZWJmDyxYTCM4tqV8Af9bWsETjMY
 /wFv6SO8eBHjCc5tv/bAWy0x2gZlHtEgPpCTx64zfcAkCpbOwHogt0ohW27V7DcBrxnw
 mKdw==
X-Gm-Message-State: AOAM533eEjN08HuWyJiiNXQtae8Tsix6HqfKfAp3KQRVhvHxIu9YNhY/
 SmzaO+ESIBfKaPgu7AZHEYz6WO9GIcZATY0gJf8=
X-Google-Smtp-Source: ABdhPJwztfXGOAyyplOsvMJLrRcLk3GlR0QvZpOL8c0iwhxVx8ct4WUaymaMYB+K49fhPTO94xVGBwJYSucqHEULMZg=
X-Received: by 2002:a05:6808:2390:b0:2f9:c718:80e0 with SMTP id
 bp16-20020a056808239000b002f9c71880e0mr428611oib.253.1649353052202; Thu, 07
 Apr 2022 10:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <1649311250-17077-1-git-send-email-baihaowen@meizu.com>
 <bb7635cf-461e-7abd-6092-4be67099c846@amd.com>
 <CADnq5_Ogke7XuVsQaB8pskreXam1ASTE2jna=U6iuKuuyR4r-Q@mail.gmail.com>
 <CADnq5_Phw7SvfdtX_RN7N4xEzceYpZLvRv971y3YyOdrg5Lz_w@mail.gmail.com>
 <aac9a178-e58c-60c7-a9b5-56ce219d051c@amd.com>
In-Reply-To: <aac9a178-e58c-60c7-a9b5-56ce219d051c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Apr 2022 13:37:21 -0400
Message-ID: <CADnq5_Po6VDogC91SrUm1hL8Vin0HkKf0wv2VQ+pnJ4VagQu4A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix indenting mistakes in
 dcn10_hw_sequencer.c
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
Cc: Haowen Bai <baihaowen@meizu.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 7, 2022 at 1:32 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2022-04-07 12:07, Alex Deucher wrote:
> > Actually this just causes another warning.  Dropped for now.  More below.
> >
> > On Thu, Apr 7, 2022 at 11:52 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >>
> >> Applied.  Thanks!
> >>
> >> Alex
> >>
> >> On Thu, Apr 7, 2022 at 10:18 AM Harry Wentland <harry.wentland@amd.com> wrote:
> >>>
> >>>
> >>>
> >>> On 2022-04-07 02:00, Haowen Bai wrote:
> >>>> Smatch reports the following:
> >>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2174
> >>>> dcn10_enable_vblanks_synchronization() warn: if statement not indented
> >>>>
> >>>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> >>>
> >>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >>>
> >>> Harry
> >>>
> >>>> ---
> >>>>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 14 +++++++-------
> >>>>  1 file changed, 7 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> >>>> index ee22f4422d26..3c338b85040c 100644
> >>>> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> >>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> >>>> @@ -2172,13 +2172,13 @@ void dcn10_enable_vblanks_synchronization(
> >>>>       if (master >= 0) {
> >>>>               for (i = 0; i < group_size; i++) {
> >>>>                       if (i != master && !grouped_pipes[i]->stream->has_non_synchronizable_pclk)
> >>>> -                     grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> >>>> -                             grouped_pipes[master]->stream_res.tg,
> >>>> -                             grouped_pipes[i]->stream_res.tg,
> >>>> -                             grouped_pipes[master]->stream->timing.pix_clk_100hz,
> >>>> -                             grouped_pipes[i]->stream->timing.pix_clk_100hz,
> >>>> -                             get_clock_divider(grouped_pipes[master], false),
> >>>> -                             get_clock_divider(grouped_pipes[i], false));
> >>>> +                             grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> >>>> +                                     grouped_pipes[master]->stream_res.tg,
> >>>> +                                     grouped_pipes[i]->stream_res.tg,
> >>>> +                                     grouped_pipes[master]->stream->timing.pix_clk_100hz,
> >>>> +                                     grouped_pipes[i]->stream->timing.pix_clk_100hz,
> >>>> +                                     get_clock_divider(grouped_pipes[master], false),
> >>>> +                                     get_clock_divider(grouped_pipes[i], false));
> >>>>                               grouped_pipes[i]->stream->vblank_synchronized = true;
> >
> > @Harry Wentland should this last statement be part of the if clause or
> > the for loop?
> >
>
> It should be part of the if clause.

Can one of you send a patch to fix that up?

Thanks!

Alex

>
> Harry
>
> > Alex
> >
> >>>>               }
> >>>>               grouped_pipes[master]->stream->vblank_synchronized = true;
> >>>
>
