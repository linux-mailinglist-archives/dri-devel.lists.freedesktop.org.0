Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207DB763B84
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 17:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9099610E494;
	Wed, 26 Jul 2023 15:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B010E498
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 15:46:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C9C91F37F;
 Wed, 26 Jul 2023 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690386403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QDINS4iiwQQM76jT28fWeeU9ry8XcN/MFI/tmCwkeUY=;
 b=EN06JAongoJbJpj/Y+38tH+Hdz8gF817/QxnHORNE02Y8XrrbgG2KS0eboGOC26KfsoQDp
 0EJqDKWSVDgm7TMfMayxGu32Q+VKH/Q0IQni6iKAWrumKQxLYzEKyZexNar/CBCzc5Pl+2
 /u15zHN9WW4ytH7Zu+akOekuE7hsvD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690386403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QDINS4iiwQQM76jT28fWeeU9ry8XcN/MFI/tmCwkeUY=;
 b=e8jRVtcwSJsAO4V8JPHYUHDa/6IBXz1AwTNWo/qoJKCOFR6/sOis7g52gHHNgJYGCHPDBc
 z7mNT5Yfo3IIrLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01B5E139BD;
 Wed, 26 Jul 2023 15:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UkEKO+I/wWQzMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jul 2023 15:46:42 +0000
Message-ID: <2404f05b-7acc-2b5c-e3d8-ea1301f186d2@suse.de>
Date: Wed, 26 Jul 2023 17:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/2] drm/ast: Add BMC virtual connector
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230713134316.332502-1-jfalempe@redhat.com>
 <64d97bb4-e95a-3b03-a2f4-e000930f3ac9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <64d97bb4-e95a-3b03-a2f4-e000930f3ac9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fQ2MsUtxDvXWjs3RxeUxFx6y"
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
--------------fQ2MsUtxDvXWjs3RxeUxFx6y
Content-Type: multipart/mixed; boundary="------------NDE7AtLtcR4ZA03TPnlAsdmV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2404f05b-7acc-2b5c-e3d8-ea1301f186d2@suse.de>
Subject: Re: [PATCH v6 1/2] drm/ast: Add BMC virtual connector
References: <20230713134316.332502-1-jfalempe@redhat.com>
 <64d97bb4-e95a-3b03-a2f4-e000930f3ac9@redhat.com>
In-Reply-To: <64d97bb4-e95a-3b03-a2f4-e000930f3ac9@redhat.com>

--------------NDE7AtLtcR4ZA03TPnlAsdmV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjMgdW0gMTA6NDEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDEzLzA3LzIwMjMgMTU6NDEsIEpvY2VseW4gRmFsZW1wZSB3cm90ZToNCj4+IE1vc3Qg
YXNwZWVkIGRldmljZXMgaGF2ZSBhIEJNQywgd2hpY2ggYWxsb3dzIHRvIHJlbW90ZWx5IHNl
ZSB0aGUgc2NyZWVuLg0KPj4gQWxzbyBpbiB0aGUgY29tbW9uIHVzZSBjYXNlLCB0aG9zZSBz
ZXJ2ZXJzIGRvbid0IGhhdmUgYSBkaXNwbGF5IA0KPj4gY29ubmVjdGVkLg0KPj4gU28gYWRk
IGEgVmlydHVhbCBjb25uZWN0b3IsIHRvIHJlZmxlY3QgdGhhdCBldmVuIGlmIG5vIGRpc3Bs
YXkgaXMNCj4+IGNvbm5lY3RlZCwgdGhlIGZyYW1lYnVmZmVyIGNhbiBzdGlsbCBiZSBzZWVu
IHJlbW90ZWx5Lg0KPj4gVGhpcyBwcmVwYXJlcyB0aGUgd29yayB0byBpbXBsZW1lbnQgYSBk
ZXRlY3RfY3R4KCkgZm9yIHRoZSBEaXNwbGF5IHBvcnQNCj4+IGNvbm5lY3Rvci4NCj4+DQo+
PiB2NDogY2FsbCBkcm1fYWRkX21vZGVzX25vZWRpZCgpIHdpdGggNDA5Nng0MDk2IChUaG9t
YXMgWmltbWVybWFubikNCj4+IMKgwqDCoMKgIHJlbW92ZSB1c2VsZXNzIHN0cnVjdCBmaWVs
ZCBpbml0IHRvIDAgKFRob21hcyBaaW1tZXJtYW5uKQ0KPj4gwqDCoMKgwqAgZG9uJ3QgdXNl
IGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkgKFRob21hcyBaaW1tZXJtYW5uKQ0KPj4gwqDC
oMKgwqAgaW5saW5lIGFzdF9ibWNfY29ubmVjdG9yX2luaXQoKSAoVGhvbWFzIFppbW1lcm1h
bm4pDQo+Pg0KPj4gRml4ZXM6IGZhZTdkMTg2NDAzZSAoImRybS9wcm9iZS1oZWxwZXI6IERl
ZmF1bHQgdG8gNjQweDQ4MCBpZiBubyBFRElEIA0KPj4gb24gRFAiKQ0KPj4gU2lnbmVkLW9m
Zi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPj4gLS0tDQo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaMKgIHzCoCA0ICsrKw0KPj4gwqAg
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgNTggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25z
KCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5o
IA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPj4gaW5kZXggM2Y2ZTBj
OTg0NTIzLi5jOTY1OWU3MjAwMmYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcnYuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgN
Cj4+IEBAIC0yMTQsNiArMjE0LDEwIEBAIHN0cnVjdCBhc3RfZGV2aWNlIHsNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOw0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9jb25uZWN0b3IgY29ubmVj
dG9yOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0gYXN0ZHA7DQo+PiArwqDCoMKgwqDCoMKg
wqAgc3RydWN0IHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZW5j
b2RlciBlbmNvZGVyOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9j
b25uZWN0b3IgY29ubmVjdG9yOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0gYm1jOw0KPj4gwqDC
oMKgwqDCoCB9IG91dHB1dDsNCj4+IMKgwqDCoMKgwqAgYm9vbCBzdXBwb3J0X3dpZGVfc2Ny
ZWVuOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAN
Cj4+IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+PiBpbmRleCBmNzExZDU5
MmRhNTIuLjFhODI5MzE2MmZlYyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
DQo+PiBAQCAtMTczNSw2ICsxNzM1LDYxIEBAIHN0YXRpYyBpbnQgYXN0X2FzdGRwX291dHB1
dF9pbml0KHN0cnVjdCANCj4+IGFzdF9kZXZpY2UgKmFzdCkNCj4+IMKgwqDCoMKgwqAgcmV0
dXJuIDA7DQo+PiDCoCB9DQo+PiArLyoNCj4+ICsgKiBCTUMgdmlydHVhbCBDb25uZWN0b3IN
Cj4+ICsgKi8NCj4+ICsNCj4+ICtzdGF0aWMgaW50IGFzdF9ibWNfY29ubmVjdG9yX2hlbHBl
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgDQo+PiAqY29ubmVjdG9yKQ0KPj4g
K3sNCj4+ICvCoMKgwqAgcmV0dXJuIGRybV9hZGRfbW9kZXNfbm9lZGlkKGNvbm5lY3Rvciwg
NDA5NiwgNDA5Nik7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgDQo+PiBhc3RfYm1jX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MgPSB7DQo+PiArwqDCoMKgIC5nZXRfbW9kZXMgPSBhc3RfYm1jX2Nvbm5lY3Rvcl9o
ZWxwZXJfZ2V0X21vZGVzLA0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fY29ubmVjdG9yX2Z1bmNzIGFzdF9ibWNfY29ubmVjdG9yX2Z1bmNzID0gew0KPj4g
K8KgwqDCoCAucmVzZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQsDQo+
PiArwqDCoMKgIC5maWxsX21vZGVzID0gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVj
dG9yX21vZGVzLA0KPj4gK8KgwqDCoCAuZGVzdHJveSA9IGRybV9jb25uZWN0b3JfY2xlYW51
cCwNCj4+ICvCoMKgwqAgLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPSANCj4+IGRybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsDQo+PiArwqDCoMKgIC5hdG9t
aWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95
X3N0YXRlLA0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5j
b2Rlcl9mdW5jcyBhc3RfYm1jX2VuY29kZXJfZnVuY3MgPSB7DQo+PiArwqDCoMKgIC5kZXN0
cm95ID0gZHJtX2VuY29kZXJfY2xlYW51cCwNCj4+ICt9Ow0KDQpDYW4geW91IHBsZWFzZSBt
b3ZlIHRoZSBlbmNvZGVyX2Z1bmNzIHN0cnVjdCBiZWZvcmUgdGhlIGNvbm5lY3RvciBzdHVm
Zj8NCg0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgYXN0X2JtY19vdXRwdXRfaW5pdChzdHJ1Y3Qg
YXN0X2RldmljZSAqYXN0KQ0KPj4gK3sNCj4+ICvCoMKgwqAgc3RydWN0IGRybV9kZXZpY2Ug
KmRldiA9ICZhc3QtPmJhc2U7DQo+PiArwqDCoMKgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9
ICZhc3QtPmNydGM7DQo+PiArwqDCoMKgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciA9
ICZhc3QtPm91dHB1dC5ibWMuZW5jb2RlcjsNCj4+ICvCoMKgwqAgc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciA9ICZhc3QtPm91dHB1dC5ibWMuY29ubmVjdG9yOw0KPj4gK8Kg
wqDCoCBpbnQgcmV0Ow0KPj4gKw0KPj4gKw0KPj4gK8KgwqDCoCByZXQgPSBkcm1fZW5jb2Rl
cl9pbml0KGRldiwgZW5jb2RlciwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJmFzdF9ibWNfZW5jb2Rlcl9mdW5jcywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRFJNX01PREVfRU5DT0RFUl9WSVJUVUFMLCAiYXN0X2JtYyIpOw0KPj4gK8Kg
wqDCoCBpZiAocmV0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+PiArwqDC
oMKgIGVuY29kZXItPnBvc3NpYmxlX2NydGNzID0gZHJtX2NydGNfbWFzayhjcnRjKTsNCj4+
ICsNCj4+ICvCoMKgwqAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9y
LCAmYXN0X2JtY19jb25uZWN0b3JfZnVuY3MsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgRFJNX01PREVfQ09OTkVDVE9SX1ZJUlRVQUwpOw0KPj4gK8KgwqDCoCBp
ZiAocmV0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+PiArDQo+PiArwqDC
oMKgIGRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsIA0KPj4gJmFzdF9ibWNf
Y29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7DQo+PiArDQo+PiArwqDCoMKgIHJldCA9IGRybV9j
b25uZWN0b3JfYXR0YWNoX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyKTsNCj4+ICvCoMKg
wqAgaWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gKw0KPj4g
K8KgwqDCoCByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiDCoCAvKg0KPj4gwqDCoCAqIE1v
ZGUgY29uZmlnDQo+PiDCoMKgICovDQo+PiBAQCAtMTg0Miw2ICsxODk3LDkgQEAgaW50IGFz
dF9tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBhc3RfZGV2aWNlICphc3QpDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiByZXQ7DQo+PiDCoMKgwqDCoMKgIH0NCj4+ICvCoMKgwqAgcmV0ID0gYXN0X2JtY19v
dXRwdXRfaW5pdChhc3QpOw0KPj4gK8KgwqDCoCBpZiAocmV0KQ0KPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7DQo+PiDCoMKgwqDCoMKgIGRybV9tb2RlX2NvbmZpZ19yZXNldChk
ZXYpOw0KPj4NCj4+IGJhc2UtY29tbWl0OiBiMzJkNWE1MWYzYzIxODQzMDExZDY4YTU4ZTZh
YzBiODk3YmNlOWYyDQo+IA0KPiANCj4gSSdtIG1pc3NpbmcgYSByZXZpZXcgb24gdGhpcyBw
YXRjaC4gVGhlIFZHQSBDUkQwWzddIHJlZ2lzdGVyIGNoZWNrIA0KPiBkb2Vzbid0IHdvcmsg
b24gbXkgc2VydmVyLCBzbyBJJ20gYWRkaW5nIHRoZSBCTUMgdmlydHVhbCBjb25uZWN0b3Ig
Zm9yIA0KPiBhbGwgYXNwZWVkIGhhcmR3YXJlLCBidXQgYXMgZGlzY3Vzc2VkLCBpdCBzaG91
bGRuJ3QgaGF2ZSBhIG5lZ2F0aXZlIGltcGFjdC4NCg0KU29ycnkuIEkgc2ltcGx5IG1pc3Nl
ZCB0aGlzIHBhdGNoLiBXaXRoIG15IGxpdHRsZSBuaXRwaWNrIGZpeGVkLCB5b3UgY2FuIGFk
ZA0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNClRoYW5rcyBmb3IgdGhlIGZpeC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gVGhhbmtzLA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------NDE7AtLtcR4ZA03TPnlAsdmV--

--------------fQ2MsUtxDvXWjs3RxeUxFx6y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTBP+IFAwAAAAAACgkQlh/E3EQov+BM
rw//d3BcP1oCjIwtd2VmD4UdKAcNad1vBFIHEPRLT+qeqym5ntenUj/M76PnPuq6Z+kkkYXJcflj
4jVA2lbi7oOBVEn5ASNuTlUqupNP07iSvEXqIQlXEHY9CmYSlbFEAt8+8wqKWctiV1TaR46wB64S
8EtIsvaFo3oR/sbZmFj5Cx1yClMIKl9Hbm7GErgVoa8rR/v4/tTG1SYtKg33imlL52ch8IJ4UdHy
tIraeDGxvGx2CaLliMe98KLUveDuvuQcy5SESqYCewF6+f727DqbIO+JyJMhosmPo2rWHoTlj+ml
BxDucayb2P4k4f0swOfKemT9q0Vt2X1Exwi1divtUiNdUcCQrnSANCd6J1mG5opIeOd1KDOuW8f2
dCxOXh21MwnYSChC2gTLNBqcgOQ/zjyby4K3DdwDSHYfI17hqKZDoKTK2ZqVMShetcnQsJqATTQ4
DSejMF0kujz2a6vfGI3fFdVR1AewaIcA5FvLLikShJ6jJrhGwK/QXzjjKrZ1ojvvf7ZtP21OmIDA
oJi+R0riDMW9zgxPVNAsLQrsSbB1I5t7RYIBvHvia4qZZEwAUjznKCjPPjyjHJycsxwTxSSxWzP9
Uxfo1tsbA5etryZDg/lfOB8lIUDjXc5jQbcCGVAk4++QjX0ikdIbN6TNogR5AEGa1THj+tGQ180B
R/k=
=5DlA
-----END PGP SIGNATURE-----

--------------fQ2MsUtxDvXWjs3RxeUxFx6y--
