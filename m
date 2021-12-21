Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A6647C5EA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7BF10F75E;
	Tue, 21 Dec 2021 18:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE9F10F772
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:10:21 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so31217pjw.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4FuABV3XoqwgxmPM2DVzmvHufVQQiVq0PwOIhRuBkJE=;
 b=TCQ4oKSx2h35z3HXnqfYySrjNvdMuc/a9FIZIXm18lo9JdL3cV3xZb5ypxinwh0Y1R
 M9b9pFFM78FvWj1v05ipFHfOvZNIlV9o6WWOsHUg9vDhuigbYTkXirFMHS0bxYoBtuPO
 XRBeTOeKmXx4E4gDxUGkfuabR8qoJ7DZ90dLsb31Xi1RTncgx6YI2v6co0yjZkgFkT1G
 RTSy2JBvPo4zm83lw/ez4HvGOHCeB17hDq8N3ZOKe74bfBhgxzIiuoL/9lTm1AHJpSMH
 pHkYtC34d+qM0DDXrmO5dStKWVO1tKpVy605tBCgn0Xuq/QIe6Goa4Pbbqr1Uqzz6l29
 waug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4FuABV3XoqwgxmPM2DVzmvHufVQQiVq0PwOIhRuBkJE=;
 b=UxHtgluNrtCaAg8ByXnPwmCGt56U14SmuvbU7u0FDjVtc4p0GJbMdxQlfsLSeie3oO
 UI+UGDylA9Hlk6+/LNvjnDjTPlpiTy7O2iCHjtohW8YuhAwi21i8gf8PoDbcIJZC1dsD
 pwBg9L3eZe1+O6h7NbtdcQsp4XxX8YFRqMMFNRuYsGZbSwsddLMZv4KphECA1B7RyeGa
 dwIRk1C6gKRYeh7eiUE/kT3AmRYNiDcG4cpB1lvrAQASRiVY5jGRyAbzZP6JvHhJUi3c
 yRSm9N9UTJ99U6cTHpXmEF5cc4R/rssJTyahWtQ93XgQEQwtZc0hNzRSoSqzCNVv+/Sn
 NXEQ==
X-Gm-Message-State: AOAM532t5x/H5aH4wCj0Xd1Mx+xKqG1i4awk+1PCts0ne4+V/ihior8l
 hO+0JOowE8ikMEfvZnPSeQCqOyD1HX1z2Q058gElxA==
X-Google-Smtp-Source: ABdhPJyS4DlfdDaRd80TupBPC+uE1c6GlFCyekTNS0D5lSfHTXGWJT77wKdvjjaQkWF/w74WHVm6w0Nq/T5hEN505FQ=
X-Received: by 2002:a17:90b:3e8c:: with SMTP id
 rj12mr5331171pjb.152.1640110220761; 
 Tue, 21 Dec 2021 10:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com>
 <CAG3jFysa8G_fuGDfSLze-ovft3=gc5PXLaPtwTkC2_e0itQYNw@mail.gmail.com>
 <c09bd552-767e-e783-3f9f-114b8cedb475@gmail.com>
 <a999b141-4b14-cdd0-f6fa-3d861c0f381f@gmail.com>
In-Reply-To: <a999b141-4b14-cdd0-f6fa-3d861c0f381f@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 21 Dec 2021 19:10:09 +0100
Message-ID: <CAG3jFytG110MN=AjnY3mz4pHtLYaTTXVWr9z_1=qpCo8hJoM2g@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Improvements for TC358768 DSI bridge driver
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: Andreas Westman Dorcsak <hedmoo@yahoo.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dmitry,

On Sun, 19 Dec 2021 at 17:02, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 19.10.2021 23:37, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 19.10.2021 12:47, Robert Foss =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> Applied to drm-misc-next
> >>
> >> On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
> >>>
> >>> This series adds couple improvements to the TC358768 DSI bridge drive=
r,
> >>> enabling Panasonic VVX10F004B00 DSI panel support. This panel is used=
 by
> >>> ASUS Transformer TF700T tablet, which is ready for upstream kernel an=
d
> >>> display panel support is the biggest missing part.
> >>>
> >>> Dmitry Osipenko (5):
> >>>   drm/bridge: tc358768: Enable reference clock
> >>>   drm/bridge: tc358768: Support pulse mode
> >>>   drm/bridge: tc358768: Calculate video start delay
> >>>   drm/bridge: tc358768: Disable non-continuous clock mode
> >>>   drm/bridge: tc358768: Correct BTACNTRL1 programming
> >>>
> >>>  drivers/gpu/drm/bridge/tc358768.c | 94 +++++++++++++++++++++++------=
--
> >>>  1 file changed, 71 insertions(+), 23 deletions(-)
> >>>
> >>> --
> >>> 2.32.0
> >>>
> >
> > Robert, thank you for taking care of these patches! Now nothing is
> > holding us from upstreaming the device-tree of the Transformer tablet.
> >
>
> Hello Robert,
>
> These patches spent 2 months in drm-misc-next, will they graduate into
> v5.17 or something special needs to be done for that?

They series has landed in linux-next, and will be in v5.17 if nothing
catastrophic happens.


Rob.
