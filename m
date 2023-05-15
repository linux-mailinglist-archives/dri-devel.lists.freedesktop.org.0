Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4EF7027BD
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 10:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A934010E06B;
	Mon, 15 May 2023 08:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746110E06B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 08:59:41 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-b9e2b65d006so19093263276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684141180; x=1686733180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrOls9NfBDKA5C4+ZyGHxLvVcrluYNYNDcYSeYJTNhU=;
 b=KXs6ENbSvi7v19E7tQM9Iv6vd6P8Bj9kYO7o9K+YYtfH9u/pVM8LC7Y4aR+lFo0eFw
 v04qZt9R6ldj6xNiQHhx6Mkk0lE4A4z2s8ytAc63Upo4QaiQ73VEcAZgP/hgO34jafI7
 idoqHeNDjsRXIlXIT1B7TdX0aGLPVcuocscN1v/xpJ08MR/12zIL4GeLlwWCGJGrC4SZ
 7KJhvdMh3zoai1NJEKQq+V8sp3Q88eOw+q8clNlq/FfEIgsfmHEMZUNoLLT5ab3BUqoC
 PrNXuqj51oC6/gEH0kEecvDww1Z8OHRhBTS/k91zApn6VFzc6AwvvBL0Qt3KMoA/2K9y
 lMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684141180; x=1686733180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrOls9NfBDKA5C4+ZyGHxLvVcrluYNYNDcYSeYJTNhU=;
 b=Iqz4RvBGsDTKaoKeH1ZtiEhcr9uy/Pt033X8OaHOT9u3wlPmujWMPyiDZ6Hs6HcGuy
 TVyNyTel0zcO71Ulpa+EJ/yEgAcLDzKNhF+BdXKgUqICXFa/XQRoUWcazX2CJqKxyTUS
 QpooByZp/CLdIKTHPN6ZVMJUTVdr2v9Ecu/M/g3whFVngtmr9AWZAcdr5x/upnXj6vfh
 GRW2pP9AEROAs1kdnF/OgsYkav44kystyPnkRCgmLqIZ9bUwXTljndSDns8d5pANLAXB
 RXXcO1MTX/ezTcM/7Js6ihsniS7WW1zhXpd+f/u6J0U7jbUQ2Q6w0NwlsP9p7KvX6eYp
 5cRw==
X-Gm-Message-State: AC+VfDzSRqJkgTboGTpEieVuXLncHPBqypVkZWhkdYQI6ZaO5hSXz1In
 23AlUd4/h6Ob1thtUNcvd6s9TgBttU1hb9sOUw/wUw==
X-Google-Smtp-Source: ACHHUZ4V70yiBo6Rt9NYpfZPTPnjuo/6qIMdnwMWDGdi4BZy6lqnOo6rlAsVPn5YxE4WdBCK8jdEWi71AnCI2G0U8aQ=
X-Received: by 2002:a0d:cc4b:0:b0:55a:3420:5adc with SMTP id
 o72-20020a0dcc4b000000b0055a34205adcmr31716349ywd.51.1684141180077; Mon, 15
 May 2023 01:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
 <27ba33a6-2949-a303-14b0-9985b4514e3b@suse.de>
In-Reply-To: <27ba33a6-2949-a303-14b0-9985b4514e3b@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 May 2023 10:59:28 +0200
Message-ID: <CACRpkdbSAc174ejXT9V+kZfRQeiq48J1=kDQvoLvH_tF+qXKtA@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 10:17=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 15.05.23 um 10:01 schrieb Linus Walleij:

> > But the display is flickering like crazy so the updating frequency is
> > totally off, which is because it does not scale down the resolution,
> > the print used to be:
> >
> > Console: switching to colour frame buffer device 80x30
> > drm-clcd-pl111 c1000000.display: [drm] fb0: pl111drmfb frame buffer dev=
ice
> >
> > It is now:
> >
> > Console: switching to colour frame buffer device 100x37
> > drm-clcd-pl111 c1000000.display: [drm] fb0: pl111drmfb frame buffer dev=
ice
> >
> > 100x37! (i.e. 800x296), this display can only do 640x240.
> > Any idea what else is going wrong here? Or is this another regression
> > on top of the first regression ... I was under the impression that
> > your change was only about formats not resolutions.
>
> If your display only supports 640x240, you should filter out all the
> other modes in the driver, if necessary. To me, that seems fix-worthy in
> any case.

I think I found this, the bandwidth limit calculation in
drivers/gpu/drm/pl111/pl111_display.c was using the bpp from
the config and this was decreased from 16 to 15 and as it determined
cpp by dividing bpp/8 this decreased from 2 bytes to 1 byte.

Testing with DIV_ROUND_UP() in combination with the previous
fix!

Yours,
Linus Walleij
