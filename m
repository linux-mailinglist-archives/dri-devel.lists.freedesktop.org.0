Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1BB711156
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457C010E6CD;
	Thu, 25 May 2023 16:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D33410E6D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:50:13 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-561b7729a12so11252777b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685033411; x=1687625411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKef1dTnXLWEPcPkzPdiI1P0Q5fDcYjlFcAukfwXA8Q=;
 b=JQ3gKwBJPCELWs0cZP2bFGQ/g511hF6dJ2r6hGseiXOm6Zdz9IE8/Ohx/k5ZyyBvkF
 s/MATGHuOtOo2ExZ8nc6Z/lbGbtnl1hWQwEuoPDT+4rVcYb4IsuL4DHu9wRJs/uZASDD
 bofTWMRMT0NdNZ6Y06VBudW8Rt2zWY4rnmKC7rvmzOy6Gz2F6v4hVIlniF914rs9ynU0
 swmM3sMcyhJHJRAW8vfWcf4LWrO6VEs5Sgz6wTzuJaZ1KuKOnGXgqU0+00juc1RZf/6I
 FLQXJz08PjsvJhp4H30DcsoKjUhEtfv9KwsQR4ZnDXyPmsMzt2di80CPyXt9WudNQd8z
 LQEg==
X-Gm-Message-State: AC+VfDzj5l8u+cQ3brxBPo5Vsyi2Efz20dIFUJiWlRPVRnnStixNkhOY
 5ySDT7RnrCl/0M31uCqcL6ac0nvL4CiB2Q==
X-Google-Smtp-Source: ACHHUZ5GwhG+815n+XrjX0VPY6F8LICyoPJrDIHsZkhSljPba4UcKenx3AZLBhw3QciA0aGilp73MA==
X-Received: by 2002:a25:882:0:b0:ba8:4054:465d with SMTP id
 124-20020a250882000000b00ba84054465dmr3529744ybi.14.1685033411391; 
 Thu, 25 May 2023 09:50:11 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 w15-20020a05690204ef00b00babcd913630sm424172ybs.3.2023.05.25.09.50.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 09:50:09 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-bacf7060678so579273276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:50:08 -0700 (PDT)
X-Received: by 2002:a25:5cd:0:b0:ba8:b425:6bf2 with SMTP id
 196-20020a2505cd000000b00ba8b4256bf2mr4131400ybf.20.1685033408372; Thu, 25
 May 2023 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 May 2023 18:49:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkZe+v5-MFXrVdUsqYnLuWE1OfuFCq7xyzT=PtjSFw8Q@mail.gmail.com>
Message-ID: <CAMuHMdUkZe+v5-MFXrVdUsqYnLuWE1OfuFCq7xyzT=PtjSFw8Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Antonio Borneo <antonio.borneo@foss.st.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 linux-renesas-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 12:19=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Renesas PMIC RAA215300 exposes two separate i2c devices, one for the main
> device and another for rtc device.
>
> Enhance i2c_new_ancillary_device() to instantiate a real device.
> (eg: Instantiate rtc device from PMIC driver)
>
> Added helper function __i2c_new_dummy_device to share the code
> between i2c_new_dummy_device and i2c_new_ancillary_device().
>
> Also added helper function __i2c_new_client_device() to pass parent dev
> parameter, so that the ancillary device can assign its parent during
> creation.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Replaced parameter dev->parent in __i2c_new_client_device() and
>    __i2c_new_dummy_device().
>  * Improved error message in __i2c_new_dummy_device() by printing device =
name.
>  * Updated comment for ancillary's device parent
>  * Dropped aux_device_name check in i2c_new_ancillary_device().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
