Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1489A5BB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B242310E9CE;
	Fri,  5 Apr 2024 20:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jgtKWuyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA8010E9CE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 20:39:45 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so2462230276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712349584; x=1712954384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBhBS0owbOH8q75Bsi/MEJG4WnLcbooElg/VsjMfWN4=;
 b=jgtKWuyYSiSYA74ZJxn65Y1leRcjqDfM6Cm7oXkIW86KbOj3g31gLRHr2Z2XyEej7R
 bFwJ4g1DKWwWnHSI2WFTUaE0SkM+c5/bPxpDfjUQuhB8g4/QQIsS2m1GvETBG9KiHcu2
 vde3kSkNqpT5+tZt2bYH0jlDUu0leK6v7+DQb3U4fgd60ynkzkyK8XxtKhcqyYDRBNNo
 k6lDjU1DxMsBKsuSeXppLOksdGFdXr6oKxSJGnecCxzkNleIZ0GsGgZQIo2f/7q7RL82
 B67kyYISMCEgLGUVLpMp1ezSXqGgu7FHXNgHBl/L4OLybSzXBp6DXLSpzDI8w20YiGCC
 eBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712349584; x=1712954384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uBhBS0owbOH8q75Bsi/MEJG4WnLcbooElg/VsjMfWN4=;
 b=dE+2V6r6gJopi/HJsRyALOxDeiPTKw3ZV33UfkilP3Rs4O0Fg5aWatMlCzqaS7bIet
 XQB8OwMdE24j2/Z7wWKwxSwLJkGaLTphNJl1WUi/8wG8yQg6MNoUb5TSuol7STBuIfaD
 7UxtqrTtYljL/K9L8zEjsWN+YkcOgBHPki9LrpYKlxCg6DRDK4SKm+gMuT+CASMO4MYJ
 GfFKyMO+8gBMllhnF2TH6T+iyGXOiu5bjJ/DXyn2qcpYwixaNhXn7d7ijuce5mBEBTng
 ImteP/y9WKPd2xhA716+1/KHbGnOA+3bs7+2A4jTemdeDk1PF0b5gqWkvFDdAyBzO/aj
 jKAg==
X-Gm-Message-State: AOJu0Yz7DVnPw7QeNbjuQWy0KfmA5ATF5WjSUzDG0FoAYWhLsBjJyD37
 r2p5IOdUIOW5mcl+7RldnOXgk1TIFo/XComR9sWPb0ZJdl3lLCwJB2bvGqNyuzOwtRQdqK5FT+Y
 MKS/05OFJqkVpNL7EOjCWS3Fhqc23M1RNkTyjQw==
X-Google-Smtp-Source: AGHT+IG8FM1KA6lXL1vVbGQ17xaHBcl33s1MYUN/yvSZWpowmG7hxpDvUXJlCdtYdFehQzhGV4tC6L96Rq2A1pVTl48=
X-Received: by 2002:a25:6806:0:b0:dcc:943a:b99f with SMTP id
 d6-20020a256806000000b00dcc943ab99fmr2206544ybc.46.1712349584584; Fri, 05 Apr
 2024 13:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-2-ville.syrjala@linux.intel.com>
 <jeg4se3nkphfpgovaidzu5bspjhyasafplmyktjo6pwzlvpj5s@cmjtomlj4had>
 <ZhBOLh8jk8uN-g1v@intel.com>
In-Reply-To: <ZhBOLh8jk8uN-g1v@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 23:39:33 +0300
Message-ID: <CAA8EJpoOzKPh1wFfgQy8bZN_jfsrgAcrxM1x1pEFbAwcY9zBUw@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/client: Fully protect modes[] with
 dev->mode_config.mutex
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Apr 2024 at 22:17, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Apr 05, 2024 at 06:24:01AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Apr 04, 2024 at 11:33:25PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >
> > > The modes[] array contains pointers to modes on the connectors'
> > > mode lists, which are protected by dev->mode_config.mutex.
> > > Thus we need to extend modes[] the same protection or by the
> > > time we use it the elements may already be pointing to
> > > freed/reused memory.
> > >
> > > Cc: stable@vger.kernel.org
> > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10583
> > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > I tried looking for the proper Fixes tag, but it looks like it might be
> > something like 386516744ba4 ("drm/fb: fix fbdev object model + cleanup =
properly.")
>
> The history is rather messy. I think it was originally completely
> lockless and broken, and got fixed piecemeal later in these:
> commit 7394371d8569 ("drm: Take lock around probes for drm_fb_helper_hotp=
lug_event")
> commit 966a6a13c666 ("drm: Hold mode_config.lock to prevent hotplug whils=
t setting up crtcs")
>
> commit e13a05831050 ("drm/fb-helper: Stop using mode_config.mutex for int=
ernals")
> looks to me like where the race might have been re-introduced.
> But didn't do a thorough analysis so not 100% sure. It's all
> rather ancient history by now so a Fixes tag doesn't seem all
> that useful anyway.

Well, you have added stable to cc list, so you expect to have this
patch backported. Then it should either have a kernel version as a
'starting' point or a Fixes tag to assist the sable team.



--=20
With best wishes
Dmitry
