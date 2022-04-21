Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64C50A802
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 20:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A54A10E40A;
	Thu, 21 Apr 2022 18:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F3F10E40A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 18:22:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 968961F37B;
 Thu, 21 Apr 2022 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650565330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lIyV/OtKNlttvvd9RfW7t3cH8DGo03g57Kg/Ot/oG8w=;
 b=UHM4W0KqM83e5ysZQaws0X/2YD04yP2NswMyMhPkgaPFCjRcpl7f32DQQvOCWtxBT4kT/T
 bAYpNfC1UwF95pajqKQqenuorvOzT2eKR3nT7FFUa461D7eOgPSbj/z+cNo57LnJ7R9dgK
 BRXb6fq44eeRW6YQCMtIn8FG0TYqtZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650565330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lIyV/OtKNlttvvd9RfW7t3cH8DGo03g57Kg/Ot/oG8w=;
 b=M20bYiN2yItIRQCd1ul1O93TkLvt+GG6mT/vlzcyU6pnSs0P8Ksc3zkrmtD2gXD1kY7NY1
 4RU9xjRyp6yX+ADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D7E313446;
 Thu, 21 Apr 2022 18:22:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TX6uGdKgYWI+HAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 18:22:10 +0000
Message-ID: <ce65d1b0-44ad-54cb-d53f-ed0f7df4d247@suse.de>
Date: Thu, 21 Apr 2022 20:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
 <10c81e57-2f09-f4f8-dc2f-6bd05ef819d7@redhat.com>
 <CADvTj4oms8R1fhFpyZ+juU=4Eozie6f-3fzz4+jtptj3M9VCbw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CADvTj4oms8R1fhFpyZ+juU=4Eozie6f-3fzz4+jtptj3M9VCbw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------074uv6e0yIDXdx0Gp0IL16c8"
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------074uv6e0yIDXdx0Gp0IL16c8
Content-Type: multipart/mixed; boundary="------------cRmvAgVplMZvNym38vZhiRId";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: James Hilliard <james.hilliard1@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <ce65d1b0-44ad-54cb-d53f-ed0f7df4d247@suse.de>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
 <10c81e57-2f09-f4f8-dc2f-6bd05ef819d7@redhat.com>
 <CADvTj4oms8R1fhFpyZ+juU=4Eozie6f-3fzz4+jtptj3M9VCbw@mail.gmail.com>
In-Reply-To: <CADvTj4oms8R1fhFpyZ+juU=4Eozie6f-3fzz4+jtptj3M9VCbw@mail.gmail.com>

--------------cRmvAgVplMZvNym38vZhiRId
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjIgdW0gMTk6Mzkgc2NocmllYiBKYW1lcyBIaWxsaWFyZDoNCj4g
T24gVGh1LCBBcHIgMjEsIDIwMjIgYXQgODoyMiBBTSBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMNCj4gPGphdmllcm1AcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gNC8yMS8yMiAx
NDo1NCwgUGF0cmlrIEpha29ic3NvbiB3cm90ZToNCj4+PiBPbiBUaHUsIEFwciAyMSwgMjAy
MiBhdCAyOjQ3IFBNIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcw0KPj4+IDxqYXZpZXJtQHJl
ZGhhdC5jb20+IHdyb3RlOg0KPj4NCj4+IFtzbmlwXQ0KPj4NCj4+Pj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvS2NvbmZpZw0KPj4+Pj4+PiBpbmRleCAwY2ZmMjAyNjVmOTcuLmE0MjJmYTg0ZDUz
YiAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9LY29uZmln
DQo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvS2NvbmZpZw0KPj4+Pj4+
PiBAQCAtMiwxMSArMiwxMyBAQA0KPj4+Pj4+PiAgICBjb25maWcgRFJNX0dNQTUwMA0KPj4+
Pj4+PiAgICAgICAgdHJpc3RhdGUgIkludGVsIEdNQTUwMC82MDAvMzYwMC8zNjUwIEtNUyBG
cmFtZWJ1ZmZlciINCj4+Pj4+Pj4gICAgICAgIGRlcGVuZHMgb24gRFJNICYmIFBDSSAmJiBY
ODYgJiYgTU1VDQo+Pj4+Pj4+ICsgICAgIGRlcGVuZHMgb24gRkINCj4+Pj4+Pg0KPj4+Pj4+
IFdoeSBkbyB3ZSBuZWVkIEZCIGhlcmU/IEZyYW1lYnVmZmVyIHN1cHBvcnQgc2hvdWxkIGJl
IGhpZGRlbiBieSBEUk0ncw0KPj4+Pj4+IGZiZGV2IGhlbHBlcnMuDQo+Pj4+Pg0KPj4+Pj4g
SXQgaXMgbm90IG5lZWRlZCBidXQgZ2l2ZXMgaGltIHZpZGVvIG91dHB1dCBzaW5jZSBpdCBl
bmFibGVzIHRoZSBkcm0NCj4+Pj4+IGZiZGV2IGVtdWxhdGlvbi4NCj4+Pj4+DQo+Pj4+DQo+
Pj4+IEknbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHRoaXMuIFNob3VsZG4ndCBkZXBlbmQg
b24gRFJNX0ZCREVWX0VNVUxBVElPTiB0aGVuPw0KPj4+DQo+Pj4gTm8sIGl0IHNob3VsZG4n
dCBkZXBlbmQgb24gYW55IEZCREVWIHN0dWZmIHNpbmNlIGl0J3Mgbm90IGFjdHVhbGx5DQo+
Pj4gcmVxdWlyZWQuIEl0IGp1c3QgaGFwcGVucyB0byBoZWxwIGluIHRoaXMgY2FzZSBzaW5j
ZSB3ZXN0b24gKyBmYmRldg0KPj4+IGJhY2tlbmQgd29ya3MgYnV0IG5vdCB3ZXN0b24gd2l0
aCBkcm0gYmFja2VuZCAob3Igd2hhdGV2ZXIgY29uZmlnDQo+Pj4gSmFtZXMgaGF2ZSBzZXQp
Lg0KPj4NCj4+IEkgc2VlLiBUaGVuIHRoZSBjb3JyZWN0IGFwcHJvYWNoIGZvciB0aGVtIHdv
dWxkIGJlIHRvIGp1c3QgZW5hYmxlIENPTkZJR19GQg0KPj4gYW5kIERSTV9GQkRFVl9FTVVM
QVRJT04gaW4gdGhlaXIga2VybmVsIGNvbmZpZywgcmF0aGVyIHRoYW4gbWFraW5nIHRoaXMg
dG8NCj4+IGRlcGVuZCBvbiBhbnl0aGluZyBGQiByZWxhdGVkIGFzIHlvdSBzYWlkLg0KPiAN
Cj4gWWVhaCwgc28gaXQgbG9va3MgbGlrZSBDT05GSUdfRkJfRUZJIGlzIG5vdCBuZWVkZWQg
YnV0DQo+IENPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9OIGlzLCBJIHRoaW5rIEkganVzdCBh
c3N1bWVkIGVmaWZiDQo+IHdhcyB3aGF0IHdhcyBuZWVkZWQgYmFzZWQgb24gdGhlIGtlcm5l
bCBsb2dzLg0KPiANCj4gVGhpcyBkb2VzIG5vdCB3b3JrOg0KPiBDT05GSUdfRkIgZW5hYmxl
ZA0KPiBDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTiBkaXNhYmxlZA0KPiANCj4gVGhpcyB3
b3JrczoNCj4gQ09ORklHX0ZCIGVuYWJsZWQNCj4gQ09ORklHX0RSTV9GQkRFVl9FTVVMQVRJ
T04gZW5hYmxlZA0KPiANCj4+DQo+Pj4NCj4+Pj4NCj4+Pj4+IEkgbG9va2VkIHNvbWUgbW9y
ZSBhdCB0aGUgbG9ncyBhbmQgaXQgc2VlbXMgd2VzdG9uIGRvZXNuJ3Qgd29yayBvbiBoaXMN
Cj4+Pj4+IHN5c3RlbSB3aXRob3V0IHRoZSBmYmRldiBiYWNrZW5kLiBTbyB0aGUgcXVlc3Rp
b24gaXMgd2h5IHdlc3RvbiBpc24ndA0KPj4+Pj4gd29ya2luZyB3aXRob3V0IGZiZGV2PyBQ
ZXJoYXBzIHRoaXMgaXMganVzdCBhIFdlc3RvbiBjb25maWd1cmF0aW9uDQo+Pj4+PiBpc3N1
ZT8NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEJ1dCBpcyB3ZXN0b24gdXNpbmcgdGhlIGZiZGV2IGVt
dWxhdGVkIGJ5IERSTSBvciB0aGUgb25lIHJlZ2lzdGVyZWQgYnkNCj4+Pj4gZWZpZmI/IEkg
dGhvdWdodCB0aGF0IHRoZSBsYXR0ZXIgZnJvbSB3aGF0IHdhcyBtZW50aW9uZWQgaW4gdGhp
cyB0aHJlYWQuDQo+Pj4NCj4+PiBJdCdzIHVzaW5nIGRybSBmYmRldiBlbXVsYXRpb24gd2l0
aCBnbWE1MDAgc28gRUZJRkIgaGFzIG5vdGhpbmcgdG8gZG8NCj4+PiB3aXRoIHRoaXMuIEkg
YmVsaWV2ZSBpdCB3YXMganVzdCBzaW1wbHkgaW5jb3JyZWN0bHkgcmVwb3J0ZWQuIElmIEkn
bQ0KPj4+IGNvcnJlY3QgdGhlbiAiZGVwZW5kcyBvbiBGQiIgaXMgd2hhdCBtYWtlcyB2aWRl
byBvdXRwdXQgd29yayBmb3INCj4+PiBKYW1lcy4NCj4+Pg0KPj4NCj4+IEdvdCBpdC4gVGhh
bmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4NCj4gDQo+IEhlcmUncyBteSB3ZXN0b24uaW5p
Og0KPiBbY29yZV0NCj4gc2hlbGw9a2lvc2stc2hlbGwuc28NCj4gbW9kdWxlcz1zeXN0ZW1k
LW5vdGlmeS5zbw0KPiBiYWNrZW5kPWRybS1iYWNrZW5kLnNvDQo+IGlkbGUtdGltZT0wDQo+
IHJlcXVpcmUtaW5wdXQ9ZmFsc2UNCj4gdXNlLXBpeG1hbj10cnVlDQo+IA0KPiBbc2hlbGxd
DQo+IGxvY2tpbmc9ZmFsc2UNCj4gY3Vyc29yLXRoZW1lPU9ic2lkaWFuDQo+IHBhbmVsLXBv
c2l0aW9uPW5vbmUNCj4gDQo+IFtvdXRwdXRdDQo+IG5hbWU9RFZJLUQtMQ0KPiB0cmFuc2Zv
cm09cm90YXRlLTI3MA0KPiANCj4gW291dHB1dF0NCj4gbmFtZT1EUC0yDQo+IG1vZGU9b2Zm
DQo+IA0KPiBbb3V0cHV0XQ0KPiBuYW1lPUxWRFMtMQ0KPiBtb2RlPW9mZg0KDQpZb3UgbWVu
dGlvbmVkIHRoYXQgeW91IHdhbnQgdG8gdXNlIEhETUksIGJ1dCBpdCdzIG5vdCBjb25maWd1
cmVkIGhlcmUuIA0KSXMgdGhhdCBpbnRlbnRpb25hbGx5Pw0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiBbbGliaW5wdXRdDQo+IHRvdWNoc2NyZWVuX2NhbGlicmF0b3I9dHJ1
ZQ0KPiANCj4+DQo+PiAtLQ0KPj4gQmVzdCByZWdhcmRzLA0KPj4NCj4+IEphdmllciBNYXJ0
aW5leiBDYW5pbGxhcw0KPj4gTGludXggRW5naW5lZXJpbmcNCj4+IFJlZCBIYXQNCj4+DQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------cRmvAgVplMZvNym38vZhiRId--

--------------074uv6e0yIDXdx0Gp0IL16c8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJhoNEFAwAAAAAACgkQlh/E3EQov+Dy
gw//R/a/7l5FE9MGalYEidZ7ecEgoPekb8q7Zxkk4taa2jO9oj+QrSdbLOkkHAP3LJwcW2Q6x7hr
7tWK9wxHQ1pNup7t0mDZ3sV79o/mu2SXm6FBZX+Jv2txrMOge+mGbcJ0wBHTMAvw9r0Thnm00jIP
UdsgLCJmoLXLHnoxPq/dVLkbvAVAX0HuVtEuXjC0ENykFTY3ogizF40QZ0qe2ouD+InEPMHHmReQ
cQXfvtYFBQDib0X8Iqi06EyTDBhhzD/lgAq7NnK+P+xCa02s0eZgbCUnaPwqKgBNQg/TqSxJoitc
k4YzMJGrV9DvrHi/IvDTCianQ9lNd1v0t79NovVFxvHq6jYnasytm/hzuqJHIXaFNhwUPUwYTFeH
SstOCYAuE5GkKMyP9vFFweWPzChUeABI8USOiTMjswzzwebltnNNEjnbzxKSwvBKTU3OoxBQpnXp
7yL+Vjevzerp3d0lmZ1ICHq6KK3PTaf/F72eNAqQ7f418oGxVncgck2S8evQA55Pl2lkS9S57q3/
5XH54yoTNYWnpj6rfgLhytXakdMPpsy8Hnq672EQ11d5T+OIMfCchNh4YmWArheEzFI1FZBP7/L0
NZ6tae2nuuR4iZSnOGrPuOzkwG8jBYOLuMHIB/sw3qIwSGK3bHBdK4MvYUBLkgXa5pLZbDIleY+b
uts=
=0pGQ
-----END PGP SIGNATURE-----

--------------074uv6e0yIDXdx0Gp0IL16c8--
