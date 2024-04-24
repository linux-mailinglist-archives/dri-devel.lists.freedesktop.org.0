Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32D8B1740
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 01:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED891127B2;
	Wed, 24 Apr 2024 23:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UfXiiuTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9F41127B2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 23:37:14 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de45f3f092bso565674276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714001833; x=1714606633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJ0R3e0keMNx202pP2IN4/C+HPu73CPOtuGCfDRwGvU=;
 b=UfXiiuToqtPFWY0qPKVIs4+q5jJMfrTUcpeM47A+2tZmHY2r3x74yFkvc4p/FWMbj9
 7awhu8tsTURhnKMqhQRrsl8BR+6JAhyluhU/eBJ2oIf+/NIQOxpM/r20zJNsjyUMksw/
 vqcZfsd+CcJA1rr8qZWwDQfKwK3TxmChVa4rww9OVlqoKikI17B9fPHbOczXG1gIvoGl
 tmIVaCcAD6dTLOghPhzHiQRj/znRg7n6q+E4WLBIW/8sW0+JHs4I2MU21iPA/6sTgzxj
 B9d4h80Jc6g9TWlNGiEqP7jK1EOqijSHq/vru0rcy2pN9x/kXImfEPvIIyZlrl1MmqGr
 aItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714001833; x=1714606633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJ0R3e0keMNx202pP2IN4/C+HPu73CPOtuGCfDRwGvU=;
 b=C9wY/bv3urG2PVLj4pzXsEiIz1nFUycBs17L4GDz866HbpzZKuBArThXi81XoGXybt
 7kSHtJIZ2PFFjjsTbm6AXcUw7liNLLMFCaiFTrxTBzLo7GQu+6BjLg1YSFw6bJiYHdW2
 orE8Y2ui5is+SXR84ooGYEDzwBQVb9hpuaN1XVKekjoImSSfDcjXtGWqtsFZjNJoaz4f
 AlwnUiSbW6Kt0adzLgz0Xc1f6xD8xtRzJQO0WcdAFLDO7zkfRqOmxB172+2CzCm2J4wQ
 rOb2lwCoE9jwsF2rZs+BX/S2u3LbUDl3mgYUqXhyHYhz/V7HuDBl7BvL5aqZu6TD+iBp
 coxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOiMlFnFFm1cO1ooj3YjOFvRsd5KZBJJx9/qOYfi5l+QXX/e/2ocPUxHiQo1HlArS4ra8E+N6KMpzEVh29R20kqWzuCaa/t41K+ni/FHFK
X-Gm-Message-State: AOJu0YxAMTvlwzzIXAwcA1w5khT6u2woweVVQA9KEIlArzwr4wM2gBYO
 2DHpWbeW78SBUx645MyD+gPKizTAILqgeOib4ekPyJukgnYmdE14BNn2wmrqE8aMlNB1O/5L79D
 Li/871Oev15V2H0lb9LPUz/Yn5fX0cm2GOng/Tg==
X-Google-Smtp-Source: AGHT+IFO6Jg9yz4O29TF/3ApJje86OjISlkRYmpbhXyKpYa10imH2qZlKxAqNXzx+sGHECnzJ3ejijQQwsfqD4JYJI4=
X-Received: by 2002:a25:9f04:0:b0:dcf:bc57:cd61 with SMTP id
 n4-20020a259f04000000b00dcfbc57cd61mr3974486ybq.50.1714001833305; Wed, 24 Apr
 2024 16:37:13 -0700 (PDT)
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
 <CAA8EJprLvEt_pt4XzACQG7pU8KYagKbQ71xwtRF9KrLygTT3ow@mail.gmail.com>
 <CAD=FV=V+jBvkKj1vvAsXuC5dSn0u_SQBQZHTrDZKoSG2V4fp3g@mail.gmail.com>
In-Reply-To: <CAD=FV=V+jBvkKj1vvAsXuC5dSn0u_SQBQZHTrDZKoSG2V4fp3g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 02:37:02 +0300
Message-ID: <CAA8EJprU1KZHKAVUJiYaDRY6Wxihzw=ZDgdqQ9y7W3zdnRMfFg@mail.gmail.com>
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

On Thu, 25 Apr 2024 at 02:25, Doug Anderson <dianders@google.com> wrote:
>
> Hi,
>
> On Wed, Apr 24, 2024 at 3:51=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 25 Apr 2024 at 01:15, Hsin-Yi Wang <hsinyi@google.com> wrote:
> > >
> > > On Wed, Apr 24, 2024 at 2:49=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Thu, 25 Apr 2024 at 00:04, Doug Anderson <dianders@google.com> w=
rote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Apr 23, 2024 at 2:20=E2=80=AFPM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On Tue, Apr 23, 2024 at 01:41:59PM -0700, Doug Anderson wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Tue, Apr 23, 2024 at 11:10=E2=80=AFAM Hsin-Yi Wang <hsinyi=
@google.com> wrote:
> > > > > > > >
> > > > > > > > > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > > > > > > > > +     .type =3D INIT_DCS_CMD, \
> > > > > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > > > > > +
> > > > > > > > > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > > > > > > > > +     .type =3D DELAY_CMD,\
> > > > > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > > > >
> > > > > > > > > > > This is the third panel driver using the same appoach=
. Can you use
> > > > > > > > > > > mipi_dsi_generic_write_seq() instead of the huge tabl=
e? Or if you prefer
> > > > > > > > > > > the table, we should extract this framework to a comm=
on helper.
> > > > > > > > > > > (my preference is shifted towards mipi_dsi_generic_wr=
ite_seq()).
> > > > > > > > > > >
> > > > > > > > > > The drawback of mipi_dsi_generic_write_seq() is that it=
 can cause the
> > > > > > > > > > kernel size grows a lot since every sequence will be ex=
panded.
> > > > > > > > > >
> > > > > > > > > > Similar discussion in here:
> > > > > > > > > > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=
=3DEpXMUg7FjYDh3-=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > > > > > > > > >
> > > > > > > > > > This patch would increase the module size from 157K to =
572K.
> > > > > > > > > > scripts/bloat-o-meter shows chg +235.95%.
> > > > > > > > > >
> > > > > > > > > > So maybe the common helper is better regarding the kern=
el module size?
> > > > > > > > >
> > > > > > > > > Yes, let's get a framework done in a useful way.
> > > > > > > > > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_ra=
nge() should be
> > > > > > > > > used instead (and it's up to the developer to select corr=
ect delay
> > > > > > > > > function).
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > > +
> > > > > > > > > > > > +static const struct panel_init_cmd kingdisplay_kd1=
01ne3_init_cmd[] =3D {
> > > > > > > > > > > > +     _INIT_DELAY_CMD(50),
> > > > > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > > > > >
> > > > > > > > > [skipped the body of the table]
> > > > > > > > >
> > > > > > > > > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > > > > > > > > +
> > > > > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > > > > >
> > > > > > > > > > > > +     _INIT_DCS_CMD(0X11),
> > > > > > > > >
> > > > > > > > > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> > > > > > > > >
> > > > > > > > > > > > +     /* T6: 120ms */
> > > > > > > > > > > > +     _INIT_DELAY_CMD(120),
> > > > > > > > > > > > +     _INIT_DCS_CMD(0X29),
> > > > > > > > >
> > > > > > > > > And this is mipi_dsi_dcs_set_display_on().
> > > > > > > > >
> > > > > > > > > Having a single table enourages people to put known comma=
nds into the
> > > > > > > > > table, the practice that must be frowned upon and forbidd=
en.
> > > > > > > > >
> > > > > > > > > We have functions for some of the standard DCS commands. =
So, maybe
> > > > > > > > > instead of adding a single-table based approach we can im=
prove
> > > > > > > > > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by=
 moving the
> > > > > > > > > error handling to a common part of enable() / prepare() f=
unction.
> > > > > > > > >
> > > > > > > >
> > > > > > > > For this panel, I think it can also refer to how
> > > > > > > > panel-kingdisplay-kd097d04.c does. Create the table for ini=
t cmd data,
> > > > > > > > not what operation to use, and use mipi_dsi_generic_write_s=
eq() when
> > > > > > > > looping through the table.
> > > > > > >
> > > > > > > Even more similar discussion:
> > > > > > >
> > > > > > > https://lore.kernel.org/r/CAD=3DFV=3DUGDbNvAMjzWSOvxybGikQcvW=
9JsRtbxHVg8_97YPEQCA@mail.gmail.com
> > > > > >
> > > > > > It seems I skipped that thread.
> > > > > >
> > > > > > I'd still suggest a code-based solution compared to table-based=
 one, for
> > > > > > the reasons I've outlined before. Having a tables puts a pressu=
re on the
> > > > > > developer to put commands there for which we already have a
> > > > > > command-specific function.
> > > > >
> > > > > The problem is that with these panels that need big init sequence=
s the
> > > > > code based solution is _a lot_ bigger. If it were a few bytes or =
a
> > > > > 1-2KB then fine, but when Hsin-Yi measured Linus W's attempt to m=
ove
> > > > > from a table to code it was 100K difference in code [1]. I would =
also
> > > > > say that having these long init sequences done as separate comman=
ds
> > > > > encourages people to skip checking the return values of each of t=
he
> > > > > transfer functions and I don't love that idea.
> > > > >
> > > > > It would be ideal if these panels didn't need these long init
> > > > > sequences, but I don't have any inside knowledge here saying that=
 they
> > > > > could be removed. So assume we can't get rid of the init sequence=
s it
> > > > > feels like we have to find some way to make the tables work for a=
t
> > > > > least the large chunks of init code and encourage people to make =
the
> > > > > tables readable...
> > > >
> > > >
> > > > I did a quick check on the boe-tv101wum-nl6 driver by converting th=
e
> > > > writes to use the following macro:
> > > >
> > > > #define mipi_dsi_dcs_write_cmd_seq(dsi, cmd, seq...)
> > > >              \
> > > >         do {                                                       =
            \
> > > >                 static const u8 d[] =3D { cmd, seq };              =
          \
> > > >                 ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZ=
E(d));    \
> > > >                 if (ret < 0)                                       =
            \
> > > >                         goto err;                                  =
            \
> > > >         } while (0)
> > > >
> > > > And then at the end of the init funciton having
> > > >
> > > > err:
> > > >         dev_err(panel->dev,
> > > >                 "failed to write command %d\n", ret);
> > > >         return ret;
> > > > }
> > > >
> > >
> > > I'm not sure about the coding style rule here, would it be considered
> > > unclear that caller of mipi_dsi_dcs_write_cmd_seq() needs to have err
> > > block, but the block may not be directly used in that caller and is
> > > only jumped from the macro?
> >
> > I'm also not sure here. It was a quick and dirty test.
> > We might as well do something like
> >
> > ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, ...);
> > if (ret)
> >     goto err;
> >
> > all over the place.
>
> Oh. This is actually very simple to fix and requires no code changes
> to clients. :-P We just need to hoist the printing out of the macro
> and into "drm_mipi_dsi.c". Let me double-confirm and then I'll post a
> patch.

Sounds good. I have converted boe-tv101wum-nl6, ilitek-ili9882t and
innolux-p079zca drivers. Once you post your patch I can post those
too.



--=20
With best wishes
Dmitry
