Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79D5ADF72
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6AA10E565;
	Tue,  6 Sep 2022 06:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B928F10E4D0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:39:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w2so12553699edc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=7sK3Pxg5lI33PaTu+416/SIw+tV3vaPUu4gPNzWPobI=;
 b=NH4qlg6QZbeqoZj2Tm2AcMxa8dQt6DIOCmBbcpO/afGOmdkHJcxG6jxB6WcHA2zgZr
 idzdlVtYYBmnO5OjykgPHGjqJguRfUJ8AJ6wuCKJwhP2kPNBb1vbriSXXdqvRGzgOK+x
 7QRwxQ2ZxFvWz+99M7MaMNy07R4c5Fk1fLBQ8J5h2tTPuIU5HkUIND5fT2SzEfFizdj0
 j1qedhwfOykL7oofHK38q0xsLgxlDMDSkanFA5SzEGZZX56RhDeE3JT8Cv1cMeoPxYbE
 wwtggQukF1Vi9dumdIfhYW5DEjfh+LWhGrMoQIBATY0KhSzp73lDSRCb714AKRbHeeMJ
 09+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7sK3Pxg5lI33PaTu+416/SIw+tV3vaPUu4gPNzWPobI=;
 b=o+NIBGOmQ2Sv2DaMN87zLF4SAoMY4OBkh+ITm8HsI1yenVQZ9sz94h+yu1Sw9vJkbF
 tcT7mPjzhkRhRsr85EFL5vV+KJrZgWW2lHOQDNOibh1JZunYx0BDUsra3G4nTvTVUhbY
 qzB/83n4IgenbQWYFoRaNM733lxGv9369/AF5ueEOwz14tQuQzFt2X5pjYB9LOze90ob
 wRbRiMax4cjhtQ1Ah9ILGANQOzf3rW17Z5JvRT3ugmPD4yyAWbRkom0wErb9oos9iIxr
 ggdbgJ97AEgZYYstl+sekiSXP88ZTO9dl1MWj41aUErL0boyn7RWuufKMVmyQLEPcgG8
 tGLw==
X-Gm-Message-State: ACgBeo0Lo0vUkwkGAuCQ7XmiJhP1IK/nqN4HrgsdC7CsQ49jz0lOdQ+m
 OJ5IRlD0U6f0ec6G3sL38j4gP2uDYfYAOIJ/6UI=
X-Google-Smtp-Source: AA6agR6gCIxLGxghgPAj+EP0DXZOoyA9fExHCpxZBIF9zuDXx572eXiJijGmbmWkD3eqAnsSwuyri4I9kFJQughdEyU=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr3781906edq.140.1662406781082; Mon, 05
 Sep 2022 12:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
 <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 5 Sep 2022 21:39:29 +0200
Message-ID: <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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

On Mon, 5 Sept 2022 at 20:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi,
>
> Thanks for the patch.
>
> > Subject: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommend=
ed
> > one to configure and enable regulator
> >
> > devm_pm_opp_set_regulators() doesn't enable regulator, which make
> > regulator framework switching it off during regulator_late_cleanup().
>
> In that case, why not regulator_get()for
> Dynamic regulator(non fixed regulator)??

Sorry I don't understand, what do you mean?

>
> >
> > Call dev_pm_opp_set_opp() with the recommend OPP in
> > panfrost_devfreq_init() to enable the regulator and avoid any switch of=
f
> > by regulator_late_cleanup().
> >
> > Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > index 5110cd9b2425..67b242407156 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > @@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct panfrost_device
> > *pfdev)
> >               return PTR_ERR(opp);
> >
> >       panfrost_devfreq_profile.initial_freq =3D cur_freq;
> > +
> > +     /* Setup and enable regulator */
> > +     ret =3D dev_pm_opp_set_opp(dev, opp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> > +             return ret;
> > +     }
>
>
> FYI,
> On RZ/G2L mali gpu, we have fixed regulator and
> I was able to do GPU OPP transition without any issues previously.

rzg2l-smarc-som.dtsi uses regulator reg_1p1v;
which is marked as regulator-always-on; that's why
regulator_late_cleanup() doesn't switch it off.

Regards,
Clement

>
> root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
>      From  :   To
>            :  50000000  62500000 100000000 125000000 200000000 250000000 =
400000000 500000000   time(ms)
> *  50000000:         0         0         0         0         0         0 =
        0         1       144
>    62500000:         0         0         0         0         0         0 =
        0         0         0
>   100000000:         0         0         0         0         0         0 =
        0         9       524
>   125000000:         0         0         9         0         0         0 =
        0         3      2544
>   200000000:         0         0         0        11         0         0 =
        0        46      3304
>   250000000:         1         0         0         0        33         0 =
        0         0      7496
>   400000000:         0         0         0         0        16        19 =
        0         0      2024
>   500000000:         1         0         0         1         8        15 =
       35         0      4032
> Total transition : 208
>
> Cheers,
> Biju
>
