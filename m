Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68757602F09
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 16:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52D810E8DE;
	Tue, 18 Oct 2022 14:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D87510E8DE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 14:58:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A5A221921;
 Tue, 18 Oct 2022 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666105136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C3QOwW0S8Lj49qwoC3AEeqBTv2lDqJQ7dOYL1x7YpLI=;
 b=XmCnJsJ2AaJvzzA/FPgRDXh7hknf463KTVbBjB4O5A8AeHKn/MfZzAWRYoKDKukf1GTjFp
 QVzoAK1M5hvKecerWNBGfTBB/UXERHp7U/lZhq2AR1PTPcLwB3cUx8WB0w2/nDTkyYS7qN
 PbGVrdZw6H9W6sKITDtUGhPpstq6H58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666105136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C3QOwW0S8Lj49qwoC3AEeqBTv2lDqJQ7dOYL1x7YpLI=;
 b=kdyzMwHkInKgRuBiLJz/46l/o5t8fLX41NG3AD6TXNdZICwZYfi+cNGSx1mMmJrLmnTpb0
 PMAQNOsTF/Cg7iCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3055139D2;
 Tue, 18 Oct 2022 14:58:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pL5fOS+/TmM1UwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Oct 2022 14:58:55 +0000
Message-ID: <2b1cc893-ec3e-f146-d081-ba0a0ff4c0b0@suse.de>
Date: Tue, 18 Oct 2022 16:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: logging:convert dev_info to drm_info
Content-Language: en-US
To: jianengchencool <jianengchencool@gmail.com>, Sean Paul <sean@poorly.run>, 
 Eric Anholt <eric@anholt.net>
References: <13519195-1D4F-4B55-9AEB-271E1CFAFB58@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <13519195-1D4F-4B55-9AEB-271E1CFAFB58@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f0Rmy9S07ia06aRBGrdIoqt1"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f0Rmy9S07ia06aRBGrdIoqt1
Content-Type: multipart/mixed; boundary="------------xH5x09tfk70mycFsd2yKfLeX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jianengchencool <jianengchencool@gmail.com>, Sean Paul <sean@poorly.run>,
 Eric Anholt <eric@anholt.net>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <2b1cc893-ec3e-f146-d081-ba0a0ff4c0b0@suse.de>
Subject: Re: logging:convert dev_info to drm_info
References: <13519195-1D4F-4B55-9AEB-271E1CFAFB58@gmail.com>
In-Reply-To: <13519195-1D4F-4B55-9AEB-271E1CFAFB58@gmail.com>

--------------xH5x09tfk70mycFsd2yKfLeX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTAuMjIgdW0gMDk6MjAgc2NocmllYiBqaWFuZW5nY2hlbmNvb2w6DQo+
IEhpLA0KPiBJIHdhbnQgdG8gY29udmVydCBsb2dnaW5nIGRldl9pbmZvL3dhcm4vZXJyIHRv
IGRybV9pbmZvL3dhcm4vZXJyIA0KPiAgwqBpbsKgZHJpdmVycy9ncHUvZHJtL3BsMTExLCBz
byBJIHdhbnQgdG8gYXNrIGlmIHRoaXMgd29yayB3aWxsIGJlIG1lcmdlZO+8nw0KPiBUaGFu
a3MhDQoNCldlbGwsIGp1c3Qgc2VuZCB0aGUgcGF0Y2hlcyBmb3IgcmV2aWV3Lg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4gVE9ETyBsaXN0IGJlbG9377yaDQo+IA0K
PiANCj4gICAgIENvbnZlcnQgbG9nZ2luZyB0byBkcm1fKiBmdW5jdGlvbnMgd2l0aCBkcm1f
ZGV2aWNlIHBhcmFtYXRlcsK2DQo+ICAgICA8aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvZ3B1L3RvZG8uaHRtbCNjb252ZXJ0LWxvZ2dpbmctdG8tZHJtLWZ1bmN0
aW9ucy13aXRoLWRybS1kZXZpY2UtcGFyYW1hdGVyPg0KPiANCj4gRm9yIGRyaXZlcnMgd2hp
Y2ggY291bGQgaGF2ZSBtdWx0aXBsZSBpbnN0YW5jZXMsIGl0IGlzIG5lY2Vzc2FyeSB0byAN
Cj4gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHdoaWNoIGlzIHdoaWNoIGluIHRoZSBsb2dzLiBT
aW5jZSANCj4gRFJNX0lORk8vV0FSTi9FUlJPUiBkb27igJl0IGRvIHRoaXMsIGRyaXZlcnMg
dXNlZCBkZXZfaW5mby93YXJuL2VyciB0byANCj4gbWFrZSB0aGlzIGRpZmZlcmVudGlhdGlv
bi4gV2Ugbm93IGhhdmUgZHJtXyogdmFyaWFudHMgb2YgdGhlIGRybSBwcmludCANCj4gZnVu
Y3Rpb25zLCBzbyB3ZSBjYW4gc3RhcnQgdG8gY29udmVydCB0aG9zZSBkcml2ZXJzIGJhY2sg
dG8gdXNpbmcgDQo+IGRybS1mb3JtYXR0ZWQgc3BlY2lmaWMgbG9nIG1lc3NhZ2VzLg0KPiAN
Cj4gQmVmb3JlIHlvdSBzdGFydCB0aGlzIGNvbnZlcnNpb24gcGxlYXNlIGNvbnRhY3QgdGhl
IHJlbGV2YW50IG1haW50YWluZXJzIA0KPiB0byBtYWtlIHN1cmUgeW91ciB3b3JrIHdpbGwg
YmUgbWVyZ2VkIC0gbm90IGV2ZXJ5b25lIGFncmVlcyB0aGF0IHRoZSBEUk0gDQo+IGRtZXNn
IG1hY3JvcyBhcmUgYmV0dGVyLg0KPiANCj4gDQo+IAkNCj4gTmVpbA0KPiBqaWFuZW5nY2hl
bmNvb2xAZ21haWwuY29tDQo+IA0KPiA8aHR0cHM6Ly9tYWFzLm1haWwuMTYzLmNvbS9kYXNo
aS13ZWItZXh0ZW5kL2h0bWwvcHJvU2lnbmF0dXJlLmh0bWw/ZnRsSWQ9MSZuYW1lPWppYW5l
bmdjaGVuY29vbCZ1aWQ9amlhbmVuZ2NoZW5jb29sJTQwZ21haWwuY29tJmljb25Vcmw9aHR0
cHMlM0ElMkYlMkZtYWlsLW9ubGluZS5ub3Nkbi4xMjcubmV0JTJGcWl5ZWxvZ28lMkZkZWZh
dWx0QXZhdGFyLnBuZyZpdGVtcz0lNUIlMjJqaWFuZW5nY2hlbmNvb2wlNDBnbWFpbC5jb20l
MjIlNUQ+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------xH5x09tfk70mycFsd2yKfLeX--

--------------f0Rmy9S07ia06aRBGrdIoqt1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNOvy8FAwAAAAAACgkQlh/E3EQov+C3
0A/+N98YzSfuO54GoZ9L7jPF2oqT1TzLU43hmnycPlZz/Fs+FpL6Dr/ie11lQ7/QULP4SOe8/VD1
2Ec9HZB1tO3rRCMlEKlP+bWrZSIqvU1Lm7t0EBu5yhajsj/jyVc8yTF+Aftxnpj61RkTUbIXyS14
jq7Y6/mIW922e61RXf9386SzkfXp1MLhmAbgyYul0DOWxoZxGioP50cdblbEybSaTffYWPmjkJB0
RhjKQt0hN2L8puw9eRkG/TMSLz97ptTpRSZVO6/PvCb06YtuHWhq+f6Y6m93mwtHZG5YPaX6AjDQ
1KrB6276aJhQWnQcdSGehZnCIC5rsYXoN88vS3zenfnxY0mazZNbH3GCRBykIb7YJNDVx820BGST
AkQl38imzO3pJxmw161gzjDYhq5kMZ8XIkVH7O2XKV3ADG99L1zThQ7rz/clFDbVDrAelX5BShBo
2OKRt2Spez0KbUUb6k7kNEPmzOhePB2ippTCwr9H8MB80u69wChwJ6jdWfQ7gGI3uF4dhbIh2xUp
oAQffPgueNsBIYt5wGh0egY88/7Vu92GitkYXHHkej4nS67nU4Pq9j2cApg0fht+/dOwJjRu3jwa
tUea1er2KKGV3bK8YbToLAjouRI6wkMlRe6DkvtKUUjq4pB/4jQr2B2cIfcE3Eg9AwYzLtpsNElS
icI=
=UQBg
-----END PGP SIGNATURE-----

--------------f0Rmy9S07ia06aRBGrdIoqt1--
