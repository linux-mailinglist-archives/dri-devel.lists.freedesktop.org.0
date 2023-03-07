Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675F76ADC26
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B82610E404;
	Tue,  7 Mar 2023 10:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618B010E404;
 Tue,  7 Mar 2023 10:42:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F1A31FE17;
 Tue,  7 Mar 2023 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678185778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYrRx8Lwe+AZfi6r6twdJu1ckpHwNLokjeEflBucC5c=;
 b=kWwuKAVL/6fZdgF/mLiC0HD8V8ySpp794SELS2/10r6J7VxK3icOhpjpUet9IBCTxMjxLx
 z5Gv6m3/UBlt3ySr4iqsD0FJD8dN4ll/fBTd6d9QZqVL8hsU3HdqUwaFchCZb3Kflld/KI
 qXqjLz8ahg1banzbg3XZ5L9BqK3JatE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678185778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wYrRx8Lwe+AZfi6r6twdJu1ckpHwNLokjeEflBucC5c=;
 b=t/Q0yMh0EeKnFWXSmLNQovugtH/ECz3IArw687c3ycze9UrYTnaViZBzD0DZ2QOIWJB8YH
 +ucKtZk4V526SQCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 911F31341F;
 Tue,  7 Mar 2023 10:42:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DhQ3IjEVB2QsawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Mar 2023 10:42:57 +0000
Message-ID: <3afbc965-4117-7d45-9a8f-b726c04d1b0c@suse.de>
Date: Tue, 7 Mar 2023 11:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 10/11] drm/virtio: Support memory shrinking
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
References: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
 <20230305221011.1404672-11-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230305221011.1404672-11-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bd9uHQE0f9jYfen5tTz75sck"
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bd9uHQE0f9jYfen5tTz75sck
Content-Type: multipart/mixed; boundary="------------Nw99LQEozhEkQ4GlZeJ9DJu6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <3afbc965-4117-7d45-9a8f-b726c04d1b0c@suse.de>
Subject: Re: [PATCH v12 10/11] drm/virtio: Support memory shrinking
References: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
 <20230305221011.1404672-11-dmitry.osipenko@collabora.com>
In-Reply-To: <20230305221011.1404672-11-dmitry.osipenko@collabora.com>

--------------Nw99LQEozhEkQ4GlZeJ9DJu6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDMuMjMgdW0gMjM6MTAgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQpb
Li4uXQ0KPiAgIA0KPiAgIAkqYm9fcHRyID0gYm87DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9wbGFuZS5jDQo+IGluZGV4IDRjMDllMzEzYmViYy4uM2YyMTUxMmZmMTUz
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYw0KPiBA
QCAtMjM4LDIwICsyMzgsMzIgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3BsYW5lX3ByZXBh
cmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ICAgCXN0cnVjdCB2aXJ0aW9fZ3B1
X2RldmljZSAqdmdkZXYgPSBkZXYtPmRldl9wcml2YXRlOw0KPiAgIAlzdHJ1Y3QgdmlydGlv
X2dwdV9mcmFtZWJ1ZmZlciAqdmdmYjsNCj4gICAJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0
ICpibzsNCj4gKwlpbnQgZXJyOw0KPiAgIA0KPiAgIAlpZiAoIW5ld19zdGF0ZS0+ZmIpDQo+
ICAgCQlyZXR1cm4gMDsNCj4gICANCj4gICAJdmdmYiA9IHRvX3ZpcnRpb19ncHVfZnJhbWVi
dWZmZXIobmV3X3N0YXRlLT5mYik7DQo+ICAgCWJvID0gZ2VtX3RvX3ZpcnRpb19ncHVfb2Jq
KHZnZmItPmJhc2Uub2JqWzBdKTsNCj4gLQlpZiAoIWJvIHx8IChwbGFuZS0+dHlwZSA9PSBE
Uk1fUExBTkVfVFlQRV9QUklNQVJZICYmICFiby0+Z3Vlc3RfYmxvYikpDQo+ICsNCj4gKwlp
ZiAodmlydGlvX2dwdV9pc19zaG1lbShibykpIHsNCg0KTm90IHJlYWxseSBhIHByb2JsZW0g
d2l0aCB0aGlzIHBhdGNoc2V0LCBidXQgaGF2aW5nIHN1Y2ggYnJhbmNoZXMgbG9va3MgDQps
aWtlIGEgYnVnIGluIHRoZSBkcml2ZXIncyBHRU0gZGVzaWduLiBXaGF0ZXZlciB5b3VyIEdF
TSBvYmplY3QgbmVlZHMgb3IgDQpkb2VzLCBpdCBzaG91bGQgYmUgaGlkZGVuIGluIHRoZSBp
bXBsZW1lbnRhdGlvbi4gV2h5IGlzIHZpcnRpbyBkb2luZyB0aGlzPw0KDQo+ICsJCWVyciA9
IGRybV9nZW1fcGluKCZiby0+YmFzZS5iYXNlKTsNCg0KQXMgdGhlIGRyaXZlciB1c2VzIEdF
TSBTSE1FTSwgcGxlYXNlIGNhbGwgZHJtX2dlbV9zaG1lbV9vYmplY3RfcGluKCkgDQpkaXJl
Y3RseSBhbmQgcmVtb3ZlIHBhdGNoIFswOS8xMV0uIFNhbWUgZ29lcyBmb3IgdGhlIF91bnBp
biBjYWxsIGJlbG93Lg0KDQpUaGUgcHJvYmxlbSB3aXRoIGdlbmVyaWMgcGlubmluZyBpbnRl
cmZhY2VzIGlzIHRoYXQgdGhlcmUncyBubyB3YXkgb2YgDQpzcGVjaWZ5aW5nIHdoZXJlIHRv
IHBpbiB0byBCTy4gIFRoZSBwcm9ibGVtIGlzIG1vc3QgYXBwYXJlbnQgd2l0aCBUVE0sIA0K
d2hlcmUgaGFyZHdhcmUgb2Z0ZW4gaGFzIG11bHRpcGxlIGxvY2F0aW9ucyB3ZXJlIGJ1ZmZl
ciBjYW4gYmUgcGxhY2VkIA0KKFZSQU0sIEdBUlQsIHN5c3RlbSBtZW1vcnkpLiBTbyBpdCdz
IHJlYWxseSBhIGRldGFpbCBiZXR3ZWVuIHRoZSBkcml2ZXIgDQphbmQgdGhlIG1lbW9yeSBt
YW5hZ2VyLg0KDQpUaGVzZSBnZW5lcmljIGludGVybmFsIEdFTSBpbnRlcmZhY2VzIHNob3Vs
ZCBvbmx5IGJlIHVzZWQgYnkgRFJNIGNvcmUgDQphbmQgaGVscGVycy4gRHJpdmVycyBzaG91
bGQgdXNlIHRoZWlyIG1lbW9yeSBtYW5hZ2VyJ3MgaW50ZXJmYWNlLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+ICsJCWlmIChlcnIpDQo+ICsJCQlyZXR1cm4gZXJyOw0KPiArCX0N
Cj4gKw0KPiArCWlmIChwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZICYm
ICFiby0+Z3Vlc3RfYmxvYikNCj4gICAJCXJldHVybiAwOw0KPiAgIA0KPiAgIAlpZiAoYm8t
PmR1bWIgJiYgKHBsYW5lLT5zdGF0ZS0+ZmIgIT0gbmV3X3N0YXRlLT5mYikpIHsNCj4gICAJ
CXZnZmItPmZlbmNlID0gdmlydGlvX2dwdV9mZW5jZV9hbGxvYyh2Z2RldiwgdmdkZXYtPmZl
bmNlX2Rydi5jb250ZXh0LA0KPiAgIAkJCQkJCSAgICAgMCk7DQo+IC0JCWlmICghdmdmYi0+
ZmVuY2UpDQo+ICsJCWlmICghdmdmYi0+ZmVuY2UpIHsNCj4gKwkJCWlmICh2aXJ0aW9fZ3B1
X2lzX3NobWVtKGJvKSkNCj4gKwkJCQlkcm1fZ2VtX3VucGluKCZiby0+YmFzZS5iYXNlKTsN
Cj4gKw0KPiAgIAkJCXJldHVybiAtRU5PTUVNOw0KPiArCQl9DQo+ICAgCX0NCj4gICANCj4g
ICAJcmV0dXJuIDA7DQo+IEBAIC0yNjEsMTUgKzI3MywyMSBAQCBzdGF0aWMgdm9pZCB2aXJ0
aW9fZ3B1X3BsYW5lX2NsZWFudXBfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ICAg
CQkJCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkNCj4gICB7DQo+ICAgCXN0cnVj
dCB2aXJ0aW9fZ3B1X2ZyYW1lYnVmZmVyICp2Z2ZiOw0KPiArCXN0cnVjdCB2aXJ0aW9fZ3B1
X29iamVjdCAqYm87DQo+ICAgDQo+ICAgCWlmICghc3RhdGUtPmZiKQ0KPiAgIAkJcmV0dXJu
Ow0KPiAgIA0KPiAgIAl2Z2ZiID0gdG9fdmlydGlvX2dwdV9mcmFtZWJ1ZmZlcihzdGF0ZS0+
ZmIpOw0KPiArCWJvID0gZ2VtX3RvX3ZpcnRpb19ncHVfb2JqKHZnZmItPmJhc2Uub2JqWzBd
KTsNCj4gKw0KPiAgIAlpZiAodmdmYi0+ZmVuY2UpIHsNCj4gICAJCWRtYV9mZW5jZV9wdXQo
JnZnZmItPmZlbmNlLT5mKTsNCj4gICAJCXZnZmItPmZlbmNlID0gTlVMTDsNCj4gICAJfQ0K
PiArDQo+ICsJaWYgKHZpcnRpb19ncHVfaXNfc2htZW0oYm8pKQ0KPiArCQlkcm1fZ2VtX3Vu
cGluKCZiby0+YmFzZS5iYXNlKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgdmly
dGlvX2dwdV9jdXJzb3JfcGxhbmVfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYw0KPiBpbmRleCBiMWEwMGMwYzI1
YTcuLjE0YWI0NzBmNDEzYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X3ZxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X3ZxLmMNCj4gQEAgLTU0NSw2ICs1NDUsMjEgQEAgdm9pZCB2aXJ0aW9fZ3B1X2NtZF91bnJl
Zl9yZXNvdXJjZShzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LA0KPiAgIAkJdmly
dGlvX2dwdV9jbGVhbnVwX29iamVjdChibyk7DQo+ICAgfQ0KPiAgIA0KPiAraW50IHZpcnRp
b19ncHVfY21kX3JlbGVhc2VfcmVzb3VyY2Uoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2
Z2RldiwNCj4gKwkJCQkgICAgc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibykNCj4gK3sN
Cj4gKwlzdHJ1Y3QgdmlydGlvX2dwdV9yZXNvdXJjZV91bnJlZiAqY21kX3A7DQo+ICsJc3Ry
dWN0IHZpcnRpb19ncHVfdmJ1ZmZlciAqdmJ1ZjsNCj4gKw0KPiArCWNtZF9wID0gdmlydGlv
X2dwdV9hbGxvY19jbWQodmdkZXYsICZ2YnVmLCBzaXplb2YoKmNtZF9wKSk7DQo+ICsJbWVt
c2V0KGNtZF9wLCAwLCBzaXplb2YoKmNtZF9wKSk7DQo+ICsNCj4gKwljbWRfcC0+aGRyLnR5
cGUgPSBjcHVfdG9fbGUzMihWSVJUSU9fR1BVX0NNRF9SRVNPVVJDRV9VTlJFRik7DQo+ICsJ
Y21kX3AtPnJlc291cmNlX2lkID0gY3B1X3RvX2xlMzIoYm8tPmh3X3Jlc19oYW5kbGUpOw0K
PiArDQo+ICsJcmV0dXJuIHZpcnRpb19ncHVfcXVldWVfY3RybF9idWZmZXIodmdkZXYsIHZi
dWYpOw0KPiArfQ0KPiArDQo+ICAgdm9pZCB2aXJ0aW9fZ3B1X2NtZF9zZXRfc2Nhbm91dChz
dHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LA0KPiAgIAkJCQl1aW50MzJfdCBzY2Fu
b3V0X2lkLCB1aW50MzJfdCByZXNvdXJjZV9pZCwNCj4gICAJCQkJdWludDMyX3Qgd2lkdGgs
IHVpbnQzMl90IGhlaWdodCwNCj4gQEAgLTY0NSw2ICs2NjAsMjMgQEAgdmlydGlvX2dwdV9j
bWRfcmVzb3VyY2VfYXR0YWNoX2JhY2tpbmcoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2
Z2RldiwNCj4gICAJdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3RybF9idWZmZXIodmdkZXYs
IHZidWYsIGZlbmNlKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZA0KPiArdmlydGlv
X2dwdV9jbWRfcmVzb3VyY2VfZGV0YWNoX2JhY2tpbmcoc3RydWN0IHZpcnRpb19ncHVfZGV2
aWNlICp2Z2RldiwNCj4gKwkJCQkgICAgICAgdTMyIHJlc291cmNlX2lkLA0KPiArCQkJCSAg
ICAgICBzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSAqZmVuY2UpDQo+ICt7DQo+ICsJc3RydWN0
IHZpcnRpb19ncHVfcmVzb3VyY2VfYXR0YWNoX2JhY2tpbmcgKmNtZF9wOw0KPiArCXN0cnVj
dCB2aXJ0aW9fZ3B1X3ZidWZmZXIgKnZidWY7DQo+ICsNCj4gKwljbWRfcCA9IHZpcnRpb19n
cHVfYWxsb2NfY21kKHZnZGV2LCAmdmJ1Ziwgc2l6ZW9mKCpjbWRfcCkpOw0KPiArCW1lbXNl
dChjbWRfcCwgMCwgc2l6ZW9mKCpjbWRfcCkpOw0KPiArDQo+ICsJY21kX3AtPmhkci50eXBl
ID0gY3B1X3RvX2xlMzIoVklSVElPX0dQVV9DTURfUkVTT1VSQ0VfREVUQUNIX0JBQ0tJTkcp
Ow0KPiArCWNtZF9wLT5yZXNvdXJjZV9pZCA9IGNwdV90b19sZTMyKHJlc291cmNlX2lkKTsN
Cj4gKw0KPiArCXZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHZnZGV2LCB2
YnVmLCBmZW5jZSk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2Nt
ZF9nZXRfZGlzcGxheV9pbmZvX2NiKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYs
DQo+ICAgCQkJCQkgICAgICAgc3RydWN0IHZpcnRpb19ncHVfdmJ1ZmZlciAqdmJ1ZikNCj4g
ICB7DQo+IEBAIC0xMTA3LDYgKzExMzksMTQgQEAgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF9h
dHRhY2goc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwNCj4gICAJCQkJCSAgICAg
ICBlbnRzLCBuZW50cywgTlVMTCk7DQo+ICAgfQ0KPiAgIA0KPiArdm9pZCB2aXJ0aW9fZ3B1
X29iamVjdF9kZXRhY2goc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwNCj4gKwkJ
CSAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqb2JqLA0KPiArCQkJICAgICAgc3Ry
dWN0IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlKQ0KPiArew0KPiArCXZpcnRpb19ncHVfY21k
X3Jlc291cmNlX2RldGFjaF9iYWNraW5nKHZnZGV2LCBvYmotPmh3X3Jlc19oYW5kbGUsDQo+
ICsJCQkJCSAgICAgICBmZW5jZSk7DQo+ICt9DQo+ICsNCj4gICB2b2lkIHZpcnRpb19ncHVf
Y3Vyc29yX3Bpbmcoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwNCj4gICAJCQkg
ICAgc3RydWN0IHZpcnRpb19ncHVfb3V0cHV0ICpvdXRwdXQpDQo+ICAgew0KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2RybS92aXJ0Z3B1X2RybS5oIGIvaW5jbHVkZS91YXBpL2Ry
bS92aXJ0Z3B1X2RybS5oDQo+IGluZGV4IDdiMTU4ZmNiMDJiNC4uOWZiMzhhZDE2MTIwIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmgNCj4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS92aXJ0Z3B1X2RybS5oDQo+IEBAIC00OCw2ICs0OCw3IEBAIGV4
dGVybiAiQyIgew0KPiAgICNkZWZpbmUgRFJNX1ZJUlRHUFVfR0VUX0NBUFMgIDB4MDkNCj4g
ICAjZGVmaW5lIERSTV9WSVJUR1BVX1JFU09VUkNFX0NSRUFURV9CTE9CIDB4MGENCj4gICAj
ZGVmaW5lIERSTV9WSVJUR1BVX0NPTlRFWFRfSU5JVCAweDBiDQo+ICsjZGVmaW5lIERSTV9W
SVJUR1BVX01BRFZJU0UgMHgwYw0KPiAgIA0KPiAgICNkZWZpbmUgVklSVEdQVV9FWEVDQlVG
X0ZFTkNFX0ZEX0lOCTB4MDENCj4gICAjZGVmaW5lIFZJUlRHUFVfRVhFQ0JVRl9GRU5DRV9G
RF9PVVQJMHgwMg0KPiBAQCAtMTk3LDYgKzE5OCwxNSBAQCBzdHJ1Y3QgZHJtX3ZpcnRncHVf
Y29udGV4dF9pbml0IHsNCj4gICAJX191NjQgY3R4X3NldF9wYXJhbXM7DQo+ICAgfTsNCj4g
ICANCj4gKyNkZWZpbmUgVklSVEdQVV9NQURWX1dJTExORUVEIDANCj4gKyNkZWZpbmUgVklS
VEdQVV9NQURWX0RPTlRORUVEIDENCj4gK3N0cnVjdCBkcm1fdmlydGdwdV9tYWR2aXNlIHsN
Cj4gKwlfX3UzMiBib19oYW5kbGU7DQo+ICsJX191MzIgcmV0YWluZWQ7IC8qIG91dCwgbm9u
LXplcm8gaWYgQk8gY2FuIGJlIHVzZWQgKi8NCj4gKwlfX3UzMiBtYWR2Ow0KPiArCV9fdTMy
IHBhZDsNCj4gK307DQo+ICsNCj4gICAvKg0KPiAgICAqIEV2ZW50IGNvZGUgdGhhdCdzIGdp
dmVuIHdoZW4gVklSVEdQVV9DT05URVhUX1BBUkFNX1BPTExfUklOR1NfTUFTSyBpcyBpbg0K
PiAgICAqIGVmZmVjdC4gIFRoZSBldmVudCBzaXplIGlzIHNpemVvZihkcm1fZXZlbnQpLCBz
aW5jZSB0aGVyZSBpcyBubyBhZGRpdGlvbmFsDQo+IEBAIC0yNDcsNiArMjU3LDEwIEBAIHN0
cnVjdCBkcm1fdmlydGdwdV9jb250ZXh0X2luaXQgew0KPiAgIAlEUk1fSU9XUihEUk1fQ09N
TUFORF9CQVNFICsgRFJNX1ZJUlRHUFVfQ09OVEVYVF9JTklULAkJXA0KPiAgIAkJc3RydWN0
IGRybV92aXJ0Z3B1X2NvbnRleHRfaW5pdCkNCj4gICANCj4gKyNkZWZpbmUgRFJNX0lPQ1RM
X1ZJUlRHUFVfTUFEVklTRSBcDQo+ICsJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERS
TV9WSVJUR1BVX01BRFZJU0UsIFwNCj4gKwkJIHN0cnVjdCBkcm1fdmlydGdwdV9tYWR2aXNl
KQ0KPiArDQo+ICAgI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpDQo+ICAgfQ0KPiAgICNlbmRp
Zg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Nw99LQEozhEkQ4GlZeJ9DJu6--

--------------bd9uHQE0f9jYfen5tTz75sck
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQHFTAFAwAAAAAACgkQlh/E3EQov+Aa
yhAAg8XHgpgG40Tg6vO7RH+uF08ISDMfdvGHonb6Lrp0JYp7KtZBucvju3ZZwAOq9xmHr63D9W+B
64dM8PYuSklD0AH3H8keu+jx93VZWVjpYn0MZrPui4GhXXfjq+XpJBx3dzyl5orZNb3UvUUJnKQt
M/JBwGe1llImrYyy1Qzz7GMfb/p5EonhWAvCHISP9vnj6/SbKBOm7BIojolnWuHVao9Ng4nqvLpy
7+DA0xzPMc6Frv/FlolCcdqNFuj9hwE/c+2gEvOk74QPO3b8E8wiuD3rLjA0TW+TAu2hyt7BPV5F
Y0/G9rHu+W+VrZjHq88S+z9K4gyBof6XQJIL/Rd8XMJwTI1uD3VjNRHlCNuhNjDCASODnqxUCWq+
/W2in7mrm8T/xmt1RSGicoQPRKrdQRYTNsVtAIXvg7pR3Brk5J52VhzWTUvNMyjD9fOiPPjp+sxV
wWCUd4iuu3ffDslqxchANX9I8NZQjDvN899fHF8900IVvrVK2aEYnhRTAmk0kRttn9X5Fh54D97q
ZaUqZVcBEtJOcKK0GS1H6fuwh23P6Rg3hQD2pE76/OSdq964W9tqJmewTJdvnhQXmD73AexIhKvN
ZjX7eHXnCZ0m3MPe8RmZLVd1684fID+id5pMg2ljGkzQkfUAOHK1g69TZRtS8zLW7ExYXkhViBKk
kbY=
=eVVL
-----END PGP SIGNATURE-----

--------------bd9uHQE0f9jYfen5tTz75sck--
