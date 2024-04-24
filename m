Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622878AFE93
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AA710F7FF;
	Wed, 24 Apr 2024 02:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Zys8h4/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCD910F7FF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:42:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6ed04c91c46so6191037b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713926561; x=1714531361;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkCqwJWiEAX3FMBfwqJeI3Xr8P946IFkiTczMxqGyo8=;
 b=Zys8h4/emMK/EGc6lYmM24BFsa89yRihJ9a+aaPPQiDhH66y+/63rn0dUoV7W5Xdrv
 c9q+fprh+6mDkBwRrDcfdRyxTF9kYEAVxOQeAuI3oXdCLhqog2S4GGQV+Y1kN3AZK3rQ
 DEJW5sJAXBQnrT8A6Zx5GSznf228Kw5SKu82u1710iS7Mtz7eS43P8empz3Qazq286S+
 cthIRUEGBHqk9w10tSG7FOxZ+gDOCpx9mawWxOJZSiwAX+KhaeoGAfct9XQGi7ZYWC5l
 20uws4lkd4465lMTExFUCYX2yUALMmx0eoNigzqbgMjyCWx/IleESe2SaVBPYAODJcq0
 AW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713926561; x=1714531361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkCqwJWiEAX3FMBfwqJeI3Xr8P946IFkiTczMxqGyo8=;
 b=oih3pCPac87iHgQEEzsy7uFxi+8AZst+dsB42LuOfbZxJZhzSUaDCpF1HB0NAEgJ2t
 8YFDwe8flXBACYGXnPBV3w0aLou328etBuXyRYx+Uma3pD2dDOj0pd2qgFvUxBz2G/k3
 4Edm1FbxCMcaEFZffszNT0q7rDtgyjCq13VQhPiT72skqH7BYrCmGP0/CTqMKHgP3rCB
 UKAamkcrGA70wX1S6z5kShU7cqUCjMA9B3dOohWNN7WFYAIpm17LlH+eYURBoND9lLOA
 wZkh+CRZ6ROPcIv52gq2Etnb6gG4hKil8st5J8rFTXw8k3FgzoYqe1Y6mLdne2pUUMny
 1sRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVIyaaEXAc/BstBvvnNlskFwcVuWOfqNrHKhfT2Zsaoj4m7BK5g+0L2Jq9u5tNDsLg149BsRaXM1Gq5PJH/gs/TeEw9H3bLUhZYjvgOYPw
X-Gm-Message-State: AOJu0YxsAaJNsIXjt4QnwVepkp6JXSjHxXj6UxFIwjvmXYnJKfDqng6x
 w6BVCxZ2d6Dr9rNn+ARxihHNDCm7q4cTwt4vGABk4uiK+N3VW14T5C1dBQYhJvqTAbEh8Bi8TZR
 JRhiLjrxdGK9D+HCsms0CKDAR75NIJcdwvJL6aQ==
X-Google-Smtp-Source: AGHT+IH74nDoNFa5iMmMPDu728jHFY35gEg93BIU8/H41pE+RucmGd0/FeAbAgJ2TnX1eL0r7OPIO7IFrAnwd6lXrv8=
X-Received: by 2002:a05:6a20:2590:b0:1a3:aed1:4d50 with SMTP id
 k16-20020a056a20259000b001a3aed14d50mr1311331pzd.31.1713926561232; Tue, 23
 Apr 2024 19:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2mDB+NZug@mail.gmail.com>
 <CAHwB_NJsDsTc=gjP8TJ+6ipo10uMYFLmuf+tKGVgxnznhuAcUQ@mail.gmail.com>
 <CAD=FV=UGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg8_97YPEQCA@mail.gmail.com>
In-Reply-To: <CAD=FV=UGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg8_97YPEQCA@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 24 Apr 2024 10:42:29 +0800
Message-ID: <CAHwB_N+e4E8uZe3YpfNyemPyW-Rj1RLR5kKA3SDiBygOPYrmVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/panel: himax-hx83102: Break out as separate
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
 Thanks reply.

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=B8=89 00:26=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, Apr 23, 2024 at 2:37=E2=80=AFAM cong yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > > > +static int starry_init_cmd(struct hx83102 *ctx)
> > > > +{
> > > > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > > > +
> > > > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x=
21, 0x55, 0x00);
> > > > +
> > > > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2C, 0xB5, 0=
xB5, 0x31, 0xF1, 0x31, 0xD7, 0x2F,
> > > > +                                                 0x36, 0x36, 0x36,=
 0x36, 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF,
> > > > +                                                 0xFF, 0x8F, 0xFF,=
 0x08, 0x74, 0x33);
> > >
> > > I know this is a sticking point between Linus W. and me, but I'm
> > > really not a fan of all the hardcoded function calls since it bloats
> > > the code so much. I think we need to stick with something more table
> > > based at least for the majority of the commands. If I understand
> > > correctly, Linus was OK w/ something table based as long as it was in
> > > common code [1]. I think he also wanted the "delay" out of the table,
> > > but since those always seem to be at the beginning or the end it seem=
s
> > > like we could still have the majority of the code as table based. Do
> > > you want to make an attempt at that? If not I can try to find some
> > > time to write up a patch in the next week or so.
> >
> > Do you mean not add "delay" in the table?  However, the delay
> > required by each panel may be different. How should this be handled?
>
> In the case of the "himax-hx83102" driver, it looks as if all the
> delays are at the beginning or end of the init sequence. That means
> you could just make those extra parameters that are set per-panel and
> you're back to having a simple sequence without delays.

Do you mean add msleep  in hx83102_enable()?

@@ -612,12 +604,15 @@ static int hx83102_enable(struct drm_panel *panel)
        struct device *dev =3D &dsi->dev;
        int ret;

+       msleep(60);
        ret =3D ctx->desc->init_cmds(ctx);
        if (ret) {
                dev_err(dev, "Panel init cmds failed: %d\n", ret);
                return ret;
        }

+       msleep(60);
+
        ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);

>
> If you had panels that needed delays in a more complicated way, you
> could keep the per-panel functions but just make the bulk of the
> function calls apply a sequence. For instance:
>
> static int my_panel_init_cmd(...)
> {
>   ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, my_panel_init_cmd_seq);
>   if (ret)
>     return ret;
>   mdelay(100);
>   ret =3D mipi_dsi_dcs_write(dsi, ...);
>   if (ret)
>     return ret;
>   mdelay(50);
>   ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, ...);
>   if (ret)
>     return ret;
> }
>
> The vast majority of the work is still table driven so it doesn't
> bloat the code, but you don't have the "delay" in the command sequence
> since Linus didn't like it. I think something like the above would
> make Linus happy and I'd be OK w/ it as well. Ideally you should still
> make your command sequence as easy to understand as possible, kind of
> like how we did with _INIT_SWITCH_PAGE_CMD() in
> "panel-ilitek-ili9882t.c"
>
> As part of this, you'd have to add a patch to create
> mipi_dsi_dcs_write_cmd_seq(), but hopefully that shouldn't be too
> complicated?
>
>
> > It would be great if you could help provide a patch. Thank you so much.
>
> Sure, I can, though maybe you want to give it a shot with the above descr=
iption?

Sorry, I still don't seem to understand. How to encapsulate the parameters =
of
"HX83102_SETDISP, HX83102_SETCYC,....."? Different parameters for each pane=
l.
I have sent my V3 but it does not contain the patch you want.


>
> -Doug
