Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6847EF0F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDFF6ED32;
	Fri,  2 Aug 2019 08:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C3789BFD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 09:58:21 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V9wD1a028686
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 05:58:20 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u37n5380a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 05:58:18 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <bharata@linux.ibm.com>;
 Wed, 31 Jul 2019 10:57:51 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 31 Jul 2019 10:57:48 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6V9vlWW33358064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 09:57:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C11224C04A;
 Wed, 31 Jul 2019 09:57:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 465574C044;
 Wed, 31 Jul 2019 09:57:44 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.246.128])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 31 Jul 2019 09:57:43 +0000 (GMT)
Date: Wed, 31 Jul 2019 15:27:35 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/9] nouveau: simplify nouveau_dmem_migrate_to_ram
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729142843.22320-6-hch@lst.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-TM-AS-GCONF: 00
x-cbid: 19073109-0012-0000-0000-00000337F1FF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19073109-0013-0000-0000-000021719A7D
Message-Id: <20190731095735.GB18807@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907310102
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Reply-To: bharata@linux.ibm.com
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDU6Mjg6MzlQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gRmFjdG9yIHRoZSBtYWluIGNvcHkgcGFnZSB0byByYW0gcm91dGluZSBvdXQg
aW50byBhIGhlbHBlciB0aGF0IGFjdHMgb24KPiBhIHNpbmdsZSBwYWdlIGFuZCB3aGljaCBkb2Vz
bid0IHJlcXVpcmUgdGhlIG5vdXZlYXVfZG1lbV9mYXVsdAo+IHN0cnVjdHVyZSBmb3IgYXJndW1l
bnQgcGFzc2luZy4gIEFsc28gcmVtb3ZlIHRoZSBsb29wIG92ZXIgbXVsdGlwbGUKPiBwYWdlcyBh
cyB3ZSBvbmx5IGhhbmRsZSBvbmUgYXQgdGhlIG1vbWVudCwgYWx0aG91Z2ggdGhlIHN0cnVjdHVy
ZSBvZgo+IHRoZSBtYWluIHdvcmtlciBmdW5jdGlvbiBtYWtlcyBpdCByZWxhdGl2ZWx5IGVhc3kg
dG8gYWRkIG11bHRpIHBhZ2UKPiBzdXBwb3J0IGJhY2sgaWYgbmVlZGVkIGluIHRoZSBmdXR1cmUu
ICBCdXQgYXQgbGVhc3QgZm9yIG5vdyB0aGlzIGF2b2lkCj4gdGhlIG5lZWRlZCB0byBkeW5hbWlj
YWxseSBhbGxvY2F0ZSBtZW1vcnkgZm9yIHRoZSBkbWEgYWRkcmVzc2VzIGluCj4gd2hhdCBpcyBl
c3NlbnRpYWxseSB0aGUgcGFnZSBmYXVsdCBwYXRoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2RtZW0uYyB8IDE1OCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxMTkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKPiBpbmRleCAyMTA1MmE0YWFmNjkuLjAzNmU2
YzA3ZDQ4OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rt
ZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCj4gQEAg
LTg2LDEzICs4Niw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG5vdXZlYXVfZG1lbSAqcGFnZV90
b19kbWVtKHN0cnVjdCBwYWdlICpwYWdlKQo+ICAJcmV0dXJuIGNvbnRhaW5lcl9vZihwYWdlLT5w
Z21hcCwgc3RydWN0IG5vdXZlYXVfZG1lbSwgcGFnZW1hcCk7Cj4gIH0KPiAgCj4gLXN0cnVjdCBu
b3V2ZWF1X2RtZW1fZmF1bHQgewo+IC0Jc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLQlzdHJ1
Y3Qgbm91dmVhdV9mZW5jZSAqZmVuY2U7Cj4gLQlkbWFfYWRkcl90ICpkbWE7Cj4gLQl1bnNpZ25l
ZCBsb25nIG5wYWdlczsKPiAtfTsKPiAtCj4gIHN0cnVjdCBub3V2ZWF1X21pZ3JhdGUgewo+ICAJ
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4gIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybTsK
PiBAQCAtMTQ2LDEzMCArMTM5LDU1IEBAIHN0YXRpYyB2b2lkIG5vdXZlYXVfZG1lbV9mZW5jZV9k
b25lKHN0cnVjdCBub3V2ZWF1X2ZlbmNlICoqZmVuY2UpCj4gIAl9Cj4gIH0KPiAgCj4gLXN0YXRp
YyB2b2lkCj4gLW5vdXZlYXVfZG1lbV9mYXVsdF9hbGxvY19hbmRfY29weShzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwKPiAtCQkJCSAgY29uc3QgdW5zaWduZWQgbG9uZyAqc3JjX3BmbnMsCj4g
LQkJCQkgIHVuc2lnbmVkIGxvbmcgKmRzdF9wZm5zLAo+IC0JCQkJICB1bnNpZ25lZCBsb25nIHN0
YXJ0LAo+IC0JCQkJICB1bnNpZ25lZCBsb25nIGVuZCwKPiAtCQkJCSAgc3RydWN0IG5vdXZlYXVf
ZG1lbV9mYXVsdCAqZmF1bHQpCj4gK3N0YXRpYyB2bV9mYXVsdF90IG5vdXZlYXVfZG1lbV9mYXVs
dF9jb3B5X29uZShzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwKPiArCQlzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICsJCXVuc2lnbmVkIGxvbmcgc3JjLCB1
bnNpZ25lZCBsb25nICpkc3QsIGRtYV9hZGRyX3QgKmRtYV9hZGRyKQo+ICB7Cj4gLQlzdHJ1Y3Qg
bm91dmVhdV9kcm0gKmRybSA9IGZhdWx0LT5kcm07Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBk
cm0tPmRldi0+ZGV2Owo+IC0JdW5zaWduZWQgbG9uZyBhZGRyLCBpLCBucGFnZXMgPSAwOwo+IC0J
bm91dmVhdV9taWdyYXRlX2NvcHlfdCBjb3B5Owo+IC0JaW50IHJldDsKPiAtCj4gLQo+IC0JLyog
Rmlyc3QgYWxsb2NhdGUgbmV3IG1lbW9yeSAqLwo+IC0JZm9yIChhZGRyID0gc3RhcnQsIGkgPSAw
OyBhZGRyIDwgZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgaSsrKSB7Cj4gLQkJc3RydWN0IHBhZ2Ug
KmRwYWdlLCAqc3BhZ2U7Cj4gLQo+IC0JCWRzdF9wZm5zW2ldID0gMDsKPiAtCQlzcGFnZSA9IG1p
Z3JhdGVfcGZuX3RvX3BhZ2Uoc3JjX3BmbnNbaV0pOwo+IC0JCWlmICghc3BhZ2UgfHwgIShzcmNf
cGZuc1tpXSAmIE1JR1JBVEVfUEZOX01JR1JBVEUpKQo+IC0JCQljb250aW51ZTsKPiArCXN0cnVj
dCBwYWdlICpkcGFnZSwgKnNwYWdlOwo+ICAKPiAtCQlkcGFnZSA9IGFsbG9jX3BhZ2Vfdm1hKEdG
UF9ISUdIVVNFUiwgdm1hLCBhZGRyKTsKPiAtCQlpZiAoIWRwYWdlKSB7Cj4gLQkJCWRzdF9wZm5z
W2ldID0gTUlHUkFURV9QRk5fRVJST1I7Cj4gLQkJCWNvbnRpbnVlOwo+IC0JCX0KPiAtCQlsb2Nr
X3BhZ2UoZHBhZ2UpOwo+IC0KPiAtCQlkc3RfcGZuc1tpXSA9IG1pZ3JhdGVfcGZuKHBhZ2VfdG9f
cGZuKGRwYWdlKSkgfAo+IC0JCQkgICAgICBNSUdSQVRFX1BGTl9MT0NLRUQ7Cj4gLQkJbnBhZ2Vz
Kys7Cj4gLQl9Cj4gKwlzcGFnZSA9IG1pZ3JhdGVfcGZuX3RvX3BhZ2Uoc3JjKTsKPiArCWlmICgh
c3BhZ2UgfHwgIShzcmMgJiBNSUdSQVRFX1BGTl9NSUdSQVRFKSkKPiArCQlyZXR1cm4gMDsKPiAg
Cj4gLQkvKiBBbGxvY2F0ZSBzdG9yYWdlIGZvciBETUEgYWRkcmVzc2VzLCBzbyB3ZSBjYW4gdW5t
YXAgbGF0ZXIuICovCj4gLQlmYXVsdC0+ZG1hID0ga21hbGxvYyhzaXplb2YoKmZhdWx0LT5kbWEp
ICogbnBhZ2VzLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghZmF1bHQtPmRtYSkKPiArCWRwYWdlID0g
YWxsb2NfcGFnZV92bWEoR0ZQX0hJR0hVU0VSLCBhcmdzLT52bWEsIGFkZHIpOwo+ICsJaWYgKCFk
cGFnZSkKPiAgCQlnb3RvIGVycm9yOwo+ICsJbG9ja19wYWdlKGRwYWdlKTsKPiAgCj4gLQkvKiBD
b3B5IHRoaW5ncyBvdmVyICovCj4gLQljb3B5ID0gZHJtLT5kbWVtLT5taWdyYXRlLmNvcHlfZnVu
YzsKPiAtCWZvciAoYWRkciA9IHN0YXJ0LCBpID0gMDsgYWRkciA8IGVuZDsgYWRkciArPSBQQUdF
X1NJWkUsIGkrKykgewo+IC0JCXN0cnVjdCBwYWdlICpzcGFnZSwgKmRwYWdlOwo+IC0KPiAtCQlk
cGFnZSA9IG1pZ3JhdGVfcGZuX3RvX3BhZ2UoZHN0X3BmbnNbaV0pOwo+IC0JCWlmICghZHBhZ2Ug
fHwgZHN0X3BmbnNbaV0gPT0gTUlHUkFURV9QRk5fRVJST1IpCj4gLQkJCWNvbnRpbnVlOwo+IC0K
PiAtCQlzcGFnZSA9IG1pZ3JhdGVfcGZuX3RvX3BhZ2Uoc3JjX3BmbnNbaV0pOwo+IC0JCWlmICgh
c3BhZ2UgfHwgIShzcmNfcGZuc1tpXSAmIE1JR1JBVEVfUEZOX01JR1JBVEUpKSB7Cj4gLQkJCWRz
dF9wZm5zW2ldID0gTUlHUkFURV9QRk5fRVJST1I7Cj4gLQkJCV9fZnJlZV9wYWdlKGRwYWdlKTsK
PiAtCQkJY29udGludWU7Cj4gLQkJfQo+IC0KPiAtCQlmYXVsdC0+ZG1hW2ZhdWx0LT5ucGFnZXNd
ID0KPiAtCQkJZG1hX21hcF9wYWdlX2F0dHJzKGRldiwgZHBhZ2UsIDAsIFBBR0VfU0laRSwKPiAt
CQkJCQkgICBQQ0lfRE1BX0JJRElSRUNUSU9OQUwsCj4gLQkJCQkJICAgRE1BX0FUVFJfU0tJUF9D
UFVfU1lOQyk7Cj4gLQkJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgZmF1bHQtPmRtYVtmYXVs
dC0+bnBhZ2VzXSkpIHsKPiAtCQkJZHN0X3BmbnNbaV0gPSBNSUdSQVRFX1BGTl9FUlJPUjsKPiAt
CQkJX19mcmVlX3BhZ2UoZHBhZ2UpOwo+IC0JCQljb250aW51ZTsKPiAtCQl9Cj4gLQo+IC0JCXJl
dCA9IGNvcHkoZHJtLCAxLCBOT1VWRUFVX0FQRVJfSE9TVCwKPiAtCQkJCWZhdWx0LT5kbWFbZmF1
bHQtPm5wYWdlcysrXSwKPiAtCQkJCU5PVVZFQVVfQVBFUl9WUkFNLAo+IC0JCQkJbm91dmVhdV9k
bWVtX3BhZ2VfYWRkcihzcGFnZSkpOwo+IC0JCWlmIChyZXQpIHsKPiAtCQkJZHN0X3BmbnNbaV0g
PSBNSUdSQVRFX1BGTl9FUlJPUjsKPiAtCQkJX19mcmVlX3BhZ2UoZHBhZ2UpOwo+IC0JCQljb250
aW51ZTsKPiAtCQl9Cj4gLQl9Cj4gKwkqZG1hX2FkZHIgPSBkbWFfbWFwX3BhZ2UoZGV2LCBkcGFn
ZSwgMCwgUEFHRV9TSVpFLCBETUFfQklESVJFQ1RJT05BTCk7Cj4gKwlpZiAoZG1hX21hcHBpbmdf
ZXJyb3IoZGV2LCAqZG1hX2FkZHIpKQo+ICsJCWdvdG8gZXJyb3JfZnJlZV9wYWdlOwo+ICAKPiAt
CW5vdXZlYXVfZmVuY2VfbmV3KGRybS0+ZG1lbS0+bWlncmF0ZS5jaGFuLCBmYWxzZSwgJmZhdWx0
LT5mZW5jZSk7Cj4gKwlpZiAoZHJtLT5kbWVtLT5taWdyYXRlLmNvcHlfZnVuYyhkcm0sIDEsIE5P
VVZFQVVfQVBFUl9IT1NULCAqZG1hX2FkZHIsCj4gKwkJCU5PVVZFQVVfQVBFUl9WUkFNLCBub3V2
ZWF1X2RtZW1fcGFnZV9hZGRyKHNwYWdlKSkpCj4gKwkJZ290byBlcnJvcl9kbWFfdW5tYXA7Cj4g
IAo+IC0JcmV0dXJuOwo+ICsJKmRzdCA9IG1pZ3JhdGVfcGZuKHBhZ2VfdG9fcGZuKGRwYWdlKSkg
fCBNSUdSQVRFX1BGTl9MT0NLRUQ7Cj4gIAo+ICtlcnJvcl9kbWFfdW5tYXA6Cj4gKwlkbWFfdW5t
YXBfcGFnZShkZXYsICpkbWFfYWRkciwgUEFHRV9TSVpFLCBETUFfQklESVJFQ1RJT05BTCk7Cj4g
K2Vycm9yX2ZyZWVfcGFnZToKPiArCV9fZnJlZV9wYWdlKGRwYWdlKTsKPiAgZXJyb3I6Cj4gLQlm
b3IgKGFkZHIgPSBzdGFydCwgaSA9IDA7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFLCAr
K2kpIHsKPiAtCQlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAtCj4gLQkJaWYgKCFkc3RfcGZuc1tpXSB8
fCBkc3RfcGZuc1tpXSA9PSBNSUdSQVRFX1BGTl9FUlJPUikKPiAtCQkJY29udGludWU7Cj4gLQo+
IC0JCXBhZ2UgPSBtaWdyYXRlX3Bmbl90b19wYWdlKGRzdF9wZm5zW2ldKTsKPiAtCQlkc3RfcGZu
c1tpXSA9IE1JR1JBVEVfUEZOX0VSUk9SOwo+IC0JCWlmIChwYWdlID09IE5VTEwpCj4gLQkJCWNv
bnRpbnVlOwo+IC0KPiAtCQlfX2ZyZWVfcGFnZShwYWdlKTsKPiAtCX0KPiAtfQo+IC0KPiAtc3Rh
dGljIHZvaWQKPiAtbm91dmVhdV9kbWVtX2ZhdWx0X2ZpbmFsaXplX2FuZF9tYXAoc3RydWN0IG5v
dXZlYXVfZG1lbV9mYXVsdCAqZmF1bHQpCj4gLXsKPiAtCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJt
ID0gZmF1bHQtPmRybTsKPiAtCj4gLQlub3V2ZWF1X2RtZW1fZmVuY2VfZG9uZSgmZmF1bHQtPmZl
bmNlKTsKPiAtCj4gLQl3aGlsZSAoZmF1bHQtPm5wYWdlcy0tKSB7Cj4gLQkJZG1hX3VubWFwX3Bh
Z2UoZHJtLT5kZXYtPmRldiwgZmF1bHQtPmRtYVtmYXVsdC0+bnBhZ2VzXSwKPiAtCQkJICAgICAg
IFBBR0VfU0laRSwgUENJX0RNQV9CSURJUkVDVElPTkFMKTsKPiAtCX0KPiAtCWtmcmVlKGZhdWx0
LT5kbWEpOwo+ICsJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKCkxvb2tzIGxpa2Ugbm91dmVhdV9k
bWVtX2ZhdWx0X2NvcHlfb25lKCkgaXMgbm93IHJldHVybmluZyBWTV9GQVVMVF9TSUdCVVMKZm9y
IHN1Y2Nlc3MgY2FzZS4gSXMgdGhpcyBleHBlY3RlZD8KClJlZ2FyZHMsCkJoYXJhdGEuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
