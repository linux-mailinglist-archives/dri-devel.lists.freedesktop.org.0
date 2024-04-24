Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2848B1501
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 23:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2165F113DBF;
	Wed, 24 Apr 2024 21:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QxdQuUkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622AF113DBF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 21:05:00 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-439b1c72676so47701cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713992699; x=1714597499;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rj4rO4PLh4sMNnDeMs5uvJoPjl+yBAVoxkkhmmaqDak=;
 b=QxdQuUkY7NDyCzuM8dqJ3WEa6LhhWGyobluZPt1XJ8i1S/v2YdOZYfxbgEQYQIa+IF
 rfppevCYccMce+OYLZRSNdeF9yMet820ohhkg1+s81IQq8GVL5f6odJwce30ZYIGJod3
 S8YOWewpXmCSgP2gTNeO8H9VAFOV05LOlEE9y+AYlz3hROdywvUqqq5DeNnuSrXYKZnv
 BWXf51GUvz5/H4sTtJLOz7uXz9KANusee0C4jxWssBVOe5l9eOVgn5pIYut7OQMI9fBd
 URPqvw8KoQIkqn+ri36rrscTXLfoKZzwe5AIb03ERiqmxrRHJqx/2F4ux/H6acbJPAyk
 K1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713992699; x=1714597499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rj4rO4PLh4sMNnDeMs5uvJoPjl+yBAVoxkkhmmaqDak=;
 b=tSG77nlEYdRZadoPAMZcpPcm88I8e0qP/z+IBneG48C1FImHKkDPp7CyNBDhyUmOh0
 VsDDwEPI7eYDQdEnLME/XxR4s3dQpIhLZddi3i+VbHFmJlngo5a0AWOETUXnBLt1DMq4
 305OC9lRxfF0C6X8EkCJBm86o0EoJOT/rCvUhtAjr1YpKpphAB01RB0mKvLWgAFUoyqL
 DE9RSrHkBwTg4vetPnJ7FX31waHqTnDC6Sgv2ztiyPedZqoQH/LxdDs3kNlMzVAaX9J2
 J9XI0WIN+r2xeyl7PDkedT6Uwgx7FWd6y9YEfpv6HYEPwjcqRSJBYuY1/l5JyXxRpiLU
 9LjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFu5TNaAK+s5LlhebKN8L9dKFFt5ZRB1LK8K5uTVIBUGEww4YZiYeF/7EtgGy71iUionQndX1W13EAdNMcwFIZIA1atfmaEX0y8L7uSjrs
X-Gm-Message-State: AOJu0YzBpxLf1ehws7VezojRuvjf6MsVZKnvPoDMKCUyjLoMlIeiVdx6
 LHMNxR9d4iPq2vtQxsKqVZHDUTj+qK3oWzHq+zJ8jM6FvF+5LyrOkVO2/LunOmQq2p/vC3q+guX
 +2cuoj8qGjkiTuFVQ9DLSUKQrIx8D+FEH5Onu
X-Google-Smtp-Source: AGHT+IEtI3etrgBybXbwYg7jilj5JjvVJImpTblqzNlSwo3wBJoObCifOxf1jLNtJT+zh1edHSqTk9tcT444rLpYkGI=
X-Received: by 2002:ac8:4788:0:b0:439:ad3:a62c with SMTP id
 k8-20020ac84788000000b004390ad3a62cmr16873qtq.3.1713992698963; Wed, 24 Apr
 2024 14:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
 <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
 <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
 <CACb=7PVTvV9nsFu1ZAXu7YTjSOAGZka+c__EJq3J3qgSJGEShw@mail.gmail.com>
 <CAD=FV=VYAzqsGEBJai9b9n+HxHiG59L1vF73AEWcTwLS_ryjWw@mail.gmail.com>
 <an2k3vgynq4as2sd5dy6ccmdiqedmo7qjsab5qyfhesd333i2a@235sqph3bze5>
In-Reply-To: <an2k3vgynq4as2sd5dy6ccmdiqedmo7qjsab5qyfhesd333i2a@235sqph3bze5>
From: Doug Anderson <dianders@google.com>
Date: Wed, 24 Apr 2024 14:04:43 -0700
Message-ID: <CAD=FV=VQ8rbwKk4WpHRER9p4cZp7UrrHRpgnErqbQxyxp4sg5w@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Hi,

On Tue, Apr 23, 2024 at 2:20=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Apr 23, 2024 at 01:41:59PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Apr 23, 2024 at 11:10=E2=80=AFAM Hsin-Yi Wang <hsinyi@google.co=
m> wrote:
> > >
> > > > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > > > +     .type =3D INIT_DCS_CMD, \
> > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > +
> > > > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > > > +     .type =3D DELAY_CMD,\
> > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > >
> > > > > > This is the third panel driver using the same appoach. Can you =
use
> > > > > > mipi_dsi_generic_write_seq() instead of the huge table? Or if y=
ou prefer
> > > > > > the table, we should extract this framework to a common helper.
> > > > > > (my preference is shifted towards mipi_dsi_generic_write_seq())=
.
> > > > > >
> > > > > The drawback of mipi_dsi_generic_write_seq() is that it can cause=
 the
> > > > > kernel size grows a lot since every sequence will be expanded.
> > > > >
> > > > > Similar discussion in here:
> > > > > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMUg7Fj=
YDh3-=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > > > >
> > > > > This patch would increase the module size from 157K to 572K.
> > > > > scripts/bloat-o-meter shows chg +235.95%.
> > > > >
> > > > > So maybe the common helper is better regarding the kernel module =
size?
> > > >
> > > > Yes, let's get a framework done in a useful way.
> > > > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range() shou=
ld be
> > > > used instead (and it's up to the developer to select correct delay
> > > > function).
> > > >
> > > > >
> > > > > > > +
> > > > > > > +static const struct panel_init_cmd kingdisplay_kd101ne3_init=
_cmd[] =3D {
> > > > > > > +     _INIT_DELAY_CMD(50),
> > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > >
> > > > [skipped the body of the table]
> > > >
> > > > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > > > +
> > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > >
> > > > > > > +     _INIT_DCS_CMD(0X11),
> > > >
> > > > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> > > >
> > > > > > > +     /* T6: 120ms */
> > > > > > > +     _INIT_DELAY_CMD(120),
> > > > > > > +     _INIT_DCS_CMD(0X29),
> > > >
> > > > And this is mipi_dsi_dcs_set_display_on().
> > > >
> > > > Having a single table enourages people to put known commands into t=
he
> > > > table, the practice that must be frowned upon and forbidden.
> > > >
> > > > We have functions for some of the standard DCS commands. So, maybe
> > > > instead of adding a single-table based approach we can improve
> > > > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by moving th=
e
> > > > error handling to a common part of enable() / prepare() function.
> > > >
> > >
> > > For this panel, I think it can also refer to how
> > > panel-kingdisplay-kd097d04.c does. Create the table for init cmd data=
,
> > > not what operation to use, and use mipi_dsi_generic_write_seq() when
> > > looping through the table.
> >
> > Even more similar discussion:
> >
> > https://lore.kernel.org/r/CAD=3DFV=3DUGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg=
8_97YPEQCA@mail.gmail.com
>
> It seems I skipped that thread.
>
> I'd still suggest a code-based solution compared to table-based one, for
> the reasons I've outlined before. Having a tables puts a pressure on the
> developer to put commands there for which we already have a
> command-specific function.

The problem is that with these panels that need big init sequences the
code based solution is _a lot_ bigger. If it were a few bytes or a
1-2KB then fine, but when Hsin-Yi measured Linus W's attempt to move
from a table to code it was 100K difference in code [1]. I would also
say that having these long init sequences done as separate commands
encourages people to skip checking the return values of each of the
transfer functions and I don't love that idea.

It would be ideal if these panels didn't need these long init
sequences, but I don't have any inside knowledge here saying that they
could be removed. So assume we can't get rid of the init sequences it
feels like we have to find some way to make the tables work for at
least the large chunks of init code and encourage people to make the
tables readable...


[1] https://lore.kernel.org/r/CAD=3DFV=3DUFa_AoJQvUT3BTiRs19WCA2xLVeQOU=3D+=
nYu_HaE0_c6Q@mail.gmail.com
