Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369994B2016
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A760110EA1C;
	Fri, 11 Feb 2022 08:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA4F10EA1C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:25:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43F112112A;
 Fri, 11 Feb 2022 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644567956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+eO8+4tpOXkqllU1xmcoikA4y/S1GiEE4M/BHxC0sI=;
 b=qXcVL2Zu9p5iDYT8nouVucyWDKatqOQn+eb1pm6D4Jk2e8IItiNG2p3EWkv32ZWnJXLazc
 cj6pHM2+XOUdIEz6897QzK3WWoMJItJ8Nf3IQ30FgT13PcEzAvvUOe1qZYZ6Py23vF4b+Y
 l59w5v8unCzHDMQYKi4FZdwGHc6G6Fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644567956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+eO8+4tpOXkqllU1xmcoikA4y/S1GiEE4M/BHxC0sI=;
 b=xB83RDXxT/MPa5ZBP6Dr5tstit0lxR36klri/awDnS8hRLcOXyhc8JUnclLEUsJXAUOOrg
 5PhececFRFvVEZAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09D1013B59;
 Fri, 11 Feb 2022 08:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7ZhlAZQdBmLidQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 08:25:56 +0000
Message-ID: <96539edd-4b78-e460-786d-db9581eccdee@suse.de>
Date: Fri, 11 Feb 2022 09:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de> <YgWAvXF+WClk/fyk@ravnborg.org>
 <20220211075844.GM1951@kadam>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220211075844.GM1951@kadam>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nqeWFxU6sPRitacyv3XegykW"
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
--------------nqeWFxU6sPRitacyv3XegykW
Content-Type: multipart/mixed; boundary="------------VpSHW5hRCT4H9SfVFQOw8LFq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, bernie@plugable.com, noralf@tronnes.org,
 andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Message-ID: <96539edd-4b78-e460-786d-db9581eccdee@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de> <YgWAvXF+WClk/fyk@ravnborg.org>
 <20220211075844.GM1951@kadam>
In-Reply-To: <20220211075844.GM1951@kadam>

--------------VpSHW5hRCT4H9SfVFQOw8LFq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDIuMjIgdW0gMDg6NTggc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBP
biBUaHUsIEZlYiAxMCwgMjAyMiBhdCAxMDoxNjo0NVBNICswMTAwLCBTYW0gUmF2bmJvcmcg
d3JvdGU6DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9k
ZWZpby5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4+PiBpbmRl
eCAzNzI3YjFjYTg3YjEuLjFmNjcyY2YyNTNiMiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+Pj4gQEAgLTEzMiwxNSArMTMyLDIwIEBAIHN0YXRp
YyB2bV9mYXVsdF90IGZiX2RlZmVycmVkX2lvX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0ICp2
bWYpDQo+Pj4gICAJaWYgKCFsaXN0X2VtcHR5KCZwYWdlLT5scnUpKQ0KPj4+ICAgCQlnb3Rv
IHBhZ2VfYWxyZWFkeV9hZGRlZDsNCj4+PiAgIA0KPj4+IC0JLyogd2UgbG9vcCB0aHJvdWdo
IHRoZSBwYWdlbGlzdCBiZWZvcmUgYWRkaW5nIGluIG9yZGVyDQo+Pj4gLQl0byBrZWVwIHRo
ZSBwYWdlbGlzdCBzb3J0ZWQgKi8NCj4+PiAtCWxpc3RfZm9yX2VhY2hfZW50cnkoY3VyLCAm
ZmJkZWZpby0+cGFnZWxpc3QsIGxydSkgew0KPj4+IC0JCWlmIChjdXItPmluZGV4ID4gcGFn
ZS0+aW5kZXgpDQo+Pj4gLQkJCWJyZWFrOw0KPj4+ICsJaWYgKGZiZGVmaW8tPnNvcnRfcGFn
ZWxpc3QpIHsNCj4+PiArCQkvKg0KPj4+ICsJCSAqIFdlIGxvb3AgdGhyb3VnaCB0aGUgcGFn
ZWxpc3QgYmVmb3JlIGFkZGluZyBpbiBvcmRlcg0KPj4+ICsJCSAqIHRvIGtlZXAgdGhlIHBh
Z2VsaXN0IHNvcnRlZC4NCj4+PiArCQkgKi8NCj4+PiArCQlsaXN0X2Zvcl9lYWNoX2VudHJ5
KGN1ciwgJmZiZGVmaW8tPnBhZ2VsaXN0LCBscnUpIHsNCj4+PiArCQkJaWYgKGN1ci0+aW5k
ZXggPiBwYWdlLT5pbmRleCkNCj4+PiArCQkJCWJyZWFrOw0KPj4+ICsJCX0NCj4+PiArCQls
aXN0X2FkZF90YWlsKCZwYWdlLT5scnUsICZjdXItPmxydSk7DQo+Pj4gKwl9IGVsc2Ugew0K
Pj4+ICsJCWxpc3RfYWRkX3RhaWwoJnBhZ2UtPmxydSwgJmZiZGVmaW8tPnBhZ2VsaXN0KTsN
Cj4+PiAgIAl9DQo+PiBCaWtlc2hlZGRpbmcgLSBteSBwZXJzb25hbCBzdHlsZSBpcyB0byBo
YXZlIHRoZSBsaWtlbHkgcGFydCBmaXJzdC4NCj4+IFRoaXMgbWFrZXMgcmVhZGluZyB0aGUg
Y29kZSBlYXNpZXIuDQo+IA0KPiBJJ3ZlIHRob3VnaHQgYWJvdXQgdGhpcyBxdWl0ZSBhIGJp
dC4uLiAgSSBndWVzcyBteSBydWxlIGlzIHRvIGF2b2lkDQo+IG5lZ2F0aXZlcyBhcyBtdWNo
IGFzIHBvc3NpYmxlIHNvIEkgcHJlZmVyIHRoZSBvcmlnaW5hbCBjb2RlLiAgTXkgcnVsZXMN
Cj4gcmlnaHQgbm93IGFyZToNCj4gDQo+IDEpIEFsd2F5cyBkbyBlcnJvciBoYW5kbGluZy4g
IERvbid0IGRvIHN1Y2Nlc3MgaGFuZGxpbmcuDQo+IDIpIFJldHVybiBhcyBxdWlja2x5IGFz
IHBvc3NpYmxlIGFuZCBwdWxsIHRoZSBjb2RlIGluIGFuIGluZGVudC4NCj4gMykgQXZvaWQg
bmVnYXRpdmVzLiAgTmV2ZXIgaGFkIG5lZ2F0aXZlcyBpbiB0aGUgdmFyaWFibGUgbmFtZXMu
DQoNCiBGcm9tIHdoYXQgSSBrbm93LCBDUFVzJyBicmFuY2ggcHJlZGljdGlvbiBwcmVmZXJz
IGJhY2t3YXJkIGp1bXBzIChlLmcuLCANCmxvb3BzKSBidXQgYXZvaWRzIGZvcndhcmQganVt
cHMuIENvbXBpbGVycyBhcnJhbmdlIHRoZSBjb2RlIHRvIG9wdGltaXplIA0KZm9yIHRoaXMg
cGF0dGVybi4gU28gSSB0ZW5kIHRvIHB1dCB0aGUgZXhjZXB0aW9uIG9yIGVycm9yIGhhbmRs
aW5nIGludG8gDQp0aGUgaWYgYnJhbmNoLiAgQnV0IEkgaGF2ZSBubyBpZGVhIGlmIHRoYXQg
cmVhbGx5IG1ha2VzIGEgZGlmZmVyZW5jZSBhdCANCnJ1bnRpbWUuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------VpSHW5hRCT4H9SfVFQOw8LFq--

--------------nqeWFxU6sPRitacyv3XegykW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIGHZMFAwAAAAAACgkQlh/E3EQov+CW
UA/8CNEy5v/BG4UxJaMHwoVtKafTO75jNQR6k1lLBJ90XBOqN6ET0eUbXltXgAVLmRw/Cggs9ngf
OwQP8IAwWhks8pRaYYUHAfx82XeWJFsTXv5MIyVUdlsD2Hduwdy/hD3yHJfVqS2UiaOEg4kYigQQ
gwodIFk+m8STPPDmvHcZsS2w2Jr97Q9H2FWAaF4ApL65O7sKEtn9W9gStZghpKdkQoUAttdha4Uk
Oxtyk3TmoFMy0uo0DiBPIKQV9uWZ1CrbH1VnrWCww0ZXXfd9rcEfHi9RR09dKXFurukzRpz5mFsf
Zaq327VjIlUr5aWWsqVGyjFrJp87p79i4WgN7rV40Soe3i6d8BvAQKMCZsV41/f+RugZERzyJ+Fr
mlgNak/iBFgx1k6cP6DOzT7UywWv9QFlqg7VXzo7QCpKoF8EQnZ/y38fzq91UGNlo1Oadqc67Fdo
XT9Ph4r9uyAVum+4WU0pM4GLKh8ptURyh4tTGUttyijwEE+zHQ5RhVI2j0iF5DdQaYNtIzfQ5BrY
/CdsiBg0QbfGRCIMGi2kZNFs5K52CoUDCnAxSuwz8DhrIcifIxhT1nsYupEMa8ugn4w7l47GtZqq
SdnPEztIczzK+ySSrRXmPoU2KgJkX8PhC+fpETHkx160A8OpYWONw5B60kHpOlV4HtDTWhxAG9lI
How=
=co/r
-----END PGP SIGNATURE-----

--------------nqeWFxU6sPRitacyv3XegykW--
