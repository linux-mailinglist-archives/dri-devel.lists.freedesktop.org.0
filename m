Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A58A9A02
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 14:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33DB10FC6E;
	Thu, 18 Apr 2024 12:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FSRMeCEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E060610FC6E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:42:28 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5dca1efad59so557438a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713444148; x=1714048948;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjyiiPiAkv5rvokumWXZAPoXDnVjIrqrUez8UsmrlCg=;
 b=FSRMeCEAYt+6Wkt+sAFDFkYQ7+oolXDrJI+Khil9UoNITeOKkX4mwlllUiwb/eptDN
 RsNpVlIM3HLcWg0o2S3cgNP3x6MDsGoHaCxa8Hd+lYU/DdIsTA9RtgVs9YmszGsi/5ZE
 g2qHHUyjKOPwzvTyJXJ75BEIYQN6KwHx4n6XUXW/C7I8OgN93Z/JR0mgSwX9ypUTsL36
 GxQukfJv2/xlS7sJFyicO/HKZROjkXoZ11z+uV4upJf4YbtB5thAvak9zXkp+l21iC7M
 1px2sjlxNYV8oqr3GsXPube/Tg42kx7czRzxHlPpBuJWdjgFP+sRYuhCOyn1uUXhkmDn
 pmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713444148; x=1714048948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjyiiPiAkv5rvokumWXZAPoXDnVjIrqrUez8UsmrlCg=;
 b=AW2cBLEAftz5z7vnJ/OEmNQvcVYEw2tltDqmHFl1IcaO8hONrQx4UVjlKRxEEkHUdf
 HwJOA+wz17W0DEFETfQ3BMQXK6aWPStZyJCoZC3N+6yiOQbwycJKhtXJ+AAMaEvQ4Rpb
 mVaNDrmR3TwdT0/X9/4D1tteoLnaMzsNFVbF7KuVR+T1NEZEV8gjKSD1OpHGhpMmwgIT
 5Owi/DAyUCgXv4V/IpAvFldg8JEbiD4EBe59BwmiBUDyb9ogtBBNoTrU0sJONeXUIdDL
 a2f7lsj1o2ORJ77awJBFf6ADdq88I5YssMnzv/aG5inpuiehS7Z9aWSbRY7uwRVaQSqR
 iBhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/8QF5QQt1oTG3JX3Gr0kAvr/K53FFBoXPGDdKTc7kI/oWqPk7NqOKzYzk5IXinGcSxcJF7zv4BcL1IHL5SHEPCm1ae0wsZ2obsoAaQnm9
X-Gm-Message-State: AOJu0YwHHpHJx8UouyK6k9ulkM4MFVFwmuYoCJ82aJfjjBWVzyiVx0DR
 9udinoYF16EBi98dc/DvFe/njU9i0w6psmMFeS8fLULTp54GMpu5XWKMayyMH1nNgPcHOyFqgqX
 6feetOZeBBTV11bOr3QVHOBuUd5Zx/jE1604bVw==
X-Google-Smtp-Source: AGHT+IGClan6tr/ZL8MpS3S+9edq0bfrX40+Ta50u8JXc/vWo4bwg6v1YQDugB6MdCv6t4uzZZbEPhLLGpZg0tpzxpw=
X-Received: by 2002:a05:6a20:9152:b0:1aa:5ca9:c565 with SMTP id
 x18-20020a056a20915200b001aa5ca9c565mr3213189pzc.8.1713444147965; Thu, 18 Apr
 2024 05:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
 <20240410071439.2152588-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
 <CACRpkdYtM=5jdQddCqRFgBRXvcJEjk1ULJNKKFz7jhhkGxV59Q@mail.gmail.com>
In-Reply-To: <CACRpkdYtM=5jdQddCqRFgBRXvcJEjk1ULJNKKFz7jhhkGxV59Q@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 18 Apr 2024 20:42:16 +0800
Message-ID: <CAHwB_NLfaQWhFSbZ2ASmYgXJaVOTrjac3F0hyCJdwTTo-zHJrQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] drm/panel: boe-tv101wum-nl6: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, sam@ravnborg.org,
 neil.armstrong@linaro.org, 
 daniel@ffwll.ch, airlied@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

Hi,

Linus Walleij <linus.walleij@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8811=
=E6=97=A5=E5=91=A8=E5=9B=9B 16:25=E5=86=99=E9=81=93=EF=BC=9A

>
> On Thu, Apr 11, 2024 at 9:40=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> > On Wed, Apr 10, 2024 at 12:15=E2=80=AFAM Cong Yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in ni=
cely
> > > with the existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
> > > compatible with panel specific config.
> >
> > I guess we have the same question we've had with this driver in the
> > past: do we add more tables here, or do we break this out into a
> > separate driver like we ended up doing with "ili9882t". I guess the
> > question is: what is the display controller used with this panel and
> > is it the same (or nearly the same) display controller as other panels
> > in this driver or is it a completely different display controller.
> > Maybe you could provide this information in the commit message to help
> > reviewers understand.
>
> I think at a minimum we need to split out any identifiable display contro=
llers
> to their own drivers.
>
> Then what developers see is that the code sequence is very similar
> between two completely different display controllers so they have this
> urge to shoehorn several displays into the same driver for this
> reason.
>
> The latter is not good code reuse, what we need to do here is to split
> out a sequencing library, like if we had
> drivers/gpu/drm/panel/cmd-seqence-lib.c|.h with a bool Kconfig and
> some helpful symbols to do the same seqences in different drivers,
> so the same order can be obtained in different display controller
> drivers that would be great.
>
> I'm thinking something along the line of
>
> panel_seq_exit_sleep_mode(unsigned int delay_after_exit_sleep,
>     u8 *cmd_seq_after_exit_sleep,
>     unsigned int delay_after_cmd_seq,
>     unsigned int delay_after_set_display_on);
>
> That will call mipi_dsi_dcs_exit_sleep_mode(), delay, send
> command sequence, delay, call mipi_dsi_dcs_set_display_on()
> and delay where any delay can be 0.
>
> This achieves the same goal without messing up the whole place,
> but requires some tinkering with how to pass a sequence the right
> way etc.
>
> Are Google & partners interested in the job? ;)
>
> Yours,
> Linus Walleij

I learned from himax that even if the same controller is used with
different glasses, the corresponding parameters are not fixed.

For example: _INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),

even in the group initial code, the same register will be loaded with
parameters twice.

 example is the same=E2=80=9C0xB4=E2=80=9D , but the specific implementatio=
n functions
are also different.
_INIT_DCS_CMD(0xB4, 0x35, 0x35, 0x43, 0x43, 0x35, 0x35, 0x30, 0x7A,
0x30, 0x7A, 0x01, 0x9D),
. . .
. . .
_INIT_DCS_CMD(0xB4, 0x03, 0xFF, 0xF8),

So assuming that the registers of the two screens is the same now,
it cannot be set as a common parameter.
Otherwise, it may be a bit troublesome for the maintainers.

If necessary, I can break out starry_himax83102_j02, boe_nv110wum and
ivo_t109nw41
as separate driver. Then add some define to these registers.

#define HX83102_SETPOWER 0xb1
#define HX83102_SETDISP 0xb2
#define HX83102_SETCYC 0xb4
#define HX83102_SETEXTC 0xb9
#define HX83102_SETMIPI 0xba
#define HX83102_SETVDC 0xbc
#define HX83102_SETBANK 0xbd
#define HX83102_SETPTBA 0xbf
#define HX83102_SETSTBA 0xc0
#define HX83102_SETTCON 0xc7
#define HX83102_SETRAMDMY 0xc8
#define HX83102_SETPWM 0xc9
#define HX83102_SETCLOCK 0xcb
#define HX83102_SETPANEL 0xcc
#define HX83102_SETCASCADE 0xd0
#define HX83102_SETPCTRL 0xd1
#define HX83102_SETGIP0 0xd3
#define HX83102_SETGIP1 0xd5
#define HX83102_SETGIP3 0xd8
#define HX83102_SETTP1 0xe7
#define HX83102_SETSPCCMD 0xe9

Thanks=EF=BC=81
