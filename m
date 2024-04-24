Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DF8B154E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 23:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070B10EEDA;
	Wed, 24 Apr 2024 21:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yO9YEfQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFF510EEDA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 21:49:20 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso466531276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 14:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713995359; x=1714600159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hz25l3F5HcKxLgpA7vc1PtsFYUkFX5bYRy1HzlOHmSw=;
 b=yO9YEfQf62UbYonr/ODBUNcpsUTfZmUEj65rs4Ysq6Tk72j0qSiDqjuK1R1/E8Rg3U
 1iQbMjEpRPoEn3rewcHz3Eq/B973UWXcVMzTtubmkbDi42I969/Ut1aL4DYIhDGmbmX2
 TXkvTOKxjO28y/73wT5XypbecBZfK3FNyp55Qy6CJmPgh2xKhj4dPmH8C07Ij+GNxyyb
 GfKqw6TLBXMOK7Le6/7Ox7F7k4AbmyQCGD2AXsuO5GDxY1xLAdgID52C1H6Amuutg/63
 /iWjrB7htcew3VqmbfUTtxpfgI1kz6NJTKj6u51Nir2ZC16cJWKRlcwsGxfd9ZrsTI9O
 X3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713995359; x=1714600159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hz25l3F5HcKxLgpA7vc1PtsFYUkFX5bYRy1HzlOHmSw=;
 b=H5CkUJtUkZOCj920lSoLYqHOzpszzBrgwYXtw9fezt6M+hDb2KUjGB5EoPbyCMgT5W
 nheLkjlvMjzXyvCYeJv9LAk6uJCB62voSlMnFBxnJb7e77Rr4AHdn0JYJy2T0y8cy6qJ
 JNjMdb1B2zEq2yfqkcvnwFo1/gQsMc2s6fSI4JJ6xqlljcT6IDswF+yO25kpMiHZ4dzN
 7+zbM6HRtrgynT25m/Susf5kxpLlpQGw4DXPTp+wXIrI4nShlf2xAW0lYRfX1X1AT5yh
 TQKnyL9OjziiQ0xIWynfjY6SP9/3ui1V2vy9GX9BJM0JwDX3UtOnmLbWIEG/tq86RJpC
 GilQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhwgCyU8cwb7FJNrdqBdtn1nVJPeEko+apB0/dDoGun1Rj9U/il+fa5p46BNBkYFrlLt/N27v6YiudJAQ2hPvatb36sctIPDD7HQNHh61h
X-Gm-Message-State: AOJu0YwFxdfxjbD3WdmKoalNPOPX8XfFDjxm+ftDyKOJnW96pJh1Q8YZ
 rYKdLvAULtyxMYbtEwgrVS97Jb662CSRkvMQOEo8z14KjRS2mPqKp/Tagb9MU6CuVplX0Sz1CMf
 z85Sd2f50noAfI/LK1P5gZ96pXUnCe9iMTA9RHg==
X-Google-Smtp-Source: AGHT+IE11zcbo6fpNyRFrIw1yEm9BOp6i/pOaMdr/aR/e8wqmXQ7Qx/Ston/56y/x1b6yMmQ7+X5n7xQDvcR6E4wAoE=
X-Received: by 2002:a25:8104:0:b0:de5:852f:6afe with SMTP id
 o4-20020a258104000000b00de5852f6afemr1262062ybk.30.1713995359592; Wed, 24 Apr
 2024 14:49:19 -0700 (PDT)
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
In-Reply-To: <CAD=FV=VQ8rbwKk4WpHRER9p4cZp7UrrHRpgnErqbQxyxp4sg5w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 00:49:08 +0300
Message-ID: <CAA8EJprv3qBd1hfdWHrfhY=S0w2O70dZnYb6TVsS6AGRPxsYdw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
To: Doug Anderson <dianders@google.com>
Cc: Hsin-Yi Wang <hsinyi@google.com>, 
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

On Thu, 25 Apr 2024 at 00:04, Doug Anderson <dianders@google.com> wrote:
>
> Hi,
>
> On Tue, Apr 23, 2024 at 2:20=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, Apr 23, 2024 at 01:41:59PM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Tue, Apr 23, 2024 at 11:10=E2=80=AFAM Hsin-Yi Wang <hsinyi@google.=
com> wrote:
> > > >
> > > > > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > > > > +     .type =3D INIT_DCS_CMD, \
> > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > +
> > > > > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > > > > +     .type =3D DELAY_CMD,\
> > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > >
> > > > > > > This is the third panel driver using the same appoach. Can yo=
u use
> > > > > > > mipi_dsi_generic_write_seq() instead of the huge table? Or if=
 you prefer
> > > > > > > the table, we should extract this framework to a common helpe=
r.
> > > > > > > (my preference is shifted towards mipi_dsi_generic_write_seq(=
)).
> > > > > > >
> > > > > > The drawback of mipi_dsi_generic_write_seq() is that it can cau=
se the
> > > > > > kernel size grows a lot since every sequence will be expanded.
> > > > > >
> > > > > > Similar discussion in here:
> > > > > > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMUg7=
FjYDh3-=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > > > > >
> > > > > > This patch would increase the module size from 157K to 572K.
> > > > > > scripts/bloat-o-meter shows chg +235.95%.
> > > > > >
> > > > > > So maybe the common helper is better regarding the kernel modul=
e size?
> > > > >
> > > > > Yes, let's get a framework done in a useful way.
> > > > > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range() sh=
ould be
> > > > > used instead (and it's up to the developer to select correct dela=
y
> > > > > function).
> > > > >
> > > > > >
> > > > > > > > +
> > > > > > > > +static const struct panel_init_cmd kingdisplay_kd101ne3_in=
it_cmd[] =3D {
> > > > > > > > +     _INIT_DELAY_CMD(50),
> > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > >
> > > > > [skipped the body of the table]
> > > > >
> > > > > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > > > > +
> > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > >
> > > > > > > > +     _INIT_DCS_CMD(0X11),
> > > > >
> > > > > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> > > > >
> > > > > > > > +     /* T6: 120ms */
> > > > > > > > +     _INIT_DELAY_CMD(120),
> > > > > > > > +     _INIT_DCS_CMD(0X29),
> > > > >
> > > > > And this is mipi_dsi_dcs_set_display_on().
> > > > >
> > > > > Having a single table enourages people to put known commands into=
 the
> > > > > table, the practice that must be frowned upon and forbidden.
> > > > >
> > > > > We have functions for some of the standard DCS commands. So, mayb=
e
> > > > > instead of adding a single-table based approach we can improve
> > > > > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by moving =
the
> > > > > error handling to a common part of enable() / prepare() function.
> > > > >
> > > >
> > > > For this panel, I think it can also refer to how
> > > > panel-kingdisplay-kd097d04.c does. Create the table for init cmd da=
ta,
> > > > not what operation to use, and use mipi_dsi_generic_write_seq() whe=
n
> > > > looping through the table.
> > >
> > > Even more similar discussion:
> > >
> > > https://lore.kernel.org/r/CAD=3DFV=3DUGDbNvAMjzWSOvxybGikQcvW9JsRtbxH=
Vg8_97YPEQCA@mail.gmail.com
> >
> > It seems I skipped that thread.
> >
> > I'd still suggest a code-based solution compared to table-based one, fo=
r
> > the reasons I've outlined before. Having a tables puts a pressure on th=
e
> > developer to put commands there for which we already have a
> > command-specific function.
>
> The problem is that with these panels that need big init sequences the
> code based solution is _a lot_ bigger. If it were a few bytes or a
> 1-2KB then fine, but when Hsin-Yi measured Linus W's attempt to move
> from a table to code it was 100K difference in code [1]. I would also
> say that having these long init sequences done as separate commands
> encourages people to skip checking the return values of each of the
> transfer functions and I don't love that idea.
>
> It would be ideal if these panels didn't need these long init
> sequences, but I don't have any inside knowledge here saying that they
> could be removed. So assume we can't get rid of the init sequences it
> feels like we have to find some way to make the tables work for at
> least the large chunks of init code and encourage people to make the
> tables readable...


I did a quick check on the boe-tv101wum-nl6 driver by converting the
writes to use the following macro:

#define mipi_dsi_dcs_write_cmd_seq(dsi, cmd, seq...)
             \
        do {                                                               =
    \
                static const u8 d[] =3D { cmd, seq };                      =
  \
                ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));  =
  \
                if (ret < 0)                                               =
    \
                        goto err;                                          =
    \
        } while (0)

And then at the end of the init funciton having

err:
        dev_err(panel->dev,
                "failed to write command %d\n", ret);
        return ret;
}

Size comparison:
   text    data     bss     dec     hex filename
before
  34109   10410      18   44537    adf9
../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
making init data const
  44359     184       0   44543    adff
../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
with new macros
  44353     184       0   44537    adf9
../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o

As you can see, there is literally no size difference with this macro in pl=
ace.
The only drawback is that the init stops on the first write rather
than going through the sequence.

WDYT? I can turn this into a proper patch if you think this makes sense.

>
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DUFa_AoJQvUT3BTiRs19WCA2xLVeQOU=
=3D+nYu_HaE0_c6Q@mail.gmail.com



--=20
With best wishes
Dmitry
