Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4567F0A56
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 02:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A0D10E0FD;
	Mon, 20 Nov 2023 01:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EB910E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 01:33:38 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2839cf9ea95so1356184a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 17:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700444018; x=1701048818;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kuzrNLLLYuThvLXebFuGOWTMIEQwvHilBibvY9e/CE=;
 b=WP1IKjLAtyk7wfNbFD1JuO3Vzz1wsEKy6rqSCq87eHMNPDqd3eRc+7LmMWm2+pDMO7
 LaTcBgnz+dNs1WORX1OS04XywWP2YeqRVHaJagQCtL6gC/Tcb0qviTZTzRhrp/EXWcAN
 Rf4N0XeBbIslhtwVOAXuFgET7hPI6RReMSz5weDLweW5lt5fgWSkEzrOTxsKw03uR9VM
 oXqekyIAPCgSPH7qx3NIrjpTnaPWhqzCffFT7gqvDlWuh/3O1vZ4r++yA9iE2HPMWAOi
 yE+HXJ8ZKWmikp1qb+n1uzCfef4HuFqN9aBfgL1Va5obEINdS380BqJcYvYQh0GcD6jd
 vbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700444018; x=1701048818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kuzrNLLLYuThvLXebFuGOWTMIEQwvHilBibvY9e/CE=;
 b=cvgx6UV+LcBxcSjya5l8Mux+0KBEXjV0DzLJbnG6Tw3cWMqrQggOwoLGQozDBJoLYH
 dirZVhfEpN16UG9DHQX3oVwSfpg1hckcfFxRr0EyznZNIOJ0cTHzd+9Wm/PLNvkbLCFw
 AJK8fZZMPqFIlpiOqwLyBAg+C1D6ZBzmVSoaRUPZGqAMff355IUMuR3I4HzsWuVB1Gii
 UW4u7vPhs+9FSDVPJvdmhZPQwNh8AcHtrz6iDhjxjT0mzlHGGCuj6jnY2xaTQfZSybQO
 TNCM103m+KyIdFbI70ipNWBWRiOdRuop7ASB29MLWpAH9zUgHj+KSHyXcB7O48tC9HNJ
 qWGw==
X-Gm-Message-State: AOJu0YxnnkyXkl+NTrsOpQzlVrWvwQv45VS0Jg+ftOfTAsgKat+JeQ4n
 2b0H466HIAEpiD6QUgOrFNdEvt9cEyzeoBQUr1b6jQ==
X-Google-Smtp-Source: AGHT+IGfrLe3ZXNHG4Y8Xe/D8PiQI2xGMA0op/1BiKUT+XL/eSwYNihBlU80n/lj9rtzMBy0amdioREwq0mzBANkb0k=
X-Received: by 2002:a17:90a:dc0b:b0:27d:1d1f:1551 with SMTP id
 i11-20020a17090adc0b00b0027d1d1f1551mr3639521pjv.29.1700444017713; Sun, 19
 Nov 2023 17:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20231117032500.2923624-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WAPAhMfK5jgkMS=m3grxaUtrDoZnQs3rmbLpLX84+j1w@mail.gmail.com>
In-Reply-To: <CAD=FV=WAPAhMfK5jgkMS=m3grxaUtrDoZnQs3rmbLpLX84+j1w@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Mon, 20 Nov 2023 09:33:26 +0800
Message-ID: <CAHwB_NLHqyP6mpQJHw86Hk-g3d8Q9xjRBde_YTTQiuLBwAhEKQ@mail.gmail.com>
Subject: Re: [PATCH V2] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, zhouruihai@huaqin.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Nov 18, 2023 at 1:11=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Nov 16, 2023 at 7:25=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The refresh reported by modetest is 60.46Hz, and the actual measurement
> > is 60.01Hz, which is outside the expected tolerance.
>
> Presumably you've swapped the numbers above? The value reported by
> modetest is 60.01Hz and the actual measurement is 60.46Hz?

No, the value reported by modetest is 60.46Hz.


>
> > Adjust hporch and
> > pixel clock to fix it. After repair, modetest and actual measurement we=
re
> > all 60.01Hz.
> >
> > Modetest refresh =3D Pixel CLK/ htotal* vtotal, but measurement frame r=
ate
> > is HS->LP cycle time(Vblanking). Measured frame rate is not only affect=
ed
> > by Htotal/Vtotal/pixel clock, also affecte by Lane-num/PixelBit/LineTim=
e
>
> s/affecte/affected
>
> For me, the important part would be to explain the reason for the
> difference. I assume that the DSI controller could not make the mode
> that we requested exactly (presumably it's PLL couldn't generate the
> exact pixel clock?). This new mode was picked to be achievable by the
> DSI controller on the system that the panel is used on.
>
>
> > /DSI CLK. If you use a different SOC platform mipi controller, you may
> > need to readjust these parameters. Now this panel looks like it's only =
used
> > by me on the MTK platform, so let's change this set of parameters.
> >
> > Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI=
 MIPI-DSI panel")
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> > Chage since V1:
> >
> > - Update commit message.
> >
> > V1: https://lore.kernel.org/all/20231110094553.2361842-1-yangcong5@huaq=
in.corp-partner.google.com
> > ---
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> As per discussion in V1, I'm OK with this.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll probably give it at least another week before applying in case
> anyone else wants to speak up. It would be nice if you could send a V3
> with a few more touchups to the commit message, especially since the
> 60.01 and 60.46 numbers were backward (unless I'm mistaken).
>
>
> -Doug
