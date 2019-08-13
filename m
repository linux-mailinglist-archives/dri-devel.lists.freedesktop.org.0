Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C408E702
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5865F6E921;
	Thu, 15 Aug 2019 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8124289CA0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:44:47 +0000 (UTC)
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531]
 ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
 by smtp-cloud8.xs4all.net with ESMTPA
 id xVE4hL1bvqTdhxVE7h9SYk; Tue, 13 Aug 2019 13:44:46 +0200
Subject: Re: [PATCH v6 3/8] tda9950: use cec_notifier_cec_adap_(un)register
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Dariusz Marcinkiewicz <darekm@google.com>
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-4-darekm@google.com>
 <20190813113209.GF13294@shell.armlinux.org.uk>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <49f41f61-2094-f372-5ae8-c923e03d055f@xs4all.nl>
Date: Tue, 13 Aug 2019 13:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190813113209.GF13294@shell.armlinux.org.uk>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPgxnnsf4H4jmOgOUipcBW3rPmtlY2lHvQZ7sJK+FTC5QUHRPe7Z4toqC9rDKmV+UtbETpTrgTRAzdX+EfgcUcc59f+i9XLi+uyGhspj8SpzmcN+JFQI
 ByrJlAEefHMYdx9LLPklpP95A7D9q0hpWmgFccn7lFxXTu0mEsRqaA7vQCugRSz3DT9OuG8wxzDFGW/cSpzO6IbgZFKBQsVVHLvPL1w+OrE+0hzJ9Ns66ydw
 Et71agSIpUWaSMr+/cq+DKASLQPufmxgGvpKmYeKCLcS5Q7rhDL6qVAOT+h6DgSvz8xN+2qsQuHa+fF66u5PpvzwjWwoW/8JkAivwfn1rlZ9m50uUTlaJc/1
 Yv9AGi6D0HatL2sXyb7Iml8kdzKI4YcR6t5A1WQGIf4+MFppfxATZOVZ0RYRDwcBySFu/GnNhQ8nsUZL6CMCDX+4hA3EQO9lAyb+uM0qPKk4KIkauA6NvYUn
 wv7NhVbltiN4RRg5cG1n2q8f9LdOgAwGMACeBbfgnmKRf43lo/ctZWdGyoI0N/X8BkJjZQTTJb+y6xsJFNmNoVYjrm+DmzRGt8CaoOlBPQLsDfaUAmiRVAUM
 xazaMOLmFnuHJBgL8HZH+XRrc9td9fTY0dnzfBKK7xq5FaAgyY8EM5sIZCLy+WG8nBvNQZLDl6eAe+g0BRE/NlcAUqAMCI+00V3U6C6cOGe5lg==
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:56 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xMy8xOSAxOjMyIFBNLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6
Cj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDE6MDI6MzVQTSArMDIwMCwgRGFyaXVzeiBNYXJj
aW5raWV3aWN6IHdyb3RlOgo+PiBVc2UgdGhlIG5ldyBjZWNfbm90aWZpZXJfY2VjX2FkYXBfKHVu
KXJlZ2lzdGVyKCkgZnVuY3Rpb25zIHRvCj4+ICh1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9y
IHRoZSBDRUMgYWRhcHRlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFyaXVzeiBNYXJjaW5raWV3
aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxo
dmVya3VpbC1jaXNjb0B4czRhbGwubmw+Cj4+IFRlc3RlZC1ieTogSGFucyBWZXJrdWlsIDxodmVy
a3VpbC1jaXNjb0B4czRhbGwubmw+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5
OTUwLmMgfCAxMiArKysrKystLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTJj
L3RkYTk5NTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jCj4+IGluZGV4IDgwMzlm
YzBkODNkYjQuLmE1YTc1YmRlYjdhNWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
MmMvdGRhOTk1MC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jCj4+IEBA
IC00MjAsNyArNDIwLDggQEAgc3RhdGljIGludCB0ZGE5OTUwX3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQsCj4+ICAJCXByaXYtPmhkbWkgPSBnbHVlLT5wYXJlbnQ7Cj4+ICAKPj4gIAlw
cml2LT5hZGFwID0gY2VjX2FsbG9jYXRlX2FkYXB0ZXIoJnRkYTk5NTBfY2VjX29wcywgcHJpdiwg
InRkYTk5NTAiLAo+PiAtCQkJCQkgIENFQ19DQVBfREVGQVVMVFMsCj4+ICsJCQkJCSAgQ0VDX0NB
UF9ERUZBVUxUUyB8Cj4+ICsJCQkJCSAgQ0VDX0NBUF9DT05ORUNUT1JfSU5GTywKPj4gIAkJCQkJ
ICBDRUNfTUFYX0xPR19BRERSUyk7Cj4+ICAJaWYgKElTX0VSUihwcml2LT5hZGFwKSkKPj4gIAkJ
cmV0dXJuIFBUUl9FUlIocHJpdi0+YWRhcCk7Cj4+IEBAIC00NTcsMTMgKzQ1OCwxNCBAQCBzdGF0
aWMgaW50IHRkYTk5NTBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPj4gIAlpZiAo
cmV0IDwgMCkKPj4gIAkJcmV0dXJuIHJldDsKPj4gIAo+PiAtCXByaXYtPm5vdGlmeSA9IGNlY19u
b3RpZmllcl9nZXQocHJpdi0+aGRtaSk7Cj4+ICsJcHJpdi0+bm90aWZ5ID0gY2VjX25vdGlmaWVy
X2NlY19hZGFwX3JlZ2lzdGVyKHByaXYtPmhkbWksIE5VTEwsCj4+ICsJCQkJCQkgICAgICBwcml2
LT5hZGFwKTsKPj4gIAlpZiAoIXByaXYtPm5vdGlmeSkKPj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4+
ICAKPj4gIAlyZXQgPSBjZWNfcmVnaXN0ZXJfYWRhcHRlcihwcml2LT5hZGFwLCBwcml2LT5oZG1p
KTsKPj4gIAlpZiAocmV0IDwgMCkgewo+PiAtCQljZWNfbm90aWZpZXJfcHV0KHByaXYtPm5vdGlm
eSk7Cj4+ICsJCWNlY19ub3RpZmllcl9jZWNfYWRhcF91bnJlZ2lzdGVyKHByaXYtPm5vdGlmeSk7
Cj4+ICAJCXJldHVybiByZXQ7Cj4+ICAJfQo+PiAgCj4+IEBAIC00NzMsOCArNDc1LDYgQEAgc3Rh
dGljIGludCB0ZGE5OTUwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4+ICAJICov
Cj4+ICAJZGV2bV9yZW1vdmVfYWN0aW9uKGRldiwgdGRhOTk1MF9jZWNfZGVsLCBwcml2KTsKPj4g
IAo+PiAtCWNlY19yZWdpc3Rlcl9jZWNfbm90aWZpZXIocHJpdi0+YWRhcCwgcHJpdi0+bm90aWZ5
KTsKPj4gLQo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+IEBAIC00ODIsOCArNDgyLDggQEAg
c3RhdGljIGludCB0ZGE5OTUwX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+PiAg
ewo+PiAgCXN0cnVjdCB0ZGE5OTUwX3ByaXYgKnByaXYgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xp
ZW50KTsKPj4gIAo+PiArCWNlY19ub3RpZmllcl9jZWNfYWRhcF91bnJlZ2lzdGVyKHByaXYtPm5v
dGlmeSk7Cj4+ICAJY2VjX3VucmVnaXN0ZXJfYWRhcHRlcihwcml2LT5hZGFwKTsKPj4gLQljZWNf
bm90aWZpZXJfcHV0KHByaXYtPm5vdGlmeSk7Cj4gCj4gSXQgbG9va3Mgd2VpcmQgdG8gaGF2ZSBh
biB1bmV4cGVjdGVkbHkgZGlmZmVyZW50IG9yZGVyaW5nIG9mCj4gdW5yZWdpc3RyYXRpb24gZnJv
bSB0aGUgcmVnaXN0cmF0aW9uIHBhdGggLSBub3JtYWxseSwgdW5yZWdpc3RyYXRpb24KPiBpcyB0
aGUgcmV2ZXJzZSBvcmRlciBvZiBpbml0aWFsaXNhdGlvbi4KPiAKPiBJbiB0aGUgaW5pdGlhbGlz
YXRpb24gcGF0aCwgaXQgc2VlbXMgdGhhdCB3ZSByZWdpc3RlciB0aGUgbm90aWZpZXIKPiBhbmQg
X3RoZW5fIHRoZSBhZGFwdGVyLiAgSGVyZSwgd2UgdW5yZWdpc3RlciB0aGUgbm90aWZpZXIgYW5k
IHRoZW4KPiB0aGUgYWRhcHRlciByYXRoZXIgdGhhbiB3aGF0IHdvdWxkIG5vcm1hbGx5IGJlIGV4
cGVjdGVkLiAgV2h5IGlzCj4gdGhpcz8gIEkgc3VzcGVjdCB0aGVyZSB3aWxsIGJlIGRyaXZlcnMg
Y3JlYXRlZCB0aGF0IGRvIHRoaXMgdGhlCj4gIm5vcm1hbCIgd2F5IHJvdW5kLCBzbyBpZiB0aGlz
IGlzIGEgcmVxdWlyZW1lbnQsIGl0IG5lZWRzIHRvIGJlIG1hZGUKPiBwbGFpbmx5IG9idmlvdXMu
CgpJdCdzIG5vdCBhIHJlcXVpcmVtZW50LCBpdCBqdXN0IGZlZWxzIGJldHRlciB0byBkbyBpdCBp
biB0aGlzIG9yZGVyCnNpbmNlIGNlY191bnJlZ2lzdGVyX2FkYXB0ZXIgd2lsbCBpbiBnZW5lcmFs
IGFsc28gZGVsZXRlIHRoZSBhZGFwdGVyCih1bmxlc3MgYW4gYXBwbGljYXRpb24ga2VlcHMgdGhl
IGNlYyBkZXZpY2Ugb3BlbikuCgpTbyB0aGUgb3JkZXIgaXMgYWN0dWFsbHk6IGFsbG9jYXRlX2Fk
YXB0ZXIsIHRoZW4gcmVnaXN0ZXIgbm90aWZpZXIKYW5kOiB1bnJlZ2lzdGVyIG5vdGlmaWVyLCB0
aGVuIHVucmVnaXN0ZXIgKGFuZCB0eXBpY2FsbHkgZGVsZXRlKSBhZGFwdGVyCgpSZWdhcmRzLAoK
CUhhbnMKCj4gCj4+ICAKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gLS0gCj4+IDIuMjMuMC5yYzEu
MTUzLmdkZWVkODAzMzBmLWdvb2cKPj4KPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
