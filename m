Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2DF1D74
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 19:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCACF6E288;
	Wed,  6 Nov 2019 18:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7326E283
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 18:23:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6INEYX092859;
 Wed, 6 Nov 2019 12:23:14 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6IND9F110572;
 Wed, 6 Nov 2019 12:23:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 12:23:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 12:22:58 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6INCKu089618;
 Wed, 6 Nov 2019 12:23:12 -0600
Subject: Re: [PATCH v15 1/5] dma-buf: Add dma-buf heaps framework
From: "Andrew F. Davis" <afd@ti.com>
To: John Stultz <john.stultz@linaro.org>
References: <20191106042252.72452-1-john.stultz@linaro.org>
 <20191106042252.72452-2-john.stultz@linaro.org>
 <7154851c-fc55-e157-5a01-21abdd4a23e6@ti.com>
 <CALAqxLW1vgLCik5WfDN7qkRsO=K9U4otNBp72aOH5UNN1jUgMQ@mail.gmail.com>
 <26700d4b-07c6-65b1-9fc6-bb3e239202e5@ti.com>
Message-ID: <546505bd-7ea7-6ae4-5dfa-44a3154fd5ea@ti.com>
Date: Wed, 6 Nov 2019 13:23:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <26700d4b-07c6-65b1-9fc6-bb3e239202e5@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573064594;
 bh=mGi893+tyE2Y1fpH/uLzwoHNjFKJNU3RWrSp6pP4v+Y=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=RHZibutIHrK2DOQb2uXuZW8tUkJEpwGQr2bK4I3vv1RgvmI7tz+ywC1MELqRZdunS
 8Py1YrU4ks4gLagq+JCnDM5ZMnIT2Tt5H7nLIqP47q9AtMxJKZzRgLjL5/YGrSGgKl
 ql6a9pRIRESUUatrYVoC67ACENvpM9o1NPayV3n0=
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
Cc: Hillf Danton <hdanton@sina.com>, Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvNi8xOSAxMjoxOCBQTSwgQW5kcmV3IEYuIERhdmlzIHdyb3RlOgo+IE9uIDExLzYvMTkg
MTI6MDMgUE0sIEpvaG4gU3R1bHR6IHdyb3RlOgo+PiBPbiBXZWQsIE5vdiA2LCAyMDE5IGF0IDU6
NTIgQU0gQW5kcmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPiB3cm90ZToKPj4+Cj4+PiBPbiAxMS81
LzE5IDExOjIyIFBNLCBKb2huIFN0dWx0eiB3cm90ZToKPj4+PiArdW5zaWduZWQgaW50IGRtYV9o
ZWFwX2lvY3RsX2NtZHNbXSA9IHsKPj4+PiArICAgICBETUFfSEVBUF9JT0NfQUxMT0MsCj4+Pj4g
K307Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgbG9uZyBkbWFfaGVhcF9pb2N0bChzdHJ1Y3QgZmlsZSAq
ZmlsZSwgdW5zaWduZWQgaW50IHVjbWQsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgYXJnKQo+Pj4+ICt7Cj4+Pj4gKyAgICAgY2hhciBzdGFja19rZGF0YVsxMjhd
Owo+Pj4+ICsgICAgIGNoYXIgKmtkYXRhID0gc3RhY2tfa2RhdGE7Cj4+Pj4gKyAgICAgdW5zaWdu
ZWQgaW50IGtjbWQ7Cj4+Pj4gKyAgICAgdW5zaWduZWQgaW50IGluX3NpemUsIG91dF9zaXplLCBk
cnZfc2l6ZSwga3NpemU7Cj4+Pj4gKyAgICAgaW50IG5yID0gX0lPQ19OUih1Y21kKTsKPj4+PiAr
ICAgICBpbnQgcmV0ID0gMDsKPj4+PiArCj4+Pj4gKyAgICAgaWYgKG5yID49IEFSUkFZX1NJWkUo
ZG1hX2hlYXBfaW9jdGxfY21kcykpCj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
Pj4+PiArCj4+Pj4gKyAgICAgLyogR2V0IHRoZSBrZXJuZWwgaW9jdGwgY21kIHRoYXQgbWF0Y2hl
cyAqLwo+Pj4+ICsgICAgIGtjbWQgPSBkbWFfaGVhcF9pb2N0bF9jbWRzW25yXTsKPj4+Cj4+Pgo+
Pj4gV2h5IGRvIHdlIG5lZWQgdGhpcyBpbmRpcmVjdGlvbiBoZXJlIGFuZCBhbGwgdGhlIGNvbXBs
ZXhpdHkgYmVsb3c/IEkKPj4+IGtub3cgRFJNIGlvY3RsIGRvZXMgc29tZXRoaW5nIGxpa2UgdGhp
cyBidXQgaXQgaGFzIGEgbWFzc2l2ZSB0YWJsZSwKPj4+IGxlZ2FjeSBpb2N0bHMsIGRyaXZlciBk
ZWZpbmVkIGlvY3RscywgZXRjLi4KPj4+Cj4+PiBJIGRvbid0IGV4cGVjdCB3ZSB3aWxsIGV2ZXIg
bmVlZCBjb21wbGV4IGhhbmRsaW5nIGxpa2UgdGhpcywgY291bGQgd2UKPj4+IHN3aXRjaCBiYWNr
IHRvIHRoZSBtb3JlIHNpbXBsZSBoYW5kbGVyIGZyb20gdjEzPwo+Pgo+PiBJIGFncmVlIGl0IGRv
ZXMgYWRkIGNvbXBsZXhpdHksIGJ1dCBJJ20gbm90IHN1cmUgSSBzZWUgaG93IHRvIGF2b2lkCj4+
IHNvbWUgb2YgdGhpcy4gVGhlIGxvZ2ljIHRyeWluZyB0byBoYW5kbGUgdGhhdCB0aGUgdXNlciBt
YXkgcGFzcyBhIGNtZAo+PiB0aGF0IGhhcyB0aGUgc2FtZSBfSU9DX05SKCkgYXMgRE1BX0hFQVBf
SU9DX0FMTE9DIGJ1dCBub3QgdGhlIHNhbWUKPj4gc2l6ZS4gU28gdGhlIHNpbXBsZSAic3dpdGNo
KGNtZCkgeyBjYXNlIERNQV9IRUFQX0lPQ19BTExPQzoiIHdlIGhhZAo+PiBiZWZvcmUgd29uJ3Qg
d29yayAoYXMgdGhlIGNtZCB3aWxsIGJlIGEgZGlmZmVyZW50IHZhbHVlKS4KPj4KPiAKPiAKPiBE
TUFfSEVBUF9JT0NfQUxMT0MgZW5jb2RlcyBldmVyeXRoaW5nIHdlIG5lZWQsIGlmIHRoZSBzaXpl
IGlzIGRpZmZlcmVudAo+IHRoZW4gdGhlIHN3aXRjaCBjYXNlIHdpbGwgbm90IG1hdGNoLiBJdCBo
YW5kbGVkIGV2ZXJ5dGhpbmcgd2UgaGF2ZS4KPiAKPiAKPj4gVGh1cyB3aHkgSSB0aG91Z2h0IHRo
ZSBjbGVhbmVzdCBhcHByb2FjaCB3b3VsZCBiZSB0byB1c2UgdGhlCj4+IGRtYV9oZWFwX2lvY3Rs
X2NtZHMgYXJyYXkgdG8gY29udmVydCBmcm9tIHdoYXRldmVyIHRoZSB1c2VyIGNtZCBpcyB0bwo+
PiB0aGUgbWF0Y2hpbmcga2VybmVsIGNtZCB2YWx1ZS4KPj4KPiAKPiAKPiBUaGVyZSBhcmUgbm8g
a2VybmVsIG9yIHVzZXIgY29tbWFuZHMsIGp1c3QgY29tbWFuZHMsIHRoZXkgd2lsbCBtYXRjaCBv
cgo+IHRoZXkgYXJlIG5vdCB2YWxpZC4gSWYgc29tZWRheSB3ZSBzb21lIG5lZWQgYSB2YXJpYWJs
ZSBzaXplZCBpb2N0bCB0aGVuCj4gd2UgY2FuIGRlYWwgd2l0aCB0aGF0IHRoZW4uCj4gCgoKSGFk
IGEgbGl0dGxlIGRpc2N1c3Npb24gYWJvdXQgdGhpcyBvbiBJUkMgI2RyaS1kZXZlbCAoY2hlY2sg
bG9ncyBmb3IKdG9kYXkgaWYgeW91IHdhbnQgdG8gZm9sbG93IGFsb25nKS4gQ29uY2x1c2lvbiBi
ZWluZyB0aGUgd2F5IGl0IGlzIGRvbmUKaGVyZSBzaG91bGQgYmUgZmluZSB0byBoZWxwIHN1cHBv
cnQgZm9yd2FyZCBjb21wYXRpYmlsaXR5LiBJZiBvcHRpb25hbApleHRlbnNpb25zIHRvIHRoZSBz
dHJ1Y3R1cmUgYXJlIG1hZGUgdGhhdCBncm93IHRoZSBzaXplIG9mIGRhdGEgcGFzc2VkCmluIHRo
ZW4gd2UgY2FuIGlnbm9yZSB0aGF0IGFuZCB6ZXJvIG91dCB0aGUgcmV0dXJuZWQgZGF0YSB3aXRo
b3V0IGhhcm0uCkl0IGlzIHVwIHRvIHRoZSBmbGFncyBmaWVsZCB0byBtYXJrIGluY29tcGF0aWJs
ZSBjaGFuZ2VzIHRoYXQgc2hvdWxkCmVycm9yIG91dCBmcm9tIGtlcm5lbC4KQW5kcmV3Cgo+IEFu
ZHJldwo+IAo+IAo+PiBEbyB5b3UgaGF2ZSBhbiBhbHRlcm5hdGl2ZSBzdWdnZXN0aW9uIHRoYXQg
SSdtIG92ZXJsb29raW5nPwo+Pgo+PiB0aGFua3MKPj4gLWpvaG4KPj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
