Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23411B529C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 18:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5059E6ECF8;
	Tue, 17 Sep 2019 16:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D264C6ECF8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 16:12:29 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b19so8983310iob.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MeCcoXMCEze80Bl3xggqeDeE3aKjlz0D7xrnRXvSz50=;
 b=L+UX/VRGfUC754IK/Lzz8aA8mRnf6OXPppZWHCULt5cJpDly4AuNnFOo0QX/mTFvEM
 1wea/i8ObyORaXn5lnsaHJWk1T/BKD0rWhKk2HiNZAo9zXxfgiD9kQ7jWtgaZswjURB/
 djmTaas7KrmcnCeEUd/gX3og9AjHW63pQIHEYQ8T0Hep3qmF5RutsL5O1pzO9WP2L6Eg
 tFxxEd9qNA9E0Ukijl7Tn/LQfxw0W2vHuVxWxaYijyLP+iA479W/EAOcxbpF9jGUn3t8
 P8Ze/rbKC4nJ+toJjIXLZ5XUB72HzPuwVTYHLIGgYl9+TE+CQhEopfVFhSZ2+6IeQnE6
 kw1A==
X-Gm-Message-State: APjAAAV+n8/kiZiM7rAN6HTHIxZGYqjoonqJla9jiGBZ3wPeiXck4HuZ
 1DB/olbrW1kTm3Kxs7FLVdcBcEk7ypa0oA==
X-Google-Smtp-Source: APXvYqy18s+Gh6RSCdBqHLdIA20bXqdc0iO0ZL76QMlGSl93FwBpVFflu0PIfUb3+kuezZYYc95Iiw==
X-Received: by 2002:a5d:9956:: with SMTP id v22mr4304351ios.27.1568736748634; 
 Tue, 17 Sep 2019 09:12:28 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id p25sm2090487ioo.35.2019.09.17.09.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 09:12:27 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date: Tue, 17 Sep 2019 11:12:11 -0500
Message-Id: <20190917161214.2913-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MeCcoXMCEze80Bl3xggqeDeE3aKjlz0D7xrnRXvSz50=;
 b=tdxiAs3nS/HFbj/DnmJeqprShjlCUPDO/gKB3EjOJ0I68afG8KHwKw5RDFiCNDld2d
 1jxQ6jGrcC/yklXj6kEa70e85VPQoP4Kj/ndgRJEwUloLOz6XC7Qm325QBl2KlmUGB0U
 8A6myYwT0/IjL/2oiVzNLhBrZFN+xToynXQdAuo+m2MWqEVDjBQPSs596Mw+Noy+YeLT
 LpEJAPE8sPhh8IK9Jw4NEmeDyE07xhCLoqlur1cbNtqaQD2W7DCs5dtB63L7lTN6vxE1
 KzSjJ539vD+auBG3Ig5Jk/uTszD+oFbJ2tjG2e5/fax5mSQOzbK9QXmnRbVSumDiWZtU
 u5aA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 adam.ford@logicpd.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJldmlvdXNseSwgdGhlcmUgd2FzIGFuIG9tYXAgcGFuZWwtZHBpIGRyaXZlciB0aGF0IHdvdWxk
CnJlYWQgZ2VuZXJpYyB0aW1pbmdzIGZyb20gdGhlIGRldmljZSB0cmVlIGFuZCBzZXQgdGhlIGRp
c3BsYXkKdGltaW5nIGFjY29yZGluZ2x5LiAgVGhpcyBkcml2ZXIgd2FzIHJlbW92ZWQgc28gdGhl
IHNjcmVlbgpubyBsb25nZXIgZnVuY3Rpb25zLiAgVGhpcyBwYXRjaCBtb2RpZmllcyB0aGUgcGFu
ZWwtc2ltcGxlCmZpbGUgdG8gc2V0dXAgdGhlIHRpbWluZ3MgdG8gdGhlIHNhbWUgdmFsdWVzIHBy
ZXZpb3VzbHkgdXNlZC4KCkZpeGVzOiA4YmY0YjE2MjExNzggKCJkcm0vb21hcDogUmVtb3ZlIHBh
bmVsLWRwaSBkcml2ZXIiKQoKU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFp
bC5jb20+CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCmluZGV4IDVhOTNjNGVkZjFl
NC4uYzg2YzMwZjNhOGExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBAIC0x
OTAwLDYgKzE5MDAsNDAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG1p
dHN1YmlzaGlfYWEwNzBtYzAxX21vZGUgPSB7CiAJLmZsYWdzID0gRFJNX01PREVfRkxBR19OSFNZ
TkMgfCBEUk1fTU9ERV9GTEFHX05WU1lOQywKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSBsb2dpY3BkX3R5cGVfMjhfbW9kZSA9IHsKKwkuY2xvY2sgPSA5MDAwLAor
CS5oZGlzcGxheSA9IDQ4MCwKKwkuaHN5bmNfc3RhcnQgPSA0ODAgKyAzLAorCS5oc3luY19lbmQg
PSA0ODAgKyAzICsgNDIsCisJLmh0b3RhbCA9IDQ4MCArIDMgKyA0MiArIDIsCisKKwkudmRpc3Bs
YXkgPSAyNzIsCisJLnZzeW5jX3N0YXJ0ID0gMjcyICsgMiwKKwkudnN5bmNfZW5kID0gMjcyICsg
MiArIDExLAorCS52dG90YWwgPSAyNzIgKyAyICsgMTEgKyAzLAorCS52cmVmcmVzaCA9IDYwLAor
CS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01PREVfRkxBR19QVlNZTkMsCit9
OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgbG9naWNwZF90eXBlXzI4ID0gewor
CS5tb2RlcyA9ICZsb2dpY3BkX3R5cGVfMjhfbW9kZSwKKwkubnVtX21vZGVzID0gMSwKKwkuYnBj
ID0gOCwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gMTA1LAorCQkuaGVpZ2h0ID0gNjcsCisJfSwK
KwkuZGVsYXkgPSB7CisJCS5wcmVwYXJlID0gMjAwLAorCQkuZW5hYmxlID0gMjAwLAorCQkudW5w
cmVwYXJlID0gMjAwLAorCQkuZGlzYWJsZSA9IDIwMCwKKwl9LAorCS5idXNfZm9ybWF0ID0gTUVE
SUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJ
R0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9QT1NFREdFIHwKKwkJICAgICBEUk1fQlVT
X0ZMQUdfU1lOQ19EUklWRV9ORUdFREdFLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5l
bF9kZXNjIG1pdHN1YmlzaGlfYWEwNzBtYzAxID0gewogCS5tb2RlcyA9ICZtaXRzdWJpc2hpX2Fh
MDcwbWMwMV9tb2RlLAogCS5udW1fbW9kZXMgPSAxLApAQCAtMjk0OCw2ICsyOTgyLDkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKIAl9
LCB7CiAJCS5jb21wYXRpYmxlID0gImxnLGxwMTI5cWUiLAogCQkuZGF0YSA9ICZsZ19scDEyOXFl
LAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAibG9naWNwZCx0eXBlMjgiLAorCQkuZGF0YSA9ICZs
b2dpY3BkX3R5cGVfMjgsCiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJtaXRzdWJpc2hpLGFhMDcw
bWMwMS1jYTEiLAogCQkuZGF0YSA9ICZtaXRzdWJpc2hpX2FhMDcwbWMwMSwKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
