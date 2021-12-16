Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138CB477374
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 14:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A176A10F442;
	Thu, 16 Dec 2021 13:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953310F442
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:46:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o13so44224676wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=082erHSPrIMR3rNHlkVNnLqclLhfGMrOuGl2rkH3scs=;
 b=j5l38ck6lv5iBJ7KVkH+GcDavx/dqdCt1vmbAMSuNmlhDxQzV61rT80YoY2pobDgbo
 V9eciYJZf+jIns+/Gca6T6c0MUvYZR1ttdNKIcvvfHSIs9M4VbfwaSiKyR6OjHSWtk/D
 SsoRqBRBZ0t7hIXC/pgKnwyf/X6LGID8m/KUlhSC3kJNjnkGvmM5cs15d93GjWhtix8j
 7hJzBZrUu/VoxV9ead8wfhFXBdQBXRjaxB6efNsPKkY4/n2Ozt4iTb1rpJ9EzShToEZn
 itt9xgOnRmuvlQ5B4LWW/cO2OPICBy+FkgZQlU5CSCwhRAQ9iynWEgT+I5zVHFhX98bf
 fO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=082erHSPrIMR3rNHlkVNnLqclLhfGMrOuGl2rkH3scs=;
 b=WAwhy13yGJXMOCchWaG2Lz/Ps8G5uwBHfOd0pFoDm8cdCtp3cPTgCqEytjFEf/a/a9
 QdBfC+Lu5fKBMV+xclx4PTVnXQhdj/1Bh0gjfwh0ksbxBv/1Ndhbg0KWRP/ZeQf21q2I
 I9IpN7GRWl5FdBbeqP5Bf33w1aNQAsn//m3KglXYDln18qI2VbNKhf2SBCDU7kIzFsJy
 zDqDWmRkvLeoRCN22MadQuxb9fmGG519l/s1pS3Wax41NvN0glqfJPCV5voMbBHAxqQ8
 vvZCvEO01hwZWz6C7F5QCuFH+mc2jQjayzAiwEnYnxfSUe9J58IkRD4u2FEwXFgAB4IR
 Emzw==
X-Gm-Message-State: AOAM5324svSeis7aqBKztdRJ12N3rpI2MISq34OmhZ2omX0GbNUajx2P
 axkZHZbw7qiUnSCbwN9NAz8=
X-Google-Smtp-Source: ABdhPJz6fej/q9wMgIqkbfb+Am1+cVbK1+zRmhxF4GEIhutpDbPUdi0sxT+4y58hn1UKOADbjiJg+Q==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr9100087wry.582.1639662394439; 
 Thu, 16 Dec 2021 05:46:34 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id b14sm5340551wrg.15.2021.12.16.05.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:46:33 -0800 (PST)
Date: Thu, 16 Dec 2021 14:46:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 20/22] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Message-ID: <YbtDNbdJqCGTaMNs@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-21-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gyfxT+HMhoGDzaoq"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-21-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gyfxT+HMhoGDzaoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:23PM +0300, Dmitry Osipenko wrote:
> Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
> Tegra20 devices.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.d=
tsi
> index 72cbe32d0c1d..dde228bcbbff 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -186,7 +186,7 @@ rgb {
>  			};
>  		};
> =20
> -		hdmi@54280000 {
> +		tegra_hdmi: hdmi@54280000 {
>  			compatible =3D "nvidia,tegra20-hdmi";
>  			reg =3D <0x54280000 0x00040000>;
>  			interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1063,4 +1063,24 @@ pmu {
>  		interrupt-affinity =3D <&{/cpus/cpu@0}>,
>  				     <&{/cpus/cpu@1}>;
>  	};
> +
> +	sound-hdmi {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "NVIDIA Tegra20 HDMI";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg =3D <0>;
> +
> +			cpu {
> +				sound-dai =3D <&tegra_spdif>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&tegra_hdmi>;
> +			};
> +		};
> +	};

Should this be status =3D "disabled" and then only enabled for platforms
that actually enable HDMI?

Thierry

--gyfxT+HMhoGDzaoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7QzUACgkQ3SOs138+
s6Fz0g/+NXG6Z5v1cU5m8qATHlCS7LOgj0m1pDYH7NGhleBIryfDjU2YTHXFLVs7
9rmIyyM+EkHDDNrmZSW/EbXeADTOvlQR6IaMDqRxQQnZ7/7lyWxpwIzNpVMNOY8x
kfv1G2e1+GmjkHtWQpjKa+PFpIFFLc872ivZXcx4wqT+93KdTlqxQ93v1pLKOsxF
vfN3rtnRukmbifI8vaIgacWTEuL2EvZEFlmpUL0/83qM2d96RWKfPozq43qJKAL+
fYa+9dzPG2NnK90C7lY69SQ9gaE5tiV81l5UewA8Q6foZ6b9OQty4aWk7uc4uXCk
MLiTR2hXLf5OSTsq4hbGk2TBgvPPmzCrFOJu92UllBEkveYBd/2AP4U8e5mfx/vx
cFzWKXVskWQ9bWy9Q98DGtKM9Ojf7ZgxGsF3r98yxy7O4JCO3lNBJf+aug/Glhw4
qcFsmmXfIXIdIWnmfO5X1v/RQdHEldzwTdyqR1L2LXyDy9jONdpp8lcKXyEbr3L3
XCv4gnZE44IdI3ZDu7SLGBk1kCAa7HP6p2Tdkg+h4igQidlDcFPu63iCEiRYnIcG
kTrosbzFBH3w1BHd3wE1LZbF2md0k1ra8lV4XSujtY7cqDJ24xrIEA6Rb0vjpYsw
eFgpOzcO6tDHfFp4gPKnmFceREIar9AkxSKaIK8THz8lbuJMdGY=
=nVuk
-----END PGP SIGNATURE-----

--gyfxT+HMhoGDzaoq--
