Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297903690E8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 13:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6076EB70;
	Fri, 23 Apr 2021 11:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA98A6EB70
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 11:13:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id r12so73342479ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YHPMnwS1dURi5l1HSs6lXsnAbBpe7PxogTJiMBTEHvw=;
 b=oEpBq1Fuo/AIN23HrnGCnNKX5gSh7n0HPo0mODmYYtxzr9Ug6D8ohXWugDTsei9Gdz
 iCgi5Q+CjmdJ4CV+di6aM6JAitf4mEUPccE8ISW87TwaJYu8Mtsiqttmr+cBOQoUY6CT
 mHVJuLLG6wmiP/DRq0xg1NOtEHPoSlxJD0uQg/AWRiS+Kw7xVuJ5kuoZYDrp/01G57+K
 1l8Tz3/pFGyCVageS2m6O29dxm+gr8XR+Akfn6WA97Y4OTG5rLhAB39NQelwkwE75Zov
 QSSMbHwrBBkTjWiHdlR4BlQ3lKZRENOMC85hiaQqFtT22BoEm7ET3sZC1dIVHbdduiz+
 CXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YHPMnwS1dURi5l1HSs6lXsnAbBpe7PxogTJiMBTEHvw=;
 b=QIOa9v3DtG2hQ6khKxKt5Iuo7/Fi1B0liJDLYMEJbnYygDVIbS4DiaHETdQcR5SOqa
 qZz6WnbZBdxGD0XVyUZ7Gu1hmx3SPatZ9KAKn7Zy0T9UN8k6QVm8U/oopwlC8iVQmvdG
 HS421boAXfRGg4Bwi8fxrqTcMpMT0rT2stPZxKQcwDzaer+LOXmzULZqIbdwXBKMGLby
 SPJtC9zXsA4c9HA52RECZxaTOaJFUtqr7D2kMbKPz/O7GisIzzH4rYL6zRNDRVt53fY8
 5S1jKf4icFeYcCh2P/jBySRs9eT4Tn0gXuHDe1yuGZ0oWMwdCYtStQTPuBPHFUiCLmPR
 IUdQ==
X-Gm-Message-State: AOAM531upxW5q13iPyf8t03DMMIv1ufadLh6ecyY+biU+Vce+Hw3oxnZ
 8uOfBMd1b6tHdO/fK/Y2axU=
X-Google-Smtp-Source: ABdhPJzZgn3hc4mNrhwnJScJOT2r7t49AdvgebRp7aJZ9kjR/Un/7sPJtoB3t7RWb5jaaIofvaQ1aw==
X-Received: by 2002:a17:906:c297:: with SMTP id
 r23mr3731783ejz.48.1619176414380; 
 Fri, 23 Apr 2021 04:13:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g12sm4521920edr.83.2021.04.23.04.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 04:13:32 -0700 (PDT)
Date: Fri, 23 Apr 2021 13:14:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
Message-ID: <YIKsDtjcIHGNvW0u@orome.fritz.box>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <20210326000907.GA1965415@robh.at.kernel.org>
 <CAD=FV=XqG8oH5HCttKSNYJV2eHwLxq-tm1C+UFLn+cAHUrBaHg@mail.gmail.com>
 <CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: Rob Clark <robdclark@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0759489297=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0759489297==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pwwIyjYU7zT6YQlm"
Content-Disposition: inline


--pwwIyjYU7zT6YQlm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 03:08:48PM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Mon, Mar 29, 2021 at 9:25 AM Doug Anderson <dianders@chromium.org> wro=
te:
> >
> > Hi,
> >
> > On Thu, Mar 25, 2021 at 5:09 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > > pile of eDP panels. At the moment I'm told that the list might incl=
ude:
> > > > - KD KD116N21-30NV-A010
> > > > - KD KD116N09-30NH-A016
> > > > - Starry 2081116HHD028001-51D
> > > > - Sharp LQ116M1JW10
> > > >
> > > > It should be noted that while the EDID programmed in the first 3
> > > > panels indicates that they should run with exactly the same timing =
(to
> > > > keep things simple), the 4th panel not only needs different timing =
but
> > > > has a different resolution.
> > > >
> > > > As is true in general with eDP panels, we can figure out which panel
> > > > we have and all the info needed to drive its pixel clock by reading
> > > > the EDID. However, we can do this only after we've powered the panel
> > > > on. Powering on the panels requires following the timing diagram in
> > > > each panel's datasheet which specifies delays between certain
> > > > actions. This means that, while we can be quite dynamic about handl=
ing
> > > > things we can't just totally skip out on describing the panel like =
we
> > > > could do if it was connected to an external-facing DP port.
> > >
> > > Is this a 'standard' eDP connector? AFAICT, there does seem to be
> > > such a thing.
> >
> > To answer this one: there's not any "standard" physical plug as far as
> > I can tell. There's a connector on the board side for the LCD that has
> > a whole hodgepodge of signals on it. Maybe USB for a camera. Some
> > power signals. Maybe a PWM for a backlight. Maybe some DMIC signals.
> > eDP signals which might be anywhere from 1 to 4 lanes. HPD (which is
> > really a "panel ready" signal for eDP). The size / style of connector
> > and the exact set of signals (and their ordering) is board specific.
> > You then get a board-specific cable that splits things out. Some might
> > go to a camera/MIC sub board. Some go to the panel and hook onto a
> > panel-specific connector which has pin count and orderings defined by
> > that panel. :-P
> >
> >
> > > I've said in the past I'd be okay with a edp-connector
> > > node. If that needs just the "HPD absent delay" property, I think that
> > > would be okay. It's just a never ending stream of new properties with
> > > each new panel that I don't want to see.
> >
> > Thinking about this we'd need at least one other property right now
> > which is an enable delay. Specifically at least one panel I've
> > supported recently lied about HPD for a short period after bootup.
> > Specifically see commit 667d73d72f31 ("drm: panel: simple: Delay HPD
> > checking on boe_nv133fhm_n61 for 15 ms"). ...and, of course, the
> > existing power supply / enable signals that "simple-panel" already
> > has.
> >
> > Also: if we weren't going to add the other delay properties in the
> > device tree, we'd have to add the code right away that used the EDID
> > to set other delays. That wouldn't be the end of the world, but it
> > would be code to write.
> >
> >
> > One last thought to add: I've looked at ~10 panels specs recently.
> > Though they are all a little different from each other, I will say
> > that almost every one of them seems to have the exact same timing
> > diagram in it just with different numbers filled in. To me that backs
> > up the idea that you can/should do the power sequence with a fairly
> > standard (parameterized) driver. I can't link the datasheets I have
> > but searching for "edp panel datasheet" finds me this random
> > datasheet:
> >
> > https://www.data-modul.com/sites/default/files/products/NV156QUM-N72_sp=
ecification_12039472.pdf
> >
> > See "8.0 POWER SEQUENCE" in that document. All the panels have a
> > nearly identical diagram with different numbers filled in. You can
> > kinda tell it was copied from some other panel since some numbers
> > (like T4) aren't even defined.
>=20
> So this thread has been quiet for a while, but the problem still exists.
>=20
> Here's my current plan, but please yell if you disagree:
>=20
> 1. See about adding a generic "eDP connector" node. Having stewed on
> this for a while I think I'm convinced that even though there's not
> really a single standard physical connector that is used everywhere
> that there are at least a set of signals that can be collectively
> thought about as the "eDP signals". Certainly I have a set of very
> different panels from very different manufacturers that I can
> "interchange" and they work fine assuming I have the right cable
> "adapting" them from the connector on my board to the connector on the
> panel. While different panels have different timings that they care
> are enforced, there is a way to express it in a relatively common way
> as evidenced by the fact that all panel datasheet timing diagrams look
> similar and the fact that panel-simple handles so many different
> panels (yes, we periodically add more timing constraints to handle
> there but mostly that's because the code wasn't able to handle every
> constraint that could be expressed in those standard-looking timing
> diagrams in the datasheets).
>=20
>=20
> 2. The "eDP connector" node will have all the same properties as
> today's "panel-simple.yaml" with the addition of:
>=20
> enable-delay
> hpd-absent-delay
>=20
> The idea is that you power on the panel, hardcode an enable-delay (to
> handle early HPD glitches), and then wait for HPD (or wait
> hpd-absent-delay if HPD isn't provided).
>=20
> Note that "ddc-i2c-bus" will be a required node instead of optional.
>=20
>=20
> 3. Once we power the panel on then we will query the EDID and set the
> rest of the panel timings / modes based on the model specified in the
> EDID. Potentially it could update the "enable-delay" and
> "hpd-absent-delay" at this point too.

I think that sounds good. If ddc-i2c-bus is required, this basically
implies that EDID needs to be available for these panels, too. If that's
the case we can identify the panel based on information from the EDID.
That would make panels "discoverable", so that we can describe them with
a more generic compatible string that basically describes the interface
needed to get at the discoverable information, much like we would do for
a bus like PCI.

I don't know if the manufacturer ID and product code are enough to
uniquely identify every panel, but maybe something like the DisplayID
extension can be used to gather more identification data.

Thierry

--pwwIyjYU7zT6YQlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCCrAsACgkQ3SOs138+
s6FPTBAArVUbY8SmP4Hz12t546ddjfozLRZRVqY0+m8gwjjm74D4y6SfGyd47wKI
Euy1fK+faHgm7J94Wc3e2dqe757ApzBw4vhRxgqGR6AwBIoovRE3MWdvgib+FFuj
2f+/D9sYfsluGvHkWYUkgrnZ1VPGw9WjGK3L2VfnqE3jC42uZp7GBVaNqeQBDTVN
vNY7sraJhyy62GLwQ0AWK+MZbDfauMTWJGhby4I2gyQpgID7JWEPiWrz0hEng5Px
950+BAa0TltM/7aAt+KURkkJmjWGj5+LdKEBweQmyxancmi4vx4LSFQCNe+x0yEg
G/uWVTH+71C5GJT+PA1JiSNP9ctartxRklIOak7GpBJlkz/aO56iDxbNQBFriFWW
z/cneIzmi9H+f3zvg2Tq/NUqXZSFHxu2guu5dKJ7voRPyoIWMDQcSCsAI/9dIIxt
mzc9hSX3wjD2uGB6Q7TGoLRFBrswTjMiMDmig/8xg7O/4evgmok4wWYLVo4dc82C
C4U/2dxwAYd/Jg7iRQvWdewvCcz7U+T0WXZwuGV4OmQpDTPGf1V7U5m04anpiEXU
Sk+WeJAdbd/kwo/JM0krqLeUnp28OUzJoTbQFH8aMR9XGPZ+Scu3rAVEG9TmIr9R
LBKS5GaNib5Gnhmw6X+7NxCm8JZlEA22Qrf3K2BB1r2rX7FmpqQ=
=XnhE
-----END PGP SIGNATURE-----

--pwwIyjYU7zT6YQlm--

--===============0759489297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0759489297==--
