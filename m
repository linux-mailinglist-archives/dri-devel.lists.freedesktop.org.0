Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD5C5B6F0F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF54010E71F;
	Tue, 13 Sep 2022 14:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7E110E71F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 14:07:44 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id k9so6278851ils.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=XnxCLyuVGvYvj4m9HHzokhbV1YBcrM8jYh5PtxOfQss=;
 b=BpNhHjQcbWYASIwmRY6ilG9NRilUx5KRVmMb6cQy2pmFoztxedRe8x6rGCIk1sfI+L
 dVsXWQ/s/osTBXZDYea6CgFahRSeE7YCfQwQvbn4rtmuYIxQCmT71DX2H8sfa20eaxdR
 V5elZENkOVA3BU4xGrtkQ8rOg0HT/MVrAE7xww9eTOhY8tGMY5x0huFcylmT2GogdW4m
 n3nMi9TTM6G+2l/IURtitI5WXTr7TXWEJIcmahjjWQRYM12gE447s2PXOkdh/dni6mDc
 MMiD4WTImAsIIvMXNnWSuxeO8nvO4B/Hk1hzfe+3dEHa6iuYXDncoKD7oJjmHDcPj/mQ
 LtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XnxCLyuVGvYvj4m9HHzokhbV1YBcrM8jYh5PtxOfQss=;
 b=rIr2scg9/e9kja8efytRx0WJgz3xjdOsn3MSsGjvbTqZAFeoIeROvZgPPYjvqyXnuI
 IC4IwAyKBVA+FpyqcbhhtRjCGROtfDd5AsgIK5rUPbc9LOTfPvlIOpPaAzdC8ftWpHx3
 49wwgqAeQrS2Ha5YinOa3gA+RC2BJy7WvGViOJtSHnuA2mkqlS710PjcXI/U1SWyzic/
 obeoBWcu9fILx1bfktcpJZ8tnZDfi/oeTlzUU/SrhYi6CAIcaKEjb1GSey4O2vDpxIZa
 Ni3tI6NRT91EggGX5g5l0E9ClyYfNgvNCyw1IPP9jAcVvQi9/oOR8tFJluizRTnileeg
 T84w==
X-Gm-Message-State: ACgBeo2CiT97s6/CdmdPYEuM7qm7awPUJZVT7Ya4rel3nv1CWJKD/xxe
 wACLpbPegntWjwVPeE4g5qvInjzP+WHEUGB0dAmu4w==
X-Google-Smtp-Source: AA6agR6XpfPQUWkO/odyL5iw39nyAI0+yzCqM9pEUOW0HrsqncVaRR6glKdzg4NQNZmz3XNL3DQ8S6mzR3N5Jp95H2U=
X-Received: by 2002:a05:6e02:20cf:b0:2ef:2a05:3f5e with SMTP id
 15-20020a056e0220cf00b002ef2a053f5emr12429932ilq.80.1663078063929; Tue, 13
 Sep 2022 07:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220908135940.299324-1-jagan@edgeble.ai>
 <20220908135940.299324-4-jagan@edgeble.ai>
 <CACRpkdZHu+_ffZEiJrY=aq2YbJGvTA87UP5xn0NzAketGS0EEw@mail.gmail.com>
In-Reply-To: <CACRpkdZHu+_ffZEiJrY=aq2YbJGvTA87UP5xn0NzAketGS0EEw@mail.gmail.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Tue, 13 Sep 2022 19:37:32 +0530
Message-ID: <CA+VMnFz0w-6O=wt3iuJo1BhQgPZ2XbpX6JdDz6vg_JW9nHTR2A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Tue, 13 Sept 2022 at 19:12, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Sep 8, 2022 at 4:00 PM Jagan Teki <jagan@edgeble.ai> wrote:
>
> > Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
> > dot matrix LCD with 800RGBx1280 dots at maximum.
> >
> > Add support for it.
> >
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
>
> I wrote to Jadard and asked for a datasheet. They didn't even answer,
> how rude.

That is the problem I always had for many years,  so I realized the
panel vendors here can help quite a bit. Try to contact via panel
vendors.

>
> > +#define _INIT_CMD_DCS(...)                                     \
> > +       {                                                       \
> > +               .type   = CMD_TYPE_DCS,                         \
> > +               .data   = (char[]){__VA_ARGS__},                \
> > +               .len    = sizeof((char[]){__VA_ARGS__})         \
> > +       }                                                       \
> > +
> > +#define _INIT_CMD_DELAY(...)                                   \
> > +       {                                                       \
> > +               .type   = CMD_TYPE_DELAY,                       \
> > +               .data   = (char[]){__VA_ARGS__},                \
> > +               .len    = sizeof((char[]){__VA_ARGS__})         \
> > +       }                                                       \
>
> I think the _MACRO namespace (macros starting with underscore)
> is reserved for the compiler.
>
> Just call them something unique if you have to do this, such as
> JD9365_INIT_CMD_DCS()

Make sense, I will correct this.

>
> But I think you should do something more elaborate here, see
> below.
>
> > +static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
> > +       _INIT_CMD_DELAY(10),
> > +
> > +       _INIT_CMD_DCS(0xE0, 0x00),
> > +       _INIT_CMD_DCS(0xE1, 0x93),
> > +       _INIT_CMD_DCS(0xE2, 0x65),
> > +       _INIT_CMD_DCS(0xE3, 0xF8),
> > +       _INIT_CMD_DCS(0x80, 0x03),
> > +       _INIT_CMD_DCS(0xE0, 0x01),
>
> That's what we call a jam table.
> (...)
> > +       _INIT_CMD_DCS(0xE7, 0x0C),
> > +
> > +       _INIT_CMD_DELAY(120),
>
> You introduce _INIT_CMD_DELAY() for a delay just before and
> after the init sequence. Just open code these delays instead.
>
> Then you can drop the .type field from the DCS sequences because
> there is just one type.
>
>
> > +       for (i = 0; i < desc->num_init_cmds; i++) {
> > +               const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
> > +
> > +               switch (cmd->type) {
> > +               case CMD_TYPE_DELAY:
> > +                       msleep(cmd->data[0]);
> > +                       err = 0;
> > +                       break;
> > +               case CMD_TYPE_DCS:
> > +                       err = mipi_dsi_dcs_write(dsi, cmd->data[0],
> > +                                                cmd->len <= 1 ? NULL : &cmd->data[1],
> > +                                                cmd->len - 1);
> > +                       break;
> > +               default:
> > +                       err = -EINVAL;
> > +               }
> > +
> > +               if (err < 0) {
> > +                       DRM_DEV_ERROR(dev, "failed to write CMD#0x%x\n", cmd->data[0]);
> > +                       return err;
> > +               }
> > +       }
>
> So add explicit delays before and after this for-loop.

I understand your point, I did think the same but since this delay is
specific to cz101b4001 init sequence adding it as part of the
cz101b4001 specific sequence makes sense to me instead of adding it on
common code. If there is another panel with a different delay sequence
might affect these delays in common code.

>
> But then you probably see that after that you can simply replace this entire
> for-loop with mipi_dsi_dcs_write_seq() so do that.
>
> Grep in the kernel tree for examples of mipi_dsi_dcs_write_seq().

Look like we don't need to take care of len here, I will try to use this.

Thanks,
Jagan.
