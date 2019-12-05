Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632D1149A4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 00:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A004D6E059;
	Thu,  5 Dec 2019 23:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1116F598;
 Thu,  5 Dec 2019 23:04:02 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de98ce60000>; Thu, 05 Dec 2019 15:04:06 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 05 Dec 2019 15:04:02 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 05 Dec 2019 15:04:02 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Dec
 2019 23:04:01 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Dec 2019
 23:03:56 +0000
Subject: Re: [GIT PULL] Please pull hmm changes
To: Jason Gunthorpe <jgg@mellanox.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <2f915b2d-ad97-a314-40f0-d0e571f896ba@nvidia.com>
Date: Thu, 5 Dec 2019 15:03:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203024206.GC5795@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575587046; bh=58n8MbBrDbCxymLe3Kyll3zOVQ8b1tLoEUpp/Z4Zoqs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=q7nfY8GJBc7/Kc7WDjpBD2YyDTmm4YSkTULrbZJdXbn8ucp6paxWBEGf97Qp3LVka
 sMJlM7NxrxyO8aRWP5b1FEtBBvqn9VHLmUdJCSYXpYeIyVx4R+9CetRhsu59frhppi
 unCtKjZwsAEE3QEsyz/AClVylckUdbuGslURaqRRZn8ALqzyS5H09jcsPcHg7ASNi+
 4BabjcbL7eDtznbkI5Ep/Y05V4gpOkIfDY74NPFGTAPBn6ckaV8S3/0oK0lAuCsWrh
 3ESGW/PA7mEnVe/js0QRtLpFYxiltndgWXNNZrLQILJA4kV1odPGreqsVHCn1zcTSU
 L9Oo/EFBpQx7g==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMi8xOSA2OjQyIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Ci4uLgo+IFJlZ2FyZGlu
ZyB0aGUgdWdseSBuYW1lcy4uIE5hbWluZyBoYXMgYmVlbiByZWFsbHkgaGFyZCBoZXJlIGJlY2F1
c2UKPiBjdXJyZW50bHkgZXZlcnl0aGluZyBpcyBhICdtbXUgbm90aWZpZXInIGFuZCB0aGUgbmF0
dXJhbCBhYmJlcnZpYXRpb25zCj4gZnJvbSB0aGVyZSBhcmUgY3J1bW15LiBIZXJlIGlzIHRoZSBi
YXNpYyBzdW1tYXJ5Ogo+IAo+IHN0cnVjdCBtbXVfbm90aWZpZXJfbW0gKGllIHRoZSBtbS0+bW11
X25vdGlmaWVyX21tKQo+ICAgIC0+IG1tbl9tbQo+IHN0cnVjdCBtbV9zdHJ1Y3QgCj4gICAgLT4g
bW0KPiBzdHJ1Y3QgbW11X25vdGlmaWVyIChpZSB0aGUgdXNlciBzdWJzY3JpcHRpb24gdG8gdGhl
IG1tX3N0cnVjdCkKPiAgICAtPiBtbgo+IHN0cnVjdCBtbXVfaW50ZXJ2YWxfbm90aWZpZXIgKHRo
ZSBvdGhlciBraW5kIG9mIHVzZXIgc3Vic2NyaXB0aW9uKQo+ICAgIC0+IG1uaQo+IHN0cnVjdCBt
bXVfbm90aWZpZXJfcmFuZ2UgKGllIHRoZSBhcmdzIHRvIGludmFsaWRhdGVfcmFuZ2UpCj4gICAg
LT4gcmFuZ2UKPiAKPiBJIGNhbiBzZW5kIGEgcGF0Y2ggdG8gc3dpdGNoIG1tbl9tbSB0byBtbXVf
bm90aWZpZXJfbW0sIHdoaWNoIGlzIHRoZQo+IG9ubHkgcHJlLWV4aXN0aW5nIG5hbWUgZm9yIHRo
aXMgdmFsdWUuIEJ1dCBJSVJDLCBpdCBpcyBhIHNvbWV3aGF0IHVnbHkKPiB3aXRoIGxvbmcgbGlu
ZSB3cmFwcGluZy4gJ21uaScgaXMgYSBwYWluLCBJIGhhdmUgdG8gcmVmbGVjdCBvbiB0aGF0Lgo+
IChob25lc2x5LCBJIGRpc2xpa2UgbW11X25vdGlmaWZlcl9tbSBxdWl0ZSBhIGxvdCB0b28pCj4g
Cj4gSSB0aGluayBpdCB3b3VsZCBiZSBvdmVyYWxsIG5pY2VyIHdpdGggYmV0dGVyIG5hbWVzIGZv
ciB0aGUgb3JpZ2luYWwKPiBzdHJ1Y3RzLiBQZXJoYXBzOgo+IAo+ICBtbW5fKiAtIE1NVSBub3Rp
ZmllciBwcmVmaXgKPiAgbW1uX3N0YXRlIDwtIHN0cnVjdCBtbXVfbm90aWZpZXJfbW0KPiAgbW1u
X3N1YnNjcmlwdGlvbiAobW1uX3N1YikgPC0gc3RydWN0IG1tdV9ub3RpZmllcgo+ICBtbW5fcmFu
Z2Vfc3Vic2NyaXB0aW9uIChtbW5fcmFuZ2Vfc3ViKSA8LSBzdHJ1Y3QgbW11X2ludGVydmFsX25v
dGlmaWVyCj4gIG1tbl9pbnZhbGlkYXRlX2Rlc2MgPC0gc3RydWN0IG1tdV9ub3RpZmllcl9yYW5n
ZQo+IAo+IEF0IGxlYXN0IHRoaXMgaXMgaG93IEkgZGVzY3JpYmUgdGhlbSBpbiBteSBtaW5kLi4g
IFRoaXMgaXMgYSBsb3Qgb2YKPiBjaHVybiwgYW5kIHNwcmVhZHMgdGhyb3VnaCBtYW55IGRyaXZl
cnMuIFRoaXMgaXMgd2h5IEkga2VwdCB0aGUgbmFtZXMKPiBhcy1pcyBhbmQgd2UgZW5kZWQgdXAg
d2l0aCB0aGUgYWxzbyBxdWl0ZSBiYWQgJ21tdV9pbnRlcnZhbF9ub3RpZmllcicKPiAKPiBNYXli
ZSBqdXN0IHN3aXRjaCBtbXVfbm90aWZpZXJfbW0gZm9yIG1tbl9zdGF0ZSBhbmQgbGVhdmUgdGhl
IGRyaXZlcnMKPiBhbG9uZT8KPiAKPiBBbnlvbmUgb24gdGhlIENDIGxpc3QgaGF2ZSBhZHZpY2U/
Cj4gCj4gSmFzb24KCk5vIGFkdmljZSwganVzdCBhIG5hbWluZyBpZGVhIHNpbWlsYXIgaW4gc3Bp
cml0IHRvIEplcm9tZSdzIHN1Z2dlc3Rpb24KKHVzZSBhIGxvbmdlciBkZXNjcmlwdGl2ZSB3b3Jk
LCBhbmQgZG9uJ3QgdHJ5IHRvIGNhcHR1cmUgdGhlIGVudGlyZSBwaHJhc2UpOgp1c2UgIm5vdGlm
IiBpbiBwbGFjZSBvZiB0aGUgdW5sb3ZlZCAibW1uIi4gU28gcGFydGlhbGx5LCBhcHByb3hpbWF0
ZWx5IGxpa2UgCnRoaXM6Cgpub3RpZl8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPC0gTU1VIG5vdGlmaWVyIHByZWZpeApub3RpZl9zdGF0ZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPC0gc3RydWN0IG1tdV9ub3RpZmllcl9tbQpub3RpZl9zdWJzY3JpcHRpb24g
KG5vdGlmX3N1YikgICAgICAgICAgICAgPC0gc3RydWN0IG1tdV9ub3RpZmllcgpub3RpZl9pbnZh
bGlkYXRlX2Rlc2MgICAgICAgICAgICAgICAgICAgICAgPC0gc3RydWN0IG1tdV9ub3RpZmllcl9y
YW5nZSoKbm90aWZfcmFuZ2Vfc3Vic2NyaXB0aW9uIChub3RpZl9yYW5nZV9zdWIpIDwtIHN0cnVj
dCBtbXVfaW50ZXJ2YWxfbm90aWZpZXIKCgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJ
QQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
