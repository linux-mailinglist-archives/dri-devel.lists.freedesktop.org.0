Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEBF820498
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 12:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9E710E055;
	Sat, 30 Dec 2023 11:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17E810E055
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 11:29:36 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-427e59202ceso23268511cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 03:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703935776; x=1704540576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rdHRZOJmLihwmundfIYh/Hz760M3I/Nde2Bk7xxTT8A=;
 b=WTlzTIItX1kMfolg8N01smJg/4ib6i3Rt+iSFyniRVfbFt/xelD38L1HW+5qZBRdFt
 Yw/Z0s50DDqkf2gMzgxG5+Kj/Y4Njk6lV6cTD8GIe6ivpUZl9/omXK+l9pHBW2vp56ln
 1Mld+rOmjkE3J0GA12KPKHDWs6sOcd6ShsE+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703935776; x=1704540576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rdHRZOJmLihwmundfIYh/Hz760M3I/Nde2Bk7xxTT8A=;
 b=olMLOcOlKv+EOd5fRXrofjCm9MXMzeniQOlaG6aBZZZcriRPZkN5DOPUtRetJqajrR
 kSNdyg0Cyimkgd5VPgncv5zRbslXqzEn54+cNESz+TyUldN+7miDxSnf82CBi4k9wtsh
 WSFVD3ndm47u4unZBEilYxxB9K2WTEmZ40tttmqvzYViHFqpCrMDEBDNsNYseQQntLNB
 rXgauohdrCUFUgjmADoG+tnsLJ5MYalBfLkyl/4+zLiHN2DxMQHN7b25NfdqcBiPWmQE
 yiDUxeVS8I/v0Vh7qNNoEdY1BueJK2ikwZdzzdRy6BABAw/iC3RmktHD3x8/TI4f6OX2
 Ni4g==
X-Gm-Message-State: AOJu0Ywm91eJDPAfrY0RXotvt/BmdEFYLYSAdtrHr5w5vsfcrv0E6zG9
 c+6RvxQ/o/qmf4nfy8BGM/egy9BjpbPBlsgE1/+/YXuSMywXu6jiQp0m4zOF
X-Google-Smtp-Source: AGHT+IERnlTpmOwuxpaJxtAALpkHsOCMYmErEeE799Q8hbMelUhNiSF7yID6JUsxUnY0tfGC2aD2IOPLZZPULy041zE=
X-Received: by 2002:a05:622a:1393:b0:428:c11:47aa with SMTP id
 o19-20020a05622a139300b004280c1147aamr1958131qtk.57.1703935775771; Sat, 30
 Dec 2023 03:29:35 -0800 (PST)
MIME-Version: 1.0
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
 <20231229135154.675946-8-dario.binacchi@amarulasolutions.com>
 <CACRpkdbHodbAwoaTyxTX4LxYm6ZrBV6m6ht31Y2OaUPxS0Zhrw@mail.gmail.com>
In-Reply-To: <CACRpkdbHodbAwoaTyxTX4LxYm6ZrBV6m6ht31Y2OaUPxS0Zhrw@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 30 Dec 2023 12:29:25 +0100
Message-ID: <CABGWkvpvze9pBg9_3r9A0oWjTQ8JrRzXU+-0HX_9kkJFNNW8ig@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/panel: nt35510: refactor panel initialization
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Fri, Dec 29, 2023 at 6:43=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Dec 29, 2023 at 2:52=E2=80=AFPM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
>
> > The previous implementation did not make it easy to support new
> > NT35510-based panels with different initialization sequences.
> > This patch, preparatory for future developmentes, simplifies the
> > addition of new NT35510-based displays and also avoids the risk of
> > creating regressions on already managed panels.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> The idea is to have the driver adapt to different panels, and encode a de=
ep
> understanding just like we do with all hardware drivers.
>
> NAK.
>
> This patch:
>
> - Deletes a lot of useful documentation on how the panel works.
>
> - Deletes defines and replaces them with magic numbers
>
> All it achieves is a bit of "magic sequences because we are used to
> magic sequences" and that doesn't look like an improvement at all,
> instead it creates a dumber driver which has no explanations at all
> to what is going on.
>
> Please rewrite the patch in the same style as the original driver.
> The fact that you (probably) are not used to writing display drivers
> in this way is not an excuse to destroy this nice structure.
>
> There are things that can be done, like create an abstraction for
> sequence encoding with less open coded command issue
> statements, by adding helpers to the DRM core, so if that is what
> you want to do, then do that instead?

Thanks for your explanations and suggestions.
I will rewrite the patch following your suggestions.

Thanks and regards,
Dario

>
> Yours,
> Linus Walleij



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
