Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E63F34A3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 21:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC626EB13;
	Fri, 20 Aug 2021 19:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A1F6EB0D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 19:23:55 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC5512016A;
 Fri, 20 Aug 2021 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629487433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J/ZTHYspJWems3grCDvjCH9V3Hhhi4avlqSwNlHDseY=;
 b=w715AXDNp3TIRo7tdKvLhrjp59r1bQccQ1zHmXeFvTGAP9S90SGPYX8yANzkrJVdT+dBTI
 FDHMWAcwUI1kA/5bqDad5ERYL9B32IMDohhBSGMvzigj7h+aDi4IwKhEUQexe75ZD8aNuy
 9uff1GLGaUIN8OrT8YzJapgrItfqMCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629487433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J/ZTHYspJWems3grCDvjCH9V3Hhhi4avlqSwNlHDseY=;
 b=3dduTyFnRRIIKMQglkFUGeRkDtPYvK25MBhk7tvpM1DR1tm08KlCLiqDtrNdUizOWaBZoO
 vh686/xKzNjcXuDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5600D13BE5;
 Fri, 20 Aug 2021 19:23:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2dEQE0kBIGGIXgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Aug 2021 19:23:53 +0000
To: syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>,
 airlied@linux.ie, christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
References: <00000000000047b52b05c9ff8d0b@google.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
Message-ID: <dc7ca5ae-afc1-f840-8dfc-3f2361cd4360@suse.de>
Date: Fri, 20 Aug 2021 21:23:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <00000000000047b52b05c9ff8d0b@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9BSk7OnrvXIspcoyXpuha4Szaal3Vonnh"
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
--9BSk7OnrvXIspcoyXpuha4Szaal3Vonnh
Content-Type: multipart/mixed; boundary="RFSfHUaXVAmGRzteq89QyZAcdgd27yXDG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>,
 airlied@linux.ie, christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Message-ID: <dc7ca5ae-afc1-f840-8dfc-3f2361cd4360@suse.de>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
References: <00000000000047b52b05c9ff8d0b@google.com>
In-Reply-To: <00000000000047b52b05c9ff8d0b@google.com>

--RFSfHUaXVAmGRzteq89QyZAcdgd27yXDG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.08.21 um 17:45 schrieb syzbot:
> syzbot has bisected this issue to:

Good bot!

>=20
> commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri Oct 9 23:21:56 2020 +0000
>=20
>      drm/vkms: fbdev emulation support

Here's a guess.

GEM SHMEM + fbdev emulation requires that=20
(drm_mode_config.prefer_shadow_fbdev =3D true). Otherwise, deferred I/O=20
and SHMEM conflict over the use of page flags IIRC.

 From a quick grep, vkms doesn't set prefer_shadow_fbdev and an alarming =

amount of SHMEM-based drivers don't do either.

Best regards
Thomas

>=20
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11c31d55=
300000
> start commit:   614cb2751d31 Merge tag 'trace-v5.14-rc6' of git://git.k=
ern..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D13c31d55=
300000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D15c31d55300=
000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D96f06022032=
50753
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D91525b2bd4b5d=
ff71619
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D122bce0e3=
00000
>=20
> Reported-by: syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com
> Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
>=20
> For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RFSfHUaXVAmGRzteq89QyZAcdgd27yXDG--

--9BSk7OnrvXIspcoyXpuha4Szaal3Vonnh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEgAUgFAwAAAAAACgkQlh/E3EQov+Ca
QhAAkZ31x5M00jNSVFt6zSFPz7zsmP1+pIfZD9wsS8TkIJGxUsHyfbh9a/eIijkh/e8zNqQ9JP1P
HOscLUH/AgY9d+/RCrU062w/5zKJEOhodrt+9FzVqGeavOM3csDR5ll6bPv2oo0eSpnttEJ2w6SG
1urAbMBvUbIRvWN+vmdYIqp4ezHHj7izBuRoFeRWQNn7t8AQjaqnduIhip9takLa2nLd2zIOYAev
vVdgtw9+JI/2ZJCnbFedn/CvDJ4A8VPLfeSQcgG8Ksqw+VHjRBrd5sS+Z7K9RFTNqi5Ec7klHdei
JrnvVmLWoezYdjoDjVWLINuEk2r7L6GAhoF0oDhZq1kVv7K33xfDIdQB2p8JqTY9o22Rthjq0Kkc
zg5vhhr/CBZ2H7gACKGybG86UqcO5e0z2PVlmlZvVRdgC5x0ZGGxMe79e2GVwUbCuDBepAwet/fq
XbdBZ1JmDxdRnODXB7A6LvqDyDiCjAKI4pcTB/9OjUZ9CUSk1XXc52WJV2btzfGPSDaSMRRg6l6C
eFKIlD/Gk9kXHttN3F6+OZeK46oFRodhgQ2ooaf1jRetNa1xd6d+b8m6UFerDQplYGiR1F3jnwvv
3GOzP8qg0PP9tgr9/7ozH50m1IUEcNuX2iCVwVs/dkuBYH+OIQbZtmZqizDWKx3DvNg+341m4EA4
kvA=
=gavY
-----END PGP SIGNATURE-----

--9BSk7OnrvXIspcoyXpuha4Szaal3Vonnh--
