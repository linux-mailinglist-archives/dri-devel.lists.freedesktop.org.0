Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153029ADF8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A656EB7C;
	Tue, 27 Oct 2020 13:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9B46EB7A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:52:49 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gs25so2365525ejb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4TbXysDqnndpTRF/Rd6isqCmc40s+e6qp/SrBCZya6s=;
 b=lwyXkbi/gj/HS/sa5ZvZZHWv3isYpIbQNCIWPd3kHp+iv2FtJXwPzAWNcRkUkXvTR8
 44f1TqgS3Bs2rpkI/0wLJ2Hk71+L3Ar+JX0euHhazOZZfsbBQ0jh4qOrYqZ/IYKprYMR
 7okL77/0uwXZTkRMwLFRhEHaeE4cEimNfoZ9ZS7H4rHZ5JsJPCXkilBuRfW52+VM3PNz
 J1cjxhhE3KHS/kc2JF9LiI3m5pFs/I1nntfqvyb8FZOpg/Wn4MwGD/eevDCR7ofLKqo2
 FY65HzvyUMidkVgJ7hv67tNZM4C41gC/ZJABYJOtFp+NDZvtzNotneRZEPMNdKEaw6wc
 HRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4TbXysDqnndpTRF/Rd6isqCmc40s+e6qp/SrBCZya6s=;
 b=o2G5lxAPQvT/F19VCs2C+/rjpPXP2sdMQDksr28EtLZw4CVzyRPe4fK+4m0NVdDqJp
 /ritkSuZaAhsh9PFNbf/osXR53262ap1ttmmTdXbDiXtHRxjjkECvfW1Qf4rkOr0MryC
 +VLGy5jjI+7x5E+ZIrFgeO73Wvjk/CCfPMecC64uY3bz/t9kvYSGsaSTYEiYfvgc02TG
 O5JiGE7kxswFR6L6cyFB76DfiuxETaph4HLzaHy7bedmKFS9iQY5kqmofNB8kFTxxB+Q
 sLi22BdhtWJPO2fkHWjZnr5nnwn1c9ZAKnW2aF4RuCiZ/NHuz+tzPxwuBhyJxyPlpjr7
 X1Nw==
X-Gm-Message-State: AOAM5338sUGtssdsSVjigwhCKJfzyA6tpFfHgEYi5uj9Y0dUEdRQKlT2
 dXiw85tBqM8w5pjuwl6ZdOc=
X-Google-Smtp-Source: ABdhPJw+wS4M5IdvdBE+C5XCShNKfDZ8hVzHzxdKtDgQPwv8S1CiMKIe82JbF1rjlL+EXlOuu+VahA==
X-Received: by 2002:a17:906:f8d2:: with SMTP id
 lh18mr2599173ejb.457.1603806767898; 
 Tue, 27 Oct 2020 06:52:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id rs18sm1096635ejb.69.2020.10.27.06.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:52:46 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:52:44 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 32/52] memory: tegra20-emc: Continue probing if
 timings are missing in device-tree
Message-ID: <20201027135244.GM1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-33-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-33-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/mixed; boundary="===============0476048321=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0476048321==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OQhbRXNHSL5w/5po"
Content-Disposition: inline


--OQhbRXNHSL5w/5po
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 01:17:15AM +0300, Dmitry Osipenko wrote:
> EMC driver will become mandatory after turning it into interconnect
> provider because interconnect users, like display controller driver, will
> fail to probe using newer device-trees that have interconnect properties.
> Thus make EMC driver to probe even if timings are missing in device-tree.

Does it really have to be mandatory? Sounds like that's going to make it
unnecessarily complicated to merge all of this. Is it complicated to
make interconnect support optional in consumer drivers?

Thierry

--OQhbRXNHSL5w/5po
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YJiwACgkQ3SOs138+
s6H3wA/9G28Ray4Bi6twkE9N7+h/sNEt+7YPAHJDE7CAIf9/VJ6pbfqyZFWHTH++
/R5TsxsZlomEwSgf41l2E82KzNVLiJ0uRA2aKSS7J+S7navlOQHB2iHA4Mt2L+wm
z2l48XHXTeN8HT/RZoaPK+ud5dShtzJkyrQ7Iuije9XY2f7EaSogO1be3P6lQTpJ
L5tf04hyF0l9obliNMBD1kip6SHt/XLVo/Vdkl95GZz4Utu9XNGOBdkQ0jib8DGB
VTc/qWdeJUlxQBABfFXBGYXoS5x8xkOe0C1ftx+i1fiJpQ4z7QAaHKb6i/h5E4t3
D1iTraACToaw2f5Rcidkjandfmw2UxeNh1i3Q9eLDFwZhNTnBsXKez2oajbgDDHJ
3RQZXzm57261eInfCxv1NTLk1TwefZdC6fHMFya/1d71uxpxrKaZOiqI9R/2V35c
Qu3Bxgktem+U8dVHrsNZwfaXPIafdyPU+SCczsLFNaIerh4HVFan9Pf3ygTb5835
WMms77JprRuy8oDnApuK2Tx5tRBf1ETy7ATUxIs40dNTQuVj7VT5biBr97LwRyKM
4O1+PPLbS256d9z7komAWyF1q/gJUCdQRLtaD3HL6WQdFZmZZABv8S5tclu71lPn
o8htSjXOmi7ZPGn/ipBe0RMBK42ehXK0f2gysAj+YhzVWqva1JU=
=XJw5
-----END PGP SIGNATURE-----

--OQhbRXNHSL5w/5po--

--===============0476048321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0476048321==--
