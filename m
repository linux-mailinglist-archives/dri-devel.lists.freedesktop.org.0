Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8883B1ADF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFD06EEF8;
	Fri, 13 Sep 2019 09:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181456EEF8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:33:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y19so31383790wrd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 02:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to;
 bh=YWFP3fiiNLYjg5KjJkJ+a3OV517hoFU0pK03RFIpW6w=;
 b=AC4QC0ZcL9fHkNwoycrjrEkb4Rrpbc5u3t8RygKuW7ge8n8XXnQ+kcioMuTbDlbOfL
 6LDHE/2MEb+dGvZIp6RP0JIR1FSA+tvIluSkmWnaerzM4dbBpzpTrGh76WgwNgcATAew
 1MsJUyvLeteow7UUb8mh8+wBAl/GRvzn9BEak96Qch5afw8ao5KwIUFQ5mHMFUEanvcI
 VELV123q+H5P6CpEYBED4Q5mkj9nUo1/UH0ED+gtpIr5Kz6MDVAxanTw4vTFBDgY9DPU
 r1Jpbp97I1iwePi52XCAAvHvbS55ydRoN5dJoND974fYzcClQRiSRvHEjY+vqnVxD6Uc
 vDDQ==
X-Gm-Message-State: APjAAAWqKuqeGItG1mqPAwKbmA8kKYNWkKiqO1xHZmUYZ3szH+8dMpjt
 vOlxc6ydi1ZbRDQioTHDJzPLEA==
X-Google-Smtp-Source: APXvYqyTnY/BRnv5bnnwc3B97riovmka3Ma52ZQaQTgF3mOK8Nhr8fElod8xICY3ABgLgTy6zXeJkA==
X-Received: by 2002:a5d:650d:: with SMTP id x13mr5675866wru.37.1568367184374; 
 Fri, 13 Sep 2019 02:33:04 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h8sm679528wmc.5.2019.09.13.02.33.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Sep 2019 02:33:03 -0700 (PDT)
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
To: Mark Brown <broonie@kernel.org>
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
 <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
 <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
 <20190909135346.GG2036@sirena.org.uk>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3fc94731-f66a-223d-995e-97ac67f9e882@baylibre.com>
Date: Fri, 13 Sep 2019 11:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909135346.GG2036@sirena.org.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=YWFP3fiiNLYjg5KjJkJ+a3OV517hoFU0pK03RFIpW6w=;
 b=gCqAsImP3QV/jRpUp78X70WSTXJQi/V7ELSvPz73RKUCHgYp7clqnmXe5aMb1WE3WF
 BhHJw6DNizcIemoU1Npdpt6mBaQ4KgActLaEh6iHNVHTEfXbEj7synOzvxUt2oLPcS4U
 MmIg8CnTk63LRlYYi1AhYyFVbQH3OBFGGf/3/UoSe/WQlaKvqxgai7pJ8zp+N45VJjHR
 hs+o66YyYZqE7+EmfYGF4kBzeRNepmy9w1m8jZHk1ZuxO+bRfspNI3pv1D33KxL0AqqS
 auQadt4ZeBxwA0IiAe/NVOFU0aQx5sSqJ6YDk/7OCdakTwNDoSmMTWSc0iwZt57jaumf
 Ly2g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-yi Chiang <cychiang@chromium.org>, linux-rockchip@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>
Content-Type: multipart/mixed; boundary="===============0328960220=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0328960220==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="UBRWlaGOHY0XEFVZVHxIrla091rV5aEyl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UBRWlaGOHY0XEFVZVHxIrla091rV5aEyl
Content-Type: multipart/mixed; boundary="rm5OjYgCDNiLh12bKFbv4tVbo1MJJOHLY";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cheng-yi Chiang <cychiang@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 ALSA development <alsa-devel@alsa-project.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Jernej Skrabec
 <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>
Message-ID: <3fc94731-f66a-223d-995e-97ac67f9e882@baylibre.com>
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
 <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
 <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
 <20190909135346.GG2036@sirena.org.uk>
In-Reply-To: <20190909135346.GG2036@sirena.org.uk>

--rm5OjYgCDNiLh12bKFbv4tVbo1MJJOHLY
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 09/09/2019 15:53, Mark Brown wrote:
> On Mon, Sep 09, 2019 at 09:37:14AM +0200, Neil Armstrong wrote:
>=20
>> I'd like some review from ASoC people and other drm bridge reviewers,
>> Jernej, Jonas & Andrzej.
>=20
>> Jonas could have some comments on the overall patchset.
>=20
> The ASoC bits look basically fine, I've gone ahead and applied
> patch 1 as is since we're just before the merge window and that
> way we reduce potential cross tree issues.  I know there's a lot
> of discussion on the DRM side about how they want to handle
> things with jacks, I'm not 100% sure what the latest thinking is
> there.
>=20

Thanks Mark.


Cheng-Yi can you resent this serie without the already applied
first patch with Jernej, Jonas, and Jerome Brunet <jbrunet@baylibre.com> =
CCed ?

Thanks,
Neil


--rm5OjYgCDNiLh12bKFbv4tVbo1MJJOHLY--

--UBRWlaGOHY0XEFVZVHxIrla091rV5aEyl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAl17YkkACgkQd9zb2sjI
SdFL8xAAm/uVVOJY0VK0uVX/gv2nNJ+t90WPrW3BfoWCLRaSr1czldafQkylTwQl
EOHl8NcYz5pttql0d1ZKh6uZSCTsMtWRb6Qwm14c3ptFaD9y1TI8X+R+zryTIgA5
fuaLScVQ+kDpMwWYvZvVdWnu7/7Wdtj+uDNEooXlxeIvylxQzPYGQLcrdyZz54DZ
vPl/scouuoKobHYXHw5AUs/ipsHUxcfD9wm+s4lrcIcE8FSjoVqbwZsonqDlHfOY
lCykwi/sj2A567r0fL0Qipj4cqa5Zzvy955v0K5E1bHbTFs3I9kKsMsrLmYrpVB8
pG+Tz31EKziArzadGNlxjjI6ViRQxwXAOPUfDZW7JFmWPD+aF2ZquQttp3GGlbwf
9ndAcqd0yPqBaWwaPWAZJ/CbZiKPeDtAVcBtiR/pHYDUgMiDq88O3deynxUer4qw
06IrtU9X8yn02vEh2L+6fLCG3NfMCUdyl4lRCmxSJ8K83pCOx1iMpcawEJq+xktX
qvQVxXHrp1D5drRUA+87MDZmI5aQ/9HoYY+tIMTC21D7JFB/x2U6n0nFRyLi/muG
gD0oD4cBhYhH+xJhKQeBmx+cA6xb90J4mfzFvpWvwDeGNsJJ+QaLGmdz9b50Aqd9
XKP4tzxUvHbepIhN1NPCh1Xe2cU06KRt2S/ID9usnk2cnXoigUg=
=JmCa
-----END PGP SIGNATURE-----

--UBRWlaGOHY0XEFVZVHxIrla091rV5aEyl--

--===============0328960220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0328960220==--
