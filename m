Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E656ACE7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 22:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197AB11A37C;
	Thu,  7 Jul 2022 20:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2997A11A37C;
 Thu,  7 Jul 2022 20:45:20 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z41so24639474ede.1;
 Thu, 07 Jul 2022 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8b0kNH+mf64WowheLy0t8fPMJjHTnvWvV3xGK03JawY=;
 b=NpiRS+xQXwP+V0/ZYaobHAzR01/Ps/WK3+RkGwFc/HRL44A9ok013W3tDmZr7pq8kf
 orn07Xp5Kevn554XJxdMNfKtg8RFZc0/Y68+jWe9zWVVp/H5VQEAI4BQx3GArdEkV1Ju
 H9uDGpcBsyY84DVz2rhkJJZCcQPAgt9cAS25+dqCr/FgjlLaIT3XGNmqWetYLev1Udjl
 FipfVpdXy9/SmfPq0zQ5Fe0o/rS5n/4VrgY8NW+rLas3pyLhYfOPZv4HkwV2mRnQKhEh
 hQKX4f3E1mlldrWPxM/hmLSyD+aRePnFcOhGx+8OYqgekHCW5zBqqjrmpQUTqx4cNxLh
 7J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8b0kNH+mf64WowheLy0t8fPMJjHTnvWvV3xGK03JawY=;
 b=4B1P0RvB6k4b2zYpDX1UXfzUhpd9+hIgLIy1mBwyG8OjYIejJkHFx7P8387m7F8jKG
 HZIQc9oZ+rq9E6AORKIOkwvrmWeGKOBlRpubNrs5OJHeCPFsu65xp54IF0id3kSP+e2J
 b7MewlvCLRGUzArpJc269Fqd8Ic9j/LwlGp7PPypI4w+YE83kBxOd9TkXy5QcHFFOvqJ
 bccfqCzRQlGGENceSNSsVdTzMynGX6CSLDkiufXZgk97DUij6voVjFkCTw3wQRPQjnr4
 tk7NxA8QVOydWhLw0OBdy/K7BLhy+AeoVxJAghVru7kL2qdgideOIk3zRDFkuB7Zm3fu
 bk8w==
X-Gm-Message-State: AJIora/JCQqf/cWBVuQfwzi3eg2QVM7g8MOKs9Kjij6l4GzJ61n9yJUp
 WP1Ud+lJXbWTH/cCwAzApn6NRoFDpvU+uz5i/l8=
X-Google-Smtp-Source: AGRyM1vt/5gj6C7ggw3jfDDriN4sNUUIiQ/+rhA6PMFiH+IpKPILML7r8Ir3YtLSf2VP3OKaSdIMxHL90fGmf9q5Lo4=
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id
 ef3-20020a05640228c300b0043a6d781b64mr28680140edb.93.1657226718744; Thu, 07
 Jul 2022 13:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220706063951.54122-1-hbut_tan@163.com>
 <CADnq5_NpXcua54cSeSGaG2X_afcvoGswKgSb=Gysr5gpoT0AHw@mail.gmail.com>
 <51186366-a040-f99d-f43b-bb6ac771f20d@amd.com>
In-Reply-To: <51186366-a040-f99d-f43b-bb6ac771f20d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Jul 2022 16:45:06 -0400
Message-ID: <CADnq5_OsRKiHvCr6PH9rdbaKwTqYEcBrBYwHJLo8dqCQ+3m0Zg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsigned expression compared with
 zero
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zhongjun Tan <hbut_tan@163.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Zhongjun Tan <tanzhongjun@coolpad.com>, Dave Airlie <airlied@linux.ie>,
 cai.huoqing@linux.dev,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 7, 2022 at 4:38 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2022-07-07 14:22, Alex Deucher wrote:
> > On Wed, Jul 6, 2022 at 3:41 AM Zhongjun Tan <hbut_tan@163.com> wrote:
> >>
> >> From: Zhongjun Tan <tanzhongjun@coolpad.com>
> >>
> >> Fix unsigned expression compared with zero
> >>
> >> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
> >> ---
> >>  .../gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> >> index 548cdef8a8ad..21e4af38b8c1 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> >> @@ -244,8 +244,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
> >>         bool req128_c = false;
> >>         bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
> >>         bool surf_vert = (pipe_src_param->source_scan == dm_vert);
> >> -       unsigned int log2_swath_height_l = 0;
> >> -       unsigned int log2_swath_height_c = 0;
> >> +       int log2_swath_height_l = 0;
> >> +       int log2_swath_height_c = 0;
> >
> > @Wentland, Harry Can you comment on the required range needed for
> > these integers?  Maybe it would be better to just drop the comparisons
> > with 0.
> >
>
> I'm not sure I see the problem we're trying to fix.
> An unsigned int can be 0, so a x != 0 or x > 0 check
> is still a valid check.

Hmm, you are right.  I swear I had seen a >= 0 check in that code, but
now I can't find it.  Sorry for the noise.

Alex

>
> Harry
>
> > Alex
> >
> >>         unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
> >>
> >>         full_swath_bytes_packed_l = rq_param->misc.rq_l.full_swath_bytes;
> >> --
> >> 2.29.0
> >>
>
