Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCE65FFD7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 12:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468F410E86B;
	Fri,  6 Jan 2023 11:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412EE10E032
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 11:55:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 538DF248F0;
 Fri,  6 Jan 2023 11:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673006119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIPoJCSW/tiTNXmbg9XKWj0xzil2uIJ3x3MsJomGOZk=;
 b=R7yjmpmxgQ2kJI6X9kVRpXYpWPEBBxaJ0ADMQdi48bv/C2NoXkzHJo41fUutgZbOwERYB9
 S893x5s1/RVlTSTcOfg7rzUj0EKoJ0t6QkVdr/Usat2KjWeG/PFA8VZTkrrPAQDxM/4R/Z
 mr6GqAsAEv7uMASRe3JyOwFZgkJJ7GQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673006119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIPoJCSW/tiTNXmbg9XKWj0xzil2uIJ3x3MsJomGOZk=;
 b=ogV01hp/NPkLY+H6gx8ljU2Lq5YV/sDAy/Y2+JwZPcTfCcdVD90ScphwLyLcX/3o8TuVqS
 92kjKWpX8Q7GMYDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 261A513596;
 Fri,  6 Jan 2023 11:55:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O6HZBicMuGMqMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 11:55:19 +0000
Message-ID: <751d5b05-89d7-00d1-97ab-7f9c1aeacc96@suse.de>
Date: Fri, 6 Jan 2023 12:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230105162148.234218-1-mcanal@igalia.com>
 <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
 <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
 <19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JTPN0R7WaznwmwVOdtrlhJTl"
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JTPN0R7WaznwmwVOdtrlhJTl
Content-Type: multipart/mixed; boundary="------------2LYF0eOqLSo4tocSZxzggdFK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <751d5b05-89d7-00d1-97ab-7f9c1aeacc96@suse.de>
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
References: <20230105162148.234218-1-mcanal@igalia.com>
 <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
 <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
 <19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com>
In-Reply-To: <19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com>

--------------2LYF0eOqLSo4tocSZxzggdFK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDEuMjMgdW0gMTI6MzQgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IEhp
LA0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KPiANCj4gT24gMS82LzIzIDA1OjEw
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMDUuMDEuMjMg
dW0gMTk6NDMgc2NocmllYiBNZWxpc3NhIFdlbjoNCj4+PiBPbiAwMS8wNSwgTWHDrXJhIENh
bmFsIHdyb3RlOg0KPj4+PiBXaXRoIGNvbW1pdCAzNTljNjY0OWNkOWEgKCJkcm0vZ2VtOiBJ
bXBsZW1lbnQgc2hhZG93LXBsYW5lIHtiZWdpbiwNCj4+Pj4gZW5kfV9mYl9hY2Nlc3Mgd2l0
aCB2bWFwIiksIHRoZSBiZWhhdmlvciBvZiB0aGUgc2hhZG93LXBsYW5lIGhlbHBlcnMNCj4+
Pj4gY2hhbmdlZCBhbmQgdGhlIHZ1bm1hcCBpcyBub3cgcGVyZm9ybWVkIGF0IHRoZSBlbmQg
b2YNCj4+Pj4gdGhlIGN1cnJlbnQgcGFnZWZsaXAsIGluc3RlYWQgb2YgdGhlIGVuZCBvZiB0
aGUgZm9sbG93aW5nIHBhZ2VmbGlwLg0KPj4+Pg0KPj4+PiBCeSBwZXJmb3JtaW5nIHRoZSB2
dW5tYXAgYXQgdGhlIGVuZCBvZiB0aGUgY3VycmVudCBwYWdlZmxpcCwgaW52YWxpZA0KPj4+
PiBtZW1vcnkgaXMgYWNjZXNzZWQgYnkgdGhlIHZrbXMgZHVyaW5nIHRoZSBwbGFuZSBjb21w
b3NpdGlvbiwgYXMgdGhlIA0KPj4+PiBkYXRhDQo+Pj4+IGlzIGJlaW5nIHVubWFwcGVkIGJl
Zm9yZSBiZWluZyB1c2VkLg0KPj4+DQo+Pj4gSGkgTWHDrXJhLA0KPj4+DQo+Pj4gVGhhbmtz
IGZvciBpbnZlc3RpZ2F0aW5nIHRoaXMgaXNzdWUuIENhbiB5b3UgYWRkIGluIHRoZSBjb21t
aXQgbWVzc2FnZQ0KPj4+IHRoZSBrZXJuZWwgT29wcyBjYXVzZWQgYnkgdGhpcyBjaGFuZ2U/
DQo+Pj4NCj4+PiBCZXNpZGVzIHRoYXQsIEkgd29uZGVyIGlmIHRoZSByaWdodCB0aGluZyB3
b3VsZCBiZSB0byByZXN0b3JlIHRoZQ0KPj4+IHByZXZpb3VzIGJlaGF2aW9yIG9mIHZ1bm1h
cCBpbiBzaGFkb3ctcGxhbmUgaGVscGVycywgaW5zdGVhZCBvZg0KPj4+IHJlaW50cm9kdWNl
IGRyaXZlci1zcGVjaWZpYyBob29rcyBmb3Igdm1hcC92dW5tYXAgY29ycmVjdGx5IHRvIHZr
bXMuDQo+Pj4NCj4+PiBNYXliZSBUaG9tYXMgaGFzIHNvbWUgaW5wdXRzIG9uIHRoaXMgc2hh
ZG93LXBsYW5lIGNoYW5naW5nIHRvIGhlbHAgdXMgb24NCj4+PiBmaWd1cmluZyBvdXQgdGhl
IHByb3BlciBmaXggKD8pDQo+Pg0KPj4gVGhlIGZpeCBsb29rcyBnb29kLiBJIGxlZnQgc29t
ZSBtaW5vci1pbXBvcnRhbnQgY29tbWVudHMgYmVsb3cuDQo+Pg0KPj4gSSB3b3VsZCBzdWdn
ZXN0IHRvIHJldGhpbmsgdGhlIG92ZXJhbGwgZHJpdmVyIGRlc2lnbi4gSW5zdGVhZCBvZiAN
Cj4+IGtlZXBpbmcgdGhlc2UgYnVmZmVyIHBpbm5lZCBmb3IgbG9uZy4gSXQgbWlnaHQgYmUg
YmV0dGVyIHRvIGhhdmUgYSANCj4+IHBlci1wbGFuZSBpbnRlcm1lZGlhdGUgYnVmZmVyIHRo
YXQgeW91IHVwZGF0ZSBvbiBlYWNoIGNhbGwgdG8gDQo+PiBhdG9taWNfdXBkYXRlLiBUaGF0
J3MgaG93IHJlYWwgZHJpdmVycyBpbnRlcmFjdCB3aXRoIHRoZWlyIGhhcmR3YXJlLg0KPj4N
Cj4+Pg0KPj4+IEJlc3QgUmVnYXJkcywNCj4+Pg0KPj4+IE1lbGlzc2ENCj4+Pg0KPj4+Pg0K
Pj4+PiBUaGVyZWZvcmUsIGludHJvZHVjZSBhZ2FpbiBwcmVwYXJlX2ZiIGFuZCBjbGVhbnVw
X2ZiIGZ1bmN0aW9ucyB0byB0aGUNCj4+Pj4gdmttcywgd2hpY2ggd2VyZSBwcmV2aW91c2x5
IHJlbW92ZWQgb24gY29tbWl0IGI0M2UyZWMwM2IwZCAoImRybS92a21zOg0KPj4+PiBMZXQg
c2hhZG93LXBsYW5lIGhlbHBlcnMgcHJlcGFyZSB0aGUgcGxhbmUncyBGQiIpLg0KPj4+Pg0K
Pj4+PiBGaXhlczogMzU5YzY2NDljZDlhICgiZHJtL2dlbTogSW1wbGVtZW50IHNoYWRvdy1w
bGFuZSB7YmVnaW4sIA0KPj4+PiBlbmR9X2ZiX2FjY2VzcyB3aXRoIHZtYXAiKQ0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBNYcOtcmEgQ2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPg0KPj4NCj4+
IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
DQo+Pj4+IC0tLQ0KPj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3BsYW5lLmMg
fCAzNiANCj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0K
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFuZS5jIA0K
Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfcGxhbmUuYw0KPj4+PiBpbmRleCBj
M2E4NDUyMjBlMTAuLmIzZjhhMTE1Y2MyMyAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZrbXMvdmttc19wbGFuZS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92
a21zL3ZrbXNfcGxhbmUuYw0KPj4+PiBAQCAtMTYwLDEwICsxNjAsNDQgQEAgc3RhdGljIGlu
dCB2a21zX3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgDQo+Pj4+IGRybV9wbGFuZSAqcGxh
bmUsDQo+Pj4+IMKgwqDCoMKgcmV0dXJuIDA7DQo+Pj4+IMKgIH0NCj4+Pj4NCj4+Pj4gK3N0
YXRpYyBpbnQgdmttc19wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRl
ICpzdGF0ZSkNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3NoYWRvd19wbGFu
ZV9zdGF0ZSAqc2hhZG93X3BsYW5lX3N0YXRlOw0KPj4+PiArwqDCoMKgIHN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiID0gc3RhdGUtPmZiOw0KPj4+PiArwqDCoMKgIGludCByZXQ7DQo+
Pj4+ICsNCj4+Pj4gK8KgwqDCoCBpZiAoIWZiKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7DQo+Pg0KPj4gSUlSQyB0aGlzIGNhbm5vdCBiZSBOVUxMLiBPbmx5IGFjdGl2ZSBw
bGFuZXMgd2lsbCBiZSAncHJlcGFyZWQnLj4NCj4+Pj4gKw0KPj4+PiArwqDCoMKgIHNoYWRv
d19wbGFuZV9zdGF0ZSA9IHRvX2RybV9zaGFkb3dfcGxhbmVfc3RhdGUoc3RhdGUpOw0KPj4+
PiArDQo+Pj4+ICvCoMKgwqAgcmV0ID0gZHJtX2dlbV9wbGFuZV9oZWxwZXJfcHJlcGFyZV9m
YihwbGFuZSwgc3RhdGUpOw0KPj4+PiArwqDCoMKgIGlmIChyZXQpDQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgcmV0dXJuIGRybV9n
ZW1fZmJfdm1hcChmYiwgc2hhZG93X3BsYW5lX3N0YXRlLT5tYXAsIA0KPj4+PiBzaGFkb3df
cGxhbmVfc3RhdGUtPmRhdGEpOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtzdGF0aWMgdm9p
ZCB2a21zX2NsZWFudXBfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3Rh
dGUpDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IGRybV9zaGFkb3dfcGxhbmVfc3Rh
dGUgKnNoYWRvd19wbGFuZV9zdGF0ZTsNCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2ZyYW1l
YnVmZmVyICpmYiA9IHN0YXRlLT5mYjsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGlmICghZmIp
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pg0KPj4gU2FtZSBoZXJlLiBUaGlz
IGZ1bmN0aW9uIHdvbid0IGJlIGNhbGxlZCBpZiB0aGVyZSBoYXMgbm90IGJlZW4gYSANCj4+
IGZyYW1lYnVmZmVyLg0KPiANCj4gQWZ0ZXIgcmVtb3ZpbmcgdGhvc2UgdHdvIGNoZWNrcywg
SSBzdGFydGVkIHRvIGdldCBzb21lIE5VTEwgcG9pbnRlciANCj4gZGVyZWZlcmVuY2UNCj4g
ZXJyb3JzLCBzbyBJIGJlbGlldmUgdGhleSBhcmUgc29tZWhvdyBuZWNlc3NhcnkuDQoNCk9r
Lg0KDQo+IA0KPj4NCj4+Pj4gKw0KPj4+PiArwqDCoMKgIHNoYWRvd19wbGFuZV9zdGF0ZSA9
IHRvX2RybV9zaGFkb3dfcGxhbmVfc3RhdGUoc3RhdGUpOw0KPj4+PiArDQo+Pj4+ICvCoMKg
wqAgZHJtX2dlbV9mYl92dW5tYXAoZmIsIHNoYWRvd19wbGFuZV9zdGF0ZS0+bWFwKTsNCj4+
Pj4gK30NCj4+Pj4gKw0KPj4+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9o
ZWxwZXJfZnVuY3MgDQo+Pj4+IHZrbXNfcHJpbWFyeV9oZWxwZXJfZnVuY3MgPSB7DQo+Pj4+
IMKgwqDCoMKgLmF0b21pY191cGRhdGXCoMKgwqDCoMKgwqDCoCA9IHZrbXNfcGxhbmVfYXRv
bWljX3VwZGF0ZSwNCj4+Pj4gwqDCoMKgwqAuYXRvbWljX2NoZWNrwqDCoMKgwqDCoMKgwqAg
PSB2a21zX3BsYW5lX2F0b21pY19jaGVjaywNCj4+Pj4gLcKgwqDCoCBEUk1fR0VNX1NIQURP
V19QTEFORV9IRUxQRVJfRlVOQ1MsDQo+Pg0KPj4gWW91J3JlIHN0aWxsIGluc3RhbGxpbmcg
e2JlaW5nL2VuZH1fZmJfYWNjZXNzLCB3aGljaCBzaG91bGQgbm90IGJlIA0KPj4gbmVjZXNz
YXJ5IG5vdy4gT3Blbi1jb2RpbmcgRFJNX0dFTV9TSEFET1dfUExBTkVfSEVMUEVSX0ZVTkNT
IHdpdGhvdXQgDQo+PiB0aG9zZSBoZWxwZXJzIHdvdWxkIGZpeCB0aGF0Lg0KPiANCj4gSSdt
IHNvcnJ5IGJ1dCBJIGRpZG4ndCB1bmRlcnN0YW5kIHRoaXMgY29tbWVudC4gQUZBSUsgSSAN
Cj4ge2JlaW5nL2VuZH1fZmJfYWNjZXNzIGFyZQ0KPiBOVUxMIGFzIEkgcmVtb3ZlZCB0aGUg
RFJNX0dFTV9TSEFET1dfUExBTkVfSEVMUEVSX0ZVTkNTIG1hY3JvLg0KDQpTb3JyeSwgSSBt
aXNyZWFkIHRoYXQgbGluZS4gWW91J3JlIHJpZ2h0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IC0gTWHDrXJhIENhbmFsDQo+IA0KPj4NCj4+
IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4+PiArwqDCoMKgIC5wcmVwYXJlX2Zi
wqDCoMKgwqDCoMKgwqAgPSB2a21zX3ByZXBhcmVfZmIsDQo+Pj4+ICvCoMKgwqAgLmNsZWFu
dXBfZmLCoMKgwqDCoMKgwqDCoCA9IHZrbXNfY2xlYW51cF9mYiwNCj4+Pj4gwqAgfTsNCj4+
Pj4NCj4+Pj4gwqAgc3RydWN0IHZrbXNfcGxhbmUgKnZrbXNfcGxhbmVfaW5pdChzdHJ1Y3Qg
dmttc19kZXZpY2UgKnZrbXNkZXYsDQo+Pj4+IC0tIA0KPj4+PiAyLjM5LjANCj4+Pj4NCj4+
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------2LYF0eOqLSo4tocSZxzggdFK--

--------------JTPN0R7WaznwmwVOdtrlhJTl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO4DCYFAwAAAAAACgkQlh/E3EQov+DF
Pw//YPgLQVUz1so7LJfmkZxrnHEYURDnIROjpPBJZlx9sjLdR6rWDR+S6A+T0CbT0yAyS84w/0Ly
Z4fPc5dKmwnc1iLATDMXZhOZEz0XKF/rBACidzQDBYhYFc4RrLuFw1O7p3F1eMfGMQ+4nrjsMJcf
H0daHaAdH1EzKDV/aM1KvAnaTYZDwEMdC2KQ8fAsDep+TODa3tJPVDfO2oSOIY6EM72LLRYgVqD0
iy3hAr7XRJFWIo9mPqvMigkNyj7eTEEWrtFi4K88+Oh6kxIiVDYXYxVLGLeFV/tNVwkUpp1es5wX
npCk6THls7S1dIWVQi/jGBAYZH6i0hffFmniDM7vnkEaI9ljfS1bgxSAPm4/WPQ+ljs3n91dHi13
ZjUyA0DDWxok6qXBWdN5znD2YzJ1QDA/3Yf/xEu/qrvSAJQTo6NzuyM0TxnGf8mk9lfiuvY9nndr
XK9GcChFAYtsIN+Homvi749Mfe5MQJfz/YvU1HAXsJ5JQ4I0utnIYmTyf1p4dQvx+NwmmTDLRcY1
3inIgJ6ky+6jUzWec38urxfw1YyaZFWOA31u9Rg0rguqLnC60XKnvtocmRCFHg77V0lSsQ9oRnYg
ItGWsxh/YfIq/cab0wIhrSurbDkKHWBqwgTMW/WAhJbB6BfH8ya7wzmrjSq5NvUKjogt0HUZyVTD
AdQ=
=auGA
-----END PGP SIGNATURE-----

--------------JTPN0R7WaznwmwVOdtrlhJTl--
