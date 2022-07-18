Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17257802C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 12:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4890914A357;
	Mon, 18 Jul 2022 10:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F6912A5C2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 10:50:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D06637278;
 Mon, 18 Jul 2022 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658141453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YdXgvQouMyelN3VhVscaj906dBlfll8MaETfemIxIAY=;
 b=KZO3vMJh4Nii51ySdg2ySmkWjm5CYGx5AnUv2n1GaRy9DCfTDR3v/vRpEDxEUYQGGHFjmo
 TGFLJD+IATRJ8MSdoL386LuiYScZg85mUTECLONT4r2m03o+FNgMFfc5ucHbo5R/KCie6E
 7c+hGtsi8mEhHGkZ6FR4AlFn81NKSmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658141453;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YdXgvQouMyelN3VhVscaj906dBlfll8MaETfemIxIAY=;
 b=JjbN4zihN33bh+EH8swGOdwyn/dZMHXE0EjnoyBKYDF77rKxEnQg0771w1PhbSPCz488mV
 msSApG+9frhugGBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1068D13754;
 Mon, 18 Jul 2022 10:50:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1OYRAw071WJaVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 10:50:53 +0000
Message-ID: <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
Date: Mon, 18 Jul 2022 12:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h0wTjUd2O7rVnfecj0mj8SYn"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h0wTjUd2O7rVnfecj0mj8SYn
Content-Type: multipart/mixed; boundary="------------t7jcmME0FFfIwJf0080kElXc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Message-ID: <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
In-Reply-To: <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>

--------------t7jcmME0FFfIwJf0080kElXc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDE4LjA3LjIyIHVtIDExOjQ2IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiA3LzE4LzIyIDA4OjU2
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTYuMDcuMjIg
dW0gMjA6MTcgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+Pj4gV2hpbGUgZGlzY3Vzc2luZyB0
aGUgd2F5IGZvcndhcmQgZm9yIHRoZSB2aWEgZHJpdmVyDQo+Pj4gSmF2aWVyIGNhbWUgdXAg
d2l0aCB0aGUgcHJvcG9zYWwgdG8gbW92ZSBhbGwgRFJJMSBkcml2ZXJzDQo+Pj4gdG8gdGhl
aXIgb3duIGZvbGRlci4NCj4+Pg0KPj4+IFRoZSBpZGVhIGlzIHRvIG1vdmUgdGhlIG9sZCBE
UkkxIGRyaXZlcnMgc28gb25lIGRvIG5vdA0KPj4+IGFjY2lkZW50YWxseSBjb25zaWRlciB0
aGVtIG1vZGVybiBkcml2ZXJzLg0KPj4+DQo+Pj4gVGhpcyBzZXQgb2YgcGF0Y2hlcyBpbXBs
ZW1lbnRzIHRoaXMgaWRlYS4NCj4+Pg0KPj4+IFRvIHByZXBhcmUgdGhlIG1vdmUsIERSSVZF
Ul9MRUdBQ1kgYW5kIENPTkZJR19EUk1fTEVHQUNZDQo+Pj4gYXJlIGJvdGggcmVuYW1lZCB0
byAqX0RSSTEuIFRoaXMgbWFrZXMgaXQgbW9yZSBvYnZpb3VzDQo+Pj4gdGhhdCB3ZSBhcmUg
ZGVhbGluZyB3aXRoIERSSTEgZHJpdmVycywgYXMgd2UgaGF2ZQ0KPj4+IGEgbG90IG9mIG90
aGVyIGxlZ2FjeSBzdXBwb3J0Lg0KPj4+DQo+Pj4gVGhlIGRyaXZlcnMgY29udGludWUgdG8g
aGF2ZSB0aGVpciBvd24gc3ViLWRpcmVjdG9yeQ0KPj4+IHNvIHRoZSBkcml2ZXIgZmlsZXMg
YXJlIG5vdCBtaXhlZCB3aXRoIHRoZSBjb3JlIGZpbGVzDQo+Pj4gd2hpY2ggYXJlIGNvcGll
ZCBpbiB0aGUgbGFzdCBjb21taXQuDQo+Pj4NCj4+PiBUaGUgRFJJMSBzcGVjaWZpYyBwYXJ0
IG9mIGRybS9LY29uZmlnIGlzIGxpa2V3aXNlIHB1bGxlZA0KPj4+IG91dCBhbmQgbG9jYXRl
ZCBpbiB0aGUgZHJpMS8gZm9sZGVyLg0KPj4+DQo+Pj4gRmVlZGJhY2sgd2VsY29tZSENCj4+
DQo+PiBUbyBiZSBob25lc3QsIEkgc3RpbGwgZG9uJ3QgbGlrZSB0aGlzIHJlbmFtZS4gRXNw
ZWNpYWxseSBpbiB0aGUgY2FzZSBvZg0KPj4gdmlhLCB3aGljaCBoYXMgYSBLTVMgZHJpdmVy
IGNvbWluZyB1cC4gSXQgd2lsbCBub3cgaGF2ZSBhbiBpbmNsdWRlDQo+PiBzdGF0ZW1lbnQg
dGhhdCBjcm9zc2VzIHNldmVyYWwgbGV2ZWxzIGluIHRoZSBkaXJlY3RvcnkgaGllcmFyY2h5
LiBBbmQNCj4gDQo+IFRoYXQgY291bGQgYmUgYXZvaWRlZCBieSBtb3ZpbmcgZHJpdmVycy9n
cHUvZHJtL3ZpYS92aWFfM2RfcmVnLmggYW5kIG90aGVyDQo+IGhlYWRlciBmaWxlcyB0byBp
bmNsdWRlL2RybS92aWFfM2RfcmVnLmggZm9yIGV4YW1wbGUuIE90aGVyIGRyaXZlcnMgKGku
ZToNCj4gaTkxNSkgZG8gdGhlIHNhbWUgZm9yIGhlYWRlcnMgdGhhdCBhcmUgc2hhcmVkIGFj
cm9zcyBkaWZmZXJlbnQgc3Vic3lzdGVtcy4NCj4gICANCj4+IHdoYXQgYWJvdXQgdGhlIG90
aGVyIERSSTEgZHJpdmVycz8gSWYgd2UgZXZlciBnZXQgS01TIGRyaXZlcnMgZm9yIHRob3Nl
LA0KPj4gZG8gd2Ugd2FudCB0byBtb3ZlIHNvbWUgaGVhZGVyIGZpbGVzIGJhY2sgaW50byB0
aGVpciBvcmlnaW5hbCBsb2NhdGlvbnM/DQo+IA0KPiBJIGJlbGlldmUgZm9yIHRoZXNlIHdl
IGNvdWxkIGFsc28gbW92ZSB0aGVtIHRvIGluY2x1ZGUvZHJtLyBpZiBuZWVkZWQuDQoNClRo
YXQgcG9sbHV0ZXMgdGhlc2Ugc2hhcmVkIGRpcmVjdG9yaWVzIGF0IHRoZSBleHBlbnNlIG9m
IGV2ZXJ5b25lIGVsc2UuIA0KSWYgYW55dGhpbmcsIHdlIHdhbnQgdG8gbW92ZSBmaWxlcyBv
dXQgb2YgdGhlIHNoYXJlZCBpbmNsdWRlIHBhdGhzLg0KDQpJdCB3b3VsZCBtYWtlIHNlbnNl
IHRvIG1lIGlmIHdlJ2QgaGF2ZSB0d28gZGlzdGluY3QgZHJpdmVycy4gQnV0IGhlcmUsIA0K
dGhlIG5ldyBhbmQgdGhlIG9sZCBkcml2ZXIgaXMgcmVhbGx5IGp1c3Qgb25lIERSTSBkcml2
ZXIgd2l0aCBiYWRseSANCm9yZ2FuaXplZCBzb3VyY2UgY29kZS4NCg0KPiAgIA0KPj4gUGF0
Y2hlcyAxIGFuZCAyIGxvb2sgcmVhc29uYWJsZSB0byBtZS4gVGhlIG90aGVyIGRyaXZlciBw
YXRjaGVzIGhhdmUNCj4+IGJhc2ljYWxseSB6ZXJvIHVwc2lkZSBJTUhPLg0KPj4NCj4gDQo+
IEkgZGlzYWdyZWUgd2l0aCB0aGUgemVybyB1cHNpZGUuIEl0IG1heSBiZSB0aGF0IHRoZSB0
cmFkZSBvZmZzIGFyZSBub3QNCj4gd29ydGggaXQgYnV0IHRoZXJlIGFyZSB1cHNpZGVzIG9m
IGhhdmluZyBhbGwgRFJJMSBkcml2ZXJzIGFuZCBjb3JlIERSSTENCj4gYml0cyBpbiB0aGUg
c2FtZSBwbGFjZS4gSXQgbWFrZXMgZ3JlcC1pbmcgYW5kIHJlYWRpbmcgZmlsZXMgZWFzaWVy
IGlmDQo+IG9uZSBkb2Vzbid0IGNhcmUgYWJvdXQgbGVnYWN5IERSSTEgZHJpdmVycy4NCg0K
VGhlIGdyZXAtYWJpbGl0eSBpcyBhIG1pbm9yIHBvaW50LiBJdCBkb2VzIGNvbWUgdXAsIGJ1
dCBpcyB1c3VhbGx5IA0Kc29ydGVkIG91dCBlYXNpbHkuDQoNCklmIHdlIHdhbnQgdG8gaW1w
cm92ZSBncmVwIG91dHB1dCwgd2Ugc2hvdWxkIGNvbnNpZGVyIGFwcGx5aW5nIFNhbSdzIA0K
dmlhX2RyaTEgY2hhbmdlcyB0byBhbGwgRFJJMSBkcml2ZXJzLiBTbyB3ZSdkIGVuZCB1cCB3
aXRoIGEgc2luZ2xlIA0KbWdhX2RyaTEuYywgdGRmeF9kcmkxLmMsIHNhdmFnZV9kcmkxLmMg
YW5kIHNvIG9uLiBJZiB0aGUgY29yZS9oZWxwZXIgDQpjb2RlIGlzIGFsc28gaW4gYSBfZHJp
MS1uYW1lZCBzb3VyY2UgZmlsZSwgZ3JlcCBydW5zIGNhbiBmaWx0ZXIgb3V0IA0KdGhvc2Ug
ZmlsZW5hbWVzLg0KDQo+IA0KPiBBbHNvLCBpdCB3b3VsZCBlYXNlIHRoZSByZW1vdmFsIG9m
IHRoaXMgaWYgd2UgZXZlciBnZXQgcmlkIG9mIHRoZW0uDQoNCldlJ3JlIG5vdCBnb2luZyB0
byByZW1vdmUgdGhlbSBhbGwgYXQgb25jZS4gQW5kIGlmIHdlJ2QgZG8sIHRoZSBhY3R1YWwg
DQp3b3JrIHdvdWxkIGJlIGluIHJlbW92aW5nIHRoZSBEUkkxIGNvZGUgZnJvbSB0aGUgRFJN
IGNvcmUuIFRoZXJlJ3MgY29kZSANCmluIHRoZSBjb3JlIHRoYXQgZG9lcyBydW50aW1lIHRl
c3RzIGZvciBEUklWRVJfTEVHQUNZIGFuZCBpcyBwYXJ0aWFsbHkgDQpzaGFyZWQgd2l0aCBL
TVMgZHJpdmVycyAobW9zdGx5IGluIFZCTEFOSyBoYW5kbGluZyBJSVJDKS4gIFJlbW92aW5n
IHRoZSANCmRyaXZlciBkaXJlY3RvcmllcyBpcyB0cml2aWFsLg0KDQo+ICAgDQo+PiBJbiB0
aGUgY2FzZSBvZiBtb3ZpbmcgdGhlIGNvcmUgZmlsZXMgaW50byBkcmkxLywgdGhlIHJlc3Vs
dGluZyBNYWtlZmlsZQ0KPj4gcnVsZSBsb29rcyByZWFsbHkgdWdseS4gSSdkIHN1Z2dlc3Qg
dG8gbW92ZSBhbGwgY29kZSBpbnRvIGEgc2VwYXJhdGUNCj4gDQo+IE1heWJlIHRoaXMgY291
bGQgYmUgc29ydGVkIGJ5IHNwbGl0dGluZyB0aGUgRFJJMSBjb3JlIGJpdHMgaW4gYSBzZXBh
cmF0ZQ0KPiBkcm1fZHJpMS5rbyBtb2R1bGU/DQoNClRoZSBkcmkxIGNvcmUgZmlsZXMgY2Fu
bm90IGJlIGluIGEgc2VwYXJhdGUgbW9kdWxlIGFzIHRoZXkgYXJlIGxpbmtlZCANCndpdGgg
b3RoZXIgY29yZSBzdHVmZi4gSXQgd291bGQgcmVzdWx0IGluIGRlcGVuZGVuY3kgY3ljbGVz
IElJUkMuDQoNCj4gDQo+PiBmaWxlIGRybV9kcmkxLmMgYW5kIGJlIGRvbmUgd2l0aCBpdC4g
IEZvciBzb21ldGhpbmcgbW9yZSBlbGFib3JhdGUsDQo+PiB0aGVyZSBjb3VsZCBieSBkcm1f
ZHJpMS5jIGFuZCBkcm1fZHJpMV9oZWxwZXIuYywgd2hlcmUgdGhlIGxhdHRlcg0KPj4gY29u
dGFpbnMgYWxsIERSSTEgY29kZSB0aGF0IGlzIG9ubHkgdXNlZCBieSB0aGUgZHJpdmVycy4N
Cj4+DQo+IA0KPiBUaGF0IHdvdWxkIGJlIGFuIGltcHJvdmVtZW50IGJ1dCBJTU8gbW92aW5n
IHRoZW0gaW50byBhIGRpZmZlcmVudCBkaXINCj4gYXMgU2FtIGRpZCB3b3VsZCBiZSBwcmVm
ZXJhYmxlLiBXaGF0IHdvdWxkIGJlIHRoZSB1cHNpZGUgb2YgaGF2aW5nIGl0DQo+IGluIGRy
aXZlcnMvZ3B1L2RybSBpbnN0ZWFkPyBKdXN0IHRvIGF2b2lkIHRoZSBNYWtlZmlsZSBydWxl
IHRvIGhhdmUgYQ0KPiBkcmkxLyBwcmVmaXggaW4gdGhlIGluY2x1ZGVkIG9iamVjdCBmaWxl
cyA/DQoNCk1ha2VmaWxlIHJlYWRhYmlsaXR5IGlzIGltcG9ydGFudCBhbmQgb3VyIGV4aXN0
aW5nIG9uZXMgY291bGQgYmUgYmV0dGVyLCANCmJ1dCB0aGF0J3MgYSBtaW5vciBwb2ludC4N
Cg0KUHV0dGluZyBldmVyeXRoaW5nIGludG8gYSBzaW5nbGUgZmlsZSBnZXRzIHRoZSBsZWdh
Y3kgY29kZSBvdXQgb2YgdGhlIA0Kd2F5LCBiZW5lZml0cyBncmVwcGluZyBhbmQgaXMgZmFz
dGVyIHRvIGJ1aWxkLiBJbiB0aGUgY2FzZSBvZiBhIA0KY29yZS9oZWxwZXIgc3BsaXQsIGl0
IHdvdWxkIGZ1cnRoZXIgYWxpZ24gd2l0aCB0aGUgb3ZlcmFsbCBkZXNpZ24gb2YgdGhlIA0K
RFJNIHN1Yi1zeXN0ZW0uDQoNCj4gDQo+IFJlZ2FyZGxlc3Mgb2YgdGhpcyBkaXNjdXNzaW9u
LCBJIHRoaW5rIHRoYXQgYXQgdGhlIHZlcnkgbGVhc3Qgd2Ugc2hvdWxkDQo+IHJlbmFtZSB0
aGUgS2NvbmZpZyBzeW1ib2xzIHRvIENPTkZJR19EUk1fRFJJMV8qIGV2ZW4gaWYgRFJJMSBk
cml2ZXJzIGFyZQ0KPiBrZXB0IGluIGRyaXZlcnMvZ3B1L2RybS8gaW5zdGVhZCBvZiBtb3Zl
ZCB0byBhIGRyaXZlcnMvZ3B1L2RybS9kcmkxLyBkaXIuDQo+IA0KDQpBZ3JlZWQuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------t7jcmME0FFfIwJf0080kElXc--

--------------h0wTjUd2O7rVnfecj0mj8SYn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLVOwwFAwAAAAAACgkQlh/E3EQov+BM
/Q/9F+MuzuD7K/KJF++P/5AeiLG2Y5bgoL/Id0myKgn3A7UKS7lw7x7re5T3/QE4AmTO6FgP7NF2
LzNVT9wU5ZC1RoApn2ouN/JfaX5VYFY0rWFZC/s5QsVqefQt1rB0zrYhhNFq6iziKHzllViuADyE
dfA+44qSijQAvvip3gpoZQVxLw57chOFZG82IJsJq+Su6kNq23HI97EszOZQiTmnbHOqx5if7FKN
y4BOifjQM8uEqktTUdFjwXSddV/UAU5hB4DgltvxH/MIvhfpKvihl6tzWFAlAy0XYtfSTxJTYc1E
KPSdrRecNiVGxsxQIUVa6UR55iKTcw/20SDh1qqFuT2N1oPCpW8iZxUTjt01BdbHt578xpbdeB4m
s7O3qoFIm3anaaduC5EUDFKxtypy4BXsh8/f6ijvLytX+s+563to14lh/r/4p6UwFnlc4DxqLD0c
R6CR/KmpYf89unpLmlCKs5lLJ0JEGqhap12jkpOsOzyuTkMJFe15dT3pXQgNVg0ci8ugAtXxtrrJ
C+mBJ8kjRl63x1+oIZeSn6DrTL3VwlChE+8/Sh8Hp9n6R2jzlcBXnQXWPksD7m5ENbWyxDyhn9Jf
QJ092hKgJM8S8mxFc1EzA0jzFCDhmkLqV4XtSKzKy3mXTVppiFJ+4jLsVjToow03ESj/Vjbx6bWr
tC4=
=f9ak
-----END PGP SIGNATURE-----

--------------h0wTjUd2O7rVnfecj0mj8SYn--
