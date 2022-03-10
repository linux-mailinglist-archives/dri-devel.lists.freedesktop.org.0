Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC584D5167
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 20:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A7D10EA14;
	Thu, 10 Mar 2022 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA66510EA14
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 19:22:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D1A21F381;
 Thu, 10 Mar 2022 19:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646940120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gm3ynX3tI89AtyrZantCIi+jTB6DzoQd6gDDaz6YUa8=;
 b=rWrcVGkLomnoxi6TKc054i7EyySA/eJwhylSUjgvjCbEdZrkFIgF9QR6hvNKspmVRF2FhI
 gsxtcpu0s/VaXwRnIYCp2rINw36tHEvks+eDlWtG2vV5Z0ExJhlbfhF8MDfdhu6KHGY+1i
 nmFL595aBtrsRKfiSdqY623mKtJ97ag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646940120;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gm3ynX3tI89AtyrZantCIi+jTB6DzoQd6gDDaz6YUa8=;
 b=fOPPeLoG+yaK62VmVEKfwRfNlAfUpyAvGZiYzBCsS4LbDcAbKu0VDTodIj8rlJvM4kDE8d
 P/2t7dzORaQ9FwBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D82113A66;
 Thu, 10 Mar 2022 19:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RxQRDdhPKmJ5WgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Mar 2022 19:22:00 +0000
Message-ID: <d8726a6e-d0a9-1471-c113-a7bf567aa994@suse.de>
Date: Thu, 10 Mar 2022 20:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20220223193804.18636-5-tzimmermann@suse.de>
 <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
 <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
 <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
 <f318d57d-ef9e-295a-6865-eb0377a9bd07@samsung.com>
 <CAMuHMdU4w-68-V2QXqbJqorL3iQFyBSRkGTrz5ePFRRUC8mRzw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdU4w-68-V2QXqbJqorL3iQFyBSRkGTrz5ePFRRUC8mRzw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------baL2B05bDt0QU09HTAUrZZmq"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------baL2B05bDt0QU09HTAUrZZmq
Content-Type: multipart/mixed; boundary="------------id7xRhjsDjLW1TL3TT70Qtpf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <d8726a6e-d0a9-1471-c113-a7bf567aa994@suse.de>
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
References: <20220223193804.18636-5-tzimmermann@suse.de>
 <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
 <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
 <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
 <f318d57d-ef9e-295a-6865-eb0377a9bd07@samsung.com>
 <CAMuHMdU4w-68-V2QXqbJqorL3iQFyBSRkGTrz5ePFRRUC8mRzw@mail.gmail.com>
In-Reply-To: <CAMuHMdU4w-68-V2QXqbJqorL3iQFyBSRkGTrz5ePFRRUC8mRzw@mail.gmail.com>

--------------id7xRhjsDjLW1TL3TT70Qtpf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDMuMjIgdW0gMTE6Mzkgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIE1hcmVrLA0KPiANCj4gT24gV2VkLCBNYXIgOSwgMjAyMiBhdCAxMDoyMiBBTSBN
YXJlayBTenlwcm93c2tpDQo+IDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOg0K
Pj4gT24gMDkuMDMuMjAyMiAwOToyMiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4g
QW0gMDguMDMuMjIgdW0gMjM6NTIgc2NocmllYiBNYXJlayBTenlwcm93c2tpOg0KPj4+PiBP
biAyMy4wMi4yMDIyIDIwOjM4LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4+IElt
cHJvdmUgdGhlIHBlcmZvcm1hbmNlIG9mIGNmYl9pbWFnZWJsaXQoKSBieSBtYW51YWxseSB1
bnJvbGxpbmcNCj4+Pj4+IHRoZSBpbm5lciBibGl0dGluZyBsb29wIGFuZCBtb3Zpbmcgc29t
ZSBpbnZhcmlhbnRzIG91dC4gVGhlIGNvbXBpbGVyDQo+Pj4+PiBmYWlsZWQgdG8gZG8gdGhp
cyBhdXRvbWF0aWNhbGx5LiBUaGlzIGNoYW5nZSBrZWVwcyBjZmJfaW1hZ2VibGl0KCkNCj4+
Pj4+IGluIHN5bmMgd2l0aCBzeXNfaW1hZ2ViaXQoKS4NCj4+Pj4+DQo+Pj4+PiBBIG1pY3Jv
YmVuY2htYXJrIG1lYXN1cmVzIHRoZSBhdmVyYWdlIG51bWJlciBvZiBDUFUgY3ljbGVzDQo+
Pj4+PiBmb3IgY2ZiX2ltYWdlYmxpdCgpIGFmdGVyIGEgc3RhYmlsaXppbmcgcGVyaW9kIG9m
IGEgZmV3IG1pbnV0ZXMNCj4+Pj4+IChpNy00NzkwLCBGdWxsSEQsIHNpbXBsZWRybSwga2Vy
bmVsIHdpdGggZGVidWdnaW5nKS4NCj4+Pj4+DQo+Pj4+PiBjZmJfaW1hZ2VibGl0KCksIG5l
dzogMTU3MjQgY3ljbGVzDQo+Pj4+PiBjZmJfaW1hZ2VibGl0KCk6IG9sZDogMzA1NjYgY3lj
bGVzDQo+Pj4+Pg0KPj4+Pj4gSW4gdGhlIG9wdGltaXplZCBjYXNlLCBjZmJfaW1hZ2VibGl0
KCkgaXMgbm93IH4yeCBmYXN0ZXIgdGhhbiBiZWZvcmUuDQo+Pj4+Pg0KPj4+Pj4gdjM6DQo+
Pj4+PiAgICAgICogZml4IGNvbW1pdCBkZXNjcmlwdGlvbiAoUGVra2EpDQo+Pj4+Pg0KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+Pj4+PiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0K
Pj4+Pj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUBy
ZWRoYXQuY29tPg0KPj4+PiBUaGlzIHBhdGNoIGxhbmRlZCByZWNlbnRseSBpbiBsaW51eCBu
ZXh0LTIwMjIwMzA4IGFzIGNvbW1pdCAwZDAzMDExODk0ZDINCj4+Pj4gKCJmYmRldjogSW1w
cm92ZSBwZXJmb3JtYW5jZSBvZiBjZmJfaW1hZ2VibGl0KCkiKS4gU2FkbHkgaXQgY2F1c2Vz
IGENCj4+Pj4gZnJlZXplIGFmdGVyIERSTSBhbmQgZW11bGF0ZWQgZmJkZXYgaW5pdGlhbGl6
YXRpb24gb24gdmFyaW91cyBTYW1zdW5nDQo+Pj4+IEV4eW5vcyBBUk0gMzJiaXQgYmFzZWQg
Ym9hcmRzLiBUaGlzIGhhcHBlbnMgd2hlbiBrZXJuZWwgaXMgY29tcGlsZWQgZnJvbQ0KPj4+
PiBleHlub3NfZGVmY29uZmlnLiBTdXJwcmlzaW5nbHkgd2hlbiBrZXJuZWwgaXMgY29tcGls
ZWQgZnJvbQ0KPj4+PiBtdWx0aV92N19kZWZjb25maWcgYWxsIHRob3NlIGJvYXJkcyBib290
IGZpbmUsIHNvIHRoaXMgaXMgYSBtYXR0ZXIgb2YNCj4+Pj4gb25lIG9mIHRoZSBkZWJ1Z2dp
bmcgb3B0aW9ucyBlbmFibGVkIGluIHRoZSBleHlub3NfZGVmY29uZmlnLiBJIHdpbGwgdHJ5
DQo+Pj4+IHRvIGFuYWx5emUgdGhpcyBmdXJ0aGVyIGFuZCBzaGFyZSB0aGUgcmVzdWx0cy4g
UmV2ZXJ0aW5nICRzdWJqZWN0IG9uIHRvcA0KPj4+PiBvZiBuZXh0LTIwMjIwMzA4IGZpeGVz
IHRoZSBib290IGlzc3VlLg0KPj4+DQo+Pj4gVGhhbmtzIGZvciByZXBvcnRpbmcuIEkgZG9u
J3QgaGF2ZSB0aGUgaGFyZHdhcmUgdG8gcmVwcm9kdWNlIGl0IGFuZA0KPj4+IHRoZXJlJ3Mg
bm8gb2J2aW91cyBkaWZmZXJlbmNlIHRvIHRoZSBvcmlnaW5hbCB2ZXJzaW9uLiBJdCdzIHN1
cHBvc2VkDQo+Pj4gdG8gYmUgdGhlIHNhbWUgYWxnb3JpdGhtIHdpdGggYSBkaWZmZXJlbnQg
aW1wbGVtZW50YXRpb24uIFVubGVzcyB5b3UNCj4+PiBjYW4gZmlndXJlIG91dCB0aGUgaXNz
dWUsIHdlIGNhbiBhbHNvIHJldmVydCB0aGUgcGF0Y2ggZWFzaWx5Lg0KPj4NCj4+IEkndmUg
cGxheWVkIGEgYml0IHdpdGggLmNvbmZpZyBvcHRpb25zIGFuZCBmb3VuZCB0aGF0IHRoZSBp
c3N1ZSBpcw0KPj4gY2F1c2VkIGJ5IHRoZSBjb21waWxlZC1pbiBmb250cyB1c2VkIGZvciB0
aGUgZnJhbWVidWZmZXIuIEZvciBzb21lDQo+PiByZWFzb25zIChzbyBmYXIgdW5rbm93biB0
byBtZSksIGV4eW5vc19kZWZjb25maWcgaGFzIHRoZSBmb2xsb3dpbmcgb2RkDQo+PiBzZXR1
cDoNCj4+DQo+PiBDT05GSUdfRk9OVF9TVVBQT1JUPXkNCj4+IENPTkZJR19GT05UUz15DQo+
PiAjIENPTkZJR19GT05UXzh4OCBpcyBub3Qgc2V0DQo+PiAjIENPTkZJR19GT05UXzh4MTYg
aXMgbm90IHNldA0KPj4gIyBDT05GSUdfRk9OVF82eDExIGlzIG5vdCBzZXQNCj4+IENPTkZJ
R19GT05UXzd4MTQ9eQ0KPj4gIyBDT05GSUdfRk9OVF9QRUFSTF84eDggaXMgbm90IHNldA0K
Pj4gIyBDT05GSUdfRk9OVF9BQ09STl84eDggaXMgbm90IHNldA0KPj4gIyBDT05GSUdfRk9O
VF9NSU5JXzR4NiBpcyBub3Qgc2V0DQo+PiAjIENPTkZJR19GT05UXzZ4MTAgaXMgbm90IHNl
dA0KPj4gIyBDT05GSUdfRk9OVF8xMHgxOCBpcyBub3Qgc2V0DQo+PiAjIENPTkZJR19GT05U
X1NVTjh4MTYgaXMgbm90IHNldA0KPj4gIyBDT05GSUdfRk9OVF9TVU4xMngyMiBpcyBub3Qg
c2V0DQo+PiAjIENPTkZJR19GT05UX1RFUjE2eDMyIGlzIG5vdCBzZXQNCj4+ICMgQ09ORklH
X0ZPTlRfNng4IGlzIG5vdCBzZXQNCj4+DQo+PiBTdWNoIHNldHVwIGNhdXNlcyBhIGZyZWV6
ZSBkdXJpbmcgZnJhbWVidWZmZXIgaW5pdGlhbGl6YXRpb24gKG9yIGp1c3QNCj4+IGFmdGVy
IGl0IGdvdCByZWdpc3RlcmVkKS4gSSd2ZSByZXByb2R1Y2VkIHRoaXMgZXZlbiBvbiBSYXNw
YmVycnkgUGkgM0INCj4+IHdpdGggbXVsdGlfdjdfZGVmY29uZmlnIGFuZCBjaGFuZ2VkIGZv
bnRzIGNvbmZpZ3VyYXRpb24gKHRoaXMgYWxzbw0KPj4gcmVxdWlyZWQgdG8gZGlzYWJsZSB2
aXZpZCBkcml2ZXIsIHdoaWNoIGZvcmNlcyA4eDE2IGZvbnQpLCB3aGVyZSBJIGdvdA0KPj4g
dGhlIGZvbGxvd2luZyBwYW5pYzoNCj4+DQo+PiBzaW1wbGUtZnJhbWVidWZmZXIgM2VhY2Uw
MDAuZnJhbWVidWZmZXI6IGZyYW1lYnVmZmVyIGF0IDB4M2VhY2UwMDAsDQo+PiAweDEyYzAw
MCBieXRlcw0KPj4gc2ltcGxlLWZyYW1lYnVmZmVyIDNlYWNlMDAwLmZyYW1lYnVmZmVyOiBm
b3JtYXQ9YThyOGc4YjgsDQo+PiBtb2RlPTY0MHg0ODB4MzIsIGxpbmVsZW5ndGg9MjU2MA0K
Pj4gODwtLS0gY3V0IGhlcmUgLS0tDQo+PiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdp
bmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZjBhYWMwMDANCj4gDQo+IFNvIHN1cHBv
cnQgZm9yIGltYWdlcyB3aXRoIG9mZnNldHMgb3Igd2lkdGhzIHRoYXQgYXJlIG5vdCBhIG11
bHRpcGxlDQo+IG9mIDggZ290IGJyb2tlbiBpbiBjZmJfaW1hZ2VibGl0KCkuIE9vcHMuLi4N
Cj4gDQo+IEJUVywgdGhlIHZhcmlvdXMgZHJhd2luZyByb3V0aW5lcyB1c2VkIHRvIHNldCBh
IGJpdG1hc2sgaW5kaWNhdGluZw0KPiB3aGljaCBhbGlnbm1lbnRzIHdlcmUgc3VwcG9ydGVk
IChzZWUgYmxpdF94KSwgYnV0IG1vc3Qgb2YgdGhlbSBubw0KPiBsb25nZXIgZG8sIHByZXN1
bWFibHkgYmVjYXVzZSBhbGwgYWxpZ25tZW50cyBhcmUgbm93IHN1cHBvcnRlZA0KPiAoc2lu
Y2UgY2EuIDIwIHllYXJzPykuDQo+IFNvIHlvdSBjYW4gKHRlbXBvcmFyaWx5KSB3b3JrIGFy
b3VuZCB0aGlzIGJ5IGZpbGxpbmcgaW4gYmxpdF94LA0KPiBwcmV2ZW50aW5nIHRoZSB1c2Ug
b2YgdGhlIDd4MTQgZm9udC4NCg0KSG93IGRvIEkgYWN0aXZhdGUgdGhlIDd4MTQgZm9udD8g
SXQncyBjb21waWxlZCBpbnRvIHRoZSBrZXJuZWwgYWxyZWFkeQ0KKENPTkZJR19GT05UXzd4
MTQ9eSkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0K
PiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------id7xRhjsDjLW1TL3TT70Qtpf--

--------------baL2B05bDt0QU09HTAUrZZmq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIqT9cFAwAAAAAACgkQlh/E3EQov+BB
rhAAoXEuTibitBoFI5yRHx8nAg1O7H7hIyJ5dCKPCv3WsWql/vmbCRVOxlx+z/9Ap5836x7j8ou8
W8q8s5b14xXb05LsDnHoCIxq+SmwfGTTwA1dNjFVp4NFpO9HOxs3OFqg+YuSH8VIXszV+aOBN1bO
faAl1tbStoYtFhXlMznuaWpkogfcsVWbgqTOxuS+AEFGWC0l97A23Rm81cw50NM6MEoqcn50tbAf
J4N3KLgi/ACfiCUj0tvupQ7LYi/4WM+UlSmz+hymEkYBkks9Q2FmC0CBmLqkemC2+bhvNWtZKkhg
t/kRE3ifO0UgV5/80DykEBCruCF6SCr9S+aoBL5RqUQaJm4EAiDhyqSrEiMbKVfQIC91fgv9LYjY
Vfxjn4gKMmqsgsmZtC0i3I2YeIlP/l/AoExjPetzo9xf1hJo6maN/2VNKuifRH8SkqR74VFxq7Pd
DxVlYgN9tqCt32mQVqxAfRvhKPHoHQ+NPQuXIpl/ogcHE5DGytwVPCNble643ao49scAfOG4h9Ij
thrQVDXYnhSyMesaOshU8wJvSxXqnYvKQpQ0di0fsiSQLTcYlxEJC3f9FSO7h7RSWyIgRU66Fw5w
4t9zIfrv0f4LCvsW7JEMkz5scIMtmEux1FvCW9tmzdcTKD/21UwMULpuK6IcCQlf8hch/IbDf77q
s7Q=
=z01R
-----END PGP SIGNATURE-----

--------------baL2B05bDt0QU09HTAUrZZmq--
