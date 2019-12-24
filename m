Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E8D12A3EE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 19:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286386E34E;
	Tue, 24 Dec 2019 18:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6AE6E34E;
 Tue, 24 Dec 2019 18:33:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c127so2410863wme.1;
 Tue, 24 Dec 2019 10:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X8U8/FVOdpJI6+EUUEtNPDmV7hZN2dSGZa4lHfVJKyk=;
 b=PWWcgMwZ82NXZnI3UMLuZRsMgmRqIZM8idgIjpdla2kofqUFKrnBERIOTt3dVlO2M9
 EcTI9l2trWYNgbKv/zAEe/6Bw6YxjaRZva3AndVofmQdQjrJPqSkfjAWmm2SxYedyVRE
 x8iWve+Vlf+Ll7e0pfGK6CosiI8kRSTFk8DQao+/zYBFjQRgbh7TAygJuKcK35J9B8gg
 se5CfqaBil2PAubnidfS3OIVNISlJJnShisgz6FaSf1tW7iHnAnVBC4If2hvEbt3R+Y0
 VD/EOda7HZog52FFiTFeysYTitjXpqUgbUnUMJ/zzSGbjaHKi7xVcRqogU4+ocsHEUe8
 gVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X8U8/FVOdpJI6+EUUEtNPDmV7hZN2dSGZa4lHfVJKyk=;
 b=CWe8/lE6MgVBN8+6wXx/KbTMfMNpGd0nT885kdGNF4rRIx+j6pxwvgVoHB+Mqrpq9X
 kVl5h20Ym2ojV/AnbwdQfA5O5V5NAhm3/Ox/Mm200lYyNDYtO733JjDBGMNg3PBXlF/q
 YoY2V2fFIBgVVDhzq4+pt2XblwYGua5hrHgVN89JEEbeBgMAVh+0XEFUq4qs7BHH1w/T
 +494wWHUvBoGovPXfgbycFRepmmik+t3N40Nc9K8w58CT8AC7X4e1IYq+7aKIpt3zROA
 tL74DVVF7mu37GqNuoypiHHy8sTs649rhlWVorGQw0vzsDFpQDWCD74Aofv7Jfx3TA/s
 dXGw==
X-Gm-Message-State: APjAAAV26OQlYFoKpij3BcX5KzdslkFCKR2YMj9iCWxhHRqrMhWu9P/I
 /YIYsjecN81/aTHIedkXM9X390IDP51HfkIAeHw=
X-Google-Smtp-Source: APXvYqzIhH6VaY9aTXzn0laFtZKClPYgBl9+/aBQmeKIjviiB575ilkx8wjGY+3Iv27pPt/PTNIwCqcsm+NE88VAQ+A=
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr5331566wmq.65.1577212382352; 
 Tue, 24 Dec 2019 10:33:02 -0800 (PST)
MIME-Version: 1.0
References: <1577158063-76188-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577158063-76188-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Dec 2019 13:32:50 -0500
Message-ID: <CADnq5_Nn8JeFcC9zqMd-wHE=rLxv2qS80puzrJRAVLcbMbnxzQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/amd/display: use true,false for bool variable
To: zhengbin <zhengbin13@huawei.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 24, 2019 at 9:30 AM zhengbin <zhengbin13@huawei.com> wrote:
>
> zhengbin (8):
>   drm/amd/display: use true,false for bool variable in dc_link_ddc.c
>   drm/amd/display: use true,false for bool variable in
>     dcn10_hw_sequencer.c
>   drm/amd/display: use true,false for bool variable in dcn20_hwseq.c
>   drm/amd/display: use true,false for bool variable in
>     display_mode_vba_21.c
>   drm/amd/display: use true,false for bool variable in dce_calcs.c
>   drm/amd/display: use true,false for bool variable in
>     display_rq_dlg_calc_20.c
>   drm/amd/display: use true,false for bool variable in
>     display_rq_dlg_calc_20v2.c
>   drm/amd/display: use true,false for bool variable in
>     display_rq_dlg_calc_21.c
>

Applied.  Thanks!

Alex

>  drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   | 24 +++++++++++-----------
>  drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |  2 +-
>  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  4 ++--
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  4 ++--
>  .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  | 24 +++++++++++-----------
>  .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        | 24 +++++++++++-----------
>  .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |  6 +++---
>  .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  | 24 +++++++++++-----------
>  8 files changed, 56 insertions(+), 56 deletions(-)
>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
