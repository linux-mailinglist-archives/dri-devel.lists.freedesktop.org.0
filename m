Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B325BFB8A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 00:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EF96EE2B;
	Thu, 26 Sep 2019 22:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1959E6EE2B;
 Thu, 26 Sep 2019 22:52:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E80010C0931;
 Thu, 26 Sep 2019 22:52:18 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 366CD600C1;
 Thu, 26 Sep 2019 22:52:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu/dm/mst: Report possible_crtcs incorrectly,
 for now
Date: Thu, 26 Sep 2019 18:51:07 -0400
Message-Id: <20190926225122.31455-6-lyude@redhat.com>
In-Reply-To: <20190926225122.31455-1-lyude@redhat.com>
References: <20190926225122.31455-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 26 Sep 2019 22:52:18 +0000 (UTC)
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb21taXQgaXMgc2VwZXJhdGUgZnJvbSB0aGUgcHJldmlvdXMgb25lIHRvIG1ha2UgaXQg
ZWFzaWVyIHRvCnJldmVydCBpbiB0aGUgZnV0dXJlLiBCYXNpY2FsbHksIHRoZXJlJ3MgbXVsdGlw
bGUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucwp0aGF0IGludGVycHJldCBwb3NzaWJsZV9jcnRjcyB2
ZXJ5IHdyb25nOgoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci9t
ZXJnZV9yZXF1ZXN0cy8yNzcKaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci9p
c3N1ZXMvNzU5CgpXaGlsZSB3b3JrIGlzIG9uZ29pbmcgdG8gZml4IHRoZXNlIGlzc3VlcyBpbiB1
c2Vyc3BhY2UsIHdlIG5lZWQgdG8KcmVwb3J0IC0+cG9zc2libGVfY3J0Y3MgaW5jb3JyZWN0bHkg
Zm9yIG5vdyBpbiBvcmRlciB0byBhdm9pZAppbnRyb2R1Y2luZyBhIHJlZ3Jlc3Npb24gaW4gaW4g
dXNlcnNwYWNlLiBPbmNlIHRoZXNlIGlzc3VlcyBnZXQgZml4ZWQsCnRoaXMgY29tbWl0IHNob3Vs
ZCBiZSByZXZlcnRlZC4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAx
MSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCBi
NDA0ZjFhZTZkZjcuLmZlOGFjODAxZDdhNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00ODA3LDYgKzQ4MDcsMTcgQEAgc3Rh
dGljIGludCBhbWRncHVfZG1fY3J0Y19pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2Vy
ICpkbSwKIAlpZiAoIWFjcnRjLT5tc3RfZW5jb2RlcikKIAkJZ290byBmYWlsOwogCisJLyoKKwkg
KiBGSVhNRTogVGhpcyBpcyBhIGhhY2sgdG8gd29ya2Fyb3VuZCB0aGUgZm9sbG93aW5nIGlzc3Vl
czoKKwkgKgorCSAqIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tdXR0ZXIvaXNzdWVz
Lzc1OQorCSAqIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvbWVy
Z2VfcmVxdWVzdHMvMjc3CisJICoKKwkgKiBPbmUgdGhlc2UgaXNzdWVzIGFyZSBjbG9zZWQsIHRo
aXMgc2hvdWxkIGJlIHJlbW92ZWQKKwkgKi8KKwlhY3J0Yy0+bXN0X2VuY29kZXItPmJhc2UucG9z
c2libGVfY3J0Y3MgPQorCQlhbWRncHVfZG1fZ2V0X2VuY29kZXJfY3J0Y19tYXNrKGRtLT5hZGV2
KTsKKwogCXJldHVybiAwOwogCiBmYWlsOgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
