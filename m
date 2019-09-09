Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8BFAE426
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F11B6E82A;
	Tue, 10 Sep 2019 06:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 569 seconds by postgrey-1.36 at gabe;
 Mon, 09 Sep 2019 12:22:40 UTC
Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn
 [202.108.3.21])
 by gabe.freedesktop.org (Postfix) with SMTP id 7EFF08991A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 12:22:40 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([61.148.244.178])
 by sina.com with ESMTP
 id 5D7641CB0002754D; Mon, 9 Sep 2019 20:13:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 314662630154
From: Hillf Danton <hdanton@sina.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: Xorg indefinitely hangs in kernelspace
Date: Mon,  9 Sep 2019 20:12:50 +0800
Message-Id: <20190909121250.11176-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
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
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIE1vbiwgOSBTZXAgMjAxOSBmcm9tIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
Pgo+Cj4gSG1tLCBJIHRoaW5rIHRoZSBwYXRjaCBpcyB3cm9uZy4KCkhtbS4uLml0IHNob3VsZCBo
YXZlIGFkZGVkIGNoYW5nZSBvbmx5IGluIHRoZSBlcnJvciBwYXRoLCBsZWF2aW5nIGxvY2tzCmZv
ciBkcml2ZXJzIHRvIHJlbGVhc2UgaWYgam9iIGlzIGRvbmUgd2l0aCBubyBlcnJvciByZXR1cm5l
ZC4KCj4gQXMgZmFyIEkga25vdyBpdCBpcyB0aGUgcXhsIGRyaXZlcnMncwo+IGpvYiB0byBjYWxs
IHR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCkuCgpMaWtlIG90aGVyIGRyaXZlcnMsIHF4bCBp
cyBjdXJyZW50bHkgZG9pbmcgdGhlIHJpZ2h0LgoKPiBEb2luZyB0aGF0IGF1dG9tYXRpY2FsbHkg
aW4KPiB0dG0gd2lsbCBtb3N0IGxpa2VseSBicmVhayBvdGhlciB0dG0gdXNlcnMuCj4KWW91IGFy
ZSByaWdodC4gVGhleSBhcmUgcmVzcG9uc2libGUgZm9yIGRvaW5nIGJhY2tvZmYgaWYgZXJyb3Ig
aGFwcGVucwp3aGlsZSB2YWxpZGF0aW5nIGJ1ZmZlcnMgYWZ0ZXJ3YXJkcy4KCgotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9leGVjYnVmX3V0aWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9leGVjYnVmX3V0aWwuYwpAQCAtMTExLDggKzExMSwxMCBAQCBpbnQgdHRtX2V1X3Jl
c2VydmVfYnVmZmVycyhzdHJ1Y3Qgd3dfYWNxCiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5
LCBsaXN0LCBoZWFkKSB7CiAJCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBlbnRyeS0+
Ym87CisJCWJvb2wgbG9ja29uOwogCiAJCXJldCA9IF9fdHRtX2JvX3Jlc2VydmUoYm8sIGludHIs
ICh0aWNrZXQgPT0gTlVMTCksIHRpY2tldCk7CisJCWxvY2tvbiA9ICFyZXQ7CiAJCWlmICghcmV0
ICYmIHVubGlrZWx5KGF0b21pY19yZWFkKCZiby0+Y3B1X3dyaXRlcnMpID4gMCkpIHsKIAkJCXJl
c2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3YpOwogCkBAIC0xNTEsNiArMTUzLDcgQEAg
aW50IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoc3RydWN0IHd3X2FjcQogCQkJCXJldCA9IDA7CiAJ
CQl9CiAJCX0KKwkJbG9ja29uID0gIXJldDsKIAogCQlpZiAoIXJldCAmJiBlbnRyeS0+bnVtX3No
YXJlZCkKIAkJCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+cmVz
diwKQEAgLTE2Myw2ICsxNjYsOCBAQCBpbnQgdHRtX2V1X3Jlc2VydmVfYnVmZmVycyhzdHJ1Y3Qg
d3dfYWNxCiAJCQkJd3dfYWNxdWlyZV9kb25lKHRpY2tldCk7CiAJCQkJd3dfYWNxdWlyZV9maW5p
KHRpY2tldCk7CiAJCQl9CisJCQlpZiAobG9ja29uKQorCQkJCXR0bV9ldV9iYWNrb2ZmX3Jlc2Vy
dmF0aW9uX3JldmVyc2UobGlzdCwgZW50cnkpOwogCQkJcmV0dXJuIHJldDsKIAkJfQogCi0tCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
