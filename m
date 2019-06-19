Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740844C7F3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCC06E4FB;
	Thu, 20 Jun 2019 07:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3772889B3C;
 Wed, 19 Jun 2019 20:05:43 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JK3j9u107770;
 Wed, 19 Jun 2019 20:05:27 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t7809dft1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 20:05:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JK5FSV002705;
 Wed, 19 Jun 2019 20:05:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t7rdwu63d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 20:05:26 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5JK5NFI017703;
 Wed, 19 Jun 2019 20:05:23 GMT
Received: from [10.65.164.174] (/10.65.164.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 13:05:23 -0700
Subject: Re: [PATCH v17 12/15] media/v4l2-core, arm64: untag user pointers in
 videobuf_dma_contig_user_get
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <7fbcdbe16a2bd99e92eb4541248469738d89a122.1560339705.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <5ea75db0-20e9-7423-8670-967eedd56440@oracle.com>
Date: Wed, 19 Jun 2019 14:05:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7fbcdbe16a2bd99e92eb4541248469738d89a122.1560339705.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190165
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190165
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=T5/3kAdAeR6zFBROUWJvfOGR6wpTe6uJBD03+FJjR7Q=;
 b=JfZGTb/9vsPuTMYS8TLwO4D8maqLtaN37PWBviJWNWHwVHs6MQchbjnbIgEyT7QH5fPr
 RQaEqPDd4BLrljBr3UdRftu3+JLtrIljjKd9fnV8AG4CN4o7VCmxFBu3Cl8nvesNwCWz
 WIX9fL7RM27yvN1yXBV2ffc84cSXssCtprnFBx9JT9Dxvzwcw9BbBpKWzQE6w959cX3m
 0wLk2hF0v2PhKsE/QLpTHqn5AFlUdUziXjHErCwZzqKM7mXOXE9LWChgFdAX1ktGhG2H
 kWc5j8nTubxy0mEzTZ/LFPGY/UPGDf6lLKUj2qzGz2XAU0UI7iXrVbiRGgfjIjj0yqPG dg== 
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMi8xOSA1OjQzIEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
aXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFs
bG93IHRvCj4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0
IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50
cy4KPiAKPiB2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KCkgdXNlcyBwcm92aWRlZCB1c2Vy
IHBvaW50ZXJzIGZvciB2bWEKPiBsb29rdXBzLCB3aGljaCBjYW4gb25seSBieSBkb25lIHdpdGgg
dW50YWdnZWQgcG9pbnRlcnMuCj4gCj4gVW50YWcgdGhlIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rp
b24uCj4gCj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+
IEFja2VkLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwu
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xl
LmNvbT4KPiAtLS0KClBhdGNoIGxvb2tzIGdvb2QsIGJ1dCBjb21taXQgbG9nIHNob3VsZCBiZSB1
cGRhdGVkIHRvIG5vdCBiZSBzcGVjaWZpYyB0bwphcm02NC4KClJldmlld2VkLWJ5OiBLaGFsaWQg
QXppeiA8a2hhbGlkLmF6aXpAb3JhY2xlLmNvbT4KCgoKPiAgZHJpdmVycy9tZWRpYS92NGwyLWNv
cmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwgOSArKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiBleGFjdF9jb3B5X2Zyb21fdXNlcgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGln
LmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKPiBpbmRl
eCBlMWJmNTBkZjRjNzAuLjhhMWRkZDE0NmIxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3Y0
bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKPiBAQCAtMTYwLDYgKzE2MCw3IEBAIHN0YXRp
YyB2b2lkIHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9wdXQoc3RydWN0IHZpZGVvYnVmX2RtYV9j
b250aWdfbWVtb3J5ICptZW0pCj4gIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1hX2NvbnRpZ191c2Vy
X2dldChzdHJ1Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwKPiAgCQkJCQlzdHJ1
Y3QgdmlkZW9idWZfYnVmZmVyICp2YikKPiAgewo+ICsJdW5zaWduZWQgbG9uZyB1bnRhZ2dlZF9i
YWRkciA9IHVudGFnZ2VkX2FkZHIodmItPmJhZGRyKTsKPiAgCXN0cnVjdCBtbV9zdHJ1Y3QgKm1t
ID0gY3VycmVudC0+bW07Cj4gIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKPiAgCXVuc2ln
bmVkIGxvbmcgcHJldl9wZm4sIHRoaXNfcGZuOwo+IEBAIC0xNjcsMjIgKzE2OCwyMiBAQCBzdGF0
aWMgaW50IHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQoc3RydWN0IHZpZGVvYnVmX2RtYV9j
b250aWdfbWVtb3J5ICptZW0sCj4gIAl1bnNpZ25lZCBpbnQgb2Zmc2V0Owo+ICAJaW50IHJldDsK
PiAgCj4gLQlvZmZzZXQgPSB2Yi0+YmFkZHIgJiB+UEFHRV9NQVNLOwo+ICsJb2Zmc2V0ID0gdW50
YWdnZWRfYmFkZHIgJiB+UEFHRV9NQVNLOwo+ICAJbWVtLT5zaXplID0gUEFHRV9BTElHTih2Yi0+
c2l6ZSArIG9mZnNldCk7Cj4gIAlyZXQgPSAtRUlOVkFMOwo+ICAKPiAgCWRvd25fcmVhZCgmbW0t
Pm1tYXBfc2VtKTsKPiAgCj4gLQl2bWEgPSBmaW5kX3ZtYShtbSwgdmItPmJhZGRyKTsKPiArCXZt
YSA9IGZpbmRfdm1hKG1tLCB1bnRhZ2dlZF9iYWRkcik7Cj4gIAlpZiAoIXZtYSkKPiAgCQlnb3Rv
IG91dF91cDsKPiAgCj4gLQlpZiAoKHZiLT5iYWRkciArIG1lbS0+c2l6ZSkgPiB2bWEtPnZtX2Vu
ZCkKPiArCWlmICgodW50YWdnZWRfYmFkZHIgKyBtZW0tPnNpemUpID4gdm1hLT52bV9lbmQpCj4g
IAkJZ290byBvdXRfdXA7Cj4gIAo+ICAJcGFnZXNfZG9uZSA9IDA7Cj4gIAlwcmV2X3BmbiA9IDA7
IC8qIGtpbGwgd2FybmluZyAqLwo+IC0JdXNlcl9hZGRyZXNzID0gdmItPmJhZGRyOwo+ICsJdXNl
cl9hZGRyZXNzID0gdW50YWdnZWRfYmFkZHI7Cj4gIAo+ICAJd2hpbGUgKHBhZ2VzX2RvbmUgPCAo
bWVtLT5zaXplID4+IFBBR0VfU0hJRlQpKSB7Cj4gIAkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHVz
ZXJfYWRkcmVzcywgJnRoaXNfcGZuKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
