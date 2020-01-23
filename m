Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA4146A33
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 15:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAC96FCD5;
	Thu, 23 Jan 2020 13:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151106FCCB;
 Thu, 23 Jan 2020 13:59:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 127B7B354;
 Thu, 23 Jan 2020 13:59:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v4 01/22] drm: Remove internal setup of struct
 drm_device.vblank_disable_immediate
Date: Thu, 23 Jan 2020 14:59:22 +0100
Message-Id: <20200123135943.24140-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VkJMQU5LIGludGVycnVwdHMgY2FuIGJlIGRpc2FibGVkIGltbWVkaWF0ZWx5IG9yIHdpdGggYSBk
ZWxheSwgd2hlcmUgdGhlCmxhdHRlciBpcyB0aGUgZGVmYXVsdC4gVGhlIGZvcm1lciBvcHRpb24g
Y2FuIGJlIHNlbGVjdGVkIGJ5IHNldHRpbmcKZ2V0X3ZibGFua190aW1lc3RhbXAgYW5kIGVuYWJs
aW5nIHZibGFua19kaXNhYmxlX2ltbWVkaWF0ZSBpbiBzdHJ1Y3QKZHJtX2RldmljZS4gU2ltcGxp
ZnkgdGhlIGNvZGUgaW4gcHJlcGFyYXRpb24gb2YgdGhlIHJlbW92YWwgb2Ygc3RydWN0CmRybV9k
ZXZpY2UuZ2V0X3ZibGFua190aW1lc3RhbXAuCgp2MzoKCSogcmVtb3ZlIGludGVybmFsIHNldHVw
IG9mIHZibGFua19kaXNhYmxlX2ltbWVkaWF0ZQoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMgfCAxMyAtLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggMTY1OWIxM2IxNzhjLi4zMjZkYjUyZjJhZDggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV92YmxhbmsuYwpAQCAtNDgwLDE5ICs0ODAsNiBAQCBpbnQgZHJtX3ZibGFua19pbml0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBudW1fY3J0Y3MpCiAKIAlEUk1f
SU5GTygiU3VwcG9ydHMgdmJsYW5rIHRpbWVzdGFtcCBjYWNoaW5nIFJldiAyICgyMS4xMC4yMDEz
KS5cbiIpOwogCi0JLyogRHJpdmVyIHNwZWNpZmljIGhpZ2gtcHJlY2lzaW9uIHZibGFuayB0aW1l
c3RhbXBpbmcgc3VwcG9ydGVkPyAqLwotCWlmIChkZXYtPmRyaXZlci0+Z2V0X3ZibGFua190aW1l
c3RhbXApCi0JCURSTV9JTkZPKCJEcml2ZXIgc3VwcG9ydHMgcHJlY2lzZSB2YmxhbmsgdGltZXN0
YW1wIHF1ZXJ5LlxuIik7Ci0JZWxzZQotCQlEUk1fSU5GTygiTm8gZHJpdmVyIHN1cHBvcnQgZm9y
IHZibGFuayB0aW1lc3RhbXAgcXVlcnkuXG4iKTsKLQotCS8qIE11c3QgaGF2ZSBwcmVjaXNlIHRp
bWVzdGFtcGluZyBmb3IgcmVsaWFibGUgdmJsYW5rIGluc3RhbnQgZGlzYWJsZSAqLwotCWlmIChk
ZXYtPnZibGFua19kaXNhYmxlX2ltbWVkaWF0ZSAmJiAhZGV2LT5kcml2ZXItPmdldF92Ymxhbmtf
dGltZXN0YW1wKSB7Ci0JCWRldi0+dmJsYW5rX2Rpc2FibGVfaW1tZWRpYXRlID0gZmFsc2U7Ci0J
CURSTV9JTkZPKCJTZXR0aW5nIHZibGFua19kaXNhYmxlX2ltbWVkaWF0ZSB0byBmYWxzZSBiZWNh
dXNlICIKLQkJCSAiZ2V0X3ZibGFua190aW1lc3RhbXAgPT0gTlVMTFxuIik7Ci0JfQotCiAJcmV0
dXJuIDA7CiAKIGVycjoKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
