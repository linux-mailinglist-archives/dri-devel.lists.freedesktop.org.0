Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A04F2549C7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 17:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD9A6E0D4;
	Thu, 27 Aug 2020 15:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEBA6E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 15:45:06 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c8so5329621edn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=74Ao/c7oeFoBT1F8v8BlKUziYBzWC4YEYws/h439jKs=;
 b=AMPa8N1AoD9YB7fIeGgmF/cNowE7jTvmdnSlHkNXqWgTuHGj1LDyz6RY9dorKnL/fN
 Z30pyVOeUrs4fDWQn3hrs1dZvRxrbplQZbImRrNJNHdCgPH/5mhyGT43pJeH7xkrp6Sb
 MZBcScUrs/MJyLn42oxJRGaNJrvbJexbN1cPg2Cxkb3XtnP+LC3+ovtJFuj8hqptSUOv
 CcXCkksNHNjATY9ob/FlyIIO46cj2X4u3uwybNf4+PMBFfX+68NaraOwOxzF+DfICVCM
 VN25BNvOEthy10Y2DCDS0ilfaqRXmZ3ernBzLlAAUqcBNegk+XnORCZVVMope4D1TZQ+
 iXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=74Ao/c7oeFoBT1F8v8BlKUziYBzWC4YEYws/h439jKs=;
 b=tRfuk9n3bfdGd/8KDz3oZF5XKiK7aoQcqOsPBqkW8hxPhkCCgpDE+eldC/MzyuigDE
 haAFeOziR7YR71hlTXFUBT8u3YJuNQd9AdISJ6sqWeYx2FgK/7Jdd9IONEzKda0Ofomm
 SYOmoSXZIV2v3+oK190x2jMOCoCbdSJRI15XQxoOopfABP8uqa2+NsJZJlKcQiRZJbZA
 3eBTU5vh2B17gh60Tv6ApveLz5WDzXPqXRyxuLpD7p1nXS2mShmC31vdgZqILPWZwLFH
 xISat4r89WhPOY2kn/m845tgYyNnjxoBhpVsoxU10eeOdSo6UU/8K63RW+IjGQ3dXxTD
 Nv1w==
X-Gm-Message-State: AOAM533LfZg2TG7ZOgTDfICMq77r7Zk+qGKjV5GTyEwcZqyOEOYhVBu9
 82rZvv6+31SyBsAkkO98FGk=
X-Google-Smtp-Source: ABdhPJxRtAe6Y1ma+0338eCNyd9I0m6G1oP+UGM2tA/8xgx0U3OYLFtKYBAAwxNFg0VrZz+x/RmEmw==
X-Received: by 2002:a05:6402:3088:: with SMTP id
 de8mr20472098edb.88.1598543104973; 
 Thu, 27 Aug 2020 08:45:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u4sm1804409edt.11.2020.08.27.08.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 08:45:03 -0700 (PDT)
Date: Thu, 27 Aug 2020 17:45:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 13/18] iommu/tegra: Add IOMMU_DOMAIN_DMA support
Message-ID: <20200827154502.GA1660457@ulmo>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
MIME-Version: 1.0
In-Reply-To: <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, kyungmin.park@samsung.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============0204254377=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0204254377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 04:08:32PM +0100, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)

We can't do that yet because it will currently still break for use-cases
such as display where we don't properly set up identity mappings during
boot. The result is that the dma-iommu code will enable translations
before the driver gets a chance to set up any mappings and if the
display controller was left on by the bootloader, scanning out a splash
screen, this causes faults between the point where dma-iommu is being
set up for the display controller and where the display controller
starts mapping its own buffers (rather than the ones mapped by the
bootloader).

That said, I do have a series that I've been carrying around for longer
than I've wanted that does exactly this for Tegra SMMU and I'd prefer if
you could drop this particular change from your series so that I can
keep working on resolving the identity mapping issues first.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9H1PwACgkQ3SOs138+
s6GMrhAAqb0k0/ZQ/J5VIibNnM1oZSG1CTD/3tuwm94u1T1J++b71xlQpN0U7Fru
gJNX22olSrdpzdecS9LQ3Twqu4qgPzLazvenfBLxxrDuwS466j3hbbW8cG1Tlb/m
6lEbacziO0f91GP7ao5dAG0HIPZvIYfU1PIA/eOPnBcOlFVvWVfCnN6gOjPOSocz
20X/S1W6d5Jo7x2T0PtA0TFpD9BZVzjZA2q9XVzPSxkqLfEVMU00Yp/TnHySfWJ3
+sfRxeaUl5Ysjrtkd5YeFoIGlVctyKIKtGCIR60HU4bPlB4cdaVaaJBVkJAM7kQh
p+UGnGgl09/DyAe57qVaEWsbcXwHaxeveFmdjMHn9y0veGidzQPg0KtDUL2k7D3V
NXHKnets8HdkODT8PjTSbS3ELLEHf1GxsYAcR9aHvV1FLMl3c/8ZmMA1RZ5CIAbD
rmFaxQENmVHUev0lQnwlYP7Wwt2YyXc62L9UfyhrIkQjHmm/D+uIlPmjkr/YDreI
xndQ7H0OgVFKuc9nfSpnBOgIEeLDNr2AA59wzUxHikB+5MfDyxOk5TqnsjdcqSqr
b8257AC5ZWe79OOD0/hwDAlmSlx/hB3lO2kmm3BhLX+5tOTQv7vTSgr9BTppkZrD
dQHiT2TjMsiQyBhXhceazD0hhSAC3MSh1+TpgLDrBy2Sh96zUQ8=
=Dzgn
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

--===============0204254377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0204254377==--
