Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE66717C0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80B110E6D9;
	Wed, 18 Jan 2023 09:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212610E225;
 Wed, 18 Jan 2023 09:29:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AD53021C06;
 Wed, 18 Jan 2023 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674034146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tj9wTRDn61lOapinr88tVx7uC7imn+F9hOSxlVO7OKU=;
 b=tGRilcHCRSqVr3z/s/lcmt2HGQI40xM9hdLz9ElzstGE18lW0TXnlVH3ftUmStin6zBhT4
 E0O3Z9C5kgXlsX8MDULwMy7idZ07wyCm53M3DSK73qb9P/dwlZwusfUaDJOU+OKhjx3pyc
 ruJ85lSox9LO5cB0itZQyZAkjzuPsNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674034146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tj9wTRDn61lOapinr88tVx7uC7imn+F9hOSxlVO7OKU=;
 b=YEjzHTdBHtxmz2PdWsDUvBiuh5aEgDG5B1AoxLyCKp+H9/SzxZ95TOAzAMg4gRcCFBe2b5
 oI5KaQLLiWqZfyBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BED0139D2;
 Wed, 18 Jan 2023 09:29:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EpHdIOK7x2NiOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 18 Jan 2023 09:29:06 +0000
Message-ID: <b5192a65-274c-4541-e162-cead3339decc@suse.de>
Date: Wed, 18 Jan 2023 10:29:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Ongoing failure for "dim rebuild-tip"
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EEF9zN9vd9NLhUneStqzVjCN"
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
--------------EEF9zN9vd9NLhUneStqzVjCN
Content-Type: multipart/mixed; boundary="------------NIQAzYvZ02OPtR0nnNzvCK4J";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <b5192a65-274c-4541-e162-cead3339decc@suse.de>
Subject: Re: Ongoing failure for "dim rebuild-tip"
References: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
In-Reply-To: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>

--------------NIQAzYvZ02OPtR0nnNzvCK4J
Content-Type: multipart/mixed; boundary="------------HoWOlwzveGCX0DuGFpsc1hEP"

--------------HoWOlwzveGCX0DuGFpsc1hEP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjMgdW0gMTA6MTMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBIaSBndXlzLA0KPiANCj4gZm9yIGEgY291cGxlIG9mIHdlZWtzIG5vdyB0aGUgY29tbWFu
ZCAiZGltIHJlYnVpbGQtdGlwIiBmYWlscyBmb3IgbWUuIA0KPiBUaGUgZXJyb3IgbWVzc2Fn
ZSBpczoNCj4gDQo+IE1lcmdpbmcgZHJtLWludGVsL2RybS1pbnRlbC1ndC1uZXh0Li4uIEFw
cGx5aW5nIG1hbnVhbCBmaXh1cCBwYXRjaCBmb3IgDQo+IGRybS10aXAgbWVyZ2UuLi4gcGF0
Y2hpbmcgZmlsZSBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19mdy5jDQo+
IGRpbToNCj4gZGltOiBGQUlMVVJFOiBDb3VsZCBub3QgbWVyZ2UgZHJtLWludGVsL2RybS1p
bnRlbC1ndC1uZXh0DQo+IGRpbTogU2VlIHRoZSBzZWN0aW9uICJSZXNvbHZpbmcgQ29uZmxp
Y3RzIHdoZW4gUmVidWlsZGluZyBkcm0tdGlwIg0KPiBkaW06IGluIHRoZSBkcm0tdGlwLnJz
dCBkb2N1bWVudGF0aW9uIGZvciBob3cgdG8gaGFuZGxlIHRoaXMgc2l0dWF0aW9uLg0KPiAN
Cj4gVGhpcyBhbHNvIGhhcHBlbnMgb24gYSBmcmVzaCBjbGVhbiBpbnN0YWxsIG9mIGRpbSwg
c28gSSdtIHByZXR0eSBzdXJlIA0KPiB0aGF0IHRoaXMgaXNuJ3QgYSBwcm9ibGVtIG9uIG15
IHNpZGUuDQo+IA0KPiBXaGF0IGNhbiB3ZSBkbz8NCg0KSnVzdCBibGluZGx5IGd1ZXNzaW5n
Og0KDQpBcmUgeW91IHN1cmUgeW91IGRvbid0IGhhdmUgYW55IG9sZCBmaXgtdXAgcGF0Y2hl
cyBzb21ld2hlcmU/DQoNCkkndmUgbm90IHNlZW4gdGhpcyBwcm9ibGVtLiBCdXQgSSd2ZSBm
b3VuZCBhIGZpeC11cCBwYXRjaCBpbiBteSB0cmVlLiANCk1heWJlIHRoZSBhdHRhY2htZW50
IGZpeGVzIHRoZSBwcm9ibGVtIGZvciB5b3U/IChnb2VzIGludG8gDQpkcm0tcmVyZXJlL2Zp
eHVwcy8pLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGFua3MsDQo+IENo
cmlzdGlhbi4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==
--------------HoWOlwzveGCX0DuGFpsc1hEP
Content-Type: text/x-patch; charset=UTF-8; name="drm-intel-gt-next.patch"
Content-Disposition: attachment; filename="drm-intel-gt-next.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19mdy5jCmluZGV4IDM4NTNm
OWYxYjljNS4uNjU2NzJmZjgyNjA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC91Yy9pbnRlbF91Y19mdy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX3VjX2Z3LmMKQEAgLTcwMSwzMiArNzAxLDYgQEAgc3RhdGljIGludCB0cnlfZmly
bXdhcmVfbG9hZChzdHJ1Y3QgaW50ZWxfdWNfZncgKnVjX2Z3LCBjb25zdCBzdHJ1Y3QgZmly
bXdhcmUgKioKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCB0cnlfZmlybXdhcmVfbG9h
ZChzdHJ1Y3QgaW50ZWxfdWNfZncgKnVjX2Z3LCBjb25zdCBzdHJ1Y3QgZmlybXdhcmUgKipm
dykKLXsKLQlzdHJ1Y3QgaW50ZWxfZ3QgKmd0ID0gX191Y19md190b19ndCh1Y19mdyk7Ci0J
c3RydWN0IGRldmljZSAqZGV2ID0gZ3QtPmk5MTUtPmRybS5kZXY7Ci0JaW50IGVycjsKLQot
CWVyciA9IGZpcm13YXJlX3JlcXVlc3Rfbm93YXJuKGZ3LCB1Y19mdy0+ZmlsZV9zZWxlY3Rl
ZC5wYXRoLCBkZXYpOwotCi0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsKLQotCWlmICgoKmZ3
KS0+c2l6ZSA+IElOVEVMX1VDX1JTVkRfR0dUVF9QRVJfRlcpIHsKLQkJZHJtX2VycigmZ3Qt
Pmk5MTUtPmRybSwKLQkJCSIlcyBmaXJtd2FyZSAlczogc2l6ZSAoJXp1S0IpIGV4Y2VlZHMg
bWF4IHN1cHBvcnRlZCBzaXplICgldUtCKVxuIiwKLQkJCWludGVsX3VjX2Z3X3R5cGVfcmVw
cih1Y19mdy0+dHlwZSksIHVjX2Z3LT5maWxlX3NlbGVjdGVkLnBhdGgsCi0JCQkoKmZ3KS0+
c2l6ZSAvIFNaXzFLLCBJTlRFTF9VQ19SU1ZEX0dHVFRfUEVSX0ZXIC8gU1pfMUspOwotCi0J
CS8qIHRyeSB0byBmaW5kIGFub3RoZXIgYmxvYiB0byBsb2FkICovCi0JCXJlbGVhc2VfZmly
bXdhcmUoKmZ3KTsKLQkJKmZ3ID0gTlVMTDsKLQkJcmV0dXJuIC1FTk9FTlQ7Ci0JfQotCi0J
cmV0dXJuIDA7Ci19Ci0KIC8qKgogICogaW50ZWxfdWNfZndfZmV0Y2ggLSBmZXRjaCB1QyBm
aXJtd2FyZQogICogQHVjX2Z3OiB1QyBmaXJtd2FyZQo=

--------------HoWOlwzveGCX0DuGFpsc1hEP--

--------------NIQAzYvZ02OPtR0nnNzvCK4J--

--------------EEF9zN9vd9NLhUneStqzVjCN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPHu+IFAwAAAAAACgkQlh/E3EQov+Dg
MA//Rw6u1TBCYmWeSRCQ0vae8qgnW09Sxt5ijpWeTU2wHvAgMEe/WZ+OsYm9LQ5eWHwApipuRhm7
8TlHhx5DA1uw5zh5OADgSGRayEw4L3vpqJ3f+I41z3cxvOyLvdj7Er0zf6SRtxtV3n/dNQ7LAsE7
9OAqz5IBQ0HLMURL/nHvmBRN5Zp7Z0xTKAOG0CDMIGxpt9u6NKfmHFiMzyCpAyrVDv5G9DhG1O9v
b0KL5ZraXfeOCm25VcGT8CI9OqrRZvik897Y2BM/px3n5tKC55RxTp8bOG+kXhgv3aKrEoUuKqmq
1Ehhbf4BhEN5I8ai3VncrYmXARREdzQSj0DbIojHYGF5nMfjQdyput3RQ2fayxKbgWixufbQcMsX
3QWO+u6zsW2DsOpCXsyYLr3f9Xh6pgddNlLnFZip+FabwBT+mZyC4lC0Q5qBf6MRiXlYlIuIIMKL
5vlyIoahH6DMR0YyD24Iactum8udxtzNr9pkKZXQEm+JB1JYMLZD0gW5sAZqaRiAq0kEd0YsmJdB
de9yJIFYD4YS0ICuofAK2+wWvPbhKDSBhytTeMjWDhQg8E03+49YNB9EGP69LNoobY7R1vjX5i8L
RrVPYBGi6HP6zXNVG7arqGj/u8+SVB3kNqYgOmukn3fe2C3EJo9eXtcbJb8qX9goKBvUXBzglnkd
4e8=
=VPQr
-----END PGP SIGNATURE-----

--------------EEF9zN9vd9NLhUneStqzVjCN--
