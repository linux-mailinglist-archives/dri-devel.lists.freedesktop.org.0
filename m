Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD15DC87B8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E50F899B5;
	Wed,  2 Oct 2019 12:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76488899B5;
 Wed,  2 Oct 2019 12:02:38 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MQ5nE-1iSsrQ1Bbs-00M5vI; Wed, 02 Oct 2019 14:02:32 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/6] drm/amdgpu: hide another #warning
Date: Wed,  2 Oct 2019 14:01:23 +0200
Message-Id: <20191002120136.1777161-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191002120136.1777161-1-arnd@arndb.de>
References: <20191002120136.1777161-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NGWmbgtBQPd36ajMsUKwWTLmLmAiDhXD+Mtxk8YE6bumOY91z5j
 ElTVg9ErXeu19zyaJjHShChe33oD/sZNS+NC2xYgJxGSP+Cv3fiUPnJQyoF55GFnKYLRXfE
 2W6ePyEZZZnJqvhJcnEYxyIsGj4XVU0SqmkvNUws9vUBxgum1tpeEkHDr3eU9mOfpWs5/qK
 c2OuGSj7VRRq4HZWHmlZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tHfRN4OBGvs=:fW2ZMTKDtL5J46tSOTYwo7
 hI7G13ULkv0U0gsFqYPM7VIrS2vVTeLAAKk8Zocotl1a26VnKSzf9ACjbySMHLqn/YLFLM/an
 jeeK1w0O6FziurC6udZLBxSQ+w0xuShgNAS0dmb85TNlZUEbFIPBKcifVb3SOOLztBaPCGUoS
 NoehdFJs+5F06tEFkYh7RwCws57iJl9IDF36NDU172d0j651NCYKxiRTwuVJwq8v1pMMgNB5F
 GsyPI9invPbWQ3Qabv8Vl541BCJz9kq9SiLAynFCEGBppk4/2heBNKiysrhzUyY1GCFXFTpyR
 jm8R4mSKoHnYymZBfQmM21Ya5YRoWOxjZlL5b29/a/vCjHR60Mbhn6O4fWvYjFyKZM+oeDBHm
 jvmamJcUpz4LrKYPTScimQTnJiMNSF6TegjnGok+Avkuq6CXLEt76q7OcOrdcL3RlIj8N3Z93
 0Mcr4Ca4s6pOIPFYp2MpBCsdAc496jndQymEUZ1kzL+QHE2Vm189XY8O8uy3FO62o9wg6jW8r
 20Z2Rigz+n98Qn70o/GL7dR0t6pn5/+Ah8CUB8BUj7UuRb4B5Y1r204f9PrdCZoJd1bxNtGv1
 T/35lymzxTtG0LHfNqneYlv6dW8w81olD7OcLsd8EpnRNH21ddoiXrNZzEMkRJYeEK2UZvYN6
 v4BAKGf6lXNAe8dPzPVonqnshdSOGTOcS/U6YliDF3sFT3NUiOwme5Svxk92FTSkEJ+jGVWle
 zPH8uxRgIf9rDysK359hEjmf07lC2vhIYljzmzZSr4bZGDx2dka+aX71oDLFS+QXMs3GTAdRB
 gGHLG73VBU/aKAB1EmzCuuwYNDAJcYU/AGCdbyVwGlLKwDQX9iLOiFzUNQOoVeVwDVO2oo8tH
 jD/cUlQlPEXbqVI5PSqg==
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Roman Li <Roman.Li@amd.com>,
 clang-built-linux@googlegroups.com, Prike Liang <Prike.Liang@amd.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW4gZWFybGllciBwYXRjaCBvZiBtaW5lIGRpc2FibGVkIHNvbWUgI3dhcm5pbmcgc3RhdGVtZW50
cwp0aGF0IGdldCBpbiB0aGUgd2F5IG9mIGJ1aWxkIHRlc3RpbmcsIGJ1dCB0aGVuIGFub3RoZXIK
aW5zdGFuY2Ugd2FzIGFkZGVkIGFyb3VuZCB0aGUgc2FtZSB0aW1lLgoKUmVtb3ZlIHRoYXQgYXMg
d2VsbC4KCkZpeGVzOiBiNTIwM2QxNmFlZjQgKCJkcm0vYW1kL2FtZGdwdTogaGlkZSAjd2Fybmlu
ZyBmb3IgbWlzc2luZyBEQyBjb25maWciKQpGaXhlczogZTFjMTRjNDMzOTVjICgiZHJtL2FtZGdw
dTogRW5hYmxlIERDIG9uIFJlbm9pciIpClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDIg
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCmluZGV4IGY3MDY1OGE1MzZhOS4uYTMzN2Q5ODBiNDM0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMKQEAgLTc3MSw4ICs3NzEsNiBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2Nr
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1E
X0RDKQogICAgICAgICAgICAgICAgIGVsc2UgaWYgKGFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBv
cnQoYWRldikpCiAgICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmZG1faXBfYmxvY2spOwotI2Vsc2UKLSMgICAgICAgd2FybmluZyAiRW5hYmxl
IENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5IHN1cHBvcnQgb24gU09DMTUuIgogI2VuZGlm
CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2Y25fdjJfMF9pcF9ibG9jayk7
CiAJCWJyZWFrOwotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
