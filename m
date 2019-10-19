Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF5CDD8D1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 15:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A8289C61;
	Sat, 19 Oct 2019 13:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B7F89C61
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 13:41:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9JDfTkN125035;
 Sat, 19 Oct 2019 08:41:29 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9JDfTfn021037;
 Sat, 19 Oct 2019 08:41:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 19
 Oct 2019 08:41:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 19 Oct 2019 08:41:20 -0500
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9JDfRi3035486;
 Sat, 19 Oct 2019 08:41:27 -0500
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: Ayan Halder <Ayan.Halder@arm.com>, John Stultz <john.stultz@linaro.org>
References: <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
 <20191018184123.GA10634@arm.com>
 <CALAqxLXzOjyD1MpGeuZKLz+RNz1Utd8QpbvtSOodeqT-gCu6kA@mail.gmail.com>
 <20191018185723.GA27993@arm.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <2c60496c-d536-05e7-bbf6-ca718b8142bd@ti.com>
Date: Sat, 19 Oct 2019 09:41:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018185723.GA27993@arm.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571492489;
 bh=DmYO2V942wLpuwNiTtTayFpdllmo+iJzhiSMhP26u/g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UTSqZc6r8krYXrHmy1ZpIhPO9ccuvhSPNmb3tebs+a0piJ+Vymf9PgSztOX+ZQwpr
 PqZm1gzUNxYkBexVB9jWRWK0K8lJNuCYbiot3hIJpgwSTb8Ur17dlYfgCoNw+H1O3q
 lm6/zxBJJ20WIG0UvCVFkqw4g+HCxjUIOALy7ZVc=
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
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTgvMTkgMjo1NyBQTSwgQXlhbiBIYWxkZXIgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTgs
IDIwMTkgYXQgMTE6NDk6MjJBTSAtMDcwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4+IE9uIEZyaSwg
T2N0IDE4LCAyMDE5IGF0IDExOjQxIEFNIEF5YW4gSGFsZGVyIDxBeWFuLkhhbGRlckBhcm0uY29t
PiB3cm90ZToKPj4+IE9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0IDA5OjU1OjE3QU0gKzAwMDAsIEJy
aWFuIFN0YXJrZXkgd3JvdGU6Cj4+Pj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDE6NTc6NDVQ
TSAtMDcwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4+Pj4+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0
IDEyOjI5IFBNIEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4gd3JvdGU6Cj4+Pj4+PiBPbiAx
MC8xNy8xOSAzOjE0IFBNLCBKb2huIFN0dWx0eiB3cm90ZToKPj4+Pj4+PiBCdXQgaWYgdGhlIG9i
amVjdGlvbiBzdGFuZHMsIGRvIHlvdSBoYXZlIGEgcHJvcG9zYWwgZm9yIGFuIGFsdGVybmF0aXZl
Cj4+Pj4+Pj4gd2F5IHRvIGVudW1lcmF0ZSBhIHN1YnNldCBvZiBDTUEgaGVhcHM/Cj4+Pj4+Pj4K
Pj4+Pj4+IFdoZW4gaW4gc3RhZ2luZyBJT04gaGFkIHRvIHJlYWNoIGludG8gdGhlIENNQSBmcmFt
ZXdvcmsgYXMgdGhlIG90aGVyCj4+Pj4+PiBkaXJlY3Rpb24gd291bGQgbm90IGJlIGFsbG93ZWQs
IHNvIGNtYV9mb3JfZWFjaF9hcmVhKCkgd2FzIGFkZGVkLiBJZgo+Pj4+Pj4gRE1BLUJVRiBoZWFw
cyBpcyBub3QgaW4gc3RhZ2luZyB0aGVuIHdlIGNhbiBkbyB0aGUgb3Bwb3NpdGUsIGFuZCBoYXZl
Cj4+Pj4+PiB0aGUgQ01BIGZyYW1ld29yayByZWdpc3RlciBoZWFwcyBpdHNlbGYgdXNpbmcgb3Vy
IGZyYW1ld29yay4gVGhhdCB3YXkKPj4+Pj4+IHRoZSBDTUEgc3lzdGVtIGNvdWxkIGRlY2lkZSB3
aGF0IGFyZWFzIHRvIGV4cG9ydCBvciBub3QgKG1heWJlIGJhc2VkIG9uCj4+Pj4+PiBhIERUIHBy
b3BlcnR5IG9yIHNpbWlsYXIpLgo+Pj4+Pgo+Pj4+PiBPay4gVGhvdWdoIHRoZSBDTUEgY29yZSBk
b2Vzbid0IGhhdmUgbXVjaCBzZW5zZSBvZiBEVCBkZXRhaWxzIGVpdGhlciwKPj4+Pj4gc28gaXQg
d291bGQgcHJvYmFibHkgaGF2ZSB0byBiZSBkb25lIGluIHRoZSByZXNlcnZlZF9tZW0gbG9naWMs
IHdoaWNoCj4+Pj4+IGRvZXNuJ3QgZmVlbCByaWdodCB0byBtZS4KPj4+Pj4KPj4+Pj4gSSdkIHBy
b2JhYmx5IGd1ZXNzIHdlIHNob3VsZCBoYXZlIHNvbWUgc29ydCBvZiBkdCBiaW5kaW5nIHRvIGRl
c2NyaWJlCj4+Pj4+IGEgZG1hYnVmIGNtYSBoZWFwIGFuZCBmcm9tIHRoYXQgbm9kZSBsaW5rIHRv
IGEgQ01BIG5vZGUgdmlhIGEKPj4+Pj4gbWVtb3J5LXJlZ2lvbiBwaGFuZGxlLiBBbG9uZyB3aXRo
IG1heWJlIHRoZSBkZWZhdWx0IGhlYXAgYXMgd2VsbD8gTm90Cj4+Pj4+IGVhZ2VyIHRvIGdldCBp
bnRvIGFub3RoZXIgYmluZGluZyByZXZpZXcgY3ljbGUsIGFuZCBJJ20gbm90IHN1cmUgd2hhdAo+
Pj4+PiBub24tRFQgc3lzdGVtcyB3aWxsIGRvIHlldCwgYnV0IEknbGwgdGFrZSBhIHNob3QgYXQg
aXQgYW5kIGl0ZXJhdGUuCj4+Pj4+Cj4+Pj4+PiBUaGUgZW5kIHJlc3VsdCBpcyB0aGUgc2FtZSBz
byB3ZSBjYW4gbWFrZSB0aGlzIGNoYW5nZSBsYXRlciAoaXQgaGFzIHRvCj4+Pj4+PiBjb21lIGFm
dGVyIERNQS1CVUYgaGVhcHMgaXMgaW4gYW55d2F5KS4KPj4+Pj4KPj4+Pj4gV2VsbCwgSSdtIGhl
c2l0YW50IHRvIG1lcmdlIGNvZGUgdGhhdCBleHBvc2VzIGFsbCB0aGUgQ01BIGhlYXBzIGFuZAo+
Pj4+PiB0aGVuIGFkZCBwYXRjaGVzIHRoYXQgYmVjb21lcyBtb3JlIHNlbGVjdGl2ZSwgc2hvdWxk
IGFueW9uZSBkZXBlbmQgb24KPj4+Pj4gdGhlIGluaXRpYWwgYmVoYXZpb3IuIDovCj4+Pj4KPj4+
PiBIb3cgYWJvdXQgb25seSBhdXRvLWFkZGluZyB0aGUgc3lzdGVtIGRlZmF1bHQgQ01BIHJlZ2lv
biAoY21hLT5uYW1lID09Cj4+Pj4gInJlc2VydmVkIik/Cj4+Pj4KPj4+PiBBbmQvb3IgdGhlIENN
QSBhdXRvLWFkZCBjb3VsZCBiZSBiZWhpbmQgYSBjb25maWcgb3B0aW9uPyBJdCBzZWVtcyBhCj4+
Pj4gc2hhbWUgdG8gZnVydGhlciBkZWxheSB0aGlzLCBhbmQgdGhlIENNQSBoZWFwIGl0c2VsZiBy
ZWFsbHkgaXMgdXNlZnVsLgo+Pj4+Cj4+PiBBIGJpdCBvZiBhIGRldG91ciwgY29tbWluZyBiYWNr
IHRvIHRoZSBpc3N1ZSB3aHkgdGhlIGZvbGxvd2luZyBub2RlCj4+PiB3YXMgbm90IGdldHRpbmcg
ZGV0ZWN0ZWQgYnkgdGhlIGRtYS1idWYgaGVhcHMgZnJhbWV3b3JrLgo+Pj4KPj4+ICAgICAgICAg
cmVzZXJ2ZWQtbWVtb3J5IHsKPj4+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwy
PjsKPj4+ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPj4+ICAgICAgICAgICAg
ICAgICByYW5nZXM7Cj4+Pgo+Pj4gICAgICAgICAgICAgICAgIGRpc3BsYXlfcmVzZXJ2ZWQ6IGZy
YW1lYnVmZmVyQDYwMDAwMDAwIHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGxpbnV4
LGNtYS1kZWZhdWx0Owo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV1c2FibGU7IDw8PDw8
PDw8PDw8PC0tLS0tLS0tLS0tVGhpcyB3YXMgbWlzc2luZyBpbiBvdXIKPj4+IGVhcmxpZXIgbm9k
ZQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHg2MDAwMDAwMCAwIDB4MDgw
MDAwMDA+Owo+Pj4gICAgICAgICAgICAgICAgIH07Cj4+Cj4+IFJpZ2h0LiBJdCBoYXMgdG8gYmUg
YSBDTUEgcmVnaW9uIGZvciB1cyB0byBleHBvc2UgaXQgZnJvbSB0aGUgY21hIGhlYXAuCj4+Cj4+
Cj4+PiBXaXRoICdyZXVzYWJsZScsIHJtZW1fY21hX3NldHVwKCkgc3VjY2VlZHMgLCBidXQgdGhl
IGtlcm5lbCBjcmFzaGVzIGFzIGZvbGxvd3MgOi0KPj4+Cj4+PiBbICAgIDAuNDUwNTYyXSBXQVJO
SU5HOiBDUFU6IDIgUElEOiAxIGF0IG1tL2NtYS5jOjExMCBjbWFfaW5pdF9yZXNlcnZlZF9hcmVh
cysweGVjLzB4MjJjCj4+Cj4+IElzIHRoZSB2YWx1ZSAweDYwMDAwMDAwIHlvdSdyZSB1c2luZyBz
b21ldGhpbmcgeW91IGp1c3QgZ3Vlc3NlZCBhdD8gSXQKPj4gc2VlbXMgbGlrZSB0aGUgd2Fybmlu
ZyBoZXJlIGlzIHNheWluZyB0aGUgcGZuIGNhbGN1bGF0ZWQgZnJvbSB0aGUgYmFzZQo+PiBhZGRy
ZXNzIGlzbid0IHZhbGlkLgo+IEl0IGlzIGEgdmFsaWQgbWVtb3J5IHJlZ2lvbiB3ZSB1c2UgdG8g
YWxsb2NhdGUgZnJhbWVidWZmZXJzLgoKCkJ1dCBkb2VzIGl0IGhhdmUgYSB2YWxpZCBrZXJuZWwg
dmlydHVhbCBtYXBwaW5nPyBNb3N0IEFSTSBzeXN0ZW1zIChqdXN0CmFzc3VtaW5nIHlvdSBhcmUg
d29ya2luZyBvbiBBUk0gOikpIHRoYXQgSSdtIGZhbWlsaWFyIHdpdGggaGF2ZSB0aGUgRFJBTQpz
cGFjZSBzdGFydGluZyBhdCAweDgwMDAwMDAwIGFuZCBzbyBkb24ndCBzdGFydCBoYXZpbmcgdmFs
aWQgcGZucyB1bnRpbAp0aGF0IHBvaW50LiBJcyB0aGlzIGFkZHJlc3MgeW91IGFyZSByZXNlcnZp
bmcgYW4gU1JBTT8KCkFuZHJldwoKCj4+Cj4+IHRoYW5rcwo+PiAtam9obgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
