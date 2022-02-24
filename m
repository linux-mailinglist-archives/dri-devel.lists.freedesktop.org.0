Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDC4C36D9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 21:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A45C10E663;
	Thu, 24 Feb 2022 20:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DED910E663;
 Thu, 24 Feb 2022 20:23:39 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id p15so4773208oip.3;
 Thu, 24 Feb 2022 12:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=biJP7S4dmlMQEfIEiFGAdrTmLmPJKRFHOtbGNeByUq0=;
 b=Bvc+9A4LBrYF5JnCMjcFUHbbdPdxylW4PblxL2/7c6pmrn50DNASncMB3wIqscfj1u
 baNzoXcnX/tY7M+6E+JGvPggZ6g/c32a4KQmvMbQZEU2Ms32dDrvlV+XrNcnOjZbEAx2
 qI5mlfEzZeZRSHlTnu+8Gc1HhmiicMgwExq2a+T7n0F3+rj+9bwi/14MzclnAJ5pLcTq
 ukEhoGrDqCIAF/vRm7nR9HcGaZRzl9yl2mtHdJILbT2QcNB78h5ezsHn5kOFwCIjeSUZ
 l3utO3fhFnU9ei7Ej2bfZB1OJbCW5dUkQdulOS7dP28YEqdSzpNJk6bE/TOASrpMnilM
 Rcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=biJP7S4dmlMQEfIEiFGAdrTmLmPJKRFHOtbGNeByUq0=;
 b=rB4i6qRA6o03e86WZMdMUegcEyDS1vtzltJm3AaBpLy1y2Xc4304voZJ7xIRt7u0Ei
 fEjzm7goqsEvYuMFV9A/8U2JfERWU+4D1S0Zew/ZdAzi7AP6BT6MpABj5QkyiYe48rpO
 bjSBlYIbjl9wYylR/tdjhHzas5dQVy7PyRbX5PjtEAW+k0y3KqVGkeBLydR5nhUhUCZO
 r8EUbbtSDwhvmjT2HmfQehPknAkIu7k8UsdqlkHiuIbYI8BRrUCJQBJbpzMuSMSxrPwZ
 eHeNFZPsLJ00XSdfCWUU+ODv4ZeO/LDgrAGFptn+Y+iO3pEH9J5rq3TUb7z9hWz8ii4H
 Xu1g==
X-Gm-Message-State: AOAM533aYgA3jqMiCb4pCm+VAm3OamB6NumfBEH9fBsn3p2KIIECG6A4
 E7nJC8MCVYiCB9RkLGSSAaIessLbexTAE4d+7bWHl2/4
X-Google-Smtp-Source: ABdhPJzOnZ51sY1NbmHpDjfVDBrKsT4cqT0nVj1WNaKXFkGzwc1KmT+UCdjsCPgSSm9+OOZmf4yYDk9v+sI4m3xfRjE=
X-Received: by 2002:aca:ab4c:0:b0:2d4:7c7d:606e with SMTP id
 u73-20020acaab4c000000b002d47c7d606emr2382125oie.132.1645734218622; Thu, 24
 Feb 2022 12:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20220224191551.69103-1-magalilemes00@gmail.com>
 <cf085422-d109-2e7b-aaef-083d75fcef10@amd.com>
In-Reply-To: <cf085422-d109-2e7b-aaef-083d75fcef10@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Feb 2022 15:23:27 -0500
Message-ID: <CADnq5_OHmo2hRkKjo=yBNLzCvE3XH01MKF8rry4RcmEXPvPu8g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Address a few compilation warnings
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with some minor modifications to patches 3 and 4 to avoid
adding new warnings.

Alex

On Thu, Feb 24, 2022 at 2:44 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> Series is
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> On 2022-02-24 14:15, Magali Lemes wrote:
> > This patchset addresses a few warnings reported by the Kernel Test Robot and
> > sparse.
> >
> > Magali Lemes (4):
> >   drm/amd/display: Adjust functions documentation
> >   drm/amd/display: Add conditional around function
> >   drm/amd/display: Use NULL instead of 0
> >   drm/amd/display: Turn functions into static
> >
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 4 +++-
> >  .../gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c  | 2 +-
> >  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c  | 4 ++--
> >  drivers/gpu/drm/amd/display/dc/core/dc.c                    | 6 +++---
> >  drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 2 +-
> >  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 4 ++--
> >  drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c     | 4 +---
> >  .../gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c  | 2 +-
> >  8 files changed, 14 insertions(+), 14 deletions(-)
> >
>
