Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F497574E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 20:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CCA6E817;
	Thu, 25 Jul 2019 18:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730246E817
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 18:55:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PItKrR068465;
 Thu, 25 Jul 2019 13:55:20 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PItKaw062605
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 13:55:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 13:55:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 13:55:20 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PItJWc043305;
 Thu, 25 Jul 2019 13:55:19 -0500
Subject: Re: [PATCH v7 3/5] dma-buf: heaps: Add system heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>, John Stultz <john.stultz@linaro.org>
References: <20190724003656.59780-1-john.stultz@linaro.org>
 <20190724003656.59780-4-john.stultz@linaro.org>
 <20190725130204.GG20286@infradead.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <e64aae4c-ec54-2507-cc78-a27d5093f793@ti.com>
Date: Thu, 25 Jul 2019 14:55:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725130204.GG20286@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564080920;
 bh=YdD4zfwHqas8CGYaDHj00S3Kucs0PertaKix+qVtXhs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=aWkhP88SJ+JihgtMm+qXvbf7KClTa71shnT1YZAIw2q4EWJRI4ZMnCY1gEzuQ3DXT
 mhSEWSyeceD8dvlPBHscPTGZRkI9wQz245CDz311a/fxMR8qeAM1c8f4zZRvKafssZ
 dkYO6HhX2MyLkLRlpEJTvjE7Jp8CMxM4fDUWKN1s=
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>, dri-devel@lists.freedesktop.org,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSA5OjAyIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4gK3N0cnVjdCBz
eXN0ZW1faGVhcCB7Cj4+ICsJc3RydWN0IGRtYV9oZWFwICpoZWFwOwo+PiArfSBzeXNfaGVhcDsK
PiAKPiBJdCBzZWVtcyBsaWtlIHRoaXMgc3RydWN0dXJlIGNvdWxkIGJlIHJlbW92ZWQgYW5kIGlm
IHdvdWxkIGltcHJvdmUKPiB0aGUgY29kZSBmbG93Lgo+IAo+PiArc3RhdGljIHN0cnVjdCBkbWFf
aGVhcF9vcHMgc3lzdGVtX2hlYXBfb3BzID0gewo+PiArCS5hbGxvY2F0ZSA9IHN5c3RlbV9oZWFw
X2FsbG9jYXRlLAo+PiArfTsKPj4gKwo+PiArc3RhdGljIGludCBzeXN0ZW1faGVhcF9jcmVhdGUo
dm9pZCkKPj4gK3sKPj4gKwlzdHJ1Y3QgZG1hX2hlYXBfZXhwb3J0X2luZm8gZXhwX2luZm87Cj4+
ICsJaW50IHJldCA9IDA7Cj4+ICsKPj4gKwlleHBfaW5mby5uYW1lID0gInN5c3RlbV9oZWFwIjsK
Pj4gKwlleHBfaW5mby5vcHMgPSAmc3lzdGVtX2hlYXBfb3BzOwo+PiArCWV4cF9pbmZvLnByaXYg
PSAmc3lzX2hlYXA7Cj4+ICsKPj4gKwlzeXNfaGVhcC5oZWFwID0gZG1hX2hlYXBfYWRkKCZleHBf
aW5mbyk7Cj4+ICsJaWYgKElTX0VSUihzeXNfaGVhcC5oZWFwKSkKPj4gKwkJcmV0ID0gUFRSX0VS
UihzeXNfaGVhcC5oZWFwKTsKPj4gKwo+PiArCXJldHVybiByZXQ7Cj4gCj4gVGhlIGRhdGEgc3Ry
dWN0dXJlcyBoZXJlIHNlZW0gYSBsaXR0bGUgb2RkLiAgSSB0aGluayB5b3Ugd2FudCB0bzoKPiAK
PiAgLSBtYXJrIGFsbCBkbWFfaGVhcF9vcHMgaW5zdGFuZXMgY29uc3RzLCBhcyB3ZSBnZW5lcmFs
bHkgZG8gdGhhdCBmb3IKPiAgICBhbGwgc3RydWN0dXJlcyBjb250YWluaW5nIGZ1bmN0aW9uIHBv
aW50ZXJzCj4gIC0gbW92ZSB0aGUgbmFtZSBpbnRvIGRtYV9oZWFwX29wcy4KPiAgLSByZW1vdmUg
dGhlIGRtYV9oZWFwX2V4cG9ydF9pbmZvIHN0cnVjdHVyZSwgd2hpY2ggaXMgYSBiaXQgcG9pbnRs
ZXNzCgoKVGhlIGlkZWEgaGVyZSBpcyB0byBrZWVwIHRoZSBzdHJ1Y3QgZG1hX2hlYXAgYXMgYW4g
b3BhcXVlIHBvaW50ZXIgZm9yCmV2ZXJ5b25lIGJ1dCB0aGUgY29yZSBmcmFtZXdvcmsuIE5vIG9u
ZSBzaG91bGQgYmUgdG91Y2hpbmcgdGhlIGd1dHMgb2YKdGhhdCBzdHJ1Y3QgKHdvdWxkIGJlICdw
cml2YXRlJyBpZiB3ZSB3ZXJlIHVzaW5nIEMrKyBidXQgdGhpcyBpcyB0aGUKYmVzdCB3ZSBjYW4g
ZG8gd2l0aCBDKSwgZXhwb3NpbmcgaXQgdG8gdGhlIGV4cG9ydGVycyBvciB0aGUgaW1wb3J0ZXJz
CndpbGwgYnJlYWsgdGhpcyBpc29sYXRpb24uCgpUaGlzIGV4cG9ydCBzdHlsZSBhbHNvIG1hdGNo
ZXMgRE1BLUJVRjogeW91IHBhc3MgaW4gYSBmaWxsZWQgb3V0IF9leHBvcnQKc3RydWN0IGFuZCBp
dCBwYXNzZXMgYmFjayBhIGRtYV9idWYgaGFuZGxlLiBETUEtQlVGIHVuZm9ydHVuYXRlbHkgbWFk
ZQp0aGUgaW50ZXJuYWxzIG9mIHRoYXQgc3RydWN0IHB1YmxpYyBzbyB0aGV5IGFyZSB3aWRlbHkg
dXNlZCBkaXJlY3RseQooYW5kIGFidXNlZCBpbiBzb21lIGNhc2VzKSBhbmQgdGhhdCBwcmV2ZW50
cyB0aGUgaW50ZXJuYWxzIGZyb20gYmVpbmcKZWFzaWx5IHJlZmFjdG9yZWQgd2hlbiBuZWVkZWQu
CgpBbmRyZXcKCgo+ICAtIGRvbid0IGJvdGhlciBzZXR0aW5nIGEgcHJpdmF0ZSBkYXRhLCBhcyB5
b3UgZG9uJ3QgbmVlZCBpdC4KPiAgICBJZiBvdGhlciBoZWFwcyBuZWVkIHByaXZhdGUgZGF0YSBJ
J2Qgc3VnZ2VzdCB0byBzd2l0Y2ggdG8gZW1iZWRkaW5nCj4gICAgdGhlIGRtYV9oZWFwIHN0cnVj
dHVyZSBpbnRvIGNvbnRhaW5pbmcgc3RydWN0dXJlIGluc3RlZCBzbyB0aGF0IHlvdQo+ICAgIGNh
biB1c2UgY29udGFpbmVyX29mIHRvIGdldCBhdCBpdC4KPiAgLSBhbHNvIHdoeSBpcyB0aGUgZnJl
ZSBjYWxsYmFjayBwYXNzZWQgYXMgYSBjYWxsYmFjayByYXRoZXIgdGhhbgo+ICAgIGtlcHQgaW4g
ZG1hX2hlYXBfb3BzLCBuZXh0IHRvIHRoZSBwYWlyZWQgYWxsb2Mgb25lPwo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
