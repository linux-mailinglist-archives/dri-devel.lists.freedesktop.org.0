Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A1AE0699
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FA710EA24;
	Thu, 19 Jun 2025 13:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="fvhT7kfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F249B10EA24
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750338753; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GCDR6f+3a/UFNb4nvohWVlM9unBzKNbXba334HXQcyOIdNmWqbFHy+tak0MujKG2RfuavhlqH/eZsFcCcdd3JhrMDXTlOhwo8uhJ3Yti6o7BpyFLq7w+GtJNnTFy5lfnx5FfnyiHTTEirIg6juEfm7lXOsmjgidFReEJ415aSGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750338753;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=h6AEfWB4cuhEQXOH4s1I3+qlS3WPRdeZ+P5xR1Kiktg=; 
 b=gia973oc62L8OlhwNwnuQO6g/0HtyhkPxHJ2SuKqekurkVhxGmrhzPGqeBqtFVXfHr+rJ+RlKyQVXkCrjXIAkuBQ+1d1rsajLab3neKuKEgfIkhyhCKvdRVeS1irdtuNsVr/AlShHISj4fDvFA70zwKNfjeKIphea9v2wm4+C5s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750338753; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=h6AEfWB4cuhEQXOH4s1I3+qlS3WPRdeZ+P5xR1Kiktg=;
 b=fvhT7kfYfzwkr9e+9GNSQ+7E9H1Z8Xi0xLaH82qHBbmghhdRGeAYLQu9WXKkL2Rd
 1x2XkVxrOeZXAygUPhUqoKSNRUZkfg/K9rYq3FB4G2YzuhmUPFrkbBm7Pe/78C7vMlJ
 c4eMz/eanN4/NrW7LiXNlB6egf49GAkdQp51pQus=
Received: by mx.zohomail.com with SMTPS id 1750338750914761.7018386927865;
 Thu, 19 Jun 2025 06:12:30 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id DE18F1805A8; Thu, 19 Jun 2025 15:12:26 +0200 (CEST)
Date: Thu, 19 Jun 2025 15:12:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, 
 quic_jesszhan@quicinc.com, krzk+dt@kernel.org, robh@kernel.org,
 tzimmermann@suse.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as
 optional for Raydium RM67200
Message-ID: <7lfahwhcxvedizxpijst7nzseryw27r26rizqmyldsidm3wnwu@72mc42luxowx>
References: <20250616070536.670519-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dad4urbqwcejgf62"
Content-Disposition: inline
In-Reply-To: <20250616070536.670519-1-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/250.326.2
X-ZohoMailClient: External
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


--dad4urbqwcejgf62
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as
 optional for Raydium RM67200
MIME-Version: 1.0

Hi,

On Mon, Jun 16, 2025 at 03:05:16PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Although the datasheet of the panel module describes that it has a
> reset pin, in the actual hardware design, we often use an RC circuit
> to control the reset, and rarely use GPIO to control the reset. This
> is the way it is done on our numerous development boards (such as RK3568,
> RK3576 EVB).
> So make the reset-gpio optional.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>=20
>  .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67=
200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.=
yaml
> index 54c9c0ef45ecc..97b7fbe05c077 100644
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
> @@ -42,7 +42,6 @@ required:
>    - compatible
>    - port
>    - reg
> -  - reset-gpios
> =20
>  additionalProperties: false
> =20
> --=20
> 2.43.0
>=20

--dad4urbqwcejgf62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhUDLYACgkQ2O7X88g7
+pqBMA/2L1SNzxn1effxUKy7Jd45Rn59lJ3rd7BTpUKaBQnUOKBhcRaKob4C96Qv
mPo+/WCApVgL83R3BkgkVUH644fhEc0aNp94zEIawiVo40ppMj/aWLgF4KWvqewa
C9rlrPb+DId2V798rwGQqcSLKroOJSlv0WB8CI5c0pakegP8OB1GIpW8p/2JVTk+
2IcryCh8nJrWkFRYRoyRIWlVDHMjcwk6x0e4tVhXfHjI955L1X5T0LAhE+oXffam
z2/RtALqB6G8QKqabFM+MEEW1Yr62VwexJiurQeyHPw24sFkdYuLNz2N9paMiTK7
Fk2RkN5nN6nYjwQ15rSrV1f0RXxvO4MCk/Yy/qkxRTaRnZk/gv+9SZ/53gsFSn8a
4RWdfJbpa75xcvuxuPnxl2CSRYjbqqIV1lBwdwjX9MltZdWzk+Hoji+ny4iN3qJe
73nUfzKl2Nc/KpEh2O7dmChhOCvrbbGhl41vH9RWXFNoO02E9Ew+VmlAmo8jH6pJ
vQtQh44RQ1B/w70L18YeDwIC5HJo3KBmKqnTxC85MrUIaNv46dIYc3xg6kqg7XfF
ifJNBCbe/zQZK3rwxma0p8dr1SNkx2Uzgi1ar/UJVP8P7LBuhPk7+KsQTViOxCaR
04Y3M1sfFgQJ29O8RhX7olpZvVFC1GophcxyJ3kqqx/VmynwEA==
=8c/e
-----END PGP SIGNATURE-----

--dad4urbqwcejgf62--
