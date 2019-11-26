Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D110A0BA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF736E40D;
	Tue, 26 Nov 2019 14:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24D16E40D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:52:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u18so3515200wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 06:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xweiGSuvThKVu7U2RkNLBfb0IXyT6WkMpnBhXhpVMw8=;
 b=pksRJmkU/9052kluHYHrT8i3irt/v4Wm6bLQK3BWF3boHT28+SzGsqAIF9VE0MBwyq
 UmwCQpAQspvwCMgk6+3q8EDMMlfQbQ4LbqIXj/8gBHlb0wEoFGh4kJ/hBllF5MLjh+2q
 E35hQ1zqMX1Oyw/vTUaFciKTjnIrJe4IkxrpnHTsPJfCozFXcmTxoTuqCUvdJ/QqIbqO
 zpkr71qXOl1nW4clvFmDhWLKgPSOJ4ckfycZgq5QlDLw/SXOTGgQMTVKk1Sn6MWT2po5
 3yV+pwNGL9beNID1QdyM67abrBXNxlX+R+hfXFqsLs5s1wgXZAqYu17cri6jt7idhi73
 +SCw==
X-Gm-Message-State: APjAAAVIWEwgmeS+BUOjeRSIcnvGV+1XN9ybH4PFBspGeySgavl6UqwJ
 TRmJM6GFjrqI/VnlmAzSD3yfQ4KZbBo=
X-Google-Smtp-Source: APXvYqxOvy4UEyPxuUezVjn7GLgcVQDf+huA/SM+jXsqNvT8HpXI0zP9K7gWY3bxgJEpCNzOaTAU7A==
X-Received: by 2002:a1c:6485:: with SMTP id y127mr4702914wmb.19.1574779939881; 
 Tue, 26 Nov 2019 06:52:19 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 5sm3177674wmk.48.2019.11.26.06.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 06:52:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/rect: update kerneldoc for drm_rect_clip_scaled()
Date: Tue, 26 Nov 2019 15:52:13 +0100
Message-Id: <20191126145213.380079-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xweiGSuvThKVu7U2RkNLBfb0IXyT6WkMpnBhXhpVMw8=;
 b=UTz+2N/cByFOvu9fiCOtvi3io4YbzvH+OttZIKqb3iKAj3JIYULPIt0+EI3/OjWaeb
 JpkM6NtIYY0cVdmG2kVFCuAyrYuYu/R70C66v/weo7X2vzohDRRNi2vgCYPNd8e5ad7x
 A30aTtpAipDEjaM4Oa1yeLzksUiQKfV9urTiI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXMgZm9yZ290dGVuIGluIGY5NmJkZjU2NGYzZSAoImRybS9yZWN0OiBIYW5kbGUgcm91
bmRpbmcgZXJyb3JzCmluIGRybV9yZWN0X2NsaXBfc2NhbGVkLCB2My4iKQoKU3BvdHRlZCB3aGls
ZSByZXZpZXdpbmcgcGF0Y2hlcyBmcm9tIFZpbGxlIHRvdWNoaW5nIHRoaXMgYXJlYS4KCkZpeGVz
OiBmOTZiZGY1NjRmM2UgKCJkcm0vcmVjdDogSGFuZGxlIHJvdW5kaW5nIGVycm9ycyBpbiBkcm1f
cmVjdF9jbGlwX3NjYWxlZCwgdjMuIikKQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4u
Z2FpZ25hcmRAc3QuY29tPgpDYzogVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIHwgNiArKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwpp
bmRleCBiODM2M2FhYTkwMzIuLmU2ZTY0MGYyZDVlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9yZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKQEAgLTczLDEx
ICs3MywxMyBAQCBzdGF0aWMgdTMyIGNsaXBfc2NhbGVkKHUzMiBzcmMsIHUzMiBkc3QsIHUzMiBj
bGlwKQogICogQGNsaXA6IGNsaXAgcmVjdGFuZ2xlCiAgKgogICogQ2xpcCByZWN0YW5nbGUgQGRz
dCBieSByZWN0YW5nbGUgQGNsaXAuIENsaXAgcmVjdGFuZ2xlIEBzcmMgYnkgdGhlCi0gKiBzYW1l
IGFtb3VudHMgbXVsdGlwbGllZCBieSBAaHNjYWxlIGFuZCBAdnNjYWxlLgorICogdGhlIGNvcnJl
c3BvbmRpbmcgYW1vdW50cywgcmV0YWluaW5nIHRoZSB2ZXJ0aWNhbCBhbmQgaG9yaXpvbnRhbCBz
Y2FsaW5nCisgKiBmYWN0b3JzIGZyb20gQHNyYyB0byBAZHN0LgogICoKICAqIFJFVFVSTlM6Cisg
KgogICogJXRydWUgaWYgcmVjdGFuZ2xlIEBkc3QgaXMgc3RpbGwgdmlzaWJsZSBhZnRlciBiZWlu
ZyBjbGlwcGVkLAotICogJWZhbHNlIG90aGVyd2lzZQorICogJWZhbHNlIG90aGVyd2lzZS4KICAq
LwogYm9vbCBkcm1fcmVjdF9jbGlwX3NjYWxlZChzdHJ1Y3QgZHJtX3JlY3QgKnNyYywgc3RydWN0
IGRybV9yZWN0ICpkc3QsCiAJCQkgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCkKLS0gCjIu
MjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
