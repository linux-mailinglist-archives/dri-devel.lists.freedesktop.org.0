Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718A6349EA3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 02:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E496EE9B;
	Fri, 26 Mar 2021 01:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BE26EE9B;
 Fri, 26 Mar 2021 01:25:52 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 2696F98027A;
 Fri, 26 Mar 2021 09:25:49 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Wan Jiabing <wanjiabing@vivo.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] drm/i915: Remove repeated declaration
Date: Fri, 26 Mar 2021 09:25:17 +0800
Message-Id: <20210326012527.875026-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSUpDSU8ZSRodSk5KVkpNSk1MSUpCT0JMTUxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBg6PBw5Pj8TPD1RTw4eC0IU
 MjUwFBVVSlVKTUpNTElKQk5LTUxNVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFIQkxJNwY+
X-HM-Tid: 0a786c2333ead992kuws2696f98027a
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
Cc: kael_w@yeah.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c3RydWN0IGRybV9pOTE1X3ByaXZhdGUsIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlIGFuZApzdHJ1
Y3QgaW50ZWxfY3J0YyBpcyBkZWNsYXJlZCB0d2ljZS4KUmVtb3ZlIHRoZSBkdXBsaWNhdGUuCgpS
ZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IFdhbiBKaWFiaW5nIDx3YW5qaWFiaW5nQHZpdm8uY29tPgotLS0KQ2hh
bmdlbG9nOgp2MjoKLSBNb2RpZnkgc3ViamVjdCBsaW5lLgotIERlbGV0ZSB0cmFpbGluZyB3aGl0
ZXNwYWNlIGluIGNvbW1pdCBsb2cuCi0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jcnQuaCAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheS5oIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5o
ICAgICB8IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0LmggYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydC5oCmluZGV4IDFiM2ZiYTM1OWVmYy4uNmM1YzQ0NjAw
Y2JkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydC5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0LmgKQEAgLTExLDcg
KzExLDYgQEAKIGVudW0gcGlwZTsKIHN0cnVjdCBkcm1fZW5jb2RlcjsKIHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlOwotc3RydWN0IGRybV9pOTE1X3ByaXZhdGU7CiAKIGJvb2wgaW50ZWxfY3J0X3Bv
cnRfZW5hYmxlZChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCQkgICAgaTkx
NV9yZWdfdCBhZHBhX3JlZywgZW51bSBwaXBlICpwaXBlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmgKaW5kZXggNzZmOGE4MDViMGEzLi4yOWNiNmQ4NGVk
NzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oCkBA
IC00OCw3ICs0OCw2IEBAIHN0cnVjdCBpOTE1X2dndHRfdmlldzsKIHN0cnVjdCBpbnRlbF9hdG9t
aWNfc3RhdGU7CiBzdHJ1Y3QgaW50ZWxfY3J0YzsKIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlOwot
c3RydWN0IGludGVsX2NydGNfc3RhdGU7CiBzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0Owogc3Ry
dWN0IGludGVsX2RwOwogc3RydWN0IGludGVsX2VuY29kZXI7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF92cnIuaAppbmRleCBmYWMwMWJmNGFiNTAuLjk2ZjljOWMyN2FiOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92cnIuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5oCkBAIC0xNSw3ICsxNSw2IEBA
IHN0cnVjdCBpbnRlbF9jcnRjOwogc3RydWN0IGludGVsX2NydGNfc3RhdGU7CiBzdHJ1Y3QgaW50
ZWxfZHA7CiBzdHJ1Y3QgaW50ZWxfZW5jb2RlcjsKLXN0cnVjdCBpbnRlbF9jcnRjOwogCiBib29s
IGludGVsX3Zycl9pc19jYXBhYmxlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpOwog
dm9pZCBpbnRlbF92cnJfY2hlY2tfbW9kZXNldChzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpz
dGF0ZSk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
