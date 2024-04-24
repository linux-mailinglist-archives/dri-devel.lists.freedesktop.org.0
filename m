Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B38B162A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 00:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E87010E0E6;
	Wed, 24 Apr 2024 22:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TJAVtNIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7D710E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 22:28:14 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43989e6ca42so118141cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713997694; x=1714602494;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJLLyGyNYSIJ2mqOOEmdvcNKVMG9G7qW3Ws/lvIO5iY=;
 b=TJAVtNIYIoYh0ChCX0uYXT9+o4oVt7I4PTsLg+qwcSpb9UMrhG7AXdFMjjrqp0p7oG
 kElwsAqwDdunbrIADKlBAyE3m4j04f40vERU8Q56rSsDXgWMpC6ISBpxO1OYJuJfb4g4
 JTI09uyqS71l4jxvobODoukekqsnQIWL4Z/6wGTVGPOQdb+vEqOsxoEwvNiMQG4uB0kw
 tpvdlLtZyXBv95IiyMV0qP1FbTBBxKJ5XAeQ6+qNySRXIiTZG9hMRx6vYZzUQSgmqz09
 7InV59iwVBMG+R3kINhvR1Oa3YalBAaLfGFSiKRH3+XurAq2vR0D4u4mn9R6QlBrvl5f
 mGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713997694; x=1714602494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJLLyGyNYSIJ2mqOOEmdvcNKVMG9G7qW3Ws/lvIO5iY=;
 b=K8QijT0afD9aeUi1z2WCZCtK3fb/gfgtGY4hNne9WlG7w+/07vDJF7gVdHlk8KytOL
 cj+Rbtn1TZxusJfo4RsYNPadJo2lSKLdIn2g0npBltKbsBYGQftGlkydh2AQGyzyfx20
 qCEAtGQq5i814NTUYD929dm69rDW+PuLUp6IbO9zDCmMTFSXuDYL3Q5tAXoRnpfnBLjd
 4fidv8BT6MZMtdGWVC9c4HD16bWHfpD7h545zdJpKni3HdpH3E8S74wyorbOOQQqBWA7
 Kii6IA22/FGgXDwdP5yBrhA6DP7rY95F3gh7yxCK6ArpCGA8Szbh8ZWzXClKt6Bjqhaz
 30Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5vNdH1yb4UrCO7w7jxqSsZWXVy+Ybg0RBSnYyOk1fPiJyHQfafRlTx8D912d3hcSrR8dU7zfYgZlWbcniPo7uQv2QXbvv0h0ar+yLUv2j
X-Gm-Message-State: AOJu0Yy9AsHTNXqosFqxZxh1j0W+4mi4Cv4RofqQoUHNlrFkWDwdaL98
 8u1FLgtAlXyj6rGU9OQ/WflyXKTHcrO8m/sjZtkRB9GpRbFcM0DicZPldCjK2xjXpTDLZssa5wp
 i6bO6gnw1+Nq75bLaNMQ94UWTxICMq9yh2ERR
X-Google-Smtp-Source: AGHT+IHd7tmiOysDGaUNRDpOFNHo8FgH+ESPpffL4dbRJeqnASsPciIA15vaqfOd1oBkupDoEvg5mHMF7XcWnyQe91o=
X-Received: by 2002:a05:622a:44c3:b0:439:aa2d:40b1 with SMTP id
 kc3-20020a05622a44c300b00439aa2d40b1mr36136qtb.27.1713997693565; Wed, 24 Apr
 2024 15:28:13 -0700 (PDT)
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
From: Doug Anderson <dianders@google.com>
Date: Wed, 24 Apr 2024 15:27:59 -0700
Message-ID: <CAD=FV=U-1A4N5aMeRpx1sC6TsG_hdOOpstzirVrA-=oPoLeg3A@mail.gmail.com>
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

On Wed, Apr 24, 2024 at 2:49=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
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

Ah, so what you're saying is that the big bloat from using the
existing mipi_dsi_dcs_write_seq() is the error printing. That makes
sense. ...and by relying on the caller to provide an error handling
label we can get rid of the overhead and still get the error prints.

Yes, that seems pretty reasonable to me. I guess I'd perhaps make the
error label a parameter to the macro (so it's obvious that the caller
needs to define it) and maybe name it in such a way to make it obvious
the difference between this macro and mipi_dsi_dcs_write_seq().

With that and your measurements then this seems perfectly reasonable
to me and I'm good with fully moving away from the table-based
approach. I'd be happy if you sent a patch for it and happy to review
it.

-Doug
