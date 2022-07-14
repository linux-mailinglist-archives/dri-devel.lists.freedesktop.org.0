Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFDC574685
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2115A3616;
	Thu, 14 Jul 2022 08:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB57A3618
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:17:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A64F207F7;
 Thu, 14 Jul 2022 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657786635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yhj8qiqjdq5BbLM4Lo7L2hKwgNhtcDwnOJTTDBzkzMc=;
 b=hX39KZ0C3wsJ4Vvvmqad0Kf0ZNBtrzOAP2PwBYes7xV6qbRw3vK9oTx89QGZfTW6MUA2Lk
 i0xgIX1/plBpa76K3ky1ba9RFW4er2L2D7vMIs1OzBC+EoYeG8ixFRcm+mANt10LrZeoVL
 sAxHUdct8PVXprVlV+eGAs8thk5FDy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657786635;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yhj8qiqjdq5BbLM4Lo7L2hKwgNhtcDwnOJTTDBzkzMc=;
 b=0mJiNNQhDOUwKPv+bI7OHptQcLfu/4EB//T6oGVkluwrVcxBPTo4aoAwljoxSdArRobDdp
 r7BX81qRRvrdYwAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6F3213748;
 Thu, 14 Jul 2022 08:16:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YVd1N/vQz2IiVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Jul 2022 08:16:59 +0000
Message-ID: <bc11b784-00b2-a494-112a-2c3dbda19381@suse.de>
Date: Thu, 14 Jul 2022 10:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/11] drm/via: Make via a single file driver
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220713170202.1798216-1-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220713170202.1798216-1-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mH18OEQogPZTxDshZbLPhAu1"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mH18OEQogPZTxDshZbLPhAu1
Content-Type: multipart/mixed; boundary="------------lovtXqaYX2R0RAc9GZXqokeR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <bc11b784-00b2-a494-112a-2c3dbda19381@suse.de>
Subject: Re: [PATCH v2 0/11] drm/via: Make via a single file driver
References: <20220713170202.1798216-1-sam@ravnborg.org>
In-Reply-To: <20220713170202.1798216-1-sam@ravnborg.org>

--------------lovtXqaYX2R0RAc9GZXqokeR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtLA0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQoNCmZvciB0aGUgbmV3IGNoYW5nZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCkFtIDEzLjA3LjIyIHVtIDE5OjAxIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPiBXZSBo
YXZlIGFuIHVwY29taW5nIG9wZW5jaHJvbWUgZHJpdmVyIGZvciBWSUEgd2hlcmUgc29tZQ0K
PiBvZiB0aGUgZmlsZXMgY29uZmxpY3RzIHdpdGggdGhlIGV4aXN0aW5nIHZpYSBkcml2ZXIu
DQo+IA0KPiBJdCBpcyBub3QgYWNjZXB0YWJsZSB0byBqdXN0IGRlbGV0ZSB0aGUgZXhpc3Rp
bmcgRFJJMQ0KPiBiYXNlZCBkcml2ZXIgYXMgdGhlcmUgYXJlIG1vc3QgbGlrZWx5IHVzZXJz
IG91dCB0aGVyZSwNCj4gc28gYSBkaWZmZXJlbnQgYXBwcm9hY2ggd2FzIHJlcXVpcmVkLg0K
PiANCj4gSXQgd2FzIGRpc2NjdXNzZWQgd2hhdCB0byBkbyBhbmQgdGhlIGxlYXN0IGludmFz
aXZlDQo+IHNvbHV0aW9uIHdhcyB0byBrZWVwIHRoZSBEUkkxIGRyaXZlciBpbiB0aGUgY3Vy
cmVudA0KPiBkaXJlY3RvcnkgYXMgYSBzaW5nbGUgZmlsZS4NCj4gDQo+IFRob21hcyBaaW1t
ZXJtYW5uIGFscmVhZHkgcG9zdGVkIGEgcGF0Y2ggdG8gZG8gdGhlDQo+IHNhbWUgYnV0IGl0
IGF0dGVtcGVkIHRvIGhhdmUgYSBzaW5nbGUgZHJpdmVyDQo+IGZvciB0aGUgRFJJMSBhbmQg
dGhlIHVwY29taW5nIG5ldyBkcml2ZXIuDQo+IA0KPiBUaGlzIHBhdGNoc2V0IGVtYmVkcyB0
aGUgZmlsZXMgb25lIGJ5IG9uZSB0byBtYWtlIHRoZQ0KPiBkaWZmcyByZW1vdGVseSByZWFk
YWJsZSBhbmQgZW5kIHVwIHdpdGggYW4gaW5kZXBlbmRlbnQNCj4gRFJJMSBkcml2ZXIuDQo+
IA0KPiBUaGUgZHJpdmVyIHdhcyBidWlsdCB0ZXN0ZWQgZm9yIGVhY2ggc3RlcC4NCj4gDQo+
IHYyOg0KPiAgICAtIERyb3AgdGhlIHJlbmFtZSBvZiB0aGUgZHJpdmVyIC0ga2VlcCB0aGUg
bmFtZSB2aWEuDQo+ICAgICAgV2UgY2FuIG5hbWUgdGhlIG5ldyBkcml2ZXIgdmlha21zIG9y
IG9wZW5jaHJvbWUgc28NCj4gICAgICB0aGVyZSBpcyBubyBjb25mdXNpb24gaW4gdXNlcnNw
YWNlIGlmIHRoZSBvbGQgb3INCj4gICAgICB0aGUgbmV3IGRyaXZlciBpcyB1c2VkLg0KPiAg
ICAtIEFkZCBhIGZldyBwYXRjaGVzIHRvIG1ha2UgdmlhXzNkX3JlZyBtb3JlIHJlYWRhYmxl
LA0KPiAgICAgIHdoaWNoIGhhcyB0aGUgbmljZSBzaWRlLWVmZmVjdCB0aGF0IGl0IGlzIG5v
dyBjaGVja3BhdGNoDQo+ICAgICAgY2xlYW4uDQo+ICAgIC0gQWRkZWQgS2V2aW4gYXMgY2M6
IG9uIGFsbCBwYXRjaGVzDQo+IA0KPiBUaGlzIHNldCBvZiBwYXRjaGVzIHNob3VsZCBtYWtl
IGl0IHNpbXBsZXIgdG8gYWRkIHRoZSBuZXcNCj4gb3BlbmNocm9tZSBkcml2ZXIsIGFuZCBJ
IGFtIGhhcHB5IHRvIGFzc2lzdCBpZiB0aGVyZSBhcmUNCj4gb3BlbiBxdWVzdGlvbnMgaG93
IHRvIGRvIGl0Lg0KPiANCj4gTm90ZTogVGhlIHBhdGNoZXMgaGFzIHNlZW4gemVybyBydW4t
dGltZSB0ZXN0aW5nIC0gSSBvbmx5DQo+IGtub3cgdGhleSBidWlsZHMgaW4gbXkgc2V0dXAg
KGZvciBzZXZlcmFsIGFyY2hzKS4NCj4gDQo+IAlTYW0NCj4gDQo+IFNhbSBSYXZuYm9yZyAo
MTMpOg0KPiAgICAgICAgZHJtL3ZpYTogUmVuYW1lIHZpYV9kcnYgdG8gdmlhX2RyaTENCj4g
ICAgICAgIGRybS92aWE6IEVtYmVkIHZpYV9kbWEgaW4gdmlhX2RyaTENCj4gICAgICAgIGRy
bS92aWE6IEVtYmVkIHZpYV9tYXAgaW4gdmlhX2RyaTENCj4gICAgICAgIGRybS92aWE6IEVt
YmVkIHZpYV9tbSBpbiB2aWFfZHJpMQ0KPiAgICAgICAgZHJtL3ZpYTogRW1iZWQgdmlhX3Zp
ZGVvIGluIHZpYV9kcmkxDQo+ICAgICAgICBkcm0vdmlhOiBFbWJlZCB2aWFfaXJxIGluIHZp
YV9kcmkxDQo+ICAgICAgICBkcm0vdmlhOiBFbWJlZCB2aWFfZG1hYmxpdCBpbiB2aWFfZHJp
MQ0KPiAgICAgICAgZHJtL3ZpYTogRW1iZWQgdmlhX3ZlcmlmaWVyIGluIHZpYV9kcmkxDQo+
ICAgICAgICBkcm0vdmlhOiBFbWJlZCB2aWFfZHJ2LmggaW4gdmlhX2RyaTENCj4gICAgICAg
IGRybS92aWE6IFVwZGF0ZSB0byB0aGUgbGF0ZXN0IHZpYV8zZF9yZWcgaGVhZGVyDQo+ICAg
ICAgICBkcm0vdmlhOiBVc2UgU1BEWCB0YWcgZm9yIE1JVCBsaWNlbnNlIGluIHZpYV8zZF9y
ZWcgaGVhZGVyDQo+ICAgICAgICBkcm0vdmlhOiBNYWtlIG1hY3JvcyByZWFkYWJsZSBpbiB0
aGUgdmlhXzNkX3JlZyBoZWFkZXINCj4gICAgICAgIGRybS92aWE6IEZpeCBzdHlsZSBpc3N1
ZXMgaW4gdmlhXzNkX3JlZyBoZWFkZXINCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpYS9N
YWtlZmlsZSAgICAgICB8ICAgIDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV8z
ZF9yZWcuaCAgIHwgIDM0OSArKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1h
LmMgICAgICB8ICA3NDQgLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9k
bWFibGl0LmMgIHwgIDgwNyAtLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlh
X2RtYWJsaXQuaCAgfCAgMTQwIC0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJp
MS5jICAgICB8IDM2MzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmMgICAgICB8ICAxMjQgLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaCAgICAgIHwgIDIyOSAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vdmlhL3ZpYV9pcnEuYyAgICAgIHwgIDM4OCAtLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3ZpYS92aWFfbWFwLmMgICAgICB8ICAxMzIgLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vdmlhL3ZpYV9tbS5jICAgICAgIHwgIDI0MSAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vdmlhL3ZpYV92ZXJpZmllci5jIHwgMTExMCAtLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS92aWEvdmlhX3ZlcmlmaWVyLmggfCAgIDYyIC0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vdmlhL3ZpYV92aWRlby5jICAgIHwgICA5NCAtDQo+ICAgMTQgZmlsZXMgY2hhbmdlZCwg
Mzg2NiBpbnNlcnRpb25zKCspLCA0MTg2IGRlbGV0aW9ucygtKQ0KPiANCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------lovtXqaYX2R0RAc9GZXqokeR--

--------------mH18OEQogPZTxDshZbLPhAu1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLP0I8FAwAAAAAACgkQlh/E3EQov+Bj
hg/9G+4kIdI69HJ+QUF3NnBohAvMBgevF8bfvznnNytj2vcQw3jSi+fx9wnrNkUh+bUGNxfBtCQE
6YqnipBTCZFps+1+v6Fm6Q4QmK3Hk5Um6P68cs8mOW34QH9WaNSlshzArIYspasJBTrNi4oTX/Td
u04vBoJQmm3dLpQKAVuWMWr7+4KKZo9K22yN1O6KI0P0wNM/8BQhDpVvQ1n7Vwz7TEpDRWgLlr0t
qUGQCkVysZAdqiL0qYcq4TG5VWRBe8ChhaP+sZCDQfxiKcI2qoJEN3GKRsVdQg2aI6lfr0njdQA6
YY7MtquScn8VNLuJgfnSEk9NBIWZoB/MG/Me8PYon7dSF9nLafA4jV3rwSWBj7Zr2SiJ6JY5WN0h
2TX5yAbVCnrR+Wk04ron+Fw3OnXCG2HDZPIJ0EcLaPlIoTrnO3+kwfiwQ7R2k/p/mQX+hZ1c/k/8
gLpjPU6cdseDdWJcWHaxkW6APr53x1rS6+AqGTUWGZV22uO54w3UE99zUnpZiZlrQjN2hvnhqJZv
dC1Ez3AJiUxn5E4KY8+/iujL1heiE6YBAvszVmRIhqvxhoOogZJIRBx+8El8kkMHQ2qpG9dVfvmK
U8L3WByxpNgF8qUqwK2Vf4c4ba/LgqTwcg1Vr1b5DXAzlzIA88dOU56MLKgKuI3TpmwBWoWyS1Rw
xD4=
=7lYm
-----END PGP SIGNATURE-----

--------------mH18OEQogPZTxDshZbLPhAu1--
