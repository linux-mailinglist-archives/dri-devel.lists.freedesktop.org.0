Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49D45615
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A756389939;
	Fri, 14 Jun 2019 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3E890B2;
 Fri, 14 Jun 2019 01:23:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02f6fc0000>; Thu, 13 Jun 2019 18:23:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 18:23:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 18:23:08 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 01:23:04 +0000
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
To: Ira Weiny <ira.weiny@intel.com>, Jason Gunthorpe <jgg@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
Date: Thu, 13 Jun 2019 18:23:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560475389; bh=NWiGQvc0UaQg06vGlx/KBoyQY7FTb90HKZp/7cWu1+4=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=PGGwMCZaC0S9THrYl/slCc2QMhYhnex3oPAZNO5d9CjYcao3xP02EKM9yZRFSeIre
 gDktMPknNdSMP6BFVhK0hr3Ylx4jhqjQPlobgGeytp0q5UL0P+fleGXQBxyUrVTL7c
 UfXPlc58234aULMKZqWEX2Y+lT8zzR1xjI8PjjuxSqSNv3vCP7bM+oE/t5v5cOrMWU
 voQlXSx+RSsATIsrh4M7UMfULfyM27nOpQKHTYkdjzrAcvIPUsoSQS79rZC1BnkmuI
 H1ASlDqsupKeEn/ts6bYkcDA0cRN/Jc3CrBOjgPuVxLYZOyhAGbVUxReea+/+CPyME
 uGGWOrtjTObjA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMy8xOSA1OjQzIFBNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIw
MTkgYXQgMDc6NTg6MjlQTSArMDAwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+PiBPbiBUaHUs
IEp1biAxMywgMjAxOSBhdCAxMjo1MzowMlBNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToK
Pj4+Ci4uLgo+PiBIdW0sIHNvIHRoZSBvbmx5IHRoaW5nIHRoaXMgY29uZmlnIGRvZXMgaXMgc2hv
cnQgY2lyY3VpdCBoZXJlOgo+Pgo+PiBzdGF0aWMgaW5saW5lIGJvb2wgaXNfZGV2aWNlX3B1Ymxp
Y19wYWdlKGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlKQo+PiB7Cj4+ICAgICAgICAgcmV0dXJuIElT
X0VOQUJMRUQoQ09ORklHX0RFVl9QQUdFTUFQX09QUykgJiYKPj4gICAgICAgICAgICAgICAgIElT
X0VOQUJMRUQoQ09ORklHX0RFVklDRV9QVUJMSUMpICYmCj4+ICAgICAgICAgICAgICAgICBpc196
b25lX2RldmljZV9wYWdlKHBhZ2UpICYmCj4+ICAgICAgICAgICAgICAgICBwYWdlLT5wZ21hcC0+
dHlwZSA9PSBNRU1PUllfREVWSUNFX1BVQkxJQzsKPj4gfQo+Pgo+PiBXaGljaCBpcyBjYWxsZWQg
YWxsIG92ZXIgdGhlIHBsYWNlLi4gCj4gCj4gPHNpZ2g+ICB5ZXMgYnV0IHRoZSBlYXJsaWVyIHBh
dGNoOgo+IAo+IFtQQVRDSCAwMy8yMl0gbW06IHJlbW92ZSBobW1fZGV2bWVtX2FkZF9yZXNvdXJj
ZQo+IAo+IFJlbW92ZXMgdGhlIG9ubHkgcGxhY2UgdHlwZSBpcyBzZXQgdG8gTUVNT1JZX0RFVklD
RV9QVUJMSUMuCj4gCj4gU28gSSB0aGluayBpdCBpcyBvay4gIEZyYW5rbHkgSSB3YXMgd29uZGVy
aW5nIGlmIHdlIHNob3VsZCByZW1vdmUgdGhlIHB1YmxpYwo+IHR5cGUgYWx0b2dldGhlciBidXQg
Y29uY2VwdHVhbGx5IGl0IHNlZW1zIG9rLiAgQnV0IEkgZG9uJ3Qgc2VlIGFueSB1c2VycyBvZiBp
dAo+IHNvLi4uICBzaG91bGQgd2UgZ2V0IHJpZCBvZiBpdCBpbiB0aGUgY29kZSByYXRoZXIgdGhh
biB0dXJuaW5nIHRoZSBjb25maWcgb2ZmPwo+IAo+IElyYQoKVGhhdCBzZWVtcyByZWFzb25hYmxl
LiBJIHJlY2FsbCB0aGF0IHRoZSBob3BlIHdhcyBmb3IgdGhvc2UgSUJNIFBvd2VyIDkKc3lzdGVt
cyB0byB1c2UgX1BVQkxJQywgYXMgdGhleSBoYXZlIGhhcmR3YXJlLWJhc2VkIGNvaGVyZW50IGRl
dmljZSAoR1BVKQptZW1vcnksIGFuZCBzbyB0aGUgbWVtb3J5IHJlYWxseSBpcyB2aXNpYmxlIHRv
IHRoZSBDUFUuIEFuZCB0aGUgSUJNIHRlYW0Kd2FzIHRoaW5raW5nIG9mIHRha2luZyBhZHZhbnRh
Z2Ugb2YgaXQuIEJ1dCBJIGhhdmVuJ3Qgc2VlbiBhbnl0aGluZyBvbgp0aGF0IGZyb250IGZvciBh
IHdoaWxlLgoKU28gbWF5YmUgaXQgd2lsbCBnZXQgcmUtYWRkZWQgYXMgcGFydCBvZiBhIGZ1dHVy
ZSBwYXRjaHNldCB0byB1c2UgdGhhdApraW5kIG9mIG1lbW9yeSwgYnV0IHllcywgd2Ugc2hvdWxk
IG5vdCBoZXNpdGF0ZSB0byBjbGVhbiBob3VzZSBhdCB0aGlzCnBvaW50LCBhbmQgZGVsZXRlIHVu
dXNlZCBjb2RlLgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKCj4gCj4+Cj4+IFNv
LCB5ZXMsIHdlIHJlYWxseSBkb24ndCB3YW50IGFueSBkaXN0cm8gb3Igc29tZXRoaW5nIHRvIHR1
cm4gdGhpcyBvbgo+PiB1bnRpbCBpdCBoYXMgYSB1c2UuCj4+Cj4+IFJldmlld2VkLWJ5OiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4+Cj4+IEphc29uCj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LW52ZGltbSBtYWls
aW5nIGxpc3QKPj4gTGludXgtbnZkaW1tQGxpc3RzLjAxLm9yZwo+PiBodHRwczovL2xpc3RzLjAx
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW52ZGltbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
