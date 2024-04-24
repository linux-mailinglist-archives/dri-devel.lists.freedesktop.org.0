Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F458B15FD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 00:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3B310E27E;
	Wed, 24 Apr 2024 22:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3N2HNtzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698A610E27E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 22:15:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so2715035e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713996947; x=1714601747;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PwX26yDrbphgPlomUbRviwGBYrIb66VEMHKXPwN1t8=;
 b=3N2HNtzWN7b7/y/+PCuWPJ88IRLiFxxj8YuNECYj4glOzUVrdemeR7fCxuiEnnyXGe
 5+7DevoVx3ePBQWE0RrnCsxnl5rDGIvxMExU/DSad4md/pnZpmU6Aq1vripAndDYSi2J
 gtH00Edh+p2BBcljYWLZaqBbgdNEHHNzZEBgkAupTZKqfluQQybwUajkviNSRTlbVgWB
 WBt8hO8Hp2A7kdGZvGdjtPCMK/VctCj7NPKJoF7XQQ3FMjYA6dLTWhffKxqvQefsDz/8
 6yMVeO29XspPXRJOQrBzg6HbDuM+NJEnbyO872rcHWRnSIOCl6VTkLelYvn7oV+QfqIO
 J8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713996947; x=1714601747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PwX26yDrbphgPlomUbRviwGBYrIb66VEMHKXPwN1t8=;
 b=MsLtXpAmg1LKi6Iql0dIK3IjHZAjd63EI61ULZkc5slH1KHicnEyvPPYhKJMJgBTV3
 f5bzCuVvEJuTeiiQSr0a83Lbo226+SetDOFK8OQPqd10nIyDYv8rMyyQ90fZ1DrJmn5v
 hbbNjr+emKU5GZ78s6WYX2FAd8t6xlasv2VvPhPW+PgGKqFXMURxqg7FjKGEDALx6JIf
 Ac5b4iGCudy/JFmhf5e83TQJHDb8Nkg+2nazKNoAAF0zcrSgg/PrlEtN5KenlgEnLKl7
 iYrhswcf/bcvE9x15AoCOhrRFsbKtD2aqEUbKMY5/hY50IrZFTPfDgJKumqgEBC7mI6h
 /+oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSWj+RM92u72VFJDldIHueCDwCRvGAdH+t+TIiV1aGCh7cjKwsgyUks9zAa9cukYJCaW/s2fPW7wYBD5bB0SOLVDVjAGiy70xaWXYEieJ1
X-Gm-Message-State: AOJu0YyXyCq7VogY+aIi+9xQoZc6tSdh/Ihj4PQXcV3JPi8o4ku5G7hM
 6IAX678Fb9ZqT9qGv33TB40LgklEuycDy1EHr3HAQSc0voHg0W0kQI6anFjbjOnIiVJFo1m3PCq
 Bx1HOBb7Op2OuGgJNV4gRjW55jiLMvnpSbW9c
X-Google-Smtp-Source: AGHT+IHkboif/00IgRcoNKYbKyjHQwpzFRhV06M+te63W8KYhcpbAeVE+PqnNH2rpK8rFGBlds+W+jojcHREsdyxFyE=
X-Received: by 2002:a05:600c:5247:b0:414:273:67d4 with SMTP id
 fc7-20020a05600c524700b00414027367d4mr2632403wmb.30.1713996946437; Wed, 24
 Apr 2024 15:15:46 -0700 (PDT)
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
In-Reply-To: <CAA8EJprv3qBd1hfdWHrfhY=S0w2O70dZnYb6TVsS6AGRPxsYdw@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Wed, 24 Apr 2024 15:15:18 -0700
Message-ID: <CACb=7PVEpCFWf_aysRkeR0yWAXR5sTaXhNbi3TV3ffKj866+EQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Wed, Apr 24, 2024 at 2:49=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 25 Apr 2024 at 00:04, Doug Anderson <dianders@google.com> wrote:
> >
> > Hi,
> >
> > On Tue, Apr 23, 2024 at 2:20=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Tue, Apr 23, 2024 at 01:41:59PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Tue, Apr 23, 2024 at 11:10=E2=80=AFAM Hsin-Yi Wang <hsinyi@googl=
e.com> wrote:
> > > > >
> > > > > > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > > > > > +     .type =3D INIT_DCS_CMD, \
> > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > > +
> > > > > > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > > > > > +     .type =3D DELAY_CMD,\
> > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > >
> > > > > > > > This is the third panel driver using the same appoach. Can =
you use
> > > > > > > > mipi_dsi_generic_write_seq() instead of the huge table? Or =
if you prefer
> > > > > > > > the table, we should extract this framework to a common hel=
per.
> > > > > > > > (my preference is shifted towards mipi_dsi_generic_write_se=
q()).
> > > > > > > >
> > > > > > > The drawback of mipi_dsi_generic_write_seq() is that it can c=
ause the
> > > > > > > kernel size grows a lot since every sequence will be expanded=
.
> > > > > > >
> > > > > > > Similar discussion in here:
> > > > > > > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMU=
g7FjYDh3-=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > > > > > >
> > > > > > > This patch would increase the module size from 157K to 572K.
> > > > > > > scripts/bloat-o-meter shows chg +235.95%.
> > > > > > >
> > > > > > > So maybe the common helper is better regarding the kernel mod=
ule size?
> > > > > >
> > > > > > Yes, let's get a framework done in a useful way.
> > > > > > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range() =
should be
> > > > > > used instead (and it's up to the developer to select correct de=
lay
> > > > > > function).
> > > > > >
> > > > > > >
> > > > > > > > > +
> > > > > > > > > +static const struct panel_init_cmd kingdisplay_kd101ne3_=
init_cmd[] =3D {
> > > > > > > > > +     _INIT_DELAY_CMD(50),
> > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > >
> > > > > > [skipped the body of the table]
> > > > > >
> > > > > > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > > > > > +
> > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > >
> > > > > > > > > +     _INIT_DCS_CMD(0X11),
> > > > > >
> > > > > > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> > > > > >
> > > > > > > > > +     /* T6: 120ms */
> > > > > > > > > +     _INIT_DELAY_CMD(120),
> > > > > > > > > +     _INIT_DCS_CMD(0X29),
> > > > > >
> > > > > > And this is mipi_dsi_dcs_set_display_on().
> > > > > >
> > > > > > Having a single table enourages people to put known commands in=
to the
> > > > > > table, the practice that must be frowned upon and forbidden.
> > > > > >
> > > > > > We have functions for some of the standard DCS commands. So, ma=
ybe
> > > > > > instead of adding a single-table based approach we can improve
> > > > > > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by movin=
g the
> > > > > > error handling to a common part of enable() / prepare() functio=
n.
> > > > > >
> > > > >
> > > > > For this panel, I think it can also refer to how
> > > > > panel-kingdisplay-kd097d04.c does. Create the table for init cmd =
data,
> > > > > not what operation to use, and use mipi_dsi_generic_write_seq() w=
hen
> > > > > looping through the table.
> > > >
> > > > Even more similar discussion:
> > > >
> > > > https://lore.kernel.org/r/CAD=3DFV=3DUGDbNvAMjzWSOvxybGikQcvW9JsRtb=
xHVg8_97YPEQCA@mail.gmail.com
> > >
> > > It seems I skipped that thread.
> > >
> > > I'd still suggest a code-based solution compared to table-based one, =
for
> > > the reasons I've outlined before. Having a tables puts a pressure on =
the
> > > developer to put commands there for which we already have a
> > > command-specific function.
> >
> > The problem is that with these panels that need big init sequences the
> > code based solution is _a lot_ bigger. If it were a few bytes or a
> > 1-2KB then fine, but when Hsin-Yi measured Linus W's attempt to move
> > from a table to code it was 100K difference in code [1]. I would also
> > say that having these long init sequences done as separate commands
> > encourages people to skip checking the return values of each of the
> > transfer functions and I don't love that idea.
> >
> > It would be ideal if these panels didn't need these long init
> > sequences, but I don't have any inside knowledge here saying that they
> > could be removed. So assume we can't get rid of the init sequences it
> > feels like we have to find some way to make the tables work for at
> > least the large chunks of init code and encourage people to make the
> > tables readable...
>
>
> I did a quick check on the boe-tv101wum-nl6 driver by converting the
> writes to use the following macro:
>
> #define mipi_dsi_dcs_write_cmd_seq(dsi, cmd, seq...)
>              \
>         do {                                                             =
      \
>                 static const u8 d[] =3D { cmd, seq };                    =
    \
>                 ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));=
    \
>                 if (ret < 0)                                             =
      \
>                         goto err;                                        =
      \
>         } while (0)
>
> And then at the end of the init funciton having
>
> err:
>         dev_err(panel->dev,
>                 "failed to write command %d\n", ret);
>         return ret;
> }
>

I'm not sure about the coding style rule here, would it be considered
unclear that caller of mipi_dsi_dcs_write_cmd_seq() needs to have err
block, but the block may not be directly used in that caller and is
only jumped from the macro?


> Size comparison:
>    text    data     bss     dec     hex filename
> before
>   34109   10410      18   44537    adf9
> ../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
> making init data const
>   44359     184       0   44543    adff
> ../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
> with new macros
>   44353     184       0   44537    adf9
> ../build-64/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.o
>
> As you can see, there is literally no size difference with this macro in =
place.
> The only drawback is that the init stops on the first write rather
> than going through the sequence.
>
> WDYT? I can turn this into a proper patch if you think this makes sense.
>
> >
> >
> > [1] https://lore.kernel.org/r/CAD=3DFV=3DUFa_AoJQvUT3BTiRs19WCA2xLVeQOU=
=3D+nYu_HaE0_c6Q@mail.gmail.com
>
>
>
> --
> With best wishes
> Dmitry
