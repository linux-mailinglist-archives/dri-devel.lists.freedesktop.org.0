Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF0344BED
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26E6E52C;
	Mon, 22 Mar 2021 16:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB176E52C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:42:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AEB161983;
 Mon, 22 Mar 2021 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616431327;
 bh=9xvqTNezw3tYuoVfeeADeGM3s9v4JWgUTmRGf4uQ2NU=;
 h=From:To:Cc:Subject:Date:From;
 b=effL3sJznDj8ualeXh5XCrDafKag1c2smDyLYgtFi/TZ/nhyq+qP6dzFvy6zU0uXJ
 YI+BBE7mnNAxmrU9dukG9Gx6vnYPWGd+GJCr8g8UiFalENeznr9qCd0/2H+hOO/rHN
 ZnmXT92X720doHPJh3OF2eUW6l8NWz1YDCZLRYPLsfrIBMEGcy/YmKiuxVZv2FPadm
 kYshsDZEnmPM+0VOoE6BRjTAsal86mIFHv+gh7f1/6hPRfSqKpwt1Ot2KfEID/pw+1
 0N5DTaoT3xy7ZfhBogPXIM0BmhyPogSTNRGhogZ3LcSKOXvOlk0jzLTZ5lJfHCcFgl
 rANd6JpBL/4iw==
From: Arnd Bergmann <arnd@kernel.org>
To: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/omap: fix misleading indentation in pixinc()
Date: Mon, 22 Mar 2021 17:41:57 +0100
Message-Id: <20210322164203.827324-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkFuIG9sZCBwYXRjaCBhZGRlZCBh
ICdyZXR1cm4nIHN0YXRlbWVudCBhZnRlciBlYWNoIEJVRygpIGluIHRoaXMgZHJpdmVyLAp3aGlj
aCB3YXMgbmVjZXNzYXJ5IGF0IHRoZSB0aW1lLCBidXQgaGFzIGJlY29tZSByZWR1bmRhbnQgYWZ0
ZXIgdGhlIEJVRygpCmRlZmluaXRpb24gd2FzIHVwZGF0ZWQgdG8gaGFuZGxlIHRoaXMgcHJvcGVy
bHkuCgpnY2MtMTEgbm93IHdhcm5zIGFib3V0IG9uZSBzdWNoIGluc3RhbmNlLCB3aGVyZSB0aGUg
J3JldHVybicgc3RhdGVtZW50CndhcyBpbmNvcnJlY3RseSBpbmRlbnRlZDoKCmRyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jOiBJbiBmdW5jdGlvbiDigJhwaXhpbmPigJk6CmRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jOjIwOTM6OTogZXJyb3I6IHRoaXMg4oCYZWxz
ZeKAmSBjbGF1c2UgZG9lcyBub3QgZ3VhcmQuLi4gWy1XZXJyb3I9bWlzbGVhZGluZy1pbmRlbnRh
dGlvbl0KIDIwOTMgfCAgICAgICAgIGVsc2UKICAgICAgfCAgICAgICAgIF5+fn4KZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmM6MjA5NToxNzogbm90ZTogLi4udGhpcyBzdGF0ZW1l
bnQsIGJ1dCB0aGUgbGF0dGVyIGlzIG1pc2xlYWRpbmdseSBpbmRlbnRlZCBhcyBpZiBpdCB3ZXJl
IGd1YXJkZWQgYnkgdGhlIOKAmGVsc2XigJkKIDIwOTUgfCAgICAgICAgICAgICAgICAgcmV0dXJu
IDA7CiAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fgoKQWRkcmVzcyB0aGlzIGJ5IHJlbW92
aW5nIHRoZSByZXR1cm4gYWdhaW4gYW5kIGNoYW5naW5nIHRoZSBCVUcoKQp0byBiZSB1bmNvbmRp
dGlvbmFsIHRvIG1ha2UgdGhpcyBtb3JlIGludHVpdGl2ZS4KCkZpeGVzOiBjNmVlZTk2OGQ0MGQg
KCJPTUFQRFNTOiByZW1vdmUgY29tcGlsZXIgd2FybmluZ3Mgd2hlbiBDT05GSUdfQlVHPW4iKQpT
aWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3MvZGlzcGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNw
Yy5jCmluZGV4IGY0Y2JlZjhjY2FjZS4uNTYxOTQyMGNjMmNjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvZGlzcGMuYwpAQCAtMjA5MCw5ICsyMDkwLDggQEAgc3RhdGljIHMzMiBwaXhpbmMoaW50
IHBpeGVscywgdTggcHMpCiAJCXJldHVybiAxICsgKHBpeGVscyAtIDEpICogcHM7CiAJZWxzZSBp
ZiAocGl4ZWxzIDwgMCkKIAkJcmV0dXJuIDEgLSAoLXBpeGVscyArIDEpICogcHM7Ci0JZWxzZQot
CQlCVUcoKTsKLQkJcmV0dXJuIDA7CisKKwlCVUcoKTsKIH0KIAogc3RhdGljIHZvaWQgY2FsY19v
ZmZzZXQodTE2IHNjcmVlbl93aWR0aCwgdTE2IHdpZHRoLAotLSAKMi4yOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
