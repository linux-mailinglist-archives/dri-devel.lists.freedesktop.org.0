Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2173131C13
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 00:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907176E593;
	Mon,  6 Jan 2020 23:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D636E591;
 Mon,  6 Jan 2020 23:06:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so51777610wrt.6;
 Mon, 06 Jan 2020 15:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CWw2SMtXEXOWcLVM5K8UlRWvd3huS6ldzOQafR3nK/g=;
 b=ct9i1KnOVYhIz0hkvMXoEiCTshm35RPTQ2/npIbAa8fYP742AP2nZEz8ShpygP6cuw
 YKu4dHjdtSYF7Y924AHMQrrl1Cabv44RRmOz4HkwDZDp6IWdWSpqhGWFQtCeTX0q20Fj
 euu75FoBf7vW9diIm43blTUNZfhL27KlbLAHuZx4jKAcy4JWlJ93XHXRG45fnWi4kbNu
 JVH5+B66Nxy3XU3Dd02rHJHUW58eboAL+NBmqQ3MJ6kk514eoPXgtilTXI/Shkm/M507
 UVYPU3Eb/qdN0FVEAYE02rom1kjnWJYoTCR18z3zLTwwpAE8ILncdehr62BD/4z6y/pv
 TgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWw2SMtXEXOWcLVM5K8UlRWvd3huS6ldzOQafR3nK/g=;
 b=eI4sc94WOc8xnqo5dl0trxahOqnsLHLb/CB+TThWOOXyi2fkKYPNCZjPUDG9OztNRh
 Qo68v6TKy0jWQ4rZ5NDVof3KMjaEWu7lJN/51jkR/ky4XRfvrTDgodxdoUIuqrsHG+sN
 va6i6I8crPTPuQKINSl4Bhh2AV3DvTL6q8i3/oJOQo69kDsQLjkV7boZaY6krr2U70ob
 LxdLeprpV6bXDBQBR8sNVtOlHWfO9JFMHeY7OPiTXO1UyoOIZLzP9WPcml8pUcsmQQgJ
 EUhTjoxKMS01Bw8zDJve6qD6jpFMxEmSXO5yb7y9ZtdEvAVccsVGrVaf2BnIAVtMToOy
 YhTg==
X-Gm-Message-State: APjAAAU0KM/O5itYIjAkeBfk0TidfDTDQHKZNBwckOSMIbu7bgDEcVaK
 v9WKWWkbxsfh7EqMn/yqdYcA0bXpRxyZc29FKRk=
X-Google-Smtp-Source: APXvYqy4jqqoLj9b5U1Qxpr3AOebEW91Zx/4uUXQ7zt0y7D72lxDroYTLkhXPP4APER8BspgW8UF8e1uLZ1/cXpuCO8=
X-Received: by 2002:a5d:4692:: with SMTP id
 u18mr104906459wrq.206.1578351971028; 
 Mon, 06 Jan 2020 15:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20191230161523.32222-1-animesh.manna@intel.com>
 <20191230161523.32222-2-animesh.manna@intel.com>
 <20200103235444.GD2608@intel.com>
In-Reply-To: <20200103235444.GD2608@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Jan 2020 18:05:59 -0500
Message-ID: <CADnq5_MUTQTWkfCvUh+DT7mB61h=m_EyN5AeU4ktEwBkdpq3=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] drm/amd/display: Align macro name as per DP spec
To: Manasi Navare <manasi.d.navare@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, nidhi1.gupta@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, anshuman.gupta@intel.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 6:53 PM Manasi Navare <manasi.d.navare@intel.com> wrote:
>
> Harry, Jani - Since this also updates the AMD driver file, should this be merged through
> AMD tree and then backmerged to drm-misc ?

Take it through whatever tree is easiest for you.

Alex

>
> Manasi
>
> On Mon, Dec 30, 2019 at 09:45:15PM +0530, Animesh Manna wrote:
> > [Why]:
> > Aligh with DP spec wanted to follow same naming convention.
> >
> > [How]:
> > Changed the macro name of the dpcd address used for getting requested
> > test-pattern.
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
> >  include/drm/drm_dp_helper.h                      | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > index 42aa889fd0f5..1a6109be2fce 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -2491,7 +2491,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
> >       /* get phy test pattern and pattern parameters from DP receiver */
> >       core_link_read_dpcd(
> >                       link,
> > -                     DP_TEST_PHY_PATTERN,
> > +                     DP_PHY_TEST_PATTERN,
> >                       &dpcd_test_pattern.raw,
> >                       sizeof(dpcd_test_pattern));
> >       core_link_read_dpcd(
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 8f8f3632e697..d6e560870fb1 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -699,7 +699,7 @@
> >  # define DP_TEST_CRC_SUPPORTED                   (1 << 5)
> >  # define DP_TEST_COUNT_MASK              0xf
> >
> > -#define DP_TEST_PHY_PATTERN                 0x248
> > +#define DP_PHY_TEST_PATTERN                 0x248
> >  #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
> >  #define      DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
> >  #define      DP_TEST_80BIT_CUSTOM_PATTERN_23_16  0x252
> > --
> > 2.24.0
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
