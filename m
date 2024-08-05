Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF55947366
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 04:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC3510E0FC;
	Mon,  5 Aug 2024 02:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="raFIL7kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E57F10E0FC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 02:38:49 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so15236815a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 19:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722825527; x=1723430327;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8vWHyjZtR29d9CpbPSiDhP2YMe9PC/XfNzJS8EFIt4=;
 b=raFIL7kn1tOSCfORknb7Ik0bwuPEBGfOj+YU7C3ZQh45DNYX+YpSuJx/+fhfxbZ9fT
 0IuzUDF67a/AeYTUaj+GhlxndE8eyHNqpr4QDVr1Ye+wJDxrVJgouHovQD9yvlGeT25e
 4kQ068MQUbEWA8BnpS0tjKuvgzieeiuXSHqvKXDZuu2ehy4/j+4mA+M1qdRIvNL96t8B
 +5mjuYP9ku3/sD6uNtFO48ZWSTk1g4nOLiW/rwmU8P3jvHIzAmqtotGsGYeA9CpTZsl9
 RWXWZpFiNSLDhTazmlaw7o1FMvlCe2TlgXkJSk/Yln78fkLZ1vsou5y1MwXyxBl4dLs6
 O/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722825527; x=1723430327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8vWHyjZtR29d9CpbPSiDhP2YMe9PC/XfNzJS8EFIt4=;
 b=tj6+dV7BVk8/VyyThNw4sqFIYC4FujaoHU2cdZcscLIwqGpeLm4jWGqsC4Dhct/VBF
 gTDVs+KB6M4wS+Poli+6dEFWJb4mtBExOVsSiVgTL4QaUN+Fo+Z6JmY348rEd5JltbMu
 DAYGu5TCVIfGFpGUksr9RkicdZ5MjMzBAuxbgcfrcomIJVrMG90XS7pK2U1L9JBRMK7a
 gi9MfQEaq1gIivm9HshO8TZ9lv0Unz5p5dO8tMJktCWsN9YbB1b3BLo4QBWOLYDsM2v1
 eYcaI8JHaD1pQl6esMwzwZf27kFjkjZn0Ykh6s6C3iEfqdgh05uk9ShOzQLglquU4BPt
 f0ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUErtEWMO/SXmonmcSSgr+WTUHm5rD/Zg+NTRo9NuAdbDeRON0gg7GU6p1VDjqT2zgA+8t3dSs3flGnoHfM49gZR0fZd0IY2oHusDSDzjWS
X-Gm-Message-State: AOJu0YyK9s5v9O/KX+R/4QVq6upu0Y2ffEeEeN6D54tjJoGzaUBThlM+
 2Er5lnNDFpXhzCIk66ged46CQCTaQQAxW7z2QQw1daKPT6J3UFaNY0O+P6MtteFhYI6BuTGeWgJ
 rbC49y/YsF64ma8mx2goEppQu1bzlJT/MsiMXSQ==
X-Google-Smtp-Source: AGHT+IF1XZEUzGVo9Lh0nCgnHUnOoZw9jPxqVyDP7B7VGnZfXCG88TKyRuDM5fgTzawr6UswyF/G5ja6h2jVd1fLu5U=
X-Received: by 2002:a05:6402:2032:b0:5a3:a4d7:caf5 with SMTP id
 4fb4d7f45d1cf-5b7f5dc13cemr6532306a12.36.1722825527304; Sun, 04 Aug 2024
 19:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <gq5fcttutomphgfrwrtloqzczia3uc5qpont3lrowocan2xjc5@ubfabhsh3mfl>
 <CA+6=WdQuFYbADjG0i_zWMGYmw95H1U_McqCw4CLW0+Gate50YA@mail.gmail.com>
 <CAA8EJppoj1Y2675UOp=JH=-HLdYuuzfr2Sxy1zzkvLosmrRQNw@mail.gmail.com>
In-Reply-To: <CAA8EJppoj1Y2675UOp=JH=-HLdYuuzfr2Sxy1zzkvLosmrRQNw@mail.gmail.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Mon, 5 Aug 2024 10:38:36 +0800
Message-ID: <CA+6=WdQ6q=Zmji8KxCPYK17pFY4UAUBOykd5Tx4N_RZ1MfgOdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location of
 the 11/29 command
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, 
 jagan@edgeble.ai, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi all

Do you have any other suggestions for this patch?
Looking forward to your reply, thank you

BR

On Tue, Jul 30, 2024 at 4:09=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 29 Jul 2024 at 06:10, zhaoxiong lv
> <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> >
> > On Sun, Jul 28, 2024 at 12:59=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, Jul 25, 2024 at 04:32:44PM GMT, Zhaoxiong Lv wrote:
> > > > Move the 11/29 command from enable() to init() function
> > > >
> > > > As mentioned in the patch:
> > > > https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqi=
n.corp-partner.google.com/
> > > >
> > > > Our DSI host has different modes in prepare() and enable()
> > > > functions. prepare() is in LP mode and enable() is in HS mode.
> > > > Since the 11/29 command must also be sent in LP mode,
> > > > so we also move 11/29 command to the init() function.
> > > >
> > > > After moving the 11/29 command to the init() function,
> > > > we no longer need additional delay judgment, so we delete
> > > > variables "exit_sleep_to_display_on_delay_ms" and
> > > > "display_on_delay_ms".
> > >
> > > Won't this result in a garbage being displayed on the panel during
> > > startup?
> >
> > Hi Dmitry
> >
> > We just moved "Exit sleep mode" and "set display on" from the enable()
> > function to the init() function and did not make any other changes.
> > It seems that many drivers also put the "init code" and "Exit sleep
> > mode" in one function.
>
> You have moved the functions that actually enable the display out. And
> by the definition it's expected that there is no video stream during
> pre_enable(), it gets turned on afterwards. That's why I asked if
> there is any kind of garbage or not.
>
> > In addition, we briefly tested the kingdisplay_kd101ne3 panel and
> > melfas_lmfbx101117480 panel, and it seems that there is no garbage on
> > the panel.
>
> Ack.
>
> >
> > BR
> > >
> > > >
> > > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google=
.com>
> > > > ---
> > > >  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++-----=
----
> > > >  1 file changed, 32 insertions(+), 27 deletions(-)
> > >
>
>
>
> --
> With best wishes
> Dmitry
