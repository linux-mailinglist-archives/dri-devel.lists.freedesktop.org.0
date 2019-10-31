Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C2EB718
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 19:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65FD6F602;
	Thu, 31 Oct 2019 18:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9F26F559
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 18:36:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 11:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,252,1569308400"; d="scan'208";a="212547050"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga002.jf.intel.com with ESMTP; 31 Oct 2019 11:36:56 -0700
Date: Thu, 31 Oct 2019 11:36:56 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 03/19] goldish_pipe: rename local pin_user_pages() routine
Message-ID: <20191031183656.GD14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-4-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-4-jhubbard@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MTRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IDEuIEF2b2lkIG5hbWluZyBjb25mbGljdHM6IHJlbmFtZSBsb2NhbCBzdGF0aWMgZnVu
Y3Rpb24gZnJvbQo+ICJwaW5fdXNlcl9wYWdlcygpIiB0byAicGluX2dvbGRmaXNoX3BhZ2VzKCki
Lgo+IAo+IEFuIHVwY29taW5nIHBhdGNoIHdpbGwgaW50cm9kdWNlIGEgZ2xvYmFsIHBpbl91c2Vy
X3BhZ2VzKCkKPiBmdW5jdGlvbi4KPiAKClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlu
eUBpbnRlbC5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZp
ZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBl
LmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9n
b2xkZmlzaC9nb2xkZmlzaF9waXBlLmMgYi9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRm
aXNoX3BpcGUuYwo+IGluZGV4IGNlZjAxMzNhYTQ3YS4uN2VkMmEyMWEwYmFjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCj4gKysrIGIvZHJp
dmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKPiBAQCAtMjU3LDEyICsyNTcs
MTIgQEAgc3RhdGljIGludCBnb2xkZmlzaF9waXBlX2Vycm9yX2NvbnZlcnQoaW50IHN0YXR1cykK
PiAgCX0KPiAgfQo+ICAKPiAtc3RhdGljIGludCBwaW5fdXNlcl9wYWdlcyh1bnNpZ25lZCBsb25n
IGZpcnN0X3BhZ2UsCj4gLQkJCSAgdW5zaWduZWQgbG9uZyBsYXN0X3BhZ2UsCj4gLQkJCSAgdW5z
aWduZWQgaW50IGxhc3RfcGFnZV9zaXplLAo+IC0JCQkgIGludCBpc193cml0ZSwKPiAtCQkJICBz
dHJ1Y3QgcGFnZSAqcGFnZXNbTUFYX0JVRkZFUlNfUEVSX0NPTU1BTkRdLAo+IC0JCQkgIHVuc2ln
bmVkIGludCAqaXRlcl9sYXN0X3BhZ2Vfc2l6ZSkKPiArc3RhdGljIGludCBwaW5fZ29sZGZpc2hf
cGFnZXModW5zaWduZWQgbG9uZyBmaXJzdF9wYWdlLAo+ICsJCQkgICAgICB1bnNpZ25lZCBsb25n
IGxhc3RfcGFnZSwKPiArCQkJICAgICAgdW5zaWduZWQgaW50IGxhc3RfcGFnZV9zaXplLAo+ICsJ
CQkgICAgICBpbnQgaXNfd3JpdGUsCj4gKwkJCSAgICAgIHN0cnVjdCBwYWdlICpwYWdlc1tNQVhf
QlVGRkVSU19QRVJfQ09NTUFORF0sCj4gKwkJCSAgICAgIHVuc2lnbmVkIGludCAqaXRlcl9sYXN0
X3BhZ2Vfc2l6ZSkKPiAgewo+ICAJaW50IHJldDsKPiAgCWludCByZXF1ZXN0ZWRfcGFnZXMgPSAo
KGxhc3RfcGFnZSAtIGZpcnN0X3BhZ2UpID4+IFBBR0VfU0hJRlQpICsgMTsKPiBAQCAtMzU0LDkg
KzM1NCw5IEBAIHN0YXRpYyBpbnQgdHJhbnNmZXJfbWF4X2J1ZmZlcnMoc3RydWN0IGdvbGRmaXNo
X3BpcGUgKnBpcGUsCj4gIAlpZiAobXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZwaXBlLT5sb2Nr
KSkKPiAgCQlyZXR1cm4gLUVSRVNUQVJUU1lTOwo+ICAKPiAtCXBhZ2VzX2NvdW50ID0gcGluX3Vz
ZXJfcGFnZXMoZmlyc3RfcGFnZSwgbGFzdF9wYWdlLAo+IC0JCQkJICAgICBsYXN0X3BhZ2Vfc2l6
ZSwgaXNfd3JpdGUsCj4gLQkJCQkgICAgIHBpcGUtPnBhZ2VzLCAmaXRlcl9sYXN0X3BhZ2Vfc2l6
ZSk7Cj4gKwlwYWdlc19jb3VudCA9IHBpbl9nb2xkZmlzaF9wYWdlcyhmaXJzdF9wYWdlLCBsYXN0
X3BhZ2UsCj4gKwkJCQkJIGxhc3RfcGFnZV9zaXplLCBpc193cml0ZSwKPiArCQkJCQkgcGlwZS0+
cGFnZXMsICZpdGVyX2xhc3RfcGFnZV9zaXplKTsKPiAgCWlmIChwYWdlc19jb3VudCA8IDApIHsK
PiAgCQltdXRleF91bmxvY2soJnBpcGUtPmxvY2spOwo+ICAJCXJldHVybiBwYWdlc19jb3VudDsK
PiAtLSAKPiAyLjIzLjAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
