Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2D8BFCAA
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 13:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3100B1135FA;
	Wed,  8 May 2024 11:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dS79yHl7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A43D1135FA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 11:52:02 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2b12b52fbe0so2900323a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 04:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715169121; x=1715773921;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYxgECP19KQcIH0PhiMfWn89B9REarDnlrwf/7Dgpy8=;
 b=dS79yHl7Z5Wt38hPwlzJf/RkEmKaIzLMfErYP05ui53YITphJcuUQu9ESuRuF6wUcl
 LipSoNipm9GE4yqR0aFux2hvccTLtoFrH6PbKyDa89ycQPxLSfEw+lX+Ern0TxLOzFtU
 L0aB72IeI7QIEPDPKcC57nUDH05/aNy46M0N/MID5SYcjR3yPXcWx9I+AZceJzNxpsLK
 PwjmWx7EJkPElRgAsXUsznXcQDqHkw+x2yytN+3TMjv4fd696Iv6GSRTvWhsOPJAGTPe
 8eNT4YIteMqQPCpqeVWs6twGEMTt6loT7B47QCppetHDqTlIJV3246EeSFs7tF1QBaa9
 nbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715169121; x=1715773921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYxgECP19KQcIH0PhiMfWn89B9REarDnlrwf/7Dgpy8=;
 b=b8myrHDZjkP4hr711a4+xLjSWaAR8J6fgJa9Mc4lGiNph7TJSEekK2UxT9Y1c3tYcV
 txBgGVv7mUIMNSKKfcE7djcA0/3kZXdduvZvArfzJTdEp4XrZ06uHIUJkOlzkezxK8Cu
 DxnR39Qom64mTWZpMIqv9BhmKZB7xuid+QKmdcr1GJR5yXOWSdxsfgTtKd6/IUt+Ell3
 k5IAW1JIw4FhHLa7FJKEySV/Hum6HZZ6VbBzPUPJrYTpxY2cqzz8D3eQUHVqDaN+9ppJ
 jRbccwkmkeQnQ9RyzFpgXd833rqz6caQt2M84ITz7xr0Pb3XRjSw1KfQ9lp/HWZy5KGs
 Wf3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1rNNrM0ExrXP2aPNM+2uTsRQCQ9pJEJGswfaS23lB0dKAOVcXYZPTGbZ962jhnUAGU3PPuZ+6kZkoh14Ubm1pI1+bbm3BGk5szG8HodSH
X-Gm-Message-State: AOJu0YzV6zn8Ybi5u3/BOxsJxp/NrHgQnF4CLis/6rkNTGMXF72XqoKK
 KT8X9k4iltuHVW0ZSMxnJc9F+nwKMQWpz3CA1MoHpbrgbr+XXpriAVXL5FURAFw41Cu2XcHcAWo
 tGKH4sO81NYSjVg4heQ0vD+t73uvosLdajDyG3g==
X-Google-Smtp-Source: AGHT+IEhdE+GG8XxwKNRlclHRbBSycIrPohs+PTxSK9Z3F9iJMuBG2HZF6XAdrrAJXkCh/xJgPaDBMp9H0/wPUP9epQ=
X-Received: by 2002:a17:90a:d386:b0:2b6:22f0:3b8a with SMTP id
 98e67ed59e1d1-2b622f03bc3mr1840592a91.36.1715169121651; Wed, 08 May 2024
 04:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=Wj5WKcVbNGHQ_BbZa_fsVJkpYb2C8TE8bjhvJvx+N_hw@mail.gmail.com>
In-Reply-To: <CAD=FV=Wj5WKcVbNGHQ_BbZa_fsVJkpYb2C8TE8bjhvJvx+N_hw@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 8 May 2024 19:51:50 +0800
Message-ID: <CAHwB_NKPswAvE5TjRxWMR8LLV5sNuMmymXr4nhDc3r_AdRKr8A@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

Hi,

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=89 07:35=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, May 7, 2024 at 6:53=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > +static int hx83102_enable_extended_cmds(struct hx83102 *ctx, bool enab=
le)
> > +{
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi }=
;
> > +
> > +       if (enable)
> > +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETEXTC,=
 0x83, 0x10, 0x21, 0x55, 0x00);
> > +       else
> > +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETEXTC,=
 0x00, 0x00, 0x00);
> > +
> > +       return 0;
>
> You're throwing away the error codes returned by the
> mipi_dsi_dcs_write_seq_multi(), which you shouldn't do. You have two
> options:
>
> Option #1: return dsi_ctx.accum_err here and then check the return
> value in callers.
>
> Option #2: instead of having this function take "struct hx83102 *ctx",
> just have it take "struct mipi_dsi_multi_context *dsi_ctx". Then it
> can return void and everything will be fine.
>
> I'd prefer option #2 but either is OK w/ me.

Ok,I will fix in V4, thanks.

>
>
> > +static int starry_himax83102_j02_init(struct hx83102 *ctx)
> > +{
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi }=
;
> > +
> > +       hx83102_enable_extended_cmds(ctx, true);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, =
0xb5, 0xb5, 0x31, 0xf1,
> > +                                        0x31, 0xd7, 0x2f, 0x36, 0x36, =
0x36, 0x36, 0x1a, 0x8b, 0x11,
> > +                                        0x65, 0x00, 0x88, 0xfa, 0xff, =
0xff, 0x8f, 0xff, 0x08, 0x74,
> > +                                        0x33);
>
> The indentation is still off here. You have 5 tabs followed by a
> space. To make things line up with the opening brace I think it should
> be 4 tabs followed by 5 spaces.

Sorry, my  editor 'Visual Studio Code' It seems that the correct indentatio=
n
is not recognized. I have checked it through the 'vim' editor in the V4 ver=
sion.
Thanks.

>
>
> > +static int hx83102_enable(struct drm_panel *panel)
> > +{
> > +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > +       struct device *dev =3D &dsi->dev;
> > +       int ret;
> > +
> > +       ret =3D ctx->desc->init(ctx);
> > +       if (ret)
> > +               return ret;
>
> You're still changing behavior here. In the old boe-tv101wum-nl6
> driver the init() function was invoked at the end of prepare(). Now
> you've got it at the beginning of enable(). If this change is
> important it should be in a separate commit and explained.
>
>
> > +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       msleep(120);
> > +
> > +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to turn on the display: %d\n", ret=
);
> > +       }
>
> The old boe-tv101wum-nl6 driver didn't call
> mipi_dsi_dcs_exit_sleep_mode() nor mipi_dsi_dcs_set_display_on() in
> its enable routine, did it? If this change is important please put it
> in a separate change and justify it.

In the old boe-tv101wum-nl6 driver inital cmds was invoked at the end of
prepare() function , and call 0x11 and 0x29 at end of inital. For
himax-hx83102 driver, we move inital cmds invoked at enable() function.
For panel timing, I think there is no much difference. They are
all initial cmds executed after meeting the power-on sequence.
I will update these in the v4 commit message.

>
>
> -Doug
