Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE444C0199
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 19:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ABE10EBC3;
	Tue, 22 Feb 2022 18:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6F310EBB1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 18:48:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 83E91210E3;
 Tue, 22 Feb 2022 18:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645555700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gnS8fQ+eZypENXrGkhVMPq6EA2ZzelHoa60VcyvpT7Y=;
 b=VajO6PyZPq2uYrYfvI7a4wQ6smyF8DKUU0TrPKsKA9Jfs/iK9txknIbzsMf+bNWwh4XRkH
 wDVbKruTszBDqyhos/aA1gjurKdCHQi0c/+s0StLr4aUUTbh+ok5aRTLFBrBf8sByElLA5
 5rejnxzPaPU4eYznC01AHk2S50IagNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645555700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gnS8fQ+eZypENXrGkhVMPq6EA2ZzelHoa60VcyvpT7Y=;
 b=s3oFbQpcDNfSVOLLtWcVIoHPUhrtE9QZov9B5D3uoE0PwRqs161sxyCzJDD/gS+Vuz47dy
 RKR0NsfEUyrtNRBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5538313C1A;
 Tue, 22 Feb 2022 18:48:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LKKtE/QvFWK/fQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Feb 2022 18:48:20 +0000
Message-ID: <44196aee-dedc-7019-2ca3-2801d8b5c2a8@suse.de>
Date: Tue, 22 Feb 2022 19:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 4/5] fbdev: Improve performance of cfb_imageblit()
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220221195410.9172-1-tzimmermann@suse.de>
 <20220221195410.9172-5-tzimmermann@suse.de> <20220222150111.506d2cee@eldfell>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220222150111.506d2cee@eldfell>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AzWiSJKhpxnsu1l2uTPuKR2O"
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org, kraxel@redhat.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AzWiSJKhpxnsu1l2uTPuKR2O
Content-Type: multipart/mixed; boundary="------------2ltCs5GLiTZVO9LduECezZgG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org, kraxel@redhat.com,
 sam@ravnborg.org
Message-ID: <44196aee-dedc-7019-2ca3-2801d8b5c2a8@suse.de>
Subject: Re: [PATCH v2 4/5] fbdev: Improve performance of cfb_imageblit()
References: <20220221195410.9172-1-tzimmermann@suse.de>
 <20220221195410.9172-5-tzimmermann@suse.de> <20220222150111.506d2cee@eldfell>
In-Reply-To: <20220222150111.506d2cee@eldfell>

--------------2ltCs5GLiTZVO9LduECezZgG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDIuMjIgdW0gMTQ6MDEgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoNCj4g
T24gTW9uLCAyMSBGZWIgMjAyMiAyMDo1NDowOSArMDEwMA0KPiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4gSW1wcm92ZSB0aGUgcGVy
Zm9ybWFuY2Ugb2Ygc3lzX2ltYWdlYmxpdCgpIGJ5IG1hbnVhbGx5IHVucm9sbGluZw0KPiAN
Cj4gc3lzPw0KPiANCj4+IHRoZSBpbm5lciBibGl0dGluZyBsb29wIGFuZCBtb3Zpbmcgc29t
ZSBpbnZhcmlhbnRzIG91dC4gVGhlIGNvbXBpbGVyDQo+PiBmYWlsZWQgdG8gZG8gdGhpcyBh
dXRvbWF0aWNhbGx5LiBUaGlzIGNoYW5nZSBrZWVwcyBjZmJfaW1hZ2VibGl0KCkNCj4+IGlu
IHN5bmMgd2l0aCBzeXNfaW1hZ2ViaXQoKS4NCj4gDQo+IFRoaXMgaXMgY29ycmVjdCBoZXJl
Lg0KPiANCj4+DQo+PiBBIG1pY3JvYmVuY2htYXJrIG1lYXN1cmVzIHRoZSBhdmVyYWdlIG51
bWJlciBvZiBDUFUgY3ljbGVzDQo+PiBmb3Igc3lzX2ltYWdlYmxpdCgpIGFmdGVyIGEgc3Rh
YmlsaXppbmcgcGVyaW9kIG9mIGEgZmV3IG1pbnV0ZXMNCj4gDQo+IHN5cz8NCj4gDQo+PiAo
aTctNDc5MCwgRnVsbEhELCBzaW1wbGVkcm0sIGtlcm5lbCB3aXRoIGRlYnVnZ2luZykuDQo+
Pg0KPj4gc3lzX2ltYWdlYmxpdCgpLCBuZXc6IDE1NzI0IGN5Y2xlcw0KPiANCj4gc3lzPw0K
PiANCj4+IGNmYl9pbWFnZWJsaXQoKTogb2xkOiAzMDU2NiBjeWNsZXMNCj4+DQo+PiBJbiB0
aGUgb3B0aW1pemVkIGNhc2UsIGNmYl9pbWFnZWJsaXQoKSBpcyBub3cgfjJ4IGZhc3RlciB0
aGFuIGJlZm9yZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvY2ZiaW1nYmx0LmMgfCA1MSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
PiANCj4gSnVzdCBub3RpY2VkIHNvbWUgY29uZnVzaW9uIGluIHRoZSBjb21taXQgbWVzc2Fn
ZS4NCg0KSSBjb3BpZWQgc29tZSBvZiB0aGUgdGV4dCBmcm9tIHRoZSBvdGhlciBjb21taXQg
YW5kIEkgY291bGQgaGF2ZSBzd29ybiBJIA0KdXBkYXRlZCBpdC4gQnV0IGFwcGFyZW50bHkg
bm90Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4gVGhhbmtzLA0KPiBw
cQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------2ltCs5GLiTZVO9LduECezZgG--

--------------AzWiSJKhpxnsu1l2uTPuKR2O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIVL/MFAwAAAAAACgkQlh/E3EQov+BL
Ww/+PJJurvh4NAI5tlbBfG9q6t25ysyFk98nY6Lei+FL2ym8lewWrfWbMS+kMcjHzUqmRBvfsPWE
MhzvxZlZ+YxU2cb5RUPC4ve69Qa5vOnWc3U6GKuh63XOfkZDWhPTPset7WtwPtrOzgG6JnEzu9eV
bfVpACa65NHWfGlcnSrjKqo7IWZdCi7e4jy3Vi43updZgngAoRnXPqsyfzOogNq3JEA1CbJxRpoj
NvbaPwNvFmWdKp3+vpzrZ4PABkUzRxlnn2Y/tOdrd9MYERIvpS4fO8p2HCX/RTkmifh9ZUIT1Wq/
D236Vrbf5rrGGE7pzY7i983RwKIs3rGlYn3BqY/tsT0DcJ2PvAFPjSbkqZQmMkAp3UeX46ZzLHFh
D2WqxJKszwgScJnofbmtZu0rPNS73dgJW4onCSiyZ6sVTOSUkUX/CLYHy9m40AsLS88NJ9wn1SyK
/f5aDWNoX4DIJLNyTSd+M1FPORy8/2SzpoO58t/Hy1dyF9G7CZMUrRtBLBeoL5htGBf+KCIk6bQA
n9nUiqwt/fez9VyV/LT2gsyfIrbs0OhrB5F1RDB/ndNFSmO1h4Vo3G1Zs31UuhwPxap8phHjtlDw
Q87FgJiY2mAl4TA4DavqqIA2+0ucV8AmPzqosN9PiakKUegoktI+m+wyruYx+wuQiMT0Fq3gtEHO
WjU=
=2KuU
-----END PGP SIGNATURE-----

--------------AzWiSJKhpxnsu1l2uTPuKR2O--
