Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C97272580
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 15:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2259E6E2C0;
	Mon, 21 Sep 2020 13:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2416E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 13:27:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j2so12763074wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HKuU7JpLVU1PBj0jVIiCYxaLdFW/3Q4BrrvDHD/vFoM=;
 b=OjQfWOUGvS8vKD9rbIR3dJ08HDqYyREm1W/mAagKqnDl5qbkExQCWwYZwcwFzhW65d
 g+Krd0TSRSxmSrLmG6cwCGyArGhLNgVenAI6YgNEnXNPtw23BOsaJO0VC7UU2Y5zSUdU
 rHAXp2SzBL1sypBzEQA4T1xshK4AyA/D+UrLvtXtSaA+uzbKNY73Su/HeflR8CA84G90
 VfCB6s0zz4KPl0Cwl9UwkuWJqvZyf9D7xEVBidkz+JvQp/0NyCZYzCiB9lUdCN6iuhkn
 g+xG6BlS2ZsJgg1brj/iE8PJSnzt0f4pXsxdNx1aw7OLlUkVYqNxlSjmj4PgaX39GVhd
 SOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HKuU7JpLVU1PBj0jVIiCYxaLdFW/3Q4BrrvDHD/vFoM=;
 b=iyLHtcvnONXLxu9diFAX6Kr4D/s2H5PGR+auycKAP0rka4sXsk8MlD1tjqJHQmqTOK
 HL/iMAnoP7rl4wg3FLwlmIagRttWR+JAKTNCiOiJYRrSXT9uIvMQEVx+jiVfXGejuBXs
 Q0knUM286C8YwvDXJadowF8GIwXDF5NQmz9MG8VdPkWnDHvCkmHVofaN4aFIv6CIiUaO
 mJ9eObhKot3DFcanlKLAq5t6XMWtYJ5UzwQKyvqnE2WOvAZG2Fp4FgRt39xBvvkwgKl6
 +XDfgClpeJUi2WlXBvHV10AZ7rwbjyBGST7Y4xu6weQb7R0W6rOrsiLBqO7uwRGXH29/
 xLRw==
X-Gm-Message-State: AOAM531UiYvYIh4F3eAeuVE9da+KFWMHK9jC+U0FnIBlHSNqf65fgzQR
 zgzDpQgyza6xgbELqZpCfyk=
X-Google-Smtp-Source: ABdhPJwJAX4uVUX9aZ28FDXcSgA2gQ7vMBWi02ddoeec32uIkuLkE6NsU4P9DPevFlyqPCzJ83M1gw==
X-Received: by 2002:adf:e690:: with SMTP id r16mr52023767wrm.15.1600694847222; 
 Mon, 21 Sep 2020 06:27:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id g14sm21591201wrv.25.2020.09.21.06.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 06:27:25 -0700 (PDT)
Date: Mon, 21 Sep 2020 15:27:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH -next] gpu: host1x: simplify the return expression of
 host1x_cdma_init()
Message-ID: <20200921132724.GC3955907@ulmo>
References: <20200921131032.91972-1-miaoqinglang@huawei.com>
 <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
MIME-Version: 1.0
In-Reply-To: <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Qinglang Miao <miaoqinglang@huawei.com>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1065764125=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1065764125==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 04:12:20PM +0300, Mikko Perttunen wrote:
> On 9/21/20 4:10 PM, Qinglang Miao wrote:
> > Simplify the return expression.
> >=20
> > Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> > ---
> >   drivers/gpu/host1x/cdma.c | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> > index e8d3fda91..08a0f9e10 100644
> > --- a/drivers/gpu/host1x/cdma.c
> > +++ b/drivers/gpu/host1x/cdma.c
> > @@ -448,8 +448,6 @@ void host1x_cdma_update_sync_queue(struct host1x_cd=
ma *cdma,
> >    */
> >   int host1x_cdma_init(struct host1x_cdma *cdma)
> >   {
> > -	int err;
> > -
> >   	mutex_init(&cdma->lock);
> >   	init_completion(&cdma->complete);
> > @@ -459,11 +457,7 @@ int host1x_cdma_init(struct host1x_cdma *cdma)
> >   	cdma->running =3D false;
> >   	cdma->torndown =3D false;
> > -	err =3D host1x_pushbuffer_init(&cdma->push_buffer);
> > -	if (err)
> > -		return err;
> > -
> > -	return 0;
> > +	return host1x_pushbuffer_init(&cdma->push_buffer);
>=20
> IMHO, this makes it less readable since now it kind of looks like
> host1x_pushbuffer_init is returning some meaningful value, instead of the
> code just handling error values in a sequence.

Agreed. Collapsing the error handling like this also makes adding code
to the bottom of this function more complicated than necessary.

Thierry

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oqjoACgkQ3SOs138+
s6G9VBAAwKVijJXmqtUarO6foeE0wYjzdiAw+S3cuykrlg/Ji+72FwUlyjGRympc
NEzmcqnFQkYFQjNoNQNToHEni79t2WL2XmhUzElTmrkYxR5xAgwC149EOuLQXLnl
c+FLhNe6udpnt4DHTtqcL1AZRWRA+JZ02lPpObT5MzQj/t5XN8/cjgtamZbH1FHN
moaFT24SQ1V1D1wlCBan1aze4ruCppchbklRpuChNSS11loqp/Ywb3pnKlz5y+2J
xL0pVwAezOefXyJjk0TfRjYD1KvO+htYOhDJ8R71z04VpgT0vv9dlfWvzA4GUsBB
Su6w0ndEaFqw4dStkIuVFyF5jBS+idCw5r8B4GUSgBgpMxa41xmHRfVwVaD6Zab1
mX3dAswkmq9g6Z5lsXswI23BCb7v6vdh4zsvpU3dlG6CgE237cnZSZgfo2oPtsNZ
+DhjSxo4ZbnWFjU8U9MTxWi0kEXC7yZMmkw2RLCx+LDFMSAKOqNFXESfHSQoutQD
rpOedKlY1YIamxTeUD8jT0qvKR4mufH/O4XNUZTU2TPdI0ONMiIA+23McNr6RmrF
zOHwgWQUn8lYFhlgw7WtN6RXzR2Cr6Za/ekMPeAJRLwIGV9w0H6ZgmJYcA+ii4FX
fNZQHGdlivmzHPOcXFATqQgFEaAR8pUBSdnGu5CrWhXq4BpcpSk=
=SQV7
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--

--===============1065764125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1065764125==--
