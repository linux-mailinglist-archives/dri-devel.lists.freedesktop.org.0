Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBD15589CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 22:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD0010E0AA;
	Thu, 23 Jun 2022 20:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0C310E0AA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 20:04:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BC7221A54;
 Thu, 23 Jun 2022 20:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656014662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SgAmNX7IdrsuW502uoKxPANdwzMvd0HZ2b4OmXixIAs=;
 b=ikscPiiGLUqRBgyyaqu4bXbnoziP/ZewGPJ6h35C808ncpFM9sNbe9sqfOGlec+hpuY1/X
 go8Kx+hNLjO67+gIT7zNZY0tqAeBWR6fo/urk2vET13g3R22WFVooIXRJPZLRQrvBnt/eM
 Q142P7DLWx1cluOykXjz/jvtXPr6PTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656014662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SgAmNX7IdrsuW502uoKxPANdwzMvd0HZ2b4OmXixIAs=;
 b=fl6k+uojVYOG4Lh0fmLPqb7VAyfaTwMfQaqiWPyULjr5n99Nyr4T2vhpcFOwIyFq85V/rm
 tPA9na/u9tSMeUAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73F5D13461;
 Thu, 23 Jun 2022 20:04:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SDRXG0bHtGLTVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Jun 2022 20:04:22 +0000
Message-ID: <76dbac75-34b2-51f4-d1fd-5026e14c91c2@suse.de>
Date: Thu, 23 Jun 2022 22:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: How do I gather up new code to be converted as patches?
Content-Language: en-US
To: Kevin Brace <kevinbrace@gmx.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
 <CAOCk7Npgc+OvvjfdiRORsGo5hB52vTevgLBO=ozREBR9krhuFw@mail.gmail.com>
 <trinity-32be87d2-7993-495f-8970-62f4b01b86c1-1656012594269@3c-app-mailcom-bs02>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <trinity-32be87d2-7993-495f-8970-62f4b01b86c1-1656012594269@3c-app-mailcom-bs02>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VSL0c6oMl5TYDfyNZ36PEYKE"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VSL0c6oMl5TYDfyNZ36PEYKE
Content-Type: multipart/mixed; boundary="------------XTb05W94MQTMJ2PfdWylxaeC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Brace <kevinbrace@gmx.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <76dbac75-34b2-51f4-d1fd-5026e14c91c2@suse.de>
Subject: Re: How do I gather up new code to be converted as patches?
References: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
 <CAOCk7Npgc+OvvjfdiRORsGo5hB52vTevgLBO=ozREBR9krhuFw@mail.gmail.com>
 <trinity-32be87d2-7993-495f-8970-62f4b01b86c1-1656012594269@3c-app-mailcom-bs02>
In-Reply-To: <trinity-32be87d2-7993-495f-8970-62f4b01b86c1-1656012594269@3c-app-mailcom-bs02>

--------------XTb05W94MQTMJ2PfdWylxaeC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDYuMjIgdW0gMjE6Mjkgc2NocmllYiBLZXZpbiBCcmFjZToNCj4gSGkg
SmVmZnJleSwNCj4gDQo+IEkgZGlkIG5vdCBwb2ludCB0byB0aGUgcmVwb3NpdG9yeSBJIGFj
dGl2ZWx5IG1haW50YWluLCBidXQgc2luY2UgSSB3YXMgYWJsZSB0byBkbyBzbyBzaW5jZSAy
MDE3LCBJIHRoaW5rIEkgaGF2ZSBmaWd1cmVkIG91dCBhbGwgb2Ygd2hhdCBJIGNvbnNpZGVy
ICJiYXNpYyIgd2F5cyBvZiB1c2luZyBnaXQgdG8gbWFpbnRhaW4gYW5kIGtlZXAgdXAgd2l0
aCB0aGUgdXBzdHJlYW0gRFJNIGNvZGUuDQo+IA0KPiBodHRwczovL2NnaXQuZnJlZWRlc2t0
b3Aub3JnL29wZW5jaHJvbWUvZHJtLW9wZW5jaHJvbWUvDQo+IA0KPiBJdCBpcyBqdXN0IHRo
YXQgSSBhbSBub3cgYXQgYSBwb2ludCBvZiBwb3N0aW5nIGNvZGUgb24gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdCBmb3IgdGhlIGZpcnN0IGNvZGUgcmV2aWV3LCBidXQgSSBqdXN0IHN1ZGRl
bmx5IHJlYWxpemVkIHRoYXQgZ2l0IGRvZXMgbm90IGFwcGVhciB0byBoYXZlIGEgY29udmVu
aWVudCB3YXkgdG8gZG8gdGhpcy4NCj4gV2hhdCBJIGFtIHRyeWluZyB0byBkbyBpcyB0byBw
b3N0IHRoZSBjb2RlIG9uIGRyaS1kZXZlbCBsaWtlIHRoZSBwcmV2aW91cyBPcGVuQ2hyb21l
IGRldmVsb3BlciwgSmFtZXMgU2ltbW9ucywgZGlkIGluIDIwMTMuDQo+IA0KPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxMy1KdW5lLzAz
OTU5NC5odG1sDQoNCllvdSBwcm9iYWJseSB3YW50ICdnaXQgc2VuZC1lbWFpbCcuIE9uY2Ug
Y29uZmlndXJlZCwgaXQgZ2VuZXJhdGVzIG5pY2UgDQpwYXRjaHNldHMgd2l0aCBjb3ZlciBs
ZXR0ZXIgYW5kIHNlbmRzIHRoZW0gYXV0b21hdGljYWxseS4NCg0KVGhlcmUncw0KDQogICBo
dHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LXNlbmQtZW1haWwNCg0KYW5kIERSSS1zcGVj
aWZpYyBpbnN0cnVjdGlvbnMgYXQNCg0KIA0KaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3Jn
L3dpa2kvU29mdHdhcmUvUHVsc2VBdWRpby9Ib3dUb1VzZUdpdFNlbmRFbWFpbC8NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEtldmluIEJyYWNl
DQo+IEJyYWNlIENvbXB1dGVyIExhYm9yYXRvcnkgYmxvZw0KPiBodHRwczovL2JyYWNlY29t
cHV0ZXJsYWIuY29tDQo+IA0KPiANCj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyMiwgMjAy
MiBhdCAxMjozMyBQTQ0KPj4gRnJvbTogIkplZmZyZXkgSHVnbyIgPGplZmZyZXkubC5odWdv
QGdtYWlsLmNvbT4NCj4+IFRvOiAiS2V2aW4gQnJhY2UiIDxrZXZpbmJyYWNlQGdteC5jb20+
DQo+PiBDYzogIm9wZW4gbGlzdDpEUk0gUEFORUwgRFJJVkVSUyIgPGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+DQo+PiBTdWJqZWN0OiBSZTogSG93IGRvIEkgZ2F0aGVyIHVw
IG5ldyBjb2RlIHRvIGJlIGNvbnZlcnRlZCBhcyBwYXRjaGVzPw0KPj4NCj4+IEdlbmVyYXRp
bmcgYSBwYXRjaCBpcyAiZ2l0IGZvcm1hdC1wYXRjaCIuICBUaGlzIGNvbW1hbmQgb3BlcmF0
ZXMgb24NCj4+IGNvbW1pdHMgaW4geW91ciBsb2NhbCB0cmVlLiAgU28geW91IG5lZWQgdG8g
Y29tbWl0IHlvdXIgY2hhbmdlcyB0bw0KPj4geW91ciBsb2NhbCB0cmVlLiAgVGhlIGNvbW1h
bmQgZm9yIHRoYXQgaXMgImdpdCBjb21taXQiLCBhbmQgaXQgd29ya3MNCj4+IG9uIHN0YWdl
ZCBjaGFuZ2VzLiAgVG8gc3RhZ2UgY2hhbmdlcywgeW91IG5lZWQgdG8gImdpdCBhZGQiIHRo
ZW0uDQo+PiAiZ2l0IHN0YXR1cyIgY2FuIGhlbHAgeW91IHZpc3VhbGl6ZSB1bnN0YWdlZCBh
bmQgc3RhZ2VkIGNoYW5nZXMuDQo+Pg0KPj4gU28sIGlmIEkgaGFkIGEgY2hhbmdlIGluIGZv
by50eHQsIEkgd291bGQgbGlrZWx5IHVzZSAiZ2l0IHN0YXR1cyIgdG8NCj4+IHZpZXcgdGhh
dCB1bnN0YWdlZCBjaGFuZ2UuICBUaGVuIEkgY2FuIHN0YWdlIGl0IHVzaW5nICJnaXQgYWRk
DQo+PiBmb28udHh0Ii4gICJnaXQgc3RhdHVzIiB3aWxsIHRoZW4gc2hvdyB0aGF0IGl0IGlz
IHN0YWdlZC4gIEZpbmFsbHksIEkNCj4+IHdpbGwgZG8gImdpdCBjb21taXQiLCB3aGljaCB3
aWxsIGFzayBmb3IgYSBjb21taXQgdGV4dCwgYW5kIGNvbW1pdCB0aGUNCj4+IGNoYW5nZSB0
byB0aGUgdHJlZS4gIEkgY2FuIHRoZW4gdmVyaWZ5IHRoYXQgdGhlIGNoYW5nZSBpcyBjb21t
aXR0ZWQNCj4+IHVzaW5nICJnaXQgbG9nIi4NCj4+DQo+PiBEb2VzIHRoYXQgaGVscCB5b3Ug
b3V0LCBvciBkaWQgSSBtaXN1bmRlcnN0YW5kIHlvdXIgc2l0dWF0aW9uPw0KPj4NCj4+IC1K
ZWZmDQo+Pg0KPj4gT24gV2VkLCBKdW4gMjIsIDIwMjIgYXQgMTE6MTkgQU0gS2V2aW4gQnJh
Y2UgPGtldmluYnJhY2VAZ214LmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBIaSwNCj4+Pg0KPj4+
IEkgc3BlbnQgYWJvdXQgMiBkYXlzIHRyeWluZyB0byBmaWd1cmUgdGhpcyBvdXQsIGJ1dCBJ
IGd1ZXNzIG5vdCBhIGxvdCBvZiBwZW9wbGUgZG8gdGhpcywgc28gSSB3YXMgbm90IGFibGUg
dG8gZmluZCBhIGdvb2QgZXhhbXBsZSBzb21ld2hlcmUgb24gdGhlIEludGVybmV0Lg0KPj4+
IEhvdyB0byBJIHVzZSBnaXQgdG8gZ2F0aGVyIHVwIG5ldyBjb2RlIHRvIGJlIGNvbnZlcnRl
ZCB0byBwYXRjaGVzPw0KPj4+IFNwZWNpZmljYWxseSwgSSBoYXZlIDIwKyBuZXcgZmlsZXMg
aW4gb25lIGxvY2F0aW9uIChkcml2ZXJzL2dwdS9kcm0vdmlhKSBhbmQgYSBzbWFsbCBjaGFu
Z2UgdG8gRFJNIG1haW4gbWFrZSBmaWxlIChkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUpLg0K
Pj4+IElmIHNvbWVvbmUgY2FuIHRlbGwgbWUgaG93IHRvIGRvIHRoaXMsIEkgd2lsbCBwb3N0
IHRoZSB3b3JrIG9uIGRyaS1kZXZlbC4NCj4+Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4NCj4+PiBL
ZXZpbiBCcmFjZQ0KPj4+IEJyYWNlIENvbXB1dGVyIExhYm9yYXRvcnkgYmxvZw0KPj4+IGh0
dHBzOi8vYnJhY2Vjb21wdXRlcmxhYi5jb20NCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------XTb05W94MQTMJ2PfdWylxaeC--

--------------VSL0c6oMl5TYDfyNZ36PEYKE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK0x0YFAwAAAAAACgkQlh/E3EQov+Bz
aBAApAwieYMtew+PKcdFbwsEKc6P6o0cQu91uXQdQYnfwbXvrRVuV2KFRE5rLvCH9CCpffJz3YN6
aFGWl2T0GTIUHf1uZHirt8FTnq3SPrth/bkWEy69evncurgK48fRYuwda7I+OIsTBBGzKaXSO70H
OQJw1ygqwbkTj0sqrwAhcsPYFEr0yZsavC+2It/R/AKLjxa8GdmjdMJQMT17oUYvKF9sOH0hVrjL
fNcjnP6exhTIaPMbSZnrer58YXPHtPtP/WnuhPTqpg150edbiqVM46ZK1ELIRbpca8Oi96o2T6R0
G+lfe/UV4ozXO7Fwy87n3KK26kZXDrYEkD0ZG/2+XO9o2HS+d7oTAPghaHRblocljPXWsbUu1PPw
RWlpHn7Ec6xuYiHUQjPXwQoZZXGtpMK4syHwuepGg49kPWJx4Zmzfbm4iZDQh1aUXqRME0T0bMI4
PYvbhh5iK8kkkJoDZWSaFFc4ku9IXLNO1i0XV4A4vyPYEous7/lKmEgfn2xX5d3Mzzdi+w+CJvgk
NGj4YOKOvgK1h2N9PcdaAv/wFVCeEee9vKTRFnEt0WkK8BvrxenRB2D/YBPBrHjkOh8rJvZ56gLq
XzjIxoqXJKQJYNNfnmG7FoyMkgDoZACBQInBgUH9QanqEtoFDwRLdbqpSZWnYUeH4w1lXLv30i0N
DYA=
=IHaw
-----END PGP SIGNATURE-----

--------------VSL0c6oMl5TYDfyNZ36PEYKE--
