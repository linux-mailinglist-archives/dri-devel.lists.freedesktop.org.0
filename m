Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED07315BA
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 21:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A900E898C4;
	Fri, 31 May 2019 19:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8580F8921B;
 Fri, 31 May 2019 09:46:31 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id CC0903E80A;
 Fri, 31 May 2019 09:46:29 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org,
 jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 0/6] ARM: qcom: working Nexus 5 display support
Date: Fri, 31 May 2019 05:46:13 -0400
Message-Id: <20190531094619.31704-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 May 2019 19:58:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559295990;
 bh=49G1eU+yZvHTYQpvw1OvAZKYIN/9I7PCg4V7MtIDuUM=;
 h=From:To:Subject:Date:From;
 b=JjgJkYvyX+wyle7H5K28przJBTDMqMIgNsBfeQZMW9a3y0UQkixhNt+tPfbNTRMnW
 deqCVPa9vPZZG247IE4oQ3kHzKA7ZK7jTqMoyP8E4Svvw3e7OecfYhxS95ZFuuUZCg
 C4z6RV0NPyh653u7214LdpwuaHQaRA7+P9amzKMM=
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyB3b3JraW5nIGRpc3BsYXkgc3VwcG9ydCB0byB0aGUgTEcg
TmV4dXMgNQooaGFtbWVyaGVhZCkgcGhvbmUuCgpDaGFuZ2VzIHNpbmNlIHYyOgotIERyb3BwZWQg
dHdvIGRybS9tc20gYnVnIGZpeCBwYXRjaGVzIHRoYXQgaGF2ZSBiZWVuIG1lcmdlZCBzZXBhcmF0
ZWx5LgotIE5ldyBwYXRjaDogJ2FkZCBzdXBwb3J0IGZvciBwZXItQ1JUQyBtYXhfdmJsYW5rX2Nv
dW50IG9uIG1kcDUnLgogIFNwZWNpYWwgdGhhbmtzIHRvIEplZmZyZXkgSHVnbyBmb3IgaGVscGlu
ZyB0byB0cmFjayBkb3duIHRoaXMgaXNzdWUuCi0gQWRkIHBhbmVsX3BpbiB0byBtc204OTc0LWhh
bW1lcmhlYWQgZGV2aWNlIHRyZWUuIERyb3BwZWQgTGludXMKICBXYWxsZWlqJ3MgcmV2aWV3ZWQt
Ynkgb24gdGhpcyBwYXRjaCBkdWUgdG8gdGhpcyBjaGFuZ2UuCgpDaGFuZ2VzIHNpbmNlIHYxOgot
IFNob3J0ZW5lZCBwcm9ibGVtIGRlc2NyaXB0aW9uIGFib3ZlLiBJJ2xsIHJlcGx5IHRvIHRoaXMg
ZW1haWwgYW5kIHNlbmQKICBhIGZ1bGwgZG1lc2cgd2l0aCB0aGUgYm9vdCBsb2cgd2l0aCBkZWJ1
Z2dpbmcgdHVybmVkIG9uLgotIERyb3BwZWQgcGF0Y2ggJ2ZpeCBudWxsIHBvaW50ZXIgZGVyZWZl
cmVuY2UgaW4KICBtc21fYXRvbWljX3ByZXBhcmVfZmIoKScKLSBOZXcgcGF0Y2g6IFJlbW92ZSBy
ZXN2IGZpZWxkcyBmcm9tIG1zbV9nZW1fb2JqZWN0IHN0cnVjdCB0aGF0IHdhcwogIGluY29ycmVj
dGx5IGJlaW5nIHJlZmVyZW5jZWQgYnkgdGhlIHByZXBhcmVfZmIgY2FsbGJhY2tzLgotIEFkZCBk
cm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygpIHRvIHBsYW5lIGluaXQgZm9yIG1kcDQs
IG1kcDUsCiAgYW5kIGRwdTEuCi0gQWRkIExpbnVzIFdhbGxlaWoncyByZXZpZXdlZC1ieSB0byBw
YXRjaGVzIDMtNgoKTXkgc3RhdHVzIHBhZ2UgYXQgaHR0cHM6Ly9tYXNuZXliLmdpdGh1Yi5pby9u
ZXh1cy01LXVwc3RyZWFtLwpkZXNjcmliZXMgd2hhdCBpcyB3b3JraW5nIHNvIGZhciB3aXRoIHRo
ZSB1cHN0cmVhbSBrZXJuZWwgb24gdGhlIE5leHVzCjUuCgpCcmlhbiBNYXNuZXkgKDYpOgogIGRy
bS9tc206IGFkZCBkaXJ0eSBmcmFtZWJ1ZmZlciBoZWxwZXIKICBkcm0vbXNtOiBhZGQgc3VwcG9y
dCBmb3IgcGVyLUNSVEMgbWF4X3ZibGFua19jb3VudCBvbiBtZHA1CiAgQVJNOiBxY29tX2RlZmNv
bmZpZzogYWRkIGRpc3BsYXktcmVsYXRlZCBvcHRpb25zCiAgQVJNOiBkdHM6IHFjb206IG1zbTg5
NzQtaGFtbWVyaGVhZDogYWRkIHN1cHBvcnQgZm9yIGJhY2tsaWdodAogIEFSTTogZHRzOiBtc204
OTc0OiBhZGQgZGlzcGxheSBzdXBwb3J0CiAgQVJNOiBkdHM6IHFjb206IG1zbTg5NzQtaGFtbWVy
aGVhZDogYWRkIHN1cHBvcnQgZm9yIGRpc3BsYXkKCiAuLi4vcWNvbS1tc204OTc0LWxnZS1uZXh1
czUtaGFtbWVyaGVhZC5kdHMgICAgfCAgOTIgKysrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0
cy9xY29tLW1zbTg5NzQuZHRzaSAgICAgICAgICAgfCAxMzIgKysrKysrKysrKysrKysrKysrCiBh
cmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnICAgICAgICAgICAgICAgfCAgIDUgKwogZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMgICAgIHwgICAzICsKIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfcGxhbmUuYyAgICB8ICAgMyArCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyAgICAgfCAgMTYgKystCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfcGxhbmUuYyAgICB8ICAgMyArCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9mYi5jICAgICAgICAgICAgICAgICAgfCAgIDIgKwogOSBmaWxlcyBjaGFu
Z2VkLCAyNTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
