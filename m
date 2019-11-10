Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE548F6869
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 11:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04886E5C8;
	Sun, 10 Nov 2019 10:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Sun, 10 Nov 2019 10:17:31 UTC
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719B6E5C8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 10:17:31 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id TkAciN9jLQBsYTkAfi1RpK; Sun, 10 Nov 2019 11:11:26 +0100
Subject: Re: [PATCH v2 04/18] media/v4l2-core: set pages dirty upon releasing
 DMA buffers
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-5-jhubbard@nvidia.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4b2337f6-102d-ae9d-e690-4331d77660c4@xs4all.nl>
Date: Sun, 10 Nov 2019 11:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-5-jhubbard@nvidia.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfAPpy2vpeOFs77rW2iUKK+bPb2VYuB427ajEzGyts3W1VRlRd8q2KZmpOE3DFif2hs9tSjpFG2MDGUxoUwQm+z0hf/YaqIsd4KJq73ThxOO7jqnMZVh0
 5s2Ci3kaB1equdumf2oCd5xzPIVouOW1/6UWWZgdj5tXsUmXU+r/YvhgWiD4A5B5WBtqZIjcpZHv6EKsqhHvOz6pIIbA7OldOWD2+iHEV3rVaUTKb6Lt3vRw
 SSXpeck8t+iVDTfehAnk4OCQknEuuW7biYsmpQFqR+21Z4qbrYGAJFWwZGcx5l1O9Nb+oL+1R7wh7rczhsKkATyoeyEbJh7U5bWdVqvWfIRcf2W7EU+qBTBa
 X7Uir4ix/M0Vc8kPKcpvtanUB7BwbBsdTwpfWZs6MGGivJgNeWJTOg0pJ8/lJLpxYEgYT1my4VIi7msLPk5NPAhRKjmUqSeBdgx8a5QxjgigbuB7AzOfHnKq
 ZzakHL1ulDMamAJ5G9YZZjwCB+lOMOUp5M3CZNRpUz5w7sRFxqShtLzNOamqMbdo1uYqNd0vcjOgiKZR8d9Ghp29rh44/i+M6byEp/mDuO8hkUsi6jHOl0Jc
 2AsL8S7dTnmRvpiwGny5VVVHzqw5VaucvjDIrC7g1GMNCVRVQGn6eqGLBi9r+KmU9xgLz4PEaJs8ezN37s2nqlRHMEUZEcp+0+DGahQQuCOB5ZtIgcZI4RLV
 GtvowA/PQOkGTxubmHrxAhc6A75jhab02NbtNvCE8y9gMwelrINTjlClQk3w4e+mbQFNkFV2ECg9betDwH8/aIdQ08eLbeJlRT9VV2RlzufdbZT8WYUKa3rQ
 XrzXyEWlNgLgdhKTXh0gLOMN1fnBuGnwvPLE+9dloH9gj5/ahIl1DJ1yC5bX8YaUgYefoKylCBFkllnRgj55soXCdEpByoyvoOtA9cLY+8HPuv8yFz30DCRl
 loaEV8FCCffWUFnYyblWEO9HjL7sGDOb3AgMAMj1WfnDClDQ3Ke+QmqrIUPJAob7r+3lZrpzd80clijb4adwOWHUw9h2hzLNp12Jtuxf7rCNBDN9d0d3xcJP
 CQUt8WSeOsrapke/lCNSISw8IUFdRqcP8SBDphkMHZ6Ufy4ivENOjdpqmPgmUlDt2yDks5tyJ8p+63Ohr5N9kCcaLw8ePN4eY8/i2Yefol6FpRFwDf50/E0y
 I/X+ZEgsPHX0dVwFtL9IEqmHiSQY81IjgKYkJL1PhteOJmC92UP+QNn6ZPsWLuZ/haHv+miyWHADTl/qLfH38B3y6M4Pmjva6VM7WmQ6DOw1MqUxuJT/v53v
 D98Je6z4yf0/L93nJ/iKmgOFto/kGOYI7cTtA+aiGH69QjtEjUslbWgWW5DA4lVL/fi/uIVNVbhElR2trAv8SoZoOAGF53v4D0PPvVLo+05K//bIQbQ=
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

T24gMTEvMy8xOSAxMDoxNyBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IEFmdGVyIERNQSBpcyBj
b21wbGV0ZSwgYW5kIHRoZSBkZXZpY2UgYW5kIENQVSBjYWNoZXMgYXJlIHN5bmNocm9uaXplZCwK
PiBpdCdzIHN0aWxsIHJlcXVpcmVkIHRvIG1hcmsgdGhlIENQVSBwYWdlcyBhcyBkaXJ0eSwgaWYg
dGhlIGRhdGEgd2FzCj4gY29taW5nIGZyb20gdGhlIGRldmljZS4gSG93ZXZlciwgdGhpcyBkcml2
ZXIgd2FzIGp1c3QgaXNzdWluZyBhCj4gYmFyZSBwdXRfcGFnZSgpIGNhbGwsIHdpdGhvdXQgYW55
IHNldF9wYWdlX2RpcnR5KigpIGNhbGwuCj4gCj4gRml4IHRoZSBwcm9ibGVtLCBieSBjYWxsaW5n
IHNldF9wYWdlX2RpcnR5X2xvY2soKSBpZiB0aGUgQ1BVIHBhZ2VzCj4gd2VyZSBwb3RlbnRpYWxs
eSByZWNlaXZpbmcgZGF0YSBmcm9tIHRoZSBkZXZpY2UuCj4gCj4gQ2M6IE1hdXJvIENhcnZhbGhv
IENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFy
ZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCkFja2VkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWls
LWNpc2NvQHhzNGFsbC5ubD4KCkxvb2tzIGdvb2QsIHRoYW5rcyEKCglIYW5zCgo+IC0tLQo+ICBk
cml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtc2cuYyB8IDUgKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtc2cuYyBiL2RyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCj4gaW5kZXggNjZhNmM2YzIzNmE3Li4y
ODI2MjE5MGMzYWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9i
dWYtZG1hLXNnLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEt
c2cuYwo+IEBAIC0zNDksOCArMzQ5LDExIEBAIGludCB2aWRlb2J1Zl9kbWFfZnJlZShzdHJ1Y3Qg
dmlkZW9idWZfZG1hYnVmICpkbWEpCj4gIAlCVUdfT04oZG1hLT5zZ2xlbik7Cj4gIAo+ICAJaWYg
KGRtYS0+cGFnZXMpIHsKPiAtCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5ucl9wYWdlczsgaSsrKQo+
ICsJCWZvciAoaSA9IDA7IGkgPCBkbWEtPm5yX3BhZ2VzOyBpKyspIHsKPiArCQkJaWYgKGRtYS0+
ZGlyZWN0aW9uID09IERNQV9GUk9NX0RFVklDRSkKPiArCQkJCXNldF9wYWdlX2RpcnR5X2xvY2so
ZG1hLT5wYWdlc1tpXSk7Cj4gIAkJCXB1dF9wYWdlKGRtYS0+cGFnZXNbaV0pOwo+ICsJCX0KPiAg
CQlrZnJlZShkbWEtPnBhZ2VzKTsKPiAgCQlkbWEtPnBhZ2VzID0gTlVMTDsKPiAgCX0KPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
