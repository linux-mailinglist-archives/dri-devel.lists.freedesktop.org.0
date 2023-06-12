Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2FF72BA30
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6947110E1B5;
	Mon, 12 Jun 2023 08:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2181510E1B5;
 Mon, 12 Jun 2023 08:21:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFD8220485;
 Mon, 12 Jun 2023 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686558062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TdrLAeVWKZ2K0i2OdY6lfA1U8z91GiIRW8KI/0jbzEQ=;
 b=URT05bxd5wSnxMcNCZlhAnfywdSu1GwKCiR/7/CLEPUmPgY1fNFJ99FaUrzAGvxkmRLvsc
 z2ODEBCUfm1Of72hOHZ3h2poUzyLK9MyJ690Ho+jVefzukom18BHFxi/w3BQ9EMOcIIhtC
 uBZg7jO9AJk3A2HOD5VQL+R2sdXAF3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686558062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TdrLAeVWKZ2K0i2OdY6lfA1U8z91GiIRW8KI/0jbzEQ=;
 b=LUvqS52dxiRn1PPAlNbYqF+uXoArk3ZO/B2SemiXIqtPjsPXDtgeUTTZN0ihEKRX+Xg3/X
 0tk7+hCSf4hK+RBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8938B138EC;
 Mon, 12 Jun 2023 08:21:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oUoOIG7VhmSXdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 08:21:02 +0000
Message-ID: <53a2cbc6-321d-704c-d6cc-f2fcc249f321@suse.de>
Date: Mon, 12 Jun 2023 10:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QsfmT5zpIdD9p0zDkjiIWB9j"
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
Cc: Degdag Mohamed <degdagmohamed@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QsfmT5zpIdD9p0zDkjiIWB9j
Content-Type: multipart/mixed; boundary="------------uvUPj6n46VChPGzrHi85pBIh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, Degdag Mohamed
 <degdagmohamed@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Message-ID: <53a2cbc6-321d-704c-d6cc-f2fcc249f321@suse.de>
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>

--------------uvUPj6n46VChPGzrHi85pBIh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDYuMjMgdW0gMDU6MTYgc2NocmllYiBEbWl0cnkgQmFyeXNoa292Og0K
PiBTaW5jZSBjb21taXQgOTNlODFlMzhlMTk3ICgiZHJtL2ZiX2hlbHBlcjogTWluaW1pemUg
ZGFtYWdlLWhlbHBlcg0KPiBvdmVyaGVhZCIpIHRoZSBkcm1fZmJfaGVscGVyX2Z1bmNzOjpm
Yl9kaXJ0eSBoZWxwZXIgaXMgcmVxdWlyZWQgZm9yDQo+IHByb3BlciBkaXJ0eS9kYW1hZ2Ug
cHJvY2Vzc2luZy4gVGhlIGRybS9tc20gZHJpdmVyIHJlcXVpcmVzIHRoYXQgdG8NCj4gZnVu
Y3Rpb24gdG8gbGV0IENNRCBwYW5lbHMgdG8gd29yay4gVXNlIHNpbXBsaWZpZWQgdmVyc2lv
biBvZg0KPiBkcm1fZmJkZXZfZ2VuZXJpY19oZWxwZXJfZmJfZGlydHkoKSB0byBmaXggc3Vw
cG9ydCBmb3IgQ01EIG1vZGUgcGFuZWxzLg0KPiANCj4gUmVwb3J0ZWQtYnk6IERlZ2RhZyBN
b2hhbWVkIDxkZWdkYWdtb2hhbWVkQGdtYWlsLmNvbT4NCj4gRml4ZXM6IDkzZTgxZTM4ZTE5
NyAoImRybS9mYl9oZWxwZXI6IE1pbmltaXplIGRhbWFnZS1oZWxwZXIgb3ZlcmhlYWQiKQ0K
PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNpZ25l
ZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9y
Zz4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KDQpUbyBtYWtlIG1tYXAgd29yayBjb3JyZWN0bHksIHlvdSdsbCBhbHNvIG5lZWQg
ZGVmZXJyZWQgSS9PIGluIHRoZSBmYmRldiANCmNvZGUuIEFGQUlDVCB0aGUgZHJpdmVyIG5l
dmVyIHN1cHBvcnRlZCB0aGF0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMgfCAyMCArKysrKysrKysrKysr
KysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2ZiZGV2LmMNCj4gaW5kZXggZmE5YzFjYmZmYWUzLi5iOTMzYTg1
NDIwZjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYw0KPiBAQCAtMTM5LDgg
KzEzOSwyOCBAQCBzdGF0aWMgaW50IG1zbV9mYmRldl9jcmVhdGUoc3RydWN0IGRybV9mYl9o
ZWxwZXIgKmhlbHBlciwNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0
aWMgaW50IG1zbV9mYmRldl9mYl9kaXJ0eShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVy
LA0KPiArCQkJICAgICAgc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXApDQo+ICt7DQo+ICsJ
c3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGhlbHBlci0+ZGV2Ow0KPiArCWludCByZXQ7DQo+
ICsNCj4gKwkvKiBDYWxsIGRhbWFnZSBoYW5kbGVycyBvbmx5IGlmIG5lY2Vzc2FyeSAqLw0K
PiArCWlmICghKGNsaXAtPngxIDwgY2xpcC0+eDIgJiYgY2xpcC0+eTEgPCBjbGlwLT55Mikp
DQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICsJaWYgKGhlbHBlci0+ZmItPmZ1bmNzLT5kaXJ0
eSkgew0KPiArCQlyZXQgPSBoZWxwZXItPmZiLT5mdW5jcy0+ZGlydHkoaGVscGVyLT5mYiwg
TlVMTCwgMCwgMCwgY2xpcCwgMSk7DQo+ICsJCWlmIChkcm1fV0FSTl9PTkNFKGRldiwgcmV0
LCAiRGlydHkgaGVscGVyIGZhaWxlZDogcmV0PSVkXG4iLCByZXQpKQ0KPiArCQkJcmV0dXJu
IHJldDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9mdW5jcyBtc21fZmJfaGVscGVyX2Z1bmNz
ID0gew0KPiAgIAkuZmJfcHJvYmUgPSBtc21fZmJkZXZfY3JlYXRlLA0KPiArCS5mYl9kaXJ0
eSA9IG1zbV9mYmRldl9mYl9kaXJ0eSwNCj4gICB9Ow0KPiAgIA0KPiAgIC8qDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------uvUPj6n46VChPGzrHi85pBIh--

--------------QsfmT5zpIdD9p0zDkjiIWB9j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSG1W0FAwAAAAAACgkQlh/E3EQov+Cu
dRAAjjohV8KNsT2jGu9QpXgQcFIkJS9M+YFycY7iCUPHjHn8jKFeowDG8uYwxsrgdPyCfiE+w7fz
Z7HPgg5FgXRq1/V+bnb+IP/H2KB1sVFUW3TgfACNd9Ya86A5szrFRR12tHM+gw8bRSsfZkSNEjRN
WlCfXLamDqUnbNFY6ZWoNMLNfg7zGPtnIb3JqfAqIOjKB1sfMt9J/u8sYaosZdFPJ8lVoHKNpHEI
gNOv3P3XXul7/47FLIyFYtLheIR5sp+UiuC3n7oMqtjGQF8iMl/EnEQ5Lf84tOoyj0X2L/n9AyGN
d0sZ8bNc5lDoYsP37mIfUngTwRUyjwv6XR0dq8KIREBvFE3MVACkSGICEz+DFNUOi4TCPEkZEPRd
i4D4YWcyNnlpmVtvq+rhWKvLW543XT+TEtuazgnTxdwfOKy6mWE5WEqUcsO3A9gclzEglOZEhEFG
HSEZ8YaKnVPDNvUoAMKAzB3zbr90ioHYBKj+VIxTJ2GKum1NhSpktkVjmjKDEw/4b4xFqUwAMQkS
7GCAYL2lX6H8sDqMLfzoIIxFuc/czDpwV0daoieipXacOPlniiKyf7Kkd+qkQHqr9Xd41mbEQY92
9/CBZX5V3UZBFqFtfWQf7+gF+Cngpk/zs2oT+8tJwhrpdsgKPDTMJ2l9c4FvJ6ZIWr4QKZbOnGqB
fKk=
=MQsR
-----END PGP SIGNATURE-----

--------------QsfmT5zpIdD9p0zDkjiIWB9j--
