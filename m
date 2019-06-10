Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C993C093
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764089159;
	Tue, 11 Jun 2019 00:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F731891AD;
 Mon, 10 Jun 2019 22:04:11 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfed3da0008>; Mon, 10 Jun 2019 15:04:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 10 Jun 2019 15:04:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 10 Jun 2019 15:04:10 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 10 Jun 2019 22:03:42 +0000
Subject: Re: [PATCH v2 hmm 11/11] mm/hmm: Remove confusing comment and logic
 from hmm_release
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-12-jgg@ziepe.ca>
 <61ea869d-43d2-d1e5-dc00-cf5e3e139169@nvidia.com>
 <20190610160252.GH18446@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <fc1487f0-f11d-8cfa-b843-f2463f3856cb@nvidia.com>
Date: Mon, 10 Jun 2019 15:03:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190610160252.GH18446@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560204251; bh=m0vRLgBt6dZ1z6MC9oHbfkHDtIvOUNsxY1buK+WfrXI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=MK+2nS/lbaNrPz4iFJRfwJz5s4DfaMEYqsiXsGoXHqCxfcGZ/c6Y39e+9nDa6+UtB
 jJaZ82XgncVUF58p4TxaZa2GVqE9wiPvMqe++vyh9odW/s9YHt3Dzt5HffMciwdyHK
 cZ07IuuWfngqG3FKSghgPh1Q5YRRphYqYJrlaOqamBbUyKJGe+iYBsia5cX3iOYmlH
 rVeyOcEQTYjPdpyYTzp+7S7HmcJDJVkE2XognFHTfxchFahTDLbSgtZsttIcyzGN2n
 wiZ/ygt4ODCDB5+mRry4PM3VUSDeqcPhvhLhLjKCbUOnxrpb+Oszoj8fGW2ZBwqFgD
 zEGxzmqRGVrLA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTAvMTkgOTowMiBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIEZyaSwgSnVu
IDA3LCAyMDE5IGF0IDAyOjM3OjA3UE0gLTA3MDAsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+Pgo+
PiBPbiA2LzYvMTkgMTE6NDQgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+IEZyb206IEph
c29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPj4+Cj4+PiBobW1fcmVsZWFzZSgpIGlz
IGNhbGxlZCBleGFjdGx5IG9uY2UgcGVyIGhtbS4gb3BzLT5yZWxlYXNlKCkgY2Fubm90Cj4+PiBh
Y2NpZGVudGFsbHkgdHJpZ2dlciBhbnkgYWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBiYWNrIG9u
dG8KPj4+IGhtbS0+bWlycm9yc19zZW0uCj4+Pgo+Pj4gVGhpcyBmaXhlcyBhIHVzZSBhZnRlci1m
cmVlIHJhY2Ugb2YgdGhlIGZvcm06Cj4+Pgo+Pj4gICAgICAgICAgQ1BVMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaG1tX3JlbGVhc2UoKQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7Cj4+
PiAgICBobW1fbWlycm9yX3VucmVnaXN0ZXIobWlycm9yKQo+Pj4gICAgIGRvd25fd3JpdGUoJmht
bS0+bWlycm9yc19zZW0pOwo+Pj4gICAgIHVwX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKPj4+
ICAgICBrZnJlZShtaXJyb3IpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1pcnJvci0+b3BzLT5yZWxlYXNlKG1pcnJvcikKPj4+Cj4+PiBUaGUgb25s
eSB1c2VyIHdlIGhhdmUgdG9kYXkgZm9yIG9wcy0+cmVsZWFzZSBpcyBhbiBlbXB0eSBmdW5jdGlv
biwgc28gdGhpcwo+Pj4gaXMgdW5hbWJpZ3VvdXNseSBzYWZlLgo+Pj4KPj4+IEFzIGEgY29uc2Vx
dWVuY2Ugb2YgcGx1Z2dpbmcgdGhpcyByYWNlIGRyaXZlcnMgYXJlIG5vdCBhbGxvd2VkIHRvCj4+
PiByZWdpc3Rlci91bnJlZ2lzdGVyIG1pcnJvcnMgZnJvbSB3aXRoaW4gYSByZWxlYXNlIG9wLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4K
Pj4KPj4gSSBhZ3JlZSB3aXRoIHRoZSBhbmFseXNpcyBhYm92ZSBidXQgSSdtIG5vdCBzdXJlIHRo
YXQgcmVsZWFzZSgpIHdpbGwKPj4gYWx3YXlzIGJlIGFuIGVtcHR5IGZ1bmN0aW9uLiBJdCBtaWdo
dCBiZSBtb3JlIGVmZmljaWVudCB0byB3cml0ZSBiYWNrCj4+IGFsbCBkYXRhIG1pZ3JhdGVkIHRv
IGEgZGV2aWNlICJpbiBvbmUgcGFzcyIgaW5zdGVhZCBvZiByZWx5aW5nCj4+IG9uIHVubWFwX3Zt
YXMoKSBjYWxsaW5nIGhtbV9zdGFydF9yYW5nZV9pbnZhbGlkYXRlKCkgcGVyIFZNQS4KPiAKPiBJ
IHRoaW5rIHdlIGhhdmUgdG8gZm9jdXMgb24gdGhlICpjdXJyZW50KiBrZXJuZWwgLSBhbmQgd2Ug
aGF2ZSB0d28KPiB1c2VycyBvZiByZWxlYXNlLCBub3V2ZWF1X3N2bS5jIGlzIGVtcHR5IGFuZCBh
bWRncHVfbW4uYyBkb2VzCj4gc2NoZWR1bGVfd29yaygpIC0gc28gSSBiZWxpZXZlIHdlIHNob3Vs
ZCBnbyBhaGVhZCB3aXRoIHRoaXMgc2ltcGxlCj4gc29sdXRpb24gdG8gdGhlIGFjdHVhbCByYWNl
IHRvZGF5IHRoYXQgYm90aCBvZiB0aG9zZSB3aWxsIHN1ZmZlciBmcm9tLgo+IAo+IElmIHdlIGZp
bmQgYSBuZWVkIGZvciBhIG1vcmUgY29tcGxleCB2ZXJzaW9uIHRoZW4gaXQgY2FuIGJlIGRlYmF0
ZWQKPiBhbmQganVzdGlmaWVkIHdpdGggcHJvcGVyIGNvbnRleHQuLi4KPiAKPiBPaz8KPiAKPiBK
YXNvbgoKT0suCkkgZ3Vlc3Mgd2UgaGF2ZSBlbm91Z2ggb24gdGhlIHBsYXRlIGFscmVhZHkgOi0p
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
