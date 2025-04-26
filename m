Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA899A9D91D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 09:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CD110E04B;
	Sat, 26 Apr 2025 07:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="mfgQZGtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 388 seconds by postgrey-1.36 at gabe;
 Sat, 26 Apr 2025 07:38:21 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6292D10E04B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 07:38:21 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2F1521C00B2; Sat, 26 Apr 2025 09:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1745652703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5exbCp8CDaKtwnGNmQNuQzYNnvlYj2r8BcoFxqyUHf8=;
 b=mfgQZGtZWV3YKRvc11Fy2WjXUhClzecJUpk8uWFAvgSynbJ4YLRl0zJKFI2+KRYmEv/vIS
 nEGu1k4V7qVSC93t6IBB0MyDqO93+03canDSdfmPtS49p32DXiQ8kU9ZO1dLYEU+Xf6umH
 NN3bTS8FxIdGst1L8YhkuJUoLzvidEA=
Date: Sat, 26 Apr 2025 09:31:42 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 Andy Gross <agross@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 David Wronek <david@mainlining.org>,
 Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht,
 Connor Mitchell <c.dog29@hotmail.com>
Subject: Re: [PATCH 00/33] Add support for Qualcomm Snapdragon SM7150 SoC and
 Google Pixel 4a
Message-ID: <aAyL3vl9yKlJ+JOi@duo.ucw.cz>
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="jXuQpBURuH9Sxi9Z"
Content-Disposition: inline
In-Reply-To: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
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


--jXuQpBURuH9Sxi9Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This patch series adds support for the Qualcomm Snapdragon 730/730G/732G
> (SM7150) platform along with the Google Pixel=C2=A04a (sunfish) device. S=
ince
> the most critical drivers were submitted and applied in separate patch
> series, this series is largely composed of DT bindings and device=E2=80=
=91trees.
>=20
> To date, we=E2=80=99ve tested SM7150 support on the following eleven devi=
ces:
> - Google Pixel=C2=A04a (sunfish)
> - Samsung Galaxy=C2=A0A71 (a715f)
> - Lenovo Tab=C2=A0P11=C2=A0Pro (j706f)
> - Xiaomi POCO=C2=A0X2 (phoenix)
> - Xiaomi POCO=C2=A0X3 (karna) / POCO=C2=A0X3=C2=A0NFC (surya)
> - Xiaomi Redmi Note=C2=A010=C2=A0Pro (sweet)
> - Xiaomi Redmi Note=C2=A012=C2=A0Pro (sweet_k6a)
> - Xiaomi Mi=C2=A09T / Redmi K20 (davinci)
> - Xiaomi Mi=C2=A0Note=C2=A010=C2=A0Lite (toco)
> - Xiaomi Mi=C2=A0Note=C2=A010 (CC9=C2=A0Pro) & Mi=C2=A0Note=C2=A010=C2=A0=
Pro (CC9=C2=A0Pro Premium) (tucana)
> - Xiaomi Mi=C2=A011=C2=A0Lite=C2=A04G (courbet)
>=20
> A huge thank=E2=80=91you to the SM7150 community for all the devices-port=
ing
> work, testing efforts, and bug reports.

Thank you, looking forward for well supported phones.

Please cc phone-devel@vger.kernel.org with phone patches.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--jXuQpBURuH9Sxi9Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAyL3gAKCRAw5/Bqldv6
8t6+AKCezW+X8tCRtch2mRMPqCnbTeMpmACgo7PqyT2Vhb5yFE9mqg8LMrPK+y8=
=hK/X
-----END PGP SIGNATURE-----

--jXuQpBURuH9Sxi9Z--
