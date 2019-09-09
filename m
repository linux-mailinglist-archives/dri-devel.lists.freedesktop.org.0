Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893BAD2DA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 07:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3389897B5;
	Mon,  9 Sep 2019 05:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A3789498;
 Mon,  9 Sep 2019 05:52:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B5F7330A00C5;
 Mon,  9 Sep 2019 05:52:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-59.ams2.redhat.com
 [10.36.117.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD9E05D6A7;
 Mon,  9 Sep 2019 05:52:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B9D2992F; Mon,  9 Sep 2019 07:52:19 +0200 (CEST)
Date: Mon, 9 Sep 2019 07:52:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: Xorg indefinitely hangs in kernelspace
Message-ID: <20190909055219.q44k27cczwkuio3z@sirius.home.kraxel.org>
References: <20190906055322.17900-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906055322.17900-1-hdanton@sina.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 09 Sep 2019 05:52:21 +0000 (UTC)
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
 spice-devel@lists.freedesktop.org, Jaak Ristioja <jaak@ristioja.ee>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCi0tdmVyYm9zZSBwbGVhc2UuICBEbyB5b3Ugc2VlIHRoZSBzYW1lIGhhbmc/ICBEb2Vz
IHRoZSBwYXRjaCBmaXggaXQ/Cgo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2V4ZWNi
dWZfdXRpbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZXhlY2J1Zl91dGlsLmMK
PiBAQCAtOTcsOCArOTcsOSBAQCBpbnQgdHRtX2V1X3Jlc2VydmVfYnVmZmVycyhzdHJ1Y3Qgd3df
YWNxCj4gIAkJCSAgIHN0cnVjdCBsaXN0X2hlYWQgKmR1cHMsIGJvb2wgZGVsX2xydSkKWyAuLi4g
XQoKPiArCQkJaWYgKGxvY2tlZCkKPiArCQkJCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uX3Jl
dmVyc2UobGlzdCwgZW50cnkpOwoKSG1tLCBJIHRoaW5rIHRoZSBwYXRjaCBpcyB3cm9uZy4gIEFz
IGZhciBJIGtub3cgaXQgaXMgdGhlIHF4bCBkcml2ZXJzJ3MKam9iIHRvIGNhbGwgdHRtX2V1X2Jh
Y2tvZmZfcmVzZXJ2YXRpb24oKS4gIERvaW5nIHRoYXQgYXV0b21hdGljYWxseSBpbgp0dG0gd2ls
bCBtb3N0IGxpa2VseSBicmVhayBvdGhlciB0dG0gdXNlcnMuCgpTbyBJIGd1ZXNzIHRoZSBjYWxs
IGlzIG1pc3NpbmcgaW4gdGhlIHF4bCBkcml2ZXIgc29tZXdoZXJlLCBtb3N0IGxpa2VseQppbiBz
b21lIGVycm9yIGhhbmRsaW5nIGNvZGUgcGF0aCBnaXZlbiB0aGF0IHRoaXMgYnVnIGlzIGEgcmVs
YXRpdmVseQpyYXJlIGV2ZW50LgoKVGhlcmUgaXMgb25seSBhIHNpbmdsZSB0dG1fZXVfcmVzZXJ2
ZV9idWZmZXJzKCkgY2FsbCBpbiBxeGwuClNvIGhvdyBhYm91dCB0aGlzPwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0gY3V0IGhlcmUgLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX3JlbGVhc2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X3JlbGVhc2UuYwppbmRleCAzMTIyMTZjYWVlYTIuLjJmOTk1MGZhMGI4ZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX3JlbGVhc2UuYwpAQCAtMjYyLDE4ICsyNjIsMjAgQEAgaW50IHF4bF9yZWxlYXNlX3Jl
c2VydmVfbGlzdChzdHJ1Y3QgcXhsX3JlbGVhc2UgKnJlbGVhc2UsIGJvb2wgbm9faW50cikKIAly
ZXQgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZyZWxlYXNlLT50aWNrZXQsICZyZWxlYXNlLT5i
b3MsCiAJCQkJICAgICAhbm9faW50ciwgTlVMTCwgdHJ1ZSk7CiAJaWYgKHJldCkKLQkJcmV0dXJu
IHJldDsKKwkJZ290byBlcnJfYmFja29mZjsKIAogCWxpc3RfZm9yX2VhY2hfZW50cnkoZW50cnks
ICZyZWxlYXNlLT5ib3MsIHR2LmhlYWQpIHsKIAkJc3RydWN0IHF4bF9ibyAqYm8gPSB0b19xeGxf
Ym8oZW50cnktPnR2LmJvKTsKIAogCQlyZXQgPSBxeGxfcmVsZWFzZV92YWxpZGF0ZV9ibyhibyk7
Ci0JCWlmIChyZXQpIHsKLQkJCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZyZWxlYXNlLT50
aWNrZXQsICZyZWxlYXNlLT5ib3MpOwotCQkJcmV0dXJuIHJldDsKLQkJfQorCQlpZiAocmV0KQor
CQkJZ290byBlcnJfYmFja29mZjsKIAl9CiAJcmV0dXJuIDA7CisKK2Vycl9iYWNrb2ZmOgorCXR0
bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZyZWxlYXNlLT50aWNrZXQsICZyZWxlYXNlLT5ib3Mp
OworCXJldHVybiByZXQ7CiB9CiAKIHZvaWQgcXhsX3JlbGVhc2VfYmFja29mZl9yZXNlcnZlX2xp
c3Qoc3RydWN0IHF4bF9yZWxlYXNlICpyZWxlYXNlKQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSBj
dXQgaGVyZSAtLS0tLS0tLS0tLS0tLS0tLS0tLQoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
