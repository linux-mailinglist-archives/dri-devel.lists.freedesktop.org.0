Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5317E2764
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 15:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E7010E33B;
	Mon,  6 Nov 2023 14:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38E410E33B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 14:44:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1970D60F89;
 Mon,  6 Nov 2023 14:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED10C433C9;
 Mon,  6 Nov 2023 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699281885;
 bh=7L3lZ+M6F/MppCLKLJ3iMRw+h1ZtHpfsvkLcJii+LsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IjUNNP4Gt06LniIuHdfYaXlzq3i4Mb37385CLH7PiVnaf2MlUqv+G6hRGDzHdKoz+
 3yg6gp2iA0AFuSRNn7q8XfR7NmNdW/QdgR0a5nuJIlsG8NMxHBKwUfKIZAudcsf3kb
 Phvbgfu25RYjdyIO0n9+MTPoVRiorHVNHmBax6VRf/xevRbD8jbaN0BVMpsd9uB24z
 GHHcG5Aic/vRwhRKGO5V8r/w6fQGW/H8tThg5HmEbU3y6gJXeHyuyk6OpW3UjZqOPx
 +bHa05Lpel4pt+oBEc8YJ+XFxEqUWFaxmTty2qkUhjb83HSh6MPYjA7S4XMgqmrFiC
 +zaoNzXbBLahQ==
Date: Mon, 6 Nov 2023 15:44:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH RFC v3 12/37] drm/connector: hdmi: Create Infoframe
 DebugFS entries
Message-ID: <fks4th6oyzpvq2hljbpt4kac5yph6lgsevslpcxrukqcxynugu@nje5bxbqxi26>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
 <20231031-kms-hdmi-connector-state-v3-12-328b0fae43a7@kernel.org>
 <806f2ad3-c80b-41e5-9388-f1af7bace8e3@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iqczjmp6rdkak4lg"
Content-Disposition: inline
In-Reply-To: <806f2ad3-c80b-41e5-9388-f1af7bace8e3@xs4all.nl>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iqczjmp6rdkak4lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Fri, Nov 03, 2023 at 10:05:18AM +0100, Hans Verkuil wrote:
> Hi Maxime,
>=20
> Thank you for posting v3, this time it runs fine on my RPi 4, thank you f=
or
> fixing that.
>=20
> I'll start working on a conformity checker for this.

Awesome :)

> > +static int create_hdmi_infoframe_files(struct drm_connector *connector,
> > +				       struct dentry *parent)
> > +{
> > +	int ret;
> > +
> > +	ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, parent, audio);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, parent, avi);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, parent, drm);
>=20
> Hmm, I had to look into the code to figure out that 'drm' stands for
> Dynamic Range and Mastering InfoFrame. While entirely correct, it is
> also very confusing in the context of the 'drm' subsystem.
>=20
> I am not quite certain what the best approach is here.
>=20
> Internally in the drm code it is talking about 'hdr' or 'hdr metadata',
> but that's a bit confusing as well since there is also an HDR Dynamic
> Metadata Extended InfoFrame defined in CTA-861, even though support for
> that is not (yet) implemented in drm.
>=20
> At minimum there should be a comment in the code explaining what drm
> stands for in this context.
>=20
> One option to consider is renaming this file to hdr_drm, thus indicating
> that this is HDR related.

I ended up doing both, thanks for the suggestion

> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, parent, spd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, parent, vendor);
>=20
> There may be multiple vendor specific InfoFrames in the future, so how
> would that be handled? Perhaps add a comment here that currently only one
> vendor specific InfoFrame is supported, but suggest how to handle multiple
> VSIFs in the future.
>=20
> What would actually be nice (although probably not that easy to fix) is if
> the name of the file would be "vendor-XXXXXX' where 'XXXXXX' is the IEEE =
OUI
> number.

I guess it's not entirely clear to me what that would look like. In
order for the framework to create the debugfs files, we would need some
enumeration mechanism (probably through a callback?), and then the
driver would generate the entire content of that file.

Which makes me question whether the framework should be initialised at
all? Maybe the simpler would be to just have drivers maintain their own
debugfs files and storing the content in their own, private, structure.

Maxime

--iqczjmp6rdkak4lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUj72wAKCRDj7w1vZxhR
xfojAP95jr0AZ4P/3Y/Vc2+1qdxUbHRPfB06V4FUfB1vOsUxEQD+IT5SF4zDLWqj
FlE+HCqFEp49j6+Zd9e2tvMQ73psaAw=
=G/8d
-----END PGP SIGNATURE-----

--iqczjmp6rdkak4lg--
