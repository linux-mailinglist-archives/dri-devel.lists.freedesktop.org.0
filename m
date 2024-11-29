Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D49DE83F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 15:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E0110E4BB;
	Fri, 29 Nov 2024 14:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AKLNmRw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE7E10E4BB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 14:06:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C69E5C4540;
 Fri, 29 Nov 2024 14:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E69C4CECF;
 Fri, 29 Nov 2024 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732889207;
 bh=hk1dUhkqjezd5sMyR4uDv6jROMQ7Fj21mY6aqTI1bHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AKLNmRw0/SmMLjWf+LL6tx7jA+Cty4jeXsBltSfyWq2f8yPLdphKCN3NDf6CH77Lh
 xubeGc/YpGEJLFEQPoomgCxfU3hdIf2sXi9pn+eN6Fm06No8TT1X6PzCVxBeIIkQKh
 D3wuBSYp9RT9pGEZsI/t3POtxx1pDYW7UnWNDEQew8lM024tMt1CKZLqxwWdCUP9ub
 Q7EVqGZ6UyETBDNPtkkwLaBhVmUOhJ9W56axmGbD3C6FP1IEYYzMjBVH8ZyIkfPaWo
 L9lmL/0r+QQJ96h83+71s/Jj2rzfYtjFGfW6kiRJDtiaW3Ge3ykLrWBtW39JzRNODc
 mvAxNcQL6leAw==
Date: Fri, 29 Nov 2024 15:06:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Algea Cao <algea.cao@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
Message-ID: <20241129-mottled-satisfied-dormouse-7caf27@houat>
References: <20241018151016.3496613-1-arnd@kernel.org>
 <20241104172950.GA741087@thelio-3990X>
 <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com>
 <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
 <CAMuHMdUC6cq+ybVzOC9n3XaT-x3oy+7tpA+Z=e8a4yd3B6Ykng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7i2k3qplgecpqbs7"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUC6cq+ybVzOC9n3XaT-x3oy+7tpA+Z=e8a4yd3B6Ykng@mail.gmail.com>
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


--7i2k3qplgecpqbs7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
MIME-Version: 1.0

On Mon, Nov 25, 2024 at 11:35:58AM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Fri, Nov 22, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > On Fri, Nov 22, 2024 at 09:36:16AM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Nov 4, 2024 at 6:30=E2=80=AFPM Nathan Chancellor <nathan@kern=
el.org> wrote:
> > > > On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> > > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > >
> > > > > Dividing a 64-bit integer prevents building this for 32-bit targe=
ts:
> > > > >
> > > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rock=
chipdrm.ko] undefined!
> > > > >
> > > > > As this function is not performance criticial, just Use the div_u=
64() helper.
> > > > >
> > > > > Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output =
support")
> > > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > >
> > > > Can someone please pick this up? It is still broken in next-2024110=
4...
> > > >
> > > > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-inte=
gration2/builds/2oNvJFRj8tkDieb6VfrMf4rh1Kn/build.log
> > > >
> > > > > ---
> > > > >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/dri=
vers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > > index 9c796ee4c303..c8b362cc2b95 100644
> > > > > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > > @@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(=
struct drm_encoder *encoder)
> > > > >                * comment in rk_hdptx_phy_power_on() from
> > > > >                * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > > > >                */
> > > > > -             phy_set_bus_width(hdmi->phy, rate / 100);
> > > > > +             phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
> > > > >       }
> > > > >  }
> > >
> > > noreply@ellerman.id.au has just told me this build issue is now upstr=
eam:
> > >
> > >     FAILED linus/m68k-allmodconfig/m68k-gcc8.1 Fri Nov 22, 05:34
> > >     http://kisskb.ellerman.id.au/kisskb/buildresult/15277242/
> > >
> > >     Commit:   Merge tag 'drm-next-2024-11-21' of
> > > https://gitlab.freedesktop.org/drm/kernel
> > >               28eb75e178d389d325f1666e422bc13bbbb9804c
> > >     Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30
> > >
> > >     ERROR: modpost: "__udivdi3"
> > > [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
> > >
> > > Applying this patch fixes it, so
> > > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >
> > > Do we really need +5 weeks to apply a fix for a reported build issue?
> >
> > Do we really need that kind of comments?
> >
> > It was applied already, I made sure it's part of the next PR we send to
> > Linus. And it should be in linux-next tomorrow.
>=20
> Thank you, I can confirm it is now commit 818956c76517e127
> ("drm/rockchip: avoid 64-bit division") in drm-misc/for-linux-next
> and next-20241125.
>=20
> Interestingly, the commit description contains:
>=20
>     (cherry picked from commit 4b64b4a81fcd51f570c046cf904aef19ec756d45)
>=20
> which is not in any tree on git.kernel.org, but the github collective
> does know about it:
> https://github.com/torvalds/linux/commit/4b64b4a81fcd51f570c046cf904aef19=
ec756d45

The commit is in drm-misc-next, which will land in 6.14.

> Probably you want to drop that line.

We don't rebase anyway :/

Maxime

--7i2k3qplgecpqbs7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0nKdAAKCRAnX84Zoj2+
dikEAYDvsIQwG9bew2mXnojYuIclQccLNeCFpo3HINAJB6xIl9WdMYU4OfeC95n2
u/XxOu4Bf0YtqfO3bC542YUr94xAXt80D93ZW1hfv0QIXyOCiVmf7WvGrzYqIYOT
VzevyU2hMg==
=f5Cd
-----END PGP SIGNATURE-----

--7i2k3qplgecpqbs7--
