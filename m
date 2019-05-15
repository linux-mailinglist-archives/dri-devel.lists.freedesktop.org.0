Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875461F6E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4F9892E0;
	Wed, 15 May 2019 14:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E131E892DB;
 Wed, 15 May 2019 14:51:08 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60995
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hQvFL-00053T-1S; Wed, 15 May 2019 16:51:07 +0200
Subject: Re: [PATCH v5 05/11] drm/fb-helper: Remove drm_fb_helper_crtc
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <20190506180139.6913-6-noralf@tronnes.org>
 <20190515090432.GA31712@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <fd69d05d-0634-15cc-18e6-8c81c82aafef@tronnes.org>
Date: Wed, 15 May 2019 16:51:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515090432.GA31712@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=+1xCjbcg7AFuIavFyAssLpTAPRK9oOwk8CskZ5WZits=; 
 b=eECevS+e75DiIy65Hpdi++36fkQs23+mSGVMXKa2ReEVuVGeZuEImtwHY1poq1QBMh5++is+7OWID1HD9+nPedBdk1TyKMUwCQFh8CEEWwP58Ty72ldiRytLsxoAGfPCPJ2yO+wKsgWQT3Tz4HCsdvj3TEJnUwB/67Rzs50Dj9aVsmMvRMwU7mFwyGyuKJe+HzYpq5SHHm/4bYgpFiaN7DuFbb+y/u6pHyTrxr4ean6KhluUewEz/5xZSeMiE9dw++Zhn330hq0UXn9JdBnwscXtXQgUI89tjVxbffLDEkaK09SKrYCUf3pAk71SArjDtEu9uAyqKCGzqunGDrimPQ==;
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKW2xvb2tzIGxpa2UgVGh1bmRlYmlyZCBkZWNpZGVkIHRvIHRocm93IGF3YXkgbXkg
cmVwbHksIHNvIEknbGwgdHJ5IGFnYWluXQoKRGVuIDE1LjA1LjIwMTkgMTEuMDQsIHNrcmV2IFNh
bSBSYXZuYm9yZzoKPiBIaSBOb3JhbGYuCj4gCj4gSSBoYXZlIHJlYWQgdGhyb3VnaCB0aGUgY2Fo
bmVzIGEgY29wdXBsZSBvZiB0aW1lcyBub3QgYW5kIGZlZWwgY29uZmlkZW50Cj4gdG8gYWRkIG15
IHItYiBpZiB0aGUgY29tbWVudHMgYXJlIGNvbnNpZGVyZWQuCj4gCj4gT24gTW9uLCBNYXkgMDYs
IDIwMTkgYXQgMDg6MDE6MzNQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+PiBJdCBu
b3cgb25seSBjb250YWlucyB0aGUgbW9kZXNldCBzbyB1c2UgdGhhdCBkaXJlY3RseSBpbnN0ZWFk
IGFuZCBhdHRhY2gKPj4gYSBtb2Rlc2V0IGFycmF5IHRvIGRybV9jbGllbnRfZGV2LiBkcm1fZmJf
aGVscGVyIHdpbGwgdXNlIHRoaXMgYXJyYXkuCj4+IENvZGUgd2lsbCBsYXRlciBiZSBtb3ZlZCB0
byBkcm1fY2xpZW50LCBzbyBhZGQgY29kZSB0aGVyZSBpbiBhIG5ldyBmaWxlCj4+IGRybV9jbGll
bnRfbW9kZXNldC5jIHdpdGggTUlUIGxpY2Vuc2UgdG8gbWF0Y2ggZHJtX2ZiX2hlbHBlci5jLgo+
IAo+IFRoZSBmaXJzdCBwYXJ0IG9mIHRoaXMgY29tbWl0IGxvZyBjb3VsZCB1c2Ugc29tZSByZS1w
aGFyc2luZy4KPiBXaGF0IGlzICJJdCIgZXRjLgo+IAoKSSBjb3VsZCBkbyB0aGlzOgoKc3RydWN0
IGRybV9mYl9oZWxwZXJfY3J0YyBpcyBub3cganVzdCBhIHdyYXBwZXIgYXJvdW5kIGRybV9tb2Rl
X3NldCBzbwp1c2UgdGhhdCBkaXJlY3RseSBpbnN0ZWFkIGFuZCBhdHRhY2ggaXQgYXMgYSBtb2Rl
c2V0IGFycmF5IG9udG8KZHJtX2NsaWVudF9kZXYuIGRybV9mYl9oZWxwZXIgd2lsbCB1c2UgdGhp
cyBhcnJheSB0byBzdG9yZSBpdHMgbW9kZXNldHMKd2hpY2ggbWVhbnMgaXQgd2lsbCBhbHdheXMg
aW5pdGlhbGl6ZSBhIGRybV9jbGllbnQsIGJ1dCBpdCB3aWxsIG5vdApyZWdpc3RlciB0aGUgY2xp
ZW50IChjYWxsYmFja3MpIHVubGVzcyBpdCdzIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4K
Cj4+IEBAIC01MzIsOCArNTM1LDcgQEAgc3RhdGljIGludCByZXN0b3JlX2ZiZGV2X21vZGVfbGVn
YWN5KHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCj4+ICAJCQkJCQkgICAgRFJNX01P
REVfUk9UQVRFXzApOwo+PiAgCX0KPj4gIAo+PiAtCWZvciAoaSA9IDA7IGkgPCBmYl9oZWxwZXIt
PmNydGNfY291bnQ7IGkrKykgewo+PiAtCQlzdHJ1Y3QgZHJtX21vZGVfc2V0ICptb2RlX3NldCA9
ICZmYl9oZWxwZXItPmNydGNfaW5mb1tpXS5tb2RlX3NldDsKPj4gKwlkcm1fY2xpZW50X2Zvcl9l
YWNoX21vZGVzZXQobW9kZV9zZXQsIGNsaWVudCkgewo+PiAgCQlzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMgPSBtb2RlX3NldC0+Y3J0YzsKPj4gIAo+PiAgCQlpZiAoY3J0Yy0+ZnVuY3MtPmN1cnNvcl9z
ZXQyKSB7Cj4gVGhpcyBmdW5jdGlvbiByZXF1aXJlcyBtb2Rlc2V0X211dGV4IHRvIGJlIGhlbGQu
IE1heWJlIGFkZCBjb21tZW50Pwo+IAoKZHJtX2NsaWVudF9mb3JfZWFjaF9tb2Rlc2V0KCkgaGFz
IGEgbG9ja2RlcCB3YXJuIChjb3VydGVzeSBvZiBEYW5pZWwKVmV0dGVyKToKCiNkZWZpbmUgZHJt
X2NsaWVudF9mb3JfZWFjaF9tb2Rlc2V0KG1vZGVzZXQsIGNsaWVudCkgXAoJZm9yICgoeyBsb2Nr
ZGVwX2Fzc2VydF9oZWxkKCYoY2xpZW50KS0+bW9kZXNldF9tdXRleCk7IH0pLCBcCgkgICAgIG1v
ZGVzZXQgPSAoY2xpZW50KS0+bW9kZXNldHM7IG1vZGVzZXQtPmNydGM7IG1vZGVzZXQrKykKCj4+
IEBAIC0xODQyLDcgKzE4MDUsNyBAQCBzdGF0aWMgaW50IHBhbl9kaXNwbGF5X2F0b21pYyhzdHJ1
Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwKPj4gIAo+PiAgCXBhbl9zZXQoZmJfaGVscGVyLCB2
YXItPnhvZmZzZXQsIHZhci0+eW9mZnNldCk7Cj4+ICAKPj4gLQlyZXQgPSByZXN0b3JlX2ZiZGV2
X21vZGVfYXRvbWljKGZiX2hlbHBlciwgdHJ1ZSk7Cj4+ICsJcmV0ID0gcmVzdG9yZV9mYmRldl9t
b2RlX2ZvcmNlKGZiX2hlbHBlcik7Cj4gVGhpcyBjaGFuZ2UgbG9va3MgYWxpZW4gY29tcGFyZWQg
dG8gb3RoZXIgY2hhbmdlcy4KPiBEb2VzIGl0IGJlbG9uZyB0byB0aGlzIHBhdGNoc2V0Pwo+IAoK
SXQncyBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlOgoKSW4gcGFuX2Rpc3BsYXlfYXRv
bWljKCkgcmVzdG9yZV9mYmRldl9tb2RlX2ZvcmNlKCkgaXMgdXNlZCBpbnN0ZWFkIG9mCnJlc3Rv
cmVfZmJkZXZfbW9kZV9hdG9taWMoKSBiZWNhdXNlIHRoYXQgb25lIHdpbGwgbGF0ZXIgYmVjb21l
IGludGVybmFsCnRvIGRybV9jbGllbnRfbW9kZXNldC4KClRoYW5rcyBmb3IgbG9va2luZyBhdCB0
aGlzLCBJJ2xsIHNwaW4gYSBuZXcgdmVyc2lvbi4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
