Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B82F686B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 11:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635BB6E5D4;
	Sun, 10 Nov 2019 10:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458486E5D2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 10:19:00 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id TkCAiNAD3QBsYTkCDi1SAO; Sun, 10 Nov 2019 11:11:50 +0100
Subject: Re: [PATCH v2 13/18] media/v4l2-core: pin_longterm_pages (FOLL_PIN)
 and put_user_page() conversion
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-14-jhubbard@nvidia.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6d21391e-01c4-0605-0d0d-15f574cc3ed4@xs4all.nl>
Date: Sun, 10 Nov 2019 11:11:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-14-jhubbard@nvidia.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFSTukyJqfxV4HrGGQ0j5/iKKr13OkEzy05WqAOfOSWrg/qEYKz7zmsSLuZTQBp28yCz+dvkf6VRv+kw027uNzPdnpP1TG1MNl/DxEey7uZK5/xalM5y
 5mek2ggN11NHCI9OB51pAxH9HazB5AMpcNYWMTjkyDZlvUJtbfWW4ZUZq85nxiyCH9Wkwv75NaxcyvTMitOA+o4+U5rJjg8sA8gvfV9NbRRVFg3M6alu0IKv
 kyfdjDFwuG4F6JKpbt9v3E049Xx0YF8ppWdgVnIjGfusfyNaLb+90K4NGhzfPU11L+2UeV4HzuHSmBSjFWbsZNO99HRrZoUYxfZil98flfM0I4Tl92e2ZZ6T
 oLNGV585kbb26i0UwqgRbX0qClJpOQIX8JPemeIZHsAISH4A6EIzai79YkaAZrrdJDqsHcU/g5pBk7M+m8f1h0UhG93G+VP07un/zdrM5krNUgUcOHqWl6c8
 yg5UitZLkuZJeoj3AZIHtptGajhOljPiqFe3qrME7yIGvxpfurp6646fJOQdrdhgQ99ZW5ZVLjxCYcB39QCEQQpm6CL4XMXAsAilPNdyDqQvU26KgyC+BY4C
 EfgFzK7XJbQ28t/ACJ7DTyyH14NWDMPJXEZyBEirCE+SenjaNpo1ArEbqixnm5RCT+dULYmvp/soWFNQsgosWPukS+PH1BUonrmmMVLsT7pZ55bv6EkNWDl4
 9ypHPyVuYZBeyd/QB3263NKtG9W94IRv7gkIMIXqe+gaZqosCCZGLoQ/R3NrX+UELfTllPBXIEjGQ6GcqW4vDLnC6e5LObzBu95S05AVd/j5Z489creqnOqz
 al1X+EBLb7SCFjH5bT0l7XPwxsPFls2nYnNC2VvjaojW5EGzj+P9FMGrDMXQYA5CwZYMR9jVieofsVzZROWuyWgzGX0IWmVMrVJ+O9Cd6w+r38l2u6VzMDO3
 vrKP72jlsDujiCNkz8SZOuEiycTOpqK7FnQXWC0vHy8ZQ5kE+5U3ZOrlf3bE5a7YMuwWWgEf1wyekRKSE5FPwRln1aFBkEu6RfHldiY5r6mScJHM0Hmz3L1G
 jmpevDng1F0dM0khzD8Rn/xNHOQmjygIoT2XjmtiT+xp1E4E+mkPp1qzmYUhF73no8Ws5q3/bDKWOdGuUrZQjRZdQtb3gNeBRaDBFMdPnfgT4QkU99ovX9La
 0JO93Bw0hzkTQPZYGAQEEyZ5mT+kT8y0hQD80773+KE9/qHPFnhe80tvkU1RdNM3L33ptC7eREOqMAmdRO6tk0ZlucAIUVw5MRfKAm2acO9sl5to+l22CFB1
 ACY3IoeSiNIkXxalh1O2DqvLWJh0AapBIq9krEjBZouKIfbQ+FRgwsFcvPJZJS2eW70SQX+omUmZZ5xpSWDV1lpAjnprcaVW+xX7OhGfCCj2gQOCd9Q=
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
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMy8xOSAxMDoxOCBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IDEuIENoYW5nZSB2NGwy
IGZyb20gZ2V0X3VzZXJfcGFnZXMoRk9MTF9MT05HVEVSTSksIHRvCj4gcGluX2xvbmd0ZXJtX3Bh
Z2VzKCksIHdoaWNoIHNldHMgYm90aCBGT0xMX0xPTkdURVJNIGFuZCBGT0xMX1BJTi4KPiAKPiAy
LiBCZWNhdXNlIGFsbCBGT0xMX1BJTi1hY3F1aXJlZCBwYWdlcyBtdXN0IGJlIHJlbGVhc2VkIHZp
YQo+IHB1dF91c2VyX3BhZ2UoKSwgYWxzbyBjb252ZXJ0IHRoZSBwdXRfcGFnZSgpIGNhbGwgb3Zl
ciB0bwo+IHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKS4KPiAKPiBSZXZpZXdlZC1ieTogSXJh
IFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IENjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWJAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+CgpBY2tlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4
czRhbGwubmw+CgpMb29rcyBnb29kLCB0aGFua3MhCgoJSGFucwoKCj4gLS0tCj4gIGRyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jIHwgMTMgKysrKystLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtc2cuYyBiL2RyaXZl
cnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCj4gaW5kZXggMjgyNjIxOTBjM2Fi
Li45YjljNWIzN2JmNTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlk
ZW9idWYtZG1hLXNnLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1k
bWEtc2cuYwo+IEBAIC0xODMsMTIgKzE4MywxMiBAQCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9p
bml0X3VzZXJfbG9ja2VkKHN0cnVjdCB2aWRlb2J1Zl9kbWFidWYgKmRtYSwKPiAgCWRwcmludGso
MSwgImluaXQgdXNlciBbMHglbHgrMHglbHggPT4gJWQgcGFnZXNdXG4iLAo+ICAJCWRhdGEsIHNp
emUsIGRtYS0+bnJfcGFnZXMpOwo+ICAKPiAtCWVyciA9IGdldF91c2VyX3BhZ2VzKGRhdGEgJiBQ
QUdFX01BU0ssIGRtYS0+bnJfcGFnZXMsCj4gLQkJCSAgICAgZmxhZ3MgfCBGT0xMX0xPTkdURVJN
LCBkbWEtPnBhZ2VzLCBOVUxMKTsKPiArCWVyciA9IHBpbl9sb25ndGVybV9wYWdlcyhkYXRhICYg
UEFHRV9NQVNLLCBkbWEtPm5yX3BhZ2VzLAo+ICsJCQkJIGZsYWdzLCBkbWEtPnBhZ2VzLCBOVUxM
KTsKPiAgCj4gIAlpZiAoZXJyICE9IGRtYS0+bnJfcGFnZXMpIHsKPiAgCQlkbWEtPm5yX3BhZ2Vz
ID0gKGVyciA+PSAwKSA/IGVyciA6IDA7Cj4gLQkJZHByaW50aygxLCAiZ2V0X3VzZXJfcGFnZXM6
IGVycj0lZCBbJWRdXG4iLCBlcnIsCj4gKwkJZHByaW50aygxLCAicGluX2xvbmd0ZXJtX3BhZ2Vz
OiBlcnI9JWQgWyVkXVxuIiwgZXJyLAo+ICAJCQlkbWEtPm5yX3BhZ2VzKTsKPiAgCQlyZXR1cm4g
ZXJyIDwgMCA/IGVyciA6IC1FSU5WQUw7Cj4gIAl9Cj4gQEAgLTM0OSwxMSArMzQ5LDggQEAgaW50
IHZpZGVvYnVmX2RtYV9mcmVlKHN0cnVjdCB2aWRlb2J1Zl9kbWFidWYgKmRtYSkKPiAgCUJVR19P
TihkbWEtPnNnbGVuKTsKPiAgCj4gIAlpZiAoZG1hLT5wYWdlcykgewo+IC0JCWZvciAoaSA9IDA7
IGkgPCBkbWEtPm5yX3BhZ2VzOyBpKyspIHsKPiAtCQkJaWYgKGRtYS0+ZGlyZWN0aW9uID09IERN
QV9GUk9NX0RFVklDRSkKPiAtCQkJCXNldF9wYWdlX2RpcnR5X2xvY2soZG1hLT5wYWdlc1tpXSk7
Cj4gLQkJCXB1dF9wYWdlKGRtYS0+cGFnZXNbaV0pOwo+IC0JCX0KPiArCQlwdXRfdXNlcl9wYWdl
c19kaXJ0eV9sb2NrKGRtYS0+cGFnZXMsIGRtYS0+bnJfcGFnZXMsCj4gKwkJCQkJICBkbWEtPmRp
cmVjdGlvbiA9PSBETUFfRlJPTV9ERVZJQ0UpOwo+ICAJCWtmcmVlKGRtYS0+cGFnZXMpOwo+ICAJ
CWRtYS0+cGFnZXMgPSBOVUxMOwo+ICAJfQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
