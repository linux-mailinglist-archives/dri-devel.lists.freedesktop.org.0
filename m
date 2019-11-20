Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00435103D8E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 15:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898F6E604;
	Wed, 20 Nov 2019 14:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617CC6E604
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:43:54 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53371
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iXRCy-0001hm-3L; Wed, 20 Nov 2019 15:43:52 +0100
Subject: Re: [PATCH v1 3/5] fbtft: Drop useless #ifdef CONFIG_OF and dead code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Nishad Kamdar <nishadkamdar@gmail.com>, devel@driverdev.osuosl.org
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
 <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <37435de0-873d-d20c-ac66-420ba91356fd@tronnes.org>
Date: Wed, 20 Nov 2019 15:43:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RazfukX+mfulswAwCO+uVfKNQyeNJjTPuAJGNFDskdQ=; b=A/AgZIvtK1bk5djc/nM2d6Eh7+
 wvPBnxO8tvdtphrOstY3CIbL5vcFYACKDAUb9+g25vZ/FDJhoB2wlGdBj4cSBOc68u6folDOF9VC7
 6vF95DSpDywRuO2BNtYIpfY2dYkksAdl3LawCj9qPsxv9Siz9MYpwKdKSQrCWqyYfyD9CXUHHGHy5
 ocKeOIcWuxYxrQCak79ze7JsE2JWL3m4jogjc+Y7XwVTHtLCrv/3suw++ELwsH6BVrPR00rdPk2vm
 J+5NijQ5ibthMOc6XHAnugqnHzUcbANpZE7vZPahkBpNKKD73Bb6tVsEYBp/T+C3+gKVh+36LeNDx
 bFJT9MCw==;
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

CgpEZW4gMjAuMTEuMjAxOSAxMC41Nywgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+IEZpcnN0IG9m
IGFsbCB0aGVyZSBpcyBubyBuZWVkIHRvIGd1YXJkIEdQSU8gcmVxdWVzdCBieSBDT05GSUdfT0Yu
Cj4gSXQgd29ya3MgZm9yIGV2ZXJ5Ym9keSBpbmRlcGVuZGVudGx5IG9uIHJlc291cmNlIHByb3Zp
ZGVyLiBXaGlsZSBoZXJlLAo+IHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gcmVmbGVjdCB0aGUgYWJv
dmUuCj4gCj4gTW9yZW92ZXIsIHNpbmNlIHdlIGhhdmUgYSBnbG9iYWwgZGVwZW5kZW5jeSB0byBP
RiwgdGhlIHJlc3Qgb2YKPiBjb25kaXRpb25hbCBjb21waWxhdGlvbiBpcyBuby1vcCwgaS5lLiBp
dCdzIGFsd2F5cyBiZSB0cnVlLgo+IAo+IER1ZSB0byBhYm92ZSBkcm9wIHVzZWxlc3MgI2lmZGVm
IENPTkZJR19PRiBhbmQgdGhlcmVmb3JlIGRlYWQgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyB8IDE5ICsrLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMgYi9k
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jCgo8c25pcD4KCj4gQEAgLTExODQsMTcg
KzExNzYsMTAgQEAgc3RhdGljIHN0cnVjdCBmYnRmdF9wbGF0Zm9ybV9kYXRhICpmYnRmdF9wcm9i
ZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAkJcGRhdGEtPmRpc3BsYXkuYmFja2xpZ2h0ID0g
MTsKPiAgCWlmIChvZl9maW5kX3Byb3BlcnR5KG5vZGUsICJpbml0IiwgTlVMTCkpCj4gIAkJcGRh
dGEtPmRpc3BsYXkuZmJ0ZnRvcHMuaW5pdF9kaXNwbGF5ID0gZmJ0ZnRfaW5pdF9kaXNwbGF5X2R0
Owo+IC0JcGRhdGEtPmRpc3BsYXkuZmJ0ZnRvcHMucmVxdWVzdF9ncGlvcyA9IGZidGZ0X3JlcXVl
c3RfZ3Bpb3NfZHQ7Cj4gKwlwZGF0YS0+ZGlzcGxheS5mYnRmdG9wcy5yZXF1ZXN0X2dwaW9zID0g
ZmJ0ZnRfcmVxdWVzdF9ncGlvczsKCllvdSBjYW4gZGl0Y2ggdGhlIC5yZXF1ZXN0X2dwaW9zIGNh
bGxiYWNrIGFuZCBjYWxsIGZidGZ0X3JlcXVlc3RfZ3Bpb3MoKQpkaXJlY3RseSBpbiBmYnRmdF9y
ZWdpc3Rlcl9mcmFtZWJ1ZmZlcigpLiBUaGF0IHdpbGwgbWFrZSBpdCBzYWZlIHRvIGRyb3AKdGhl
IE9GIGRlcGVuZGVuY3ksIG90aGVyd2lzZSAucmVxdWVzdF9ncGlvcyB3aWxsIGJlIE5VTEwgaW4g
dGhlIG5vbi1EVApjYXNlLiBUaGlzIGlzIG9uZSBvZiB0aGUgYnVncyB0aGF0IGZvbGx3ZWQgdGhl
IGdwaW8gcmVmYWN0b3JpbmcuCgpZb3UgY2FuIGFsc28gZGl0Y2ggdGhlIC5yZXF1ZXN0X2dwaW9z
X21hdGNoIGNhbGxiYWNrIGlmIHlvdSB3YW50LCBpdAppc24ndCBjYWxsZWQgYW55bW9yZSAoaXQg
aXMgc2V0IGluIGZiX2FnbTEyNjRrLWZsKS4KCk5vcmFsZi4KCj4gIAo+ICAJcmV0dXJuIHBkYXRh
Owo+ICB9Cj4gLSNlbHNlCj4gLXN0YXRpYyBzdHJ1Y3QgZmJ0ZnRfcGxhdGZvcm1fZGF0YSAqZmJ0
ZnRfcHJvYmVfZHQoc3RydWN0IGRldmljZSAqZGV2KQo+IC17Cj4gLQlkZXZfZXJyKGRldiwgIk1p
c3NpbmcgcGxhdGZvcm0gZGF0YVxuIik7Cj4gLQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiAt
fQo+IC0jZW5kaWYKPiAgCj4gIC8qKgo+ICAgKiBmYnRmdF9wcm9iZV9jb21tb24oKSAtIEdlbmVy
aWMgZGV2aWNlIHByb2JlKCkgaGVscGVyIGZ1bmN0aW9uCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
