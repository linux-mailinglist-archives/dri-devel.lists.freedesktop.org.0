Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082E56446
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA546E32B;
	Wed, 26 Jun 2019 08:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C494E8937C;
 Wed, 26 Jun 2019 06:07:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d130b940000>; Tue, 25 Jun 2019 23:07:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 25 Jun 2019 23:07:18 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 25 Jun 2019 23:07:18 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 06:07:14 +0000
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
To: Michal Hocko <mhocko@kernel.org>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
 <20190619192719.GO9374@mellanox.com>
 <29f43c79-b454-0477-a799-7850e6571bd3@nvidia.com>
 <20190626054554.GA17798@dhcp22.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f71f16a4-d411-a540-fc71-34d15f4f02d6@nvidia.com>
Date: Tue, 25 Jun 2019 23:07:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626054554.GA17798@dhcp22.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1561529236; bh=lOYN6Xujx0qgVx2R2grB9rnpAuC+tRlCUn6fhuHNVBw=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=MeEaNoyuI3afmGIgQqaUlcM8mWD4HE/GKCjf1kgZqenkygdQ6iZn8Y+wMfzhJF87I
 vYo21C+56S9Bvta+WE93xqp1yxRd+0aF795hDv05MxYNL3r+vvAmMHm4YgF+fZ9DDF
 07zGzHtLnrEybnAKwTuVgiU1Di+G2xgjzSwCSSceljuW82qT60fZLO+EJoH4v/ubsD
 NyaUlJ4MlpZ0Et6J1Gg+pmaLUo/LH/zF/aaAcoZbyC51AIUa7VWPEd94fdesxNrSAi
 U72HjlF1/+oo9PUKkvNA5wckZf7S8p+OANEJ3IUYXElXVcyRJ79Q5H9Zy/HqtbvLbl
 uJqmTWhXrGX7Q==
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
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNS8xOSAxMDo0NSBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIFR1ZSAyNS0wNi0x
OSAyMDoxNToyOCwgSm9obiBIdWJiYXJkIHdyb3RlOgo+PiBPbiA2LzE5LzE5IDEyOjI3IFBNLCBK
YXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAwNjoyMzow
NFBNIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+Pj4gT24gNi8xMy8xOSA1OjQzIFBNLCBJ
cmEgV2Vpbnkgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA3OjU4OjI5UE0g
KzAwMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+Pj4+IE9uIFRodSwgSnVuIDEzLCAyMDE5
IGF0IDEyOjUzOjAyUE0gLTA3MDAsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4g
Li4uCj4+Pj4+IFNvIEkgdGhpbmsgaXQgaXMgb2suICBGcmFua2x5IEkgd2FzIHdvbmRlcmluZyBp
ZiB3ZSBzaG91bGQgcmVtb3ZlIHRoZSBwdWJsaWMKPj4+Pj4gdHlwZSBhbHRvZ2V0aGVyIGJ1dCBj
b25jZXB0dWFsbHkgaXQgc2VlbXMgb2suICBCdXQgSSBkb24ndCBzZWUgYW55IHVzZXJzIG9mIGl0
Cj4+Pj4+IHNvLi4uICBzaG91bGQgd2UgZ2V0IHJpZCBvZiBpdCBpbiB0aGUgY29kZSByYXRoZXIg
dGhhbiB0dXJuaW5nIHRoZSBjb25maWcgb2ZmPwo+Pj4+Pgo+Pj4+PiBJcmEKPj4+Pgo+Pj4+IFRo
YXQgc2VlbXMgcmVhc29uYWJsZS4gSSByZWNhbGwgdGhhdCB0aGUgaG9wZSB3YXMgZm9yIHRob3Nl
IElCTSBQb3dlciA5Cj4+Pj4gc3lzdGVtcyB0byB1c2UgX1BVQkxJQywgYXMgdGhleSBoYXZlIGhh
cmR3YXJlLWJhc2VkIGNvaGVyZW50IGRldmljZSAoR1BVKQo+Pj4+IG1lbW9yeSwgYW5kIHNvIHRo
ZSBtZW1vcnkgcmVhbGx5IGlzIHZpc2libGUgdG8gdGhlIENQVS4gQW5kIHRoZSBJQk0gdGVhbQo+
Pj4+IHdhcyB0aGlua2luZyBvZiB0YWtpbmcgYWR2YW50YWdlIG9mIGl0LiBCdXQgSSBoYXZlbid0
IHNlZW4gYW55dGhpbmcgb24KPj4+PiB0aGF0IGZyb250IGZvciBhIHdoaWxlLgo+Pj4KPj4+IERv
ZXMgYW55b25lIGtub3cgd2hvIHRob3NlIHBlb3BsZSBhcmUgYW5kIGNhbiB3ZSBlbmNvdXJhZ2Ug
dGhlbSB0bwo+Pj4gc2VuZCBzb21lIHBhdGNoZXM/IDopCj4+Pgo+Pgo+PiBJIGFza2VkIGFib3V0
IHRoaXMsIGFuZCBpdCBzZWVtcyB0aGF0IHRoZSBpZGVhIHdhczogREVWSUNFX1BVQkxJQyB3YXMg
dGhlcmUKPj4gaW4gb3JkZXIgdG8gcHJvdmlkZSBhbiBhbHRlcm5hdGl2ZSB3YXkgdG8gZG8gdGhp
bmdzIChzdWNoIGFzIG1pZ3JhdGUgbWVtb3J5Cj4+IHRvIGFuZCBmcm9tIGEgZGV2aWNlKSwgaW4g
Y2FzZSB0aGUgY29tYmluYXRpb24gb2YgZXhpc3RpbmcgYW5kIG5lYXItZnV0dXJlCj4+IE5VTUEg
QVBJcyB3YXMgaW5zdWZmaWNpZW50LiBUaGlzIHByb2JhYmx5IGNhbWUgYXMgYSBmb2xsb3ctdXAg
dG8gdGhlIGVhcmx5Cj4+IDIwMTctaXNoIGNvbnZlcnNhdGlvbnMgYWJvdXQgTlVNQSwgaW4gd2hp
Y2ggdGhlIGxpbnV4LW1tIHJlY29tbWVuZGF0aW9uIHdhcwo+PiAidHJ5IHVzaW5nIEhNTSBtZWNo
YW5pc21zLCBhbmQgaWYgdGhvc2UgYXJlIGluYWRlcXVhdGUsIHRoZW4gbWF5YmUgd2UgY2FuCj4+
IGxvb2sgYXQgZW5oYW5jaW5nIE5VTUEgc28gdGhhdCBpdCBoYXMgYmV0dGVyIGhhbmRsaW5nIG9m
IGFkdmFuY2VkIChHUFUtbGlrZSkKPj4gZGV2aWNlcyIuCj4gCj4gWWVzIHRoYXQgd2FzIHRoZSBv
cmlnaW5hbCBpZGVhLiBJdCBzb3VuZHMgc28gbXVjaCBiZXR0ZXIgdG8gdXNlIGEgY29tbW9uCj4g
ZnJhbWV3b3JrIHJhdGhlciB0aGFuIGF3a3dhcmQgc3BlY2lhbCBjYXNlZCBjcHVsZXNzIE5VTUEg
bm9kZXMgd2l0aAo+IGEgd2VpcmQgc2VtYW50aWMuIFVzZXIgb2YgdGhlIG5laXRoZXIgb2YgdGhl
IHR3byBoYXMgc2hvd24gdXAgc28gSSBndWVzcwo+IHRoYXQgdGhlIGVudmlzaW9uZWQgSFcganVz
dCBkaWRuJ3QgbWF0ZXJpYWxpemVkLiBPciBoYXMgdGhlcmUgYmVlbiBhCj4gY29tcGxldGVseSBk
aWZmZXJlbnQgYXBwcm9hY2ggY2hvc2VuPwoKVGhlIEhXIHNob3dlZCB1cCwgYWxyaWdodDogaXQn
cyB0aGUgSUJNIFBvd2VyIDksIHdoaWNoIHByb3ZpZGVzIEhXLWJhc2VkCm1lbW9yeSBjb2hlcmVu
Y3kgYmV0d2VlbiBpdHMgQ1BVcyBhbmQgR1BVcy4gU28gb24gdGhpcyBzeXN0ZW0sIHRoZSBDUFUg
aXMKYWxsb3dlZCB0byBhY2Nlc3MgR1BVIG1lbW9yeSwgd2hpY2ggKmNvdWxkKiBiZSBtb2RlbGVk
IGFzIERFVklDRV9QVUJMSUMuCgpIb3dldmVyLCB3aGF0IGhhcHBlbmVkIHdhcyB0aGF0IHRoZSBz
eXN0ZW0gd29ya2VkIHdlbGwgZW5vdWdoIHdpdGggYSBjb21iaW5hdGlvbgpvZiB0aGUgZGV2aWNl
IGRyaXZlciwgcGx1cyBOVU1BIEFQSXMsIHBsdXMgaGVhdmVuIGtub3dzIHdoYXQgc29ydCBvZiAv
cHJvYyB0dW5pbmcKbWlnaHQgaGF2ZSBhbHNvIGdvbmUgb24uIDopIE5vIG9uZSBzYXcgdGhlIG5l
ZWQgdG8gcmVhY2ggZm9yIHRoZSBERVZJQ0VfUFVCTElDCmZ1bmN0aW9uYWxpdHkuCgo+IAo+PiBJ
biB0aGUgZW5kLCBob3dldmVyLCBfUFVCTElDIHdhcyBuZXZlciB1c2VkLCBub3IgZG9lcyBhbnlv
bmUgaW4gdGhlIGxvY2FsCj4+IChOVklESUEgKyBJQk0pIGtlcm5lbCB2aWNpbml0eSBzZWVtIHRv
IGhhdmUgcGxhbnMgdG8gdXNlIGl0LiAgU28gaXQgcmVhbGx5Cj4+IGRvZXMgc2VlbSBzYWZlIHRv
IHJlbW92ZSwgYWx0aG91Z2ggb2YgY291cnNlIGl0J3MgZ29vZCB0byBzdGFydCB3aXRoIAo+PiBC
Uk9LRU4gYW5kIHNlZSBpZiBhbnlvbmUgcG9wcyB1cCBhbmQgY29tcGxhaW5zLgo+IAo+IFdlbGws
IEkgZG8gbm90IHJlYWxseSBzZWUgbXVjaCBvZiBhIGRpZmZlcmVuY2UuIFByZXNlcnZpbmcgYW4g
dW51c2VkCj4gY29kZSB3aGljaCBkb2Vzbid0IGhhdmUgYW55IHVzZXIgaW4gc2lnaHQganVzdCBh
ZGRzIGEgbWFpbnRlbmFuY2UgYnVyZGVuCj4gd2hldGhlciB0aGUgY29kZSBkZXBlbmRzIG9uIEJS
T0tFTiBvciBub3QuIFdlIGNhbiBhbHdheXMgcmV2ZXJ0IHBhdGNoZXMKPiB3aGljaCByZW1vdmUg
dGhlIGNvZGUgb25jZSBhIHJlYWwgdXNlciBzaG93cyB1cC4KClN1cmUsIEkgZG9uJ3Qgc2VlIG11
Y2ggZGlmZmVyZW5jZSBlaXRoZXIuIEVpdGhlciB3YXkgc2VlbXMgZmluZS4KCnRoYW5rcywKLS0g
CkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
