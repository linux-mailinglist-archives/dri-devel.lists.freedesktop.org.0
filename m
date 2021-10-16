Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACDC430117
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 10:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165496E418;
	Sat, 16 Oct 2021 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E5C6E418
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 08:14:33 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q5so10758599pgr.7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJ2xlYjUiYIk0/YtLMqQP7KRbQ2kgRLUIv7FLyCwRvw=;
 b=TJiLul498X/Ayfk77/XOFGQsq/BumDacbMGF2X0LcllKrFd2NEmDNRqMlgm8QaAwJp
 PL9SONw2iYFxUqOIMPyiJYHDOYBwtsdVJ/k21fiqLPqTgOGEEfMZXjFyH93Qs6DGIQlY
 Em8UvTgtnbiDel/OU0ci/fDsPENUjaHWThcMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJ2xlYjUiYIk0/YtLMqQP7KRbQ2kgRLUIv7FLyCwRvw=;
 b=G9iKMpL/W6B0hrJKUecKz6gc9jRXflRl0WxvPAJWWJOa6SGgggrZaJfUPRZuDCHGly
 jq5id+AoC9BI+IO+iLL1c0YD3Hz4dzJ1j7AUTJyx/6tMv8r9b+IP2pRjVmo4TLPHcsvb
 k3M7CEp2T73a4U9aMiR4sYAxkvKzO+jMJ5yZEojoHv+kgZT7+0Cxb7tb0eTK4rq2fdi6
 BJ7gi8htJiETBzxFyoVfaBqDnQr6cigyNmXlnAx7cvTVu6NBHOcFJTM7dpDKMlU9rvpW
 XLc4iFcKyw59wG7+GRf+nReDjMxLpDrHGbLF89xV4Jtr9Unf7Wl2ZOo9jg8qd9AqLm6H
 WkSQ==
X-Gm-Message-State: AOAM530aYw4RmrEOVm9Q7sxfw8J58IdPQFmP55yYL9yyFYCpZVZadzgI
 hHK33ETY38qdOTUAebSyDuLKuQa5ULxJ+UW9kZG3s5fLZzYv+g==
X-Google-Smtp-Source: ABdhPJyT7NXktZgehNhUe2kb+t16Fd2YH5CFLkBIxY+A2RXAjU8R8CBEKAat/yAhDlcbPwHBzG7xDUkcxCi6BeSSUiI=
X-Received: by 2002:a63:7405:: with SMTP id p5mr12835319pgc.426.1634372072964; 
 Sat, 16 Oct 2021 01:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211014201705.218608-1-michael@amarulasolutions.com>
 <YWnTTjkfjOq7K6MM@ravnborg.org>
In-Reply-To: <YWnTTjkfjOq7K6MM@ravnborg.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 16 Oct 2021 10:14:21 +0200
Message-ID: <CAOf5uwn6jv_J3BMDyqUzh=7wc8oSJrGC7nv8WtnOR91cdhJ2Vg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panel: ilitek-ili9881d: add support for
 Wanchanglong W552946ABA panel
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, Oct 15, 2021 at 9:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Michael,
>
> > Add this panel's initialzation sequence and timing to ILI9881D driver.
> > Tested on px30-evb v11
> Patch looks good, but we need the vendor and the compatible documented.
>
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 238 +++++++++++++++++-
> >  1 file changed, 237 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > index 0145129d7c66..cf53b43e0907 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > @@ -42,6 +42,7 @@ struct ili9881c_desc {
> >       const struct ili9881c_instr *init;
> >       const size_t init_length;
> >       const struct drm_display_mode *mode;
> > +     const unsigned long mode_flags;
> >  };
> >
> >  struct ili9881c {
> > @@ -453,6 +454,213 @@ static const struct ili9881c_instr k101_im2byl02_init[] = {
> >       ILI9881C_COMMAND_INSTR(0xD3, 0x3F), /* VN0 */
> >  };
> >
>
> If you by any chance could comment a little on what goes on that would
> be nice.
> > +static const struct ili9881c_instr w552946ab_init[] = {
> > +     ILI9881C_SWITCH_PAGE_INSTR(3),
> > +     ILI9881C_COMMAND_INSTR(0x01, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x02, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x03, 0x53),
> > +     ILI9881C_COMMAND_INSTR(0x04, 0x53),
> > +     ILI9881C_COMMAND_INSTR(0x05, 0x13),
> > +     ILI9881C_COMMAND_INSTR(0x06, 0x04),
> > +     ILI9881C_COMMAND_INSTR(0x07, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x08, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x09, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x0A, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x0B, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x0C, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x0D, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x0E, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x0F, 0x00),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x10, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x11, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x12, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x13, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x14, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x15, 0x08),
> > +     ILI9881C_COMMAND_INSTR(0x16, 0x10),
> > +     ILI9881C_COMMAND_INSTR(0x17, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x18, 0x08),
> > +     ILI9881C_COMMAND_INSTR(0x19, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x1A, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x1B, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x1C, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x1D, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x1E, 0xC0),
> > +     ILI9881C_COMMAND_INSTR(0x1F, 0x80),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x20, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x21, 0x09),
> > +     ILI9881C_COMMAND_INSTR(0x22, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x23, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x24, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x25, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x26, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x27, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x28, 0x55),
> > +     ILI9881C_COMMAND_INSTR(0x29, 0x03),
> > +     ILI9881C_COMMAND_INSTR(0x2A, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x2B, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x2C, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x2D, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x2E, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x2F, 0x00),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x30, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x31, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x32, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x33, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x34, 0x04),
> > +     ILI9881C_COMMAND_INSTR(0x35, 0x05),
> > +     ILI9881C_COMMAND_INSTR(0x36, 0x05),
> > +     ILI9881C_COMMAND_INSTR(0x37, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x38, 0x3C),
> > +     ILI9881C_COMMAND_INSTR(0x39, 0x35),
> > +     ILI9881C_COMMAND_INSTR(0x3A, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x3B, 0x40),
> > +     ILI9881C_COMMAND_INSTR(0x3C, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x3D, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x3E, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x3F, 0x00),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x40, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x41, 0x88),
> > +     ILI9881C_COMMAND_INSTR(0x42, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x43, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x44, 0x1F),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x50, 0x01),
> > +     ILI9881C_COMMAND_INSTR(0x51, 0x23),
> > +     ILI9881C_COMMAND_INSTR(0x52, 0x45),
> > +     ILI9881C_COMMAND_INSTR(0x53, 0x67),
> > +     ILI9881C_COMMAND_INSTR(0x54, 0x89),
> > +     ILI9881C_COMMAND_INSTR(0x55, 0xaB),
> > +     ILI9881C_COMMAND_INSTR(0x56, 0x01),
> > +     ILI9881C_COMMAND_INSTR(0x57, 0x23),
> > +     ILI9881C_COMMAND_INSTR(0x58, 0x45),
> > +     ILI9881C_COMMAND_INSTR(0x59, 0x67),
> > +     ILI9881C_COMMAND_INSTR(0x5A, 0x89),
> > +     ILI9881C_COMMAND_INSTR(0x5B, 0xAB),
> > +     ILI9881C_COMMAND_INSTR(0x5C, 0xCD),
> > +     ILI9881C_COMMAND_INSTR(0x5D, 0xEF),
> > +     ILI9881C_COMMAND_INSTR(0x5E, 0x03),
> > +     ILI9881C_COMMAND_INSTR(0x5F, 0x14),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x60, 0x15),
> > +     ILI9881C_COMMAND_INSTR(0x61, 0x0C),
> > +     ILI9881C_COMMAND_INSTR(0x62, 0x0D),
> > +     ILI9881C_COMMAND_INSTR(0x63, 0x0E),
> > +     ILI9881C_COMMAND_INSTR(0x64, 0x0F),
> > +     ILI9881C_COMMAND_INSTR(0x65, 0x10),
> > +     ILI9881C_COMMAND_INSTR(0x66, 0x11),
> > +     ILI9881C_COMMAND_INSTR(0x67, 0x08),
> > +     ILI9881C_COMMAND_INSTR(0x68, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x69, 0x0A),
> > +     ILI9881C_COMMAND_INSTR(0x6A, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x6B, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x6C, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x6D, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x6E, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x6F, 0x02),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x70, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x71, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x72, 0x06),
> > +     ILI9881C_COMMAND_INSTR(0x73, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x74, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x75, 0x14),
> > +     ILI9881C_COMMAND_INSTR(0x76, 0x15),
> > +     ILI9881C_COMMAND_INSTR(0x77, 0x0F),
> > +     ILI9881C_COMMAND_INSTR(0x78, 0x0E),
> > +     ILI9881C_COMMAND_INSTR(0x79, 0x0D),
> > +     ILI9881C_COMMAND_INSTR(0x7A, 0x0C),
> > +     ILI9881C_COMMAND_INSTR(0x7B, 0x11),
> > +     ILI9881C_COMMAND_INSTR(0x7C, 0x10),
> > +     ILI9881C_COMMAND_INSTR(0x7D, 0x06),
> > +     ILI9881C_COMMAND_INSTR(0x7E, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x7F, 0x0A),
> > +
> > +     ILI9881C_COMMAND_INSTR(0x80, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x81, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x82, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x83, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x84, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x85, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x86, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x87, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x88, 0x08),
> > +     ILI9881C_COMMAND_INSTR(0x89, 0x02),
> > +     ILI9881C_COMMAND_INSTR(0x8A, 0x02),
> > +
> > +     ILI9881C_SWITCH_PAGE_INSTR(4),
> > +     ILI9881C_COMMAND_INSTR(0x00, 0x80),
> > +     ILI9881C_COMMAND_INSTR(0x70, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x71, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x66, 0xFE),
> > +     ILI9881C_COMMAND_INSTR(0x82, 0x15),
> > +     ILI9881C_COMMAND_INSTR(0x84, 0x15),
> > +     ILI9881C_COMMAND_INSTR(0x85, 0x15),
> > +     ILI9881C_COMMAND_INSTR(0x3a, 0x24),
> > +     ILI9881C_COMMAND_INSTR(0x32, 0xAC),
> > +     ILI9881C_COMMAND_INSTR(0x8C, 0x80),
> > +     ILI9881C_COMMAND_INSTR(0x3C, 0xF5),
> > +     ILI9881C_COMMAND_INSTR(0x88, 0x33),
> > +
> > +     ILI9881C_SWITCH_PAGE_INSTR(1),
> > +     ILI9881C_COMMAND_INSTR(0x22, 0x0A),
> > +     ILI9881C_COMMAND_INSTR(0x31, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x53, 0x78),
> > +     ILI9881C_COMMAND_INSTR(0x50, 0x5B),
> > +     ILI9881C_COMMAND_INSTR(0x51, 0x5B),
> > +     ILI9881C_COMMAND_INSTR(0x60, 0x20),
> > +     ILI9881C_COMMAND_INSTR(0x61, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0x62, 0x0D),
> > +     ILI9881C_COMMAND_INSTR(0x63, 0x00),
> > +
> > +     ILI9881C_COMMAND_INSTR(0xA0, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0xA1, 0x10),
> > +     ILI9881C_COMMAND_INSTR(0xA2, 0x1C),
> > +     ILI9881C_COMMAND_INSTR(0xA3, 0x13),
> > +     ILI9881C_COMMAND_INSTR(0xA4, 0x15),
> > +     ILI9881C_COMMAND_INSTR(0xA5, 0x26),
> > +     ILI9881C_COMMAND_INSTR(0xA6, 0x1A),
> > +     ILI9881C_COMMAND_INSTR(0xA7, 0x1D),
> > +     ILI9881C_COMMAND_INSTR(0xA8, 0x67),
> > +     ILI9881C_COMMAND_INSTR(0xA9, 0x1C),
> > +     ILI9881C_COMMAND_INSTR(0xAA, 0x29),
> > +     ILI9881C_COMMAND_INSTR(0xAB, 0x5B),
> > +     ILI9881C_COMMAND_INSTR(0xAC, 0x26),
> > +     ILI9881C_COMMAND_INSTR(0xAD, 0x28),
> > +     ILI9881C_COMMAND_INSTR(0xAE, 0x5C),
> > +     ILI9881C_COMMAND_INSTR(0xAF, 0x30),
> > +     ILI9881C_COMMAND_INSTR(0xB0, 0x31),
> > +     ILI9881C_COMMAND_INSTR(0xB1, 0x2E),
> > +     ILI9881C_COMMAND_INSTR(0xB2, 0x32),
> > +     ILI9881C_COMMAND_INSTR(0xB3, 0x00),
> > +
> > +     ILI9881C_COMMAND_INSTR(0xC0, 0x00),
> > +     ILI9881C_COMMAND_INSTR(0xC1, 0x10),
> > +     ILI9881C_COMMAND_INSTR(0xC2, 0x1C),
> > +     ILI9881C_COMMAND_INSTR(0xC3, 0x13),
> > +     ILI9881C_COMMAND_INSTR(0xC4, 0x15),
> > +     ILI9881C_COMMAND_INSTR(0xC5, 0x26),
> > +     ILI9881C_COMMAND_INSTR(0xC6, 0x1A),
> > +     ILI9881C_COMMAND_INSTR(0xC7, 0x1D),
> > +     ILI9881C_COMMAND_INSTR(0xC8, 0x67),
> > +     ILI9881C_COMMAND_INSTR(0xC9, 0x1C),
> > +     ILI9881C_COMMAND_INSTR(0xCA, 0x29),
> > +     ILI9881C_COMMAND_INSTR(0xCB, 0x5B),
> > +     ILI9881C_COMMAND_INSTR(0xCC, 0x26),
> > +     ILI9881C_COMMAND_INSTR(0xCD, 0x28),
> > +     ILI9881C_COMMAND_INSTR(0xCE, 0x5C),
> > +     ILI9881C_COMMAND_INSTR(0xCF, 0x30),
> > +     ILI9881C_COMMAND_INSTR(0xD0, 0x31),
> > +     ILI9881C_COMMAND_INSTR(0xD1, 0x2E),
> > +     ILI9881C_COMMAND_INSTR(0xD2, 0x32),
> > +     ILI9881C_COMMAND_INSTR(0xD3, 0x00),
> > +     ILI9881C_SWITCH_PAGE_INSTR(0),
> > +};
> > +
> >  static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
> >  {
> >       return container_of(panel, struct ili9881c, panel);
> > @@ -603,6 +811,23 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
> >       .height_mm      = 217,
> >  };
> >
> > +static const struct drm_display_mode w552946aba_default_mode = {
> > +     .clock          = 64000,
> > +
> > +     .hdisplay       = 720,
> > +     .hsync_start    = 720 + 40,
> > +     .hsync_end      = 720 + 40 + 10,
> > +     .htotal         = 720 + 40 + 10 + 40,
> > +
> > +     .vdisplay       = 1280,
> > +     .vsync_start    = 1280 + 22,
> > +     .vsync_end      = 1280 + 22 + 4,
> > +     .vtotal         = 1280 + 22 + 4 + 11,
> > +
> > +     .width_mm       = 68,
> > +     .height_mm      = 121,
> > +};
> > +
> >  static int ili9881c_get_modes(struct drm_panel *panel,
> >                             struct drm_connector *connector)
> >  {
> > @@ -670,7 +895,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
> >
> >       drm_panel_add(&ctx->panel);
> >
> > -     dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> > +     dsi->mode_flags = ctx->desc->mode_flags;
> >       dsi->format = MIPI_DSI_FMT_RGB888;
> >       dsi->lanes = 4;
> >
> > @@ -691,17 +916,28 @@ static const struct ili9881c_desc lhr050h41_desc = {
> >       .init = lhr050h41_init,
> >       .init_length = ARRAY_SIZE(lhr050h41_init),
> >       .mode = &lhr050h41_default_mode,
> > +     .mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> >  };
> >
> >  static const struct ili9881c_desc k101_im2byl02_desc = {
> >       .init = k101_im2byl02_init,
> >       .init_length = ARRAY_SIZE(k101_im2byl02_init),
> >       .mode = &k101_im2byl02_default_mode,
> > +     .mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> > +};
> > +
> > +static const struct ili9881c_desc w552946aba_desc = {
> > +     .init = w552946ab_init,
> > +     .init_length = ARRAY_SIZE(w552946ab_init),
> > +     .mode = &w552946aba_default_mode,
> > +     .mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +                   MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET,

I need to adjust this flag. I will rebase on drm-fixes
> >  };
> >
> >  static const struct of_device_id ili9881c_of_match[] = {
> >       { .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
> >       { .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
> > +     { .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
>
> wanchanglong - must be included in Documentation/devicetree/bindings/vendor-prefixes.yaml
>

Ok

> w552946aba must be documented in a panel DT schema.
> I assume adding it to Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> will do the trick.

Ok

Michael
>
>         Sam



-- 
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
