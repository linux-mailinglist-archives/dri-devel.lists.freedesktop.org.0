Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B734B2132
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A3210EA2C;
	Fri, 11 Feb 2022 09:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E1010EA2C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 09:12:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3BF31F38B;
 Fri, 11 Feb 2022 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644570730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I/lrZ1dE8HLIcpOlRKZDQQEyb9+lLwl0dgVPEJAtCJo=;
 b=KAttggnGUUjG/W/ncd4JbgGfG1e6K6qtBU0Hf5dnK7yfQn0MbRYrkKWnd1mEV1oIvmmVV2
 vrqHZmTNgJK2FDTcOwl/0qAD/JFzUGOzc0Mmg4jK5JcPiTVqGYrejzKpoR+bESYln7Hhlz
 /YGg+g0IKOgeD7GQCWlxox1+JinD6Vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644570730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I/lrZ1dE8HLIcpOlRKZDQQEyb9+lLwl0dgVPEJAtCJo=;
 b=0OOKnoTiB4Z1v69pSTeAhZwraRzoBYsRRhB/jfRADoiDM0cnsOJnZYLTQhZjtmteJtfq/O
 uafrecUvU3/VBBBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A32FF13BC3;
 Fri, 11 Feb 2022 09:12:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 02voJmooBmKYDAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 09:12:10 +0000
Message-ID: <4d389248-1d2a-4289-64ea-65a7f04627fc@suse.de>
Date: Fri, 11 Feb 2022 10:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] fbdev/defio: Early-out if page is already enlisted
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-2-tzimmermann@suse.de> <YgV87ejpzGkSMNop@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YgV87ejpzGkSMNop@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sVKYxkkOdy9c2jXrIRabYWEo"
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev,
 bernie@plugable.com, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 noralf@tronnes.org, andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sVKYxkkOdy9c2jXrIRabYWEo
Content-Type: multipart/mixed; boundary="------------n7GSgPNcuvE8U0uX2tjJ8i6W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, bernie@plugable.com, noralf@tronnes.org,
 andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Message-ID: <4d389248-1d2a-4289-64ea-65a7f04627fc@suse.de>
Subject: Re: [PATCH 1/2] fbdev/defio: Early-out if page is already enlisted
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-2-tzimmermann@suse.de> <YgV87ejpzGkSMNop@ravnborg.org>
In-Reply-To: <YgV87ejpzGkSMNop@ravnborg.org>

--------------n7GSgPNcuvE8U0uX2tjJ8i6W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDEwLjAyLjIyIHVtIDIyOjAwIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBUaHUsIEZlYiAxMCwgMjAyMiBhdCAwMzoxMToxMVBN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IFJldHVybiBlYXJseSBpZiBh
IHBhZ2UgaXMgYWxyZWFkeSBpbiB0aGUgbGlzdCBvZiBkaXJ0eSBwYWdlcyBmb3INCj4+IGRl
ZmVycmVkIEkvTy4gVGhpcyBjYW4gYmUgZGV0ZWN0ZWQgaWYgdGhlIHBhZ2UncyBsaXN0IGhl
YWQgaXMgbm90DQo+PiBlbXB0eS4gS2VlcCB0aGUgbGlzdCBoZWFkIGluaXRpYWxpemVkIHdo
aWxlIHRoZSBwYWdlIGlzIG5vdCBlbmxpc3RlZA0KPj4gdG8gbWFrZSB0aGlzIHdvcmsgcmVs
aWFibHkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2ZiX2RlZmlvLmMgfCAyMSArKysrKysrKysrKystLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIGIvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4+IGluZGV4IGE1OTFkMjkxYjIzMS4uMzcy
N2IxY2E4N2IxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zi
X2RlZmlvLmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5j
DQo+PiBAQCAtNTksNiArNTksNyBAQCBzdGF0aWMgdm1fZmF1bHRfdCBmYl9kZWZlcnJlZF9p
b19mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikNCj4+ICAgCQlwcmludGsoS0VSTl9FUlIg
Im5vIG1hcHBpbmcgYXZhaWxhYmxlXG4iKTsNCj4+ICAgDQo+PiAgIAlCVUdfT04oIXBhZ2Ut
Pm1hcHBpbmcpOw0KPj4gKwlJTklUX0xJU1RfSEVBRCgmcGFnZS0+bHJ1KTsNCj4+ICAgCXBh
Z2UtPmluZGV4ID0gdm1mLT5wZ29mZjsNCj4+ICAgDQo+PiAgIAl2bWYtPnBhZ2UgPSBwYWdl
Ow0KPj4gQEAgLTEyMiwxNyArMTIzLDE5IEBAIHN0YXRpYyB2bV9mYXVsdF90IGZiX2RlZmVy
cmVkX2lvX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+PiAgIAkgKi8NCj4+ICAg
CWxvY2tfcGFnZShwYWdlKTsNCj4+ICAgDQo+PiArCS8qDQo+PiArCSAqIFRoaXMgY2hlY2sg
aXMgdG8gY2F0Y2ggdGhlIGNhc2Ugd2hlcmUgYSBuZXcgcHJvY2VzcyBjb3VsZCBzdGFydA0K
Pj4gKwkgKiB3cml0aW5nIHRvIHRoZSBzYW1lIHBhZ2UgdGhyb3VnaCBhIG5ldyBwdGUuIHRo
aXMgbmV3IGFjY2Vzcw0KPj4gKwkgKiBjYW4gY2F1c2UgdGhlIG1rd3JpdGUgZXZlbiB3aGVu
IHRoZSBvcmlnaW5hbCBwcydzIHB0ZSBpcyBtYXJrZWQNCj4+ICsJICogd3JpdGFibGUuDQo+
PiArCSAqLw0KPiBXaGVuIG1vdmluZyB0aGlzIGNvbW1lbnQgaXQgd291bGQgYmUgcHJ1ZGVu
dCB0byBhbHNvIGZpeCB0aGUgd29yZGluZyBhDQo+IGJpdC4NCj4gLSBDYXBpdGFsIGluIHN0
YXJ0IG9mIHNlbnRlbmNlIGFuZCBhZnRlciBhIHBlcmlvZA0KPiAtIFNwZWxsIG91dCBwcm9j
ZXNzIGFuZCBkbyBub3Qgc2hvcnRlbiBwcw0KDQpPay4NCg0KPiANCj4gDQo+PiArCWlmICgh
bGlzdF9lbXB0eSgmcGFnZS0+bHJ1KSkNCj4+ICsJCWdvdG8gcGFnZV9hbHJlYWR5X2FkZGVk
Ow0KPj4gKw0KPiANCj4gVGhpcyBjaGVjayBzYXlzIHRoYXQgaWYgdGhlIHBhZ2UgYWxyZWFk
eSBoYXMgc29tZXRoaW5nIGluIHRoZSBwYXJnZS0+bHJ1DQo+IHRoZW4gdGhpcyBpcyBhZGRl
ZCBieSBkZWZpbyBhbmQgdGh1cyBpcyBhbHJlYWR5IGFkZGVkLg0KPiBUaGlzIG1hdGNoZXMg
eW91ciBjb21taXQgZGVzY3JpcHRpb24gLSBPSy4NCj4gDQo+IE1heWJlIGFkZCBzb21ldGhp
bmcgbGlrZToNCj4gKiBQYWdlcyBhZGRlZCB3aWxsIGhhdmUgdGhlaXIgbHJ1IHNldCwgYW5k
IGl0IGlzIGNsZXJlZCBhZ2FpbiBpbiB0aGUNCj4gKiBkZWZlcnJlZCB3b3JrIGhhbmRsZXIu
DQoNCkknbGwgYWRkIGEgcmVsYXRlZCBUT0RPIHRvIHRoZSBjb21tZW50IGJlY2F1c2Ugd2Ug
YWN0dWFsbHkgd2FudCB0byANCnJlbW92ZSB0aGUgdXNlIG9mIHRoZSBscnUgZmllbGQuIEl0
J3Mgb3duZWQgYnkgdGhlIHBhZ2UgY2FjaGUuIEkgYWxyZWFkeSANCmhhdmUgYSBwcm90b3R5
cGUgcGF0Y2ggdGhhdCBpbXBsZW1lbnRzIHRoZSBwYWdlIHRyYWNraW5nIHdpdGggYSBzZXBh
cmF0ZSANCmxpc3QuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KPiANCj4+
ICAgCS8qIHdlIGxvb3AgdGhyb3VnaCB0aGUgcGFnZWxpc3QgYmVmb3JlIGFkZGluZyBpbiBv
cmRlcg0KPj4gICAJdG8ga2VlcCB0aGUgcGFnZWxpc3Qgc29ydGVkICovDQo+PiAgIAlsaXN0
X2Zvcl9lYWNoX2VudHJ5KGN1ciwgJmZiZGVmaW8tPnBhZ2VsaXN0LCBscnUpIHsNCj4+IC0J
CS8qIHRoaXMgY2hlY2sgaXMgdG8gY2F0Y2ggdGhlIGNhc2Ugd2hlcmUgYSBuZXcNCj4+IC0J
CXByb2Nlc3MgY291bGQgc3RhcnQgd3JpdGluZyB0byB0aGUgc2FtZSBwYWdlDQo+PiAtCQl0
aHJvdWdoIGEgbmV3IHB0ZS4gdGhpcyBuZXcgYWNjZXNzIGNhbiBjYXVzZSB0aGUNCj4+IC0J
CW1rd3JpdGUgZXZlbiB3aGVuIHRoZSBvcmlnaW5hbCBwcydzIHB0ZSBpcyBtYXJrZWQNCj4+
IC0JCXdyaXRhYmxlICovDQo+PiAtCQlpZiAodW5saWtlbHkoY3VyID09IHBhZ2UpKQ0KPj4g
LQkJCWdvdG8gcGFnZV9hbHJlYWR5X2FkZGVkOw0KPj4gLQkJZWxzZSBpZiAoY3VyLT5pbmRl
eCA+IHBhZ2UtPmluZGV4KQ0KPj4gKwkJaWYgKGN1ci0+aW5kZXggPiBwYWdlLT5pbmRleCkN
Cj4+ICAgCQkJYnJlYWs7DQo+PiAgIAl9DQo+PiAgIA0KPj4gQEAgLTE5NCw3ICsxOTcsNyBA
QCBzdGF0aWMgdm9pZCBmYl9kZWZlcnJlZF9pb193b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykNCj4+ICAgDQo+PiAgIAkvKiBjbGVhciB0aGUgbGlzdCAqLw0KPj4gICAJbGlzdF9m
b3JfZWFjaF9zYWZlKG5vZGUsIG5leHQsICZmYmRlZmlvLT5wYWdlbGlzdCkgew0KPj4gLQkJ
bGlzdF9kZWwobm9kZSk7DQo+PiArCQlsaXN0X2RlbF9pbml0KG5vZGUpOw0KPj4gICAJfQ0K
Pj4gICAJbXV0ZXhfdW5sb2NrKCZmYmRlZmlvLT5sb2NrKTsNCj4+ICAgfQ0KPiANCj4gV2l0
aCB0aGUgY29tbWVudCBhZGp1c3RlZCBhcyB5b3Ugc2VlIGZpdA0KPiBBY2tlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------n7GSgPNcuvE8U0uX2tjJ8i6W--

--------------sVKYxkkOdy9c2jXrIRabYWEo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIGKGoFAwAAAAAACgkQlh/E3EQov+Dk
Lg/+I9PN0cQPCWT7ofjyH+Oz98b7cv80zaH5XoFgYVjKZwcD00Ctogfdl7wPCvig59KVhgZ2qaUo
W1gnvQk4cjInu0n/cyEhpaLFanqrpSU7wEjt7GC91T92D21kI6kqf7mtnMeBbLgY3DcDzNIysLwl
YE0otJDlZcgm2albaQ/gf+zEvdC9ETbeD8+CkDPoEEKmuOLjVA0PwRGL/kpxP01w2CB4QMiHxtI7
N/znXOIWZ+BHwxyB/R6yWEIBMzhraOwSuN7517Ws5kLcZLpLfriOYkx5pPFhmOjFGPb7g/Px5QCi
6CKD7CbYU6/WkCfDgcGNHbeHnXXnDC+qWQnI4DLeFR7ugghM5OzMco/Uzl7EdW0E1qyOM6vonyNn
G6t8ltba3nw4/5pBh6xqLgZKNOk4bMPqkAKFtmGFua5DSm1wutCozJefka5nG7QKgCF6xM+TXwBF
pd991ApKxxpol5mOSBCvDawKL5cZn5wYMzL3hc+P8tMgzJhGWf9+AfgWMUUVXk4fWaIww4/+Jaz8
DIusNVGtox/EUt0q8hgbmbCfBD4gsH2CI7FvOb0pMohoMoFPs3AXmxqMbwH6mH22AQq34wQZZJas
/gshvYUk3a4Zx7AyPhu6QSYFOyiZulPb4QBmahnO9fbhCaiuQjVBwPsINhS1vohMwlVSWndf3Oug
S7o=
=dE5U
-----END PGP SIGNATURE-----

--------------sVKYxkkOdy9c2jXrIRabYWEo--
