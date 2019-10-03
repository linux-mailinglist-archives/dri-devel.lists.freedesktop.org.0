Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E34CB539
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739926EABE;
	Fri,  4 Oct 2019 07:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn
 [202.108.3.162])
 by gabe.freedesktop.org (Postfix) with SMTP id 7AC7C6E2DF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:26:09 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.2.167])
 by sina.com with ESMTP
 id 5D95B00D0003713B; Thu, 3 Oct 2019 16:23:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 29860649283206
From: Hillf Danton <hdanton@sina.com>
To: Frediano Ziglio <fziglio@redhat.com>,
	Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: [Spice-devel] Xorg indefinitely hangs in kernelspace
Date: Thu,  3 Oct 2019 16:23:30 +0800
Message-Id: <20191003082330.15260-1-hdanton@sina.com>
In-Reply-To: <1174991123.3693721.1569850187145.JavaMail.zimbra@redhat.com>
References: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
 <20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
 <e4b7d889-15f3-0c90-3b9f-d395344499c0@ristioja.ee>
 <ccafdbaf-7f8e-8616-5543-2a178bd63828@ristioja.ee>
 <1174991123.3693721.1569850187145.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIFRodSwgMyBPY3QgMjAxOSAwOTo0NTo1NSArMDMwMCBKYWFrIFJpc3Rpb2phIHdyb3RlOgo+
IE9uIDMwLjA5LjE5IDE2OjI5LCBGcmVkaWFubyBaaWdsaW8gd3JvdGU6Cj4gPiAgIFdoeSBkaWRu
J3QgeW91IHVwZGF0ZSBidWcgYXQgaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytz
b3VyY2UvbGludXgvK2J1Zy8xODEzNjIwPwo+ID4gSSBrbm93IGl0IGNhbiBzZWVtIHRlZGlvdXMg
YnV0IHdvdWxkIGhlbHAgdHJhY2tpbmcgaXQuCj4gCj4gSSBzdXBwb3NlIHRoZSBsYWNrIG9uIGNl
bnRyYWxpemVkIHRyYWNraW5nIGFuZCBoYW5kbGluZyBvZiBMaW51eCBrZXJuZWwKPiBidWdzIGlz
IGEgZGVsaWNhdGUgdG9waWMsIHNvIEkgZG9uJ3Qgd2FudCB0byByYW50IG11Y2ggbW9yZSBvbiB0
aGF0Lgo+IFVwZGF0aW5nIHRoYXQgYnVnIHdvdWxkIHRlZGlvdXMgYW5kIHRpbWUtY29uc3VtaW5n
IGluZGVlZCwgd2hpY2ggaXMgd2h5Cj4gSSBoYXZlbid0IGRvbmUgdGhhdC4gVG8gYmUgaG9uZXN0
LCBJIGRvbid0IGhhdmUgZW5vdWdoIHRpbWUgYW5kIG1vdGl2YXRpb24uCgpHaXZlIHRoZSBkaWZm
IGJlbG93IGEgZ28gb25seSB3aGVuIGl0IGlzIGNvbnZlbmllbnQgYW5kIG9ubHkgaWYgaXQgbWFr
ZXMKYSBiaXQgb2Ygc2Vuc2UgdG8geW91LgoKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
ZXhlY2J1Zl91dGlsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZXhlY2J1Zl91dGls
LmMKQEAgLTExMCw2ICsxMTAsNyBAQCBpbnQgdHRtX2V1X3Jlc2VydmVfYnVmZmVycyhzdHJ1Y3Qg
d3dfYWNxCiAJCXd3X2FjcXVpcmVfaW5pdCh0aWNrZXQsICZyZXNlcnZhdGlvbl93d19jbGFzcyk7
CiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCBsaXN0LCBoZWFkKSB7CisJCWJvb2wgbG9j
a29uID0gZmFsc2U7CiAJCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBlbnRyeS0+Ym87
CiAKIAkJcmV0ID0gX190dG1fYm9fcmVzZXJ2ZShibywgaW50ciwgKHRpY2tldCA9PSBOVUxMKSwg
dGlja2V0KTsKQEAgLTE1MCw2ICsxNTEsNyBAQCBpbnQgdHRtX2V1X3Jlc2VydmVfYnVmZmVycyhz
dHJ1Y3Qgd3dfYWNxCiAJCQkJZG1hX3Jlc3ZfbG9ja19zbG93KGJvLT5iYXNlLnJlc3YsIHRpY2tl
dCk7CiAJCQkJcmV0ID0gMDsKIAkJCX0KKwkJCWxvY2tvbiA9ICFyZXQ7CiAJCX0KIAogCQlpZiAo
IXJldCAmJiBlbnRyeS0+bnVtX3NoYXJlZCkKQEAgLTE1Nyw2ICsxNTksOCBAQCBpbnQgdHRtX2V1
X3Jlc2VydmVfYnVmZmVycyhzdHJ1Y3Qgd3dfYWNxCiAJCQkJCQkJCWVudHJ5LT5udW1fc2hhcmVk
KTsKIAogCQlpZiAodW5saWtlbHkocmV0ICE9IDApKSB7CisJCQlpZiAobG9ja29uKQorCQkJCWRt
YV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsKIAkJCWlmIChyZXQgPT0gLUVJTlRSKQogCQkJ
CXJldCA9IC1FUkVTVEFSVFNZUzsKIAkJCWlmICh0aWNrZXQpIHsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
