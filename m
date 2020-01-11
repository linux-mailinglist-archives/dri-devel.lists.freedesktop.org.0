Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B2137A7E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2020 01:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D31D6E1E5;
	Sat, 11 Jan 2020 00:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74656E1E5;
 Sat, 11 Jan 2020 00:17:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u2so3772990wmc.3;
 Fri, 10 Jan 2020 16:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ze59xLiTAJSzDVkiY1kAM7m1KT/ayX5lzJy7k2zz1E0=;
 b=GxMN/muxILuh6Mz1cqljfmEh6ATU8zHhpSLeFdPf9z5VzMmxKflDSh8snUzIDyHljN
 IjqtNjSJTZvVY5RLH4+Ku9paOmAlM5Yk44CUe3yDKDEbMu0XIUbU+xsZwaFloA4MzLyQ
 XJn+KxK9ASSmWYNU1ynfwWkaaHymwYUpzSP4JdS6GzMUcJ2WejqjSjKtWaSDrtkxwnqT
 Z4AWLUulce+1i32IGezvPV/B1OCQIFRZzRA8Vv9MndgTuekyFF7jODqRfHdQ3eFi0YHg
 zYzsNYAdLXoDDDAKOXySrGRDz5y5c5xaCt+OXbtw5qC5JdCzf/cgnqysc55JQP1LDzYP
 UEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ze59xLiTAJSzDVkiY1kAM7m1KT/ayX5lzJy7k2zz1E0=;
 b=SvYWssAF+DQK8V28TuRUaqC27oAPvp/6b3AJv76nocGaHtYPrSQkgA/gbgJyII6yFO
 dGY75+kWskMIWmYbgaAXQwFLhE9G6LIMQF3TX6AKv1I2fVCX7b71R0xps5RCjHh4ddSm
 GYmdsaCgBkHZBepCX7+p7GFJa+tamYAPlGa1Hn6XHm6AtF6AwDgIFUSfsmXDi37hwUcd
 iOOCWp1xkHRiCs42gwacJ+V5MqO6EXQTKnfkoFTr/Mzy9u7yY+e8507xUQLkJrlmvegr
 JZRtge3WWt9todSMDvM6UKp41ylHgXW0F2YT27WUP27IyAIkK36tp/Dd7/JQ8Pm/LiGf
 SQeA==
X-Gm-Message-State: APjAAAV1p9tOaPeEz6Q4Igkd7/9f/CMC8DUszkHVUOK9lkeLTZgrzKAa
 XoQE9dKf827/njT8RlmEUfwwjmVc+XR9hmEfbeI=
X-Google-Smtp-Source: APXvYqwjQjxv8G5Ads8QwxDVEai740q8qo4sFItXY/qwf3UdJyZiqRhV1s470G2PuGznsF7/7eniM0daOmayO59vUv8=
X-Received: by 2002:a1c:486:: with SMTP id 128mr7008543wme.163.1578701875402; 
 Fri, 10 Jan 2020 16:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
 <20200109152028.28260-2-mario.kleiner.de@gmail.com>
 <d54ab31d-1821-fe40-2dd7-c6b35b42547f@amd.com>
In-Reply-To: <d54ab31d-1821-fe40-2dd7-c6b35b42547f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jan 2020 19:17:42 -0500
Message-ID: <CADnq5_NUgbFda-m-LNC43hARJACSVP3nBrGE7d5HkYejfEuV2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Reorder detect_edp_sink_caps before
 link settings read.
To: Harry Wentland <hwentlan@amd.com>
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
Cc: mario.kleiner.de@gmail.de, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Martin Leung <martin.leung@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 9, 2020 at 1:41 PM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2020-01-09 10:20 a.m., Mario Kleiner wrote:
> > read_current_link_settings_on_detect() on eDP 1.4+ may use the
> > edp_supported_link_rates table which is set up by
> > detect_edp_sink_caps(), so that function needs to be called first.
> >
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > Cc: Martin Leung <martin.leung@amd.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> This also fixes our assumption that retrieve_link_cap is the first DPCD
> reads we perform during detection.
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > index cef8c1ba9797..5ea4a1675259 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > @@ -817,8 +817,8 @@ static bool dc_link_detect_helper(struct dc_link *link,
> >               }
> >
> >               case SIGNAL_TYPE_EDP: {
> > -                     read_current_link_settings_on_detect(link);
> >                       detect_edp_sink_caps(link);
> > +                     read_current_link_settings_on_detect(link);
> >                       sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
> >                       sink_caps.signal = SIGNAL_TYPE_EDP;
> >                       break;
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
