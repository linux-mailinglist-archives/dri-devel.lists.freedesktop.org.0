Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BA75AE1E4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADCD10E5DB;
	Tue,  6 Sep 2022 08:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67F910E5D2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 08:08:31 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id se27so21341036ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 01:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ixcTJEmX6ojSJFpffdmxDEeT09//71awlYUYMTCkQ2k=;
 b=ZEw2t8eu/IGDJPWWS2O9AIx5J+sVDehAoSc0jwGGUi62VfOxEv0EBn/OlitZ+YCeRf
 PR7LKeKeVrdvAjyp8thX5wqf3UHxdpDl/5T0XW+lG1qku5rK3Hmmkzjsm47nUXSsg7+J
 8Q8z8iDRqSYxh3qlGRknUNhrP+SLOPhXZYUqTDAd5ceCxMn3My+V9VqLUS81gaE+cIXs
 9GfSR3XtxUG6oomZZeXFRlN68cuesq9Zl6Ovhe3SK7WEcHMxmTFlxs4Xjq5ADtAWyUOX
 oVY5p05K7+V5XUbz+R/MJUb0BWZLhdSpttHWjB9fbbrIPyoqqov5dyuatCRJqfNPHBKQ
 mU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ixcTJEmX6ojSJFpffdmxDEeT09//71awlYUYMTCkQ2k=;
 b=v+OXb6yFXViH2p87soBDTuv7bBXP13h5mqVW46k/Nvtelv3iXsV4cVGRZMV0AZwv1h
 JQ4H8pb+3LeBitzuDF+TumBJfCBKd+kmAdcDbshUHs2LDujIItiFPUOjdUJh264vuoJx
 wAir8GgRw3arfzuSPGZtVJU/LDhF86thHWWEoTIslDEWJWVEv/dhdm7uEjQg9WQdD/w0
 XOyB+3qMYfOwEQnWTn0TLrs6SftYWiV1rkv1ZKsvPcArAsGhsPxx3Ll027auR/DCQVVK
 TxBE/Qb9zlOmwFtQHcJVKrghZ8AyVYKKFwhN/40IpEbbG0ILlg2EcGnOAcJjOl/O1kD7
 rqog==
X-Gm-Message-State: ACgBeo0cbMTIrrUzvGg+7OgdZPHQGLGYSHq8HSg71L9kXTBUQs3MZGK6
 25t91bUhIgGfWMQ3NFkw9B76ATPc02kQGKJVstE=
X-Google-Smtp-Source: AA6agR7l2FBAWvpWs6dGX+cL9sjarYnZLQUBlXz3+1QQvQp7fIsevP7hAeerxFCrUwKA5g5IT5oDby9FydR2xo3Y+I4=
X-Received: by 2002:a17:906:8450:b0:741:5b1b:5c7f with SMTP id
 e16-20020a170906845000b007415b1b5c7fmr30767205ejy.766.1662451709902; Tue, 06
 Sep 2022 01:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
 <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com>
 <OS0PR01MB5922EE3F6CDD827919A7763E867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAJiuCcd7upgT6vQWHos-X1-89+Z-5xxDe2SMCdC2=_LgZaVMiw@mail.gmail.com>
 <OS0PR01MB5922240073630A409D67ED03867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922240073630A409D67ED03867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 6 Sep 2022 10:08:18 +0200
Message-ID: <CAJiuCcddO9m3L2--rycO9TVtoELy24OMb9NRdpin2mbokm=Hog@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Steven Price <steven.price@arm.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 6 Sept 2022 at 10:06, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Clement,
>
> > Subject: Re: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the
> > recommended one to configure and enable regulator
> >
> > Hi Biju,
> >
> > On Tue, 6 Sept 2022 at 08:42, Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > >
> > > Hi Clement,
> > >
> > > >
> > > > Hi,
> > > >
> > > > On Mon, 5 Sept 2022 at 20:17, Biju Das <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Thanks for the patch.
> > > > >
> > > > > > Subject: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the
> > > > > > recommended one to configure and enable regulator
> > > > > >
> > > > > > devm_pm_opp_set_regulators() doesn't enable regulator, which
> > > > > > make regulator framework switching it off during
> > regulator_late_cleanup().
> > > > >
> > > > > In that case, why not regulator_get()for Dynamic regulator(non
> > > > > fixed regulator)??
> > > >
> > > > Sorry I don't understand, what do you mean?
> > >
> > > Normally we need to turn on regulator and clock only when needed.
> > > I am not sure with your new code, will make it always on and drains
> > > the power unnecessarily and does it set lower opp or higher opp at th=
e
> > > start??
> >
> > The code doesn't make it always on, it makes it how it should be at the
> > recommended OPP which is the "start point".
> >
> > If the recommended OPP says to switch off the regulator then it will.
> >
> > >
> > > Compared to the fixed regulator, you have voltage regulator to contro=
l
> > > that is the difference between my environment and Your environment.
> > >
> > > I am not sure any other SoC is using voltage regulator??
> > > If yes, thenthere should be some bug or some difference in HW which i=
s
> > > giving different behaviour??
> > >
> > > If you are the first one using voltage regulator with mali gpu, Then
> > > Your implementation may be correct, as you have proper HW to check.
> >
> > The issue is that my regulator is not marked as "always-on", if no OPP =
is
> > called before regulator_late_cleanup() then nobody sets the
> > regulator_enable() and the regulator is switched off, which makes my
> > board hang.
>
> Cool, From your testing looks like no one tested this feature with
> mali GPU on mainline??

Or no one without always-on.

Clement

>
> Cheers,
> Biju
>
>
> >
> > Like Viresh recommends I will send an update with more details in the
> > commit log.
> >
> > Regards,
> > Clement
> >
> >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > Call dev_pm_opp_set_opp() with the recommend OPP in
> > > > > > panfrost_devfreq_init() to enable the regulator and avoid any
> > > > > > switch off by regulator_late_cleanup().
> > > > > >
> > > > > > Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
> > > > > >  1 file changed, 8 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > > > b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > > > index 5110cd9b2425..67b242407156 100644
> > > > > > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > > > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > > > @@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct
> > > > > > panfrost_device
> > > > > > *pfdev)
> > > > > >               return PTR_ERR(opp);
> > > > > >
> > > > > >       panfrost_devfreq_profile.initial_freq =3D cur_freq;
> > > > > > +
> > > > > > +     /* Setup and enable regulator */
> > > > > > +     ret =3D dev_pm_opp_set_opp(dev, opp);
> > > > > > +     if (ret) {
> > > > > > +             DRM_DEV_ERROR(dev, "Couldn't set recommended
> > OPP\n");
> > > > > > +             return ret;
> > > > > > +     }
> > > > >
> > > > >
> > > > > FYI,
> > > > > On RZ/G2L mali gpu, we have fixed regulator and I was able to do
> > > > > GPU OPP transition without any issues previously.
> > > >
> > > > rzg2l-smarc-som.dtsi uses regulator reg_1p1v; which is marked as
> > > > regulator-always-on; that's why
> > > > regulator_late_cleanup() doesn't switch it off.
> > >
> > > Yes that is correct. It is fixed regulator and always on.
> > > We control only frequency.
> > >
> > > Cheers,
> > > Biju
> > >
> > > >
> > > > >
> > > > > root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_sta=
t
> > > > >      From  :   To
> > > > >            :  50000000  62500000 100000000 125000000 200000000
> > > > 250000000 400000000 500000000   time(ms)
> > > > > *  50000000:         0         0         0         0         0
> > > > 0         0         1       144
> > > > >    62500000:         0         0         0         0         0
> > > > 0         0         0         0
> > > > >   100000000:         0         0         0         0         0
> > > > 0         0         9       524
> > > > >   125000000:         0         0         9         0         0
> > > > 0         0         3      2544
> > > > >   200000000:         0         0         0        11         0
> > > > 0         0        46      3304
> > > > >   250000000:         1         0         0         0        33
> > > > 0         0         0      7496
> > > > >   400000000:         0         0         0         0        16
> > > > 19         0         0      2024
> > > > >   500000000:         1         0         0         1         8
> > > > 15        35         0      4032
> > > > > Total transition : 208
> > > > >
> > > > > Cheers,
> > > > > Biju
> > > > >
