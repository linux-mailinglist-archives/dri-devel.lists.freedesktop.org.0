Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FF39F19A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC5D6EB52;
	Tue,  8 Jun 2021 09:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF586EB52
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:03:32 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9E871FD33;
 Tue,  8 Jun 2021 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623143010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=otp8EM9zzwY4iwi8W5G0jbOWB339b5Uy9mGVcyGmgNM=;
 b=XS78USUbAj4MO2C8LB9nGfmN5GgsbWQlWnw+oSnflK18qYyRHINRc/wyluFeJai1gpuSsm
 PfWZvKliuFVZ7kTcztX/erRfGktsdCDMVrHzHW9tcvYawkJ/Q0dfRJuuUEJErd4j77fk3B
 BzKOX7Fxf262QV1ukUY2SlOttDqYPfY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623143010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=otp8EM9zzwY4iwi8W5G0jbOWB339b5Uy9mGVcyGmgNM=;
 b=ZEpVfPGQHEFZ4uQNHLuP7Wn46N94zumnGeqyCGBPqroY6HPwion0Gz+jiOHIwGIboMd/75
 JQzTrLabCIU/yAAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 93E4D118DD;
 Tue,  8 Jun 2021 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623143010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=otp8EM9zzwY4iwi8W5G0jbOWB339b5Uy9mGVcyGmgNM=;
 b=XS78USUbAj4MO2C8LB9nGfmN5GgsbWQlWnw+oSnflK18qYyRHINRc/wyluFeJai1gpuSsm
 PfWZvKliuFVZ7kTcztX/erRfGktsdCDMVrHzHW9tcvYawkJ/Q0dfRJuuUEJErd4j77fk3B
 BzKOX7Fxf262QV1ukUY2SlOttDqYPfY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623143010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=otp8EM9zzwY4iwi8W5G0jbOWB339b5Uy9mGVcyGmgNM=;
 b=ZEpVfPGQHEFZ4uQNHLuP7Wn46N94zumnGeqyCGBPqroY6HPwion0Gz+jiOHIwGIboMd/75
 JQzTrLabCIU/yAAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3qR8ImIyv2BoTwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Jun 2021 09:03:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
To: Deepak Rawat <drawat.floss@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org
References: <20210527112230.1274-1-drawat.floss@gmail.com>
 <f58a001a-b411-78b0-bcfc-ca853b920a64@suse.de>
 <2cb17f7192b93dbcfb7355d6d237c88d8e58053c.camel@gmail.com>
Message-ID: <9e2afe49-f654-030a-1771-61087f630078@suse.de>
Date: Tue, 8 Jun 2021 11:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <2cb17f7192b93dbcfb7355d6d237c88d8e58053c.camel@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DwoPyd0Gh52gqyQ4erMH2LKTykKZXvM5F"
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
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DwoPyd0Gh52gqyQ4erMH2LKTykKZXvM5F
Content-Type: multipart/mixed; boundary="aHjbOLVtlSWBTJcuzoeIY5dRFs6cnWIVi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Deepak Rawat <drawat.floss@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Message-ID: <9e2afe49-f654-030a-1771-61087f630078@suse.de>
Subject: Re: [PATCH v6 1/3] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
References: <20210527112230.1274-1-drawat.floss@gmail.com>
 <f58a001a-b411-78b0-bcfc-ca853b920a64@suse.de>
 <2cb17f7192b93dbcfb7355d6d237c88d8e58053c.camel@gmail.com>
In-Reply-To: <2cb17f7192b93dbcfb7355d6d237c88d8e58053c.camel@gmail.com>

--aHjbOLVtlSWBTJcuzoeIY5dRFs6cnWIVi
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.06.21 um 17:13 schrieb Deepak Rawat:
>=20
>=20
> On Thu, 2021-05-27 at 15:35 +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> if no further comments come in, this can be moved in a few days.
>> Since
>> you'll be the maintainer, you should request commit access to the
>> drm-misc repository. See
>>
>>  =20
>> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html
>>
>> and
>>
>>  =20
>> https://drm.pages.freedesktop.org/maintainer-tools/getting-started.htm=
l
>>
>> Best regards
>> Thomas
>>
>>
>=20
> Hi Thomas,
>=20
> I have merged the patches to drm-mics-next. Thanks for your help.

Oh, you already had commit rights. Thanks for working on this driver.

Best regards
Thomas

>=20
> Deepak
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer




--aHjbOLVtlSWBTJcuzoeIY5dRFs6cnWIVi--

--DwoPyd0Gh52gqyQ4erMH2LKTykKZXvM5F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmC/MmIFAwAAAAAACgkQlh/E3EQov+By
6w//RALJ3nl74jjDpPByyKeTPUWPuOPTEGT/MflqqTM2PVOZqW+XIVmBPTuktbl4KHxlqDAZ5vv0
ezZARo3deqSdyyCjrPHa56NiSmJMI0KLkzrIZ4Y4Eo0oW+CBdIDWNY5f0Qpo8nr8MoNRFkgkt1xN
S9AsSqNWOWOkF4Swil733bhhtRkYYIENYfp6CuXEXdbVRnN5x2lN1oHqFucwWQEW81j1gyXAF0x/
i9LIO+U+bWMIGd2BZjGzre2xR8/V9JrEcqQYbinCQ38njwwXmWVjmG10+kJdLtxMnkA32O7AWYOk
pYHSkgr/YBFW8SbqqMdtX35maJBnWciWBQ33CfjFa+/6awjyvX5svnetNpzj479YaZ200Nh1C5sZ
xBM88FDGo9rHRKFe8DxRB2OgUwRJhiAD1TPbr2mLeCm1n/YyzNdNKZ9ktOnxj/YuVXdtSXNno9Nf
aA+B8y2JsFdkchqYoaAaINcK50nw6p8+jGThxEK9fO2BM4fkeG5ChcUFnOs++7g/1M9o26l4Yvat
GmsG07wRBXYI1Npy0sfgoGLLbMQ/DY5VZiS06u71JM9hHy8Un0nLTOid1bOxusN5xEcz6efJnCly
IaXL3XJCxeXwVUn2cWuWZRYRyJTF1BPatLHEiTY8mBJJPuZ6aSTlwPonFcezjrRBA/+qjn+LcdCz
emg=
=chx+
-----END PGP SIGNATURE-----

--DwoPyd0Gh52gqyQ4erMH2LKTykKZXvM5F--
