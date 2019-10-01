Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F61C4378
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 00:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026166E8A9;
	Tue,  1 Oct 2019 22:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1476 seconds by postgrey-1.36 at gabe;
 Tue, 01 Oct 2019 22:08:32 UTC
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.197.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE6A6E8A9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 22:08:32 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id B9AB51581
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 16:43:55 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id FPw3ihgAxBnGaFPw3isEQ8; Tue, 01 Oct 2019 16:43:55 -0500
X-Authority-Reason: nr=8
Received: from [187.192.22.73] (port=35562 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1iFPw3-000xrh-0P; Tue, 01 Oct 2019 16:43:55 -0500
Subject: Re: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
To: "Liu, Leo" <Leo.Liu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20191001171635.GA17306@embeddedor>
 <192815d9-5ecb-09a7-4624-5fd36126890d@amd.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <823b10a3-fe0e-2e8c-02c3-534944dbe6d2@embeddedor.com>
Date: Tue, 1 Oct 2019 16:43:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <192815d9-5ecb-09a7-4624-5fd36126890d@amd.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.22.73
X-Source-L: No
X-Exim-ID: 1iFPw3-000xrh-0P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.22.73]:35562
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=99YDnFG3RPp2fz/cpqdmcqqkI7Lefj451p2z13miQxA=; b=enQ4PvcrEcKyKjKFjpXYnuD36Q
 GEdrv/TxaWLzO5KeEdljF9+45OnVKh5uE5Ukna/4IAfRRKhJXnu/7atwCSH4LoHBh8IG+kTc71HX1
 vf3JkpyxEwoMOeSsVT4BjZYqjCKTeC+EQ8PULQWcvbRVa9fAaPVhm9EoUl/hsc5ljYqIGP1Wm3HRw
 uTlv6U5Nx5HpX3DT768zU/2nqU2EXbzPXj/0Rj1KWJnO07Z8P2tc8bgX8jvM11DT9YHA2wPyhOHt8
 aRFsJdqcdD1UAZ0T5Aq594/fU6TzfQBUY3CNLYZGeIWAhk1tTxUydX6Yb8+ZjD+8xlMMMxzJUlK01
 H4Jq2d+g==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMC8xLzE5IDE2OjI5LCBMaXUsIExlbyB3cm90ZToKPiAKPiBPbiAyMDE5LTEwLTAx
IDE6MTYgcC5tLiwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPj4gTm90aWNlIHRoYXQgdGhl
cmUgaXMgYSAqY29udGludWUqIHN0YXRlbWVudCBpbiB0aGUgbWlkZGxlIG9mIHRoZQo+PiBmb3Ig
bG9vcCBhbmQgdGhhdCBwcmV2ZW50cyB0aGUgY29kZSBiZWxvdyBmcm9tIGV2ZXIgYmVpbmcgcmVh
Y2hlZDoKPj4KPj4gCXIgPSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7Cj4+IAlpZiAocikg
ewo+PiAJCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7Cj4+IAkJZ290byBkb25lOwo+PiAJfQo+
Pgo+PiBGaXggdGhpcyBieSByZW1vdmluZyB0aGUgY29udGludWUgc3RhdGVtZW50IGFuZCB1cGRh
dGluZyByaW5nLT5zY2hlZC5yZWFkeQo+PiB0byB0cnVlIGJlZm9yZSBjYWxsaW5nIGFtZGdwdV9y
aW5nX3Rlc3RfcmluZyhyaW5nKS4KPj4KPj4gTm90aWNlIHRoYXQgdGhpcyBmaXggaXMgYmFzZWQg
b24KPj4gY29tbWl0IDFiNjFkZTQ1ZGZhZiAoImRybS9hbWRncHU6IGFkZCBpbml0aWFsIFZDTjIu
MCBzdXBwb3J0ICh2MikiKQo+Pgo+PiBBZGRyZXNzZXMtQ292ZXJpdHktSUQgMTQ4NTYwOCAoIlN0
cnVjdHVyYWxseSBkZWFkIGNvZGUiKQo+PiBGaXhlczogMjhjMTdkNzIwNzJiICgiZHJtL2FtZGdw
dTogYWRkIFZDTjIuNSBiYXNpYyBzdXBwb3J0cyIpCj4+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8g
QS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4+IC0tLQo+Pgo+PiBBbnkgZmVl
ZGJhY2sgaXMgZ3JlYXRseSBhcHByZWNpYXRlZC4KPj4KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjJfNS5jIHwgNSArKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzUuYwo+PiBpbmRleCAzOTVjMjI1OWY5NzkuLjQ3YjBkY2Q1OWUxMyAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCj4+IEBAIC0yNTgsNiArMjU4LDcgQEAgc3Rh
dGljIGludCB2Y25fdjJfNV9od19pbml0KHZvaWQgKmhhbmRsZSkKPj4gICAJCWFkZXYtPm5iaW9f
ZnVuY3MtPnZjbl9kb29yYmVsbF9yYW5nZShhZGV2LCByaW5nLT51c2VfZG9vcmJlbGwsCj4+ICAg
CQkJCQkJICAgICByaW5nLT5kb29yYmVsbF9pbmRleCwgaik7Cj4+ICAgCj4+ICsJCXJpbmctPnNj
aGVkLnJlYWR5ID0gdHJ1ZTsKPiAKPiBUaGlzIGlzIHJlZHVuZGFudC4gYWxsIHRoZSBzY2hlZC0+
cmVhZHkgaXMgaW5pdGlhbGl6ZWQgYXMgdHJ1ZSwgcGxlYXNlIAo+IHJlZmVyIHRvIGRybV9zY2hl
ZF9pbml0KCkKPiAKCkkgc2VlLi4uIHNvIGluIHRoZSBmb2xsb3dpbmcgY29tbWl0IDFiNjFkZTQ1
ZGZhZiAoImRybS9hbWRncHU6IGFkZCBpbml0aWFsIFZDTjIuMCBzdXBwb3J0ICh2MikiKQp0aGF0
IGxpbmUgaXMgYWxzbyByZWR1bmRhbnQ/Cgo+IAo+PiAgIAkJciA9IGFtZGdwdV9yaW5nX3Rlc3Rf
cmluZyhyaW5nKTsKPj4gICAJCWlmIChyKSB7Cj4+ICAgCQkJcmluZy0+c2NoZWQucmVhZHkgPSBm
YWxzZTsKPj4gQEAgLTI2Niw4ICsyNjcsNyBAQCBzdGF0aWMgaW50IHZjbl92Ml81X2h3X2luaXQo
dm9pZCAqaGFuZGxlKQo+PiAgIAo+PiAgIAkJZm9yIChpID0gMDsgaSA8IGFkZXYtPnZjbi5udW1f
ZW5jX3JpbmdzOyArK2kpIHsKPj4gICAJCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdf
ZW5jW2ldOwo+PiAtCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKPj4gLQkJCWNvbnRpbnVl
Owo+PiArCQkJcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOwo+IAo+IEJlY2F1c2UgdGhlIFZDTiAy
LjUgRlcgc3RpbGwgaGFzIGlzc3VlIGZvciBlbmNvZGUsIHNvIHdlIGhhdmUgaXQgCj4gZGlzYWJs
ZWQgaGVyZS4KPiAKCk9LLiBTbywgbWF5YmUgd2UgY2FuIGFkZCBhIGNvbW1lbnQgcG9pbnRpbmcg
dGhhdCBvdXQ/CgpUaGFua3MKLS0KR3VzdGF2bwoKPiAKPj4gICAJCQlyID0gYW1kZ3B1X3Jpbmdf
dGVzdF9yaW5nKHJpbmcpOwo+PiAgIAkJCWlmIChyKSB7Cj4+ICAgCQkJCXJpbmctPnNjaGVkLnJl
YWR5ID0gZmFsc2U7Cj4+IEBAIC0yNzYsNiArMjc2LDcgQEAgc3RhdGljIGludCB2Y25fdjJfNV9o
d19pbml0KHZvaWQgKmhhbmRsZSkKPj4gICAJCX0KPj4gICAKPj4gICAJCXJpbmcgPSAmYWRldi0+
dmNuLmluc3Rbal0ucmluZ19qcGVnOwo+PiArCQlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7Cj4+
ICAgCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwo+PiAgIAkJaWYgKHIpIHsKPj4g
ICAJCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
