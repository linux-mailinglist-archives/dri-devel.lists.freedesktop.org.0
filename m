Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94E79360C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 09:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527B10E57F;
	Wed,  6 Sep 2023 07:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E541810E586;
 Wed,  6 Sep 2023 07:18:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0AE1522390;
 Wed,  6 Sep 2023 07:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693984699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZ/2jtuCcGDbvtZZ1dSSULsDv2WRriEDMyd1X3EatRQ=;
 b=NC8MQufTiva+CvxLTwMZmFIxSBpCB8zyHTIWrWoN3fBCjGgHgZwTi0WtKqAA5SdsV1S0hw
 z/yLv0NRH0U9ZeGpAj+QKpsIhrER5MpPh8yTJ1qHJA66gU/8UiBffBOCsT1Pva0al7MwgU
 8Wl8d2+AWEQqZB9YLvG3z2W7rsyjgu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693984699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZ/2jtuCcGDbvtZZ1dSSULsDv2WRriEDMyd1X3EatRQ=;
 b=UlQ4KpQQ3SbpVQkpfXPQel7q/y9d4ELRhaXSXLXoKBW2H0ZiLprI0nsrCEvujWhv2/wlD5
 a+EO6hOUHYCPWODg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BED9C1346C;
 Wed,  6 Sep 2023 07:18:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XcZ0Lbon+GQ6PgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 07:18:18 +0000
Message-ID: <0ace21b2-f0ce-0b14-529f-c0ee2adf972f@suse.de>
Date: Wed, 6 Sep 2023 09:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
 <6d1d8acc-5140-f710-ac00-cb423d7fce78@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6d1d8acc-5140-f710-ac00-cb423d7fce78@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ykBaykporxCxc0GQqibW6Qp3"
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ykBaykporxCxc0GQqibW6Qp3
Content-Type: multipart/mixed; boundary="------------a4MEPrnaSak0MDOJHnwhylRP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Message-ID: <0ace21b2-f0ce-0b14-529f-c0ee2adf972f@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
 <6d1d8acc-5140-f710-ac00-cb423d7fce78@loongson.cn>
In-Reply-To: <6d1d8acc-5140-f710-ac00-cb423d7fce78@loongson.cn>

--------------a4MEPrnaSak0MDOJHnwhylRP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjMgdW0gMDQ6MzQgc2NocmllYiBzdWlqaW5nZmVuZzoNCj4gDQo+
IE9uIDIwMjMvOS81IDIzOjA1LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+
Pg0KPj4gQW0gMDUuMDkuMjMgdW0gMTU6MzAgc2NocmllYiBzdWlqaW5nZmVuZzoNCj4+PiBI
aSwNCj4+Pg0KPj4+DQo+Pj4gT24gMjAyMy85LzUgMTg6NDUsIFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4+PiBIaQ0KPj4+Pg0KPj4+PiBBbSAwNC4wOS4yMyB1bSAyMTo1NyBzY2hy
aWViIFN1aSBKaW5nZmVuZzoNCj4+Pj4+IEZyb206IFN1aSBKaW5nZmVuZyA8c3VpamluZ2Zl
bmdAbG9vbmdzb24uY24+DQo+Pj4+Pg0KPj4+Pj4gT24gYSBtYWNoaW5lIHdpdGggbXVsdGlw
bGUgR1BVcywgYSBMaW51eCB1c2VyIGhhcyBubyBjb250cm9sIG92ZXIgDQo+Pj4+PiB3aGlj
aA0KPj4+Pj4gb25lIGlzIHByaW1hcnkgYXQgYm9vdCB0aW1lLiBUaGlzIHNlcmllcyB0cmll
cyB0byBzb2x2ZSBhYm92ZSANCj4+Pj4+IG1lbnRpb25lZA0KPj4+Pg0KPj4+PiBJZiBhbnl0
aGluZywgdGhlIHByaW1hcnkgZ3JhcGhpY3MgYWRhcHRlciBpcyB0aGUgb25lIGluaXRpYWxp
emVkIGJ5IA0KPj4+PiB0aGUgZmlybXdhcmUuIEkgdGhpbmsgb3VyIGJvb3QtdXAgZ3JhcGhp
Y3MgYWxzbyBtYWtlIHRoaXMgYXNzdW1wdGlvbiANCj4+Pj4gaW1wbGljaXRseS4NCj4+Pj4N
Cj4+Pg0KPj4+IFllcywgYnV0IGJ5IHRoZSB0aW1lIG9mIERSTSBkcml2ZXJzIGdldCBsb2Fk
ZWQgc3VjY2Vzc2Z1bGx5LHRoZSANCj4+PiBib290LXVwIGdyYXBoaWNzIGFscmVhZHkgZmlu
aXNoZWQuDQo+Pj4gRmlybXdhcmUgZnJhbWVidWZmZXIgZGV2aWNlIGFscmVhZHkgZ2V0IGtp
bGxlZCBieSB0aGUgDQo+Pj4gZHJtX2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lf
ZnJhbWVidWZmZXJzKCkNCj4+PiBmdW5jdGlvbiAob3IgaXRzIHNpYmxpbmdzKS4gU28sIHRo
aXMgc2VyaWVzIGlzIGRlZmluaXRlbHkgbm90IHRvIA0KPj4+IGludGVyYWN0IHdpdGggdGhl
IGZpcm13YXJlIGZyYW1lYnVmZmVyDQo+Pg0KPj4gWWVzIGFuZCBuby4gVGhlIGhlbHBlcnMg
eW91IG1lbnRpb24gd2lsbCBhdHRlbXB0IHRvIHJlbW92ZSB0aGUgDQo+PiBmaXJtd2FyZSBm
cmFtZWJ1ZmZlciBvbiB0aGUgZ2l2ZW4gUENJIGRldmljZS4gSWYgeW91IGhhdmUgbXVsdGlw
bGUgUENJIA0KPj4gZGV2aWNlcywgdGhlIG90aGVyIGRldmljZXMgd291bGQgbm90IGJlIGFm
ZmVjdGVkLg0KPj4NCj4gWWVzIGFuZCBuby4NCj4gDQo+IA0KPiBGb3IgdGhlIHllcyBwYXJ0
OiBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMoKSAN
Cj4gb25seSBraWxsIHRoZSBjb25mbGljdCBvbmUuDQo+IEJ1dCBmb3IgYSBzcGVjaWZpYyBt
YWNoaW5lIHdpdGggdGhlIG1vZGVybiBVRUZJIGZpcm13YXJlLA0KPiB0aGVyZSBzaG91bGQg
YmUgb25seSBvbmUgZmlybXdhcmUgZnJhbWVidWZmZXIgZHJpdmVyLg0KPiBUaGF0IHNob3Vk
ZCBiZSB0aGUgRUZJRkIoVUVGSSBHT1ApLiBJIGRvIGhhdmUgbXVsdGlwbGUgUENJIGRldmlj
ZXMsDQo+IGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2hlbiBhbmQgd2h5IGEgc3lzdGVtIHdp
bGwgaGF2ZSBtb3JlIHRoYW4gb25lIA0KPiBmaXJtd2FyZSBmcmFtZWJ1ZmZlci4NCg0KTWF5
YmUgc29tZXdoYXQgdW5yZWxhdGVkIHRvIHRoZSBhY3R1YWwgZGlzY3Vzc2lvbiwgYnV0IGl0
J3Mgbm90IGFzIA0Kc2ltcGxlIGFzIHlvdSBhc3N1bWUuIE1hbnkgbm9uLVg4NiBzeXN0ZW1z
IHVzZSBEZXZpY2VUcmVlLiBPbiBTcGFyYyANCklJUkMsIHRoZXJlJ3MgdGhlIGNhc2Ugb2Yg
aGF2aW5nIG11bHRpcGxlIGZpcm13YXJlIGZyYW1lYnVmZmVycyBsaXN0ZWQgDQppbiB0aGUg
RFQuIFdlIGNyZWF0ZSBhbiBkZXZpY2UgZm9yIGVhY2ggYW5kIGF0dGFjaCBhIERSTSBmaXJt
d2FyZSANCmRyaXZlcjsgb2Zkcm0gaW4gdGhpcyBjYXNlLiBJIGhhdmVuJ3Qgc2VlbiB0aGlz
IGluIHRoZSB3aWxkLCBidXQgDQpub24tU3BhcmMgc3lzdGVtcyBjb3VsZCBhbHNvIGJlaGF2
ZSBsaWtlIHRoYXQuDQoNCkFuZCBpbiBhZGRpdGlvbiB0byB0aGF0LCBBUk0tYmFzZWQgc3lz
dGVtcyBvZnRlbiB1c2VzIFVFRkkgYm9vdCBzdHViIA0KY29kZSB0aGF0IHByb3ZpZGVzIGEg
c2ltcGxlIFVFRkkgZW52aXJvbm1lbnQgdG8gdGhlIGtlcm5lbC4gRm9yIGdyYXBoaWNzIA0K
d2UndmUgaGFkIGNhc2VzIHdoZXJlIHdlIHJlY2VpdmVkIHRoZSBzYW1lIGZpcm13YXJlIGZy
YW1lYnVmZmVyIGZyb20gdGhlIA0KRFQgYW5kIGZyb20gdGhlIFVFRkkgYm9vdCBzdHViLiBX
ZSBoYXZlIHRvIGRldGVjdCBhbmQgaGFuZGxlIHN1Y2ggDQpkdXBsaWNhdGlvbiBpbiB0aGUg
a2VybmVsLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBFdmVuIGZvciB0aGUg
bWFjaGluZXMgd2l0aCB0aGUgbGVnYWN5IEJJT1MsIHRoZSBmaXhlZCBWR0EgYXBlcnR1cmUg
DQo+IGFkZHJlc3MgcmFuZ2UNCj4gY2FuIG9ubHkgYmUgb3duZWQgYnkgb25lIGZpcm13YXJl
IGRyaXZlci4gSXQgaXMganVzdCB0aGF0IHdlIG5lZWQgdG8gDQo+IGhhbmRsZSB0aGUNCj4g
cm91dGluZywgdGhlIC0+c2V0X2RlY29kZSgpIGNhbGxiYWNrIG9mIHZnYV9jbGllbnRfcmVn
aXN0ZXIoKSBpcyB1c2VkIHRvIA0KPiBkbyBzdWNoDQo+IHdvcmsuIEFtIEkgY29ycmVjdD8N
Cj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5z
dHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBB
bmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4
MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------a4MEPrnaSak0MDOJHnwhylRP--

--------------ykBaykporxCxc0GQqibW6Qp3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT4J7oFAwAAAAAACgkQlh/E3EQov+D1
NhAAz+snccKaUIpfbyPULYBFWMbjaedyU2E3h8Q5+8dNBnF/92JnszZVeKioqCszd+SH72svNE7Y
YgawacdjXNZh+oykUKJvRzkTDjrmLayykiF3q+3s7ZjVUGh1EwQjF9RgghIryKCLC3okhFaiGs+Z
Mp7mFx1oPIDnNSyDOqMJdhRnlyBmRKWTqB+m3UY4D1Dy48TdZVZKafIEU5gE/4Bb8lDxhW89SBtl
gse0NzgWz+anzLLrUCq9zUJxm0ZPHdJp93URTaldQXv9hVwN5VQTLuEwnMwyW4MCgZARoYGJ1Y5/
wMKR1xD+179WQ/JE15fXZADZ/NkDcs27c1Rwm1eQkCEdj4Ok307y5Eb01h41b3tB87sTnP6Z+oih
6NvqoKtET9xG9kl/kthG4T8hyxFrPPC5soyXSNQyEfbA+T0d0M31bCgAI/nTQi1POqDVwRTbL5wc
IU65k3C+dg9Mt26hquE2v+MTyZ204Uy1DUqZvvrzi7JvCiAb+WVRifsZRXQMnxo3XNchQkS3ZW7/
1MlYC/HD2PfLHXRXaX0ySiddBSL+nbTl446toF0nHRc1kdefYIe9BwnFdceIWjVWlc6TG3V897n5
OaDkKJQZxRpTA3O0XNw3O1U7ctrz1mUIu0PX109V5NzjYFg9n+vT2vNk0sB3J8qTMxyWE4nV8Q5P
1BU=
=S4ZG
-----END PGP SIGNATURE-----

--------------ykBaykporxCxc0GQqibW6Qp3--
