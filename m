Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8EFA2B006
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231A610E8F9;
	Thu,  6 Feb 2025 18:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZuAfXx4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DCE10E8F9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:13:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E212A443EA;
 Thu,  6 Feb 2025 18:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A66FC4CEDD;
 Thu,  6 Feb 2025 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738865632;
 bh=qpRlHeJcZ8Rg6GiEylH3nJ6t0qFUQU58DAXj2IT1v4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZuAfXx4ZNiYZ3TZP7ZCllR1EQpRwKvsaMCxW7EeC61cyMdVUePlhC8egRPP7pOOjT
 ybgmbOEqGeixDpRnUWEnwAgC/sjzJ57umRUGkIhKpHHZGKhyuRYjS+uTsar8qHREMP
 XCyXzAQNqTISYzEaeJeRc6SqI9YAoExu6ZkjGraoFR7Z02QKUxbckRMAJ6829veUxI
 i9irRJ3mbxm3gs5eyp9H3gh7zP3xK8IwYR43SmtPJWjyQG1LgZZ/+ZjHucmGxfo1Rp
 AbaD2a6rE3ujFdrrs1d/0wUMRcJjaFlrLCEvw/vRrMGX+lR93t1BsxP64h97TAlntu
 XscmKC2irtFNQ==
Date: Thu, 6 Feb 2025 18:13:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add csot
Message-ID: <20250206-overlaid-eastward-610a0d6e34cd@spud>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BCdvD9ZIbZN+8WvF"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
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


--BCdvD9ZIbZN+8WvF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 09:12:45AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
> <yelangyan@huaqin.corp-partner.google.com> wrote:
> >
> > Add "csot" to the Devicetree Vendor Prefix Registry.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 42d14899d584..375f1f7c79ef 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -336,6 +336,8 @@ patternProperties:
> >      description: Crystalfontz America, Inc.
> >    "^csky,.*":
> >      description: Hangzhou C-SKY Microsystems Co., Ltd
> > +  "^csot,.*":
> > +    description: Guangzhou China Star Optoelectronics Technology Co., =
Ltd
>=20
> Doing a `git log` on
> `Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
> most patches use the subject prefix `dt-bindings: vendor-prefixes`,
> not `dt-bindings: vendor`. If device-tree folks care about this
> difference and they don't want to fix it when applying, they might
> request you to send a new version.
>=20
> In any case, that's fairly minor so I'm OK with:
>=20
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>=20
> I would assume this will go through the DT tree, not drm-misc. If this
> is wrong then someone should shout.

idk, probably the whole series should go together via drm-misc.
%subject can change if there's a resubmission, otherwise
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--BCdvD9ZIbZN+8WvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T72wAKCRB4tDGHoIJi
0j/SAPoC/C0pCB6Rfsu3yKehTDKPZcAfV2TvGOVKD5gwb5RWPgD+PFLgD3XA0PVE
VHMkn6PRxKBvUAwsB1Vmq2uHw3SItQE=
=gFPY
-----END PGP SIGNATURE-----

--BCdvD9ZIbZN+8WvF--
