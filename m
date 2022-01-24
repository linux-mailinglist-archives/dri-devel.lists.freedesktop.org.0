Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3A499CA2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D270F10E30C;
	Mon, 24 Jan 2022 22:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5720210E1F3;
 Mon, 24 Jan 2022 22:12:07 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bb37so27822913oib.1;
 Mon, 24 Jan 2022 14:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNPdZuTMGpmraXauVfaM+U1iXWmXev7WNI2qlgKJIbg=;
 b=nRgyGzE6AxLpCKZz2UD75e4pkIds0FuUBfoftvvaRhjfZ3obN3fcNgGyXjDJ1FUNJK
 yscYMaxHJNoZuehn/9plEiPHQFli9uS+MiJVAsTYc7Y99J1X0VTPX8pwP4RMy6O9k6+4
 kmTz3t+nLjdXXoCfa5UIMs3JrxhHUwTvO/wnbllxBZHFWKvHFdDSqzYnYfi5wMKkIAko
 CwscV3NQuKIuyYsBpzRL4/W9WqMLcbHXkBfF3T4ehrmsnRXNvJKOjJxbrHMGClil0sQ3
 8cft5Kx4N+nlQwz/ypXl/Q62QRdHGpUMGu/LmmubbtqWbXziTQ6bDV7ZifJNxOpW95Qj
 qGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNPdZuTMGpmraXauVfaM+U1iXWmXev7WNI2qlgKJIbg=;
 b=SG7ag8Qgvpk86xOkI0nEWQ2oUhsBGLqKC2JnbeiopTxpt83WkBNE3fodzl/PpFXH/r
 1D5HTh1NWsvTcsBWpmvp7584CviCX7AexvDhVc/Tl3aNVE4aK8Pzvh1lkDgDsio9DkYq
 euVeEY1+GHI7aouH1nCv9ZwLExC9Ag3Q5JMgfmJxcblW5/PzPPOD0tuO2TFQ3ba4ceJN
 7TMrUoHHSPw9byrFYDmEMoWdlrpP0F801BI/LEhJHky09aqARw4kQ7AQZZKOd5UlmAGf
 lKPGrn13XaL623PkdYZ9+QuaMEXw0Ml7QQMXdG5TmbvvsjL7D3DvBOnlIBztpiIF6k+e
 tZ+Q==
X-Gm-Message-State: AOAM5337sb3q3IfQmqZuIJqnQLcbyr+sj5Pzwqf8YsjTY46CFn1jCgci
 02HGs5gSXiwk9mKRfMDQgTnpQu0hNwFJcDov059a1Xc7
X-Google-Smtp-Source: ABdhPJyR03hrjLm79a0g6SkQdoHpkJeL3qMSV6vOsoHri99vsAcedey3FSY1h0XpwgmbhXH5wNFcoPGwNC5355tPXio=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr3244011oib.120.1643062326701; 
 Mon, 24 Jan 2022 14:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20220122012343.32540-1-rdunlap@infradead.org>
 <fca36168-d66b-c914-a5c6-fb8d495238ad@amd.com>
In-Reply-To: <fca36168-d66b-c914-a5c6-fb8d495238ad@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 17:11:55 -0500
Message-ID: <CADnq5_OMhZ38b-N=UVC6ckcrzRkh=xBHEMe0UqP2DbqW6-g59Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: don't use /** for non-kernel-doc
 comments
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
Cc: kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 24, 2022 at 10:25 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-01-21 20:23, Randy Dunlap wrote:
> > Change a static function's comment from "/**" (indicating kernel-doc
> > notation) to "/*" (indicating a regular C language comment).
> > This prevents multiple kernel-doc warnings:
> >
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: Function parameter or member 'max_supported_frl_bw_in_kbps' not described in 'intersect_frl_link_bw_support'
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: Function parameter or member 'hdmi_encoded_link_bw' not described in 'intersect_frl_link_bw_support'
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: expecting prototype for Return PCON's post FRL link training supported BW if its non(). Prototype was for intersect_frl_link_bw_support() instead
> >
> > Fixes: c022375ae095 ("drm/amd/display: Add DP-HDMI FRL PCON Support in DC")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > --- linux-next-20220121.orig/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ linux-next-20220121/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -4970,7 +4970,7 @@ uint32_t dc_link_bw_kbps_from_raw_frl_li
> >       return 0;
> >  }
> >
> > -/**
> > +/*
> >   * Return PCON's post FRL link training supported BW if its non-zero, otherwise return max_supported_frl_bw.
> >   */
> >  static uint32_t intersect_frl_link_bw_support(
>
