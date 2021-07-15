Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE063C9DF5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 13:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413626E827;
	Thu, 15 Jul 2021 11:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6983A6E827
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 11:45:41 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05DAE2291C;
 Thu, 15 Jul 2021 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626349540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNOiYM64D0XdBystkwy6NCXzF/faGnX77dvFKQJZz90=;
 b=AV7jvbq6DvW3jzotSD7kwBtv9bxmixN3jIxa3YxTbl6XqKMbOuaYRmUgV067qYtpRcso4Q
 sxPOUkw14SIrT/uzTAR+lp0oxD+6VCacuLW3Jhy0Hg8QAqoH8jaGtI3cTj8fdZurdtFcII
 5SXjIeaGjIIUkcivwDIq7lTd4bjypfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626349540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNOiYM64D0XdBystkwy6NCXzF/faGnX77dvFKQJZz90=;
 b=5/zsxVNPpAXvbQD0+jHZIV/Qf/mQMKVhzNOtYTYAHsHzV9N31TxS9Z4lmqOLa5oKw0VHys
 mhH3AdCG21XsScDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CECCA13D89;
 Thu, 15 Jul 2021 11:45:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id zK4OMeMf8GDbMQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 11:45:39 +0000
Subject: Re: [PATCH -next v2] drm/bochs: Fix missing pci_disable_device() on
 error in bochs_pci_probe()
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
References: <20210715020551.1030812-1-yangyingliang@huawei.com>
 <49771e7d-666a-bac3-2cd7-23008a95ad8e@suse.de>
 <22ff114a-9810-37f4-43c2-22ce55d6482f@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5d694c99-18fe-9790-df6a-d6d258b133f5@suse.de>
Date: Thu, 15 Jul 2021 13:45:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <22ff114a-9810-37f4-43c2-22ce55d6482f@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aqlkHsf0eQfhuGP9gSI1va5sw3lzu55Iq"
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
Cc: airlied@linux.ie, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aqlkHsf0eQfhuGP9gSI1va5sw3lzu55Iq
Content-Type: multipart/mixed; boundary="jiN1hXlrZAcYwDZmtPkSVWLJ0mmfLmxnR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: airlied@linux.ie, kraxel@redhat.com
Message-ID: <5d694c99-18fe-9790-df6a-d6d258b133f5@suse.de>
Subject: Re: [PATCH -next v2] drm/bochs: Fix missing pci_disable_device() on
 error in bochs_pci_probe()
References: <20210715020551.1030812-1-yangyingliang@huawei.com>
 <49771e7d-666a-bac3-2cd7-23008a95ad8e@suse.de>
 <22ff114a-9810-37f4-43c2-22ce55d6482f@huawei.com>
In-Reply-To: <22ff114a-9810-37f4-43c2-22ce55d6482f@huawei.com>

--jiN1hXlrZAcYwDZmtPkSVWLJ0mmfLmxnR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.07.21 um 13:03 schrieb Yang Yingliang:
>=20
> On 2021/7/15 17:30, Thomas Zimmermann wrote:
>> Hi,
>>
>> for the change
>>
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>>
>> but there are some style issues AFAICS.
> OK, need I resend it with the style changes and your ack ?

Please do. I'll merge it a few days later if no further comments come in.=


Best regards
Thomas

>>
>> Am 15.07.21 um 04:05 schrieb Yang Yingliang:
>>> Replace pci_enable_device() with pcim_enable_device(),
>>> pci_disable_device() will be called in release automatically.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>
>> S-o-b line goes first
>>
>>> ---
>>> v2:
>>> =C2=A0=C2=A0 use pcim_enable_device()
>>
>> This changelog should rather be located between the commit description=
=20
>> and the first S-o-b line.
>>
>> Best regards
>> Thomas
>>
>>> ---
>>> =C2=A0 drivers/gpu/drm/tiny/bochs.c | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/boch=
s.c
>>> index a2cfecfa8556..73415fa9ae0f 100644
>>> --- a/drivers/gpu/drm/tiny/bochs.c
>>> +++ b/drivers/gpu/drm/tiny/bochs.c
>>> @@ -648,7 +648,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, =

>>> const struct pci_device_id *ent
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(dev))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR=
(dev);
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D pci_enable_device(pdev);
>>> +=C2=A0=C2=A0=C2=A0 ret =3D pcim_enable_device(pdev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free_=
dev;
>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--jiN1hXlrZAcYwDZmtPkSVWLJ0mmfLmxnR--

--aqlkHsf0eQfhuGP9gSI1va5sw3lzu55Iq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDwH+MFAwAAAAAACgkQlh/E3EQov+CP
rA//VBmygDY27/jOPapIR8wIXFeNX8Mp8qn9EKO+u8UzAbM85Ylsj157m2hw4RPeusCogzJOiq5z
3XpadiQaDFjQ8emXOBZFdzHEwcxRP43V+xVYzfPtHSuagcgsOlafVJXK+MHTqRaJ8CVTGUvXfPVH
mtnsJRvXHsS71vs1hOMYyv97mKWIuvrH3eSTTroL6RBWQXX9Gs2p9JjS+s+4ur1zaPnohJ5RnCbU
OGjseWN9R7KisRcFmFrEKpBGjffo8wTb/3QkLXQ/63hGXZwWmlIsQ4uadKCY2bvPYX6j/WdSM+vP
+M2X01nBjsVKjpbJy1DJzkMf2RmQIat1IY+s4e58Y0vFPwdRKwNmC+IwayzT9432djV1KrcNu4Az
fnXS+LvuWO9U2qpiw+j1KWa6Z3AnoTjHZaWZqlMiGbtONjKWvQMaPm6CGOT0HgRE2OhvZ6VIweLy
l4DYUs6kbxpVTtYhwSyZ42rf6v89O3X8KJLLmuJLBWQx4dP3m9qztkyAY3/lB2K1VhpdGloqMFIo
8+ocheH+FtUCHPhpwEAEXk0LMQTyT0YWkhJ5wrmwp+bca9FtF7Qaszdxuask52+aYSh7Pq3qXd4d
0iYQxv2CCKeJn6J1uE+8F/VHkmANvkQdf6izpCU2xV/VIjA8ef6eINzO0THZ1Af2p3jlXfTX11Cq
ooM=
=m5u5
-----END PGP SIGNATURE-----

--aqlkHsf0eQfhuGP9gSI1va5sw3lzu55Iq--
