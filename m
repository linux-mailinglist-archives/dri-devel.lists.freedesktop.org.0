Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B75AE1BA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8812010E5CD;
	Tue,  6 Sep 2022 07:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DC810E5CD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:58:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qh18so21302076ejb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=G5xMT6aDNv4kW7DoRuL08vNOs1PAIlSGM76dCe+/XnA=;
 b=IqR3y18Cx1qIwYw4UCiCTVh/G1F5irxJGmeXs1tScFvtbsL6xEpJxG2G/X6Gl4lhIj
 +2KrmUt+oRnZv2in1enq/dW/oGz8TuVY6qP7kLHjRjLDgIUAJy0ndbbIiaJi6ZNadtxI
 y5EvFZkZuwL0e0v6pQC5u87gcLh52hNoFtGTG4s+x9NTpfmdykE+j8OluBNOTg5w6EEb
 CAj9vrObxn37Woc0hrBx34RCimwLSIK7kEqX+b1ptJmgvYmBXXMYLYD3rfzCmNogiGEn
 rbepDzapjt3YfkGRcTXwVovnVtdeUw/Avi2dszJ13t45IfJeQ+Am19GtI6oJjAoPrywZ
 o8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=G5xMT6aDNv4kW7DoRuL08vNOs1PAIlSGM76dCe+/XnA=;
 b=TYqSloSOL+fy1gva9+STQYGuG56HWp8xcQH8/ZHiVEk4h/0bypIalQnGbWNaHZp6C9
 LdNc3THmyraLETVmTxSmIm6V+voAUwVq+5IolalZiMkzfLlZv28VHQU4RrG41ckU4awb
 +7LY44ytJRExrUeHscj+YUg8vV/X4Cv0mLCJMqOeSBNknaJh2PwfU77dcJ86unEdvZ6c
 tf5J5rMqX1wdNxdv7SBJ8FXeSorJo2xF7Eo1LFzm+NfEAG1dEFDbuXdRDq8m5zCRswv+
 gURpVtIwXlE+2bvT6t2g87mxcuuWL4tGnBKnmh5wXEvoKxPmeZNzyHZ7hMQ3ZN7ts97+
 qbFA==
X-Gm-Message-State: ACgBeo0vatpex4l/YfXf1RXQfyiV/X0CGNXuaocDPlZwt7RGjJVbNymH
 QyP4ZPFbOS58bOFzhzJrBo9UXfNpNOEqdf92lbGypPZS6atgCw==
X-Google-Smtp-Source: AA6agR5YnY0EzdQxo8Pq6IyzStk5Of82NqC2kb+QzscEVqwyjmybojqR67VAd+bpi6dSl5otBltC+plapAULeuYVO+o=
X-Received: by 2002:a17:907:7dac:b0:739:8df9:3c16 with SMTP id
 oz44-20020a1709077dac00b007398df93c16mr37890355ejc.9.1662451137307; Tue, 06
 Sep 2022 00:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
 <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com>
 <OS0PR01MB5922EE3F6CDD827919A7763E867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922EE3F6CDD827919A7763E867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 6 Sep 2022 09:58:45 +0200
Message-ID: <CAJiuCcd7upgT6vQWHos-X1-89+Z-5xxDe2SMCdC2=_LgZaVMiw@mail.gmail.com>
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

Hi Biju,

On Tue, 6 Sept 2022 at 08:42, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Clement,
>
> >
> > Hi,
> >
> > On Mon, 5 Sept 2022 at 20:17, Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > >
> > > Hi,
> > >
> > > Thanks for the patch.
> > >
> > > > Subject: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the
> > > > recommended one to configure and enable regulator
> > > >
> > > > devm_pm_opp_set_regulators() doesn't enable regulator, which make
> > > > regulator framework switching it off during regulator_late_cleanup(=
).
> > >
> > > In that case, why not regulator_get()for Dynamic regulator(non fixed
> > > regulator)??
> >
> > Sorry I don't understand, what do you mean?
>
> Normally we need to turn on regulator and clock only when needed.
> I am not sure with your new code, will make it always on and
> drains the power unnecessarily and does it set lower opp or higher
> opp at the start??

The code doesn't make it always on, it makes it how it should be at
the recommended OPP which is the "start point".

If the recommended OPP says to switch off the regulator then it will.

>
> Compared to the fixed regulator, you have voltage regulator to
> control that is the difference between my environment and
> Your environment.
>
> I am not sure any other SoC is using voltage regulator??
> If yes, thenthere should be some bug or some difference in HW
> which is giving different behaviour??
>
> If you are the first one using voltage regulator with mali gpu,
> Then Your implementation may be correct, as you have proper
> HW to check.

The issue is that my regulator is not marked as "always-on", if no OPP
is called before regulator_late_cleanup() then nobody sets the
regulator_enable() and the regulator is switched off, which makes my
board hang.

Like Viresh recommends I will send an update with more details in the
commit log.

Regards,
Clement


>
> >
> > >
> > > >
> > > > Call dev_pm_opp_set_opp() with the recommend OPP in
> > > > panfrost_devfreq_init() to enable the regulator and avoid any switc=
h
> > > > off by regulator_late_cleanup().
> > > >
> > > > Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > index 5110cd9b2425..67b242407156 100644
> > > > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > > > @@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct
> > > > panfrost_device
> > > > *pfdev)
> > > >               return PTR_ERR(opp);
> > > >
> > > >       panfrost_devfreq_profile.initial_freq =3D cur_freq;
> > > > +
> > > > +     /* Setup and enable regulator */
> > > > +     ret =3D dev_pm_opp_set_opp(dev, opp);
> > > > +     if (ret) {
> > > > +             DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> > > > +             return ret;
> > > > +     }
> > >
> > >
> > > FYI,
> > > On RZ/G2L mali gpu, we have fixed regulator and I was able to do GPU
> > > OPP transition without any issues previously.
> >
> > rzg2l-smarc-som.dtsi uses regulator reg_1p1v; which is marked as
> > regulator-always-on; that's why
> > regulator_late_cleanup() doesn't switch it off.
>
> Yes that is correct. It is fixed regulator and always on.
> We control only frequency.
>
> Cheers,
> Biju
>
> >
> > >
> > > root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
> > >      From  :   To
> > >            :  50000000  62500000 100000000 125000000 200000000
> > 250000000 400000000 500000000   time(ms)
> > > *  50000000:         0         0         0         0         0
> > 0         0         1       144
> > >    62500000:         0         0         0         0         0
> > 0         0         0         0
> > >   100000000:         0         0         0         0         0
> > 0         0         9       524
> > >   125000000:         0         0         9         0         0
> > 0         0         3      2544
> > >   200000000:         0         0         0        11         0
> > 0         0        46      3304
> > >   250000000:         1         0         0         0        33
> > 0         0         0      7496
> > >   400000000:         0         0         0         0        16
> > 19         0         0      2024
> > >   500000000:         1         0         0         1         8
> > 15        35         0      4032
> > > Total transition : 208
> > >
> > > Cheers,
> > > Biju
> > >
