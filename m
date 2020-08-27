Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979852549F3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 17:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1634F6EB53;
	Thu, 27 Aug 2020 15:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DA16EB53
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 15:54:50 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id d26so8380737ejr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 08:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PcnV+VbshytERqdt424MTVCSN2fNBDRxKuWfy1e0p9g=;
 b=Z6GtZhatW3wqoZBO74t01ugFrEFZ4RiwNY6TJPKoSGjxXJ5nxebyKaKXKNcD+OG6Sw
 5XZ2B+e/Jnm5baVr8ePuVjWSAmTQtmUDHNa9JVmU7YtqlBNHjpKkyDPPZ9CvNCM1iIaQ
 XGo2NR+Z1XHGqTs+hkYTIrUwYB13Fu27cWwxS4i6OIvQwFVYZK1Nu5wdtAqOg1uFNhxX
 zqP1H/7UONyxKo2JCavOHySa3TAKZBtZqtdQDTgFR4MUMHth9wpfzOj8sS0f7rCOfsI2
 Gpr5+StU1XeXrEhqlI5hIvET7kvoBMfQdyb0FV6rDgZk/LNE/9MdwdBIyx4FfYNovwb3
 ORhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PcnV+VbshytERqdt424MTVCSN2fNBDRxKuWfy1e0p9g=;
 b=tEUgzmGQ1k3f2WIC2YaXg3iCnBXNaCJnyPxWbGrnC1q0VwLnQ5h2amS0CLzp1ZM0Ja
 Gd7GjXWcmCdET7xyRuiuZpM4OkwTP5fa1OuRJ2s6GvpCNuJbeJEfvstUzn6jSymtRALZ
 v8jCsTegkciNZCEh4t5wtJUmZ9mAl/zvld5Oj2h21+Hnjt5yJraDpioHUUB2rMcU6uiu
 xFX75miH2Xn6YxJQiv6hhW96BLG+9tccv9rJ9mpBMUlif1HyIYs9uJkMQ3UEKWb4reF8
 XtvAy3L/oqQoGZRRMvoXr1gohroZ0JlOoKqcsV2+U5Cb5zhFJFYTbTqYgARv3KLRZS6t
 Xgpg==
X-Gm-Message-State: AOAM532NzjFlvmTurSPY4Lsn4fWaYCEiZ1xM6CZ9CBMP51oROH1lTqLQ
 er8sIWZJwhItn/krjxPNbCA=
X-Google-Smtp-Source: ABdhPJxRN3/hHhmVWUDnuK+ITrQLAgcX6Ds84mEo8Et89wVzCgM2C1+aJm+R5X/GGEFXLDpMMN9pRA==
X-Received: by 2002:a17:906:a141:: with SMTP id
 bu1mr21592725ejb.303.1598543688596; 
 Thu, 27 Aug 2020 08:54:48 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id lh26sm2253529ejb.29.2020.08.27.08.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 08:54:47 -0700 (PDT)
Date: Thu, 27 Aug 2020 17:54:46 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
Message-ID: <20200827155446.GB1660457@ulmo>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
 <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
 <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
 <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
 <f1923a53-e799-e63c-fd22-4a6cca3b8212@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f1923a53-e799-e63c-fd22-4a6cca3b8212@gmail.com>
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
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org, hch@lst.de,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, joro@8bytes.org,
 magnus.damm@gmail.com, linux@armlinux.org.uk, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, kyungmin.park@samsung.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0382691805=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0382691805==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2020 at 10:05:14AM +0300, Dmitry Osipenko wrote:
> 24.08.2020 17:01, Robin Murphy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Robin, thank you very much for the clarifications!
> >>
> >> In accordance to yours comments, this patch can't be applied until Teg=
ra
> >> SMMU will support IOMMU_DOMAIN_IDENTITY and implement def_domain_type()
> >> callback that returns IOMMU_DOMAIN_IDENTITY for the VDE device.
> >>
> >> Otherwise you're breaking the VDE driver because
> >> dma_buf_map_attachment() [1] returns the IOMMU SGT of the implicit
> >> domain which is then mapped into the VDE's explicit domain [2], and th=
is
> >> is a nonsense.
> >=20
> > It's true that iommu_dma_ops will do some work in the unattached default
> > domain, but non-coherent cache maintenance will still be performed
> > correctly on the underlying memory, which is really all that you care
> > about for this case. As for tegra_vde_iommu_map(), that seems to do the
> > right thing in only referencing the physical side of the scatterlist
> > (via iommu_map_sg()) and ignoring the DMA side, so things ought to work
> > out OK even if it is a little non-obvious.
>=20
> I'll need to double-check this, it's indeed not clear to me right now.
>=20
> I see that if Tegra DRM driver uses implicit IOMMU domain, then when VDE
> driver imports DMA-buf from Terga DRM and the imported buffer will be
> auto-mapped to the implicit VDE IOVA [1].
>=20
> [1]
> https://elixir.bootlin.com/linux/v5.9-rc2/source/drivers/gpu/drm/tegra/ge=
m.c#L574
>=20
> >> Hence, either VDE driver should bypass iommu_dma_ops from the start or
> >> it needs a way to kick out the ops, like it does this using ARM's
> >> arm_iommu_detach_device().
> >>
> >>
> >> The same applies to the Tegra GPU devices, otherwise you're breaking
> >> them as well because Tegra DRM is sensible to implicit vs explicit
> >> domain.
> >=20
> > Note that Tegra DRM will only be as broken as its current state on
> > arm64, and I was under the impression that that was OK now - at least I
> > don't recall seeing any complaints since 43c5bf11a610. Although that
> > commit and the one before it are resolving the scalability issue that
> > they describe, it was very much in my mind at the time that they also
> > have the happy side-effect described above - the default domain isn't
> > *completely* out of the way, but it's far enough that sensible cases
> > should be able to work as expected.
>=20
> The Tegra DRM has a very special quirk for ARM32 that was added in this
> commit [2] and driver relies on checking of whether explicit or implicit
> IOMMU is used in order to activate the quirk.
>=20
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D273da5a046965ccf0ec79eb63f2d5173467e20fa
>=20
> Once the implicit IOMMU is used for the DRM driver, the quirk no longer
> works (if I'm not missing something). This problem needs to be resolved
> before implicit IOMMU could be used by the Tegra DRM on ARM32.
>=20
> >> BTW, I tried to apply this series and T30 doesn't boot anymore. I don't
> >> have more info for now.
> >=20
> > Yeah, I'm still trying to get to the bottom of whether it's actually
> > working as intended at all, even on my RK3288. So far my debugging
> > instrumentation has been confusingly inconclusive :/
>=20
> Surely it will take some time to resolve all the problems and it's great
> that you're pushing this work!
>=20
> I'll try to help with fixing the ARM32 Tegra side of the problems. I
> added this to my "TODO" list and should be able to take a closer look
> during of this/next weeks!

I do have a patch lying around somewhere that implements the mapping
cache that was referenced in the above commit. Let me know if I should
dig that up and send it out.

Thierry

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9H10YACgkQ3SOs138+
s6Ho9xAAt8+JWNLQEvoZD8j6kfevMWDRg0X0JAvc+NErkw6iIO/KuWqz3Y/jDzWT
Vraw9q+W0ymCn89hebC5Hi4VTmbi3EohsXFiF0as4NxOztIlv1h9Ec2yBfbdUYoW
q7TUcv5wINDh7d4m2xCM11GhqtfHedHnsN2w8tY4bC/1FnZk+g6pSVQX3I+LQsZP
XQbMKdiSWemTYW4gGJhf4Avo178lfXznY0YEmRaC988RpXUpOqT2VPAMwPKXMFzQ
xhFXRBbTVdmVFVpJo4a9zGO3HZ7iGnEs6wUOL0f9G/xenc9AIj4zEsprdj/9JaYW
keFknUwowh4Sg1bD7sGbNVKl7+gVaXQCL1J2EiaPDqORtwXjXbo7mzJ8tlPgEISW
bdhpBPsZS9SakpTKjd1JikXOjclR+XZhKMjEnBY+IaK5D7MF4t9QlZonxFQWK0aR
JrDNHA2SfMZala2hPO9YWiY/FapI+6GRnEFYNLA6Od0DhSprgo7eOTxWD1cyqAhH
UdqeiM35WVK46L3dgr+UXvD2gRoQqxyIvsP8f5FHJUtih88cGCPuBvxMknSt1mnz
FGiRpuz9MMbPzZEHffFNTq92iQ/22KuXOj6qvG2QZLQgsfzvbat1pOmTnZn7vFW1
z66DSPsCdi8MmBTsbJLyoKfO7i0bmN+qktNSjgEIM/Rt+dsKmmQ=
=ZkWM
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--

--===============0382691805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0382691805==--
