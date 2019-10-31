Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4CFEBA8E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 00:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EFD6F694;
	Thu, 31 Oct 2019 23:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C743C6F694
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:37:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 16:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="375412814"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga005.jf.intel.com with ESMTP; 31 Oct 2019 16:37:41 -0700
Date: Thu, 31 Oct 2019 16:37:41 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 11/19] net/xdp: set FOLL_PIN via pin_user_pages()
Message-ID: <20191031233740.GK14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-12-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-12-jhubbard@nvidia.com>
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MjJQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IENvbnZlcnQgbmV0L3hkcCB0byB1c2UgdGhlIG5ldyBwaW5fbG9uZ3Rlcm1fcGFnZXMo
KSBjYWxsLCB3aGljaCBzZXRzCj4gRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJl
cXVpcmVkIGZvciBjb2RlIHRoYXQgcmVxdWlyZXMKPiB0cmFja2luZyBvZiBwaW5uZWQgcGFnZXMu
Cj4gCgpSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIG5l
dC94ZHAveGRwX3VtZW0uYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9uZXQveGRwL3hkcF91bWVtLmMg
Yi9uZXQveGRwL3hkcF91bWVtLmMKPiBpbmRleCAxNmQ1ZjM1MzE2M2EuLjRkNTZkZmIxMTM5YSAx
MDA2NDQKPiAtLS0gYS9uZXQveGRwL3hkcF91bWVtLmMKPiArKysgYi9uZXQveGRwL3hkcF91bWVt
LmMKPiBAQCAtMjg1LDggKzI4NSw4IEBAIHN0YXRpYyBpbnQgeGRwX3VtZW1fcGluX3BhZ2VzKHN0
cnVjdCB4ZHBfdW1lbSAqdW1lbSkKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gIAlkb3duX3Jl
YWQoJmN1cnJlbnQtPm1tLT5tbWFwX3NlbSk7Cj4gLQlucGdzID0gZ2V0X3VzZXJfcGFnZXModW1l
bS0+YWRkcmVzcywgdW1lbS0+bnBncywKPiAtCQkJICAgICAgZ3VwX2ZsYWdzIHwgRk9MTF9MT05H
VEVSTSwgJnVtZW0tPnBnc1swXSwgTlVMTCk7Cj4gKwlucGdzID0gcGluX2xvbmd0ZXJtX3BhZ2Vz
KHVtZW0tPmFkZHJlc3MsIHVtZW0tPm5wZ3MsIGd1cF9mbGFncywKPiArCQkJCSAgJnVtZW0tPnBn
c1swXSwgTlVMTCk7Cj4gIAl1cF9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwo+ICAKPiAg
CWlmIChucGdzICE9IHVtZW0tPm5wZ3MpIHsKPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
