Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E125BF86D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E73610E8C0;
	Wed, 21 Sep 2022 07:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3150910E8C0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 07:59:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A13621B4D;
 Wed, 21 Sep 2022 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663747151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cAotv4jgnxAawqFT6vGdataSuMyOZMjgDhksN1Mn76k=;
 b=0GBJ3HWJsf2zB0fq0v1XHdzxCGHtrmEqzNYtJfH4hriDFYGN6aIU0g/+5iY4t3pqd68VYI
 iA2nn2tJ5Km1UpRBmWA4dcjYA5TMCfX1ID9odws3nxc265eMNq75+O/w6aqaNv/5Ib/omA
 4v2kl87wntitExriW8a1NbeK42B/IL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663747151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cAotv4jgnxAawqFT6vGdataSuMyOZMjgDhksN1Mn76k=;
 b=WLl/5X0nM5mtLyak2NrDP2ASwmd8NCDKx/GDnFTuEmzFoW5a9XJl+mKyMFiXyZOMhoaQrG
 fWLOA9QRpXUmLzDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BA2513A00;
 Wed, 21 Sep 2022 07:59:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HCs+GU/EKmO+GwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Sep 2022 07:59:11 +0000
Message-ID: <92ae6ffe-9fdd-35bb-48d0-a7cfe221282a@suse.de>
Date: Wed, 21 Sep 2022 09:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YynOvpMGbVKWiO8p@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y6C91TO71D28YUdkIo0BGCdy"
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y6C91TO71D28YUdkIo0BGCdy
Content-Type: multipart/mixed; boundary="------------t8xkh2vCWNpklUR0RORoZBGJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robdclark@gmail.com, drawat.floss@gmail.com,
 dri-devel@lists.freedesktop.org
Message-ID: <92ae6ffe-9fdd-35bb-48d0-a7cfe221282a@suse.de>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
In-Reply-To: <YynOvpMGbVKWiO8p@intel.com>

--------------t8xkh2vCWNpklUR0RORoZBGJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVmlsbGUNCg0KQW0gMjAuMDkuMjIgdW0gMTY6MzEgc2NocmllYiBWaWxsZSBTeXJqw6Rs
w6Q6DQo+IE9uIFR1ZSwgU2VwIDIwLCAyMDIyIGF0IDAzOjU2OjE4UE0gKzAyMDAsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gU2V0IHBhcnRpYWwgdXBkYXRlcyBvbiBhIHBsYW5l
IGlmIHRoZSBmcmFtZWJ1ZmZlciBoYXMgbm90IGJlZW4gY2hhbmdlZA0KPj4gb24gYW4gYXRv
bWljIGNvbW1pdC4gSWYgc3VjaCBhIHBsYW5lIGhhcyBkYW1hZ2UgY2xpcHMsIHRoZSBkcml2
ZXIgd2lsbA0KPj4gdXNlIHRoZW07IG90aGVyd2lzZSB0aGUgdXBkYXRlIGlzIGVmZmVjdGl2
ZWx5IGVtcHR5LiBQbGFuZXMgdGhhdCBjaGFuZ2UNCj4+IHRoZWlyIGZyYW1lYnVmZmVyIHN0
aWxsIHBlcmZvcm0gYSBmdWxsIHVwZGF0ZS4NCj4gDQo+IEkgaGF2ZSBhIGZlZWxpbmcgeW91
J3JlIHNvcnQgb2YgcGFwZXJpbmcgb3ZlciBzb21lIGluZWZmaWNpZW50DQo+IHVzZXJzcGFj
ZSB0aGF0J3MgYXNraW5nIHVwZGF0ZXMgb24gcGxhbmVzIHRoYXQgZG9uJ3QgYWN0dWFsbHkN
Cj4gbmVlZCB0aGVtLiBJJ20gbm90IHN1cmUgYWRkaW5nIG1vcmUgY29kZSBmb3IgdGhhdCBp
cyBhIHBhcnRpY3VsYXJseQ0KPiBncmVhdCBpZGVhLiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIg
dG8ganVzdCBmaXggdGhlIHVzZXJzcGFjZSBjb2RlPw0KDQpTb21lIG1vcmUgY29udGV4dCBt
aWdodCBiZSBpbiBvcmRlcjoNCg0KVGhlIGFzdCBkcml2ZXIgY3VycmVudGx5IHVzZXMgVlJB
TSBoZWxwZXJzLCB3aGljaCBsZWFkcyB0byBtYW55IA0KcHJvYmxlbXM7IGluY2x1ZGluZyBi
bGFuayBzY3JlZW5zIGZyb20gdGhlIGxvdyBhbW91bnQgb2YgdmlkZW8gbWVtb3J5LiANClRo
ZSBiZXN0IHNvbHV0aW9uIGlzIHRvIHN3aXRjaCBTSE1FTSB3aXRoIEJPcyBvbiBzeXN0ZW0g
bWVvcnkuIFRoZSB2aWRlbyANCm1lbW9yeSBpcyBvbmx5IHRoZSBpbnRlcm5hbCBidWZmZXIg
Zm9yIHNjYW5vdXQuIFRoaXMgdXBkYXRlIGludm9sdmVzIGEgDQptZW1wY3kgZnJvbSB0aGUg
Qk8gdG8gdmlkZW8gbWVtb3J5Lg0KDQpBc3QncyBoYXJkd2FyZSBpcyByZWFsbHkgc2xvdywg
c28gaXQgbWFrZXMgc2Vuc2UgdG8gcmVkdWNlIHRoZSB1cGRhdGVzIA0KdG8gdmlkZW8gbWVt
b3J5IHRvIGEgbWluaW11bS4gVGhlcmUncyBzdXBwb3J0IGZvciBjdXJzb3IgcGxhbmVzLCB3
aGljaCANCnJlYWxseSBtYWtlcyBhIGRpZmZlcmVuY2UgaGVyZS4NCg0KQnV0IGRvaW5nIGFu
eSBjdXJzb3ItcGxhbmUgdXBkYXRlIChlLmcuLCBtb3ZpbmcsIGFuaW1hdGlvbikgd2l0aCBT
SE1FTSANCmFuZCB0aGUgY3VycmVudCBkYW1hZ2UgaGVscGVycyBhbHdheXMgcmVzdWx0cyBp
biBhIGZ1bGwtc2NyZWVuIG1lbWNweSANCmZyb20gdGhlIEJPIHRvIHRoZSB2aWRlbyBtZW1v
cnkgZm9yIHRoZSBwcmltYXJ5IHBsYW5lLiBBcyB0aGUgYXN0IA0KaGFyZHdhcmUgaXMgc2xv
dywgcGVyZm9ybWFuY2UgZ29lcyBkb3duIHRvIGEgYW4gZXN0aW1hdGVkIDUgZnJhbWUgcGVy
IA0Kc2Vjb25kcy4gQWZ0ZXIgbW92aW5nIHRoZSBtb3VzZSwgb25lIGNhbiB3YXRjaCB0aGUg
bW91c2UgY3Vyc29yIGZvbGxvdyANCmFsb25nIHRoZSBzY3JlZW4gZm9yIHRoZSBuZXh0IHNl
Y29uZHMuIFVzZXJzcGFjZSBzZW5kcyB0aGUgbW92ZW1lbnQgDQppbmZvcm1hdGlvbiBhbmQg
RFJNIHNsb3dseSBwcm9jZXNzZXMgdGhlbS4gVGhlIHNhbWUgY2FuIGJlIG9ic2VydmVkIGZv
ciANCmN1cnNvciBhbmltYXRpb24uDQoNClRoZSBwcm9ibGVtIGlzIHRoYXQgZWFjaCBjaGFu
Z2UgdG8gdGhlIGN1cnNvciBwbGFuZSByZXN1bHRzIGluIGFuIA0KYXRvbWljX3VwZGF0ZSBj
YWxsIGZvciB0aGUgcHJpbWFyeSBwbGFuZS4gTm90IGhhdmluZyBkYW1hZ2UgaW5mb3JtYXRp
b24gDQpmb3IgdGhlIHBsYW5lIGp1c3QgbWVhbnMgJ3VwZGF0ZSBldmVyeXRoaW5nJy4gTm90
IGEgcHJvYmxlbSBpZiByZWRyYXdpbmcgDQpjb25zaXN0cyBvZiByZXByb2dyYW1taW5nIHRo
ZSBzY2Fub3V0IGFkZHJlc3MuIEZvciBhIG1lbWNweSBpdCdzIG5vdCANCmZlYXNpYmxlLg0K
DQpTbyBjYW4gdGhpcyBiZSBmaXhlZCBpbiB1c2Vyc3BhY2U/IE5vIHJlYWxpc3RpY2FsbHkg
SU1ITy4gSSd2ZSBzZWVuIHRoaXMgDQpwcm9ibGVtIG9uIFdlc3RvbiwgV2F5bGFuZC1Hbm9t
ZSBhbmQgWDExLUdub21lLiBBbmQgdGhleSBhcmUgYWxsIA0KcHJvYmxlbWF0aWMgaW4gdGhl
aXIgb3duIHdheS4gKFRoYXQncyB3aHkgdGhlcmUgYXJlIG11bHRpcGxlIHBhdGNoZXMgDQpu
ZWVkZWQuKSBGb3IgZXhhbXBsZSwgWDExIHVzZXMgdGhlIGxlZ2FjeSBtb3VzZSBpb2N0bCwg
d2hpY2ggb25lIG9mIHRoZSANCnBhdGNoZXMgZml4ZXMuIFRoZSBvdGhlciB1c2Vyc3BhY2Ug
bmVlZHMgdGhlIG90aGVyIGhldXJpc3RpY3MuIEEgDQpwb3RlbnRpYWwgdXNlcnNwYWNlIGZp
eCB3b3VsZCBtZWFuIHRvIGFsd2F5cyBzZXQgZW1wdHktZGFtYWdlIA0KaW5mb3JtYXRpb24g
b24gYWxsIHBsYW5lcyB0aGF0IGRvbid0IGdldCBhbiB1cGRhdGUuIEFuZCBJIGRvbid0IGNv
bnNpZGVyIA0KWDExIGZpeGFibGUgVEJILg0KDQo+IA0KPiBBbnkgcHJvcGVydHkgY2hhbmdl
IG9uIHRoZSBwbGFuZSBjb3VsZCBuZWVkIGEgZnVsbCBwbGFuZQ0KPiB1cGRhdGUgYXMgd2Vs
bCAoZWcuIHNvbWUgY29sb3IgbWFuZ2VtZW50IHN0dWZmIGV0Yy4pLiBTbyB5b3UnZA0KPiBo
YXZlIHRvIGtlZXAgYWRkaW5nIGV4Y2VwdGlvbnMgdG8gdGhhdCBsaXN0IHdoZW5ldmVyIG5l
dw0KPiBwcm9wZXJ0aWVzIGFyZSBhZGRlZC4NCg0KSXQncyBub3QgYWJvdXQgdGhlIG9jY2Fz
aW9uYWwgY2hhbmdlIG9mIGEgcHJvcGVydHkuIEl0J3MgdGhlIGNvbnN0YW50IA0Kc2x1Z2dp
c2ggcmVkcmF3IHdoZW4gdGhlIGludGVyZmFjZSBpcyBzdXBwb3NlZCB0byBiZSBzbmFwcHks
IHN1Y2ggYXMgDQptb3VzZSBpbnRlcmFjdGlvbi4NCg0KPiANCj4gQW5kIEkgdGhpbmsgdGhl
IHNlbWFudGljcyBvZiB0aGUgaW9jdGwocykgaGFzIHNvIGZhciBiZWVuIHRoYXQNCj4gYmFz
aWNhbGx5IGFueSBwYWdlIGZsaXAgKHdoZXRoZXIgb3Igbm90IGl0IGFjdHVhbGx5IGNoYW5n
ZXMNCj4gdGhlIGZiKSBzdGlsbCBlbmRzIHVwIGRvaW5nIHdoYXRldmVyIGZsdXNoaW5nIGlz
IG5lZWRlZCB0bw0KPiBndWFyYW50ZWUgdGhlIGZiIGNvbnRlbnRzIGFyZSB1cCB0byBkYXRl
IG9uIHRoZSBzY3JlZW4gKGlmDQo+IHNvbWVvbmUgc25lYWtlZCBpbiBzb21lIGZyb250IGJ1
ZmZlciByZW5kZXJpbmcgaW4gYmV0d2VlbikuDQo+IEllLiB5b3UgY291bGQgZXZlbiB1c2Ug
YmFzaWNhbGx5IGEgbm9wIHBhZ2UgZmxpcCBpbiBwbGFjZQ0KPiBvZiBkaXJ0eWZiLg0KDQpU
aGF0J3Mgd2h5IGZ1bGwgdXBkYXRlcyBhcmUgc3RpbGwgdGhlIGRlZmF1bHQuIE9ubHkgaW4g
Y2FzZXMgd2hlcmUgaXQncyANCnNhdmUgdG8gYXZvaWQgYW4gdXBkYXRlIG9mIHVuYWZmZWN0
ZWQgcGxhbmVzLCB3ZSBkbyBzby4NCg0KSSBrbm93IHRoYXQgd2UgZG9uJ3QgZ2l2ZSBwZXJm
b3JtYW5jZSBndWFyYW50ZWVzIHRvIHVzZXJzcGFjZS4gQnV0IHVzaW5nIA0KY3Vyc29yL292
ZXJsYXkgcGxhbmVzIHNob3VsZCBiZSBmYXN0ZXIgdGhlbiBub3QgdXNpbmcgdGhlbS4gSSB0
aGluayANCnRoYXQncyBhIHJlYXNvbmFibGUgYXNzdW1wdGlvbiBmb3IgdXNlcnNwYWNlIHRv
IG1ha2UuDQoNCj4gDQo+IEFub3RoZXIgdGhpbmcgdGhlIGlvY3RscyBoYXZlIGFsd2F5cyBk
b25lIGlzIGFjdHVhbGx5IHBlcmZvcm0NCj4gdGhlIGNvbW1pdCB3aGV0aGVyIGFueXRoaW5n
IGNoYW5nZWQgb3Igbm9yLiBUaGF0IGlzLCB0aGV5DQo+IHN0aWxsIGRvIGFsbCB0aGUgc2Ft
ZSB0aGUgc2FtZSB2Ymxhbmt5IHN0dWZmIGFuZCB0aGUgY29tbWl0DQo+IHRha2VzIHRoZSBz
YW1lIGFtb3VudCBvZiB0aW1lLiBOb3Qgc3VyZSBpZiB5b3VyIGlkZWEgaXMNCj4gdG8gcG90
ZW50aWFsbHkgc2hvcnQgY2lyY3VpdCB0aGUgZW50aXJlIHRoaW5nIGFuZCBtYWtlIGl0DQo+
IHRha2Ugbm8gdGltZSBhdCBhbGw/DQoNClRoZSBwYXRjaGVzIGRvbid0IGNoYW5nZSB0aGUg
b3ZlcmFsbCBjb21taXQgbG9naWNzLiBBbGwgdGhleSBkbyBpcyB0byANCnNldCBkYW1hZ2Ug
dXBkYXRlcyB0byBhIHNpemUgb2YgMCBpZiBhIHBsYW5lIHJlbGlhYmx5IGRvZXMgbm90IG5l
ZWQgYW4gDQp1cGRhdGUuIEEgZHJpdmVyJ3MgYXRvbWljX3VwZGF0ZSBzdGlsbCBydW5zLCBi
dXQgdGhlIGRhbWFnZSBpdGVyYXRvciANCmRvZXMgbm90IHJldHVybiBhbnkgZGFtYWdlZCBh
cmVhcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+IA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------t8xkh2vCWNpklUR0RORoZBGJ--

--------------y6C91TO71D28YUdkIo0BGCdy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMqxE4FAwAAAAAACgkQlh/E3EQov+Bt
2BAAomR6GjeBnVPX25JZ8wMb6VR/hPa8uZc8Xq0x16xCNkgpWfOsZ9/B4gcXsfsi8Jcmznb9QrUJ
IjOhA8nnKi348HhZRrr1jpTSEGtTPAC0WI+4pSXI/pN0VxGT20a3qgm0MytbahKp1L+ZtnXiLIZw
VbzHU1H/bIEWLCXTi4gF+KDEZgZjAsQ5BoqPObyfDnsKy52mffecivRoc+3dClv2HlaBOKZfQtc1
0pXcCYbV8lKCr/7yUae1pjk8R45NEc4O5Snz3RMQMSXf+XJdFCvwrOdQ0CKUMZ+y0SS8A47xoxtD
Dn9w6GBO5xAP0s2AztXNP+SPPJ0uVAyY2lCXc0F+DI657qHx+gc3RIMD6+Epj4P+8NnhupU+Pwv8
ttsm0DtSDBSdKu/EtjPP4hc/szmWHyzHlSoaanywecWH+7vY/H85rCcM4oxkuB9IhPOu1Q5ClU8y
e3D3G1vMWGleXfO5uvH7YZvmIEHC001fzV4n6OnfDlFsU0MZrMn4iB9UoRIYS5wdmnvcV8hoGqzg
S/Wx5IOe6WtrNJ5JmuY7YMUqua9NgWRBNODqve1Pi2OhMvjBsg1fW9KoSuU0B7XfMScPbU8AMlrm
iuHhO3n1uXPqNG/faktbfVYf9RjqXOy1d3ELv3SdsFA6rpLmh5tEbYzHiu8bGlsbSli90Gh/NVvD
mQE=
=6sfb
-----END PGP SIGNATURE-----

--------------y6C91TO71D28YUdkIo0BGCdy--
