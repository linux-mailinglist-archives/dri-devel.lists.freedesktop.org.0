Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB3126B2C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 19:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEBE6E0D4;
	Thu, 19 Dec 2019 18:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0BF6E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 18:55:09 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E73B24680;
 Thu, 19 Dec 2019 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576781709;
 bh=f2Ph5aXxyhp+Ah/9djnzuyxceakXuLb4xX3/ZkgYiU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kM4EG8g2FSl2k9NAR3sLJpGQJL4t08+AsSJldX6LNjNxnsOGjV+F2lO0Q6IRSXVhy
 X2J78h3cXNP6xgpS3Fieq7yZcAW9Hl5ASLAI1E9EkDghB+NOGPmCkaKqxrz3bTbhuW
 tbcK8Sc3RBeoY9O6Juje0Au8XQdCE48qLz1LunSg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 49/80] drm/mgag200: Flag all G200 SE A machines as broken
 wrt <startadd>
Date: Thu, 19 Dec 2019 19:34:41 +0100
Message-Id: <20191219183119.492063990@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219183031.278083125@linuxfoundation.org>
References: <20191219183031.278083125@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cgpjb21taXQgNGFk
ZjBiNDllZWE5MjZhNTVmZDk1NmVmN2Q4Njc1MGY3NzE0MzVmZiB1cHN0cmVhbS4KClNldmVyYWwg
TUdBIEcyMDAgU0UgbWFjaGluZXMgZG9uJ3QgcmVzcGVjdCB0aGUgdmFsdWUgb2YgdGhlIHN0YXJ0
YWRkCnJlZ2lzdGVyIGZpZWxkLiBBZnRlciBtb3JlIGZlZWRiYWNrIG9uIGFmZmVjdGVkIG1hY2hp
bmVzLCBuZWl0aGVyIFBDSQpzdWJ2ZW5kb3IgSUQgbm9yIHRoZSBpbnRlcm5hbCBJRCBzZWVtIHRv
IGhpbnQgdG93YXJkcyB0aGUgYnVnLiBBbGwKYWZmZWN0ZWQgbWFjaGluZXMgaGF2ZSBhIFBDSSBJ
RCBvZiAweDA1MjIgKGkuZS4sIEcyMDAgU0UgQSkuIEl0IHdhcwpkZWNpZGVkIHRvIGZsYWcgYWxs
IEcyMDAgU0UgQSBtYWNoaW5lcyBhcyBicm9rZW4uCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgpGaXhlczogMTU5MWZhZGY4NTdjICgiZHJtL21nYWcyMDA6IEFkZCB3
b3JrYXJvdW5kIGZvciBIVyB0aGF0IGRvZXMgbm90IHN1cHBvcnQgJ3N0YXJ0YWRkJyIpCkNjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IEpvaG4gRG9ubmVsbHkg
PGpvaG4ucC5kb25uZWxseUBvcmFjbGUuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzog
RGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiAiWS5DLiBDaGVuIiA8eWNfY2hlbkBh
c3BlZWR0ZWNoLmNvbT4KQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogIkpvc8OpIFJv
YmVydG8gZGUgU291emEiIDxqb3NlLnNvdXphQGludGVsLmNvbT4KQ2M6IEFuZHJ6ZWogUGlldHJh
c2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4zKwpDYzogR3Jl
ZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IEFsbGlzb24g
UmFuZGFsIDxhbGxpc29uQGxvaHV0b2submV0PgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIw
MTkxMjA2MDgxOTAxLjk5MzgtMS10emltbWVybWFubkBzdXNlLmRlClNpZ25lZC1vZmYtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgfCAgICAzICstLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2Rydi5jCkBAIC0zMCw5ICszMCw4IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChtb2Rlc2V0LCBt
Z2FnMjAwX21vZGUKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXI7CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKLQl7IFBDSV9WRU5ET1Jf
SURfTUFUUk9YLCAweDUyMiwgUENJX1ZFTkRPUl9JRF9TVU4sIDB4NDg1MiwgMCwgMCwKKwl7IFBD
SV9WRU5ET1JfSURfTUFUUk9YLCAweDUyMiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwK
IAkJRzIwMF9TRV9BIHwgTUdBRzIwMF9GTEFHX0hXX0JVR19OT19TVEFSVEFERH0sCi0JeyBQQ0lf
VkVORE9SX0lEX01BVFJPWCwgMHg1MjIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIEcy
MDBfU0VfQSB9LAogCXsgUENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTI0LCBQQ0lfQU5ZX0lELCBQ
Q0lfQU5ZX0lELCAwLCAwLCBHMjAwX1NFX0IgfSwKIAl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAw
eDUzMCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgRzIwMF9FViB9LAogCXsgUENJX1ZF
TkRPUl9JRF9NQVRST1gsIDB4NTMyLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBHMjAw
X1dCIH0sCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
