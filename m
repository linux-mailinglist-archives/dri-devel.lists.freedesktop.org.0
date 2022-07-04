Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCD565BED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDB210F8BC;
	Mon,  4 Jul 2022 16:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179D10E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 07:10:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED4E11F9F6;
 Mon,  4 Jul 2022 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656918613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HdYnZvJOj8QLNY9d5f2WBVXYvvZ+GdCQ33Jg3X+Iaz4=;
 b=I56PpLIRkd/kBws5RN8xnzdmZD2UdLYAKTHD0SJq+uuy21XVfzsdhjURW+DXXRc2NkmPlf
 rfRO/ZlWEzfie3MkCU3zEJ11aE9rDC+XQBbH3F/Seg6xoaNJuoqCfkfVoc7Ft1VjHuZTou
 FiSS58KxwPvry4ZINewXsJCi+6KSOK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656918613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HdYnZvJOj8QLNY9d5f2WBVXYvvZ+GdCQ33Jg3X+Iaz4=;
 b=9/plCS2vSJ3D+KDNsvgh2F1EtJp0xeSdf+uvjOATerJT6iCf3YTGsev23TrJlaPTHnrgI/
 vuGfatvLjmZHv7BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A098013451;
 Mon,  4 Jul 2022 07:10:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9XczJlWSwmJ/GgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Jul 2022 07:10:13 +0000
Message-ID: <3abf6d20-e6a1-a3f2-5852-25ab118ab569@suse.de>
Date: Mon, 4 Jul 2022 09:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/3] Improve vfio-pci primary GPU assignment behavior
Content-Language: en-US
To: alex.williamson@redhat.com, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org,
 javierm@redhat.com, lersek@redhat.com, kraxel@redhat.com
References: <20220622140134.12763-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220622140134.12763-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e8nX9ljWDsHIX04OUEvaP2HZ"
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e8nX9ljWDsHIX04OUEvaP2HZ
Content-Type: multipart/mixed; boundary="------------5wt9dk06K7MjoRfpNceFwlaI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alex.williamson@redhat.com, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org,
 javierm@redhat.com, lersek@redhat.com, kraxel@redhat.com
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <3abf6d20-e6a1-a3f2-5852-25ab118ab569@suse.de>
Subject: Re: [PATCH v3 0/3] Improve vfio-pci primary GPU assignment behavior
References: <20220622140134.12763-1-tzimmermann@suse.de>
In-Reply-To: <20220622140134.12763-1-tzimmermann@suse.de>

--------------5wt9dk06K7MjoRfpNceFwlaI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoaXMgcGF0Y2hzZXQgaGFzIG1lYW53aGlsZSByZWFjaGVkIGRybS1uZXh0IGFu
ZCBzaG91bGQgZ28gaW50byBMaW51eCB2NS4yMC4NCg0KIA0KaHR0cHM6Ly9jZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9kcm0vZHJtL2NvbW1pdC8/aWQ9ZDE3Mzc4MDYyMDc5MmM3MjU1MDZiMGYz
YzVlYzUyYzdmYmFjMWRiMA0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpBbSAyMi4wNi4y
MiB1bSAxNjowMSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPiAoSSdtIHRha2luZyBv
dmVyIHRoaXMgcGF0Y2hzZXQgZnJvbSBBbGV4LCBbMV0gYXMgd2UgYWdyZWVkIHRoYXQgaXQg
c2hvdWxkDQo+IGdvIHRocm91Z2ggdGhlIGRybS1taXNjIHRyZWUuKQ0KPiANCj4gV2hlbiBh
c3NpZ25pbmcgYSBwcmltYXJ5IGdyYXBoaWNzIGRldmljZSB0byBWTSB0aHJvdWdoIHZmaW8t
cGNpIGRldmljZQ0KPiBhc3NpZ25tZW50LCB1c2VycyBvZnRlbiBwcmV2ZW50IGJpbmRpbmcg
b2YgdGhlIG5hdGl2ZSBQQ0kgZ3JhcGhpY3MNCj4gZHJpdmVyIHRvIGF2b2lkIGRldmljZSBp
bml0aWFsaXphdGlvbiBjb25mbGljdHMsIGhvd2V2ZXIgZmlybXdhcmUNCj4gY29uc29sZSBk
cml2ZXJzIG1heSBzdGlsbCBiZSBhdHRhY2hlZCB0byB0aGUgZGV2aWNlIHdoaWNoIGNhbiBv
ZnRlbiBiZQ0KPiBjdW1iZXJzb21lIHRvIG1hbnVhbGx5IHVuYmluZCBvciBleGNsdWRlIHZp
YSBjbWRsaW5lIG9wdGlvbnMuDQo+IA0KPiBUaGlzIHNlcmllcyBwcm9wb3NlcyB0byBtb3Zl
IHRoZSBEUk0gYXBlcnR1cmUgaGVscGVycyBvdXQgdG8NCj4gZHJpdmVycy92aWRlby8gdG8g
bWFrZSBpdCBtb3JlIGFjY2Vzc2libGUgdG8gZHJpdmVycyBsaWtlIHZmaW8tcGNpLA0KPiB3
aGljaCBoYXZlIG5laXRoZXIgZGVwZW5kZW5jaWVzIG9uIERSTSBjb2RlIG5vciBhIHN0cnVj
dCBkcm1fZHJpdmVyDQo+IHRvIHByZXNlbnQgdG8gZXhpc3RpbmcgaW50ZXJmYWNlcy4gIHZm
aW8tcGNpIGNhbiB0aGVuIHRyaXZpYWxseSBjYWxsDQo+IGludG8gdGhlIGFwZXJ0dXJlIGhl
bHBlcnMgdG8gcmVtb3ZlIGNvbmZsaWN0aW5nIGRyaXZlcnMsIHJhdGhlciB0aGFuDQo+IG9w
ZW4gY29kaW5nIGl0IG91cnNlbHZlcyBhcyB3YXMgcHJvcG9zZWQgd2l0aCBhIG5ldyBzeW1i
b2wgZXhwb3J0IGluDQo+IHYxIG9mIHRoaXMgc2VyaWVzLiBbMl0NCj4gDQo+IHYzOg0KPiAJ
KiBhZGQgYXBlcnR1cmVfIHByZWZpeCB0byBhbGwgaW50ZXJmYWNlcyAoSmF2aWVyKQ0KPiAJ
KiBpbXByb3ZlZCBkb2N1bWVudGF0aW9uIChKYXZpZXIpDQo+IAkqIHVwZGF0ZSBNQUlOVEFJ
TkVSUyBbM10gYW5kIGFkZCBhcGVydHVyZSBoZWxwZXJzDQo+IA0KPiBbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzE2NTU0MTAyMDU2My4xOTU1ODI2LjE2MzUwODg4NTk1OTQ1
NjU4MTU5LnN0Z2l0QG9tZW4vDQo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MTY1NDUzNzk3NTQzLjM1OTI4MTYuNjM4MTc5MzM0MTM1MjU5NTQ2MS5zdGdpdEBvbWVuLw0K
PiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTE4MTgzMDA2LjE0NTQ4
LTItdHppbW1lcm1hbm5Ac3VzZS5kZS8NCj4gDQo+IEFsZXggV2lsbGlhbXNvbiAoMSk6DQo+
ICAgIHZmaW8vcGNpOiBSZW1vdmUgY29uc29sZSBkcml2ZXJzDQo+IA0KPiBUaG9tYXMgWmlt
bWVybWFubiAoMik6DQo+ICAgIE1BSU5UQUlORVJTOiBCcm9hZGVuIHNjb3BlIG9mIHNpbXBs
ZWRybSBlbnRyeQ0KPiAgICBkcm06IEltcGxlbWVudCBEUk0gYXBlcnR1cmUgaGVscGVycyB1
bmRlciB2aWRlby8NCj4gDQo+ICAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2FwZXJ0dXJl
LnJzdCB8ICAxMyArDQo+ICAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2luZGV4LnJzdCAg
ICB8ICAgMSArDQo+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXBlcnR1cmUuYyAgICAgICAgfCAx
NzggKy0tLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcgICAg
ICAgICAgfCAgIDEgKw0KPiAgIGRyaXZlcnMvdmZpby9wY2kvdmZpb19wY2lfY29yZS5jICAg
ICAgfCAgIDUgKw0KPiAgIGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAgICAgICAgICAg
fCAgIDYgKw0KPiAgIGRyaXZlcnMvdmlkZW8vTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAg
IDIgKw0KPiAgIGRyaXZlcnMvdmlkZW8vYXBlcnR1cmUuYyAgICAgICAgICAgICAgfCAzNTEg
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBkcml2ZXJzL3ZpZGVvL2NvbnNvbGUv
S2NvbmZpZyAgICAgICAgIHwgICAxICsNCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25m
aWcgICAgICAgICAgIHwgICA3ICstDQo+ICAgaW5jbHVkZS9saW51eC9hcGVydHVyZS5oICAg
ICAgICAgICAgICB8ICA1NiArKysrDQo+ICAgMTIgZmlsZXMgY2hhbmdlZCwgNDU2IGluc2Vy
dGlvbnMoKyksIDE3MSBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kcml2ZXItYXBpL2FwZXJ0dXJlLnJzdA0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC9hcGVydHVyZS5oDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6IDcwMjVj
MWYxMTFiN2EwNTcyNDNkZTQ1YmQ1NmMxNGI5MDYyNDJhNTMNCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------5wt9dk06K7MjoRfpNceFwlaI--

--------------e8nX9ljWDsHIX04OUEvaP2HZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLCklQFAwAAAAAACgkQlh/E3EQov+C2
iA/+IA7AW13FyVLd6ey58HTjVIY7Qbxvn9EqqqGpYg7hKQ/OD7DqVy3zH8VUpFNKf29sI6/SBm78
HWceJlnlMttv0pRjnlELjKheJhoDatIsQY9TgyIo/ZrD27RlJcPhmOGR3GeuyxrEL8B8mn9y6uBB
TCui6hMW1l099VhZCklYN3hqI8DZGPi4iuBNC3X+IpqOF0pVhqV5Lf0+htTI+uNpo5YykRwNER3X
fD6N1HN+rqZh9q1ghoprxUbgilsXYL+zvaRgjaMBVLbtB6uNMEfgp+iVilMvi2Yow6ROf2IMSqg/
6TeP9rHLEHk+7uMtBAT/xJ+yiDfMN9OH1l8st2BjGewQKqhTJ3aGghULL0DSN6P/Kw/TIVFfZbQ1
t/x22ZKdezT287Rfjmci7KdnV2Yn9uOfKUIbzJqAPIvufQOT2Sn8YapKWe86zvRmWhuCDcY5iVK8
g2vBTEny0atb4w2qMIDjm/qHFbq7VE/X/cDZdlYg59i7eVB25cIGPOTFgiog/3Wmo8DxPzy7IwKj
XMIPglW0bvgBY3+LsIb+W4sj0Xghb2utxof3S0yNmgjcWKcHnIFgwQ4sOlwTGBYIdXQM3tE37Vqp
PhCjgb+M+3Uz6q/TZpbjJW2omYctlJYlX1kf0i+b0O+W91HpV6pBWmd0QToM0Z9WQOftDPyawa3c
9a4=
=93U1
-----END PGP SIGNATURE-----

--------------e8nX9ljWDsHIX04OUEvaP2HZ--
