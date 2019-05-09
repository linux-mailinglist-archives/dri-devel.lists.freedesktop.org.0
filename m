Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295518CF0
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 17:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36D989D8A;
	Thu,  9 May 2019 15:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CF3C89D8A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 15:27:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3E09374;
 Thu,  9 May 2019 08:27:32 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30093F6C4;
 Thu,  9 May 2019 08:27:32 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 16712682412; Thu,  9 May 2019 16:27:31 +0100 (BST)
Date: Thu, 9 May 2019 16:27:31 +0100
From: "liviu.dudau@arm.com" <liviu.dudau@arm.com>
To: Wen He <wen.he_1@nxp.com>
Subject: Re: [v1] drm/arm/mali-dp: Add a loop around the second set CVAL and
 try 5 times
Message-ID: <20190509152730.GP15144@e110455-lin.cambridge.arm.com>
References: <20190508105956.6107-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508105956.6107-1-wen.he_1@nxp.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMTA6NTg6MThBTSArMDAwMCwgV2VuIEhlIHdyb3RlOgo+
IFRoaXMgcGF0Y2ggdHJ5aW5nIHRvIGZpeCBtb25pdG9yIGZyZWV6ZSBpc3N1ZSBjYXVzZWQgYnkg
ZHJtIGVycm9yCj4gJ2ZsaXBfZG9uZSB0aW1lZCBvdXQnIG9uIExTMTAyOEEgcGxhdGZvcm0uIHRo
aXMgc2V0IHRyeSBpcyBtYWtlIGEgbG9vcAo+IGFyb3VuZCB0aGUgc2Vjb25kIHNldHRpbmcgQ1ZB
TCBhbmQgdHJ5IGxpa2UgNSB0aW1lcyBiZWZvcmUgZ2l2ZWluZyB1cC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBMaXZpdSA8bGl2aXUuRHVkYXVAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZW4gSGUg
PHdlbi5oZV8xQG54cC5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpJIHdpbGwgcHVsbCB0aGlzIGludG8gbXkgbWFsaS1kcCB0cmVlIGFuZCBzZW5kIGl0
IGFzIGZpeGVzIGFmdGVyIHY1LjItcmMxLgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgfCAxMyArKysrKysrKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9tYWxpZHBfZHJ2LmMKPiBpbmRleCAyMTcyNWM5YjlmNWUuLjE4Y2I3ZjEzNGY0ZSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4gQEAgLTE5Miw2ICsxOTIsNyBAQCBzdGF0aWMg
dm9pZCBtYWxpZHBfYXRvbWljX2NvbW1pdF9od19kb25lKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSkKPiAgewo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IHN0YXRlLT5kZXY7Cj4g
IAlzdHJ1Y3QgbWFsaWRwX2RybSAqbWFsaWRwID0gZHJtLT5kZXZfcHJpdmF0ZTsKPiArCWludCBs
b29wID0gNTsKPiAgCj4gIAltYWxpZHAtPmV2ZW50ID0gbWFsaWRwLT5jcnRjLnN0YXRlLT5ldmVu
dDsKPiAgCW1hbGlkcC0+Y3J0Yy5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwo+IEBAIC0yMDYsOCArMjA3
LDE4IEBAIHN0YXRpYyB2b2lkIG1hbGlkcF9hdG9taWNfY29tbWl0X2h3X2RvbmUoc3RydWN0IGRy
bV9hdG9taWNfc3RhdGUgKnN0YXRlKQo+ICAJCQlkcm1fY3J0Y192YmxhbmtfZ2V0KCZtYWxpZHAt
PmNydGMpOwo+ICAKPiAgCQkvKiBvbmx5IHNldCBjb25maWdfdmFsaWQgaWYgdGhlIENSVEMgaXMg
ZW5hYmxlZCAqLwo+IC0JCWlmIChtYWxpZHBfc2V0X2FuZF93YWl0X2NvbmZpZ192YWxpZChkcm0p
IDwgMCkKPiArCQlpZiAobWFsaWRwX3NldF9hbmRfd2FpdF9jb25maWdfdmFsaWQoZHJtKSA8IDAp
IHsKPiArCQkJLyoKPiArCQkJICogbWFrZSBhIGxvb3AgYXJvdW5kIHRoZSBzZWNvbmQgQ1ZBTCBz
ZXR0aW5nIGFuZAo+ICsJCQkgKiB0cnkgNSB0aW1lcyBiZWZvcmUgZ2l2aW5nIHVwLgo+ICsJCQkg
Ki8KPiArCQkJd2hpbGUgKGxvb3AtLSkgewo+ICsJCQkJaWYgKCFtYWxpZHBfc2V0X2FuZF93YWl0
X2NvbmZpZ192YWxpZChkcm0pKQo+ICsJCQkJCWJyZWFrOwo+ICsJCQl9Cj4gIAkJCURSTV9ERUJV
R19EUklWRVIoInRpbWVkIG91dCB3YWl0aW5nIGZvciB1cGRhdGVkIGNvbmZpZ3VyYXRpb25cbiIp
Owo+ICsJCX0KPiArCj4gIAl9IGVsc2UgaWYgKG1hbGlkcC0+ZXZlbnQpIHsKPiAgCQkvKiBDUlRD
IGluYWN0aXZlIG1lYW5zIHZibGFuayBJUlEgaXMgZGlzYWJsZWQsIHNlbmQgZXZlbnQgZGlyZWN0
bHkgKi8KPiAgCQlzcGluX2xvY2tfaXJxKCZkcm0tPmV2ZW50X2xvY2spOwo+IC0tIAo+IDIuMTcu
MQo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXgg
dGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwg
c291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
