Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20644E4BF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 11:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089B26E06D;
	Fri, 12 Nov 2021 10:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5A36E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:39:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r8so14628053wra.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/tA4etxuhyZBgW9hixmUCCrsSg6AvdasJmoLdAaIxQE=;
 b=EdAdow6Os4lIv6e3u3TttIhB1XB0+uMDKb6eoD58JhAxKwJeRoWozD00Z5qM/iUBxt
 2hlBwSMZa+2UXkAU5tZkTFCFm5O1Z/G0pFcp/WXucu6Vx9QJf8lOGqBt515CgDZXqnl3
 UUNPAE8CI2KBwfOp5UXM3nYdqI8mPCZH86I3X08WbLHYCCfuJ+SmnGhjAWfxO5xRdECh
 k0hinCoIh9EyJ1IWmjFp9WIeyc1c0VcWIo3nHWrBiZ1RK5yE+Rni9NzPyK0KmUpqIHYJ
 W0Zh8gJhHiuLuMa0I22+ujwQv7C4rJItjJgPQbtA3He0HWWT8n4POCuKPNyqNLh0oyAL
 Gdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/tA4etxuhyZBgW9hixmUCCrsSg6AvdasJmoLdAaIxQE=;
 b=rdWdWg5YC/4yCGr6AILyqeViOf8zDN1e3BlLGAa7ihIU1dGsWIpKRC4EbrUj/ezcYe
 m+hfOlCTQoWwW7Ak/FdzkmJnfzzLArBi89E7kyL7tLUeswaUqU1I5RjtSFmEKTS89NiJ
 QPNk4r9y92g3fEe36QxC5cyrptV3n9VIdazOtPm1xj7UjMyCTWk/a+Q32F0+GwuWn6LV
 y0xoHk9Z65l1Da9vd8PLz0/uTHAZwZU/WQ5AIJ3D6w+EBENPzlBJpj+l4haLjVXO18AE
 epvbP3cfIgC9hAuYw1OMC5hnHXRrY0oMmp3mGufG4Aiycz2bSIvYi3FrDeA/h3VyhLgU
 P+0Q==
X-Gm-Message-State: AOAM532WfmuT1P1eSK4+4UjCAwd5Gy8R3FW4GwhjQlyQdbNsnhcjS2Eh
 YWLt7e8BZ8Tu13NfFCHETQ4uqBFX8MXmZw==
X-Google-Smtp-Source: ABdhPJzD9b36/vyCl7zzuYTxH7IlwYQNh3wC3vx69x0dRHzwbgOGgweC2PFs479G/M8675bUXnWqzw==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr17957650wrb.50.1636713567440; 
 Fri, 12 Nov 2021 02:39:27 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id n13sm5421483wrt.44.2021.11.12.02.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:39:26 -0800 (PST)
Date: Fri, 12 Nov 2021 11:39:23 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] drm/tegra: Changes for v5.16-rc1
Message-ID: <YY5EWyMaGcZjdmvQ@orome.fritz.box>
References: <20211008202334.1679411-1-thierry.reding@gmail.com>
 <YYTybH9cEcmJUaVc@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kmATN04C7Jh6sTdw"
Content-Disposition: inline
In-Reply-To: <YYTybH9cEcmJUaVc@orome.fritz.box>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kmATN04C7Jh6sTdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 09:59:24AM +0100, Thierry Reding wrote:
> On Fri, Oct 08, 2021 at 10:23:34PM +0200, Thierry Reding wrote:
> > Hi Dave, Daniel,
> >=20
> > The following changes since commit c3dbfb9c49eef7d07904e5fd5e158dd6688b=
bab3:
> >=20
> >   gpu: host1x: Plug potential memory leak (2021-09-16 18:06:52 +0200)
> >=20
> > are available in the Git repository at:
> >=20
> >   ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.16=
-rc1
> >=20
> > for you to fetch changes up to 5dccbc9de8f0071eb731b4de81d0638ea6c06a53:
> >=20
> >   drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+ (2021-10-08 =
21:17:38 +0200)
> >=20
> > This is based on the drm/tegra/for-5.15-rc3 tag that you pulled a couple
> > of weeks ago. As mentioned last time already, the userspace for the new
> > NVDEC driver can be found here:
> >=20
> >   https://github.com/cyndis/vaapi-tegra-driver
> >=20
> > I'm sending this a week earlier than usual because I'm out of office
> > next week.
>=20
> Hi guys,
>=20
> I haven't seen this show up in drm-next yet. Did this fall through the
> cracks or was there something that you wanted to see addressed?

Dave, Daniel,

v5.16-rc1 is due in a couple of days, but I still don't see this in
drm/next. I'm assuming it's too late now, but is there anything I can do
to avoid this in the future?

Thierry

--kmATN04C7Jh6sTdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGORFsACgkQ3SOs138+
s6GhIw/+KFsP6gkqMlksVuM3Hwhuxb527bTc92IQ3KwYgjV1SAK5OVVFTagU6Y/T
Cg40hp/C1vPcihHG84AOj2mnAqyLd74JaNEgIR7Z49Yf0YWZcz+OZQ41d9Pb+XnZ
9X4VYJGJ9HPzQENLvFQUBfvwSAfxP6559t53f0yrRyCRh2grhKSMYKOwxRc3sjf0
oOqdVLZvomPaGDKHR+hmr2D3jCYyfKfGua5H2BYAduu14I765ELte/DRBc68XQ8w
lzfXEi4ifvUjgI87oHGi6vQBlY3BPfAElP5hA+Y/hKT2qDz0KeydHUn95D4PxFno
i09+/77nIGV8S9e2clPu64tdn1gnasf9/6PvxR6JHMqyP6zm27OocXpOb/moHdDm
v14iv/y0xlmb8d6aBD9Fl8cp0I6r9EV04Oys4A0WfNZzSgpK1R6dL86FneVi0f1O
tA4s7pdD+FyhmpuPYM3pp7WVc1tccXn7bE+CskHbC2QFbxfi9SghRBKMop/Z2KGp
F6HOjyVfI7hI7cd468/cprs+s5eP7kfUFlHrFxk/G9F20e7/J6DbFNKFcgYZwBxh
+7+cBRD35kRAWW755cJNhEwiHPIeOOHUsowHsxI0jky/dMYMXyrsxC7Rjy43kXrm
iTv9LmqWT13ylK2qPqB+nX3N+yjauzRhWSFl/uh2iODmHAWxAFU=
=8pZQ
-----END PGP SIGNATURE-----

--kmATN04C7Jh6sTdw--
