Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152F79368E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 09:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A56010E58F;
	Wed,  6 Sep 2023 07:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653A510E58F;
 Wed,  6 Sep 2023 07:46:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F28B20290;
 Wed,  6 Sep 2023 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693986376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YrlVru9YytJDJNqU9ANXC1SxJchB9vhx/68AaAWvjag=;
 b=gPMImeOreNzwuC4Dcm+PAiYhug3qsmJp9aHwmjd1unfInYETrTFS7xvRonUT/rWngdARpo
 XWcBa6HKV1EqB9Byx1EfEugl29z4lcDCbTZxTn7+82EKqJN3npv1Hmy0mrwgiD/kL2IXfx
 m43zWQE6myeT0khUzYt5t+68/iplQ0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693986376;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YrlVru9YytJDJNqU9ANXC1SxJchB9vhx/68AaAWvjag=;
 b=iAM/Btix/OemU/FWEYuneYGX1YwCmGKSpQehkGwDexKj7VRHv5FMgGkMU4ao51ykWB5sbN
 KOZWLJtSZlMarFCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CEDFD1346C;
 Wed,  6 Sep 2023 07:46:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4BGNMUcu+GTNTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 07:46:15 +0000
Message-ID: <105930fc-28f7-48ad-541c-ee7c9e6e3ec0@suse.de>
Date: Wed, 6 Sep 2023 09:46:15 +0200
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
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
 <abf8053d-4c4a-2562-b57f-db92a0cb15a7@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <abf8053d-4c4a-2562-b57f-db92a0cb15a7@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ttb8af7YKsIybqBTIsgm2T9Y"
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
--------------ttb8af7YKsIybqBTIsgm2T9Y
Content-Type: multipart/mixed; boundary="------------8OMHe6A08McvmuQ3bGI0R4JE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Message-ID: <105930fc-28f7-48ad-541c-ee7c9e6e3ec0@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
 <abf8053d-4c4a-2562-b57f-db92a0cb15a7@loongson.cn>
In-Reply-To: <abf8053d-4c4a-2562-b57f-db92a0cb15a7@loongson.cn>

--------------8OMHe6A08McvmuQ3bGI0R4JE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjMgdW0gMDU6MDggc2NocmllYiBzdWlqaW5nZmVuZzoNCj4gSGks
DQo+IA0KPiANCj4gT24gMjAyMy85LzUgMjM6MDUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gSG93ZXZlciwgb24gbW9kZXJuIExpbnV4IHN5c3RlbXMgdGhlIHByaW1hcnkgZGlz
cGxheSBkb2VzIG5vdCByZWFsbHkgDQo+PiBleGlzdC4gJ1ByaW1hcnknIGlzIHRoZSBkZXZp
Y2UgdGhhdCBpcyBhdmFpbGFibGUgdmlhIFZHQSwgVkVTQSBvciBFRkkuIA0KPiANCj4gSSBt
YXkgbWlzcyB0aGUgcG9pbnQsIHdoYXQgZG8geW91IG1lYW5zIGJ5IGNob29zZSB0aGUgd29y
ZCAibW9kZXJuIj8NCj4gQXJlIHlvdSB0cnlpbmcgdG8gdGVsbCBtZSB0aGF0IFggc2VydmVy
IGlzIHRvbyBvbGQgYW5kIFdheWxhbmQgaXMgdGhlIA0KPiBtb2Rlcm4gZGlzcGxheSBzZXJ2
ZXI/DQoNCkl0IGNvbWVzIGRvd24gdG8gdGhhdC4gWG9yZydzIGRldmljZSBoYW5kbGluZyBp
cyBvdXQgb2YgZGF0ZS4gRml4aW5nIGl0IA0Kd291bGQgcmVxdWlyZSBhIHJlZGVzaWduIG9m
IHRoZSB3aG9sZSBwcm9ncmFtLiBBICdtb2Rlcm4nIGNvbXBvc2l0b3IgDQpkZWxlZ2F0ZXMg
ZGV2aWNlIGhhbmRsaW5nIHRvIHRoZSBrZXJuZWwuIEFsbCBpdCBkb2VzIGlzIHRvIG9wZW4g
dGhlIA0KZGV2aWNlIGZpbGVzIGFuZCB1c2UgdGhlIHByb3ZpZGVkIGZ1bmN0aW9uYWxpdHku
IEkndmUgYnJpZWZseSBtZW50aW9uZWQgDQp0aGlzIGluIHRoZSBvdGhlciBlbWFpbC4NCg0K
VGhlcmUncyBtb3JlIHRvICdtb2Rlcm4nLCBzdWNoIGFzICd1c2VzIFdheWxhbmQgZm9yIGNv
bXBvc2l0aW5nJywgJ01lc2EgDQpmb3IgZGlyZWN0IHJlbmRlcmluZycgb3IgJ2RvZXMgYXRv
bWljIG1vZGVzZXR0aW5nJy4gQnV0IHRoYXQncyBhbGwgDQp1bnJlbGF0ZWQgaGVyZS4NCg0K
PiANCj4gDQo+PiBPdXIgZHJpdmVycyBkb24ndCB1c2UgdGhlc2UgaW50ZXJmYWNlcywgYnV0
IHRoZSBuYXRpdmUgcmVnaXN0ZXJzLg0KPiANCj4gDQo+IFllcyBhbmQgbm8/DQo+IA0KPiBZ
ZXMgZm9yIHRoZSBtYWNoaW5lIHdpdGggdGhlIFVFRkkgZmlybXdhcmUsDQo+IGJ1dCBJIG5v
dCBzdXJlIGlmIHRoaXMgc3RhdGVtZW50IGlzIHRydWUgZm9yIHRoZSBtYWNoaW5lIHdpdGgg
dGhlwqBsZWdhY3kgDQo+IGZpcm13YXJlLg0KDQpXaGF0IEkgbWVhbiBpczogdGhlIHByaW1h
cnkgZGV2aWNlIGlzIHRoZSBvbmUgdGhhdCBvd25zIHRoZSBWR0EvVkVTQS9FRkkgDQpJL08g
c3BhY2UuIEJ1dCBEUk0gZHJpdmVycyBkb24ndCBwcm9ncmFtIGJ5IFZHQSByZWdpc3RlcnMg
b3IgVkVTQS9FRkkgDQpjYWxscy4gVGhleSB1c2UgdGhlIGhhcmR3YXJlJ3MgYWN0dWFsIG5h
dGl2ZSByZWdpc3RlcnMgaW4gdGhlIGVhY2ggDQpkZXZpY2UncyBJL08gc3BhY2UuIFNvIGVh
Y2ggZGV2aWNlIG9wZXJhdGVzIG9uIGl0J3Mgb3duLiBUaGV5ICh1c3VhbGx5KSANCmRvbid0
IGhhdmUgdG8gc2hhcmUvYXJiaXRyYXRlIGFjY2VzcyB0byB0aGUgVkdBIHJlZ2lzdGVycy4N
Cg0KSGVuY2UgdGhlIGlkZWEgb2YgYSBwcmltYXJ5IGRldmljZSBkb2VzIG5vdCBtYWtlIHNl
bnNlIGhlcmUuIEl0J3MgdXNlZnVsIA0KdG8gcGljayBhbiBpbml0aWFsIGRlZmF1bHQsIGJ1
dCBmdXJ0aGVyIGRpc3BsYXkgc2V0dXAgc2hvdWxkIHJhdGhlciBiZSANCmxlZnQgdG8gdXNl
cnNwYWNlLg0KDQo+IA0KPiBBcyB0aGUgZGlzcGxheSBjb250cm9sbGVyIGluIHRoZSBBU3Bl
ZWQgQk1DIGlzIFZHQSBjb21wYXRpYmxlLg0KPiBUaGVyZWZvcmUsIGluIHRoZW9yeSwgaXQg
c2hvdWxkIHdvcmtzIHdpdGggdGhlIFZHQSBjb25zb2xlIG9uIHRoZSBtYWNoaW5lDQo+IHdp
dGggYW5vdGhlciBWR0EgY29tcGF0aWJsZSB2aWRlbyBjYXJkLiBTbyB0aGUgYXN0X3ZnYV9z
ZXRfZGVjb2RlKCkgDQo+IGZ1bmN0aW9uDQo+IHByb3ZpZGVkIGluIHRoZSAwMDA3IHBhdGNo
IHByb2JhYmx5IHVzZWZ1bCBvbiBsZWdhY3kgZmlybXdhcmUgZW52aXJvbm1lbnQuDQo+IA0K
PiBUbyBiZSBob25lc3QsIEkgaGF2ZSB0ZXN0ZWQgdGhpcyBvbiB2YXJpb3VzIG1hY2hpbmUg
d2l0aCBVRUZJIGZpcm13YXJlLg0KPiBCdXQgSSBkaWRuJ3QgcmVhbGl6ZWQgdGhhdCBJIHNo
b3VsZCBkbyB0aGUgdGVzdGluZyBvbiBsZWdhY3kgZmlybXdhcmUgDQo+IGVudmlyb25tZW50
DQo+IGJlZm9yZSBzZW5kaW5nIHRoaXMgcGF0Y2guIEl0IHNlZW1zIHRoYXQgdGhlIHRlc3Rp
bmcgZWZmb3J0IG5lZWRlZCBhcmUgDQo+IHF1aXRlDQo+IGV4aGF1c3RpbmcsIHNpbmNlIGFs
bCBteSBtYWNoaW5lcyBjb21lIHdpdGggdGhlIFVFRkkgZmlybXdhcmUuDQo+IA0KPiBTbyBp
cyBpdCBPSyB0byBsZWF2ZSB0aGUgbGVnYWN5IHBhcnQgdG8gc29tZW9uZSBlbHNlIHdobyBp
bnRlcmVzdGVkIGluIGl0Pw0KPiBQcm9iYWJseSBBbGV4IGlzIG1vcmUgcHJvZmVzc2lvbmFs
IGF0IGxlZ2FjeSBWR0Egcm91dGluZyBzdHVmZj8NCg0KTWF5YmUgeW91IGNhbiBkZXNjcmli
ZSB0aGUgdXNlcidzIHByb2JsZW0gdG8gdXMuIFRCSCBJIHN0aWxsIGRvbid0IA0KdW5kZXJz
dGFuZCB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gc29sdmUuIElmIHlvdSB3aGF0IHRvIHNldCB0
aGUgY29uc29sZSdzIA0KaW5pdGlhbCBvdXRwdXQgZGV2aWNlLCB5b3UgY2FuIG1ha2UgYSBw
YXJhbWV0ZXIgaW4gdmdhYXJiLiBCdXQgSSBhbHNvIA0KZG9uJ3QgcmVhbGx5IHNlZSBhIG5l
ZWQgZm9yIHRoYXQgZWl0aGVyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IDotKQ0K
PiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0
cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFu
ZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgw
OSAoQUcgTnVlcm5iZXJnKQ0K

--------------8OMHe6A08McvmuQ3bGI0R4JE--

--------------ttb8af7YKsIybqBTIsgm2T9Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT4LkcFAwAAAAAACgkQlh/E3EQov+A3
MRAAwXQMlQVeD3Q2rDRhMhOrVw7ULqn4/9DpxiYr5ImQxdgGGYP/pwFkXCOrAjXHqAGJyaQNc7o0
QuibhCV/62uSXUDjyQ7F9xOQHU3TReS661yEwBuKP1AX3uC0WSBnm3MvwphfMnYI/6z8lBWBIEok
jVFfdXfweTZE11Tj9wqgsPUBten6c0vLeOviIuXXWhszjpNviOoUA8WaVOza+N9/pskz1HVmFiCU
YFjRRMZ5Thi5InVI9PkC9zNXVIbiJLh3J4jfHPeFMBWqKih6dzD+OoAeH65I5akyFdf6X1zMZ12C
rogwp07ErTyvN3OKuBJIZCW1IqYyEb12X7VjvHzDkdX9vvI9uE4obj8gD8P1zs13yfqXJYb7ixZb
2LQKzn86k6f/R5Z+O7CSzq6uz9oBKwcOa0/F3aabx5G6e1xRvAEH5Zzqvmq+cMcsZuB2vOY3UdYi
+GmGmudDoNCILsTvbUXaAu9/7xk6tfulduqfXTBddhKVsRdgwQ73yTABkk42j1yfx1c5v7bGw0jx
Hg7rMrpIU42CA32CrDbNEIaHpphPELOt/57elRblbtGa1aU++AMjFaw2HHii9WpYCNqgVe+BdC85
fbhZcwbNjtyaj5HazcxWldu35ntAZgs4dtn1AN+HvFDFs23IzB4hkUjLzvwEijoUA2W/4mSci0np
x9A=
=HF4h
-----END PGP SIGNATURE-----

--------------ttb8af7YKsIybqBTIsgm2T9Y--
