Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A492B2B2087
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 17:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9FF6E4AB;
	Fri, 13 Nov 2020 16:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850CC6E4AB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 16:36:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so10588683wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 08:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dQRQDur4C385F9uHjVsTWYFjOPOTyFC/a81xU2Lamvk=;
 b=hYjtCO8hZTyLH2Kyoh58AH0k4dJctPDDMUFST3ORvzuMx/d+q622LhLzVrAUwruqpj
 vatSp2tdsnyRwv0asO3bbpGDvd0vEZjDV3IaINbpZsJmI5S0GwzO7kZs5w4Lyo2VH/4c
 Y1Xhiw7uCTIk5kY2QZeUv7U1NQWSzu5o9XoRi5yn+8NlZq7l2qlfEeSbzOt2RJpv5OYy
 1x6+4v3ShQP7Hi7WCV6M1Cx8cu9XeKLqQAKEmagxoqkiRNn8VSJv/QtGIVgzQBRaUZ+M
 mco4TyKjxVpCzCsxEz/w5kDm69UIKoK6OgA032HEi8rB4Km/3qZsxJLI5l6qtY4Bhnoc
 fs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dQRQDur4C385F9uHjVsTWYFjOPOTyFC/a81xU2Lamvk=;
 b=P735BcqvN201f2Q/2JKzYwtFIrCqovtsS3+YCCGojArLeFMgZFZKbcUFFVphR+pOxV
 2YJ2z/EE3S7xWQMdqNsB/gmlU5B/L3jQ2+YQN9lbUFt7PogUQDTXxOxqfxEe1PnlUDqO
 HG9CA6iFsnAS8Z77sVPG/Q4NhdKgpETtLDckrklE/bWy3j4gABWU6lYDQDlDQaSxXsQ+
 eZBQJHIfn/e/UmpDsHkBpoOyC/yQ0sNw0ddfu1yHSjWZnC3KYahArSOavM9YML5miEij
 o7Kn6rIRWIt1SkL7A0cWseyDyQZ1ydE3tmJox2CG27blryXbD7zKFEYeNJ4bVwHuPTgg
 XBxQ==
X-Gm-Message-State: AOAM533KFQVOA/jXiHQHnhZIOWALgNp9qciBfIr78XJD9hQMtVATXTh+
 L7IVLgFtvPv4y7CPfp8ka9c=
X-Google-Smtp-Source: ABdhPJyLdoQr70KNk4+Fb/DdcC/nPPnONUO+wvv6EXYBj9QK5AbdJZn9lq3s3z7ryBX+7Ul7LRtFKg==
X-Received: by 2002:adf:906b:: with SMTP id h98mr4463717wrh.310.1605285355248; 
 Fri, 13 Nov 2020 08:35:55 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t7sm11384960wrx.42.2020.11.13.08.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 08:35:53 -0800 (PST)
Date: Fri, 13 Nov 2020 17:35:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201113163552.GE1408970@ulmo>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <CAPDyKFqUMsH9dCZ=OYqfdLt==+-8NjK9n=S5jGGNXZu6Y9q=2w@mail.gmail.com>
 <1f7e90c4-6134-2e2b-4869-5afbda18ead3@gmail.com>
 <20201112204358.GA1027187@ulmo>
 <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
MIME-Version: 1.0
In-Reply-To: <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 DTML <devicetree@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: multipart/mixed; boundary="===============1195078192=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1195078192==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2020 at 01:14:45AM +0300, Dmitry Osipenko wrote:
> 12.11.2020 23:43, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> The difference in comparison to using voltage regulator directly is
> >> minimal, basically the core-supply phandle is replaced is replaced with
> >> a power-domain phandle in a device tree.
> > These new power-domain handles would have to be added to devices that
> > potentially already have a power-domain handle, right? Isn't that going
> > to cause issues? I vaguely recall that we already have multiple power
> > domains for the XUSB controller and we have to jump through extra hoops
> > to make that work.
>=20
> I modeled the core PD as a parent of the PMC sub-domains, which
> presumably is a correct way to represent the domains topology.
>=20
> https://gist.github.com/digetx/dfd92c7f7e0aa6cef20403c4298088d7
>=20
> >> The only thing which makes me feel a bit uncomfortable is that there is
> >> no real hardware node for the power domain node in a device-tree.
> > Could we anchor the new power domain at the PMC for example? That would
> > allow us to avoid the "virtual" node.
>=20
> I had a thought about using PMC for the core domain, but not sure
> whether it will be an entirely correct hardware description. Although,
> it will be nice to have it this way.
>=20
> This is what Tegra TRM says about PMC:
>=20
> "The Power Management Controller (PMC) block interacts with an external
> or Power Manager Unit (PMU). The PMC mostly controls the entry and exit
> of the system from different sleep modes. It provides power-gating
> controllers for SOC and CPU power-islands and also provides scratch
> storage to save some of the context during sleep modes (when CPU and/or
> SOC power rails are off). Additionally, PMC interacts with the external
> Power Manager Unit (PMU)."
>=20
> The core voltage regulator is a part of the PMU.
>=20
> Not all core SoC devices are behind PMC, IIUC.

There are usually some SoC devices that are always-on. Things like the
RTC for example, can never be power-gated, as far as I recall. On newer
chips there are usually many more blocks that can't be powergated at
all.

> > On the other hand, if we were to
> > use a regulator, we'd be adding a node for that, right? So isn't this
> > effectively going to be the same node if we use a power domain? Both
> > software constructs are using the same voltage regulator, so they should
> > be able to be described by the same device tree node, shouldn't they?
>=20
> I'm not exactly sure what you're meaning by "use a regulator" and "we'd
> be adding a node for that", could you please clarify? This v1 approach
> uses a core-supply phandle (i.e. regulator is used), it doesn't require
> extra nodes.

What I meant to say was that the actual supply voltage is generated by
some device (typically one of the SD outputs of the PMIC). Whether we
model this as a power domain or a regulator doesn't really matter,
right? So I'm wondering if the device that generates the voltage should
be the power domain provider, just like it is the provider of the
regulator if this was modelled as a regulator.

Thierry

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+uteUACgkQ3SOs138+
s6HFrg//XUCBi+MoTYKA9Q0nyyDEbz8pB7xsPWf9AWJHRToygKc0DTU1ZaPQLNp+
zx+Yg2HSEBBzzv1c5cABiz0dUaE+gkzTfY74+wByGBumAiPaFCOmamm3fwgTlzsM
ZzTrLxJShO6bIo12gq98qI68RxlwptdQcGagjc4QLcaL1xxhdyYiEFtQj8X3rwfp
r2ELceMzT3klMTV34ghkgQKBRkgxm3thCmk+O/+scUwM9ju23OeClHBPsq+YwWz/
ItCwLTUXyfPTSzIqXbjPEGXPbNGS2aUdYo0YsY42Q5XswBGPGXV+VgCPd153Vyek
x+tAG0YSkV3NWFIQKBR5iwvguqZbVYgBR8tonT+LH9qyx6wADX2bp1VtEssD3Dsq
qWc7y+PnmrUkx895JcxYLzhGoN5Hr3xwKeTLSRxGCQQvh1fqJJO4Ja4QnBdxK1lm
FLLCPrq0/yK+o6DKJnAWjBcVyWfY4z2MPej6lao9ZlR4nC0qaY9URhD//kujuB7R
dsRKyAwamYzw0b1doZWjffloEhog7WbjMw8UsbF+E8K7kSNePUqgaWWMsZDwh6yI
VrszC62dJzCUMweS9s2mSjQ08xGrcITA8i2qxMKpRQA6VoZzMAdP6WjxseQoDa4g
6Rsyr9Mt8Ed+Gs4vssp8C6jeFDQEGXM+37kYIC8LrNM21HZoq74=
=p82m
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--

--===============1195078192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1195078192==--
