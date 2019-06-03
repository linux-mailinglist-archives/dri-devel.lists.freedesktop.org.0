Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA033FAE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD83F8967B;
	Tue,  4 Jun 2019 07:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB2C8930B;
 Mon,  3 Jun 2019 18:18:14 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x53I8gIs153035;
 Mon, 3 Jun 2019 18:17:43 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2suj0q8ka1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jun 2019 18:17:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x53IGZGQ023818;
 Mon, 3 Jun 2019 18:17:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2sv36sc445-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jun 2019 18:17:42 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x53IHbbL010166;
 Mon, 3 Jun 2019 18:17:37 GMT
Received: from [192.168.1.16] (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 03 Jun 2019 11:17:36 -0700
Subject: Re: [PATCH v16 01/16] uaccess: add untagged_addr definition for other
 arches
To: Andrey Konovalov <andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
 <8ff5b0ff-849a-1e0b-18da-ccb5be85dd2b@oracle.com>
 <CAAeHK+xX2538e674Pz25unkdFPCO_SH0pFwFu=8+DS7RzfYnLQ@mail.gmail.com>
 <f6711d31-e52c-473a-d7ad-b2d63131d7a5@oracle.com>
 <20190603172916.GA5390@infradead.org>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <7a687a26-fc3e-2caa-1d6a-464f1f7e684c@oracle.com>
Date: Mon, 3 Jun 2019 12:17:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603172916.GA5390@infradead.org>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9277
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=970
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906030124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9277
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=988 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906030124
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=GlaYcvRbXVbYyKKXSyNwJ8tBGJAG2pfqt1R7amaBqEw=;
 b=05U6KHBi25HCGJeXlllc8lO/7iSw1O36+nkjRk4VyMlhqURaxhzyWEAG56qBArt4ZIXH
 Rs6H67bbFeXkJ8dNAj/863iIftETrMYapMu/08uwIeo59ZY37LjyfUDhTwYxIuq0apcm
 mxgbgRIkv1jIFr3D9wbmIYjjONDeqSnJ2Q6OpAFTFQJnXlxeGQP3CRq4pVItc3hsAHhY
 eyf+kruVixj7mGRtSpX0nUteC3Br6Cqgqf9GkrLjvi8wjVLQ+WKBafILZOHfOiiQNyNp
 J0U+PSjroYIWCro+VOsKn1DLmMtnqiEQYZkolve4C6NI/cUHUIedA0+lH2Bzv9u6n/N0 Yw== 
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gNi8zLzE5IDExOjI5IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBNb24sIEp1
biAwMywgMjAxOSBhdCAxMToyNDozNUFNIC0wNjAwLCBLaGFsaWQgQXppeiB3cm90ZToKPj4gT24g
Ni8zLzE5IDExOjA2IEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+Pj4gT24gTW9uLCBKdW4g
MywgMjAxOSBhdCA3OjA0IFBNIEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBvcmFjbGUuY29tPiB3
cm90ZToKPj4+PiBBbmRyZXksCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGhhcyBub3cgYmVjb21lIHBh
cnQgb2YgdGhlIG90aGVyIHBhdGNoIHNlcmllcyBDaHJpcyBIZWxsd2lnCj4+Pj4gaGFzIHNlbnQg
b3V0IC0KPj4+PiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDYwMTA3NDk1OS4x
NDAzNi0xLWhjaEBsc3QuZGUvPi4gQ2FuCj4+Pj4geW91IGNvb3JkaW5hdGUgd2l0aCB0aGF0IHBh
dGNoIHNlcmllcz8KPj4+Cj4+PiBIaSEKPj4+Cj4+PiBZZXMsIEkndmUgc2VlbiBpdC4gSG93IHNo
b3VsZCBJIGNvb3JkaW5hdGU/IFJlYmFzZSB0aGlzIHNlcmllcyBvbiB0b3AKPj4+IG9mIHRoYXQg
b25lPwo+Pgo+PiBUaGF0IHdvdWxkIGJlIG9uZSB3YXkgdG8gZG8gaXQuIEJldHRlciB5ZXQsIHNl
cGFyYXRlIHRoaXMgcGF0Y2ggZnJvbQo+PiBib3RoIHBhdGNoIHNlcmllcywgbWFrZSBpdCBzdGFu
ZGFsb25lIGFuZCB0aGVuIHJlYmFzZSB0aGUgdHdvIHBhdGNoCj4+IHNlcmllcyBvbiB0b3Agb2Yg
aXQuCj4gCj4gSSB0aGluayBlYXNpZXN0IHdvdWxkIGJlIHRvIGp1c3QgYXNrIExpbnVzIGlmIGhl
IGNvdWxkIG1ha2UgYW4gZXhjZXB0aW9uCj4gYW5kIGluY2x1ZGUgdGhpcyB0cml2aWFsIHByZXAg
cGF0Y2ggaW4gNS4yLXJjLgo+IAoKQW5kcmV5LAoKV291bGQgeW91IG1pbmQgdXBkYXRpbmcgdGhl
IGNvbW1pdCBsb2cgdG8gbWFrZSBpdCBub3QgYXJtNjQgc3BlY2lmaWMgYW5kCnNlbmRpbmcgdGhp
cyBwYXRjaCBvdXQgYnkgaXRzZWxmLiBXZSBjYW4gdGhlbiBhc2sgTGludXMgaWYgaGUgY2FuCmlu
Y2x1ZGUganVzdCB0aGlzIHBhdGNoIGluIHRoZSBuZXh0IHJjLgoKVGhhbmtzLApLaGFsaWQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
