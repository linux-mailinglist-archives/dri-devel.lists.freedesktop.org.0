Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA5FB861
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 20:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91BC6EE08;
	Wed, 13 Nov 2019 19:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C5E6EE08
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 19:06:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 11:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="198545356"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga008.jf.intel.com with ESMTP; 13 Nov 2019 11:06:02 -0800
Date: Wed, 13 Nov 2019 11:06:02 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 22/23] selftests/vm: run_vmtests: invoke gup_benchmark
 with basic FOLL_PIN coverage
Message-ID: <20191113190602.GC12947@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-23-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-23-jhubbard@nvidia.com>
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDg6Mjc6MDlQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEl0J3MgZ29vZCB0byBoYXZlIGJhc2ljIHVuaXQgdGVzdCBjb3ZlcmFnZSBvZiB0aGUg
bmV3IEZPTExfUElOCj4gYmVoYXZpb3IuIEZvcnR1bmF0ZWx5LCB0aGUgZ3VwX2JlbmNobWFyayB1
bml0IHRlc3QgaXMgZXh0cmVtZWx5Cj4gZmFzdCAoYSBmZXcgbWlsbGlzZWNvbmRzKSwgc28gYWRk
aW5nIGl0IHRoZSB0aGUgcnVuX3ZtdGVzdHMgc3VpdGUKPiBpcyBnb2luZyB0byBjYXVzZSBubyBu
b3RpY2VhYmxlIGNoYW5nZSBpbiBydW5uaW5nIHRpbWUuCj4gCj4gU28sIGFkZCB0d28gbmV3IGlu
dm9jYXRpb25zIHRvIHJ1bl92bXRlc3RzOgo+IAo+IDEpIFJ1biBndXBfYmVuY2htYXJrIHdpdGgg
bm9ybWFsIGdldF91c2VyX3BhZ2VzKCkuCj4gCj4gMikgUnVuIGd1cF9iZW5jaG1hcmsgd2l0aCBw
aW5fdXNlcl9wYWdlcygpLiBUaGlzIGlzIG11Y2ggbGlrZQo+IHRoZSBmaXJzdCBjYWxsLCBleGNl
cHQgdGhhdCBpdCBzZXRzIEZPTExfUElOLgo+IAo+IFJ1bm5pbmcgdGhlc2UgdHdvIGluIHF1aWNr
IHN1Y2Nlc3Npb24gYWxzbyBwcm92aWRlIGEgdmlzdWFsCj4gY29tcGFyaXNvbiBvZiB0aGUgcnVu
bmluZyB0aW1lcywgd2hpY2ggaXMgY29udmVuaWVudC4KPiAKPiBUaGUgbmV3IGludm9jYXRpb25z
IGFyZSBmYWlybHkgZWFybHkgaW4gdGhlIHJ1bl92bXRlc3RzIHNjcmlwdCwKPiBiZWNhdXNlIHdp
dGggdGVzdCBzdWl0ZXMsIGl0J3MgdXN1YWxseSBwcmVmZXJhYmxlIHRvIHB1dCB0aGUKPiBzaG9y
dGVyLCBmYXN0ZXIgdGVzdHMgZmlyc3QsIGFsbCBvdGhlciB0aGluZ3MgYmVpbmcgZXF1YWwuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKUmV2
aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KCj4gLS0tCj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzIHwgMjIgKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzCj4gaW5kZXggOTUxYzUwN2EyN2Y3Li45M2U4ZGM5YTdj
YWQgMTAwNzU1Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vcnVuX3ZtdGVzdHMK
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cwo+IEBAIC0xMDQs
NiArMTA0LDI4IEBAIGVjaG8gIk5PVEU6IFRoZSBhYm92ZSBodWdldGxiIHRlc3RzIHByb3ZpZGUg
bWluaW1hbCBjb3ZlcmFnZS4gIFVzZSIKPiAgZWNobyAiICAgICAgaHR0cHM6Ly9naXRodWIuY29t
L2xpYmh1Z2V0bGJmcy9saWJodWdldGxiZnMuZ2l0IGZvciIKPiAgZWNobyAiICAgICAgaHVnZXRs
YiByZWdyZXNzaW9uIHRlc3RpbmcuIgo+ICAKPiArZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0iCj4gK2VjaG8gInJ1bm5pbmcgJ2d1cF9iZW5jaG1hcmsg
LVUnIChub3JtYWwvc2xvdyBndXApIgo+ICtlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSIKPiArLi9ndXBfYmVuY2htYXJrIC1VCj4gK2lmIFsgJD8gLW5l
IDAgXTsgdGhlbgo+ICsJZWNobyAiW0ZBSUxdIgo+ICsJZXhpdGNvZGU9MQo+ICtlbHNlCj4gKwll
Y2hvICJbUEFTU10iCj4gK2ZpCj4gKwo+ICtlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0iCj4gK2VjaG8gInJ1bm5pbmcgZ3VwX2JlbmNobWFyayAtYyAocGlu
X3VzZXJfcGFnZXMpIgo+ICtlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0iCj4gKy4vZ3VwX2JlbmNobWFyayAtYwo+ICtpZiBbICQ/IC1uZSAwIF07IHRoZW4K
PiArCWVjaG8gIltGQUlMXSIKPiArCWV4aXRjb2RlPTEKPiArZWxzZQo+ICsJZWNobyAiW1BBU1Nd
Igo+ICtmaQo+ICsKPiAgZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLSIKPiAgZWNobyAicnVubmlu
ZyB1c2VyZmF1bHRmZCIKPiAgZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLSIKPiAtLSAKPiAyLjI0
LjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
