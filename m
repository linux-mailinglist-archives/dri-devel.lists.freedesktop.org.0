Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887A2F1C3D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376AC6E088;
	Wed,  6 Nov 2019 17:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C6F6E088
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:18:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6HI3Wc000838;
 Wed, 6 Nov 2019 11:18:03 -0600
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6HI3DU052782
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Nov 2019 11:18:03 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 11:17:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 11:17:47 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6HI0LQ051929;
 Wed, 6 Nov 2019 11:18:00 -0600
Subject: Re: [PATCH v15 1/5] dma-buf: Add dma-buf heaps framework
To: John Stultz <john.stultz@linaro.org>
References: <20191106042252.72452-1-john.stultz@linaro.org>
 <20191106042252.72452-2-john.stultz@linaro.org>
 <7154851c-fc55-e157-5a01-21abdd4a23e6@ti.com>
 <CALAqxLW1vgLCik5WfDN7qkRsO=K9U4otNBp72aOH5UNN1jUgMQ@mail.gmail.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <26700d4b-07c6-65b1-9fc6-bb3e239202e5@ti.com>
Date: Wed, 6 Nov 2019 12:18:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLW1vgLCik5WfDN7qkRsO=K9U4otNBp72aOH5UNN1jUgMQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573060683;
 bh=EcRltSnNjGkBxvjA5L9hzMCEuCsbKiaLjGExl987Je0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=jNy0kVsQqRx5r6VL3gmNqWLtrHrwg/g7DwWrYx3+VZzF4IxnA1TLh0efpMMBbshu0
 8C1FxnlW40jL4YNdEotIzjcl3UUnxPGCCoPSC5Hl6/T2Fo1cNXg0dG/GsmlVL0pEen
 svmkYqMFVACZ+Ck6kdpvRq0q9zZtx4f9Zh/9RbFg=
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvNi8xOSAxMjowMyBQTSwgSm9obiBTdHVsdHogd3JvdGU6Cj4gT24gV2VkLCBOb3YgNiwg
MjAxOSBhdCA1OjUyIEFNIEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4gd3JvdGU6Cj4+Cj4+
IE9uIDExLzUvMTkgMTE6MjIgUE0sIEpvaG4gU3R1bHR6IHdyb3RlOgo+Pj4gK3Vuc2lnbmVkIGlu
dCBkbWFfaGVhcF9pb2N0bF9jbWRzW10gPSB7Cj4+PiArICAgICBETUFfSEVBUF9JT0NfQUxMT0Ms
Cj4+PiArfTsKPj4+ICsKPj4+ICtzdGF0aWMgbG9uZyBkbWFfaGVhcF9pb2N0bChzdHJ1Y3QgZmls
ZSAqZmlsZSwgdW5zaWduZWQgaW50IHVjbWQsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBhcmcpCj4+PiArewo+Pj4gKyAgICAgY2hhciBzdGFja19rZGF0YVsxMjhd
Owo+Pj4gKyAgICAgY2hhciAqa2RhdGEgPSBzdGFja19rZGF0YTsKPj4+ICsgICAgIHVuc2lnbmVk
IGludCBrY21kOwo+Pj4gKyAgICAgdW5zaWduZWQgaW50IGluX3NpemUsIG91dF9zaXplLCBkcnZf
c2l6ZSwga3NpemU7Cj4+PiArICAgICBpbnQgbnIgPSBfSU9DX05SKHVjbWQpOwo+Pj4gKyAgICAg
aW50IHJldCA9IDA7Cj4+PiArCj4+PiArICAgICBpZiAobnIgPj0gQVJSQVlfU0laRShkbWFfaGVh
cF9pb2N0bF9jbWRzKSkKPj4+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArCj4+
PiArICAgICAvKiBHZXQgdGhlIGtlcm5lbCBpb2N0bCBjbWQgdGhhdCBtYXRjaGVzICovCj4+PiAr
ICAgICBrY21kID0gZG1hX2hlYXBfaW9jdGxfY21kc1tucl07Cj4+Cj4+Cj4+IFdoeSBkbyB3ZSBu
ZWVkIHRoaXMgaW5kaXJlY3Rpb24gaGVyZSBhbmQgYWxsIHRoZSBjb21wbGV4aXR5IGJlbG93PyBJ
Cj4+IGtub3cgRFJNIGlvY3RsIGRvZXMgc29tZXRoaW5nIGxpa2UgdGhpcyBidXQgaXQgaGFzIGEg
bWFzc2l2ZSB0YWJsZSwKPj4gbGVnYWN5IGlvY3RscywgZHJpdmVyIGRlZmluZWQgaW9jdGxzLCBl
dGMuLgo+Pgo+PiBJIGRvbid0IGV4cGVjdCB3ZSB3aWxsIGV2ZXIgbmVlZCBjb21wbGV4IGhhbmRs
aW5nIGxpa2UgdGhpcywgY291bGQgd2UKPj4gc3dpdGNoIGJhY2sgdG8gdGhlIG1vcmUgc2ltcGxl
IGhhbmRsZXIgZnJvbSB2MTM/Cj4gCj4gSSBhZ3JlZSBpdCBkb2VzIGFkZCBjb21wbGV4aXR5LCBi
dXQgSSdtIG5vdCBzdXJlIEkgc2VlIGhvdyB0byBhdm9pZAo+IHNvbWUgb2YgdGhpcy4gVGhlIGxv
Z2ljIHRyeWluZyB0byBoYW5kbGUgdGhhdCB0aGUgdXNlciBtYXkgcGFzcyBhIGNtZAo+IHRoYXQg
aGFzIHRoZSBzYW1lIF9JT0NfTlIoKSBhcyBETUFfSEVBUF9JT0NfQUxMT0MgYnV0IG5vdCB0aGUg
c2FtZQo+IHNpemUuIFNvIHRoZSBzaW1wbGUgInN3aXRjaChjbWQpIHsgY2FzZSBETUFfSEVBUF9J
T0NfQUxMT0M6IiB3ZSBoYWQKPiBiZWZvcmUgd29uJ3Qgd29yayAoYXMgdGhlIGNtZCB3aWxsIGJl
IGEgZGlmZmVyZW50IHZhbHVlKS4KPiAKCgpETUFfSEVBUF9JT0NfQUxMT0MgZW5jb2RlcyBldmVy
eXRoaW5nIHdlIG5lZWQsIGlmIHRoZSBzaXplIGlzIGRpZmZlcmVudAp0aGVuIHRoZSBzd2l0Y2gg
Y2FzZSB3aWxsIG5vdCBtYXRjaC4gSXQgaGFuZGxlZCBldmVyeXRoaW5nIHdlIGhhdmUuCgoKPiBU
aHVzIHdoeSBJIHRob3VnaHQgdGhlIGNsZWFuZXN0IGFwcHJvYWNoIHdvdWxkIGJlIHRvIHVzZSB0
aGUKPiBkbWFfaGVhcF9pb2N0bF9jbWRzIGFycmF5IHRvIGNvbnZlcnQgZnJvbSB3aGF0ZXZlciB0
aGUgdXNlciBjbWQgaXMgdG8KPiB0aGUgbWF0Y2hpbmcga2VybmVsIGNtZCB2YWx1ZS4KPiAKCgpU
aGVyZSBhcmUgbm8ga2VybmVsIG9yIHVzZXIgY29tbWFuZHMsIGp1c3QgY29tbWFuZHMsIHRoZXkg
d2lsbCBtYXRjaCBvcgp0aGV5IGFyZSBub3QgdmFsaWQuIElmIHNvbWVkYXkgd2Ugc29tZSBuZWVk
IGEgdmFyaWFibGUgc2l6ZWQgaW9jdGwgdGhlbgp3ZSBjYW4gZGVhbCB3aXRoIHRoYXQgdGhlbi4K
CkFuZHJldwoKCj4gRG8geW91IGhhdmUgYW4gYWx0ZXJuYXRpdmUgc3VnZ2VzdGlvbiB0aGF0IEkn
bSBvdmVybG9va2luZz8KPiAKPiB0aGFua3MKPiAtam9obgo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
