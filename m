Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D181785F5A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 20:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB8210E095;
	Wed, 23 Aug 2023 18:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6110E095
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 18:13:45 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-570f6c17c55so1172147eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692814425; x=1693419225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Pd+nY7qFI+JVDVu42WXavNzAf+eijnePwIwfDKRrn4=;
 b=JB1GQa3vfyEOHTWHZV2Q95iLFCSKbY/eJHLr7yL66pa86xJ2/eEUI9RY+cMnuLXRNu
 URSG9nCGhlqqB9drf8oEE3O0AHk2mbe+X4Vmj1aAw1H+d81ansAlHDsR1XA1mLj2koeH
 ufsikJvlYHbSxCVoDkKUsMkg1Fm5+OfVnLf3JsQ/yEOeNvz3UJa8uTVInLyGA2EvrIXU
 wxHEfg5t7aJ1bex+6hYc8Op10c3/10aNF8Jo+ikOztHQnaeRZ0pRmT2MtZcxAvoBac7c
 CbhtW0skVnmuh7xpg2vQOIbSQUjkIkXo0QlckRl9M+5L5xURpu0+dqVufH6tjuWXm0gP
 8o7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692814425; x=1693419225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Pd+nY7qFI+JVDVu42WXavNzAf+eijnePwIwfDKRrn4=;
 b=Qhe3B4uHh/aNNzQRaww9Cvn5wGChXPxHGI/QnA3iTw5D32KmrdY3uwZYxwWayq8t33
 xoty8/BjYcaYNJumQC5UJ3rcQwJZUM+b7EJbSllzBfnoxLKAobXUSBNU5AI08z5yoXWB
 Vy6uaR3y5aF9PXsZGizGHoIUAo9JgL72b5HOCU+/iE6WmJIkGJX1Nt3sP+raMk+ht3Dj
 s48oWW6pwWGKgZHNfztF5fXBERzvxLOFi9fejPSo7fvOb24vnfp6ISJFbct5aK5hApI0
 f1ngHPybOerOzFrIbi2g8RyV11NVaQOLWl2AvgQIvPaurURAJekOH3+TUEWNdWRIHraQ
 WfjQ==
X-Gm-Message-State: AOJu0YyyL0UaKt/WKyLCWwPBKSWVTg1XlOQJ8mQm25DU33jLvaRHpR2U
 PHCXs2qMLnCMj3UPqUmDt2HjstwDVupUp5QD6+c=
X-Google-Smtp-Source: AGHT+IE+37tPaVddj+DiWfkLmSyxnc+h2o1Iej1yxesDIC0ATIw03wlLu3SeiY4j4g8bQX80VAJ+BPM127ysjehW7O4=
X-Received: by 2002:a4a:d216:0:b0:56c:cd04:9083 with SMTP id
 c22-20020a4ad216000000b0056ccd049083mr108834oos.1.1692814424826; Wed, 23 Aug
 2023 11:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
 <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
In-Reply-To: <CAD=FV=Uwg9AuKuKpUAbfnzfm5wTRtYqhg5f24Y7cPSDugWz1wg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Aug 2023 21:13:08 +0300
Message-ID: <CAHp75VchMj7hwOJ6oO=mRx7vnn9XUeT_XXsaCJc7hBfwh1m9nw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
To: Doug Anderson <dianders@chromium.org>
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
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 8:14=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Wed, Aug 23, 2023 at 9:53=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Aug 23, 2023 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:

...

> > No. Please, do not remove the I2C ID table. It had already been
> > discussed a few years ago.
>
> If you really want the table kept then it's no skin off my teeth. I
> just happened to see that nobody was responding to the patch and I was
> trying to be helpful. My analysis above showed that the I2C table must
> not be used, but if you feel strongly that we need to add code then
> feel free to provide a Reviewed-by tag to Biju's patch! :-)

Have you seen my reply to my reply?
I agree with your above analysis.

--=20
With Best Regards,
Andy Shevchenko
