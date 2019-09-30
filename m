Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95479C2DCF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1566A6E49A;
	Tue,  1 Oct 2019 07:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-17.sinamail.sina.com.cn (r3-17.sinamail.sina.com.cn
 [202.108.3.17])
 by gabe.freedesktop.org (Postfix) with SMTP id 6FC826E434
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 14:52:45 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.2.167])
 by sina.com with ESMTP
 id 5D9216B60001C679; Mon, 30 Sep 2019 22:52:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 55875849283243
From: Hillf Danton <hdanton@sina.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: drm_sched with panfrost crash on T820
Date: Mon, 30 Sep 2019 22:52:28 +0800
Message-Id: <20190930145228.14000-1-hdanton@sina.com>
In-Reply-To: <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIE1vbiwgMzAgU2VwIDIwMTkgMTE6MTc6NDUgKzAyMDAgTmVpbCBBcm1zdHJvbmcgd3JvdGU6
Cj4gCj4gRGlkIGEgbmV3IHJ1biBmcm9tIDUuMzoKPiAKPiBbICAgMzUuOTcxOTcyXSBDYWxsIHRy
YWNlOgo+IFsgICAzNS45NzQzOTFdICBkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWErMHg1Yy8weGYw
Cj4JCQlmZmZmMDAwMDEwNjY3ZjM4CUZGRkYwMDAwMTA2NjdGOTQKPgkJCWRyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jOjMzNQo+IAo+IFRoZSBjcmFzaGluZyBsaW5lIGlzIDoK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChiYWQtPnNfZmVuY2UtPnNjaGVk
dWxlZC5jb250ZXh0ID09Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW50
aXR5LT5mZW5jZV9jb250ZXh0KSB7Cj4gCj4gRG9lc24ndCBzZWVtIHJlbGF0ZWQgdG8gZ3VpbHR5
IGpvYi4KCkJhaWwgb3V0IGlmIHNfZmVuY2UgaXMgbm8gbG9uZ2VyIGZyZXNoLgoKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTMzMyw2ICszMzMsMTAgQEAgdm9pZCBkcm1fc2No
ZWRfaW5jcmVhc2Vfa2FybWEoc3RydWN0IGRybQogCiAJCQlzcGluX2xvY2soJnJxLT5sb2NrKTsK
IAkJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnRpdHksIHRtcCwgJnJxLT5lbnRpdGllcywg
bGlzdCkgeworCQkJCWlmICghc21wX2xvYWRfYWNxdWlyZSgmYmFkLT5zX2ZlbmNlKSkgeworCQkJ
CQlzcGluX3VubG9jaygmcnEtPmxvY2spOworCQkJCQlyZXR1cm47CisJCQkJfQogCQkJCWlmIChi
YWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09CiAJCQkJICAgIGVudGl0eS0+ZmVuY2Vf
Y29udGV4dCkgewogCQkJCQlpZiAoYXRvbWljX3JlYWQoJmJhZC0+a2FybWEpID4KQEAgLTU0Myw3
ICs1NDcsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9qb2JfaW5pdCk7CiB2b2lkIGRybV9z
Y2hlZF9qb2JfY2xlYW51cChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iKQogewogCWRtYV9mZW5j
ZV9wdXQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpOwotCWpvYi0+c19mZW5jZSA9IE5VTEw7CisJ
c21wX3N0b3JlX3JlbGVhc2UoJmpvYi0+c19mZW5jZSwgMCk7CiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9zY2hlZF9qb2JfY2xlYW51cCk7CiAKLS0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
