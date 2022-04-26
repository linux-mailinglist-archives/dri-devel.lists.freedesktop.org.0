Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A950F2BC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330CF10E48D;
	Tue, 26 Apr 2022 07:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB1D10E48D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 07:40:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B2F0F1F74E;
 Tue, 26 Apr 2022 07:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650958799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VVs9h0AdAmN5eF9XIHmkmMmE01zWGLPyXO6MEkefwhU=;
 b=o0YSd6wffgknLwvufdCniMQX8SMsCaxoGQDgHnPs2pks7i9/hmZ0C5QEQXKd4hM1k8hJzf
 5/9oir6ZRSfCbP5dze7m/2Hw316Bm2u7Vlr0/Y/G35GEbsSAYF4CZSEP5YtW2hfKIoIgu8
 J53mV/0WfdLfV5UKEBmarjZmH8LLbgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650958799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VVs9h0AdAmN5eF9XIHmkmMmE01zWGLPyXO6MEkefwhU=;
 b=X/vaPCBALdkB/EBLZ0u5GJPQjpHHjTEQjskOkQfdbCd43crxcO3DORfGLc5mKA/yeJZ5xU
 pJpD37dpfopoq1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89AB913223;
 Tue, 26 Apr 2022 07:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r3L3H8+hZ2KGfgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 07:39:59 +0000
Message-ID: <dde9b74c-264b-9dab-2381-76aa92945ab0@suse.de>
Date: Tue, 26 Apr 2022 09:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] fbdev: Put mmap for deferred I/O into drivers
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-2-tzimmermann@suse.de> <YmbZyI0kVzLo2gR6@ravnborg.org>
 <Ymbejo2702tUUyNW@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Ymbejo2702tUUyNW@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n2xlpgdOrHPk1euDl2E63Sfo"
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
Cc: airlied@linux.ie, linux-fbdev@vger.kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n2xlpgdOrHPk1euDl2E63Sfo
Content-Type: multipart/mixed; boundary="------------kDyr0Q3hyzT1PgjR0a62rSDs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, linux-fbdev@vger.kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, javierm@redhat.com
Message-ID: <dde9b74c-264b-9dab-2381-76aa92945ab0@suse.de>
Subject: Re: [PATCH v2 1/3] fbdev: Put mmap for deferred I/O into drivers
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-2-tzimmermann@suse.de> <YmbZyI0kVzLo2gR6@ravnborg.org>
 <Ymbejo2702tUUyNW@ravnborg.org>
In-Reply-To: <Ymbejo2702tUUyNW@ravnborg.org>

--------------kDyr0Q3hyzT1PgjR0a62rSDs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDI1LjA0LjIyIHVtIDE5OjQ2IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBNb24sIEFwciAyNSwgMjAyMiBhdCAwNzoyNjozMlBN
ICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+PiBIaSBUaG9tYXMsDQo+Pg0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+Pj4gaW5kZXggNmFhZjZkMGFiZjM5
Li42OTI0ZDQ4OWEyODkgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiX2RlZmlvLmMNCj4+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJf
ZGVmaW8uYw0KPj4+IEBAIC0xODEsNiArMTgxLDcgQEAgaW50IGZiX2RlZmVycmVkX2lvX21t
YXAoc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0K
Pj4+ICAgCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gaW5mbzsNCj4+PiAgIAlyZXR1cm4gMDsN
Cj4+PiAgIH0NCj4+PiArRVhQT1JUX1NZTUJPTF9HUEwoZmJfZGVmZXJyZWRfaW9fbW1hcCk7
DQo+Pj4gICANCj4+PiAgIC8qIHdvcmtxdWV1ZSBjYWxsYmFjayAqLw0KPj4+ICAgc3RhdGlj
IHZvaWQgZmJfZGVmZXJyZWRfaW9fd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4+PiBpbmRleCA4NDQyNzQ3MDM2N2Iu
LjUyNDQwZTNmOGY2OSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJtZW0uYw0KPj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5j
DQo+Pj4gQEAgLTEzMzQsNyArMTMzNCw2IEBAIHN0YXRpYyBpbnQNCj4+PiAgIGZiX21tYXAo
c3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqIHZtYSkNCj4+PiAg
IHsNCj4+PiAgIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZpbGVfZmJfaW5mbyhmaWxlKTsN
Cj4+PiAtCWludCAoKmZiX21tYXBfZm4pKHN0cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSk7DQo+Pj4gICAJdW5zaWduZWQgbG9uZyBtbWlvX3Bnb2Zm
Ow0KPj4+ICAgCXVuc2lnbmVkIGxvbmcgc3RhcnQ7DQo+Pj4gICAJdTMyIGxlbjsNCj4+PiBA
QCAtMTM0MywxNCArMTM0Miw3IEBAIGZiX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqIHZtYSkNCj4+PiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+Pj4g
ICAJbXV0ZXhfbG9jaygmaW5mby0+bW1fbG9jayk7DQo+Pj4gICANCj4+PiAtCWZiX21tYXBf
Zm4gPSBpbmZvLT5mYm9wcy0+ZmJfbW1hcDsNCj4+PiAtDQo+Pj4gLSNpZiBJU19FTkFCTEVE
KENPTkZJR19GQl9ERUZFUlJFRF9JTykNCj4+PiAtCWlmIChpbmZvLT5mYmRlZmlvKQ0KPj4+
IC0JCWZiX21tYXBfZm4gPSBmYl9kZWZlcnJlZF9pb19tbWFwOw0KPj4+IC0jZW5kaWYNCj4+
PiAtDQo+Pj4gLQlpZiAoZmJfbW1hcF9mbikgew0KPj4+ICsJaWYgKGluZm8tPmZib3BzLT5m
Yl9tbWFwKSB7DQo+Pj4gICAJCWludCByZXM7DQo+Pj4gICANCj4+PiAgIAkJLyoNCj4+PiBA
QCAtMTM1OCwxMSArMTM1MCwxOCBAQCBmYl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiB2bWEpDQo+Pj4gICAJCSAqIFNNRSBwcm90ZWN0aW9uIGlz
IHJlbW92ZWQgYWhlYWQgb2YgdGhlIGNhbGwNCj4+PiAgIAkJICovDQo+Pj4gICAJCXZtYS0+
dm1fcGFnZV9wcm90ID0gcGdwcm90X2RlY3J5cHRlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7DQo+
Pj4gLQkJcmVzID0gZmJfbW1hcF9mbihpbmZvLCB2bWEpOw0KPj4+ICsJCXJlcyA9IGluZm8t
PmZib3BzLT5mYl9tbWFwKGluZm8sIHZtYSk7DQo+Pj4gICAJCW11dGV4X3VubG9jaygmaW5m
by0+bW1fbG9jayk7DQo+Pj4gICAJCXJldHVybiByZXM7DQo+Pj4gICAJfQ0KPj4+ICAgDQo+
Pj4gKwkvKg0KPj4+ICsJICogRkIgZGVmZXJyZWQgSS9PIHdhbnRzIHlvdSB0byBoYW5kbGUg
bW1hcCBpbiB5b3VyIGRyaXZlcnMuIEF0IGENCj4+PiArCSAqIG1pbmltdW0sIHBvaW50IHN0
cnVjdCBmYl9vcHMuZmJfbW1hcCB0byBmYl9kZWZlcnJlZF9pb19tbWFwKCkuDQo+Pj4gKwkg
Ki8NCj4+PiArCWlmIChkZXZfV0FSTl9PTkNFKGluZm8tPmRldiwgaW5mby0+ZmJkZWZpbywg
ImZiZGV2IG1tYXAgbm90IHNldCB1cCBmb3IgZGVmZXJlZCBJL08uXG4iKSkNCj4+PiArCQly
ZXR1cm4gLUVOT0RFVjsNCj4+PiArDQo+Pg0KPj4gSWYgbm90IGNvbmZpZ3VyZWQgLSB0aGVu
IHdoeSBub3QganVzdCBjYWxsIGZiX2RlZmVycmVkX2lvX21tYXAoKSwgYXMNCj4+IHRoaXMg
c2VlbXMgdG8gYmUgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24gYW55d2F5Lg0KPj4gVGhl
biBkcml2ZXJzIHRoYXQgbmVlZHMgaXQgY2FuIG92ZXJyaWRlIC0gYW5kIHRoZSByZXN0IGZh
bGxiYWNrIHRvIHRoZQ0KPj4gZGVmYXVsdC4NCj4gDQo+IEp1c3QgdG8gYmUgY2xlYXIgLSBJ
IGFscmVhZHkgcmVhZDoNCj4gIg0KPiBMZWF2ZSB0aGUgbW1hcCBoYW5kbGluZyB0byBkcml2
ZXJzIGFuZCBleHBlY3QgdGhlbSB0byBjYWxsIHRoZQ0KPiBoZWxwZXIgZm9yIGRlZmVycmVk
IEkvTyBieSB0aG1lc2VsdmVzLg0KPiAiDQo+IA0KPiBCdXQgdGhpcyBkb2VzIG5vdCBoZWxw
IG1lIHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQgdG8gZXhwbGljaXQgZG8gd2hhdA0KPiBjb3Vs
ZCBiZSBhIHNpbXBsZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uLg0KPiBDaGFuY2VzIGFyZSB0
aGF0IEkgYW0gc3R1cGlkIGFuZCBpdCBpcyBvYnZpb3VzLi4NCg0KVGhhdCdzIG5vIHN0dXBp
ZCBxdWVzdGlvbi4gSSBkaWRuJ3Qgd2FudCB0byB1c2UgYSBkZWZhdWx0IGltcGxlbWVudGF0
aW9uIA0KYmVjYXVzZSB0aGVyZSdzIG5vIHNpbmdsZSBvbmUgdGhhdCBzZXZlcnMgYWxsIHB1
cnBvc2VzLiBUaGUgY3VycmVudCBjb2RlIA0KYWxsIHVzZXMgdGhlIHNhbWUgaGVscGVyLCBi
dXQgdGhpcyB3aWxsIGNoYW5nZSB3aXRoIGxhdGVyIHBhdGNoc2V0cy4gQXQgDQpzb21lIHBv
aW50LCBHRU0gaXMgc3VwcG9zZWQgdG8gaW1wbGVtZW50IHNvbWUgb2YgdGhlIGxvZ2ljIGZv
ciBkZWZlcnJlZCANCkkvTyBhbmQgd2lsbCBoYXZlIHRvIHNldCBpdCdzIG93biBoZWxwZXJz
LiBUaGlzIGNhbiBiZSBzZWVuIGluIHBhdGNoZXMgOCANCmFuZCA5IG9mIFsxXS4gSSB0aGlu
ayBpdCdzIGJldHRlciB0byBjbGVhcmx5IGZhaWwgaGVyZSB0aGFuIHRvIHByb3ZpZGUgYSAN
CmRlZmF1bHQgaW1wbGVtZW50YXRpb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsx
XSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIyMDMwMzIwNTgzOS4y
ODQ4NC0xLXR6aW1tZXJtYW5uQHN1c2UuZGUvDQoNCg0KPiANCj4gCVNhbQ0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------kDyr0Q3hyzT1PgjR0a62rSDs--

--------------n2xlpgdOrHPk1euDl2E63Sfo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJnoc4FAwAAAAAACgkQlh/E3EQov+Df
QA/+NYDsnIvDwi5I7yRS85qW+hPNm8zEdd3ajWAyyzRDzYfzLIGWglEVWGqJSOUhuiBVq0pXijI2
VtF9JCIvcLlWW4YJLoAGHx/D0Y7w+9wUgTNSVtQxBWDC2cJF+zfNlAMIaHZ0krVWxEeZ41gN3/hK
a+RtRnEwkx/qnXaEqw6aL2///TxyR90yvZE+ki8NRqNxbPEs8WqJWyv/pANcacftBVBDJ+6Iol8C
GdWqxv9VR94lqBHZ3nBt+9pGCP5jqEZqRImOMESrDnaHzHUWDmAGrPdg1OvHlpw7Z0i4WZvrNvJv
YGGKc1mpwrah6yjaWURxzlnkU45s3ukRN+Cdzk6WkXOYg55pzSl6pgufmiA/Nrxm7U5abHb5YfJW
Boz6nOqSisMxAwqX5IhkvRj6FLDxyYjP0KeLosDIrN85XXKJPIA+piYgJ7hnz+jUtILF/0AVxBEn
/DeV8NYofjYnFT6y77ZGmRGJMNsAdmKo9ofKDcOa27r0elCpB233E0Q+k0LgwAyUwjPOiHDF5m4u
TSeGes1mgg/HB4QnZ+BT6jR4fLwc9bjzhQMKxLCvFCyvdp0GKbsvCssQmNrMGnwfbCr2gJZGH3sT
5eCWl0ATUayWfDQyoCGZwuT7efpBXdAP/m6nhxFYqOm7GjUEMiACV0YbD2H17u5loL354L8D2SKw
iL8=
=gE9D
-----END PGP SIGNATURE-----

--------------n2xlpgdOrHPk1euDl2E63Sfo--
