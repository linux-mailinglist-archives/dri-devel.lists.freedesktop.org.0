Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A265649AF85
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B92D10EF05;
	Tue, 25 Jan 2022 09:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DF610EF05
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:13:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4611721102;
 Tue, 25 Jan 2022 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643102016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0f8u6l1rSEWvkufMI8ina28FmuKJX6XQLv6xbvgDjRI=;
 b=XmuNtMlEfBGmi/BUmCM2moSJrZby00dCneo9dyzEec/BDLPEC/00r+Xmu7idaiDOZIcm8o
 nqWgW2ntP8NOmcxBJPeToSFKChG4ovggmhm+TCofJvbjnUPIaX4KvyyWNtJ9elFipq5Z9d
 uymg1s2yAl/pwnY9AworsEBtbAXS95Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643102016;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0f8u6l1rSEWvkufMI8ina28FmuKJX6XQLv6xbvgDjRI=;
 b=kXRWYNwJSDTsbNWMnBqYfZnED59Mbx4hanJaU5WNyaYfCUidRT1oE5ngcvBHsaIbgov2NG
 VaoVpdLpCJkvVdAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 104BD13DA2;
 Tue, 25 Jan 2022 09:13:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id suMmA0C/72EgQQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jan 2022 09:13:36 +0000
Message-ID: <7db5ae33-d4be-4b27-7dc1-d7b58db86b9f@suse.de>
Date: Tue, 25 Jan 2022 10:13:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/5] sysfb: Fix memory-region management
Content-Language: en-US
To: zackr@vmware.com, javierm@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220125091222.21457-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220125091222.21457-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------X7EyffL3Ohse0sYzthLdmPiy"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------X7EyffL3Ohse0sYzthLdmPiy
Content-Type: multipart/mixed; boundary="------------EXHECe7kI5TgMH873zoiJcsX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zackr@vmware.com, javierm@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <7db5ae33-d4be-4b27-7dc1-d7b58db86b9f@suse.de>
Subject: Re: [PATCH 0/5] sysfb: Fix memory-region management
References: <20220125091222.21457-1-tzimmermann@suse.de>
In-Reply-To: <20220125091222.21457-1-tzimmermann@suse.de>

--------------EXHECe7kI5TgMH873zoiJcsX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhpcyB2MiBvZiB0aGUgcGF0Y2hzZXQuIEkgZm9yZ290IHRvIGFkYXB0IHRoZSBzdWJqZWN0
IGxpbmUgOi8NCg0KQW0gMjUuMDEuMjIgdW0gMTA6MTIgc2NocmllYiBUaG9tYXMgWmltbWVy
bWFubjoNCj4gUmVxdWVzdCBmcmFtZWJ1ZmZlciBtZW1vcnkgaW4gc2ltcGxlZHJtIGFuZCBz
aW1wbGVmYi4gRG8gYSBob3QtdW5wbHVnDQo+IG9wZXJhdGlvbiB3aGVuIHJlbW92aW5nIGZi
ZGV2IGZpcm13YXJlIGRyaXZlcnMuDQo+IA0KPiBBZnRlciBiZWluZyB1bmxvYWRlZCBieSBh
IGhhcmR3YXJlIGRyaXZlciwgc2ltcGxlZmIgbGVhdmVzIGJlaGluZCB0aGUNCj4gZmlybXdh
cmUgZnJhbWVidWZmZXIncyBwbGF0Zm9ybSBkZXZpY2UuIFRoaXMgcHJldmVudHMgb3RoZXIg
ZHJpdmVycw0KPiBmcm9tIGFjcXVpcmluZyB0aGUgbWVtb3J5IGFzIHJlcG9ydGVkIGF0IFsx
XS4NCj4gDQo+IFBhdGNoIDEgY2hhbmdlcyB0aGUgcmVtb3ZhbCBjb2RlIG9mIHJlbW92ZV9j
b25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoKQ0KPiB0byByZW1vdmUgdGhlIHVuZGVybHlpbmcg
ZGV2aWNlIGFuZCB0aGUgcnNwIG1lbW9yeSByZWdpb24uDQo+IA0KPiBQYXRjaGVzIDIgdG8g
NCB1cGRhdGUgc3lzZmIgYW5kIGl0cyBkcml2ZXJzLiBUaGUgc3lzZmIgY29kZSBkb2VzIG5v
DQo+IGxvbmdlciBtYXJrIHRoZSBmcmFtZWJ1ZmZlciBtZW1vcnkgd2l0aCBJT1JFU09VUkNF
X0JVU1kuIEluc3RlYWQsIHRoZQ0KPiBkZXZpY2UgZHJpdmVycyBhY3F1aXJlIHRoZSBtZW1v
cnkgd2hlbiB0aGV5IHByb2JlIHRoZSBkZXZpY2UuDQo+IA0KPiBQYXRjaCA1IGFkZHMgYSB0
b2RvIGl0ZW0gdG8gYWNxdWlyZSBtZW1vcnkgcmVnaW9ucyBpbiBhbGwgRFJNIGRyaXZlcnMu
DQo+IA0KPiBUZXN0ZWQgd2l0aCBzaW1wbGVkcm0gYW5kIHNpbXBsZWZiLg0KPiANCj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIyMDExNzE4MDM1OS4xODEx
NC0xLXphY2tAa2RlLm9yZy8NCj4gDQo+IHYyOg0KPiAJKiBmaXggcG9zc2libGUgTlVMTCBk
ZXJlZiBpbiBzaW1wbGVkcm0gKEpvY2VseW4pDQo+IAkqIHZhcmlvdXMgc3R5bGUgZml4ZXMg
KEphdmllcikNCj4gDQo+IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyAoMSk6DQo+ICAgIGRy
aXZlcnMvZmlybXdhcmU6IERvbid0IG1hcmsgYXMgYnVzeSB0aGUgc2ltcGxlLWZyYW1lYnVm
ZmVyIElPDQo+ICAgICAgcmVzb3VyY2UNCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICg0KToN
Cj4gICAgZmJkZXY6IEhvdC11bnBsdWcgZmlybXdhcmUgZmIgZGV2aWNlcyBvbiBmb3JjZWQg
cmVtb3ZhbA0KPiAgICBkcm0vc2ltcGxlZHJtOiBSZXF1ZXN0IG1lbW9yeSByZWdpb24gaW4g
ZHJpdmVyDQo+ICAgIGZiZGV2L3NpbXBsZWZiOiBSZXF1ZXN0IG1lbW9yeSByZWdpb24gaW4g
ZHJpdmVyDQo+ICAgIGRybTogQWRkIFRPRE8gaXRlbSBmb3IgcmVxdWVzdGluZyBtZW1vcnkg
cmVnaW9ucw0KPiANCj4gICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAgfCAx
NSArKysrKysrDQo+ICAgZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jIHwgIDIg
Ky0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyAgfCAyMiArKysrKysr
Ky0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jICB8IDI5ICsrKysr
KysrKysrKy0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zaW1wbGVmYi5jICAgIHwgNjUg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgIGluY2x1ZGUvbGludXgvZmIu
aCAgICAgICAgICAgICAgICB8ICAxICsNCj4gICA2IGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNl
cnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkNCj4gDQo+IA0KPiBiYXNlLWNvbW1pdDogMGJi
ODFiNWQ2ZGI1ZjY4OWI2N2Y5ZDhiMzUzMjMyMzVjNDVlODkwZg0KPiBwcmVyZXF1aXNpdGUt
cGF0Y2gtaWQ6IGMyYjJmMDhmMGVjY2M5ZjVkZjBjMGRhNDlmYTFkMzYyNjdkZWIxMWQNCj4g
cHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBjNjdlNWQ4ODZhNDdiN2QwMjY2ZDgxMTAwODM3NTU3
ZmRhMzRjYjI0DQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogOGU1MjE0M2E2Y2Q3YjhmYjc4
OWU2NTYyMDhmNmVkZGU3MWQwZjQ5OQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------EXHECe7kI5TgMH873zoiJcsX--

--------------X7EyffL3Ohse0sYzthLdmPiy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHvvz8FAwAAAAAACgkQlh/E3EQov+BV
wQ/+JRhbBAMDfQVdj1O7ClB5TOyxbO4c1EUvsvSo4AKORz1mPeNY9lyov7KyBgAla5JdbhVSpDXQ
iXFrZ+RpQ/MZJmNWEyC7Zyk/xtf5AN002nNLruulBEdwlORXAGUWD7I0eoehTURMgCdSSaqJpU/E
DPm/K5cqcWiOcKjv8NS/xVvPCqFYdc+8toSouAsfwYdzF7riO+9cPBkRNoAURLkzkraLZ0pyN74t
JXJhBCAYbZqYiPbKUijTtJZH1woyJqstP7lQQuKu+hZNsz6rKUuNndE7/rtxrt0oHXNLYm2s29xx
5lfnzKks8+82vrkD+PMVRe5fkgPYKv8p+UQ2U5hG3D0NEeLG5qNtrlbtfYyC1nrT8MeWCEv6pOoW
y80rp1f7l/2cIEvqpZXkfG2QZVDSjJ1Rq3s2VmDyTNRoh7Fh5xiIr4pZQNSsqpTXR/wh9i+ihAni
7e0J5zifT5qAI0euZYNbkqBYCDICFIL8dJ7eCux6XQ2g/uLJA6OXwlJcRxvJDVMBSOAo2wCuMj2J
GBhez4IZAmJTtxt7dRGBVItMtENRSVABxG0Be97VcLhjTQlEtUN7BvN0AIU30ndNIjuLPh7Y62MC
pIjjkc77UK7meC99kpbirQWz4Gm//W9tXzfk/MSmF+1gaf86U5dkZzDS43qif0YncNFzUcMyeD6U
TTk=
=uaVI
-----END PGP SIGNATURE-----

--------------X7EyffL3Ohse0sYzthLdmPiy--
