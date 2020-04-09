Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CA1A3847
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 18:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8E86EC05;
	Thu,  9 Apr 2020 16:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA976EC05
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CA9C83F47A;
 Thu,  9 Apr 2020 18:51:36 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=lH4Z0hA7; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFOiW8lmdveu; Thu,  9 Apr 2020 18:51:36 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DB1853F319;
 Thu,  9 Apr 2020 18:51:35 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A7E15360342;
 Thu,  9 Apr 2020 18:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586451095; bh=jbBjFmyKcewZFRG4cPQaDKRAG9Pfg/ymsWcTvFNmMOM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lH4Z0hA7hZwVu0FzC/F1u6LXcF7+Hr2A2vnVIHZ9omxJs66wXn6Mlvrqg/zQPNGfZ
 5ftmZfU6MKkEOwfM7GK4wz39X/iN258AeoSIESLjniHH0X1G2AxYe4I+mjeg7B0rVf
 wigkvF7bgzSJBI24W+s+iC8LxTwylEnfy2ejWYbQ=
Subject: Re: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback
To: airlied@gmail.com, airlied@redhat.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20200409164925.11912-1-thomas_os@shipmail.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <85a0a97b-0c8f-9121-94de-1f794c2bd294@shipmail.org>
Date: Thu, 9 Apr 2020 18:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200409164925.11912-1-thomas_os@shipmail.org>
Content-Language: en-US
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
Cc: Alex Xu <alex_y_xu@yahoo.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGF2ZSwgQ2hyaXN0aWFuLAoKQ291bGQgYW55IG9mIHlvdSBwaWNrIHRoaXMgdXAgKEknbSBjdXJy
ZW50bHkgb24gdmFjYXRpb24pIHRvIGhhdmUgYSAKY2hhbmNlIG9mIGdldHRpbmcgaXQgaW4gYmVm
b3JlIC1yYzE/ClRoYW5rcywKVGhvbWFzCgoKT24gNC85LzIwIDY6NDkgUE0sIFRob21hcyBIZWxs
c3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+IEZyb206ICJUaG9tYXMgSGVsbHN0cm9tIChWTXdhcmUp
IiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4KPgo+IFdpdGggYW1kZ3B1IGFuZCBDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0VfQUxXQVlTPXksIHRoZXJlIGFyZQo+IGVycm9ycyBsaWtlOgo+IEJV
Rzogbm9uLXplcm8gcGd0YWJsZXNfYnl0ZXMgb24gZnJlZWluZyBtbQo+IGFuZDoKPiBCVUc6IEJh
ZCByc3MtY291bnRlciBzdGF0ZQo+IHdpdGggVFRNIHRyYW5zcGFyZW50IGh1Z2UtcGFnZXMuCj4g
VW50aWwgd2UndmUgZmlndXJlZCBvdXQgd2hhdCBvdGhlciBUVE0gZHJpdmVycyBkbyBkaWZmZXJl
bnRseSBjb21wYXJlZCB0bwo+IHZtd2dmeCwgZGlzYWJsZSB0aGUgaHVnZV9mYXVsdCgpIGNhbGxi
YWNrLCBlbGltaW5hdGluZyB0cmFuc2h1Z2UKPiBwYWdlLXRhYmxlIGVudHJpZXMuCj4KPiBDYzog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+Cj4g
UmVwb3J0ZWQtYnk6IEFsZXggWHUgKEhlbGxvNzEpIDxhbGV4X3lfeHVAeWFob28uY2E+Cj4gVGVz
dGVkLWJ5OiBBbGV4IFh1IChIZWxsbzcxKSA8YWxleF95X3h1QHlhaG9vLmNhPgo+IEFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNjMgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNjMgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMKPiBpbmRleCA2ZWUzYjk2ZjBkMTMuLjBhZDMwYjExMjk4MiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+IEBAIC00NDIsNjYgKzQ0Miw2IEBAIHZtX2ZhdWx0
X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ICAgfQo+ICAgRVhQT1JU
X1NZTUJPTCh0dG1fYm9fdm1fZmF1bHQpOwo+ICAgCj4gLSNpZmRlZiBDT05GSUdfVFJBTlNQQVJF
TlRfSFVHRVBBR0UKPiAtLyoqCj4gLSAqIHR0bV9wZ3Byb3RfaXNfd3Jwcm90ZWN0aW5nIC0gSXMg
YSBwYWdlIHByb3RlY3Rpb24gdmFsdWUgd3JpdGUtcHJvdGVjdGluZz8KPiAtICogQHByb3Q6IFRo
ZSBwYWdlIHByb3RlY3Rpb24gdmFsdWUKPiAtICoKPiAtICogUmV0dXJuOiB0cnVlIGlmIEBwcm90
IGlzIHdyaXRlLXByb3RlY3RpbmcuIGZhbHNlIG90aGVyd2lzZS4KPiAtICovCj4gLXN0YXRpYyBi
b29sIHR0bV9wZ3Byb3RfaXNfd3Jwcm90ZWN0aW5nKHBncHJvdF90IHByb3QpCj4gLXsKPiAtCS8q
Cj4gLQkgKiBUaGlzIGlzIG1lYW50IHRvIHNheSAicGdwcm90X3dycHJvdGVjdChwcm90KSA9PSBw
cm90IiBpbiBhIGdlbmVyaWMKPiAtCSAqIHdheS4gVW5mb3J0dW5hdGVseSB0aGVyZSBpcyBubyBn
ZW5lcmljIHBncHJvdF93cnByb3RlY3QuCj4gLQkgKi8KPiAtCXJldHVybiBwdGVfdmFsKHB0ZV93
cnByb3RlY3QoX19wdGUocGdwcm90X3ZhbChwcm90KSkpKSA9PQo+IC0JCXBncHJvdF92YWwocHJv
dCk7Cj4gLX0KPiAtCj4gLXN0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192bV9odWdlX2ZhdWx0KHN0
cnVjdCB2bV9mYXVsdCAqdm1mLAo+IC0JCQkJICAgICAgIGVudW0gcGFnZV9lbnRyeV9zaXplIHBl
X3NpemUpCj4gLXsKPiAtCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7Cj4g
LQlwZ3Byb3RfdCBwcm90Owo+IC0Jc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+
dm1fcHJpdmF0ZV9kYXRhOwo+IC0Jdm1fZmF1bHRfdCByZXQ7Cj4gLQlwZ29mZl90IGZhdWx0X3Bh
Z2Vfc2l6ZSA9IDA7Cj4gLQlib29sIHdyaXRlID0gdm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfV1JJ
VEU7Cj4gLQo+IC0Jc3dpdGNoIChwZV9zaXplKSB7Cj4gLQljYXNlIFBFX1NJWkVfUE1EOgo+IC0J
CWZhdWx0X3BhZ2Vfc2l6ZSA9IEhQQUdFX1BNRF9TSVpFID4+IFBBR0VfU0hJRlQ7Cj4gLQkJYnJl
YWs7Cj4gLSNpZmRlZiBDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRAo+
IC0JY2FzZSBQRV9TSVpFX1BVRDoKPiAtCQlmYXVsdF9wYWdlX3NpemUgPSBIUEFHRV9QVURfU0la
RSA+PiBQQUdFX1NISUZUOwo+IC0JCWJyZWFrOwo+IC0jZW5kaWYKPiAtCWRlZmF1bHQ6Cj4gLQkJ
V0FSTl9PTl9PTkNFKDEpOwo+IC0JCXJldHVybiBWTV9GQVVMVF9GQUxMQkFDSzsKPiAtCX0KPiAt
Cj4gLQkvKiBGYWxsYmFjayBvbiB3cml0ZSBkaXJ0eS10cmFja2luZyBvciBDT1cgKi8KPiAtCWlm
ICh3cml0ZSAmJiB0dG1fcGdwcm90X2lzX3dycHJvdGVjdGluZyh2bWEtPnZtX3BhZ2VfcHJvdCkp
Cj4gLQkJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwo+IC0KPiAtCXJldCA9IHR0bV9ib192bV9y
ZXNlcnZlKGJvLCB2bWYpOwo+IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+IC0KPiAtCXBy
b3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwo+IC0JcmV0ID0gdHRtX2JvX3Zt
X2ZhdWx0X3Jlc2VydmVkKHZtZiwgcHJvdCwgMSwgZmF1bHRfcGFnZV9zaXplKTsKPiAtCWlmIChy
ZXQgPT0gVk1fRkFVTFRfUkVUUlkgJiYgISh2bWYtPmZsYWdzICYgRkFVTFRfRkxBR19SRVRSWV9O
T1dBSVQpKQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+IC0JZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNl
LnJlc3YpOwo+IC0KPiAtCXJldHVybiByZXQ7Cj4gLX0KPiAtI2VuZGlmCj4gLQo+ICAgdm9pZCB0
dG1fYm9fdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgIHsKPiAgIAlzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gdm1hLT52bV9wcml2YXRlX2RhdGE7Cj4gQEAgLTYw
NCw5ICs1NDQsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHR0
bV9ib192bV9vcHMgPSB7Cj4gICAJLm9wZW4gPSB0dG1fYm9fdm1fb3BlbiwKPiAgIAkuY2xvc2Ug
PSB0dG1fYm9fdm1fY2xvc2UsCj4gICAJLmFjY2VzcyA9IHR0bV9ib192bV9hY2Nlc3MsCj4gLSNp
ZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKPiAtCS5odWdlX2ZhdWx0ID0gdHRtX2Jv
X3ZtX2h1Z2VfZmF1bHQsCj4gLSNlbmRpZgo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqdHRtX2JvX3ZtX2xvb2t1cChzdHJ1Y3QgdHRtX2JvX2RldmljZSAq
YmRldiwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
