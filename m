Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5D625A8A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 13:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D51F10E167;
	Fri, 11 Nov 2022 12:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B8B10E167
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:37:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 211F0226D3;
 Fri, 11 Nov 2022 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668170233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oe0EVib4V5d0mTbfqDTmQDzOv5WnUzqoTXMLBXAf99c=;
 b=UGgcAnw0t2Pa9NeDUrO314o/UePW5sgOJHNRTuq0XmISln8M5VEXooq25+tPLIO7IfsoD9
 C+/r7/4okMT8cDCHMhdUN2VrZzC2mopr5vwwIC1waIYSWIOfxQlQmGDhNTr4N8ReyeiN9a
 o6Gg4zUVuhbxUL8F/85UodON6mGQSTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668170233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oe0EVib4V5d0mTbfqDTmQDzOv5WnUzqoTXMLBXAf99c=;
 b=Lly01IF2xo8L7hFzBWG9GW5d3FCp2Q6ioZb1zCuKUMPmcguo2yTxsh/RwP0xBaJjRFxAzN
 Z/Sx/4HDy9K7okBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F30C713357;
 Fri, 11 Nov 2022 12:37:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EMFCOvhBbmP4TgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Nov 2022 12:37:12 +0000
Message-ID: <67cfe71f-358f-5bbf-a5b5-019cbc4838a5@suse.de>
Date: Fri, 11 Nov 2022 13:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] drm: Move nomodeset kernel parameter to drivers/video
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-2-tzimmermann@suse.de>
 <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V70rFrUZmTRFGuIvk0zIH0f2"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V70rFrUZmTRFGuIvk0zIH0f2
Content-Type: multipart/mixed; boundary="------------qNIBT6O7Ye2biLa6BwSRs1eK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <67cfe71f-358f-5bbf-a5b5-019cbc4838a5@suse.de>
Subject: Re: [PATCH 1/2] drm: Move nomodeset kernel parameter to drivers/video
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-2-tzimmermann@suse.de>
 <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>
In-Reply-To: <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>

--------------qNIBT6O7Ye2biLa6BwSRs1eK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTEuMjIgdW0gMTA6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDExLzcvMjIgMTE6NDksIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPiANCj4gWy4uLl0NCj4gDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4+IGlu
ZGV4IGE0NjVkNTI0Mjc3NGEuLjcwMTc4YzVmNTM5NTYgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4+IEBA
IC0zNzc3LDcgKzM3NzcsNyBAQA0KPj4gICAJCQlzaHV0ZG93biB0aGUgb3RoZXIgY3B1cy4g
IEluc3RlYWQgdXNlIHRoZSBSRUJPT1RfVkVDVE9SDQo+PiAgIAkJCWlycS4NCj4+ICAgDQo+
PiAtCW5vbW9kZXNldAlEaXNhYmxlIGtlcm5lbCBtb2Rlc2V0dGluZy4gRFJNIGRyaXZlcnMg
d2lsbCBub3QgcGVyZm9ybQ0KPj4gKwlub21vZGVzZXQJRGlzYWJsZSBrZXJuZWwgbW9kZXNl
dHRpbmcuIEdyYXBoaWNzIGRyaXZlcnMgd2lsbCBub3QgcGVyZm9ybQ0KPj4gICAJCQlkaXNw
bGF5LW1vZGUgY2hhbmdlcyBvciBhY2NlbGVyYXRlZCByZW5kZXJpbmcuIE9ubHkgdGhlDQo+
PiAgIAkJCXN5c3RlbSBmcmFtZWJ1ZmZlciB3aWxsIGJlIGF2YWlsYWJsZSBmb3IgdXNlIGlm
IHRoaXMgd2FzDQo+PiAgIAkJCXNldC11cCBieSB0aGUgZmlybXdhcmUgb3IgYm9vdCBsb2Fk
ZXIuDQo+IA0KPiBOb3QgcmVhbGx5IHBhcnQgb2YgeW91ciBwYXRjaCBidXQgcHJvYmFibHkg
d2Ugc2hvdWxkIHJld29yZCB0aGlzIGEgbGl0dGxlIGJpdC4NCj4gDQo+IEJlY2F1c2UgYXMg
dGhpcyBpcyB3cml0dGVuLCBpdCBpbXBsaWVzIHRoYXQgbm90IG9ubHkgRFJNIGRyaXZlcnMg
d2l0aCBmZWF0dXJlDQo+IERSSVZFUl9NT0RFU0VUIHdpbGwgbm90IGJlIGF2YWlsYWJsZSBi
dXQgYWxzbyBkcml2ZXJzIHdpdGggRFJJVkVSX1JFTkRFUi4gQnV0DQo+IHRoYXQncyBub3Qg
dGhlIGNhc2UsIHJlbmRlci1vbmx5IGRyaXZlcnMgdXN1YWxseSBqdXN0IGlnbm9yZSB0aGlz
IHBhcmFtZXRlcg0KPiAoYnV0IG5vdCBhbGwgSUlSQyksIHNvIEkgd29uZGVyIGhvdyB3ZSBj
b3VsZCBtYWtlIHRoaXMgY29tbWVudCBtb3JlIGFjY3VyYXRlLg0KPiANCj4gQWxzbyBtYXli
ZSB3ZSBjYW4gbWVudGlvbiBpbiB0aGUgY29tbWVudCBmYmRldiBhbmQgRFJNPyBKdXN0IHRv
IG1ha2UgaXQgY2xlYXINCj4gdGhhdCB0aGlzIHdpbGwgYWZmZWN0IHRvIGJvdGggc3Vic3lz
dGVtcz8gV2hlbiBJIGZpcnN0IHdvcmtlZCBvbiB0aGlzLCB0aGVyZQ0KPiB3ZXJlIGEgbG90
IG9mIGFzc3VtcHRpb25zIGluIHRoZSBzdGFjayAoZ2RtLCBtdXR0ZXIsIHBseW1vdXRoKSB0
aGF0IG5vbW9kZXNldA0KPiBiYXNpY2FsbHkgbWVhbnQgIm5vIERSTSBidXQgZmJkZXYiLg0K
PiANCj4gWy4uLl0NCj4gDQo+PiAgIA0KPj4gICBpbnQgZHJtX2Rldl9zZXRfdW5pcXVlKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm5hbWUpOw0KPj4gICANCj4+IC1l
eHRlcm4gYm9vbCBkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KHZvaWQpOw0KPj4gKy8qIFRP
RE86IElubGluZSBkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkgaW4gYWxsIGl0cyBjYWxs
ZXJzLiAqLw0KPiANCj4gSSBndWVzcyB5b3UgcGxhbiB0byBkbyB0aGF0IGFzIGZvbGxvdy11
cCBwYXRjaGVzIG9uY2UgdGhpcyBzZXJpZXMgbGFuZD8gSnVzdA0KPiB0byBhdm9pZCB0aGUg
Y2h1cm4gdG8gcmVxdWlyZSBhY2tzIGZvciBhbGwgdGhlIGRyaXZlcnMgdG8gbWVyZ2UgdGhp
cyBzZXJpZXM/DQoNClllcy4gSXQgaGFzIG5vIGh1cnJ5LCBidXQgd2UgY2FuIGRvIHRoYXQu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoZSBjaGFuZ2VzIGxvb2tzIGdv
b2QgdG8gbWUuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------qNIBT6O7Ye2biLa6BwSRs1eK--

--------------V70rFrUZmTRFGuIvk0zIH0f2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNuQfgFAwAAAAAACgkQlh/E3EQov+A4
iRAAg6ww0uCRz0Y6BPSL+d8OzLH6dp4XDLwthg1/bCD8uj9PM92Yr+3NmvMm/2wBA1bKuyxEobtl
/COtOUWeJs87PRWtkx4Uk2vEpLMxOJjDXO4tK+dVVrjM379RlrrutHyGKnjLsLTVAwIBLa5aKIp6
yuBIF0/r6LtTtFNnoXiW7uQaYRUasChayxV41KbpGa1kndUfCwNHS0Rw8AV8Pzwv5kyOqs3QOQrj
JnGK1HQtfK9yzFBukbYMtIThnEd6KhJ399wPgKY5FfVdzCQRWpBgulBe1jZItRa7DHr2VU9Ex9FJ
GIFRRUW3iZ/iZlVGtiXBFbd0DblysQsRPq7LdDWFmFA7fJnpxUJWyNT4otCYWP89oXSbadTXWEzv
CvFWiqjbZxQCN8p9WeszKQjAx5dPUI1XlJRddsFEaoNisBgKmZplxY9TZVhpDcd+QFT9AeX7rSDd
SLhGuIkyeBb0MHwvukKuN9mp5kFjLltmpDyzlrgY8/RDGbfxADG3AR7WN8ZTWZ37RETw2jqPk4C5
hJDSqrQ/vmijrj9Epb4f+P8ogVHgpLU3OFRxJRRFBn+LHv6OfoHBRxPp3Y9SONcYrph5Y+p0rAaG
R/7hsBSLpvG1FHv1KgmP7fMfYaeSD5Dk+PUMtZopzvJscZ0BQq/ZD9ub2sO/otzC/KuTg41MrBR9
nI8=
=Za3v
-----END PGP SIGNATURE-----

--------------V70rFrUZmTRFGuIvk0zIH0f2--
