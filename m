Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA88D56418
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942766E2DF;
	Wed, 26 Jun 2019 08:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69896E255;
 Wed, 26 Jun 2019 03:15:31 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d12e3520000>; Tue, 25 Jun 2019 20:15:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 25 Jun 2019 20:15:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 25 Jun 2019 20:15:31 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 03:15:29 +0000
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
 <20190619192719.GO9374@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <29f43c79-b454-0477-a799-7850e6571bd3@nvidia.com>
Date: Tue, 25 Jun 2019 20:15:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619192719.GO9374@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1561518930; bh=mFKCj/TnJw3viqoDN0No22dYQzshEvjZPsHuzsScphE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=JWS56c7LDNZO2C+L8KR37PAJV/JNwy2VsATo0Y9o97x2OREZOXY1kW16CqdsdCF3p
 h75heFhKUb3QKsr9tb1bJDlBPd+kZrKl1GNfPhJxKLLAVmTvovjBcLyjGppIJCVNJz
 e/bL0Uz9WCABzn+s82NDbBpQtU8Quft0swt7Nfb9yv1tVnj/v8mVsJUeumTOsJqbpo
 ejbFTmycRLy12cjephJ1Av4haOtY2fOQCECnDpWB4huqII/lRxMlc4SxDkKG4nThLq
 s7yoeCAPZH4BEFoJuCbXa874ODwp/FlzUTE8v3eEQjQt1UYj/uSTcnPhWHZ0P2eSt5
 drw5jV+XaTi+A==
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xOS8xOSAxMjoyNyBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRodSwgSnVu
IDEzLCAyMDE5IGF0IDA2OjIzOjA0UE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gT24g
Ni8xMy8xOSA1OjQzIFBNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1biAxMywgMjAx
OSBhdCAwNzo1ODoyOVBNICswMDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+Pj4gT24gVGh1
LCBKdW4gMTMsIDIwMTkgYXQgMTI6NTM6MDJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwgd3JvdGU6
Cj4+Pj4+Cj4+IC4uLgo+Pj4gU28gSSB0aGluayBpdCBpcyBvay4gIEZyYW5rbHkgSSB3YXMgd29u
ZGVyaW5nIGlmIHdlIHNob3VsZCByZW1vdmUgdGhlIHB1YmxpYwo+Pj4gdHlwZSBhbHRvZ2V0aGVy
IGJ1dCBjb25jZXB0dWFsbHkgaXQgc2VlbXMgb2suICBCdXQgSSBkb24ndCBzZWUgYW55IHVzZXJz
IG9mIGl0Cj4+PiBzby4uLiAgc2hvdWxkIHdlIGdldCByaWQgb2YgaXQgaW4gdGhlIGNvZGUgcmF0
aGVyIHRoYW4gdHVybmluZyB0aGUgY29uZmlnIG9mZj8KPj4+Cj4+PiBJcmEKPj4KPj4gVGhhdCBz
ZWVtcyByZWFzb25hYmxlLiBJIHJlY2FsbCB0aGF0IHRoZSBob3BlIHdhcyBmb3IgdGhvc2UgSUJN
IFBvd2VyIDkKPj4gc3lzdGVtcyB0byB1c2UgX1BVQkxJQywgYXMgdGhleSBoYXZlIGhhcmR3YXJl
LWJhc2VkIGNvaGVyZW50IGRldmljZSAoR1BVKQo+PiBtZW1vcnksIGFuZCBzbyB0aGUgbWVtb3J5
IHJlYWxseSBpcyB2aXNpYmxlIHRvIHRoZSBDUFUuIEFuZCB0aGUgSUJNIHRlYW0KPj4gd2FzIHRo
aW5raW5nIG9mIHRha2luZyBhZHZhbnRhZ2Ugb2YgaXQuIEJ1dCBJIGhhdmVuJ3Qgc2VlbiBhbnl0
aGluZyBvbgo+PiB0aGF0IGZyb250IGZvciBhIHdoaWxlLgo+IAo+IERvZXMgYW55b25lIGtub3cg
d2hvIHRob3NlIHBlb3BsZSBhcmUgYW5kIGNhbiB3ZSBlbmNvdXJhZ2UgdGhlbSB0bwo+IHNlbmQg
c29tZSBwYXRjaGVzPyA6KQo+IAoKSSBhc2tlZCBhYm91dCB0aGlzLCBhbmQgaXQgc2VlbXMgdGhh
dCB0aGUgaWRlYSB3YXM6IERFVklDRV9QVUJMSUMgd2FzIHRoZXJlCmluIG9yZGVyIHRvIHByb3Zp
ZGUgYW4gYWx0ZXJuYXRpdmUgd2F5IHRvIGRvIHRoaW5ncyAoc3VjaCBhcyBtaWdyYXRlIG1lbW9y
eQp0byBhbmQgZnJvbSBhIGRldmljZSksIGluIGNhc2UgdGhlIGNvbWJpbmF0aW9uIG9mIGV4aXN0
aW5nIGFuZCBuZWFyLWZ1dHVyZQpOVU1BIEFQSXMgd2FzIGluc3VmZmljaWVudC4gVGhpcyBwcm9i
YWJseSBjYW1lIGFzIGEgZm9sbG93LXVwIHRvIHRoZSBlYXJseQoyMDE3LWlzaCBjb252ZXJzYXRp
b25zIGFib3V0IE5VTUEsIGluIHdoaWNoIHRoZSBsaW51eC1tbSByZWNvbW1lbmRhdGlvbiB3YXMK
InRyeSB1c2luZyBITU0gbWVjaGFuaXNtcywgYW5kIGlmIHRob3NlIGFyZSBpbmFkZXF1YXRlLCB0
aGVuIG1heWJlIHdlIGNhbgpsb29rIGF0IGVuaGFuY2luZyBOVU1BIHNvIHRoYXQgaXQgaGFzIGJl
dHRlciBoYW5kbGluZyBvZiBhZHZhbmNlZCAoR1BVLWxpa2UpCmRldmljZXMiLgoKSW4gdGhlIGVu
ZCwgaG93ZXZlciwgX1BVQkxJQyB3YXMgbmV2ZXIgdXNlZCwgbm9yIGRvZXMgYW55b25lIGluIHRo
ZSBsb2NhbAooTlZJRElBICsgSUJNKSBrZXJuZWwgdmljaW5pdHkgc2VlbSB0byBoYXZlIHBsYW5z
IHRvIHVzZSBpdC4gIFNvIGl0IHJlYWxseQpkb2VzIHNlZW0gc2FmZSB0byByZW1vdmUsIGFsdGhv
dWdoIG9mIGNvdXJzZSBpdCdzIGdvb2QgdG8gc3RhcnQgd2l0aCAKQlJPS0VOIGFuZCBzZWUgaWYg
YW55b25lIHBvcHMgdXAgYW5kIGNvbXBsYWlucy4KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApO
VklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
