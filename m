Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3329B663
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 16:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED506EB93;
	Tue, 27 Oct 2020 15:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7E89B5F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 15:24:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t9so2343175wrq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvDK27GUGEWqNurPqrshtoyaXsgIxFEN40Ejo47r0YI=;
 b=n/nJGANHSvV7xYPHKwJpbs/YGbwhGxLjTHi/BEZV6JogEJoeHbzl4xxv/hMQJWUZ+k
 xYwoSX0eCpFCVyCwd+LYoVn8hUtxsY9xo6PKQnYizYMCXTa7HrMI0wqUbBamt3xNQPgK
 ejOf8q/V8K/xn6z2pKE1qlHdUbj6q2xqwcXSGsnyHvzB0/itzkXnyTX5yuqAuGT7DRao
 hFewCx4lH4aT3hepYD4CUaBHAuVgzcVllnJbNURK+vKMUkxDw2tAP0HNXUU/TdTuasGy
 Mxl7KmplY2MgqSL4xdTmuO+X2E6P4ZoxXeoVkJsI4Of074c54P+jucwBiMj/m57Vwcsr
 lOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvDK27GUGEWqNurPqrshtoyaXsgIxFEN40Ejo47r0YI=;
 b=X/quyxLTTeDXfHWJDwbZDzkKpl4PIEkYVvT5ifREzxv8DJsQk4rebTzCg0CrVdY13D
 /gRcEBNuziKHcasY2TbKWJlzf8SdPaYqtfQIZdLtfsagMscSvsE5//o5TXT72NNYv5aR
 LC3/AZfShMQnx8x9cGGFFzV2DKmtbMizYGIiMBoYU4knbvrOqNK3i3FYyZqiFmMxWWvy
 juZ7IQLTF2NZ19jo8lxTCl3f+EUxFWpt3J7ZBCxh7gXGjjS38PXwjZvDy95gPEiDv11z
 PwXPpQFAvrf6K3GHG8pQ+YrHtidgt3KwD+M+IDcaKEg+oVSy+Cu9Hb7yaKVxRWpHTI/H
 Xhqw==
X-Gm-Message-State: AOAM530Oml2EpXVTEK9kgLjRD2XqeetHEwgPBvprs3PYcSxYsVbenw0/
 aGSNqbc6Lslc4ADPSy/f3weOhZyHJ3IW1EQ17N0=
X-Google-Smtp-Source: ABdhPJzeDsAGlqluEGkZAoEObDj422nTxzre1bxoEC+JA/jDgPr7k0n7ZrsCnJ9GVtOazzJqxRaiaTvYvqt9qBbKfFk=
X-Received: by 2002:a5d:6642:: with SMTP id f2mr3610242wrw.374.1603812284789; 
 Tue, 27 Oct 2020 08:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <9faa1070-d46e-5340-f6a2-5826614f306b@gmail.com>
 <CAGPDPzA3+NFO5meR-YHByaRc+unQvPOU-2sjGkpBEkwcdsJwWQ@mail.gmail.com>
 <CADnq5_OfGqShN+4hzK75UKj7OiBrYgXbXE_iFSCTV_bJUyKk-Q@mail.gmail.com>
 <CAGPDPzBufXbfv=o0hJo=DsH=0GFtH+Anct0hsbH=u7nnz5_rvQ@mail.gmail.com>
In-Reply-To: <CAGPDPzBufXbfv=o0hJo=DsH=0GFtH+Anct0hsbH=u7nnz5_rvQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Oct 2020 11:24:33 -0400
Message-ID: <CADnq5_ND0M5UddF5OTNsmi6ompJJweNCbwLxxMhsJyNnCnnYEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/radeon: Add new callback that exposes vddc
To: Sandeep <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Oct 27, 2020 at 7:53 AM Sandeep <sandy.8925@gmail.com> wrote:
>
> On Mon, 26 Oct 2020 at 23:53, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > I don't see them on the mailing list.  Are you sure they went out?
> >
> > Alex
>
> The original email in this chain is the v2, sent in the correct form.
>
> >
> > On Sat, Oct 24, 2020 at 1:47 PM Sandeep <sandy.8925@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > I've resent the patches in the correct format. Please review.
> > >
> > > - Sandeep
> > >
> > > On Fri, 9 Oct 2020 at 13:14, Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
> > > >
> > > > This patch adds a callback for reporting vddc, to the dpm field of the radeon_asic structure.
> > > >
> > > > Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
> > > >
> > > > ---
> > > >  drivers/gpu/drm/radeon/radeon.h | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> > > > index cc4f58d16589..85a1cafdf303 100644
> > > > --- a/drivers/gpu/drm/radeon/radeon.h
> > > > +++ b/drivers/gpu/drm/radeon/radeon.h
> > > > @@ -1992,6 +1992,7 @@ struct radeon_asic {
> > > >                 int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
> > > >                 u32 (*get_current_sclk)(struct radeon_device *rdev);
> > > >                 u32 (*get_current_mclk)(struct radeon_device *rdev);
> > > > +               u16 (*get_current_vddc)(struct radeon_device *rdev);
> > > >         } dpm;
> > > >         /* pageflipping */
> > > >         struct {
> > > > --
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
