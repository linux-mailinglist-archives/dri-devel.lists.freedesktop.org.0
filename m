Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DADC34A765
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 13:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A4A6E1EC;
	Fri, 26 Mar 2021 12:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A0D6E1EC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 12:38:55 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w18so6205045edc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TI7Nmt/BHimUD5hSkZsAh6B21oeeTIQziXEdC5IeIKw=;
 b=cWftyIE+qy80m+oB4+ZXkYXBcUdhAfpKZOyvn2ELMtyCNzXD0QaJ1gQlssBAfRd/rV
 VoS2y4cWa+Y0VRAfKw4MK39jXw2+tPk55rUcdpZaxczbxUO0ri9FlZwQ3UcfOVPdk3za
 cT+T9KjWmH6aGmWYZzfyAO7AwK40pidndGjmibEzqDlQPTvBPj0h2LC1lZ3QRcbpts/P
 bEE1LoFchBaBeGdJq6+csKwzH/gZ7+wgb/yG8oxgz8xkHtfJ7gT9iUF+R1sTaGP1HAZS
 7S3SUcmpIy6Hwc/y4+eQ/F2FqsHqB7y6HKlD+49H+tw0O6o9ulEdwaKWCpFORiDfAqcS
 9oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TI7Nmt/BHimUD5hSkZsAh6B21oeeTIQziXEdC5IeIKw=;
 b=JjJSKpJa1FxGBZX5qlI6um7aypgmlmIy63c6tz7H6QyGnqqXgtihoFzpCYFFWEgcZ8
 IKIDEb61jjvPBltXX5QkfnIs5NNeJwppPzYMce5B5UPBdzeQpowU7AH8y4r3T8wWOa15
 9zhcTFmdjRLSaL3H7E8sY7RPSJftx63c7oBvFDnkbFXSlp6cJGtRLtkNZbTFg32swTG5
 zn2NcZl37ix0/3ZqKjSmYxJTxYlQPlBdOd2y50yAwRIF11Tav66YTYksj9Ge/gJSIgaP
 u9pHvMTj4hKHw0Qz/Sn1l424cs5BKxY0CT20ozqwNVLaKkLt4/A5uIIdByZ5Vo4SqMKu
 ZZdw==
X-Gm-Message-State: AOAM532Okwit4C0q6UwJQjyi+lfO2CdoifkX5K+AsVgsh2xVuVhIOxIJ
 sWcfZpHHmqT56rZO9kACmB4=
X-Google-Smtp-Source: ABdhPJxeqmYSrMin/RSAk0NnPtJ1lQuB0PBn2vNIcsRwd5KGd9lXzb8BDhzdWpcz5JRyNkGigOYjrA==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr14728857edx.273.1616762333907; 
 Fri, 26 Mar 2021 05:38:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r5sm3753816ejx.96.2021.03.26.05.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 05:38:51 -0700 (PDT)
Date: Fri, 26 Mar 2021 13:39:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
Message-ID: <YF3V8d4wB6i81fLN@orome.fritz.box>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
 <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, Andy Gross <agross@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Content-Type: multipart/mixed; boundary="===============0807467428=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0807467428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OE3T5u9A95HKCh6N"
Content-Disposition: inline


--OE3T5u9A95HKCh6N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 06:53:04PM -0700, Rob Clark wrote:
> On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrot=
e:
> >
> > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > pile of eDP panels. At the moment I'm told that the list might includ=
e:
> > > - KD KD116N21-30NV-A010
> > > - KD KD116N09-30NH-A016
> > > - Starry 2081116HHD028001-51D
> > > - Sharp LQ116M1JW10
> > >
> > > It should be noted that while the EDID programmed in the first 3
> > > panels indicates that they should run with exactly the same timing (to
> > > keep things simple), the 4th panel not only needs different timing but
> > > has a different resolution.
> > >
> > > As is true in general with eDP panels, we can figure out which panel
> > > we have and all the info needed to drive its pixel clock by reading
> > > the EDID. However, we can do this only after we've powered the panel
> > > on. Powering on the panels requires following the timing diagram in
> > > each panel's datasheet which specifies delays between certain
> > > actions. This means that, while we can be quite dynamic about handling
> > > things we can't just totally skip out on describing the panel like we
> > > could do if it was connected to an external-facing DP port.
> > >
> > > While the different panels have slightly different delays, it's
> > > possible to come up with a set of unified delays that will work on all
> > > the panels. From reading the datasheets:
> > > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> > >   - HPD absent delay: 200 ms
> > >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > > * Starry 2081116HHD028001-51D
> > >   - HPD absent delay: 100 ms
> > >   - Enable delay: (link training done till enable BL): 200 ms
> > >   - Unprepare delay: 500 ms
> > > * Sharp LQ116M1JW10
> > >   - HPD absent delay: 200 ms
> > >   - Unprepare delay: 500 ms
> > >   - Prepare to enable delay (power on till backlight): 100 ms
> > >
> > > Unified:
> > > - HPD absent delay: 200 ms
> > > - Unprepare delay: 500 ms
> > > - Enable delay: 200 ms
> > >
> > > NOTE: in theory the only thing that we _really_ need unity on is the
> > > "HPD absent delay" since once the panel asserts HPD we can read the
> > > EDID and could make per-panel decisions if we wanted.
> > >
> > > Let's create a definition of "a panel that can be attached to pompom"
> > > as a panel that provides a valid EDID and can work with the standard
> > > pompom power sequencing. If more panels are later attached to pompom
> > > then it's fine as long as they work in a compatible way.
> > >
> > > One might ask why we can't just use a generic string here and provide
> > > the timings directly in the device tree file. As I understand it,
> > > trying to describe generic power sequencing in the device tree is
> > > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > > that shouldn't be repeated. Specifying a power sequence per board (or
> > > per board class) feels like a reasonable compromise. We're not trying
> > > to define fully generic power sequence bindings but we can also take
> > > advantage of the semi-probable properties of the attached device.
> > >
> > > NOTE: I believe that past instances of supporting this type of thing
> > > have used the "white lie" approach. One representative panel was
> > > listed in the device tree. The power sequencings of this
> > > representative panel were OK to use across all panels that might be
> > > attached and other differences were handled by EDID. This patch
> > > attempts to set a new precedent and avoid the need for the white lie.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> >
> > Sounds reasonable to me if DT maintainers can live with this abstract
> > hardware definition. It's clearer than the 'white lie' approach.
>=20
> Yeah, it is a weird grey area between "discoverable" and "not
> discoverable".. but I favor DT reflecting reality as much as
> possible/feasible, so I think this is definity cleaner than "white
> lies"

This is practically no different than the "white lie". I suppose you
could perhaps call it "more honest", if you want.

The point remains that unless we describe exactly which panel we're
dealing with, we ultimately have no way of properly quirking anything if
we ever have to. Also, once we allow this kind of wildcard we can
suddenly get into a situation where people might want to reuse this on
something that's not at all a google-pompom board because the same
particular power sequence happens to work on on some other board.

Similarly I can imagine a situation where we could now have the same
panel supported by multiple different wildcard compatible strings. How
is that supposed to be any cleaner than what we have now?

And I still keep wondering why bootloaders can't be taught about these
kinds of things. We have in the past discussed various solutions where
the bootloader could detect the type of panel connected and set the
proper compatible string.

If that's too complicated and these really are standardized interfaces
that work across a wide range of devices with perhaps a couple of
standard parameter, then introducing a standard connector type like
Rob Herring is suggesting makes more sense because that more properly
describes where exactly the standardization is going on (i.e. at the
interface level rather than the panel level).

Thierry

--OE3T5u9A95HKCh6N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBd1e4ACgkQ3SOs138+
s6Hq7g//TaNj9J3a5C/NdYZTbxNWGC36DPa/ytgQEm/C1Sy0hP7BrfNc22jRZfMy
Uzf+2/hYPadL0+c+/TBbxWCbn4DtdUWlJe0fLEUqK0hUTDww8yK9BMt3gc1DSZI7
5QfGGfy7CN67ajMN+KIfTcr3r7oyLbWY+afp0BPwSFuEpioCrq2b/qfkqDfK+xQB
oW7/yahlOLvQJSD9o8To7l/oGOl4a+n09MhMcIUZwCgQU5H3Dl/z8fYyYYFeBQ9/
deJrgc4wCgRb8uQhPHoQIMeZaLefHQHqTsoQRO8EmasCHb9VOrfc/deYLLZg9n3R
oEhjtGsYusd0C0ncuVX2OVgkyP1Q78wFBVcWLJw1oxzwAsjBYt14O0UR2KQ5fq2I
CnjeIWBrZOLt/JPwl3ThcQSfOmWQChqjWL8SgVRtQUf855pwtAwUu2CcfvY2uKZq
6XFK68/C5qAOR598hSb8P86r9ZtR6AjGGpeef4/fEmrycrLjO99o7Am4b0WcrNyu
Ix/oMLCIiJGG8+EBWDf7+Rur6/fPRp5/950uATD/YznfKstQHGMkLrk4HH7Ghdib
VAGslm9zM3V63r7SLhpv+BO8IckG1VVpq5nxjh3pRwmVHotXyXOu6FfUm3+ab+Wk
gy+7t0W7lJuiQKee7HoKZN6XoTbNIxSKNVZPXH+75cdkYY4VcHU=
=Taa6
-----END PGP SIGNATURE-----

--OE3T5u9A95HKCh6N--

--===============0807467428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0807467428==--
