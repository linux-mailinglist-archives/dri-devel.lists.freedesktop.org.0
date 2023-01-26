Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844D67CB02
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F49710E679;
	Thu, 26 Jan 2023 12:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238A310E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:40:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B65771FF3F;
 Thu, 26 Jan 2023 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674736836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I9YDTQXnaab3QzRwqbm85id2MH02Fcx3dyILgq2PGTI=;
 b=wz4EDsWGqLtzk4NnoN4L1mNS3NeXA8xa9+eDpUEJDE98M3ZM27jZsOAv8rUJZawLcmVc+6
 VGhqxYqf8+6WaCOeoC/Jg6ANTPzykXuzo6nZ19VEPnPVygKxVLSXrDC8mP4wGx6ysIMQz/
 2XSAQV9spa5srMzUsO6JCSRt17MRvWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674736836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I9YDTQXnaab3QzRwqbm85id2MH02Fcx3dyILgq2PGTI=;
 b=1uhkPvoOhBrbscQucGPvinku3RWx/lHZbzd0NHrjRWoCII/OnKnpYhPkjGNETvt8I7OvNp
 4rYXNMmHD3EdCqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96A2213A09;
 Thu, 26 Jan 2023 12:40:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jOXTI8R00mN2RwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jan 2023 12:40:36 +0000
Message-ID: <817fcd6b-4823-6fcd-ea5b-8068a261a3bf@suse.de>
Date: Thu, 26 Jan 2023 13:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Amdgpu module is references even after unbinding the vtcon
To: "Slivka, Danijel" <Danijel.Slivka@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------M0ZTgfsHnbkl0KnTV505KRme"
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------M0ZTgfsHnbkl0KnTV505KRme
Content-Type: multipart/mixed; boundary="------------9GQVnRM3Au5g6uTsamEWjl0X";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Slivka, Danijel" <Danijel.Slivka@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <817fcd6b-4823-6fcd-ea5b-8068a261a3bf@suse.de>
Subject: Re: Amdgpu module is references even after unbinding the vtcon
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>

--------------9GQVnRM3Au5g6uTsamEWjl0X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjMgdW0gMTA6NDkgc2NocmllYiBTbGl2a2EsIERhbmlqZWw6DQo+
IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFsXQ0KPiANCj4gSGkgVGhvbWFzLA0K
PiANCj4gSSBoYXZlIGNoZWNrZWQgd2hhdCB5b3UgbWVudGlvbmVkLg0KPiBXaGVuIGxvYWRp
bmcgYW1kZ3B1IHdlIGNhbGwgIGRybV9jbGllbnRfaW5pdCgpIGR1cmluZyBmYmRldiBzZXR1
cCBbMV0sIHRoZSByZWZjbnQgZm9yIGRybV9rbXNfaGVscGVyIGluY3JlYXNlcyBmcm9tIDMg
LT4gNC4NCj4gV2hlbiB3ZSB1bmJpbmQgdnRjb24sIHJlZmNudCBmb3IgZHJtX2ttc19oZWxw
ZXIgZHJvcHMgNCAtPiAzLCBidXQgdGhlIGRybV9jbGllbnRfcmVsZWFzZSgpIFsyXSBpcyBu
b3QgY2FsbGVkLg0KPiBUaGUgZHJtX2NsaWVudF9yZWxlYXNlKCkgaXMgY2FsbGVkIG9ubHkg
d2hlbiB1bmxvYWRpbmcgdGhlIGFtZGdwdSBkcml2ZXIuDQo+IA0KPiBJcyB0aGlzIGV4cGVj
dGVkPw0KPiANCj4gVGhlcmUgaXMgYSBjb21tZW50IGZvciBkcm1fY2xpZW50X3JlbGVhc2Ug
d2l0aCByZWdhcmRzIHRvIGZiZGV2IDoNCj4gKiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBvbmx5
IGJlIGNhbGxlZCBmcm9tIHRoZSB1bnJlZ2lzdGVyIGNhbGxiYWNrLiBBbiBleGNlcHRpb24N
Cj4gICAqIGlzIGZiZGV2IHdoaWNoIGNhbm5vdCBmcmVlIHRoZSBidWZmZXIgaWYgdXNlcnNw
YWNlIGhhcyBvcGVuIGZpbGUgZGVzY3JpcHRvcnMuDQo+IA0KPiBDb3VsZCB0aGlzIGJlIHJl
bGV2YW50IGZvciBvdXIgdXNlIGNhc2UsIGFsdGhvdWdoIGFzIEFwcGxpY2F0aW9uL1gvR0RN
IGFyZSBzdG9wcGVkIGF0IHRoYXQgcG9pbnQgYW5kIG5vIGZkIHNob3VsZCBiZSBvcGVuLg0K
DQpUaGlzIGxvb2tzIGxpa2UgdGhlIGJ1ZyB0byBtZS4NCg0KSSdtIG5vdCBzdXJlIHdoeSB0
aGUgY2xpZW50IGNvZGUgdGFrZXMgdGhlIG1vZHVsZSByZWZlcmVuY2UgaW4gdGhlIGZpcnN0
IA0KcGxhY2UuIERyaXZlcnMgaW52b2tlIGNsaWVudCBpbnRlcmZhY2UgZGlyZWN0bHkuIFNo
b3VsZG4ndCB0aGF0IGltcGx5IA0KdGhhdCB0aGV5IGhhdmUgYSBtb2R1bGUgcmVmZXJlbmNl
IGFscmVhZHk/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoYW5rIHlvdSwN
Cj4gQlIsDQo+IERhbmlqZWwNCj4gDQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
Pj4gRnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBT
ZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMjUsIDIwMjMgODo0OCBQTQ0KPj4gVG86IENocmlz
dGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPj4gQ2M6
IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFNsaXZr
YSwgRGFuaWplbA0KPj4gPERhbmlqZWwuU2xpdmthQGFtZC5jb20+OyBkcmktZGV2ZWwgPGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBTaGFybWEsDQo+PiBTaGFzaGFuayA8
U2hhc2hhbmsuU2hhcm1hQGFtZC5jb20+DQo+PiBTdWJqZWN0OiBSZTogQW1kZ3B1IG1vZHVs
ZSBpcyByZWZlcmVuY2VzIGV2ZW4gYWZ0ZXIgdW5iaW5kaW5nIHRoZSB2dGNvbg0KPj4NCj4+
IEhpIENocmlzdGlhbg0KPj4NCj4+IEFtIDI0LjAxLjIzIHVtIDE1OjEyIHNjaHJpZWIgQ2hy
aXN0aWFuIEvDtm5pZzoNCj4+PiBIaSBUaG9tYXMsDQo+Pj4NCj4+PiB3ZSByYW4gaW50byBh
IHByb2JsZW0gd2l0aCB0aGUgZ2VuZXJhbCBmYmNvbi9mYmRldiBpbXBsZW1lbnRhdGlvbiBh
bmQNCj4+PiB0aG91Z2ggdGhhdCB5b3UgbWlnaHQgaGF2ZSBzb21lIGlkZWEuDQo+Pj4NCj4+
PiBXaGF0IGhhcHBlbnMgaXMgdGhlIGZvbGxvd2luZzoNCj4+PiAxLiBXZSBsb2FkIGFtZGdw
dSBhbmQgZ2V0IG91ciBub3JtYWwgZmJjb24uDQo+Pj4gMi4gZmJjb24gYWxsb2NhdGVzIGEg
ZHVtcCBCTyBhcyBiYWNraW5nIHN0b3JlIGZvciB0aGUgY29uc29sZS4NCj4+PiAzLiBHRE0v
WC9BcHBsaWNhdGlvbnMgc3RhcnQsIG5ldyBmcmFtZWJ1ZmZlcnMgYXJlIGNyZWF0ZWQgQk9z
DQo+Pj4gaW1wb3J0ZWQsIGV4cG9ydGVkIGV0Yy4uLg0KPj4+IDQuIFNvbWVob3cgWCBvciBH
RE0gaXRlcmF0ZWQgb3ZlciBhbGwgdGhlIGZyYW1lYnVmZmVyIG9iamVjdHMgdGhlDQo+Pj4g
a2VybmVscyBrbm93cyBhYm91dCBhbmQgZXhwb3J0IHRoZW0gYXMgRE1BLWJ1Zi4NCj4+PiA1
LiBBcHBsaWNhdGlvbi9YL0dETSBhcmUgc3RvcHBlZCwgaGFuZGxlcyBjbG9zZWQsIGZyYW1l
YnVmZmVycw0KPj4+IHJlbGVhc2VkIGV0Yy4uLg0KPj4+IDYuIFdlIHVuYmluZCB2dGNvbi4N
Cj4+Pg0KPj4+IEF0IHRoaXMgcG9pbnQgdGhlIGFtZGdwdSBtb2R1bGUgdXN1YWxseSBoYXMg
YSByZWZlcmVuY2UgY291bnQgb2YgMCBhbmQNCj4+PiBjYW4gYmUgdW5sb2FkZWQsIGJ1dCBz
aW5jZSBHRE0vWC9XaG9ldmVyIGl0ZXJhdGVkIG92ZXIgYWxsIHRoZSBrbm93bg0KPj4+IGZy
YW1lYnVmZmVycyBhbmQgZXhwb3J0ZWQgdGhlbSBhcyBETUEtYnVmIChmb3Igd2hhdGV2ZXIg
cmVhc29uIGlkaykgd2UNCj4+PiBub3cgc3RpbGwgaGF2ZSBhbiBleHBvcnRlZCBETUEtYnVm
IGFuZCB3aXRoIGl0IGEgcmVmZXJlbmNlIHRvIHRoZSBtb2R1bGUuDQo+Pj4NCj4+PiBBbnkg
aWRlYSBob3cgd2UgY291bGQgcHJldmVudCB0aGF0Pw0KPj4NCj4+IEhlcmUncyBhbm90aGVy
IHN0YWIgaW4gdGhlIGRhcmsuDQo+Pg0KPj4gVGhlIGJpZyBkaWZmZXJlbmNlIGJldHdlZW4g
b2xkLXN0eWxlIGZiZGV2IGFuZCB0aGUgbmV3IG9uZSBpcyB0aGF0IHRoZSBvbGQgZmJkZXYN
Cj4+IHNldHVwIChlLmcuLCByYWRlb24pIGFsbG9jYXRlcyBhIEdFTSBvYmplY3QgYW5kIHB1
dHMgdG9nZXRoZXIgdGhlIGZiZGV2IGRhdGENCj4+IHN0cnVjdHVyZXMgZnJvbSB0aGUgQk8g
aW4gYSBmYWlybHkgaGFja2lzaCB3YXkuIFRoZSBuZXcgc3R5bGUgdXNlcyBhbiBpbi1rZXJu
ZWwNCj4+IGNsaWVudCB3aXRoIGEgZmlsZSB0byBhbGxvY2F0ZSB0aGUgQk8gdmlhIGR1bWIg
YnVmZmVyczsgYW5kIGhvbGRzIGEgcmVmZXJlbmNlIHRvIHRoZQ0KPj4gRFJNIG1vZHVsZS4N
Cj4+DQo+PiBNYXliZSB0aGUgcmVmZXJlbmNlIGNvbWVzIGZyb20gdGhlIGluLWtlcm5lbCBE
Uk0gY2xpZW50IGl0c2VsZi4gWzFdIENoZWNrIGlmIHRoZQ0KPj4gY2xpZW50IHJlc291cmNl
cyBnZXQgcmVsZWFzZWQgWzJdIHdoZW4geW91IHVuYmluZCB2dGNvbi4NCj4+DQo+PiBCZXN0
IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+IFsxXQ0KPj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dC5jI0w4Nw0KPj4gWzJdDQo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9s
YXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMjTDE2DQo+PiAwDQo+
Pg0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+IENocmlzdGlhbi4NCj4+DQo+PiAtLQ0KPj4gVGhv
bWFzIFppbW1lcm1hbm4NCj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+
PiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------9GQVnRM3Au5g6uTsamEWjl0X--

--------------M0ZTgfsHnbkl0KnTV505KRme
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPSdMIFAwAAAAAACgkQlh/E3EQov+Da
bhAAiuj2oMeXGLH3Xw7z87CXcSkizMgbgb/LyK0mTi43iprWDzuq/4BYsC1J4fS+ZWc5Tbc1vChx
JMc8LIeNe+vqW7i9gW9wPZpjqk5ZixPr/1rCA5EyOIXozwbG8IjU3c4VqKBgyG93iNpImumT1QMu
GcPqFlIbK8t+SjxCQ/Rhd8WS9P5ShjitpWFXIybUb2VR2vZsX6pFoGULeodYAUt8njpdSaCIuZ+g
TXNoTp0gf3hcd2PhyKeJPsa+vzQJEZAedq7Ai8Y0wFP5rxsKHm++AlXwK0oLmoa+yV2+KFjH2+DW
VKJkKvkhj4lr3gRBsR+5sYqZ/HAgOw8jGP34aW9TYI5u6i61PeKcTqplY4NAPD9hZ5gyF4vVqW13
cTagIfiLkPlvqybYr7wjNOGDH2SC8FOMLne1Q/HlNs2DUITf2F/Jnxcc5skPUqnqH7GdMOFjNtxE
5aOdkhUABNaXM0XjjJEaZwJIsyLajaNApNj+sklEFGxMOVZLdJ/260Ypx16sSJ4Eo968tigTDYE7
9r+fkd4JyZtuIa5lPPd8eYGPB5GgRWoKMNRMqv9r1qLco5MkwXXhn1lzRNu+XEG+8NxrDGqWyuhp
iXICGrF7yfXmXADifa/dSCrhUFtOL14kv2kkT+vniLi4aqdN+O/EFae6QPcTFb8SBNSUQZXryAx6
X9g=
=kLX5
-----END PGP SIGNATURE-----

--------------M0ZTgfsHnbkl0KnTV505KRme--
