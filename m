Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8933FC5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F71896E7;
	Tue,  4 Jun 2019 07:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18FB892CD;
 Mon,  3 Jun 2019 17:05:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x53H3xSn100496;
 Mon, 3 Jun 2019 17:04:43 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2suj0q87ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jun 2019 17:04:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x53H25KX001162;
 Mon, 3 Jun 2019 17:02:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2supp77nea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jun 2019 17:02:42 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x53H2beP015785;
 Mon, 3 Jun 2019 17:02:37 GMT
Received: from [192.168.1.16] (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 03 Jun 2019 10:02:37 -0700
Subject: Re: [PATCH v16 01/16] uaccess: add untagged_addr definition for other
 arches
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1559580831.git.andreyknvl@google.com>
 <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
Date: Mon, 3 Jun 2019 11:02:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9277
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906030117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9277
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906030118
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=OfBlugxBOMTUJDS5Fta0E067EXIuFHrIc+KiOftycQo=;
 b=jX8igtAtwdGWEcSQ15NbliZz+NGIxv22eo7wYyRnuuYQ7I4J/bIEqkjIMzg4nRkoaTHN
 Izj1eZ3FVe1MPbsF1dYsa+JsLP+4qEQVawH6/fkC1cv94PTeQa/skgeNAkL7L8E1wd20
 4RGoi2Jt3aFi4/U0wmvd4vrnsadD0wKIeZChrG/bw4MRrCFb484s4PEYw6yASdqlW7XP
 gY1T8XQl48DrdBh2Zl0WHDVvzFQRmVP7va2HFIKL3rd5QdAY2VUdmHvX1AdMNXXvrYIN
 hq/n16LS6BO3VJFXQsI955s6dUO0v4GGeGgILk3iJmQi8y78QUC3NMgSdO1Vb3Lpd7Pa rg== 
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
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
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

T24gNi8zLzE5IDEwOjU1IEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+IFRvIGFsbG93IGFy
bTY0IHN5c2NhbGxzIHRvIGFjY2VwdCB0YWdnZWQgcG9pbnRlcnMgZnJvbSB1c2Vyc3BhY2UsIHdl
IG11c3QKPiB1bnRhZyB0aGVtIHdoZW4gdGhleSBhcmUgcGFzc2VkIHRvIHRoZSBrZXJuZWwuIFNp
bmNlIHVudGFnZ2luZyBpcyBkb25lIGluCj4gZ2VuZXJpYyBwYXJ0cyBvZiB0aGUga2VybmVsLCB0
aGUgdW50YWdnZWRfYWRkciBtYWNybyBuZWVkcyB0byBiZSBkZWZpbmVkCj4gZm9yIGFsbCBhcmNo
aXRlY3R1cmVzLgo+IAo+IERlZmluZSBpdCBhcyBhIG5vb3AgZm9yIGFyY2hpdGVjdHVyZXMgb3Ro
ZXIgdGhhbiBhcm02NC4KPiAKPiBBY2tlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogS2hhbGlkIEF6aXogPGtoYWxpZC5heml6QG9y
YWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBn
b29nbGUuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggfCA0ICsrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCAwZTg4MzRhYzMyYjcuLjk0OWQ0M2U5
YzBiNiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L21tLmgKPiBAQCAtOTksNiArOTksMTAgQEAgZXh0ZXJuIGludCBtbWFwX3JuZF9jb21wYXRf
Yml0cyBfX3JlYWRfbW9zdGx5Owo+ICAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KPiAgI2luY2x1
ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiAgCj4gKyNpZm5kZWYgdW50YWdnZWRfYWRkcgo+ICsjZGVm
aW5lIHVudGFnZ2VkX2FkZHIoYWRkcikgKGFkZHIpCj4gKyNlbmRpZgo+ICsKPiAgI2lmbmRlZiBf
X3BhX3N5bWJvbAo+ICAjZGVmaW5lIF9fcGFfc3ltYm9sKHgpICBfX3BhKFJFTE9DX0hJREUoKHVu
c2lnbmVkIGxvbmcpKHgpLCAwKSkKPiAgI2VuZGlmCj4gCgpBbmRyZXksCgpUaGlzIHBhdGNoIGhh
cyBub3cgYmVjb21lIHBhcnQgb2YgdGhlIG90aGVyIHBhdGNoIHNlcmllcyBDaHJpcyBIZWxsd2ln
CmhhcyBzZW50IG91dCAtCjxodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNjAxMDc0
OTU5LjE0MDM2LTEtaGNoQGxzdC5kZS8+LiBDYW4KeW91IGNvb3JkaW5hdGUgd2l0aCB0aGF0IHBh
dGNoIHNlcmllcz8KCi0tCktoYWxpZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
