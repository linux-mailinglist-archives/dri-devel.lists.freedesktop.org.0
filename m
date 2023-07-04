Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98597473FE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 16:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7D010E19B;
	Tue,  4 Jul 2023 14:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5B10E18F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 14:21:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 86BEA1FE9C;
 Tue,  4 Jul 2023 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688480512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b6o1sW/b86g7CV+mN7kQE0L9aZEshCaws9sL5ep6Nmc=;
 b=B3vKgGTYKeRoDKEEpys3RXojtSJZcSgl7tceY8QkOHAm7AuqkCzmAI4LE+dvqMZbTqS5sa
 gaxyo2LNgEaNwzjwkjSWXNfQyC3csPiGB/Ws6a5x5KfrX69+7rwQUoj+qnGBrms3BFpLc6
 oFCx8RwBMdYRkYp1BAMSCK+ci3q6qcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688480512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b6o1sW/b86g7CV+mN7kQE0L9aZEshCaws9sL5ep6Nmc=;
 b=4tzkyH9PDtNzkHa24rpuDHT1NkkAiFKMZdpMSlLfVeTUYsTzngD3spWGnqVChvbDvmvFGT
 qKddm6eHk/GAAfBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4348C1346D;
 Tue,  4 Jul 2023 14:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3c9qDwArpGROdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Jul 2023 14:21:52 +0000
Message-ID: <320d325e-5015-2698-b6c7-ed1223841869@suse.de>
Date: Tue, 4 Jul 2023 16:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Sean Paul <seanpaul@chromium.org>
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <2422ef03-a309-2789-04ec-a8c4559f5024@suse.de>
In-Reply-To: <2422ef03-a309-2789-04ec-a8c4559f5024@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2vYUhReFD5K8fejj0nAW0TLz"
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
--------------2vYUhReFD5K8fejj0nAW0TLz
Content-Type: multipart/mixed; boundary="------------ki7P3UCgEV7f7kwe0A9fX5PA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <320d325e-5015-2698-b6c7-ed1223841869@suse.de>
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <2422ef03-a309-2789-04ec-a8c4559f5024@suse.de>
In-Reply-To: <2422ef03-a309-2789-04ec-a8c4559f5024@suse.de>

--------------ki7P3UCgEV7f7kwe0A9fX5PA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjOiBzb21lIHBlb3BsZSBmcm9tIGNvbW1pdCBmYWU3ZDE4NjQwM2UpDQoNCkFtIDA0LjA3
LjIzIHVtIDE2OjE5IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+IEhpIEpvY2VseW4N
Cj4gDQo+IEFtIDIzLjA2LjIzIHVtIDExOjQ2IHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0K
Pj4gU2luY2UgY29tbWl0IGZhZTdkMTg2NDAzZSAoImRybS9wcm9iZS1oZWxwZXI6IERlZmF1
bHQgdG8gNjQweDQ4MCBpZiBubw0KPj4gwqAgRURJRCBvbiBEUCIpDQo+PiBUaGUgZGVmYXVs
dCByZXNvbHV0aW9uIGlzIG5vdyA2NDB4NDgwIHdoZW4gbm8gbW9uaXRvciBpcyBjb25uZWN0
ZWQuDQo+PiBCdXQgQXNwZWVkIGdyYXBoaWNzIGlzIG1vc3RseSB1c2VkIGluIHNlcnZlcnMs
IHdoZXJlIG5vIG1vbml0b3INCj4+IGlzIGF0dGFjaGVkLiBUaGlzIGFsc28gYWZmZWN0cyB0
aGUgInJlbW90ZSIgcmVzb2x1dGlvbiB0byA2NDB4NDgwLCANCj4+IHdoaWNoIGlzDQo+PiBp
bmNvbnZlbmllbnQsIGFuZCBicmVha3MgdGhlIGFuYWNvbmRhIGluc3RhbGxlci4NCj4gDQo+
IEJ5ICJyZW1vdGUgcmVzb2x1dGlvbiIsIHlvdSBtZWFuIHRoZSBkaXNwbGF5IG1vZGUgdGhh
dCB0aGUgQk1DIHVzZXM/DQo+IA0KPj4gU28gd2hlbiBubyBFRElEIGlzIHByZXNlbnQsIHNl
dCAxMDI0eDc2OCBhcyBwcmVmZXJyZWQgcmVzb2x1dGlvbi4NCj4+DQo+PiBGaXhlczogZmFl
N2QxODY0MDNlICgiZHJtL3Byb2JlLWhlbHBlcjogRGVmYXVsdCB0byA2NDB4NDgwIGlmIG5v
IEVESUQgDQo+PiBvbiBEUCIpDQo+IA0KPiBUaGlzIGNvbW1pdCBzYXlzIHRoYXQgNjQweDQ4
MCBpcyB0aGUgZGVzaWduYXRlZCBmYWlsc2FmZSBtb2RlIGlmIG5vIEVESUQgDQo+IGlzIGF2
YWlsYWJsZS4gVGhlcmVmb3JlLCBJIHRoaW5rIHdlIHNob3VsZCBub3Qgb3ZlcnJpZGUgaXQg
DQo+IHVuY29uZGl0aW9uYWxseS4gVGhlIGFzdCBkcml2ZXIgaXMgbm8gc3BlY2lhbCBpbiB0
aGF0IGNhc2UuDQo+IA0KPiBCdXQgSSBzZWUgd2h5IHlvdSdyZSBkb2luZyB0aGlzIGNoYW5n
ZS4gSSB0aGluayBhbnkgc29sdXRpb24gc2hvdWxkIGJlIA0KPiBpbXBsZW1lbnRlZCBpbiBk
cm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKS4NCj4gDQo+IEJ1dCBi
ZWZvcmUgd2Ugc29sdmUgdGhpcyBpbiB0aGUga2VybmVsLCBpcyBpdCBwb3NzaWJsZSB0byBk
ZWxlZ2F0ZSB0aGlzIA0KPiB0byB1c2Vyc3BhY2U/IElmIG5vIEVESUQgaGFzIGJlZW4gZ2l2
ZW4sIHVzZXJzcGFjZSBjb3VsZCB0cnkgYSANCj4gbm9uLWZhaWxzYWZlIGRpc3BsYXkgbW9k
ZS4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+PiBTaWduZWQtb2ZmLWJ5
OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+PiAtLS0NCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKysrKy0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4+IGlu
ZGV4IDM2Mzc0ODI4ZjZjOC4uOGY3YjdjYzAyMWM3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMNCj4+IEBAIC0xNTg5LDkgKzE1ODksMzEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcyANCj4+IGFzdF9kcDUwMV9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzDQo+PiDCoMKgwqDCoMKgIC5nZXRfbW9kZXMgPSBhc3RfZHA1MDFf
Y29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMsDQo+PiDCoCB9Ow0KPj4gK3N0YXRpYyBpbnQg
YXN0X2RwX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0
b3IgDQo+PiAqY29ubmVjdG9yLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgbWF4WCwgdWludDMyX3QgbWF4WSkN
Cj4+ICt7DQo+PiArwqDCoMKgIGludCByZXQ7DQo+PiArwqDCoMKgIHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlOw0KPj4gKw0KPj4gK8KgwqDCoCByZXQgPSBkcm1faGVscGVyX3By
b2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoY29ubmVjdG9yLCBtYXhYLCANCj4+IG1heFkp
Ow0KPj4gK8KgwqDCoCAvKg0KPj4gK8KgwqDCoMKgICogV2hlbiBubyBtb25pdG9yIGFyZSBk
ZXRlY3RlZCwgRFAgbm93IGRlZmF1bHQgdG8gNjQweDQ4MA0KPj4gK8KgwqDCoMKgICogQXMg
YXNwZWVkIGlzIG1vc3RseSB1c2VkIGluIHJlbW90ZSBzZXJ2ZXIsIGFuZCBEUCBtb25pdG9y
cyBhcmUNCj4+ICvCoMKgwqDCoCAqIHJhcmVseSBhdHRhY2hlZCwgaXQncyBiZXR0ZXIgdG8g
ZGVmYXVsdCB0byAxMDI0eDc2OA0KPj4gK8KgwqDCoMKgICovDQo+PiArwqDCoMKgIGlmICgh
Y29ubmVjdG9yLT5lZGlkX2Jsb2JfcHRyKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgbGlzdF9m
b3JfZWFjaF9lbnRyeShtb2RlLCAmY29ubmVjdG9yLT5tb2RlcywgaGVhZCkgew0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG1vZGUtPmhkaXNwbGF5ID09IDEwMjQgJiYgbW9k
ZS0+dmRpc3BsYXkgPT0gNzY4KQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtb2RlLT50eXBlIHw9IERSTV9NT0RFX1RZUEVfUFJFRkVSUkVEOw0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZHJtX21vZGVfc29ydCgmY29ubmVjdG9yLT5tb2Rlcyk7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCB9DQo+PiArwqDCoMKgIHJldHVybiByZXQ7
DQo+PiArfQ0KPj4gKw0KPj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9y
X2Z1bmNzIGFzdF9kcDUwMV9jb25uZWN0b3JfZnVuY3MgPSB7DQo+PiDCoMKgwqDCoMKgIC5y
ZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldCwNCj4+IC3CoMKgwqAg
LmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMs
DQo+PiArwqDCoMKgIC5maWxsX21vZGVzID0gYXN0X2RwX3Byb2JlX3NpbmdsZV9jb25uZWN0
b3JfbW9kZXMsDQo+PiDCoMKgwqDCoMKgIC5kZXN0cm95ID0gZHJtX2Nvbm5lY3Rvcl9jbGVh
bnVwLA0KPj4gwqDCoMKgwqDCoCAuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IA0KPj4gZHJt
X2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZSwNCj4+IMKgwqDCoMKg
wqAgLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X2Rlc3Ryb3lfc3RhdGUsDQo+PiBAQCAtMTY3OCw3ICsxNzAwLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcyANCj4+IGFzdF9hc3RkcF9jb25u
ZWN0b3JfaGVscGVyX2Z1bmNzDQo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25u
ZWN0b3JfZnVuY3MgYXN0X2FzdGRwX2Nvbm5lY3Rvcl9mdW5jcyA9IHsNCj4+IMKgwqDCoMKg
wqAgLnJlc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0LA0KPj4gLcKg
wqDCoCAuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9t
b2RlcywNCj4+ICvCoMKgwqAgLmZpbGxfbW9kZXMgPSBhc3RfZHBfcHJvYmVfc2luZ2xlX2Nv
bm5lY3Rvcl9tb2RlcywNCj4+IMKgwqDCoMKgwqAgLmRlc3Ryb3kgPSBkcm1fY29ubmVjdG9y
X2NsZWFudXAsDQo+PiDCoMKgwqDCoMKgIC5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gDQo+
PiBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZHVwbGljYXRlX3N0YXRlLA0KPj4gwqDC
oMKgwqDCoCAuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25u
ZWN0b3JfZGVzdHJveV9zdGF0ZSwNCj4+DQo+PiBiYXNlLWNvbW1pdDogMGFkZWMyMjcwMmQ0
OTczODVkYmRjNTJhYmIxNjVmMzc5YTAwZWZiYQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywg
R2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQs
IEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------ki7P3UCgEV7f7kwe0A9fX5PA--

--------------2vYUhReFD5K8fejj0nAW0TLz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSkKv8FAwAAAAAACgkQlh/E3EQov+A3
ZQ/+Kp6s2rydmWCodtJZLlMx1JYfwX6KrQb1QBkkucPJMSl43J/jaHwuE/ek4vWNTy344hCVY2AF
B4JbxV4b9vXYv+ppzDJctzJEe3lkvJp5RzQVuq5m/VhSTPdTBKvM4HNenuO9b6NBNsKS4IDa6NNY
oeMyHMk7N5HXdvBLR39rBHRN6awkTlKVTxBTMXi5PWMpGPntfP7R3rCiWt4mN9/uMC0vev1HSr7P
zLqq9xjV+SuevQVLlWIQjFv62XqeX8u5kNZZq6aBaLzGwAXoaENPzbmjIJDnqRs80N6RSeCTPU8J
Vs+ubn1bXummd6AK4JewN/6Jg731MuPc8v2CaPZzm/XogxusquYeVzJUG12I075rPLbBCQFIFVxI
oGU2KIsxlSmUnn1JAVVrZ6rdm7usD8kR2DfRFdWns31jdFFhq+GK6/w1raCmZbydjoNIGqihG4cN
wb4IlmoaG8gypwqx8H3YKa+kNEUAfR2+9twlXQoB3KJOm+3Dn671cBDa7yqAGA0pxamyBitSLovJ
c0MvtD/7WMshI0vxaRccNvM1/rao8q3DLfMxzmGnpRIALI8FTuDJ7s/oA/SsUzHaBTRweU4PP01f
jugdvJqfSL6qxLojoEseXjwtQ8QcMUVQWZ5mQ/c4W52swkthkK5Sam3lJbp+y5+gEgUuZ2TQBGFb
mII=
=EV5P
-----END PGP SIGNATURE-----

--------------2vYUhReFD5K8fejj0nAW0TLz--
