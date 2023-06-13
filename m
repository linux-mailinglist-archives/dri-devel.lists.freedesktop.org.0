Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E872DABC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E840A10E33A;
	Tue, 13 Jun 2023 07:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6CC10E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:25:30 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-56d2ac0d990so27505527b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686641129; x=1689233129;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbgcH3UhtSvko8Hm69Jv27j6Hqzm3qXJXgS6ndTlmig=;
 b=TgdH3dCUR/+QLXkZ1kJFPjiUzFNBkChm3isAfZwWEnbap8B1BnsPlA+dgCg9JnzTKj
 FNQpLAzbAZPzfbuPDv1vrJ3PDNI09+rkgA9x9UHHf2RMU2bCsrxO2XK1JsO2IuLWBWT/
 dHFDWn/1GJ0SL+AUY9MnJootD7lBfbS7VTKeWBUnHh1IY5F0h7yAQ0tQCxTUxvgg6uEA
 cGUSoUAEe6QNTZaC1c48v2IH10jrseq5WGLf4SgH+76uN0OM1RYNNXsNE0ViMUBybSGK
 JkKZSY864nqFHVB+exW7OEWsw12GI1cudz/w/mg0Z7JCH+Brzi+C+c5zM8caDsv78s52
 Gu5Q==
X-Gm-Message-State: AC+VfDxTQRR3rb5c7CasWWhaol5VhRg9b7+vYoxfGZs0r8C3G61i9Md/
 tDrJNYgaWhHHwcF8OtlsbycpmSVxUhiSzg==
X-Google-Smtp-Source: ACHHUZ77ju7c27oglkIR+L5klBbpjXLuRq/k+mpD5O5hj663WsIxh9Z5lo092iyroHdu244Jn8vu7w==
X-Received: by 2002:a0d:d956:0:b0:561:9bcc:6c81 with SMTP id
 b83-20020a0dd956000000b005619bcc6c81mr674444ywe.24.1686641129082; 
 Tue, 13 Jun 2023 00:25:29 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0de402000000b00545a08184fdsm1540876ywe.141.2023.06.13.00.25.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 00:25:28 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so9052839276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:25:28 -0700 (PDT)
X-Received: by 2002:a25:90e:0:b0:ba9:b304:107b with SMTP id
 14-20020a25090e000000b00ba9b304107bmr886752ybj.27.1686641128031; Tue, 13 Jun
 2023 00:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
In-Reply-To: <ZIeDcVcfxfcMx/BP@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2023 09:25:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
Message-ID: <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To: Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Antonio Borneo <antonio.borneo@foss.st.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

Hi Wolfram,

On Mon, Jun 12, 2023 at 10:43=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrot=
e:
> > Perhaps we should first think through what an ancillary device really
> > is.  My understanding is that it is used to talk to secondary addresses
> > of a multi-address I2C slave device.
>
> As I mentioned somewhere before, this is not the case. Ancillary devices
> are when one *driver* handles more than one address. Everything else has
> been handled differently in the past (for  all the uses I am aware of).
>
> Yet, I have another idea which is so simple that I wonder if it maybe
> has already been discussed so far?
>
> * have two regs in the bindings
> * use the second reg with i2c_new_client_device to instantiate the
>   RTC sibling. 'struct i2c_board_info', which is one parameter, should
>   have enough options to pass data, e.g it has a software_node.
>
> Should work or did I miss something here?

That should work, mostly (i2c_new_dummy_device() also calls
i2c_new_client_device()).  And as i2c_board_info has an of_node
member (something I had missed before!), the new I2C device
can access the clocks in the DT node using the standard way.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
