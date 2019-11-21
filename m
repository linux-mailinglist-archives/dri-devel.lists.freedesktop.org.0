Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE9105058
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 11:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF686ECB6;
	Thu, 21 Nov 2019 10:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 587A36ECB6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:19:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A89F6DA7;
 Thu, 21 Nov 2019 02:19:00 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF6833F52E;
 Thu, 21 Nov 2019 02:18:59 -0800 (PST)
Subject: Re: [PATCH v1 1/5] fbtft: Make sure string is NULL terminated
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, linux-fbdev@vger.kernel.org,
 Nishad Kamdar <nishadkamdar@gmail.com>, devel@driverdev.osuosl.org
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <da3a18a1-a5a1-52b5-20d6-c4ef2bf6a5fe@arm.com>
Date: Thu, 21 Nov 2019 10:18:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMTEvMjAxOSAwOTo1NywgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE5ldyBHQ0Mgd2Fy
bnMgYWJvdXQgaW5hcHByb3ByaWF0ZSB1c2Ugb2Ygc3RybmNweSgpOgo+IAo+IGRyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYnRmdC1jb3JlLmM6IEluIGZ1bmN0aW9uIOKAmGZidGZ0X2ZyYW1lYnVmZmVy
X2FsbG9j4oCZOgo+IGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmM6NjY1OjI6IHdh
cm5pbmc6IOKAmHN0cm5jcHnigJkgc3BlY2lmaWVkIGJvdW5kIDE2IGVxdWFscyBkZXN0aW5hdGlv
biBzaXplIFstV3N0cmluZ29wLXRydW5jYXRpb25dCj4gICA2NjUgfCAgc3RybmNweShpbmZvLT5m
aXguaWQsIGRldi0+ZHJpdmVyLT5uYW1lLCAxNik7Cj4gICAgICAgfCAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBMYXRlciBvbiB0aGUgY29weSBpcyBi
ZWluZyB1c2VkIHdpdGggdGhlIGFzc3VtcHRpb24gdG8gYmUgTlVMTCB0ZXJtaW5hdGVkLgo+IE1h
a2Ugc3VyZSBzdHJpbmcgaXMgTlVMTCB0ZXJtaW5hdGVkIGJ5IHN3aXRjaGluZyB0byBzbnByaW50
ZigpLgoKRXZlbiBiZXR0ZXIgd291bGQgYmUgc3Ryc2NweSgpOgoKCXN0cnNjcHkoaW5mby0+Zml4
LmlkLCBkZXYtPmRyaXZlci0+bmFtZSwgc2l6ZW9mKGluZm8tPmZpeC5pZCkpOwoKU3RldmUKCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jIGIvZHJp
dmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYwo+IGluZGV4IGEwYTY3YWE1MTdmMC4uNjFm
MDI4NmZiMTU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3Jl
LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jCj4gQEAgLTY2Niw3
ICs2NjYsNyBAQCBzdHJ1Y3QgZmJfaW5mbyAqZmJ0ZnRfZnJhbWVidWZmZXJfYWxsb2Moc3RydWN0
IGZidGZ0X2Rpc3BsYXkgKmRpc3BsYXksCj4gIAlmYmRlZmlvLT5kZWZlcnJlZF9pbyA9ICAgICBm
YnRmdF9kZWZlcnJlZF9pbzsKPiAgCWZiX2RlZmVycmVkX2lvX2luaXQoaW5mbyk7Cj4gIAo+IC0J
c3RybmNweShpbmZvLT5maXguaWQsIGRldi0+ZHJpdmVyLT5uYW1lLCAxNik7Cj4gKwlzbnByaW50
ZihpbmZvLT5maXguaWQsIHNpemVvZihpbmZvLT5maXguaWQpLCAiJXMiLCBkZXYtPmRyaXZlci0+
bmFtZSk7Cj4gIAlpbmZvLT5maXgudHlwZSA9ICAgICAgICAgICBGQl9UWVBFX1BBQ0tFRF9QSVhF
TFM7Cj4gIAlpbmZvLT5maXgudmlzdWFsID0gICAgICAgICBGQl9WSVNVQUxfVFJVRUNPTE9SOwo+
ICAJaW5mby0+Zml4LnhwYW5zdGVwID0JICAgMDsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
