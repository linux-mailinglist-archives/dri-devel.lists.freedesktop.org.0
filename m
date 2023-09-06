Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8D7935D2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 09:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8BF10E581;
	Wed,  6 Sep 2023 07:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410B110E120;
 Wed,  6 Sep 2023 07:00:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC4932241E;
 Wed,  6 Sep 2023 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693983638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lxSJsWB1ylv2KntbbZas6fIVYa/2+q6JTBUTnIgymps=;
 b=Ui5sveWkzp7Z55EkFAN8YDp3EARPttCtZR7fjW/yvcSnanZNZ5FG4sUNm3rkKlf2suhuZN
 AhYCV2gxkpWPM1nZ/BGvDI599LgqjEYFUPCRbt4gHGPbL/MHrarZNgI0jMkdpfgJjvbTn4
 ABOgGxHyYmn6sXcYvy5syGW+pTLOP+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693983638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lxSJsWB1ylv2KntbbZas6fIVYa/2+q6JTBUTnIgymps=;
 b=kWmll6OMEDUMrQQssJcEER9bbQMyfF6sv8eT+LzIEa9pnVD0zhg38E5/JTNtVeTikeuPUx
 Q9RHj6b/vaYQLUDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AED1D1333E;
 Wed,  6 Sep 2023 07:00:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qwfEKZYj+GRPNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 07:00:38 +0000
Message-ID: <22e8f3a4-63e6-63bd-9e6a-c0a42cb2c33a@suse.de>
Date: Wed, 6 Sep 2023 09:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
 <42c907fe-a8c3-5a07-a792-737e45f8134e@loongson.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <42c907fe-a8c3-5a07-a792-737e45f8134e@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KYZ86D8lIziF85L0q28xAh3G"
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
--------------KYZ86D8lIziF85L0q28xAh3G
Content-Type: multipart/mixed; boundary="------------LN1ZlLEbEZdmmpEoynl00UYi";
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
Message-ID: <22e8f3a4-63e6-63bd-9e6a-c0a42cb2c33a@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
 <42c907fe-a8c3-5a07-a792-737e45f8134e@loongson.cn>
In-Reply-To: <42c907fe-a8c3-5a07-a792-737e45f8134e@loongson.cn>

--------------LN1ZlLEbEZdmmpEoynl00UYi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjMgdW0gMDQ6MTQgc2NocmllYiBzdWlqaW5nZmVuZzoNCj4gSGks
DQo+IA0KPiANCj4gT24gMjAyMy85LzUgMjM6MDUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gSG93ZXZlciwgb24gbW9kZXJuIExpbnV4IHN5c3RlbXMgdGhlIHByaW1hcnkgZGlz
cGxheSBkb2VzIG5vdCByZWFsbHkgDQo+PiBleGlzdC4NCj4gDQo+IA0KPiBObywgaXQgZG8g
ZXhpc3QuwqAgWCBzZXJ2ZXIgbmVlZCB0byBrbm93IHdoaWNoIG9uZSBpcyB0aGUgcHJpbWFy
eSBHUFUuDQo+IFRoZSAnKicgY2hhcmFjdGVyIGF0IHRoZSBvZiAoNEAwOjA6MCkgUENJIGRl
dmljZcKgaXMgdGhlIFByaW1hcnkuDQo+IFRoZSAnKicgZGVub3RlIHByaW1hcnksIHNlZSB0
aGUgbG9nIGJlbG93Lg0KPiANCj4gKElJKSB4ZnJlZTg2OiBBZGRpbmcgZHJtIGRldmljZSAo
L2Rldi9kcmkvY2FyZDIpDQo+IChJSSkgeGZyZWU4NjogQWRkaW5nIGRybSBkZXZpY2UgKC9k
ZXYvZHJpL2NhcmQwKQ0KPiAoSUkpIFBsYXRmb3JtIHByb2JlIGZvciANCj4gL3N5cy9kZXZp
Y2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxYy41LzAwMDA6MDAzOjAwLjAvMDAwMDowNDowMC4w
L2RybS9jYXJkMA0KPiAoSUkpIHhmcmVlODY6IEFkZGluZyBkcm0gZGV2aWNlICgvZGV2L2Ry
aS9jYXJkMykNCj4gKElJKSBQbGF0Zm9ybSBwcm9iZSBmb3IgDQo+IC9zeXMvZGV2aWNlcy9w
Y2kwMDAwOjAwLzAwMDA6MDA6MWMuNi8wMDAwOjAwNTowMC4wL2RybS9jYXJkMw0KPiAoLS0p
IFBDSTogKDBAMDoyOjApIDgwODY6M2U5MTo4MDg2OjNlOTEgcmV2IDAsIE1lbSBAIA0KPiAw
eGRiMDAwMDAwLzE2Nzc3NzIxNiwgMHhhMDAwMDAwMC81MzY4NzA5MTIsIEkvTyBAIDB4MDAw
MGYwMDAvNjQsIEJJT1MgQCANCj4gMHg/Pz8/Pz8/Py8xMzEwNzINCj4gKC0tKSBQQ0k6ICgx
QDA6MDowKSAxMDAyOjY3NzE6MTA0Mzo4NjM2IHJldiAwLCBNZW0gQCANCj4gMHhjMDAwMDAw
MC8yNjg4NDM1NDU2LCAweGRmMjIwMDAwLzEzMTA3MiwgSS9PIEAgMHgwMDAwZTAwMC8yNTYs
IEJJT1MgQCANCj4gMHg/Pz8/Pz8/Py8xMzEwNzINCj4gKC0tKSBQQ0k6Kig0QDA6MDowKSAx
YTAzOjIwMDA6MWEwMzoyMDAwIHJldiA0OCwgTWVtIEAgDQo+IDB4ZGUwMDAwMDAvMTY2Nzc3
MjE2LCAweGRmMDIwMDAwLzEzMTA3MiwgSS9PIEAgMHgwMDAwYzAwMC8xMjgsIEJJT1MgQCAN
Cj4gMHg/Pz8/Pz8/Py8xMzEwNzINCj4gKC0tKSBQQ0k6ICg1QDA6MDowKSAxMGRlOjEyODg6
MTc0YjpiMzI0IHJldiAxNjEsIE1lbSBAIA0KPiAweGRjMDAwMDAwLzExNjc3NzIxNiwgMHhk
MDAwMDAwMC8xMzQyMTc3MjgsIDB4ZDgwMDAwMDAvMzM1NTQ0MzIsIEkvTyBAIA0KPiAweDAw
MDBiMDAwLzEyOCwgQklPUyBAQDB4Pz8/Pz8/Pz8vNTI0Mjg4DQo+IA0KPiBUaGUgbW9kZXNl
dHRpbmcgZHJpdmVyIG9mIFggc2VydmVyIHdpbGwgY3JlYXRlIGZyYW1lYnVmZmVyIG9uIHRo
ZSANCj4gcHJpbWFyeSB2aWRlbyBhZGFwdGVyLg0KPiBJZiBhIDJEIHZpZGVvIGFkYXB0ZXIg
KGxpa2UgdGhlIGFzcGVlZCBCTUMpIGlzIG5vdCB0aGUgcHJpbWFyeSwgdGhlbiBpdCANCj4g
cHJvYmFibHkgd2lsbCBub3QNCj4gYmUgdXNlZC4gVGhlIG9ubHkgY2hhbmNlIHRvIGJlIGFi
bGUgdG8gZGlzcGxheSBzb21ldGhpbmcgaXMgdG8gDQo+IGZ1bmN0aW9uYWwgYXMgYSBvdXRw
dXQgc2xhdmUuDQo+IEJ1dCB0aGUgb3V0cHV0IHNsYXZlIHRlY2hub2xvZ3kgbmVlZCB0aGUg
UFJJTUUgc3VwcG9ydCBmb3IgY3Jvc3MgZHJpdmVyIA0KPiBidWZmZXIgc2hhcmluZy4NCj4g
DQo+IFNvLCB0aGVyZSBkbyBoYXZlIHNvbWUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBwcmlt
YXJ5IGFuZCBub24tcHJpbWFyeSANCj4gdmlkZW8gYWRhcHRlcnMuDQoNClhvcmcgaXMgYSBw
cmV0dHkgYmFkIGV4YW1wbGUsIGJlY2F1c2UgWCBwYXJzZXMgdGhlIFBDSSBidXMgYW5kIHRo
ZW4gDQp0cmllcyB0byBtYXRjaCBkZXZpY2VzIHRvIC9kZXYvZHJpLyBmaWxlcy4gVGhhdCdz
IGFsc28gbm90IGZpeGFibGUgaW4gDQpYb3JnJ3MgY3VycmVudCBjb2RlIGJhc2UuIFBsZWFz
ZSBkb24ndCBwcm9tb3RlIFhvcmcncyBkZXNpZ24uIEl0IGRhdGVzIA0KYmFjayB0byB0aGUg
dGltZSB3aGVuIFhvcmcgZGlkIHRoZSBtb2Rlc2V0dGluZyBieSBpdHNlbGYuDQoNClVzZXJz
cGFjZSBzaG91bGQganVzdCBvcGVuIGV4aXN0aW5nIGRldmljZSBmaWxlcyBhbmQgc3RhcnQg
cmVuZGVyaW5nLiANCk1heWJlIHBpY2sgdGhlIHByZXZpb3VzIHNldHRpbmdzIGFuZC9vciBk
byBzb21lIGd1ZXNzIHdvcmsgYWJvdXQgdGhlIA0KYXJyYW5nbWVudCBvZiB0aGVzZSBkZXZp
Y2VzLiBBRkFJSyB0aGF0J3Mgd2hhdCB0aGUgbW9kZXJuIGNvbXBvc2l0b3JzIGRvLg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+ICdQcmltYXJ5JyBpcyB0aGUgZGV2
aWNlIHRoYXQgaXMgYXZhaWxhYmxlIHZpYSBWR0EsIFZFU0Egb3IgRUZJLiBPdXIgDQo+PiBk
cml2ZXJzIGRvbid0IHVzZSB0aGVzZSBpbnRlcmZhY2VzLCBidXQgdGhlIG5hdGl2ZSByZWdp
c3RlcnMuIEFzIHlvdSANCj4+IHNhaWQgeW91cnNlbGYsIHRoZXNlIGZpcm13YXJlIGRldmlj
ZXMgKFZHQSwgVkVTQSwgRUZJKSBhcmUgcmVtb3ZlZCANCj4+IEFTQVAgYnkgdGhlIG5hdGl2
ZSBkcml2ZXJzLiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------LN1ZlLEbEZdmmpEoynl00UYi--

--------------KYZ86D8lIziF85L0q28xAh3G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT4I5UFAwAAAAAACgkQlh/E3EQov+As
LBAAywJbx/82a4kzBkPg9aE9JI6eCWr6ObjJU3j0lAb//Khw3fGlnKGYZJm1P/3THDHewIhOgTnv
IRUH7VGvyEHL770iX4XwWF7noE+TXVqDbButx7V6SMUF9LlcaQmG2nPeX8n/rwzh2IatlrP0bWBm
7mIAGNnqpWMS0c5tMUS9w4aznXdtuD4QyV/TEWW6/ZlTgmjbi3P7enfs81zpZ6Qvp0FJOqcYdqsv
Y1cnRpTN1UxDxZgf4nEKlss0cXFp52wOCvUr+EVkRVMftQQhLDgSMlmXLZWYjhRCJpflDU5zoJwt
tYxxJ7n7iPZPYbe+kNYGyZ8rxJ1I9Atsd3+0ytXP0DHhIrtLTMMbHLB+f2RhpDHp7QRfmKRNCfkZ
ym6AHDE2Mx70wiBhJtfunyR5IL8WBB+6BN1uqko4Q0lLYp0OOJnAjJIE+lxaHvcxi5+vqhugOXnl
Sjo516Gd35D+aMhuWX6uFiBXNXxZhl7p3FZ4HXNo8d1rwI0kcENLY6QpYLW3gmOzX+SKNKdh649E
pYbVaSSoHDbTv/BOKME7WefiychZhRFSEGiPs+pO5Sa7rFlv1zE2LAn5euwMhoTu+jXubxeoBvhG
Vt3+dB5waqKpQQHfjMNU1h3q1gI8w8k+jwefMmyqIvgUxkMdDoPei7+NuYksfqJi7oOQlahn17yC
0Bk=
=2vYu
-----END PGP SIGNATURE-----

--------------KYZ86D8lIziF85L0q28xAh3G--
