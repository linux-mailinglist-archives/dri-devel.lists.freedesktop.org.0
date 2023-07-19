Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F3759006
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6B810E423;
	Wed, 19 Jul 2023 08:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4568B10E424
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:17:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qM2MY-0003qe-Oa; Wed, 19 Jul 2023 10:16:46 +0200
Message-ID: <499938f424957fcf0fd3a9def157866d44f4ee3b.camel@pengutronix.de>
Subject: Re: [PATCH v1 3/8] drm/etnaviv: Drop the second argument of the
 etnaviv_gem_new_impl()
From: Lucas Stach <l.stach@pengutronix.de>
To: suijingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <sui.jingfeng@linux.dev>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Jul 2023 10:16:41 +0200
In-Reply-To: <06b291d4-9cab-5179-2a90-a73449ddb2dd@loongson.cn>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-4-sui.jingfeng@linux.dev>
 <862358e67a6f118b11ba16fb94828e9d1635cb66.camel@pengutronix.de>
 <e3a05204-61fe-2318-5f06-fd12addfe2e9@loongson.cn>
 <ee96ed1a1ff12656f6e6542ae928fb526a9758fe.camel@pengutronix.de>
 <06b291d4-9cab-5179-2a90-a73449ddb2dd@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: loongson-kernel@lists.loongnix.cn, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingfeng,

Am Mittwoch, dem 19.07.2023 um 00:16 +0800 schrieb suijingfeng:
> Hi,
> > >=20
[...]
> > > I don't think you are right here.
> > >=20
> > Yes, clearly I was not taking into account the differences between
> > drm_gem_private_object_init and drm_gem_object_init properly. Please
> > disregard my comment, this patch is good as-is.
>=20
> I have study your patch in the past frequently.
>=20
> As you could solve very complex(and difficulty) bugs.
>=20
> So I still believe that you know everything about etnaviv.
>=20
While flattering, even I myself am not thinking I know everything about
etnaviv. The different HW generations and the complex subsystem the
driver is living in doesn't make it easy for anyone to keep in mind
everything.

> I'm just wondering that you are designing the traps. But I'm not sure.
>=20
Certainly not. I'm just human and do make mistakes as everyone. During
the quick scrolling though the code when reviewing this patch my mind
clearly just dropped the _private_ part of one of the function names. I
appreciate being told when I am wrong and I do believe that the
exchange during the review is helpful for everyone to get on the same
page.

Regards,
Lucas

> Okay, still acceptable.
>=20
> Because communicate will you is interesting.
>=20
> Thank you.
>=20
> > Regards,
> > Lucas
> >=20
> > > > Regards,
> > > > Lucas
> > > >=20
> > > > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > > > ---
> > > > >    drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 +++----
> > > > >    1 file changed, 3 insertions(+), 4 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/=
drm/etnaviv/etnaviv_gem.c
> > > > > index b5f73502e3dd..be2f459c66b5 100644
> > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > > > @@ -542,7 +542,7 @@ static const struct drm_gem_object_funcs etna=
viv_gem_object_funcs =3D {
> > > > >    	.vm_ops =3D &vm_ops,
> > > > >    };
> > > > >   =20
> > > > > -static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size=
, u32 flags,
> > > > > +static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flag=
s,
> > > > >    	const struct etnaviv_gem_ops *ops, struct drm_gem_object **ob=
j)
> > > > >    {
> > > > >    	struct etnaviv_gem_object *etnaviv_obj;
> > > > > @@ -591,8 +591,7 @@ int etnaviv_gem_new_handle(struct drm_device =
*dev, struct drm_file *file,
> > > > >   =20
> > > > >    	size =3D PAGE_ALIGN(size);
> > > > >   =20
> > > > > -	ret =3D etnaviv_gem_new_impl(dev, size, flags,
> > > > > -				   &etnaviv_gem_shmem_ops, &obj);
> > > > > +	ret =3D etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops=
, &obj);
> > > > >    	if (ret)
> > > > >    		goto fail;
> > > > >   =20
> > > > > @@ -627,7 +626,7 @@ int etnaviv_gem_new_private(struct drm_device=
 *dev, size_t size, u32 flags,
> > > > >    	struct drm_gem_object *obj;
> > > > >    	int ret;
> > > > >   =20
> > > > > -	ret =3D etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
> > > > > +	ret =3D etnaviv_gem_new_impl(dev, flags, ops, &obj);
> > > > >    	if (ret)
> > > > >    		return ret;
> > > > >   =20
>=20

