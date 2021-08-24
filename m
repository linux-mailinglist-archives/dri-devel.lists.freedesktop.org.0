Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB03F6867
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45C06E0AA;
	Tue, 24 Aug 2021 17:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954C06E0AA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:49:58 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBFFA20092;
 Tue, 24 Aug 2021 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629827396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfXumgnGiwKbrhwG4HdjTLKATjPB+jofKHAKdKfz98M=;
 b=1uyfFadpz6cGPKqRTjsxsNLEzNuKOOUiPFgt+kc22C7m9FRUxHrC+7By/pDB4Fzj+0Xuoc
 UkeVI0XRhv0RBtr45RkpD5MN19AWqZjGew8/MSkNZfcK2nlqjpHPUMhKFKwq8N6YxBfQ00
 ef+Pl0I08QilN39DjgKtQPktejq9O+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629827396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfXumgnGiwKbrhwG4HdjTLKATjPB+jofKHAKdKfz98M=;
 b=rYsMT9GGR/Wy5vQHWo8TKXDBxGu8c0l08u2c61Z0wMVgvyd59F35AyJLCxhKK5UbZ9bEZ2
 oHREa1e6/6dU9WCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D115D13A5B;
 Tue, 24 Aug 2021 17:49:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id rw1xMUQxJWGaagAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Aug 2021 17:49:56 +0000
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
Message-ID: <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
Date: Tue, 24 Aug 2021 19:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bTXANhtWTg3ZgIAD7dcHQ1DG0obcWW7i1"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bTXANhtWTg3ZgIAD7dcHQ1DG0obcWW7i1
Content-Type: multipart/mixed; boundary="kCwKxU3369XNugdHIJXloBmOdzpgWSdwj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
In-Reply-To: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>

--kCwKxU3369XNugdHIJXloBmOdzpgWSdwj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.08.21 um 00:42 schrieb Amanoel Dawod:
> Hi,
>=20
> This started since 5.14-rc1. The following error appears in dmesg
> (as of 5.14-rc7) when I build the kernel with CONFIG_DRM_SIMPLEDRM=3Dm
>=20
> [    3.252275] [drm] Initialized simpledrm 1.0.0 20200625 for simple-fr=
amebuffer.0 on minor 0
> [    3.252298] simple-framebuffer simple-framebuffer.0: [drm] *ERROR* f=
bdev: Failed to setup generic emulation (ret=3D-22)

Thanks for trying out the driver and reporting back. I suspect that your =

system uses a color format that is not yet supported. But let's see.

What's the platform you're on?

Simpledrm depends on the system framebuffer to be configured by the UEFI =

BIOS or boot loader. What's the resolution and color format on your syste=
m?

Could you please boot the kernel with the command-line option=20
drm.debug=3D0x1ff and provide all dmesg output the is related to DRM?

Best regards
Thomas

>=20
> thanks,
> Amanoel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kCwKxU3369XNugdHIJXloBmOdzpgWSdwj--

--bTXANhtWTg3ZgIAD7dcHQ1DG0obcWW7i1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmElMUQFAwAAAAAACgkQlh/E3EQov+Au
kxAAjsqxLIUFjWJpK9KUGW8awAS1muefOIFtOv5OTrtwDoHsxmsDj96fy3wPQyLxzm3PYe/ZmQC1
++oZgY6p1X5K0FCBa0fIcqwx8ixzs2XiPm8Gtr/n2rSKt+q3Qx0pFhpCVsOUMNRo5UfYYSOny21Q
3paFE7TFV4L3kbVCQRFGG2nvADpTq5buzY8NISym4x1QcH7nuASzmiNhg8NgJ33tfVuMKHhjhjgU
NpQ6Qp7qYaki8Fl/esdFlzjaSUQw5W47A4hMqwGXMUkQ2ewHKq39XkyWlH4y8GJUAaIergfiNyBj
dNqkihlea9uXJAGKK/YcmgO2oVmZ4UdikQMTdMRFKMewlaG3KOtONsZCsk2IbupEd1wEJoDQ5bqC
DSvthneFpjRusvHegXESI1Vk2jYaG93bljE6clx+NUOdVgFsQTg7ZcMs8VbtvgeS6kk88lIYXhPA
exSuLXEikEz/zYv18sM8fuKyL+OAkVI7fOg3njwLkE7BFJwF+8swD92FIJos4b1NjhZ3eflBRPWW
1kshTWbdI7C5biVw9gJmIM8O+lkY970OlGUFCnJgSBbG/shh4uaP41uDSiZuSRkul/4ikopZVG6k
P4FfK6F3ZNIAWzCxI7wg+k/88kPb+VPNK2TBErnbBbTGJovVVylhfHRo+lGYYhar+Hb07yDNAXNC
doU=
=zDFc
-----END PGP SIGNATURE-----

--bTXANhtWTg3ZgIAD7dcHQ1DG0obcWW7i1--
