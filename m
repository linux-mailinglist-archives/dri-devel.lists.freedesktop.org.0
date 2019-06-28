Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7759891
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBF66E8D4;
	Fri, 28 Jun 2019 10:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD606E8D4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:40:04 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MEmMt-1hneqR1qUl-00GHwL; Fri, 28 Jun 2019 12:39:28 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: connector: remove bogus NULL check
Date: Fri, 28 Jun 2019 12:39:05 +0200
Message-Id: <20190628103925.2686249-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:G+y7LV1vsF/Vm55AUncbp7hvJIftzjKCKc7IizEy2E4LX7bp3+s
 Zw7dhRDtUzvEZDId+yfWbpw7nAAKWql8TNlnL1aGyNF4xHXL7NKNptNoY9TGI+Imy9RymzU
 AdTEA6pt6PQT+Me+UmPcFCEuOmU1kr4EdP7bU4i4bQ+Da1W4IrqtrFTFJeF2EfQV+QQRbba
 vqpPkiNLkJs2Q2Mk+srmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:afF7kKP7CwA=:2IzTp9enG36FNhGD7pD+vz
 CJiQeyTns2tWzHZdGzNZz1vmnjcVF0b1fPoyB5mJl6KhNYkW4LDlOrn/beaVC5aaAa0rmATxD
 x2M3BrQXcYdB08bAUsttlahDS5JlcF/jgJ82LiM+CDmP5Xr7UQRx/hBooV+ujCaDFoNWz0NEE
 lOdoEdAUIBTz0nudc1sk6mZgph3PHth+BBxb6Jv/2CTS6+00MJCJiVw9f6QemhP4ljCxc93+2
 R+P8pQlnD2R3pGXn8c6Ya5KobpGDvnMISmpYVSjiYetnp0bRvpsmyt8T/RS4NZ44NHN9ntCql
 ZbfFxIx0oqY1TUTjAO7BeDhU8+F8/oBQw1ey2ohjRE9LcFvJJYXw5O8KSOBrMs06+diJPkmQM
 1JXExkme8h7pXdYx6rEoNFO+rxSMSNYxNOXGG/yJ/Q99IDsfnHZf5bdiav+U3/QxeDeICGnaF
 xGYetucBIBr+v4iIJ1Kn3D+lHJFfkhIVW+KYzfR7YIfvr7ckBivb3DASpqqKcjkm9zw8NlL44
 18flev/L1SVObA+e+bo1ml5DOV0t+Hv5tuPIk+JOob1vycIiB+LxodkAWk2pFst6ud7ts4Ydm
 LX1l+XP2mMuLPzE+O3/nNy5OPMD5am0ofKA7+q1/eRoA81QTufhDEYYRtw73GL7rM8qm+XRVS
 F+FlqOS8jbESNjPFwY4v4f8vzvx1MQn+Vgs74UoLU4ANk16HRJ05LxgVuzXPCXFX4X+HBzyiU
 BMrDZVYuJlrcBZXG72L43FgzJA3Rxo0E0mzBbA==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bW9kZS0+bmFtZSBpcyBhIGNoYXJhY3RlciBhcnJheSBpbiBhIHN0cnVjdHVyZSwgY2hlY2tpbmcg
aXQncwphZGRyZXNzIGlzIHBvaW50bGVzcyBhbmQgY2F1c2VzIGEgd2FybmluZyB3aXRoIHNvbWUg
Y29tcGlsZXJzOgoKZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYzoxNDQ6MTU6IGVycm9y
OiBhZGRyZXNzIG9mIGFycmF5ICdtb2RlLT5uYW1lJyB3aWxsIGFsd2F5cyBldmFsdWF0ZSB0byAn
dHJ1ZScKICAgICAgWy1XZXJyb3IsLVdwb2ludGVyLWJvb2wtY29udmVyc2lvbl0KICAgICAgICAg
ICAgICAgICAgICAgIG1vZGUtPm5hbWUgPyBtb2RlLT5uYW1lIDogIiIsCiAgICAgICAgICAgICAg
ICAgICAgICB+fn5+fn5efn5+IH4KaW5jbHVkZS9kcm0vZHJtX3ByaW50Lmg6MzY2OjI5OiBub3Rl
OiBleHBhbmRlZCBmcm9tIG1hY3JvICdEUk1fREVCVUdfS01TJwogICAgICAgIGRybV9kYmcoRFJN
X1VUX0tNUywgZm10LCAjI19fVkFfQVJHU19fKQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+CgpSZW1vdmUgdGhlIGNoZWNrIGhlcmUuCgpGaXhlczogM2FlZWIx
M2Q4OTk2ICgiZHJtL21vZGVzOiBTdXBwb3J0IG1vZGVzIG5hbWVzIG9uIHRoZSBjb21tYW5kIGxp
bmUiKQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCAz
YWZlZDU2Nzc5NDYuLmIzZjJjZjdlYWU5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC0x
NDEsNyArMTQxLDcgQEAgc3RhdGljIHZvaWQgZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2Rl
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAKIAlEUk1fREVCVUdfS01TKCJjbWRs
aW5lIG1vZGUgZm9yIGNvbm5lY3RvciAlcyAlcyAlZHglZEAlZEh6JXMlcyVzXG4iLAogCQkgICAg
ICBjb25uZWN0b3ItPm5hbWUsCi0JCSAgICAgIG1vZGUtPm5hbWUgPyBtb2RlLT5uYW1lIDogIiIs
CisJCSAgICAgIG1vZGUtPm5hbWUsCiAJCSAgICAgIG1vZGUtPnhyZXMsIG1vZGUtPnlyZXMsCiAJ
CSAgICAgIG1vZGUtPnJlZnJlc2hfc3BlY2lmaWVkID8gbW9kZS0+cmVmcmVzaCA6IDYwLAogCQkg
ICAgICBtb2RlLT5yYiA/ICIgcmVkdWNlZCBibGFua2luZyIgOiAiIiwKLS0gCjIuMjAuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
