Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9322969A6CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3047410E439;
	Fri, 17 Feb 2023 08:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6F310E439
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:23:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB1CF223E6;
 Fri, 17 Feb 2023 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676622213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cJTr+6vXA4+2p5qkT/Em9u250hFddOI48h4G5bRvlSI=;
 b=B/RSp5gPDngulwHJYLq0MB370/++Pnw2vqfsyRyc+zC8VeiAbsJqFatLWh35wxIjF6QK66
 Xd3n0snGK1TKUBP/64AdN+AnMaoyFhi1rKUIawKHrFwSyKbzxqd0aNqRyW0dEtk3LyNGXq
 FJjF3EgCRKhPv5xKHH8g2VruUjhBEPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676622213;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cJTr+6vXA4+2p5qkT/Em9u250hFddOI48h4G5bRvlSI=;
 b=qDZtyfblXv4cCZKAtquHqujX+FGl0HvE1g+a19CLaua6nVsBHe+xdvIme9VDP2BphzJRGG
 s8Pz1kLy1vDpIyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3F0E13274;
 Fri, 17 Feb 2023 08:23:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7Uz+JoU572N1ewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 08:23:33 +0000
Message-ID: <ce033e93-10be-050d-1712-63817e7ff4ea@suse.de>
Date: Fri, 17 Feb 2023 09:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de> <Y+4nIxRhF7KF2Qo0@intel.com>
 <ba4daf50-4882-5009-5c68-4385cacfdccb@suse.de> <Y+5l+BbN7JjpaQlH@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y+5l+BbN7JjpaQlH@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YsW0s9xf9q85eWLKVFi5rkwA"
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YsW0s9xf9q85eWLKVFi5rkwA
Content-Type: multipart/mixed; boundary="------------IEmghOFXfGw6Pt16ZGvN093k";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann
 <kraxel@redhat.com>, airlied@redhat.com, sam@ravnborg.org
Message-ID: <ce033e93-10be-050d-1712-63817e7ff4ea@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de> <Y+4nIxRhF7KF2Qo0@intel.com>
 <ba4daf50-4882-5009-5c68-4385cacfdccb@suse.de> <Y+5l+BbN7JjpaQlH@intel.com>
In-Reply-To: <Y+5l+BbN7JjpaQlH@intel.com>

--------------IEmghOFXfGw6Pt16ZGvN093k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDIuMjMgdW0gMTg6MjAgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIFRodSwgRmViIDE2LCAyMDIzIGF0IDAyOjIxOjQzUE0gKzAxMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAxNi4wMi4yMyB1bSAxMzo1MiBzY2hy
aWViIFZpbGxlIFN5cmrDpGzDpDoNCj4+PiBPbiBUaHUsIEZlYiAxNiwgMjAyMyBhdCAwMTow
MzowMlBNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+
DQo+Pj4+IHRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGUgcGF0Y2hlcy4NCj4+Pj4N
Cj4+Pj4gQW0gMTYuMDIuMjMgdW0gMTI6MzMgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPj4+
Pj4gT24gV2VkLCBGZWIgMTUsIDIwMjMgYXQgMDU6MTU6MTdQTSArMDEwMCwgVGhvbWFzIFpp
bW1lcm1hbm4gd3JvdGU6DQo+Pj4+Pj4gU2V0IHRoZSBWR0EgYml0IGZvciB1bmJsYW5raW5n
IHdpdGggbWFjcm8gY29uc3RhbnRzIGluc3RlYWQgb2YgbWFnaWMNCj4+Pj4+PiB2YWx1ZXMu
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+Pj4+DQo+Pj4+PiBibGFuay91bmJsYW5rIHNo
b3VsZCB3b3JrIHNpbWxpYXIgdG8gYm9jaHMgKHNlZSBjb21taXQgMjUwZTc0MzkxNWQ0KSwN
Cj4+Pj4+IHRoYXQgaXMgbWF5YmUgYSBuaWNlIHRoaW5nIHRvIGFkZCBvZiB5b3UgbW9kZXJu
aXplIHRoZSBkcml2ZXIgYW55d2F5Lg0KPj4+PiBZZWFoLCBpdCdzIHRoZSBWR0EgUEFTIGZp
ZWxkLiBbMV0gQnV0IGlzIGl0IHJlYWxseSBjYWxsZWQgYmxhbmtpbmc/IFBBUw0KPj4+PiBj
b250cm9scyBwYWxldHRlIGFjY2VzcywgYnV0IGJsYW5raW5nIGlzIHNvdW5kcyBtb3JlIGxp
a2UgRFBNUy4NCj4+Pg0KPj4+IFdoeSBhcmVuJ3QgcGVvcGxlIGp1c3QgdXNpbmcgdGhlIG5v
cm1hbCB3YXkgb2YgZmxpcHBpbmcgdGhlDQo+Pj4gc2NyZWVuIG9mZiBiaXQgaW4gc2VxdWVu
Y2VyIHJlZ2lzdGVyIDAxPw0KPj4NCj4+IFNldHRpbmcgdGhlIFNEIGJpdCBpbiBTUjAxIGlz
bid0IGEgYmFkIGlkZWEuIFdlIGNhbiBkbyB0aGlzIGFzIHBhcnQgb2YNCj4+IGVuYWJsaW5n
L2Rpc2FibGluZyB0aGUgcGxhbmUuDQo+Pg0KPj4gQnV0IGZvciBQQVMsIHdlIGRvbid0IGhh
dmUgYSBjaG9pY2UuIEl0J3Mgb25lIG9mIHRoZSBiYXppbGxpb24gb2JzY3VyZQ0KPj4gVkdB
IHNldHRpbmdzIGFuZCAoYWNjb3JkaW5nIHRvIGEgY29tbWVudCBpbiB0aGUgc291cmNlIGNv
ZGUpIHdlIG5lZWQgdG8NCj4+IHVwZGF0ZSBpdCBmb3IgY29tcGF0aWJpbGl0eS4NCj4gDQo+
IFdlbGwsIHlvdSBkbyBuZWVkIHRvIGVuYWJsZSB0aGUgcGFsZXR0ZSB0byBzZWUgc29tZXRo
aW5nDQo+IG90aGVyIHRoYXQgYm9yZGVyIGNvbG9yLiBOb3Qgc3VyZSB0aGEndCBhIHZlcnkg
b2JzY3VyZSB0aGluZyA6UA0KDQpQdW4gaW50ZW5kZWQ/IDpEDQoNCj4gDQo+IE9uIGEgcmVs
YXRlZCBub3RlLCB0aGUgY29kZSBsb29rcyBwcmV0dHkgc2tldGNoeS4gSXQganVzdA0KPiBi
bGluZGx5IHdyaXRlcyB0byAweDNjMCBhc3N1bWluZyBpdCBpcyB0aGUgYXR0cmlidXRlIGNv
bnRyb2xsZXINCj4gaW5kZXggcmVnaXN0ZXIuIEJ1dCB1bmxlc3MgeW91IGV4cGxpY2l0bHkg
cmVzZXQgdGhlIGZsaXAtZmxvcA0KPiBpdCBjb3VsZCBhY3R1YWxseSBiZSB0aGUgZGF0YSB3
cml0ZSByZWdpc3RlciBpbnN0ZWFkLiBUaGF0IGNvdWxkDQo+IGVhc2lseSBoYXBwZW4gaWYg
dGhlIHByZXZpb3VzIGFjY2VzcyB0byB0aGUgYXR0cmlidXRlIGNvbnRyb2xsZXINCj4gd2Fz
IGEgcmVhZCBzaW5jZSByZWFkcyBkbyBub3QgdG9nZ2xlIHRoZSByZWdpc3RlciByb2xlLg0K
DQpZZWFoLCB0aGUgYXR0cmlidXRlIGNvbnRyb2xsZXIgaXMgKmZ1biogdG8gd29yayB3aXRo
LiBJbiB0aGUgbmV4dCANCml0ZXJhdGlvbiwgSSdsbCBwcm9iYWJseSBhZGQgYSBoZWxwZXIg
dG8gZG8gYWxsIHRoaXM7IHNpbWlsYXIgdG8gYm9jaHMuDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------IEmghOFXfGw6Pt16ZGvN093k--

--------------YsW0s9xf9q85eWLKVFi5rkwA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvOYUFAwAAAAAACgkQlh/E3EQov+Cu
xw//fGmZyhdlCmsIbP6RJii4HJCttbCOPlWglHF0k9FtM18O1T2KJNnWrVFFv6a8b9Gp4NEt5ycv
V6QvxUqAPuPYOn3m0DZRQH/PFwVwwnK9a1fqdNDL/Tb1h9Kuz+BKqwJZVkze2m12jkX1U5pDk1DB
GSu3INcXJM+NbP2AZX+kbeGgLx+8wstMxeALm/aQY5dx3rsmV5eOX+/VxrIrme4/LrWSwm2zZTZY
34YX3+gvXiGe3Pz3GSkvQwAQhA9/sZgiHbgIet6GQ7ZL19XQVRz8nTTZvbaTAB4RnDo+/RCFdj1T
UZlVDQJB3o/2hULBkQ0VKCzioprM2sRnLsacM+rij+OB1grJPAwusJa4gZiEyMhC4Fpoziwc3xZ6
F8VSpZ++RAVHFNTKD3WIk7D/jCSR+lb4Gd9dkk03uKab8yLgTO65F7KpLG0YuKyFtKL0sUAVObHh
TEXB0YuleHNcjl5FnhnbKxJXnb4375B6FqMP3X1uujy+vDsBJdDX6ga0ZLVzAGqvTYHjhnWtX12T
7yAlgzuWIMPTNiuQ/9/0qnZ0rodLjhrtwBCeLGpU2ZLllh/1l3qxsCI/RodrLmGMr/3mmXdTA9Jf
uYqsDW7DIwYvuFHaTIu9lW2ioEwEqrPUuyHuFRd4lgrYhXCFAO07QR2zfywL3qZUlTc02cJMFt2P
2dM=
=G/+9
-----END PGP SIGNATURE-----

--------------YsW0s9xf9q85eWLKVFi5rkwA--
