Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7C6AD934
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 09:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E31C10E385;
	Tue,  7 Mar 2023 08:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7714F10E382
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 08:23:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC87D1F8B2;
 Tue,  7 Mar 2023 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678177436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J2APEJ1fM5xDNZMjhKbNqw4ddHBoTLt4BF/OTOzSge4=;
 b=YcwymLquJHyPAEFfrfrpVhVWudjgICeXudU2FNGyrPoG3HSJgMz0OSjN43zQOjKhojtIt8
 sE4holht+lIxi7J9zxf69HPbL/zaqAIIV0Zmvc8lT2099/Gaiklrc+Yq07dj4ydBA1GPDm
 ASMWnUJOcw++Zm9uZrAMhPAPgxBVNFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678177436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J2APEJ1fM5xDNZMjhKbNqw4ddHBoTLt4BF/OTOzSge4=;
 b=YGRwFiqpZPtcgYOQ2+vq8008eOvwgmZcdtablElnzBRB5TyQjgP3ZUDX82GLaJKCnjrDYV
 lXUggP4eQVn5qTCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8990B1341F;
 Tue,  7 Mar 2023 08:23:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t90FIJz0BmS+FQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Mar 2023 08:23:56 +0000
Message-ID: <c560dd1c-03ac-1aa7-f3ac-2a2d9f411505@suse.de>
Date: Tue, 7 Mar 2023 09:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/99] fbdev: Fix memory leak in option parsing
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <CAMuHMdU5AwE0pK=ppip4J81ByEye+jmvff1s8saeEuWZWZiqPw@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdU5AwE0pK=ppip4J81ByEye+jmvff1s8saeEuWZWZiqPw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5hrPay3SftdoW0w9WMYeRWdC"
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, timur@kernel.org,
 corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net, mbroemme@libmpq.org,
 linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5hrPay3SftdoW0w9WMYeRWdC
Content-Type: multipart/mixed; boundary="------------MNj50RFtejGwRyPMXSzTlf0z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@hansenpartnership.com, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, corbet@lwn.net, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <c560dd1c-03ac-1aa7-f3ac-2a2d9f411505@suse.de>
Subject: Re: [PATCH 00/99] fbdev: Fix memory leak in option parsing
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <CAMuHMdU5AwE0pK=ppip4J81ByEye+jmvff1s8saeEuWZWZiqPw@mail.gmail.com>
In-Reply-To: <CAMuHMdU5AwE0pK=ppip4J81ByEye+jmvff1s8saeEuWZWZiqPw@mail.gmail.com>

--------------MNj50RFtejGwRyPMXSzTlf0z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMDcuMDMuMjMgdW0gMDg6NTMgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIE1vbiwgTWFyIDYsIDIwMjMgYXQgNTow
MOKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToN
Cj4+IEludHJvZHVjZSBzdHJ1Y3Qgb3B0aW9uX2l0ZXIgYW5kIGhlbHBlcnMgdG8gcGFyc2Ug
Y29tbWFuZC1saW5lDQo+PiBvcHRpb25zIHdpdGggY29tbWEtc2VwYXJhdGVkIGtleS12YWx1
ZSBwYWlycy4gVGhlbiBjb252ZXJ0IGZiZGV2DQo+PiBkcml2ZXJzIHRvIHRoZSBuZXcgaW50
ZXJmYWNlLiBGaXhlcyBhIG1lbW9yeSBsZWFrIGluIHRoZSBwYXJzaW5nIG9mDQo+PiB0aGUg
dmlkZW89IG9wdGlvbi4NCj4+DQo+PiBCZWZvcmUgY29tbWl0IDczY2U3M2MzMGJhOSAoImZi
ZGV2OiBUcmFuc2ZlciB2aWRlbz0gb3B0aW9uIHN0cmluZ3MgdG8NCj4+IGNhbGxlcjsgY2xh
cmlmeSBvd25lcnNoaXAiKSwgYSBjYWxsIHRvIGZiX2dldF9vcHRpb25zKCkgZWl0aGVyDQo+
PiByZXR1cm5lZCBhbiBpbnRlcm5hbCBzdHJpbmcgb3IgYSBkdXBsaWNhdGVkIHN0cmluZzsg
aGVuY2Ugb3duZXJzaGlwIG9mDQo+PiB0aGUgc3RyaW5nJ3MgbWVtb3J5IGJ1ZmZlciB3YXMg
bm90IHdlbGwgZGVmaW5lZCwgYnV0IGRlcGVuZGVkIG9uIGhvdw0KPj4gdXNlcnMgc3BlY2lm
aWVkIHRoZSB2aWRlbz0gb3B0aW9uIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lLiBGb3IN
Cj4+IGdsb2JhbCBzZXR0aW5ncywgdGhlIGNhbGxlciBvd25lZCB0aGUgcmV0dXJuZWQgbWVt
b3J5IGFuZCBmb3IgcGVyLWRyaXZlcg0KPj4gc2V0dGluZ3MsIGZiX2dldF9vcHRpb25zKCkg
b3duZWQgdGhlIG1lbW9yeS4gQXMgY2FsbGluZyBkcml2ZXJzIHdlcmUNCj4+IHVuYWJsZSB0
byBkZXRlY3QgdGhlIGNhc2UsIHRoZSBtZW1vcnkgd2FzIGxlYWtlZC4NCj4+DQo+PiBDb21t
aXQgNzNjZTczYzMwYmE5ICgiZmJkZXY6IFRyYW5zZmVyIHZpZGVvPSBvcHRpb24gc3RyaW5n
cyB0byBjYWxsZXI7DQo+PiBjbGFyaWZ5IG93bmVyc2hpcCIpIGNoYW5nZWQgc2VtYXRpY3Mg
dG8gY2FsbGVyLW93bmVkIHN0cmluZ3MuIERyaXZlcnMNCj4+IHN0aWxsIGxlYWtlZCB0aGUg
bWVtb3J5LCBidXQgYXQgbGVhc3Qgb3duZXJzaGlwIHdhcyBjbGVhci4NCj4+DQo+PiBUaGlz
IHBhdGNoc2V0IGZpeGVzIHRoZSBtZW1vcnkgbGVhayBhbmQgY2hhbmdlcyBzdHJpbmcgb3du
ZXJzaGlwIGJhY2sNCj4+IHRvIGZiX2dldF9vcHRpb25zKCkuIFBhdGNoIDEgaW50cm9kdWNl
cyBzdHJ1Y3Qgb3B0aW9uX2l0ZXIgYW5kIGEgZmV3DQo+PiBoZWxwZXJzLiBUaGUgaW50ZXJm
YWNlIHRha2VzIGFuIG9wdGlvbiBzdHJpbmcsIHN1Y2ggYXMgdmlkZW89LCBpbiB0aGUNCj4+
IGNvbW1vbiBmb3JtIHZhbHVlMSxrZXkyOnZhbHVlMix2YWx1ZTMgZXRjIGFuZCByZXR1cm5z
IHRoZSBpbmRpdmlkaWFsDQo+PiBjb21tYS1zZXBhcmF0ZWQgcGFpcnMuIFZhcmlvdXMgbW9k
dWxlcyB1c2UgdGhpcyBwYXR0ZXJuLCBzbyB0aGUgY29kZQ0KPj4gaXMgbG9jYXRlZCB1bmRl
ciBsaWIvLg0KPj4NCj4+IFBhdGNoZXMgMiB0byA5OCBnbyB0aHJvdWdoIGZiZGV2IGRyaXZl
cnMgYW5kIGNvbnZlcnQgdGhlbSB0byB0aGUgbmV3DQo+PiBpbnRlcmZhY2UuIFRoaXMgb2Z0
ZW4gcmVxdWlyZXMgYSBudW1iZXIgb2YgY2xlYW51cHMuIEEgZHJpdmVyIHdvdWxkDQo+PiB0
eXBpY2FsbHkgcmVmZXIgdG8gdGhlIG9wdGlvbiBzdHJpbmcncyB2aWRlbyBtb2RlLiBTdWNo
IHN0cmluZ3MgYXJlIG5vdw0KPj4gY29waWVkIHRvIGRyaXZlci1hbGxvY2F0ZWQgbWVtb3J5
IHNvIHRoYXQgZHJpdmVycyBkb24ndCByZWZlciBkaXJlY3RseQ0KPj4gdG8gdGhlIG9wdGlv
biBzdHJpbmcncyBtZW1vcnkuIFRoZSBvcHRpb24gaXRlcmF0b3IgdGhlbiByZXBsYWNlcyBt
YW51YWwNCj4+IHBhcnNpbmcgbG9vcHMgYmFzZWQgb24gc3Ryc2VwKCIsIikuDQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgc2VyaWVzIQ0KPiANCj4gVW5mb3J0dW5hdGVseSBJIGNhbm5vdCBz
YXkgSSdtIHRocmlsbGVkIGFib3V0IHRoaXM6IHlvdSBhcmUgcmVwbGFjaW5nDQo+IGEgc2lu
Z2xlIHNtYWxsIGR5bmFtaWMgbWVtb3J5IGxlYWsgYnkgMzYgbGFyZ2VyIHN0YXRpYyBtZW1v
cnkgbGVha3MuDQoNClRoYXQncyBmYWlyIGVub3VnaC4NCg0KPiBBbSBJIG1pc3Npbmcgc29t
ZXRoaW5nPw0KDQpUaGUgY3VycmVudCBzaXplIG9mIHRoZSB2aWRlb21vZGUgYnVmZmVycyBp
cyByaWRpY3Vsb3VzbHkgbGFyZ2UuIEkganVzdCANCm5lZWRlZCBzb21ldGhpbmcgdGhhdCBj
b3VsZCBob2xkIHRoZSBzdHJpbmcuIEEgbG9uZyBtb2RlIGRlc2NyaXB0aW9uIA0KbWlnaHQg
bG9vayBsaWtlDQoNCiAgIDE5MjB4MTA4ME1SLTMyQDEyMGltZQ0KDQp3aGljaCBoYXMgMjEg
Y2hhcmFjdGVycy4gMzItYnl0ZSBidWZmZXJzIHdvdWxkIHByb2JhYmx5IGJlIG1vcmUgdGhh
biBlbm91Z2guDQoNCkkgdGhpbmsgaXQgc2hvdWxkIGFsc28gYmUgcG9zc2libGUgdG8gZG8g
YSBzaW1wbGUga3N0cmR1cCgpIG9uIHRoZSBnaXZlbiANCnZpZGVvbW9kZSBzdHJpbmcgYW5k
IGZyZWUgdGhlIGNvcHkgaW4gdGhlIG1vZHVsZSdzIF9maW5pIGZ1bmN0aW9uLg0KDQpUaGF0
IGFsc28gYnJpbmdzIHVwIHRoZSBxdWVzdGlvbiBvZiB0aGVzZSBNT0RVTEUgaWZkZWZzLiBB
bG1vc3QgYWxsIG9mIA0KdGhlIGZiZGV2IGRyaXZlcnMgb25seSBwYXJzZSB0aGUgY29tbWFu
ZC1saW5lIG9wdGlvbiBpZiB0aGV5IGFyZSBub3QgDQpidWlsZCBhcyBhIG1vZHVsZS4gRG8g
eW91IGtub3cgd2h5PyBCZWNhdXNlIG9mIHRoZSBhd2t3YXJkIHNlbWFudGljcyBvZiANCnRo
ZSBvbGQgZmJfZ2V0X29wdGlvbnMoKT8gIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgY2hhbmdl
ZCBzbyB0aGF0IHRoZXkgDQphbHdheXMgcmVzcGVjdCB0aGUgdmlkZW89IHBhcmFtZXRlci4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------MNj50RFtejGwRyPMXSzTlf0z--

--------------5hrPay3SftdoW0w9WMYeRWdC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQG9JsFAwAAAAAACgkQlh/E3EQov+B2
VA//a1ryO6F5PaYm4NfvvvHRkyl4IF0nMt3AowcYhLrrWDeatrGKPI+h9Kc9595LD/XckkcFTawG
9g/LDeDcfhi4B8f/lq50NGZl3bZZmDQEeX0ewkW3nXUNaUlfg7KPVuz0OkW4egRyQ+1OOU+Nio8J
9Y55OCKe5Q/5C86mA9ahnUwmNhQzRycpMSG1sdcJSD3riiueMnaZOAqg0ansVamztoguirn63TxZ
X/i1LZuIfyk3KBuFRq2ejK+kHGVD+7kMAY9Jtbc9HKvoi4L30/PQSTL4yA+SyLaaxDzUKbDkmoh2
8eVgRZzdYHWdGJmygm0696WLMC0hmrb3hcQRJQgJn9sxdfiqyjVc84uk5CvBNSXnJvG0N+jkX+Ao
wwzE3Fvyb2znVMurAFYQCpiGzS2ZPYO78U+3nWQrJs9Ul0rx4pcqJ0jMNwT2B9YVUFV3UPO9vBt6
Shm1Ueg4TAz/PXC1Jnzi7NUZF87dBSYXBL89Usa/+rL7JlaVr2mEwy6bdhMKrl2XnP+rBWGIsaZR
j9MhSZNGWLvbSMQ0D0M1X3U9rgv4CAscKNcaSnN3+nGFkx+W38FntzMMRhJTOwGqIGYtzsBpBQCK
C3SHwhRk2hOGEp6nENOWge1YgKTdNcZszUZj2xLGCPVbLH4b6nq+UmMcVj1ONX6v30tF4qrwsH5/
+pQ=
=7zJw
-----END PGP SIGNATURE-----

--------------5hrPay3SftdoW0w9WMYeRWdC--
