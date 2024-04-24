Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDFF8B1673
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 00:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FA3113E70;
	Wed, 24 Apr 2024 22:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FrT3h3X+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B606113E6F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 22:51:05 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so432633276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713999064; x=1714603864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLM/Gzp3LttpkW6eOimYma73Nk3MMLdnbj7i6AMnYdM=;
 b=FrT3h3X+2YluopfwF/DC24UhrBppILH0jIehy8UsGG/v912Mg/1mU5AJsFg8MK2ilo
 8qVwJQ0mK8QOP9skeNSVsUIiEiQ8MU8zNB3Jkr8zmCvJimB8Bj8G8iVSjPRDQkr6/5sf
 SnVUtgg3zSQHR99ZjL+gshSq1UCVE3MIDig+3IPAO2LytgWunvg/YMsAqavS2m+FnRqO
 37zli77fZb52+Rg8QjwWotzD/sbMt5tf1DcHDR0XOMVtwc8KqZRqpg6Y1G9V+lL/z2Zd
 NpomBtSkjBbaQWBNyV5zlihHnAAxkIOEUgkKd+jgfc9FzK8YkD/L1TqQBFgQ1Oil042B
 SfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713999064; x=1714603864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLM/Gzp3LttpkW6eOimYma73Nk3MMLdnbj7i6AMnYdM=;
 b=F2gFgqEpJETHrmZB9vafAyoE/MtHK32hvHzJAvwqioiGjSCQyOfxYWc/XTsenwdBKU
 EsmpOF3Ns+gggoHCUomD4yQucM8zjMXFFb0tc594iwLVWLvQKNVuE9W5792i1ldoRk3E
 O1Y2J0qNCV7Azavx6I7TMKTJ6X6ZzjCPG8IRSvbd1WMgAV4VKGBowZ3US6zM5jXVHecm
 hVEJAapa+lTxSUUFtkuIQAtPBVLe5CP75GrGg8JpdtMH08h8YLO70a1TDbTWuW6x/DIP
 1FEoPHCPgfaq/ricbCCQ9zulIA75U/L3+7NrM/ITAiBfLPi+0Dg+1P68YjTp3dj8yheA
 4TYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIUxVlBat5l7HYJfBHSPeDXkrizdsCppHUYKOROj9u01XnZHtZbEhacHDm6+RI+CoOrYDEegGow2nsMD+vh1O0wAvrRC1XJyjLFhpggVV/
X-Gm-Message-State: AOJu0Yyx7fyAVT+bohTjhuHuSFGGymTrlHZcn8czwMma26nUaL4R53c5
 VkTt4Wqe5PV2vpUwydL4XYFpUBfT5qFwMJbiwcUMg2NnABkcScSwekacb34ge1ckpOsoSuG4G++
 6cq6q0yaOF0VwHyOKdOkhJmQ9x7Z+EW8UiZYjdw==
X-Google-Smtp-Source: AGHT+IGiX/LOl5CjzBrqEzFnH8RKtGfmEb83wb3BnKjqyTxL+6W4MeCexMwQDpNg/EZ4gLdw0prFXxeZA5XWL/LuoRw=
X-Received: by 2002:a25:a509:0:b0:dca:59a7:896b with SMTP id
 h9-20020a25a509000000b00dca59a7896bmr4173378ybi.50.1713999063835; Wed, 24 Apr
 2024 15:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
 <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
 <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
 <CACb=7PVTvV9nsFu1ZAXu7YTjSOAGZka+c__EJq3J3qgSJGEShw@mail.gmail.com>
 <CAD=FV=VYAzqsGEBJai9b9n+HxHiG59L1vF73AEWcTwLS_ryjWw@mail.gmail.com>
 <an2k3vgynq4as2sd5dy6ccmdiqedmo7qjsab5qyfhesd333i2a@235sqph3bze5>
 <CAD=FV=VQ8rbwKk4WpHRER9p4cZp7UrrHRpgnErqbQxyxp4sg5w@mail.gmail.com>
 <CAA8EJprv3qBd1hfdWHrfhY=S0w2O70dZnYb6TVsS6AGRPxsYdw@mail.gmail.com>
 <CACb=7PVEpCFWf_aysRkeR0yWAXR5sTaXhNbi3TV3ffKj866+EQ@mail.gmail.com>
In-Reply-To: <CACb=7PVEpCFWf_aysRkeR0yWAXR5sTaXhNbi3TV3ffKj866+EQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 01:50:52 +0300
Message-ID: <CAA8EJprLvEt_pt4XzACQG7pU8KYagKbQ71xwtRF9KrLygTT3ow@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
To: Hsin-Yi Wang <hsinyi@google.com>
Cc: Doug Anderson <dianders@google.com>, 
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>, mripard@kernel.org, 
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 cong yang <yangcong5@huaqin.corp-partner.google.com>
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

On Thu, 25 Apr 2024 at 01:15, Hsin-Yi Wang <hsinyi@google.com> wrote:
>
> On Wed, Apr 24, 2024 at 2:49=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 25 Apr 2024 at 00:04, Doug Anderson <dianders@google.com> wrote=
:
> > >
> > > Hi,
> > >
> > > On Tue, Apr 23, 2024 at 2:20=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Tue, Apr 23, 2024 at 01:41:59PM -0700, Doug Anderson wrote:
> > > > > Hi,
> > > > >
> > > > > On Tue, Apr 23, 2024 at 11:10=E2=80=AFAM Hsin-Yi Wang <hsinyi@goo=
gle.com> wrote:
> > > > > >
> > > > > > > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > > > > > > +     .type =3D INIT_DCS_CMD, \
> > > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > > > +
> > > > > > > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > > > > > > +     .type =3D DELAY_CMD,\
> > > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > >
> > > > > > > > > This is the third panel driver using the same appoach. Ca=
n you use
> > > > > > > > > mipi_dsi_generic_write_seq() instead of the huge table? O=
r if you prefer
> > > > > > > > > the table, we should extract this framework to a common h=
elper.
> > > > > > > > > (my preference is shifted towards mipi_dsi_generic_write_=
seq()).
> > > > > > > > >
> > > > > > > > The drawback of mipi_dsi_generic_write_seq() is that it can=
 cause the
> > > > > > > > kernel size grows a lot since every sequence will be expand=
ed.
> > > > > > > >
> > > > > > > > Similar discussion in here:
> > > > > > > > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpX=
MUg7FjYDh3-=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > > > > > > >
> > > > > > > > This patch would increase the module size from 157K to 572K=
.
> > > > > > > > scripts/bloat-o-meter shows chg +235.95%.
> > > > > > > >
> > > > > > > > So maybe the common helper is better regarding the kernel m=
odule size?
> > > > > > >
> > > > > > > Yes, let's get a framework done in a useful way.
> > > > > > > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range(=
) should be
> > > > > > > used instead (and it's up to the developer to select correct =
delay
> > > > > > > function).
> > > > > > >
> > > > > > > >
> > > > > > > > > > +
> > > > > > > > > > +static const struct panel_init_cmd kingdisplay_kd101ne=
3_init_cmd[] =3D {
> > > > > > > > > > +     _INIT_DELAY_CMD(50),
> > > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > > >
> > > > > > > [skipped the body of the table]
> > > > > > >
> > > > > > > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > > > > > > +
> > > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > > >
> > > > > > > > > > +     _INIT_DCS_CMD(0X11),
> > > > > > >
> > > > > > > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> > > > > > >
> > > > > > > > > > +     /* T6: 120ms */
> > > > > > > > > > +     _INIT_DELAY_CMD(120),
> > > > > > > > > > +     _INIT_DCS_CMD(0X29),
> > > > > > >
> > > > > > > And this is mipi_dsi_dcs_set_display_on().
> > > > > > >
> > > > > > > Having a single table enourages people to put known commands =
into the
> > > > > > > table, the practice that must be frowned upon and forbidden.
> > > > > > >
> > > > > > > We have functions for some of the standard DCS commands. So, =
maybe
> > > > > > > instead of adding a single-table based approach we can improv=
e
> > > > > > > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by mov=
ing the
> > > > > > > error handling to a common part of enable() / prepare() funct=
ion.
> > > > > > >
> > > > > >
> > > > > > For this panel, I think it can also refer to how
> > > > > > panel-kingdisplay-kd097d04.c does. Create the table for init cm=
d data,
> > > > > > not what operation to use, and use mipi_dsi_generic_write_seq()=
 when
> > > > > > looping through the table.
> > > > >
> > > > > Even more similar discussion:
> > > > >
> > > > > https://lore.kernel.org/r/CAD=3DFV=3DUGDbNvAMjzWSOvxybGikQcvW9JsR=
tbxHVg8_97YPEQCA@mail.gmail.com
> > > >
> > > > It seems I skipped that thread.
> > > >
> > > > I'd still suggest a code-based solution compared to table-based one=
, for
> > > > the reasons I've outlined before. Having a tables puts a pressure o=
n the
> > > > developer to put commands there for which we already have a
> > > > command-specific function.
> > >
> > > The problem is that with these panels that need big init sequences th=
e
> > > code based solution is _a lot_ bigger. If it were a few bytes or a
> > > 1-2KB then fine, but when Hsin-Yi measured Linus W's attempt to move
> > > from a table to code it was 100K difference in code [1]. I would also
> > > say that having these long init sequences done as separate commands
> > > encourages people to skip checking the return values of each of the
> > > transfer functions and I don't love that idea.
> > >
> > > It would be ideal if these panels didn't need these long init
> > > sequences, but I don't have any inside knowledge here saying that the=
y
> > > could be removed. So assume we can't get rid of the init sequences it
> > > feels like we have to find some way to make the tables work for at
> > > least the large chunks of init code and encourage people to make the
> > > tables readable...
> >
> >
> > I did a quick check on the boe-tv101wum-nl6 driver by converting the
> > writes to use the following macro:
> >
> > #define mipi_dsi_dcs_write_cmd_seq(dsi, cmd, seq...)
> >              \
> >         do {                                                           =
        \
> >                 static const u8 d[] =3D { cmd, seq };                  =
      \
> >                 ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)=
);    \
> >                 if (ret < 0)                                           =
        \
> >                         goto err;                                      =
        \
> >         } while (0)
> >
> > And then at the end of the init funciton having
> >
> > err:
> >         dev_err(panel->dev,
> >                 "failed to write command %d\n", ret);
> >         return ret;
> > }
> >
>
> I'm not sure about the coding style rule here, would it be considered
> unclear that caller of mipi_dsi_dcs_write_cmd_seq() needs to have err
> block, but the block may not be directly used in that caller and is
> only jumped from the macro?

I'm also not sure here. It was a quick and dirty test.
We might as well do something like

ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, ...);
if (ret)
    goto err;

all over the place.


>
>
> > Size comparison:
> >    text    data     bss     dec     hex filename
> > before
> >   34109   10410      18   44537    adf9
> > ../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
> > making init data const
> >   44359     184       0   44543    adff
> > ../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
> > with new macros
> >   44353     184       0   44537    adf9
> > ../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
> >
> > As you can see, there is literally no size difference with this macro i=
n place.
> > The only drawback is that the init stops on the first write rather
> > than going through the sequence.
> >
> > WDYT? I can turn this into a proper patch if you think this makes sense=
.
> >
> > >
> > >
> > > [1] https://lore.kernel.org/r/CAD=3DFV=3DUFa_AoJQvUT3BTiRs19WCA2xLVeQ=
OU=3D+nYu_HaE0_c6Q@mail.gmail.com
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



--
With best wishes
Dmitry
