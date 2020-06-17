Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE0F1FD24B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99316E83D;
	Wed, 17 Jun 2020 16:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F156E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:37:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x6so3012452wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AUIhozUi3FnUlf2LFKvC/KhhSsVgBkUP4FWbfMkq2vc=;
 b=PJZqyUYacHG3xEblT29YiFoEthYrIsG8i4wZ0rpkpUGURL89H+ItMLHNtxpRligazo
 6mTGNBJ4nMmEKb0Jt7UuXwCYQRvNn2k3QTOzxkUBw69Up1RgTeMmz7FvW/E6udjNagUN
 T/TqRkY0/xrnWnILv0jizv4ZJJ4K7L4k3wGTyGqywsU0foY2Dultc0WfIGET2RvwKJTr
 1n3PKHoqsWP7LSpqFBz+TzMAlGoR3/Rx2kEx5bse5hsP4sXV54XB+tSZ6v2Pbbv5/9kb
 +Ltct2JjqM60ev9ec/o1kmGgTiGwbTO2Vb4fNgQQKXwSDOVZN2JZ+Zm6S6WoqJIItcbh
 7lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AUIhozUi3FnUlf2LFKvC/KhhSsVgBkUP4FWbfMkq2vc=;
 b=Qwstz5ctGlQsJMpvMZ6AvbpE/IMq88tvzihFt2jpvU9R4/pIRDsL7CV50/l3u36XfI
 a2P2eJDlIOwDvuO6fo8BLJ1wgF4y5RFy4TlkGDG10oAm8ysKM1kVWWqZLybZHG51AHkx
 cEGWl5Y4JzKs+H482q5AoCs3tTI39MbF6316YeOGvndYaVjYiMlsMmN5SSe3p4670sGK
 vdLT+XcBgo7dN2RjT3y8S+EPC9VyiDk7uhtSc0P1f7AwsQ57RyPZ/Sla/tU7we8AU0fZ
 g06yZjf23ux1tb9HpcF/VFAebWcktoAv2WY90DqPi4KwKThafyQq0j852mcEj7Uek2kd
 XKRg==
X-Gm-Message-State: AOAM530CIBCuvULLWP7RG53r85hBJCV0YA3dV73IvxuPUiQDsMfQIGvN
 y8U9XEWXlgdqkodlT/E6Ffg=
X-Google-Smtp-Source: ABdhPJxT4PsvouJfW1w3G5z+qhlTObNQ3f14x0DrEHs0bwps9UY1evXFQXVeytUqnw3TFzh2ca5eaA==
X-Received: by 2002:a05:6000:12c2:: with SMTP id
 l2mr88072wrx.133.1592411848611; 
 Wed, 17 Jun 2020 09:37:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id z206sm299227wmg.30.2020.06.17.09.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 09:37:26 -0700 (PDT)
Date: Wed, 17 Jun 2020 18:37:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
Message-ID: <20200617163724.GA3547875@ulmo>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
 <20200617141015.GB3536291@ulmo>
 <cef8e371-03a8-455e-561d-fca9d0b88309@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cef8e371-03a8-455e-561d-fca9d0b88309@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1328610921=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1328610921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 05:20:14PM +0300, Dmitry Osipenko wrote:
> 17.06.2020 17:10, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jun 16, 2020 at 09:39:19PM +0300, Dmitry Osipenko wrote:
> >> 16.06.2020 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> >>> have a zpos property") a warning is emitted if there's a mix of planes
> >>> with and without a zpos property.
> >>>
> >>> On Tegra, cursor planes are always composited on top of all other
> >>> planes, which is why they never had a zpos property attached to them.
> >>> However, since the composition order is fixed, this is trivial to
> >>> remedy by simply attaching an immutable zpos property to them.
> >>>
> >>> v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
> >>> v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)
> >>>
> >>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/gpu/drm/tegra/dc.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> >>> index 83f31c6e891c..04d6848d19fc 100644
> >>> --- a/drivers/gpu/drm/tegra/dc.c
> >>> +++ b/drivers/gpu/drm/tegra/dc.c
> >>> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_cr=
eate(struct drm_device *drm,
> >>>  	}
> >>> =20
> >>>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs=
);
> >>> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
> >>> =20
> >>>  	return &plane->base;
> >>>  }
> >>>
> >>
> >> Looks nice, thanks! Since you dropped all other zpos changes for other
> >> planes and given that the other planes have 255 for the max zpos, what
> >> about to set the cursor's zpos to 256?
> >=20
> > I'd prefer to have all of the planes' zpos within the same range. By
> > default the other planes will be on the very bottom end of that range
> > and the atomic core will normalize the zpos for all planes anyway, so
> > the cursor plane will end up with a very small normalized zpos in the
> > end.
> >=20
> > The zpos documentation already mentions that the behaviour is undefined
> > if two planes have the same zpos value, so I think userspace is going to
> > know how to set these anyway.
> >=20
> > It might be worth to do a follow-up patch that is smarter about setting
> > the range of valid values. 0-255 is true on later chips where we
> > actually have a proper "layer depth" register field and I wanted this to
> > be uniform across all generations. Other drivers seem to set the upper
> > limit on the zpos range to be equal to the number of planes available,
> > so that there aren't potentially big gaps in the numbering. That said,
> > since the core already normalizes the zpos for us, I don't see a big
> > benefit in explicitly clipping the range.
>=20
> But the cursor plane doesn't use the "layer depth" register, doesn't it?
> So the zpos over 255 shouldn't matter in this case.
>=20
> I know that DRM should normalizes the given zpos, but still it makes me
> a bit uncomfortable knowing that there are the ranges overlap visible to
> userspace :)

Userspace has to be able to deal with this anyway because it can't make
any assumptions about what hardware supports underneath. A cursor on a
different platform may very well be stackable anywhere in the layout so
it must ensure that the cursor always has the highest zpos (provided
that that's what it wants). Immutable 255 basically just says that the
cursor is always going to be at the top. /If/ userspace then decides to
set some other plane's zpos =3D 255, then we're in the "undefined"
behaviour case that the documentation mentions, in which case the
behaviour on Tegra would still be sane in showing the cursor on top.

So I don't think there's really an issue with the overlap.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qRsEACgkQ3SOs138+
s6F/SQ/9FjgGZOAspRcVYP7wA5WZaMEpquc/ibUS8bCVYfIqr8SBd02PZ/n7EoKX
uECe9VEcOEkXHrDt0SIuO7cIZC/YDun16O+sZDvv7sTGOhf8ObmLS5Nvstvs35s2
a8DA/S2EvGZFXJ/NXurj66N71GFTVv+tBTTUSkik2pgYu2wMN2M5TcPW/YOycd4g
X1VZlg78ibN4tAEpRT14u25KILDHaJJSAqIOQiovaeykl/BcsSUS4AgDY8eNN4xN
V8NJaLpPmcceiiKxsMukpszsNqCDteIE5Dqgd7Dcyfgl5N//QL/ZJnzG+jr1JSMN
uKUDB/Py0cPDtHj5+jfEK5NnopHzi3fICJ8LNpwvXsRKMQpAPKvNINXXf/KYEful
WYuBfOfLog3gAWEeWCNjDSWu5U0SPmhMMjobMQIx5jqIqWMkyEQv632ucAd7SMQ/
A3yWQctz9dB61JXxRYPfijpj/9DQa/uh6RFdbUc55dl1zljfgn5eh6gCaXKiS0yu
iqRUrfjU3+n7w2e0bPYEpuKpuIWvTNnq9w84HoJ6rBj+ymvcKsIdi6BcN24iq50T
kh6MQDNDMv3QtmeTsJer+rHQLfaldhywBMWdOuZDi27adKThQnkIiSx7A29d36/n
KISfcBZ1vONIix6uZMLY2kpK94YgZEnFKk/1ic7erzCeLQoLmdU=
=bVhH
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

--===============1328610921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1328610921==--
