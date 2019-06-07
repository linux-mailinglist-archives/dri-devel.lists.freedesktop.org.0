Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A7639937
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 01:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076D6891AC;
	Fri,  7 Jun 2019 23:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80028891AC;
 Fri,  7 Jun 2019 23:00:24 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 16:00:23 -0700
X-ExtLoop1: 1
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga002.jf.intel.com with ESMTP; 07 Jun 2019 16:00:23 -0700
Date: Fri, 7 Jun 2019 16:01:37 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 hmm 09/11] mm/hmm: Poison hmm_range during unregister
Message-ID: <20190607230136.GH14559@iweiny-DESK2.sc.intel.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-10-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606184438.31646-10-jgg@ziepe.ca>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDM6NDQ6MzZQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBU
cnlpbmcgdG8gbWlzdXNlIGEgcmFuZ2Ugb3V0c2lkZSBpdHMgbGlmZXRpbWUgaXMgYSBrZXJuZWwg
YnVnLiBVc2UgV0FSTl9PTgo+IGFuZCBwb2lzb24gYnl0ZXMgdG8gZGV0ZWN0IHRoaXMgY29uZGl0
aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNv
bT4KPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4g
LS0tCj4gdjIKPiAtIEtlZXAgcmFuZ2Ugc3RhcnQvZW5kIHZhbGlkIGFmdGVyIHVucmVnaXN0cmF0
aW9uIChKZXJvbWUpCj4gLS0tCj4gIG1tL2htbS5jIHwgNyArKysrKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21t
L2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCA2ODAyZGU3MDgwZDE3Mi4uYzJmZWNiM2VjYjExZTEg
MTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC05MzcsNyArOTM3
LDcgQEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkK
PiAgCXN0cnVjdCBobW0gKmhtbSA9IHJhbmdlLT5obW07Cj4gIAo+ICAJLyogU2FuaXR5IGNoZWNr
IHRoaXMgcmVhbGx5IHNob3VsZCBub3QgaGFwcGVuLiAqLwo+IC0JaWYgKGhtbSA9PSBOVUxMIHx8
IHJhbmdlLT5lbmQgPD0gcmFuZ2UtPnN0YXJ0KQo+ICsJaWYgKFdBUk5fT04ocmFuZ2UtPmVuZCA8
PSByYW5nZS0+c3RhcnQpKQo+ICAJCXJldHVybjsKPiAgCj4gIAltdXRleF9sb2NrKCZobW0tPmxv
Y2spOwo+IEBAIC05NDgsNyArOTQ4LDEwIEBAIHZvaWQgaG1tX3JhbmdlX3VucmVnaXN0ZXIoc3Ry
dWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gIAlyYW5nZS0+dmFsaWQgPSBmYWxzZTsKPiAgCW1tcHV0
KGhtbS0+bW0pOwo+ICAJaG1tX3B1dChobW0pOwo+IC0JcmFuZ2UtPmhtbSA9IE5VTEw7Cj4gKwo+
ICsJLyogVGhlIHJhbmdlIGlzIG5vdyBpbnZhbGlkLCBsZWF2ZSBpdCBwb2lzb25lZC4gKi8KPiAr
CXJhbmdlLT52YWxpZCA9IGZhbHNlOwoKTm8gbmVlZCB0byBzZXQgdmFsaWQgZmFsc2UgYWdhaW4g
YXMgeW91IGp1c3QgZGlkIHRoaXMgNSBsaW5lcyBhYm92ZS4KClJldmlld2VkLWJ5OiBJcmEgV2Vp
bnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cgo+ICsJbWVtc2V0KCZyYW5nZS0+aG1tLCBQT0lTT05f
SU5VU0UsIHNpemVvZihyYW5nZS0+aG1tKSk7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChobW1fcmFu
Z2VfdW5yZWdpc3Rlcik7Cj4gIAo+IC0tIAo+IDIuMjEuMAo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
