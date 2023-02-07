Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B2B68E0BA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 20:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8723810E169;
	Tue,  7 Feb 2023 19:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9B410E191;
 Tue,  7 Feb 2023 19:00:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y19so16693247ljq.7;
 Tue, 07 Feb 2023 11:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IZAAXLTIBMknZL46IapS4brI1b2HuoP9eC5nBSVr8Og=;
 b=CixyvlE7KFVa91TNZlHGdx9yoVXQTKr/DMbKYJQy5/JM2zm6pFY1i9DU5V4WV30NoE
 cLxRQubxepRAl9AtStKX4gxzuSokhK5G+lCodtT9845ow2DKvGBHkVl3Gyu7ArqhaiNl
 wboZ/nLXBZxF8LkoQwK0dCXC5tCUCvXea0C+ruQ77u441XFD2rvMur7+9V6VOVuR/6dq
 f9ChIAS2jdn2J2XQMD4k2Tr8MtsVqbmv7XW+djGI0wxpBjnpUX4XZPNhWz/2tRyq2YeH
 nj3kiRouBufrh6HFniu8Z6tZQCmoeq8IBbIEXSCXMTF+sAt0M+RuZDhtCni3/yr6pdaZ
 8vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZAAXLTIBMknZL46IapS4brI1b2HuoP9eC5nBSVr8Og=;
 b=8OVTRTUTqxceGTjL6WIgdc6sVzMdczgKdk8dshBrZc6dBZpiAHHiWxO6iD37PmgeZP
 Cv3s/9iYcUiUJv6o7ZF7ZVMVJv7H03FgIHN3iiPEdc9bevt8qpAJy4KJygn2c1n5Jgjd
 HnKA+aXisVM/AJfTJ6hMjtL8JnY0WsMs9ewvieZ8JrUwMyRHLvS5xxOrFcTjfWUKOTb8
 R5xJ/vFJJrBXJb8g5iDs+Ql0Ch757Zw7AtroOEaCIfAUwRTH9BL3TZ3iOpJSHvUpnKZP
 dhcfXMlo/q6HXf4lM4Qt33PohU5AzailhZHCXvfmLDiPzmZ3Zoer0C1Zj7CwoWmZBIAn
 e4dw==
X-Gm-Message-State: AO0yUKW16VZmSCwXvtpg8CiOgOfBYQFuj/cG+tzZCusIZLfdgnmceyhk
 0Y7sDJmJ3jPgCK4S9HjkqIAikOaGz+owSlaNuQiKtsaecKQ=
X-Google-Smtp-Source: AK7set9hL339Sb1dzF6kHVzWa7yBlfboM7A+lqJ+kHEApCsTmWG4Zlot2BUO0y61ztVYAK761miG/xs6+KYGMAIDYNc=
X-Received: by 2002:a05:651c:3c6:b0:290:5011:2332 with SMTP id
 f6-20020a05651c03c600b0029050112332mr616429ljp.120.1675796447122; Tue, 07 Feb
 2023 11:00:47 -0800 (PST)
MIME-Version: 1.0
References: <20230203155309.1042297-1-ashutosh.dixit@intel.com>
 <CAM0jSHN421CatemTLzZMccGcjSQ_MJEA_vpqbCHgDrtuE_xC9w@mail.gmail.com>
 <87357ho3o6.wl-ashutosh.dixit@intel.com>
 <871qn1o0t8.wl-ashutosh.dixit@intel.com>
In-Reply-To: <871qn1o0t8.wl-ashutosh.dixit@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 7 Feb 2023 19:00:19 +0000
Message-ID: <CAM0jSHPrLEDqrWGV-ckTA2mPF3p5LkcSqTsFy0s86sZk+Wpz2g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/hwmon: Enable PL1 power limit
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Feb 2023 at 17:19, Dixit, Ashutosh <ashutosh.dixit@intel.com> wrote:
>
> On Tue, 07 Feb 2023 08:12:25 -0800, Dixit, Ashutosh wrote:
> >
> > On Tue, 07 Feb 2023 01:32:44 -0800, Matthew Auld wrote:
> > >
> > > On Fri, 3 Feb 2023 at 15:54, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> > > >
> > > > Previous documentation suggested that PL1 power limit is always
> > > > enabled. However we now find this not to be the case on some
> > > > platforms (such as ATSM). Therefore enable PL1 power limit during hwmon
> > > > initialization.
> > >
> > > For some reason it looks like this change is impacting the atsm in CI:
> > > https://intel-gfx-ci.01.org/tree/drm-tip/bat-atsm-1.html
> >
> > Hmm, the change was meant for ATSM. Anyway let me try to get hold of an
> > ATSM and see if I can figure out what might be going on with these
> > seemingly unrelated failures and if I can repro them locally. Thanks!
>
> Rodrigo/Matt,
>
> I am proposing we revert this now and remerge again after investigating,
> even getting ATSM systems to investigate is not easy so it might take a few
> days to investigate. What do you guys think?

Yeah, maybe just revert for now.

>
> Thanks.
> --
> Ashutosh
>
>
> >
> > >
> > > >
> > > > Bspec: 51864
> > > >
> > > > v2: Add Bspec reference (Gwan-gyeong)
> > > > v3: Add Fixes tag
> > > >
> > > > Fixes: 99f55efb79114 ("drm/i915/hwmon: Power PL1 limit and TDP setting")
> > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/i915_hwmon.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > index 1225bc432f0d5..4683a5b96eff1 100644
> > > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > @@ -687,6 +687,11 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
> > > >                 for_each_gt(gt, i915, i)
> > > >                         hwm_energy(&hwmon->ddat_gt[i], &energy);
> > > >         }
> > > > +
> > > > +       /* Enable PL1 power limit */
> > > > +       if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> > > > +               hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> > > > +                                                   PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
> > > >  }
> > > >
> > > >  void i915_hwmon_register(struct drm_i915_private *i915)
> > > > --
> > > > 2.38.0
> > > >
