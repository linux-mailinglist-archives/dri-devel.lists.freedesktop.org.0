Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B770A494B4F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FA110E28A;
	Thu, 20 Jan 2022 10:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8D10E308
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:01:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E7F82170E;
 Thu, 20 Jan 2022 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642672908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfsnfGzpyHk6PZ17eZLbc8G675T2vvH9vMV80ph+Wr0=;
 b=hF3QrVYBn/qFE8RpP6+7cgTLdWgoE46P/KkhIOxEZOh50Eh171qpXC73EukDkJpxOisURP
 dv0jKmHim+My/SdpzwYxTMVXJDNGS7lenN1nb4M+py9QOh03J8r1TDbSuMdZrT9fgLnOPY
 wGOdh3krFyfmeBscNfEr0/ns9M4Khok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642672908;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfsnfGzpyHk6PZ17eZLbc8G675T2vvH9vMV80ph+Wr0=;
 b=ycIlwt0qONOB1LNILKGIbhCgGoXdG0UTRnGgEUw+fxK4r3vcLh7cWYRYe4aeU1HE6EKE1U
 5P2GGn7+KM1RvjAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 565A213B51;
 Thu, 20 Jan 2022 10:01:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CIvQEwwz6WHbGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Jan 2022 10:01:48 +0000
Message-ID: <2464f7d9-38dd-1e6a-546f-3c9e1267f2a1@suse.de>
Date: Thu, 20 Jan 2022 11:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/5] drm/dp: Move DisplayPort helpers into own module
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220114114535.29157-1-tzimmermann@suse.de>
 <87v8yeag36.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87v8yeag36.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------midUNQ2ZT1ULeQpYoCouh4gp"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------midUNQ2ZT1ULeQpYoCouh4gp
Content-Type: multipart/mixed; boundary="------------ulNULGMrJfuJ9ToAfWQZhY6O";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2464f7d9-38dd-1e6a-546f-3c9e1267f2a1@suse.de>
Subject: Re: [PATCH v3 0/5] drm/dp: Move DisplayPort helpers into own module
References: <20220114114535.29157-1-tzimmermann@suse.de>
 <87v8yeag36.fsf@intel.com>
In-Reply-To: <87v8yeag36.fsf@intel.com>

--------------ulNULGMrJfuJ9ToAfWQZhY6O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDEuMjIgdW0gMTA6NTMgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
RnJpLCAxNCBKYW4gMjAyMiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4gU3BsaXQtb2ZmIERpc3BsYXlQb3J0IGZ1bmN0aW9ucyBmcm9tIEtN
UyBoZWxwZXIgbGlicmFyeSBhbmQgbW92ZSB0aGVtDQo+PiBpbnRvIHRoZWlyIG93biBtb2R1
bGUuIFJlZHVjZXMgdGhlIHNpemUgb2YgZHJtX2ttc19oZWxwZXIua28gYnkgfjUwJS4NCj4g
DQo+IFNvcnJ5IEkgZmFpbGVkIHRvIG5vdGljZSBlYXJsaWVyLCB0aGlzIGJyZWFrcyAnbWFr
ZSBodG1sZG9jcycgYnVpbGQNCj4gYmVjYXVzZSBEb2N1bWVudGF0aW9uL2dwdS8gaGFzIHJl
ZmVyZW5jZXMgdG8gdGhlIG9sZCBmaWxlbmFtZXM6DQo+IA0KPiBFcnJvcjogQ2Fubm90IG9w
ZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMNCj4gRXJyb3I6IENh
bm5vdCBvcGVuIGZpbGUgLi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgNCj4gRXJyb3I6
IENhbm5vdCBvcGVuIGZpbGUgLi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgNCj4gRXJy
b3I6IENhbm5vdCBvcGVuIGZpbGUgLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
DQo+IEVycm9yOiBDYW5ub3Qgb3BlbiBmaWxlIC4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYw0KPiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfY2VjLmMNCj4gRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2NlYy5jDQo+IEVycm9yOiBDYW5ub3Qgb3BlbiBmaWxlIC4vZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9jZWMuYw0KPiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfZHVhbF9tb2RlX2hlbHBlci5jDQo+IEVycm9yOiBDYW5ub3Qg
b3BlbiBmaWxlIC4vaW5jbHVkZS9kcm0vZHJtX2RwX2R1YWxfbW9kZV9oZWxwZXIuaA0KPiBF
cnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2luY2x1ZGUvZHJtL2RybV9kcF9kdWFsX21vZGVf
aGVscGVyLmgNCj4gRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2R1YWxfbW9kZV9oZWxwZXIuYw0KPiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAu
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfZHVhbF9tb2RlX2hlbHBlci5jDQo+IEVycm9yOiBD
YW5ub3Qgb3BlbiBmaWxlIC4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Yw0KPiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMNCj4gRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi9pbmNsdWRlL2Ry
bS9kcm1fZHBfbXN0X2hlbHBlci5oDQo+IEVycm9yOiBDYW5ub3Qgb3BlbiBmaWxlIC4vaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaA0KPiBFcnJvcjogQ2Fubm90IG9wZW4gZmls
ZSAuL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gRXJyb3I6IENh
bm5vdCBvcGVuIGZpbGUgLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
DQo+IEVycm9yOiBDYW5ub3Qgb3BlbiBmaWxlIC4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYw0KDQpBaCwgc29ycnkhIEknbGwgc2VuZCBhIGZpeCBsYXRlciB0b2Rh
eS4gVGhhbmtzIGZvciByZXBvcnRpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IEJSLA0KPiBKYW5pLg0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------ulNULGMrJfuJ9ToAfWQZhY6O--

--------------midUNQ2ZT1ULeQpYoCouh4gp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHpMwsFAwAAAAAACgkQlh/E3EQov+Ch
+Q//WOxNs7a1zJceYbH6NQ90DsEbvk+3sZc+qmdZkT7d6Xe7l7hUc/uOhI12P/tuRYaI/WNRiBd8
afW6JnFqfUFYMhxCpWux52TTX2nOkLSgt4SQHoQENh8LBuLFZ+tMwdjOzE9Pz5JqqMq7Dice+MMf
vDeZOyQekWY7Jqbb2lhHoCvKt8ZyY5fKMTyCnDbO3lWq/yjzU4rUl2XVzCvbF38opKhbaWJ3s0O3
XJiVuaqWt/olifZfxtaJo+be0rDCWPc3OfQPAEUZivjyjuHMy0LDQZdS6i1ZFgVfOi4nFvZa6zki
r+Q+ukdzMWRbdiSra2EBTjfs5o7HSEH3/LFOFe/x6gpv0l82cM/7gzBJ+HWYSbVBqy8KAOJgv3IF
M1HkZkuHPgUYKTWbCuSTwck3DAiZuUU+cHiVt+s5zAV8qAe9goru+ac/p1fkqC6neL1J9xeKTvA6
2wlVHVx9lNcUysXIXLpG9vg035Hc1W9uEo1Gi5u6B5mbhosJj5Wy4f0ms5q7UdkmgcNk/tW1yT5a
oaVv5mbgYpoJfMpc7J0KpgCW1jPCFP6ohLE6rp8gZHSzhomNSXHHvjdgjvYaKXq5ebXvNdUpg742
VjDRWCROVPUpfjmawz4o35xUpXGBJL2ZxNdM2JlFilp602IpWU4ihwtH0yNC7NqCcLlTINQUL0FY
4MA=
=D66u
-----END PGP SIGNATURE-----

--------------midUNQ2ZT1ULeQpYoCouh4gp--
