Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D014C737
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E326F47A;
	Wed, 29 Jan 2020 08:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2949F6F47D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 08:08:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q10so19029303wrm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 00:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bvE12L7lEn/mTFSZYCGy+MNNNQ1ZOLEMV//buTiW8GY=;
 b=ct8Sw2X2mwbIePeWEzfZiolDLM6f5fyi8KP/t6UPAWiSLXKpd7+RZUk7XUggi2rgq1
 /Ytvq4u4dAFc6HQTf66j8Aqm+GGyz8OEyHP/Bvi/Zc6PnRzxUoBmUMTgYfcSsEOMTsii
 BvNBghGsgBFE2Fkg5ZLCoLK+roTX/gSw7oOE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bvE12L7lEn/mTFSZYCGy+MNNNQ1ZOLEMV//buTiW8GY=;
 b=SV2PIVJidv1MQY2TpgHdrvy/nVo6wMHxkQEi2zgmZl+sjWC8wVNwq7KogmWbu1uwxm
 5enasA2hV3e8dJMK+MoaAr0FQMMXx93CzHhLptiupAhZtJN2+7CRTaEjOhkRlGLeMnP/
 oDWXelEK1VLlodTOui3OCQLdeRWVpc93oT14/V2hj6Qx0qF7683CYUD6HxDIwiMOg8IF
 FQG3eVFIrTmB61rpWOLGykX4q+DHeUNXqWH6EDOQV6c0NpkIcDiknb04hGdQFikDZojq
 xq03DTyZdxakfLnsZnpFeXDp7snGUKYSP9nIEHX8kkHShr8BmfdlGztZOzEvZMuu8Y3U
 V5Dg==
X-Gm-Message-State: APjAAAW9Tf9/hntSAZjmvR6mcGVfO0xORSH7E7ryqppHI6J31S4iDXHz
 BuMkhomvpLwNEnNbMzm6tPfmLLdJl2UD/Q==
X-Google-Smtp-Source: APXvYqwnEq09++ittS5cRMUBhnrMu/D+AwbosDhLQMJ/wQsaGLge7NMrc0D8i0oigx9YZNo5qzyY2Q==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr35659466wrr.226.1580285281728; 
 Wed, 29 Jan 2020 00:08:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n1sm1763798wrw.52.2020.01.29.00.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 00:08:00 -0800 (PST)
Date: Wed, 29 Jan 2020 09:07:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] radeon: insert 10ms sleep in dce5_crtc_load_lut
Message-ID: <20200129080759.GJ43062@phenom.ffwll.local>
References: <20200128160952.1628146-1-daniel.vetter@ffwll.ch>
 <CADnq5_PhFRASAC62axW9yV_Dq96NonNkw_nvjmRffUYMJa3xCQ@mail.gmail.com>
 <CADnq5_PADDMf+W6hzVSogJn5h-ge2cXt41bjWEpPOq-3eqXWfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PADDMf+W6hzVSogJn5h-ge2cXt41bjWEpPOq-3eqXWfg@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 04:24:19PM -0500, Alex Deucher wrote:
> On Tue, Jan 28, 2020 at 4:21 PM Alex Deucher <alexdeucher@gmail.com> wrot=
e:
> >
> > On Tue, Jan 28, 2020 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> > >
> > > Per at least one tester this is enough magic to recover the regression
> > > introduced for some people (but not all) in
> > >
> > > commit b8e2b0199cc377617dc238f5106352c06dcd3fa2
> > > Author: Peter Rosin <peda@axentia.se>
> > > Date:   Tue Jul 4 12:36:57 2017 +0200
> > >
> > >     drm/fb-helper: factor out pseudo-palette
> > >
> > > which for radeon had the side-effect of refactoring out a seemingly
> > > redudant writing of the color palette.
> > >
> > > 10ms in a fairly slow modeset path feels like an acceptable form of
> > > duct-tape, so maybe worth a shot and see what sticks.
> > >
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Michel D=E4nzer <michel.daenzer@amd.com>
> > > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D198123
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >
> > Works for me.  Applied.  Thanks!
> =

> Actually, thinking about this more, I wonder if this will have adverse
> affects on stuff that messes with the LUT like various fade effects in
> compositors.  I guess we can cross that bridge when we get to it.

With atomic and the new color manager stuff the legacy gamma table things
go through a full atomic commit for at least some drivers already. So
ratelimited to vblank.

So for the overall ecosystem I think we crossed that bridge already, but
yeah good point might be someone with an older stack on radeon being
upset.
-Daniel

> =

> Alex
> =

> =

> >
> > Alex
> >
> >
> > > ---
> > >  drivers/gpu/drm/radeon/radeon_display.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/dr=
m/radeon/radeon_display.c
> > > index 354756e00fe1..d07c7db0c815 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > > @@ -127,6 +127,8 @@ static void dce5_crtc_load_lut(struct drm_crtc *c=
rtc)
> > >
> > >         DRM_DEBUG_KMS("%d\n", radeon_crtc->crtc_id);
> > >
> > > +       msleep(10);
> > > +
> > >         WREG32(NI_INPUT_CSC_CONTROL + radeon_crtc->crtc_offset,
> > >                (NI_INPUT_CSC_GRPH_MODE(NI_INPUT_CSC_BYPASS) |
> > >                 NI_INPUT_CSC_OVL_MODE(NI_INPUT_CSC_BYPASS)));
> > > --
> > > 2.24.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
