Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF45819A7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 20:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC5B99421;
	Tue, 26 Jul 2022 18:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142D999412
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 18:25:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDF183428E;
 Tue, 26 Jul 2022 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658859899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hnLmPIiFFYZuGpXE4SrUO5VoOcw7lBqGPzHqbZ7yw6U=;
 b=aVmW6IJ24qpdKf1fkE0E/5Agi/j66TD2srhbsOvMPDUFVFbO3NxX8DbmkI0IpM105BQt0R
 fwRngYSaHQYB7QPnKTzKPn3SpaH4nSqSUgmRDDC/HEVPP+oj6FzpWJOrcuJdvRkrtFTA/r
 q3aZrqachHb2p2Y8pgvji05ebDXP4tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658859899;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hnLmPIiFFYZuGpXE4SrUO5VoOcw7lBqGPzHqbZ7yw6U=;
 b=yJglRJmW0Ajflls4VVejEQcA3QMAmgSOriNHO8P9Q5fPFy/RdtYx55PvtsUfyhGyZee/wK
 9ucVFfab+Slm+ZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4B3913A7C;
 Tue, 26 Jul 2022 18:24:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ye8BJ3sx4GIEGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Jul 2022 18:24:59 +0000
Message-ID: <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
Date: Tue, 26 Jul 2022 20:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Language: en-US
To: Kevin Brace <kevinbrace@gmx.com>, dri-devel@lists.freedesktop.org
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220725235359.20516-7-kevinbrace@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Jiu53PtoX0K5Y3i1j6qJS6t"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Jiu53PtoX0K5Y3i1j6qJS6t
Content-Type: multipart/mixed; boundary="------------u8FJ7lDa8UPmIlDIREGLnxWO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Brace <kevinbrace@gmx.com>, dri-devel@lists.freedesktop.org
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Message-ID: <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
In-Reply-To: <20220725235359.20516-7-kevinbrace@gmx.com>

--------------u8FJ7lDa8UPmIlDIREGLnxWO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMDE6NTMgc2NocmllYiBLZXZpbiBCcmFjZToNCj4gRnJv
bTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+DQo+IA0K
PiBDaGFuZ2VkIHRoZSB1QVBJLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gQnJhY2Ug
PGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+DQo+IC0tLQ0KPiAgIGluY2x1ZGUv
dWFwaS9kcm0vdmlhX2RybS5oIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaCBi
L2luY2x1ZGUvdWFwaS9kcm0vdmlhX2RybS5oDQo+IGluZGV4IGExZTEyNWQ0MjIwOC4uZTlk
YTQ1Y2UxMzBhIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaA0K
PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaA0KPiBAQCAtMSw0ICsxLDUgQEAN
Cj4gICAvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjAgS2V2aW4gQnJhY2UNCj4gICAgKiBD
b3B5cmlnaHQgMTk5OC0yMDAzIFZJQSBUZWNobm9sb2dpZXMsIEluYy4gQWxsIFJpZ2h0cyBS
ZXNlcnZlZC4NCj4gICAgKiBDb3B5cmlnaHQgMjAwMS0yMDAzIFMzIEdyYXBoaWNzLCBJbmMu
IEFsbCBSaWdodHMgUmVzZXJ2ZWQuDQo+ICAgICoNCj4gQEAgLTE2LDEwICsxNywxMCBAQA0K
PiAgICAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJB
TlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SDQo+ICAgICogSU1QTElFRCwgSU5DTFVESU5H
IEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFks
DQo+ICAgICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTi1JTkZS
SU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMDQo+IC0gKiBWSUEsIFMzIEdSQVBISUNTLCBB
TkQvT1IgSVRTIFNVUFBMSUVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBP
Ug0KPiAtICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05U
UkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsDQo+IC0gKiBBUklTSU5HIEZST00sIE9VVCBPRiBP
UiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIN
Cj4gLSAqIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4NCj4gKyAqIFRIRSBBVVRIT1JTLCBD
T1BZUklHSFQgSE9MREVSUywgQU5EL09SIElUUyBTVVBQTElFUlMgQkUgTElBQkxFIEZPUiBB
TlkNCj4gKyAqIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQNCj4gKyAqIE9SIE9USEVSV0lTRSwgQVJJ
U0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBP
Ug0KPiArICogVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuDQo+
ICAgICovDQo+ICAgI2lmbmRlZiBfVklBX0RSTV9IXw0KPiAgICNkZWZpbmUgX1ZJQV9EUk1f
SF8NCj4gQEAgLTgxLDYgKzgyLDExIEBAIGV4dGVybiAiQyIgew0KPiAgICNkZWZpbmUgRFJN
X1ZJQV9ETUFfQkxJVCAgICAgICAgMHgwZQ0KPiAgICNkZWZpbmUgRFJNX1ZJQV9CTElUX1NZ
TkMgICAgICAgMHgwZg0KPiANCj4gKyNkZWZpbmUJRFJNX1ZJQV9HRU1fQ1JFQVRFCTB4MTAN
Cj4gKyNkZWZpbmUJRFJNX1ZJQV9HRU1fTUFQCQkweDExDQo+ICsjZGVmaW5lCURSTV9WSUFf
R0VNX1VOTUFQCTB4MTINCg0KVGhpcyBsb29rcyBhIGxvdCBsaWtlIGlvY3RsIG9wcyBmb3Ig
dXNpbmcgYWNjZWxlcmF0ZWQgSFcgYnVmZmVycy4gQnV0IA0KdGhlIHBhdGNoIGlzIG5lYXIg
dGhlIGVuZCBvZiB0aGUgc2VyaWVzIGFuZCB5b3Ugc2FpZCBpbiB0aGUgc2VyaWVzJyANCmNv
dmVyIGxldHRlciB0aGF0IHRoZXJlJ3Mgbm8gYWNjZWxlcmF0aW9uLiBJIHN1c3BlY3QgdGhh
dCB0aGVzZSANCmNvbnN0YW50cyBhcmUgY3VycmVudGx5IHVudXNlZD8gIElmIHNvLCBwbGVh
c2UgZHJvcCB0aGUgcGF0Y2ggZnJvbSB0aGUgDQpzZXJpZXMuIElmIGNhbiBiZSBtZXJnZWQg
bGF0ZXIgd2hlbiBzb21ldGhpbmcgcmVhbGx5IGRlcGVuZHMgb24gaXQuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gKw0KPiArDQo+ICAgI2RlZmluZSBEUk1fSU9DVExfVklBX0FM
TE9DTUVNCSAgRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9WSUFfQUxMT0NNRU0s
IGRybV92aWFfbWVtX3QpDQo+ICAgI2RlZmluZSBEUk1fSU9DVExfVklBX0ZSRUVNRU0JICBE
Uk1fSU9XKCBEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9GUkVFTUVNLCBkcm1fdmlhX21l
bV90KQ0KPiAgICNkZWZpbmUgRFJNX0lPQ1RMX1ZJQV9BR1BfSU5JVAkgIERSTV9JT1dSKERS
TV9DT01NQU5EX0JBU0UgKyBEUk1fVklBX0FHUF9JTklULCBkcm1fdmlhX2FncF90KQ0KPiBA
QCAtOTcsNiArMTAzLDEwIEBAIGV4dGVybiAiQyIgew0KPiAgICNkZWZpbmUgRFJNX0lPQ1RM
X1ZJQV9ETUFfQkxJVCAgICBEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fVklBX0RN
QV9CTElULCBkcm1fdmlhX2RtYWJsaXRfdCkNCj4gICAjZGVmaW5lIERSTV9JT0NUTF9WSUFf
QkxJVF9TWU5DICAgRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9CTElUX1NZ
TkMsIGRybV92aWFfYmxpdHN5bmNfdCkNCj4gDQo+ICsjZGVmaW5lCURSTV9JT0NUTF9WSUFf
R0VNX0NSRUFURQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9HRU1fQ1JF
QVRFLCBzdHJ1Y3QgZHJtX3ZpYV9nZW1fY3JlYXRlKQ0KPiArI2RlZmluZQlEUk1fSU9DVExf
VklBX0dFTV9NQVAJCURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fVklBX0dFTV9N
QVAsIHN0cnVjdCBkcm1fdmlhX2dlbV9tYXApDQo+ICsjZGVmaW5lCURSTV9JT0NUTF9WSUFf
R0VNX1VOTUFQCQlEUk1fSU9SKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fVklBX0dFTV9VTk1B
UCwgc3RydWN0IGRybV92aWFfZ2VtX3VubWFwKQ0KPiArDQo+ICAgLyogSW5kaWNlcyBpbnRv
IGJ1Zi5TZXR1cCB3aGVyZSB2YXJpb3VzIGJpdHMgb2Ygc3RhdGUgYXJlIG1pcnJvcmVkIHBl
cg0KPiAgICAqIGNvbnRleHQgYW5kIHBlciBidWZmZXIuICBUaGVzZSBjYW4gYmUgZmlyZWQg
YXQgdGhlIGNhcmQgYXMgYSB1bml0LA0KPiAgICAqIG9yIGluIGEgcGllY2V3aXNlIGZhc2hp
b24gYXMgcmVxdWlyZWQuDQo+IEBAIC0yNzUsNiArMjg1LDIzIEBAIHR5cGVkZWYgc3RydWN0
IGRybV92aWFfZG1hYmxpdCB7DQo+ICAgCWRybV92aWFfYmxpdHN5bmNfdCBzeW5jOw0KPiAg
IH0gZHJtX3ZpYV9kbWFibGl0X3Q7DQo+IA0KPiArc3RydWN0IGRybV92aWFfZ2VtX2NyZWF0
ZSB7DQo+ICsJdWludDY0X3Qgc2l6ZTsNCj4gKwl1aW50MzJfdCBhbGlnbm1lbnQ7DQo+ICsJ
dWludDMyX3QgZG9tYWluOw0KPiArCXVpbnQzMl90IGhhbmRsZTsNCj4gKwl1aW50NjRfdCBv
ZmZzZXQ7DQo+ICt9Ow0KPiArDQo+ICtzdHJ1Y3QgZHJtX3ZpYV9nZW1fbWFwIHsNCj4gKwl1
aW50MzJfdCBoYW5kbGU7DQo+ICsJdWludDY0X3QgbWFwX29mZnNldDsNCj4gK307DQo+ICsN
Cj4gK3N0cnVjdCBkcm1fdmlhX2dlbV91bm1hcCB7DQo+ICsJdWludDMyX3QgaGFuZGxlOw0K
PiArfTsNCj4gKw0KPiAgICNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQ0KPiAgIH0NCj4gICAj
ZW5kaWYNCj4gLS0NCj4gMi4zNS4xDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------u8FJ7lDa8UPmIlDIREGLnxWO--

--------------0Jiu53PtoX0K5Y3i1j6qJS6t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLgMXsFAwAAAAAACgkQlh/E3EQov+C6
EQ//QW2RlCif93BKraj946icuXTfykaY8wjLbFPenM+PdQ6TOiMAjAas1VrORWthpyA5LvesOjYG
rJ3GYwY/Q0tZhf3hOL0TN3T4GKMZCGzal3Rrg35HmK+LIyI1UwXx4y1ndSDPZORbviK0CWSo2QeR
W7E1Kl5CeS4DVCGSLBv7l2msjrrQ9Rgbymgq8cRIKP1syjTv/P9BEx+GXZ56OM/ODq7onyl3ucsY
HehCI6MxbcMpwbuGKPPSLAq1sEDmCpBfj6S0NJ33QLtHDig0VNkyrDPqmvl/DozSoCEccfyN5Xgt
5W3k6VB8IbFCcMN1yMKQk6uctUb5FIGwbLVD6Dys5xGLHmSk7Njuw4Is85jyEbui6pnaXF9H0iaD
Wh4jXbKIS3h0MIAulV9DO6loLHCJy2Qmosgi3deT2BVc/rk/YrGuqX828mY5rpmKcRyRJrU9Xfq5
APZUf7KrD/j6uJ0nnUi1xRFbGf/Kwl6hsBH7ZTM7kgXlVjzHy0t8ZXHkAHms65GrvvCc9FKjm956
i6/M7xDusa0RApmMNr27t2SRloy3nh0/0zaayIQ4LutYI8nUBAvpXE2Z+AxFRtYsXyb0zgZ22DVz
GZW0IJQWa89DAQV4/bbOoxl5K9nDVOT2U84gnPmE7IaAdfjm6oA4qWBHer370CKsSOkYP/dviBRK
1JI=
=Vej9
-----END PGP SIGNATURE-----

--------------0Jiu53PtoX0K5Y3i1j6qJS6t--
