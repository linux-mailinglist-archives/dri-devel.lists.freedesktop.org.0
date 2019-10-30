Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CCFE9F6B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 16:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11716E7BE;
	Wed, 30 Oct 2019 15:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C8F6E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 15:45:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UFjUGI041498;
 Wed, 30 Oct 2019 10:45:30 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UFjUZE052981
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Oct 2019 10:45:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 10:45:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 10:45:17 -0500
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UFjTAV053464;
 Wed, 30 Oct 2019 10:45:29 -0500
Subject: Re: [PATCH][next] dma-buf: heaps: remove redundant assignment to
 variable ret
To: Colin King <colin.king@canonical.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian
 Starkey <brian.starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20191030150253.10596-1-colin.king@canonical.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
Date: Wed, 30 Oct 2019 11:45:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030150253.10596-1-colin.king@canonical.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1572450330;
 bh=AHoLJ8adzPwxHX1a589zAeFTY5yfqdJKods3HIWHw1s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=IRqwZzfeVWHkrLE7mi338boJPe+azr5q5rDUMCQMkGXou6X4e9scZyROk/0ifhXzU
 Kk/6NvmtF+8+zwpb86SZaXvNILtOH0oklzh+5KKq2VIwz900c/w9WEdI5I1iwRUkV0
 ADbIVQu84r9nzwK31Jec9Tu1qu/T404pTE1aiknc=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMzAvMTkgMTE6MDIgQU0sIENvbGluIEtpbmcgd3JvdGU6Cj4gRnJvbTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBUaGUgdmFyaWFibGUgcmV0IGlz
IGJlaW5nIGFzc2lnbmVkIHdpdGggYSB2YWx1ZSB0aGF0IGlzIG5ldmVyCj4gcmVhZCwgaXQgaXMg
YmVpbmcgcmUtYXNzaWduZWQgdGhlIHNhbWUgdmFsdWUgb24gdGhlIGVycjAgZXhpdAo+IHBhdGgu
IFRoZSBhc3NpZ25tZW50IGlzIHJlZHVuZGFudCBhbmQgaGVuY2UgY2FuIGJlIHJlbW92ZWQuCj4g
Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCj4gRml4ZXM6IDQ3YTMyZjlj
MTIyNiAoImRtYS1idWY6IGhlYXBzOiBBZGQgc3lzdGVtIGhlYXAgdG8gZG1hYnVmIGhlYXBzIikK
PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
Pgo+IC0tLQoKClRoZSByb290IG9mIHRoZSBpc3N1ZSBpcyB0aGF0IHJldCBpcyBub3QgdXNlZCBp
biB0aGUgZXJyb3IgcGF0aCwgaXQKc2hvdWxkIGJlLCBJIHN1Z2dlc3QgdGhpcyBmaXg6Cgo+IC0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gKysrIGIvZHJpdmVycy9k
bWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKPiBAQCAtOTgsNyArOTgsNyBAQCBzdGF0aWMgaW50
IHN5c3RlbV9oZWFwX2FsbG9jYXRlKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCwKPiAgZXJyMDoKPiAg
ICAgICAgIGtmcmVlKGhlbHBlcl9idWZmZXIpOwo+ICAKPiAtICAgICAgIHJldHVybiAtRU5PTUVN
Owo+ICsgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
bWFfaGVhcF9vcHMgc3lzdGVtX2hlYXBfb3BzID0gewoKQW5kcmV3CgoKPiAgZHJpdmVycy9kbWEt
YnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgfCA0ICstLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVh
cC5jCj4gaW5kZXggNDU1NzgyZWZiYjMyLi44MTdhMTY2N2JkNTcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYv
aGVhcHMvc3lzdGVtX2hlYXAuYwo+IEBAIC01NSwxMCArNTUsOCBAQCBzdGF0aWMgaW50IHN5c3Rl
bV9oZWFwX2FsbG9jYXRlKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCwKPiAgCWhlbHBlcl9idWZmZXIt
PnBhZ2VzID0ga21hbGxvY19hcnJheShoZWxwZXJfYnVmZmVyLT5wYWdlY291bnQsCj4gIAkJCQkJ
ICAgICBzaXplb2YoKmhlbHBlcl9idWZmZXItPnBhZ2VzKSwKPiAgCQkJCQkgICAgIEdGUF9LRVJO
RUwpOwo+IC0JaWYgKCFoZWxwZXJfYnVmZmVyLT5wYWdlcykgewo+IC0JCXJldCA9IC1FTk9NRU07
Cj4gKwlpZiAoIWhlbHBlcl9idWZmZXItPnBhZ2VzKQo+ICAJCWdvdG8gZXJyMDsKPiAtCX0KPiAg
Cj4gIAlmb3IgKHBnID0gMDsgcGcgPCBoZWxwZXJfYnVmZmVyLT5wYWdlY291bnQ7IHBnKyspIHsK
PiAgCQkvKgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
