Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA9834D3D9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F5889FD4;
	Mon, 29 Mar 2021 15:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B2189FD4;
 Mon, 29 Mar 2021 15:28:24 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so12607474oty.12; 
 Mon, 29 Mar 2021 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sL+u4G7CrcA6Z+TYaOSWP3JFMaDkhckMWoxhAu6f8eY=;
 b=G0/S0pMQjOWbDYVq3Eg2hpnVRgtSNFukbo80ggQSwyQO7G1V8RbEcV+ahVZmJl0M1X
 2keMHJsikzpjqQOsPFfwkdfoj7JS5vsEAlxWjJ3wy9BYG6k1wUmREvnuJQwEKYVclXis
 hhmQDwPw8dLrI5+VBEgi8u/bjutQHVIsAxfAgdm8sCD+vIxy38vVI6Cn5U5WwqIeUPZM
 VxwPyq9TLmOo9ZwKZr3VH33nd1EVOp9eMaaZYEqP6IrY1CjUHKmnunTBOsFw6WS9At/Q
 CH77zcFrcp4g0kViyGgxFD4Ja5OEarHddizi/5+3kjbeYbd18V5ahKoKu0sZ6TVLKFR3
 sqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sL+u4G7CrcA6Z+TYaOSWP3JFMaDkhckMWoxhAu6f8eY=;
 b=lKFHIKxSCgAFi447ZaUPXNt+9nnaEAhE5RyXZBjJz219PYpKWVq3b6976QIzYs1793
 LUW2Ke0GlGRfSttdcIGkIrTOy7UfOVM6TBxp6iLEBSlKJgshd3wtyuO6KeVDEq9q9g4h
 uk/NAfCgJwUtydOdWxFakhsg1XIv1m/WW7Kw4eWrDeSHXa3bcvAg2qpsTTo37B4vCljz
 G36286Du/6YwOIYYfj+Yc4g1az3ecX3+7oZayqzugB27xdj9cg18ykC0ZLXkg0e+SIRA
 0fJ6aYJv0y1UTCFNI+TCFZ/H3HrPcXPTySXE+fK880QraFrJkfq+1TpTKBxqMfwK3dq5
 OFTA==
X-Gm-Message-State: AOAM531Y52CLMR6SlhiZ7xOlPjGddf7ZUS/DE0u4Ev2lvTUNC9VwEQG3
 n03AHXgppF6C78yJ4hAvUOIBsCDPZV93WqUYIv8=
X-Google-Smtp-Source: ABdhPJw14WGwRwjI3JS9f/hgxbza0cAEMKGAJ1wRfH1tTSrMO2vp3Xb4f94nKSRpGzGiFNuddd5MLmhatevZH6uQA5A=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr23556338ots.23.1617031704134;
 Mon, 29 Mar 2021 08:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210317151348.11331-1-wse@tuxedocomputers.com>
 <CADnq5_OpJ-2jR4D8xwH93PZKoMWXx8C2yGTkqt7KRrVgph-KvA@mail.gmail.com>
 <53b26416-31d0-6efd-04e9-2a9f34e525b7@amd.com>
In-Reply-To: <53b26416-31d0-6efd-04e9-2a9f34e525b7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Mar 2021 11:28:13 -0400
Message-ID: <CADnq5_NwuTv5pWiOk_bYdemm+aPi_SNZTYzMLO3ewma-Bkwhkg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Try YCbCr420 color when YCbCr444 fails
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>, Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 26, 2021 at 10:59 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2021-03-24 4:23 p.m., Alex Deucher wrote:
> > On Wed, Mar 17, 2021 at 11:25 AM Werner Sembach <wse@tuxedocomputers.com> wrote:
> >>
> >> When encoder validation of a display mode fails, retry with less bandwidth
> >> heavy YCbCr420 color mode, if available. This enables some HDMI 1.4 setups
> >> to support 4k60Hz output, which previously failed silently.
> >>
> >> On some setups, while the monitor and the gpu support display modes with
> >> pixel clocks of up to 600MHz, the link encoder might not. This prevents
> >> YCbCr444 and RGB encoding for 4k60Hz, but YCbCr420 encoding might still be
> >> possible. However, which color mode is used is decided before the link
> >> encoder capabilities are checked. This patch fixes the problem by retrying
> >> to find a display mode with YCbCr420 enforced and using it, if it is
> >> valid.
> >>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >> Cc: <stable@vger.kernel.org>
> >
> >
> > This seems reasonable to me.  Harry, Leo, Any objections?
> >
>
> Looks good to me.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > Alex
> >
> >> ---
> >>
> >>  From c9398160caf4ff20e63b8ba3a4366d6ef95c4ac3 Mon Sep 17 00:00:00 2001
> >> From: Werner Sembach <wse@tuxedocomputers.com>
> >> Date: Wed, 17 Mar 2021 12:52:22 +0100
> >> Subject: [PATCH] Retry forcing YCbCr420 color on failed encoder validation
> >>
> >> ---
> >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 961abf1cf040..2d16389b5f1e 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -5727,6 +5727,15 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
> >>
> >>          } while (stream == NULL && requested_bpc >= 6);
> >>
> >> +       if (dc_result == DC_FAIL_ENC_VALIDATE && !aconnector->force_yuv420_output) {
> >> +               DRM_DEBUG_KMS("Retry forcing YCbCr420 encoding\n");
> >> +
> >> +               aconnector->force_yuv420_output = true;
> >> +               stream = create_validate_stream_for_sink(aconnector, drm_mode,
> >> +                                               dm_state, old_stream);
> >> +               aconnector->force_yuv420_output = false;
> >> +       }
> >> +
> >>          return stream;
> >>   }
> >>
> >> --
> >> 2.25.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
