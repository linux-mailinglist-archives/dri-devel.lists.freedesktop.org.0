Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C693FECD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 22:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABED610E0E9;
	Mon, 29 Jul 2024 20:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r9M/8OaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE0310E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 20:09:36 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-65f9e25fffaso25909367b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722283775; x=1722888575; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qO5YO3gTMJxRN4DD9FtUSuJI3FyT9bz9kOdIwn73kJI=;
 b=r9M/8OaEYwV+9PXYwfuvxqOSW5BvTNZ0fTKQuqNP4+ZKpYlu8UoDLiM1BN4rL2zduk
 CDfiU9z+qr87DgJ3zjAyHXWAqjriHHuTC0jOoSl4e926zT21RDniX3pdHNxosDiZMiBv
 gjjdZ7AA/xPwrEByWeAt+NpNdZEHjCd0+ygABY1lj6bzefAZioSwtn7YTJKK1wRc6UwO
 4KEqkOr79bzp5wB2Tb0DIh8whxKsBYdoylAYZ16WHQ1SKXFKPkk5qFB1e91Ryj2fdNTA
 pqzBykL8vl724JjWi6ZBhe6L7YKzCHkPnWRrJERKKRx/tAUJYLRWU+Kqm/dPVw7cbqKT
 06JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722283775; x=1722888575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qO5YO3gTMJxRN4DD9FtUSuJI3FyT9bz9kOdIwn73kJI=;
 b=CsWxth6IjdlOE64C8sNCYKIR5CCT7r8FNlk5mfAtS95pMktYSZqT9WNzRHZASKD5uY
 M2GsgMFZXxHqlGU8IzBu8XUkfaB88/GGZ1xGnLMjD7muJRYAtOoUTKb15tqLXmmYdO49
 Od/3dcg5u6eEBgRFR98dxUHBE7rGAqy2ZUjw+sbmrNNA4epiZ8t9wSStgbIk0+RiUyES
 7Bl+4vmh2WlhlhQvPVjR4fiTWuixnsm200A+W8lOvPkVoPwhdbw7LZfEvCMJ7KstN2w2
 q5HZXPbkBTTYASgHVhmw9wh+U5xSJUUHJwjc+AhIz390lE2GCxXbtwtoefD3d9fPjFMW
 ff/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv0TyUfbAYZMpDjdY6NliHNVSTB276l+pX0v1Pa+lAEJuWzoYTbcW6FxeMJh450qeDt+xJrfTBUjHYKLRXVcDP5DiUDw+eOypkqaAn3iZW
X-Gm-Message-State: AOJu0YyMEJZZ0MbpuQmuDcOY6Fyz5OEvcTGxqIyxyEylZLiOqs9dPoCi
 n8fKwjvg/gRl+r7roQou/m2zm2GISH3mMIk+kMLrzoXuI2sm0DahFhKZAZ7LWzfwgC7oCpDFcRN
 cgEnec/s6WHSW1keXdbBgJITQH5P4+VlrGpzg9g==
X-Google-Smtp-Source: AGHT+IHNGA9/9hOvLxvdj7+5y602kFWRi0g00FzF83tJv7u7qWJ8+ORj1d+m/utPMN2nC0Pnz2E1p8NJESCd3fTXz34=
X-Received: by 2002:a0d:e746:0:b0:65f:9873:73e9 with SMTP id
 00721157ae682-67a09593ba6mr101492697b3.33.1722283775155; Mon, 29 Jul 2024
 13:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <gq5fcttutomphgfrwrtloqzczia3uc5qpont3lrowocan2xjc5@ubfabhsh3mfl>
 <CA+6=WdQuFYbADjG0i_zWMGYmw95H1U_McqCw4CLW0+Gate50YA@mail.gmail.com>
In-Reply-To: <CA+6=WdQuFYbADjG0i_zWMGYmw95H1U_McqCw4CLW0+Gate50YA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 23:09:24 +0300
Message-ID: <CAA8EJppoj1Y2675UOp=JH=-HLdYuuzfr2Sxy1zzkvLosmrRQNw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location of
 the 11/29 command
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Mon, 29 Jul 2024 at 06:10, zhaoxiong lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> On Sun, Jul 28, 2024 at 12:59=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, Jul 25, 2024 at 04:32:44PM GMT, Zhaoxiong Lv wrote:
> > > Move the 11/29 command from enable() to init() function
> > >
> > > As mentioned in the patch:
> > > https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.=
corp-partner.google.com/
> > >
> > > Our DSI host has different modes in prepare() and enable()
> > > functions. prepare() is in LP mode and enable() is in HS mode.
> > > Since the 11/29 command must also be sent in LP mode,
> > > so we also move 11/29 command to the init() function.
> > >
> > > After moving the 11/29 command to the init() function,
> > > we no longer need additional delay judgment, so we delete
> > > variables "exit_sleep_to_display_on_delay_ms" and
> > > "display_on_delay_ms".
> >
> > Won't this result in a garbage being displayed on the panel during
> > startup?
>
> Hi Dmitry
>
> We just moved "Exit sleep mode" and "set display on" from the enable()
> function to the init() function and did not make any other changes.
> It seems that many drivers also put the "init code" and "Exit sleep
> mode" in one function.

You have moved the functions that actually enable the display out. And
by the definition it's expected that there is no video stream during
pre_enable(), it gets turned on afterwards. That's why I asked if
there is any kind of garbage or not.

> In addition, we briefly tested the kingdisplay_kd101ne3 panel and
> melfas_lmfbx101117480 panel, and it seems that there is no garbage on
> the panel.

Ack.

>
> BR
> >
> > >
> > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.c=
om>
> > > ---
> > >  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++-------=
--
> > >  1 file changed, 32 insertions(+), 27 deletions(-)
> >



--=20
With best wishes
Dmitry
