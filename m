Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E83C8171
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 11:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21806E1E0;
	Wed, 14 Jul 2021 09:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F1B6E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:21:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4E34229FB;
 Wed, 14 Jul 2021 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626254508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+sy6PE7HATWBWi34Qlea4lbKHZ+KnRq7LLyXvTID244=;
 b=vDW7bGOHgACaftgmRFKcf2uC85NIjfPs7tQ53GmXvArDj3A+YkZyPX1Ky8NTzoxK+CRrRO
 nWct9nywqfjLai5vHgfqTpoDay5oHoktrdudplrEvF6kuj8aQcrrKsRy2X5m2LwmCYK5fd
 y1mFy/FppTy22dqTuHmvWNkaPojbjpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626254508;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+sy6PE7HATWBWi34Qlea4lbKHZ+KnRq7LLyXvTID244=;
 b=FFN7W871YuS2QtltDc9AkbXq0vaXp5Tnr7l06lsLAus59nCrB414VZeejuDQTLO9S3p6B2
 dQ1nN46qDv6nblCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6F14C13A79;
 Wed, 14 Jul 2021 09:21:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id jWIyGays7mCwCwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 14 Jul 2021 09:21:48 +0000
Subject: Re: [PATCH -next] drm/bochs: Fix missing pci_disable_device() on
 error in bochs_pci_probe()
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
References: <20210714083903.205552-1-yangyingliang@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e75736ae-dbe0-7422-1b03-72de84755090@suse.de>
Date: Wed, 14 Jul 2021 11:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714083903.205552-1-yangyingliang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eh8yMvZ2QsKcqPVd8H4Fhlq6BNHbG7ueO"
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
--eh8yMvZ2QsKcqPVd8H4Fhlq6BNHbG7ueO
Content-Type: multipart/mixed; boundary="D2w0zk9in6VlbyWGfW2rRh68ZFFcEYAL0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: airlied@linux.ie, kraxel@redhat.com
Message-ID: <e75736ae-dbe0-7422-1b03-72de84755090@suse.de>
Subject: Re: [PATCH -next] drm/bochs: Fix missing pci_disable_device() on
 error in bochs_pci_probe()
References: <20210714083903.205552-1-yangyingliang@huawei.com>
In-Reply-To: <20210714083903.205552-1-yangyingliang@huawei.com>

--D2w0zk9in6VlbyWGfW2rRh68ZFFcEYAL0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.07.21 um 10:39 schrieb Yang Yingliang:
> Fix the missing pci_disable_device() before return
> from bochs_pci_probe() in the error handling case.

It's maybe better to replace pci_enable_device() with=20
pcim_enable_device(), [1] so that the release happens automatically.=20
Does this work?

Best regards
Thomas

https://elixir.bootlin.com/linux/v5.13.1/source/drivers/pci/pci.c#L2042

>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.=
c
> index a2cfecfa8556..74832b9d3eae 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -666,6 +666,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, co=
nst struct pci_device_id *ent
>   	return ret;
>  =20
>   err_free_dev:
> +	pci_disable_device(pdev);
>   	drm_dev_put(dev);
>   	return ret;
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--D2w0zk9in6VlbyWGfW2rRh68ZFFcEYAL0--

--eh8yMvZ2QsKcqPVd8H4Fhlq6BNHbG7ueO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDurKsFAwAAAAAACgkQlh/E3EQov+Bc
/w//YU2JJd6L4kcRmcl/W7fZNpNN5tzcjL4jMdquWM+H1PKXSRUZAq+YT2RYCDTzJV7hZUhttwXH
pPgYq3bmAhz8tB0sZZcJCMRCWjM6UaTTGKNQSglCEOpXoB+LDPdcl2kd2CcHvKgnOPvtkIqY8QRr
qGla2LBE7dKNi7oqn9G2QQ71Y3PrdtJDQ3hOGBTiq6KfnjfPjflJBCTPZub33XhbBK9rOST5WHrR
s8D4zUlTMk+u33CW7I0n3+NbUA1o0qWYP9gzkS0vf6vMgYyay0eSXp0cqnyTNSluTauKsH/ONI49
YKGzJcfDbuzVMAfKEmLXFMGfjvUclsCutCtokTEDSmASH47P6KmF5GvAREFtFH1T+QJi8kirdCEq
+hV8XfOmv47cFIfRLlTII28gJDcD8YtQhUO7qt7rz4xst4qfh7ua2vXfHQEmzVsX3peizxVBtPC6
5T3nFoW9rZvOdjK4qEMZMxuSY+iznMW0Bi3K62rDh+T7gFBo4k8oo0INKIXo059OrIcUR7yHb0/y
GH+CaVjnWavJAfHf2xLznLymm32AHlFefxiZeZTbIHGVoX3Qumo5D219IQUVbA/QkHDXizEgrdJK
24H9rYbhd9F7qINHgBgOJgWOD4b/QjfRGg8SNwbpAh7EWg34jmo/5Uxtb7GL2v8lAAuRqCn9k2eJ
9as=
=g/fx
-----END PGP SIGNATURE-----

--eh8yMvZ2QsKcqPVd8H4Fhlq6BNHbG7ueO--
