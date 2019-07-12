Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBA66A26
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6686E338;
	Fri, 12 Jul 2019 09:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8608C6E338;
 Fri, 12 Jul 2019 09:41:28 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MDy9C-1heCYe1wgO-00A0cZ; Fri, 12 Jul 2019 11:41:20 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/amdgpu: hide #warning for missing DC config
Date: Fri, 12 Jul 2019 11:40:49 +0200
Message-Id: <20190712094118.1559434-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ttmzMtAGFGv3mR5H495wgmiwrDzBZya2VZW2Xzjw9gDc0C+MN53
 5UB0PXB44DnG+8HS0DE9WF9L/shoFZYhub56pMwP4rt06cG75xyeDrvTK/GtGzEPDV7u+K3
 xNqZcPP9uY+gVpnbPafE4oEfbDJ1k/Mn+EIwxpnjBhdF6t5p9jYAqlpVDXdWtxytRR43xo7
 Ddm6kup5fX/5TnKSwk6/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7sYK4wnPxhY=:GhHlrFRq70LCK1koeRxlA4
 +PuyZDl1N8PyHeDbmmjhQiTm+D5xuSBzeN8Z3Yui90ycSTtMNoWJlEO2UPjfSL5o4HXLeAU9+
 UZw8b2wlDWDUUJ+MXiuy9/rI2igr36QvP+h716zOp4zBODU0SSe0xdJQWXTLa6SngXUiMpT9A
 Ljhnoea/IcX0ty482kc5OyxlKt7SkL3wAmy52VaGEbT66vK3ooVJYrz59zHHd6jWoah9BhrRi
 uK+RrlEF5hd8X3WJxC0ZJipTGuqyNZdwlOGWWMreXC4X4TWdgFPVZjCVYh4RIP3b90hK6Nlmh
 fBV5Rx+tPp2Y8iWbvF6pgo9NWhwuqQy14+RGNXTHIsVFHTPG51gYgJ/u3jLBFPDanY2KTFfIG
 UVGg6LnF7/P1ShA8Z1fr4nbQh/PhmcEeOWLbqRnFHyyAeLIGM8czEjfWGrWJaKLT01NWG6//i
 WY8T1InyTTiCLyCw7q/Alubp0S4EcVHFOyVapZm+aSAcVrROTh1XtsoNXoq5T567gFk+qMJzV
 tBr2Z4jPQcfKY6qXalZqFm9dYAtflVzsQmk0b3Jv0Ov4Ly7tApkaf7+DQVu11NrJAPO14wEUk
 IzQVkrzY70RfovcShLm/R+DZnm2U2NeDZpKkAFZA3JqdVUtWWUY/rXbWYemgXU2dL6WKx520H
 DDjc6ms+z7DXRhk7bQASWB2Rro17RbsIwMDTnkwaOl7/pGYOPiEtxchSyu1Qgtyl/o7mGtZEC
 BH4yrhvZU7hwtKrgyUc+6hmh+wm65DU/XDF72w==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Wang <kevin1.wang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgYW5ub3lpbmcgdG8gaGF2ZSAjd2FybmluZ3MgdGhhdCB0cmlnZ2VyIGluIHJhbmRjb25m
aWcKYnVpbGRzIGxpa2UKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmM6NjUzOjM6
IGVycm9yOiAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5IHN1cHBvcnQgb24g
U09DMTUuIgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jOjQwMDozOiBlcnJvcjogIkVu
YWJsZSBDT05GSUdfRFJNX0FNRF9EQyBmb3IgZGlzcGxheSBzdXBwb3J0IG9uIG5hdmkuIgoKUmVt
b3ZlIHRoZXNlIGFuZCByZWx5IG9uIHRoZSB1c2VycyB0byB0dXJuIHRoZXNlIG9uLgoKU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jICAgIHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYyB8IDQgLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9udi5jCmluZGV4IDkyNTNjMDNkMzg3YS4uMTBlYzBlODFlZTU4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L252LmMKQEAgLTM5Niw4ICszOTYsNiBAQCBpbnQgbnZfc2V0X2lwX2Jsb2Nr
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1E
X0RDKQogCQllbHNlIGlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKQogCQkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRtX2lwX2Jsb2NrKTsKLSNlbHNlCi0j
CXdhcm5pbmcgIkVuYWJsZSBDT05GSUdfRFJNX0FNRF9EQyBmb3IgZGlzcGxheSBzdXBwb3J0IG9u
IG5hdmkuIgogI2VuZGlmCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhf
djEwXzBfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2Rt
YV92NV8wX2lwX2Jsb2NrKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDg3MTUy
ZDhlZjBkZi4uOTBmYjAxNDlmYmVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAg
LTY0OSw4ICs2NDksNiBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQogCQllbHNlIGlmIChh
bWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKQogCQkJYW1kZ3B1X2RldmljZV9pcF9i
bG9ja19hZGQoYWRldiwgJmRtX2lwX2Jsb2NrKTsKLSNlbHNlCi0jCXdhcm5pbmcgIkVuYWJsZSBD
T05GSUdfRFJNX0FNRF9EQyBmb3IgZGlzcGxheSBzdXBwb3J0IG9uIFNPQzE1LiIKICNlbmRpZgog
CQlpZiAoIShhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjAgJiYgYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpKSkgewogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnV2ZF92N18w
X2lwX2Jsb2NrKTsKQEAgLTY3MSw4ICs2NjksNiBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2Nrcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RD
KQogCQllbHNlIGlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKQogCQkJYW1k
Z3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRtX2lwX2Jsb2NrKTsKLSNlbHNlCi0jCXdh
cm5pbmcgIkVuYWJsZSBDT05GSUdfRFJNX0FNRF9EQyBmb3IgZGlzcGxheSBzdXBwb3J0IG9uIFNP
QzE1LiIKICNlbmRpZgogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmNuX3Yx
XzBfaXBfYmxvY2spOwogCQlicmVhazsKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
