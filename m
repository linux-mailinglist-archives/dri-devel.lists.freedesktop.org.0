Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FC17621C9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 20:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D9310E3EC;
	Tue, 25 Jul 2023 18:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2401410E16E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 18:50:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD51F1F38C;
 Tue, 25 Jul 2023 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690311044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yflSHrM/7ZrA3cNrHkIst3Ykk290hSPumnqNEi5LzRs=;
 b=ZbBsGU11PvT1+oIS5U9p2+uZmPe3NrsR9Xyc4hTM2tsnXy1wqOA2aPT1aHlPDDEGyUprD+
 Fk4D58VKfaVdSDhe54bN7KqqGvPoz8BQfTD+vKC9c2X1qZ9ks6C2GsdcFZuzRJn3h3AGd5
 XCR+vxPdDBkUz24l3eXV60aqNKPRQd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690311044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yflSHrM/7ZrA3cNrHkIst3Ykk290hSPumnqNEi5LzRs=;
 b=Ku61Mn4xUD++n+ZcI0f300XV2tADC+3q4hvNzOsp/PFeAG9dEA1ZXSrIeYRZhO/jSlzPsu
 /R25oZaCicIPmxCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BAB1613487;
 Tue, 25 Jul 2023 18:50:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bLOOLIQZwGQ9fgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jul 2023 18:50:44 +0000
Message-ID: <77a41226-b671-1895-6182-457f7fee9bda@suse.de>
Date: Tue, 25 Jul 2023 20:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/shmem-helper: Reset vma->vm_ops before calling
 dma_buf_mmap()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230724112610.60974-1-boris.brezillon@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230724112610.60974-1-boris.brezillon@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2RAtmm0UdYst3US6QvqHJVbd"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Roman Stratiienko <roman.stratiienko@globallogic.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2RAtmm0UdYst3US6QvqHJVbd
Content-Type: multipart/mixed; boundary="------------ivtOjhe6YB0FypaNcq46p9vk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 Roman Stratiienko <roman.stratiienko@globallogic.com>
Message-ID: <77a41226-b671-1895-6182-457f7fee9bda@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Reset vma->vm_ops before calling
 dma_buf_mmap()
References: <20230724112610.60974-1-boris.brezillon@collabora.com>
In-Reply-To: <20230724112610.60974-1-boris.brezillon@collabora.com>

--------------ivtOjhe6YB0FypaNcq46p9vk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDcuMjMgdW0gMTM6MjYgc2NocmllYiBCb3JpcyBCcmV6aWxsb246DQo+
IFRoZSBkbWEtYnVmIGJhY2tlbmQgaXMgc3VwcG9zZWQgdG8gcHJvdmlkZSBpdHMgb3duIHZt
X29wcywgYnV0IHNvbWUNCj4gaW1wbGVtZW50YXRpb24ganVzdCBoYXZlIG5vdGhpbmcgc3Bl
Y2lhbCB0byBkbyBhbmQgbGVhdmUgdm1fb3BzDQo+IHVudG91Y2hlZCwgcHJvYmFibHkgZXhw
ZWN0aW5nIHRoaXMgZmllbGQgdG8gYmUgemVybyBpbml0aWFsaXplZCAodGhpcw0KPiBpcyB0
aGUgY2FzZSB3aXRoIHRoZSBzeXN0ZW1faGVhcCBpbXBsZW1lbnRhdGlvbiBmb3IgaW5zdGFu
Y2UpLg0KPiBMZXQncyByZXNldCB2bWEtPnZtX29wcyB0byBOVUxMIHRvIGtlZXAgdGhpbmdz
IHdvcmtpbmcgd2l0aCB0aGVzZQ0KPiBpbXBsZW1lbnRhdGlvbnMuDQoNClRoYW5rcyBmb3Ig
eW91ciBwYXRjaC4gVGhpcyBidWcgY291bGQgYWZmZWN0IGEgbnVtYmVyIG9mIEdFTSANCmlt
cGxlbWVudGF0aW9ucy4gSW5zdGVhZCBvZiBmaXhpbmcgdGhpcyBpbmRpdmlkdWFsbHksIGNv
dWxkIHdlIHNldCB0aGUgDQpmaWVsZHMgY29uZGl0aW9uYWxseSBhdA0KDQogDQpodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni40L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jI0wxMDQyDQoNCj8NCg0KU29tZXRoaW5nIGxpa2UNCg0KICAgaWYgKCFvYmpl
Y3QtPmltcG9ydF9hdHRhY2gpIHsNCiAgICAgdm1hLT5wcml2ID0NCiAgICAgdm1hLT5vcHMg
PQ0KICAgfQ0KDQpwbHVzIGEgZGVzY3JpcHRpdmUgY29tbWVudCBsaWtlIHRoZSBvbmUgeW91
IGhhdmUgaW4geW91ciBwYXRjaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4g
Rml4ZXM6IDI2ZDNhYzNjYjA0ZCAoImRybS9zaG1lbS1oZWxwZXJzOiBSZWRpcmVjdCBtbWFw
IGZvciBpbXBvcnRlZCBkbWEtYnVmIikNCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
Pg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4gUmVw
b3J0ZWQtYnk6IFJvbWFuIFN0cmF0aWllbmtvIDxyb21hbi5zdHJhdGlpZW5rb0BnbG9iYWxs
b2dpYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5jIHwgNiArKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxw
ZXIuYw0KPiBpbmRleCA0ZWE2NTA3YTc3ZTUuLmJhYWYwZTBmZWIwNiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4gQEAgLTYyMyw3ICs2MjMs
MTMgQEAgaW50IGRybV9nZW1fc2htZW1fbW1hcChzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmpl
Y3QgKnNobWVtLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QNCj4gICAJaW50IHJldDsNCj4gICAN
Cj4gICAJaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkgew0KPiArCQkvKiBSZXNldCBib3RoIHZt
X29wcyBhbmQgdm1fcHJpdmF0ZV9kYXRhLCBzbyB3ZSBkb24ndCBlbmQgdXAgd2l0aA0KPiAr
CQkgKiB2bV9vcHMgcG9pbnRpbmcgdG8gb3VyIGltcGxlbWVudGF0aW9uIGlmIHRoZSBkbWEt
YnVmIGJhY2tlbmQNCj4gKwkJICogZG9lc24ndCBzZXQgdGhvc2UgZmllbGRzLg0KPiArCQkg
Ki8NCj4gICAJCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gTlVMTDsNCj4gKwkJdm1hLT52bV9v
cHMgPSBOVUxMOw0KPiArDQo+ICAgCQlyZXQgPSBkbWFfYnVmX21tYXAob2JqLT5kbWFfYnVm
LCB2bWEsIDApOw0KPiAgIA0KPiAgIAkJLyogRHJvcCB0aGUgcmVmZXJlbmNlIGRybV9nZW1f
bW1hcF9vYmooKSBhY3F1aXJlZC4qLw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBN
b2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------ivtOjhe6YB0FypaNcq46p9vk--

--------------2RAtmm0UdYst3US6QvqHJVbd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTAGYMFAwAAAAAACgkQlh/E3EQov+CJ
Fw/+L8VLenUfBFUFhJfRDdgqlUzxi2WdsiD1wI56Pk7rYL5Fw/reJt68Na1jjvnht1mlHiAT6LUS
wdswkaDLemIurdgsM//0JB0sdMjsMG/T0AghuTOzj+zp1UvbvAw/92y92rrX6QHUagZ+ed/GigjA
zAPfwTdc2T4KapweDx8imXv/0QLGYxKugWFd6YEvQD2jdIJtZDHFPcVso5W4S2ZeFN0sGWPUJGUf
QGptSRLu7rNt9w79m5+7SiiKvmgabtWHry9/sRy1V3qr6ej7bF4lap6VDGDv1xKi97whDT7kJe2N
Hn+tNaD3M4qYBrV4eOmNtHQuUcxnDrQ5tNZTkqKAVhoCDbHk1wyBOiP1FhOC7wbJKo/656civjUf
YilTLONXQ6NbJixEd9XpINbGnIEHY06FBOzOj/xdN6t+MKoJU+tw8za7glUVFTjE6knb61lEg2+R
GBUX3vaL4uSys5t30YYYRy0Ts7rKfuzLNJ0j5qgwu4AzZEOamGQDy3DhmZJAoZyJzRJU91IqL02U
QPE3C01gHzl75MJ6shrMhHsf3DX5RiviBUP6IkS4uD2YKhEiXANBOvJU6B+Bm7HHbvij5dBd0/7n
o5534eXIMMRcAS1Py35yghnazRjHV+0L8IxbaVplYKMJ4zWpgPA1KV/qPAAEUS/Dei+vc8GAAJF1
2tE=
=UAUu
-----END PGP SIGNATURE-----

--------------2RAtmm0UdYst3US6QvqHJVbd--
