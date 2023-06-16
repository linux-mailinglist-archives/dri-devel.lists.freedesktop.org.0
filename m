Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E9732981
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 10:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F6110E5C1;
	Fri, 16 Jun 2023 08:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1310E5C1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 08:08:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B98D421C44;
 Fri, 16 Jun 2023 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686902896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UDvXX7ny3jhF7cGUA6wFs+LB1MsO7rOcLM5QoVVkJmA=;
 b=DpxCbNGSwF5Rn7XwJ6jBE4RIKR4D7FnyFA1/VAVFmprfCbMLaPVBUsUWoEz2ZZ2zeXMTNY
 ZvxyqCFI4R0fStrfPAV/VBpyPKMwLtfAHprW3dtruu7ewjlm+dSwGZcpccpQmuNu6I8mDT
 q6yhydQ/LCYF4t9HgS6a43EH8b7nD5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686902896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UDvXX7ny3jhF7cGUA6wFs+LB1MsO7rOcLM5QoVVkJmA=;
 b=ryFi2l45G67vhdn5j4M35saRtvn+u3nkqFiR35attEJKxWOOaoaFT4xMK3SUxt3289YZeX
 AZjsW8Q3pPfaESCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CB8F1330B;
 Fri, 16 Jun 2023 08:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QxFXJXAYjGS9IwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 08:08:16 +0000
Message-ID: <98ebc72a-813a-aaf9-23db-f93b3986f21e@suse.de>
Date: Fri, 16 Jun 2023 10:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 4/4] drm/mgag200: Use DMA to copy the framebuffer to
 the VRAM
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230531092110.140564-1-jfalempe@redhat.com>
 <20230531092110.140564-5-jfalempe@redhat.com>
 <d610d6ee-cf53-6357-b25d-5a396859cc45@suse.de>
 <15b08823-f2c2-5836-2421-f3bc25d51e11@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <15b08823-f2c2-5836-2421-f3bc25d51e11@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k4IC130PI4Uk3SJ01hcbwjO5"
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
--------------k4IC130PI4Uk3SJ01hcbwjO5
Content-Type: multipart/mixed; boundary="------------ReDtHDmUJoFNp73XyLHGiZsg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
Message-ID: <98ebc72a-813a-aaf9-23db-f93b3986f21e@suse.de>
Subject: Re: [PATCH v2 4/4] drm/mgag200: Use DMA to copy the framebuffer to
 the VRAM
References: <20230531092110.140564-1-jfalempe@redhat.com>
 <20230531092110.140564-5-jfalempe@redhat.com>
 <d610d6ee-cf53-6357-b25d-5a396859cc45@suse.de>
 <15b08823-f2c2-5836-2421-f3bc25d51e11@redhat.com>
In-Reply-To: <15b08823-f2c2-5836-2421-f3bc25d51e11@redhat.com>

--------------ReDtHDmUJoFNp73XyLHGiZsg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDYuMjMgdW0gMTk6MTUgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDE1LzA2LzIwMjMgMTY6MjQsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkg
Sm9jZWx5bg0KPj4NCj4+IEFtIDMxLjA1LjIzIHVtIDExOjIxIHNjaHJpZWIgSm9jZWx5biBG
YWxlbXBlOg0KPj4+IEV2ZW4gaWYgdGhlIHRyYW5zZmVyIGlzIG5vdCBmYXN0ZXIsIGl0IGJy
aW5ncyBzaWduaWZpY2FudA0KPj4+IGltcHJvdmVtZW50IGluIGxhdGVuY2llcyBhbmQgQ1BV
IHVzYWdlLg0KPj4+DQo+Pj4gQ1BVIHVzYWdlIGRyb3BzIGZyb20gMTAwJSBvZiBvbmUgY29y
ZSB0byAzJSB3aGVuIGNvbnRpbnVvdXNseQ0KPj4+IHJlZnJlc2hpbmcgdGhlIHNjcmVlbi4N
Cj4+DQo+PiBJIHRyaWVkIHlvdXIgcGF0Y2hzZXQgb24gYSBIUCBQcm9saWFudCBzZXJ2ZXIg
d2l0aCBhIEcyMDBFSC4gSSBjYW4gc2VlIA0KPj4gdGhhdCB0aGUgQ1BVIHVzYWdlIGdvZXMg
ZG93biwgYnV0IHRoZSB0aW1lIHVudGlsIHRoZSBzY3JlZW4gdXBkYXRlIA0KPj4gcmVhY2hl
cyB0aGUgaGFyZHdhcmUncyB2aWRlbyBtZW1vcnkgaGFzIGluY3JlYXNlZCBzaWduaWZpY2Fu
dGx5Lg0KPiANCj4gVGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byB0ZXN0IGl0Lg0KPiBDYW4g
eW91IGNoZWNrIGlmIHRoZXJlIGlzIHNvbWV0aGluZyBpbiB0aGUgZG1lc2cgPw0KPiANCj4g
VGhlIDFzIGxvb2tzIHN1c3BpY2lvdXMsIGlmIHRoZSBJUlEgaXMgbm90IHdvcmtpbmcsIHRo
ZXJlIGlzIGEgMXMgDQo+IHRpbWVvdXQsIHdoaWNoIGNhbiBleHBsYWluIHdoeSBpdCB3aWxs
IGRpc3BsYXkgb25seSBvbmUgZnJhbWUgcGVyIA0KPiBzZWNvbmQuIChsb2dzIHNob3VsZCBi
ZSBmaWxsZWQgd2l0aCAiRE1BIHRyYW5zZmVyIHRpbWVkIG91dCIpDQoNCk5vLCBJIGRvbid0
IHNlZSB0aGF0IGVycm9yLiBJIGFsc28gdmVyaWZpZWQgdGhhdCB0aGUgSVJRIGhhbmRsZXIg
aXMgDQpydW5uaW5nLiBJdCBydW5zIG9uIGVhY2ggdXBkYXRlIEFGQUlDVC4NCg0KV2hlbiBJ
J20gZG9pbmcgZnVsbC1zY3JlZW4gc2Nyb2xsaW5nIG9uIHRoZSBrZXJuZWwgY29uc29sZSBJ
IGNhbiBzZWUgdGhlIA0Kc2NhbmxpbmVzIGJlaW5nIHVwZGF0ZWQgZnJvbSB0b3AgdG8gYm90
dG9tLiBUaGlzIGluZGljYXRlcyB0byBtZSB0aGF0IA0KdGhlIGFjdHVhbCBjb3B5aW5nIHRh
a2VzIHRpbWUgb3IgaW50ZXJmZXJlcyB3aXRoIHRoZSBzY2Fub3V0Lg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBJIHdpbGwgc2VlIGlmIEkgY2FuIGdldCBhY2Nlc3MgdG8g
YSBHMjAwRUgsIGFuZCBpZiBJIGNhbiByZXByb2R1Y2UgdGhpcy4NCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------ReDtHDmUJoFNp73XyLHGiZsg--

--------------k4IC130PI4Uk3SJ01hcbwjO5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSMGG8FAwAAAAAACgkQlh/E3EQov+D7
WQ//aTA8tp5wxiJDqoIplDrvdNTuUSaWJtsHBzpTaItJFLNnx5LKNfBwqNVHgoPcrIXXn8MHFXw6
3Aw0ZRHzMf5dnCz09lBSDHg3scGrgKr5UJboTxLJzoQ7Mh0A+YoMEnvEYjGfsc+y4OjeX7nKCOf/
lZGlVza2zEDH+2fBOhte0g2JgV23ejbBegm8yZCoUszVBEAtsZA96krz7hch0OATXoIY+1lwmpGX
qgYZLi1s9K5CkbkStVY2PV19q18EHfDUNJCB7v6EFse96dMgvE2y3ziuLjAwMKMDl26+3xiFL0Fx
6hYOtF7bPFT9i47085AliuSNsEcB90rmErx1j1YBNdm0sLaEnL4cCvyiqlVAF4idiDRnAMSS+yB/
rg8UIj/B1fxacHmT3EPl7iRthKVT9jxWNoh7SqS5DqtYiCk0H6V4EenJpN31EpAcZZcfiZiDwiz+
GMUKwfufsemOIRt7q0JEzK3/N5JuTHZzy48RiLb9Jfn/Qcldp8ZrhOpeYbzS01et86GjlhLCiFzh
0OJNAbYR4pYzPfFeTBgkzYb7D8haLXNC2+jY4ap8101WweGdZg6CHM1skhsbK8/FQFEhU5EV0Nqt
X5+eGO6f8qEXaR3GwfMznCojehz36Lafn/rfZIOj7cS+4DubGxBlYlV2oseDz+jFS3PXghX9JP1p
5KA=
=PEvR
-----END PGP SIGNATURE-----

--------------k4IC130PI4Uk3SJ01hcbwjO5--
