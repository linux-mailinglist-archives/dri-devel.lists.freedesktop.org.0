Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56344AE981
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 13:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566D66E041;
	Tue, 10 Sep 2019 11:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D8F6E041
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 11:52:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84B4A4F1DC;
 Tue, 10 Sep 2019 11:52:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4028F5DA8D;
 Tue, 10 Sep 2019 11:52:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 640EB16E08; Tue, 10 Sep 2019 13:52:05 +0200 (CEST)
Date: Tue, 10 Sep 2019 13:52:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
Message-ID: <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909140633.31260-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 10 Sep 2019 11:52:06 +0000 (UTC)
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDQ6MDY6MzJQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gQmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUn
cyBzaGFkb3cgYnVmZmVyLCB0aGUgZGlydHkKPiB3b3JrZXIgbm93IHdhaXRzIGZvciB2Ymxhbmsu
IFRoaXMgYWxsb3dzIHNldmVyYWwgc2NyZWVuIHVwZGF0ZXMgdG8gcGlsZQo+IHVwIGFuZCBhY3Rz
IGFzIGEgcmF0ZSBsaW1pdGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gaW5kZXggYTdiYTViNDkwMmQ2Li4wMTdl
MmY2YmQxYjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPiBAQCAtNDAyLDggKzQwMiwy
MCBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2RpcnR5X3dvcmsoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQo+ICAJCQkJCQkgICAgZGlydHlfd29yayk7Cj4gIAlzdHJ1Y3QgZHJtX2NsaXBf
cmVjdCAqY2xpcCA9ICZoZWxwZXItPmRpcnR5X2NsaXA7Cj4gIAlzdHJ1Y3QgZHJtX2NsaXBfcmVj
dCBjbGlwX2NvcHk7Cj4gKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7Cj4gIAl1bnNpZ25lZCBsb25n
IGZsYWdzOwo+ICAJdm9pZCAqdmFkZHI7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCS8qIHJhdGUtbGlt
aXQgdXBkYXRlIGZyZXF1ZW5jeSAqLwo+ICsJbXV0ZXhfbG9jaygmaGVscGVyLT5sb2NrKTsKPiAr
CWNydGMgPSBoZWxwZXItPmNsaWVudC5tb2Rlc2V0c1swXS5jcnRjOwo+ICsJcmV0ID0gZHJtX2Ny
dGNfdmJsYW5rX2dldChjcnRjKTsKPiArCWlmICghcmV0KSB7Cj4gKwkJZHJtX2NydGNfd2FpdF9v
bmVfdmJsYW5rKGNydGMpOwo+ICsJCWRybV9jcnRjX3ZibGFua19wdXQoY3J0Yyk7Cj4gKwl9Cj4g
KwltdXRleF91bmxvY2soJmhlbHBlci0+bG9jayk7CgpIbW0sIG5vdCBzdXJlIGl0IGlzIHRoZSBi
ZXN0IHBsYW4gdG8gc2xlZXAgZm9yIGEgd2hpbGUgaW4gdGhlIHdvcmtlciwKZXNwZWNpYWxseSB3
aGlsZSBob2xkaW5nIHRoZSBsb2NrLgoKV2hhdCBkb2VzIHRoZSBsb2NrIHByb3RlY3QgYWdhaW5z
dCBoZXJlPyAgQWNjZXNzaW5nCmhlbHBlci0+Y2xpZW50Lm1vZGVzZXRzPyAgSWYgc28gdGhlbiB5
b3UgY2FuIHVubG9jayBiZWZvcmUgZ29pbmcgdG8Kc2xlZXAgaW4gZHJtX2NydGNfd2FpdF9vbmVf
dmJsYW5rKCkgSSB0aGluay4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
