Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B881C1325D2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 13:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951AD89852;
	Tue,  7 Jan 2020 12:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941228982D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 12:15:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t2so53675708wrr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 04:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4Vcrc9kPwEMI1qMY97ZKxc5ORffAx/A/CKvvB8bb9HU=;
 b=EhpeMaFyUHCBnnfIlkhHmvYes0eM1ZWephawKnNl2g0DdN5tHsMvsQ/4FsRIcI1ViF
 V3/zNmW1WqptpoasSr9aVQONe03NmK6y+Cy/hq3dcavQYK9NWmkl9yncPAucoZVWqrm1
 gPX2TUOOvSfAT4nSupIbsHctrqzFpJbV4AK55H+WRQ8pzAHVKBqX9fYkFNQB9KymoiAu
 5pckxvxkWMzCezBHVm0PXp2+q61yOoT7RtNKrwGmk0N/cZXrCFPvvmA3KGehcXEty84s
 qYp/wXsXFzMl6wnmBGudBncGbsTHnH+veG76aeSlYrgEJeARwZvgabwFPoH7F/fJylJz
 0ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4Vcrc9kPwEMI1qMY97ZKxc5ORffAx/A/CKvvB8bb9HU=;
 b=BICOwlUWEsN5Z8uoVA3v5zXoTz13sChRgEDUz2iAlSq8h1ssR9dgRHd/9X8feLXkm4
 xd7ANfJAW3i/YHKZiKU3Iqy2Y4KvzXmFqsZKhnJpCjNRW5qPkiQ3utYFCqL5l7xb7zy1
 7b71IuIGyWr+4whK5dhGLKQCodBeJJpQRPY+6PTpN5HAC/Fs8wN/gVYzdS/sOT450SCY
 kDt9+SBH1Nw0gUt0N6oI2xfo+wqZTn5FNYJiGI0IaBbtDY7JwmgzJ1V6FT/PhsqVr616
 F5JxAqMqB/01REsIgfuRe86v/rcyXm7mmooR+Sv88yvtuPJGEMGFl34Jspuf9JLTzjTs
 Lj8w==
X-Gm-Message-State: APjAAAV/3wjYYAt7Jj5gWSGFQlqHj6/b/8R70djI5Io7GQePlWA4fLWK
 Wkx4OKvfn4E9qP4iyC26HR4=
X-Google-Smtp-Source: APXvYqxE9TizJBrkadc+zJOygaNd5/9MmQLFuKw9E9v9SnmDj4SWvg+X9NC/e2sfNSFX1wfVgHOQoQ==
X-Received: by 2002:adf:ef92:: with SMTP id
 d18mr105419063wro.234.1578399308307; 
 Tue, 07 Jan 2020 04:15:08 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id b10sm78937461wrt.90.2020.01.07.04.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 04:15:07 -0800 (PST)
Date: Tue, 7 Jan 2020 13:15:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/2] combine bindings for simple panels in a few files
Message-ID: <20200107121506.GC1964183@ulmo>
References: <20200102101712.5085-1-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200102101712.5085-1-sam@ravnborg.org>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>
Content-Type: multipart/mixed; boundary="===============1616966904=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1616966904==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2020 at 11:17:10AM +0100, Sam Ravnborg wrote:
> This patchset introduces two files:
>=20
>     panel-simple.yaml
>     panel-simple-dsi.yaml
>=20
> The two files will be used for bindings for simple
> panels that have only a single power-supply.
>=20
> For now only a few bindings are migrated - the
> reamining bindings will be migrated when we have agreed
> on the format.
>=20
> v2:
>   - updated binding description in panel-simple.yaml
>   - fixed exampe in panel-simple.yaml
>     (I was missing libyaml-dev - now the examples are checked properly he=
re)
>   - added panel-simple-dsi.yaml
>=20
> 	Sam=20
>=20
> Sam Ravnborg (2):
>       dt-bindings: one binding file for all simple panels
>       dt-bindings: one file of all simple DSI panels
>=20
>  .../display/panel/ampire,am-480272h3tmqw-t01h.yaml | 42 --------------
>  .../display/panel/ampire,am800480r3tmqwa1h.txt     |  7 ---
>  .../display/panel/panasonic,vvx10f034n00.txt       | 20 -------
>  .../bindings/display/panel/panel-simple-dsi.yaml   | 67 ++++++++++++++++=
++++++
>  .../bindings/display/panel/panel-simple.yaml       | 59 ++++++++++++++++=
+++
>  5 files changed, 126 insertions(+), 69 deletions(-)

I like this. With the improved structure that the YAML bindings provide
this becomes rather neat. You may want to update the subject of the
patches to better reflect the style (most seem to use "dt-bindings:
display: " as prefix, for example). But overall, looks good:

Acked-by: Thierry Reding <treding@nvidia.com>

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4UdkgACgkQ3SOs138+
s6HTnxAAm2DXdt4nuIiLcds9qXXf1V3A+d0r/Qya5SmQkUW7UZQ6X4PMvIZKHUQx
rTdXlrytFDfJgX6oGy0x3vd6fTTOLpTEiMNNORnj0/6TXtcVihVvF+HzkBvbeVKt
zcDjCZN41KpimIsTEww1I/HUD/+iy/1s/ekjvxogcpzXLo/a2pMR5aAICgPp+Kni
Q/zgsMNefCwqTJCBz37uxNBUJ5grcyHThuIp+dwfvcrTRbBN6qlMvylVJ6W5K8Al
KKkG4HvFmTucPg7UgiE80wZWZgOdLFRleXtN7/7arIWrPNzyh5769hhcRlXR9Nm1
/U6YR5XXImyNeWlKLV6H6Eo2Gmw2sHOC3OwtfDgGkQun9dyRhoIPdFV1DZlaymS+
PF5F379d5piQT39BtDTUn00K/8drc8QjIzYxi2ko+aZPFj7oL3yYz6ZkCoycB4F9
HwIrGjyNbxmto6UBvY3LPDEZV6tbfv+OWDfjYY/Itf74sUYjvivQjLUUZNIMsR9Q
rhw+9MpDxx9o6MfO4Zgr+//7F+X3zDQuG+a4S/1GLJnV+ryYay7FJuH52GfO24Og
q/exUWQONwXywghxZ58/QbBBDSAoJT/nH6NUKcFl5vn+gPO8rDVYu8EN7NJ74Qbl
XWHW36sT/ZpMwzTBkQDpNwN+92nerIJYxVXYQq9RBG9tfVax6OE=
=1Z06
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--

--===============1616966904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1616966904==--
