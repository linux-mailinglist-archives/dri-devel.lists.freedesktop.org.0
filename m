Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D1994B1BD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 23:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A6610E053;
	Wed,  7 Aug 2024 21:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CXIdeeqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E4410E053
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 21:05:57 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so2251155a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1723064756; x=1723669556;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLt1dqddQDBoCtJXzvJlGMS983d7hsEzCSQWgOd3+yo=;
 b=CXIdeeqr9pR1OqKi8rSt4xDminsBHiI5xPSme1Mz3rqxzrSoDRp2vL7QhCkk/llILM
 yny65HP2ZVdRoZwfesGHSEclAWn/f5Kc4C42StT3xkOOorVkXuVJsHwcjWO5peU7fI5O
 WpI3XTO8d8FwQhgyqAJpaT4uoRv5KbDQEERoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723064756; x=1723669556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLt1dqddQDBoCtJXzvJlGMS983d7hsEzCSQWgOd3+yo=;
 b=IfNV97OVAN28b1Jxw996PXKssKmVum706RTaRtzMQkNGaJGVmVQq0iFHLU8obEvVoJ
 /ey+6wMXYYn6dYXJ5jqc7YQ8ilvjF6EDZOBOXrYiJjFsqQTovjApTl8BMBw2lU3Q0nZF
 qqvS9Dp/QhIa8TQiW0ql7+QoYTaN5cNeyW2SiEHK96fn16L+0zfWPFRaOo0a15bASxTS
 kmBE9GHMHtRcTkay9RDpIj17rlm4Oqg8oH3rD19q6HvjUpqmcOqigqVXCW7utAfznMBg
 UEO567J37/MwZUwtndxvEG4I0LEB7SY8+ybvSN6fQKoVfYaJeuOn9g1bAa/TQQv3+hRg
 Nq7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN50o9vEffBbORunrqtOai6nPhnh4QM0QFFCsXvlqcbo/p8zJXIwLiAeivjJfefo/eLFJr4iPe2IF2wb/V3gcYCaqQ+5mo+LQQeucfY+dn
X-Gm-Message-State: AOJu0YyvKA1XN9rcmmiAG3Z7njFLb0cGXk+VQ1wkp/dxPx8WHHd+TgUV
 b8et6S7N8U1rX+l4MRsBmsoUPs3bFedPs2RPRxr4CQsqsDsLUuT7tgK8efxvecj5LAznM/hG1W5
 vxmAfUrwfZ5xK81CsnOCFpDVLvZzapuFOvNeF9cJH+eDzwkWX
X-Google-Smtp-Source: AGHT+IEVha/qZgi+k4Bh3HWayIPLXCtKLmeWiTv5Psq4K6YKu4pFvkNmbbQ2nEjM7A4vXgDM+ek6l629TptgUUKlLAc=
X-Received: by 2002:a17:907:1c29:b0:a7d:8912:6697 with SMTP id
 a640c23a62f3a-a8078fef477mr300907766b.3.1723064755831; Wed, 07 Aug 2024
 14:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240624185345.11113-1-michael@amarulasolutions.com>
 <CAOf5uwkhThmTEuhYAxAgLqg86PEHJ49wWp67RahVhio=O2OfQw@mail.gmail.com>
 <CAD=FV=W9=Ynhgi3nrfuM47rz053iWTvsEhhQFkZ5xp_bmwzmLA@mail.gmail.com>
In-Reply-To: <CAD=FV=W9=Ynhgi3nrfuM47rz053iWTvsEhhQFkZ5xp_bmwzmLA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 7 Aug 2024 23:05:44 +0200
Message-ID: <CAOf5uwkkggf9ooNWuNxmN2Xn_KKPW_XRVsYy4eUo91WU0M0rWw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panel: synaptics-r63353: Fix regulator unbalance
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Doug

On Wed, Aug 7, 2024 at 11:02=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Aug 7, 2024 at 5:39=E2=80=AFAM Michael Nazzareno Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > Hi Doug
> >
> > +cc Doug
> >
> > I have seen that you have done some re-working and investigation on
> > drm stack, do you have some
> > suggestion on this case?
> >
> > On Mon, Jun 24, 2024 at 8:53=E2=80=AFPM Michael Trimarchi
> > <michael@amarulasolutions.com> wrote:
> > >
> > > The shutdown function can be called when the display is already
> > > unprepared. For example during reboot this trigger a kernel
> > > backlog. Calling the drm_panel_unprepare, allow us to avoid
> > > to trigger the kernel warning
> > >
> > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > ---
> > >
> > > It's not obviovus if shutdown can be dropped or this problem depends
> > > on the display stack as it is implmented. More feedback is required
> > > here
>
> In general the shutdown should be dropped and it should be up to the
> display driver to do the shutdown. If your panel needs to be used with
> a DRM Modeset driver that doesn't properly call shutdown then the
> ideal solution would be to fix the DRM Modeset driver. If this is
> somehow impossible, I suspect folks would (begrudgingly) accept some
> other solution.
>
> From a super quick look, I see:
>
> * This panel seems to be used upstream by "imx8mn-bsh-smm-s2-display.dtsi=
"
>
> * In "imx8mn.dtsi" I see "lcdif" is "fsl,imx6sx-lcdif".
>
> * "fsl,imx6sx-lcdif" seems to be handled by "drivers/gpu/drm/mxsfb/mxsfb_=
drv.c"
>
> * Previously I determined that "mxsfb-drm" was indeed calling
> drm_atomic_helper_shutdown() properly [1]
>
> ...so it seems like just dropping the shutdown handler in this panel is c=
orrect.
>
>
> [1] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b2=
9f746b93621749c@changeid
>

Good, that is the information I need to know, I have read some of your
threads and it's ok for me to just drop it.
I will resend a proper patch for it

Michael

> -Doug



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
