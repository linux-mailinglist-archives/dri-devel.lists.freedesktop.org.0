Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE4786C76
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 12:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DDA10E519;
	Thu, 24 Aug 2023 09:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2666A10E519
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 09:59:56 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1c4dd644cf8so4395601fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692871195; x=1693475995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aA6C8SFUJVAZifyUeFXfLFXlX8WoF+XRY6UYD5KTo8=;
 b=DS0bTfg6BS/kfbsxitSQlwLHW8R2C6ew2IPlFVpEGuMz7rYBdJNrNz/WTLIY9cD5gs
 mog1z0cWD6Oxm2mMLsCVMdjQfNOfynIFIUvBvNhaSXCZo3uXZhorWUJ2udDQGqBM6PnA
 6EqgXUotPZjq/H/PTZKYZnOdhkGc1GgfwrgoS9Ep+uNNCgRfq6Vq0cPwJiUX19pguzPe
 hmQ4qSn01ERpLomFk7Urk+kPVuaNdRc0DUQwmAy851DivHOxwJrV27Gz8OzBWPkebqS8
 +q+1zRgAl2PDTjOPW9HfIMr26KKSwSpIzu23f/s1zNzEeNu94Vfcw6OShT1VCmkMhwDj
 egnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692871195; x=1693475995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7aA6C8SFUJVAZifyUeFXfLFXlX8WoF+XRY6UYD5KTo8=;
 b=WgWDlexcl56TONfh/zpWa+QMei1/la9hgRB1brOfFlejLVrkX2kcnNOZjZhOq+j1Ke
 pVqrvByXQcr1tsaj/aBJ6CzP85Mm75kMaWwIyaVsZRe4UEr+zUQgOdAO4fTIpQPtolT5
 4Z5BDLm0KAiunX/aYOK7ChD4f3v93JT55MBgWo2kdmLyDGi5INk/ED1bt3ahkX99mpDr
 S1VFDNOzA+9/mnNyj2ManeY4HP1dPAyoKFc2YNtPSbriCjQdGuPc0Q6d0I87QwkdfREc
 AtcOZ7g1nSP+thposmJE5aJWJ7abfatFV2ceKOPOYjdQwAv77zz8D3bzi/6GQDkAbqhp
 gMWw==
X-Gm-Message-State: AOJu0YzjGEG4sPkWHqj6ptKfYOnjqw9BiOISLcdCkKLTsK7pPMuFZkHi
 Al5oqg3rWHuUsQORX8ldvthbFT6aIOVdiNGgbRs=
X-Google-Smtp-Source: AGHT+IF/MMua9KNx318MWjDbEeXx0TKoPkLZpzb0TX3RNLV2py5bYh7ErX9ZTwsFRh3daYGlAx4ftH1X94KqSJZLaz8=
X-Received: by 2002:a05:6871:551:b0:1c0:a784:cf7e with SMTP id
 t17-20020a056871055100b001c0a784cf7emr21206970oal.51.1692871195368; Thu, 24
 Aug 2023 02:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
 <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
 <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
In-Reply-To: <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Aug 2023 12:59:19 +0300
Message-ID: <CAHp75Vf-KLMGL-Exo5-+-AC51KhW+YOJSr7GpqHUG1WzZ0nkvQ@mail.gmail.com>
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

On Wed, Aug 23, 2023 at 9:39=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Wed, Aug 23, 2023 at 10:10=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > > No. Please, do not remove the I2C ID table. It had already been
> > > discussed a few years ago.
> > >
> > > > Yes, it make sense, as it saves some memory
> >
> > Okay, reading code a bit, it seems that it won't work with purely i2c
> > ID matching.
>
> OK, so you are in agreement that it would be OK to drop the I2C ID table?

Yes.

> > So the question here is "Do we want to allow enumeration via sysfs or n=
ot?"
>
> Is there some pressing need for it? If not, I guess I'd tend to wait
> until someone needs this support before adding it.

Depends. Is this device anyhow useful IRL as standalone if
instantiated via sysfs? I think it may be not, so it's unlikely we
want to have sysfs option for it.

--=20
With Best Regards,
Andy Shevchenko
