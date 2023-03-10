Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8326B3F95
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 13:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6610E184;
	Fri, 10 Mar 2023 12:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B8110E184
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 12:44:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3E3C21EB4;
 Fri, 10 Mar 2023 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678452271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Chly14tZPoFUh+0hkeoUe9IpO/gyXwV3d8UVTu36ak8=;
 b=piFyduczo2WZmPNri+ULZNDqzC6q20h+j4XKbxx0cTPKQzL/f8Tp2yDlv3xvADesOkjBRR
 NRIbotjdcafAu0jK3ggSMgnb62BtRzzx4ApMqcq6Gfxj8YVlIlMcxTPZdXWX8WOa+0hk4M
 BrIyFCIApKYfd7QdGFRykC/kT3LhaOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678452271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Chly14tZPoFUh+0hkeoUe9IpO/gyXwV3d8UVTu36ak8=;
 b=H+ZPMVbJ6+tEWLTkiD1aXIAJhn2fA7HNyIJSE1hAJXnmlP/vXRdQGume51Lm/E99Klytod
 aF6Ot2rSXCjW8sAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95EF413592;
 Fri, 10 Mar 2023 12:44:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CVCzIy4mC2ScKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Mar 2023 12:44:30 +0000
Message-ID: <123794b6-f3e1-7866-f618-4b3534186e80@suse.de>
Date: Fri, 10 Mar 2023 13:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 000/101] fbdev: Fix memory leak in option parsing
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <CAMuHMdX9mmPDvTpeHQWMoi1pAqoDn1go4in995pGkamOQmBXjA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdX9mmPDvTpeHQWMoi1pAqoDn1go4in995pGkamOQmBXjA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3gtrrVnUNz0A7nL0VRjfkriZ"
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
Cc: linux-fbdev@vger.kernel.org, thomas@winischhofer.net, adaplas@gmail.com,
 timur@kernel.org, corbet@lwn.net, deller@gmx.de, rdunlap@infradead.org,
 mbroemme@libmpq.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3gtrrVnUNz0A7nL0VRjfkriZ
Content-Type: multipart/mixed; boundary="------------k90Yue8T06fhBe0A7HPjImg6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: deller@gmx.de, timur@kernel.org, rdunlap@infradead.org, paulus@samba.org,
 benh@kernel.crashing.org, linux@armlinux.org.uk, pjones@redhat.com,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@hansenpartnership.com, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, corbet@lwn.net, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <123794b6-f3e1-7866-f618-4b3534186e80@suse.de>
Subject: Re: [PATCH v2 000/101] fbdev: Fix memory leak in option parsing
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <CAMuHMdX9mmPDvTpeHQWMoi1pAqoDn1go4in995pGkamOQmBXjA@mail.gmail.com>
In-Reply-To: <CAMuHMdX9mmPDvTpeHQWMoi1pAqoDn1go4in995pGkamOQmBXjA@mail.gmail.com>

--------------k90Yue8T06fhBe0A7HPjImg6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMTAuMDMuMjMgdW0gMDk6MjQgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFRodSwgTWFyIDksIDIwMjMgYXQgNTow
MuKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToN
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
byBkZXRlY3QgdGhlIGNhc2UsIHRoZXkgaGFkIG5vIG9wdGlvbiBidXQgdG8gbGVhayB0aGUg
dGhlIG1lbW9yeS4NCj4+DQo+PiBDb21taXQgNzNjZTczYzMwYmE5ICgiZmJkZXY6IFRyYW5z
ZmVyIHZpZGVvPSBvcHRpb24gc3RyaW5ncyB0byBjYWxsZXI7DQo+PiBjbGFyaWZ5IG93bmVy
c2hpcCIpIGNoYW5nZWQgc2VtYW50aWNzIHRvIGNhbGxlci1vd25lZCBzdHJpbmdzLiBEcml2
ZXJzDQo+PiBzdGlsbCBsZWFrZWQgdGhlIG1lbW9yeSwgYnV0IGF0IGxlYXN0IG93bmVyc2hp
cCB3YXMgY2xlYXIuDQo+IA0KPiBXaGlsZSBJIGNhbiBmaW5kIHRoZSBhY3R1YWwgcGF0Y2hb
MV0sIEkgY2Fubm90IGZpbmQgdGhpcyBjb21taXQ/DQo+IFdoZXJlIHdhcyBpdCBhcHBsaWVk
Pw0KDQpJdCdzIGN1cnJlbnRseSBpbiBkcm0tbWlzYy1uZXh0Lg0KDQogDQpodHRwczovL2Nn
aXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPTczY2U3M2MzMGJh
OWFlNGQ5MGZkZmFkN2ViZTkxMDQwMDFkNWQ4NTENCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDIwOTEzNTUw
OS43Nzg2LTMtdHppbW1lcm1hbm5Ac3VzZS5kZQ0KPiANCj4+IFRoaXMgcGF0Y2hzZXQgZml4
ZXMgdGhlIG1lbW9yeSBsZWFrIGFuZCBjaGFuZ2VzIHN0cmluZyBvd25lcnNoaXAgYmFjaw0K
Pj4gdG8gZmJfZ2V0X29wdGlvbnMoKS4gUGF0Y2ggMSBpbnRyb2R1Y2VzIHN0cnVjdCBvcHRp
b25faXRlciBhbmQgYSBmZXcNCj4+IGhlbHBlcnMuIFRoZSBpbnRlcmZhY2UgdGFrZXMgYW4g
b3B0aW9uIHN0cmluZywgc3VjaCBhcyB2aWRlbz0sIGluIHRoZQ0KPj4gY29tbW9uIGZvcm0g
dmFsdWUxLGtleTI6dmFsdWUyLHZhbHVlMyBldGMgYW5kIHJldHVybnMgdGhlIGluZGl2aWR1
YWwNCj4+IGNvbW1hLXNlcGFyYXRlZCBwYWlycy4gVmFyaW91cyBtb2R1bGVzIHVzZSB0aGlz
IHBhdHRlcm4sIHNvIHRoZSBjb2RlDQo+PiBpcyBsb2NhdGVkIHVuZGVyIGxpYi8uDQo+Pg0K
Pj4gUGF0Y2hlcyAyIHRvIDEwMCBnbyB0aHJvdWdoIGZiZGV2IGRyaXZlcnMgYW5kIGNvbnZl
cnQgdGhlbSB0byB0aGUgbmV3DQo+PiBpbnRlcmZhY2UuIFRoaXMgb2Z0ZW4gcmVxdWlyZXMg
YSBudW1iZXIgb2YgY2xlYW51cHMuIEEgZHJpdmVyIHdvdWxkDQo+PiB0eXBpY2FsbHkgcmVm
ZXIgdG8gdGhlIG9wdGlvbiBzdHJpbmcncyB2aWRlbyBtb2RlLiBTdWNoIHN0cmluZ3MgYXJl
IG5vdw0KPj4gY29waWVkIHRvIGRyaXZlci1hbGxvY2F0ZWQgbWVtb3J5IHNvIHRoYXQgZHJp
dmVycyBkb24ndCByZWZlciBkaXJlY3RseQ0KPj4gdG8gdGhlIG9wdGlvbiBzdHJpbmcncyBt
ZW1vcnkuIFRoZSBvcHRpb24gaXRlcmF0b3IgdGhlbiByZXBsYWNlcyBtYW51YWwNCj4+IHBh
cnNpbmcgbG9vcHMgYmFzZWQgb24gc3Ryc2VwKCIsIikuIEFsbCBkcml2ZXItYWxsb2NhdGVk
IG1lbW9yeSBpcw0KPj4gcmVsZWFzZWQgYnkgcmVtb3ZpbmcgdGhlIGRldmljZSBvciB1bmxv
YWRpbmcgdGhlIG1vZHVsZS4NCj4+DQo+PiBQYXRjaCAxMDEgZmluYWxseSBjaGFuZ2VzIHRo
ZSBvd25lcnNoaXAgb2YgdGhlIG9wdGlvbiBzdHJpbmcgdG8gYmUNCj4+IGludGVybmFsIHRv
IGZiX2dldF9vcHRpb24oKTsgdGhlcmVieSBmaXhpbmcgdGhlIG1lbW9yeSBsZWFrLiBUaGUg
b3B0aW9uDQo+PiBpdGVyYXRvciBob2xkcyBpdHMgb3duIGNvcHkgb2YgdGhlIHN0cmluZyBh
bmQgaXMgbm90IGFmZmVjdGVkIGJ5IHRoZQ0KPj4gY2hhbmdlLg0KPj4NCj4+IE1vc3QgZmJk
ZXYgZHJpdmVycyBvbmx5IHN1cHBvcnQgdG8gcGFyc2Ugb3B0aW9uIHN0cmluZ3MgaWYgdGhl
eSBhcmUNCj4+IGJ1aWx0LWluLiBJIGFzc3VtZSB0aGF0J3MgYmVjYXVzZSBvZiB0aGUgb3Jp
Z2luYWwgZnV6enkgc2VtYW50aWNzIG9mDQo+PiBmYl9nZXRfb3B0aW9ucygpLiBBIGxhdGVy
IHBhdGNoc2V0IGNvdWxkIGNoYW5nZSB0aGUgZHJpdmVyIHRvIHJlc3BlY3QNCj4+IHZpZGVv
PSBzZXR0aW5ncyBpbiBhbnkgY29uZmlndXJhdGlvbi4NCj4+DQo+PiB2MjoNCj4+ICAgICAg
ICAgICogdXNlIGtzdHJkdXAoKS9rZnJlZSgpIGZvciB2aWRlbyBzdHJpbmdzIChHZWVydCwg
VGltdXIpDQo+PiAgICAgICAgICAqIGZpeCBpdGVyYXRvciBkb2NzIChSYW5keSkNCj4+ICAg
ICAgICAgICogdXBkYXRlIGl0ZXJhdG9yIGludGVyZmFjZQ0KPiANCj4gVGhhbmtzIGZvciB0
aGUgdXBkYXRlLCB0aGlzIGxvb2tzIG11Y2ggYmV0dGVyIQ0KPiANCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------k90Yue8T06fhBe0A7HPjImg6--

--------------3gtrrVnUNz0A7nL0VRjfkriZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQLJi4FAwAAAAAACgkQlh/E3EQov+DE
wg/9GgmCIB8MXJTBXgyzRjaCY8maQ9BjeGcjuL/P1+XKF45IRp6VZo6aEtZyAlhEVFhD+cE6Ig7J
Y8GbFCYde3aPEv/6ok/9PEZznYz/e87s5rygWY7WWpPCm46KEul7QJ0/fh/HJ6G3BL8xVwtU6DzA
+KeGa/Pp0RJViUbNEie90bAVYbCwVqEuykZWl5Yg6bpyw8S8kiL4x+3kjuj+7cOd8dTHghk2xUiL
q979SE4uf58UzxtHECdNR6+006Cf5PsbiOhI2wGFT7/LTJzn5NK5P+vNMgktRnZMojqpwpCX1ntb
h+XS20KswWa6oRZy+SC2bjeRw7a8WC84/1uJBAGCkRgeeyfW/ImiHG/Es/t+Kcev0LKkHNSE8yhm
WNF+ycz9G03IwFE1q3qt9d+m/tLl3KZx6yC+yIGgAN9SIQHbme5i7kxbXi3aiQOWsVIz3hkt+L8c
mbYxwYk+3HR0aDpYZlWTrdpdgThpR3uCcGLgk7JZTampH31XsYuwLmiBJv7XDXEPH7JDOLlRZlsn
Bnu0UM0BCdztLhhD3tpwxgQUB+DPbG6mitP/ZI7N2eSSzyt9G8M2Rnyg9qd5iziiAeGwF2Tj768v
I1biigDBMn0eU+zkIrUgA6xUC0GiisR1pV1XehNLO7y9qy5Td2bmpzhdj2UVqvU1gYbdapKoHny/
6Zk=
=jQ+Q
-----END PGP SIGNATURE-----

--------------3gtrrVnUNz0A7nL0VRjfkriZ--
