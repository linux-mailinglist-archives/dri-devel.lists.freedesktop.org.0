Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF968C3DB6
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 11:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ECF10E54F;
	Mon, 13 May 2024 09:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NhQwZoBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1CD10E54F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715590989;
 bh=daajJWtyQJC8cD/Rts30WijUb6z7d2RN1Sa3EFyArm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhQwZoBTTTQzQMdVmCdinXyaGtkanVhK52RMU0Pjt9QLy9Yx+GOhFpw1Yr6yQVCRI
 qmbUiicKfrvB/bbhbZTkGh55wYc/Lydd7oHfQN5WmTl/BlHAOPG1EdqVp7sTNoNoWt
 G3t6SgREjBvI+GD8NUv3sAoN8Rn4J00sBa3IBHRbKhPIrbst8kTG/MgaqQmulupM9h
 CgrvuYsDTSfMemLYtOgfjeJE9bvQZZ9XjvGwSngMbIbSrr19bXORCukGjWFrk23QFy
 JRz7bac8zMsOS0LIO9fs3RIrh5OrEXTdgkzoSztiF1INYx1tzohdADU9u1vpyYdYem
 EfvJ7LrGmoRow==
Received: from xpredator (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B4193780480;
 Mon, 13 May 2024 09:03:08 +0000 (UTC)
Date: Mon, 13 May 2024 12:03:07 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZkHXS6iBLgRoApNl@xpredator>
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
 <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
 <Zj5JIah0jWnIn2Ix@localhost.localdomain> <ZkHKhtBmyS12i3fH@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P6ICxzxgVt0CL0kk"
Content-Disposition: inline
In-Reply-To: <ZkHKhtBmyS12i3fH@fedora>
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


--P6ICxzxgVt0CL0kk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,
On Mon, May 13, 2024 at 10:08:38AM +0200, Jos=C3=A9 Exp=C3=B3sito wrote:
> On Fri, May 10, 2024 at 06:19:45PM +0200, Louis Chauvet wrote:
> > Le 09/05/24 - 18:18, Jim Shargo a =C3=A9crit :
> > > Sima--thanks SO MUCH for going through with everything leaving a
> > > detailed review. I am excited to go through your feedback.
> > >=20
> > > It makes me extremely happy to see these patches get people excited.
> > >=20
> > > They've bounced between a few people, and I recently asked to take
> > > them over again from the folks who were most recently looking at them
> > > but haven't since had capacity to revisit them. I'd love to contribute
> > > more but I am currently pretty swamped and I probably couldn't
> > > realistically make too much headway before the middle of June.
> > >=20
> > > Jos=C3=A9--if you've got capacity and interest, I'd love to see this =
work
> > > get in! Thanks!! Please let me know your timeline and if you want to
> > > split anything up or have any questions, I'd love to help if possible.
> > > But most important to me is seeing the community benefit from the
> > > feature.
> > >=20
> > > And (in case it got lost in the shuffle of all these patches) the IGT
> > > tests really make it much easier to develop this thing. Marius has
> > > posted the most recent patches:
> > > https://lore.kernel.org/igt-dev/?q=3Dconfigfs
> > >=20
> > > Thanks!
> > > -- Jim
> > >=20
> > >=20
> > >=20
> > > On Wed, May 8, 2024 at 2:17=E2=80=AFPM Jos=C3=A9 Exp=C3=B3sito <jose.=
exposito89@gmail.com> wrote:
> > > >
> > > > Hi everyone,
> > > >
> > > > I wasn't aware of these patches, but I'm really glad they are getti=
ng
> > > > some attention, thanks a lot for your review Sima.
> > > >
> > > > Given that it's been a while since the patches were emailed, I'm not
> > > > sure if the original authors of the patches could implement your
> > > > comments. If not, I can work on it. Please let me know.
> > > >
> > > > I'm working on a Mutter feature that'd greatly benefit from this ua=
pi
> > > > and I'm sure other compositors would find it useful.
> > > >
> > > > I'll start working on a new version in a few days if nobody else is
> > > > already working on it.
> > > >
> > > > Best wishes,
> > > > Jos=C3=A9 Exp=C3=B3sito
> >=20
> > Hi all!
> >=20
> > Very nice to see other people working on this subject. As the series=20
> > seemed inactive, I started two weeks ago to rebase it on top of [1]. I=
=20
> > also started some work to use drmm_* helpers instead of using lists in=
=20
> > vkms. I currently struggle with a deadlock during rmmod.
> >=20
> > I need to clean my commits, but I can share a WIP version.
>=20
> Hi Louis,
>=20
> If you could share a RFC/WIP series it would be awesome!
>=20
> Since you are already working on the kernel patches (and I guess IGT?),
> I'll start working on a libdrm high level API to interact with VKMS from
> user-space on top of your patches. I'll share a link as soon as I have a
> draft PR.

Just out of curiosity what API would that be? These should fairly
simple that they can be configured from a shell script=20
(mount/mkdir/rm/echo/umount). Believe should be easy enough to test stuff w=
ith=20
bunch scripts like that.

Perphas landing the I-G-T tests first (assuming we're settled=20
on how exactly this would work) might be of greated help to get a green lit=
=20
the kernel driver side? Skip if vkms/configfs/something else that tells
us VKMS doesn't have ConfigFS eneabled, and run it when that is on.

The lastest iteration was shared by Jim at=20
https://lore.kernel.org/igt-dev/20230901092819.16924-1-marius.vlad@collabor=
a.com/

That way sub-sequent BAT CI would pick up issues, and can also used
independently by Louis. Should also divide the work-load evenly with
Louis focusing on the just the driver. Happy to review and test it.

>=20
> > Maybe we can discuss a bit the comment from Daniel (split init between=
=20
> > default/configfs, use or not a real platform device...)
> >=20
> > For the split, I think the first solution (struct vkms_config) can be=
=20
> > easier to understand and to implement, for two reasons:
> > - No need to distinguish between the "default" and the "configfs" devic=
es=20
> >   in the VKMS "core". All is managed with only one struct vkms_config.
> > - Most of the lifetime issue should be gone. The only thing to=20
> >   synchronize is passing this vkms_config from ConfigFS to VKMS.
>=20
> I agree, this seems like the easiest solution.
>=20
> > The drawback of this is that it can become difficult to do the "runtime=
"=20
> > configuration (today only hotplug, but I plan to add more complex stuff=
=20
> > like DP emulation, EDID selection, MST support...). Those configuration=
=20
> > must be done "at runtime" and will require a strong synchronization wit=
h=20
> > the vkms "core".
> >=20
> > Maybe we can distinguish between the "creation" and the "runtime=20
> > configuration", in two different configFS directory? Once a device is=
=20
> > created, it is moved to the "enabled" directory and will have a differe=
nt=20
> > set of attribute (connection status, current EDID...)
>=20
> Once the device is enabled (i.e, `echo 1 > /config/vkms/my-device/enabled=
`),
> would it make sense to use sysfs instead of another configfs directory?
> The advantage is that with sysfs the kernel controls the lifetime of the
> objects and I think it *might* simplify the code, but I'll need to write a
> proof of concept to see if this works.
Can indeed sysfs be used similar to ConfigFS? To me it sounds like sysfs is=
 a
view into a kernel objects, mostly for viewing and slight modifications
but not manipulating, adding/removing, on the fly, various things. Sort
of see it the other way around, device enabled with sysfs but
configuration happens through ConfigFS. At least from a user-space pov.
>=20
> > For the platform driver part, it seems logic to me to use a "real"=20
> > platform driver and a platform device for each pipeline, but I don't ha=
ve=20
> > the experience to tell if this is a good idea or not.
>=20
> I'm afraid I don't know which approach could work better. Trusting Sima a=
nd
> Ma=C3=ADra on this one.
>=20
> Jose
>=20
> > [1]: https://lore.kernel.org/dri-devel/20240409-yuv-v6-0-de1c5728fd70@b=
ootlin.com/
> >=20
> > Thanks,
> > Louis Chauvet
> >=20
> > --=20
> > Louis Chauvet, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

--P6ICxzxgVt0CL0kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmZB10gACgkQ9jQS5glH
1u9IhQ//YKKGQZru+mzohLxIFoZUEN+L25vQvgaQ9bHkgFsQeCooEON6j0FroHb8
OqHCr4RHRsVTFVHlLhaYBedE+XSKvjrPkrN8BWKeGCQptcz9NKZhyo+VPUIAIpfy
qmXvYK8IcSGU9Y7IFL1282T6FsTAg9IPRNmyH8C+t3xqsU3oiUvjldJeuPC3BO1f
ljS9pRhi30n79U8X01zdVUQMb5epurBLCtlhP8IUSwA8ttnN/g+Npvya6w3VFUgp
6szedYp12v0EJlIPjwbHkv0bPZ8s1akdSWsuCfcIuqZQOmX8gojIUZ32KZSMDQ6q
Pj617jBbCl+Y/8b4P03cfhFWgfwSQoebqpoq+qiY9ywCAYBMou0D8Qg4FZ5Zyx27
Bp81AmJ/t62rciz5QqQuhGz5DGmAE7XnBBmry8C6mhsBgMd0eqpfpjTl+9WMo5u1
CmPpRsvA9zDB4RQkrM80Jed0ddAVPLUR3yiz7NTd6dm0fBZpGyhz5LePLtbpnyNO
6XXiANPzBPJAR6/NJaL7NpoZt1/005SS68+TEFWzoWqWd/QHbDrPyhhiC9hUOKjm
YoRfK6InnY8vijp6XFMRiiaIfhxwUkIs+QnBXt5WzXrQPLHGC83Efy+OacIdBnO9
k5dcByhxrCTxZ9orig0vjf6gcTaJNO1IQ/ReErMppP8SzMA1Rco=
=G6ed
-----END PGP SIGNATURE-----

--P6ICxzxgVt0CL0kk--
