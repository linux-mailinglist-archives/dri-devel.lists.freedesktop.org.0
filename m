Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3986B1EA025
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38B789E23;
	Mon,  1 Jun 2020 08:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748FD89E23
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:33:18 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z6so7014911ljm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kLQcKKjC8Y9Z0GEOnV9EPdgB2M7ivV6RG54qq29vMQ=;
 b=DmLMBRLPEz91iPHytYStoDFHmdTez2DBjv6owsNsvgAVHR8MicRpy6m0/h4vxVThvM
 BZf9sy3R4fs31LFZuWX2ffmkXuaX0auYuWXbpCBdg8gJHoUKIPEE5ADgHd0mgmGXq61l
 OMjD2O9Hu4jv1nXyB2ldiIyzNUNZpqGAEihFlBaiH7/P6zE/QSoeLqzs4F7XJzJXyOPw
 /Udh0rbVRyOjo6ZAy//BJ9Fyopjv0Mng/wtHsmnf8pkoRp+I3MlhSEyEN2+PAWr1I/E/
 ktVMCEDE4q+hnmE5zwVmJRJBdRgLx047X03Gt5Dl74tbB//CsDVr9nXPHCOjO2Pa0CC/
 n1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/kLQcKKjC8Y9Z0GEOnV9EPdgB2M7ivV6RG54qq29vMQ=;
 b=dTT0k7IOvyCRUkT07b6UwCisz6xDnwoEgMzbuWZzOuPFW6FWa9QlQGQZx07HHk5GE1
 oDt3YfvIWFuzg7WRWcoL6RLRFvFNk+MK9C2S2y/8ukMlOAZqit7nJoNEbUpEOY8QzvMP
 MwH1Jlh3+1SWfpC4v6VPY6i42X6sxQC5si6ZuJ1bhFdOd7MsrnFxn3mgzNb+iAVNSvWh
 G3KpFWShST/Qdact1Jn1jmo3y0WvSWUr36rVizlR0mRiJGdpyzV5TmW/IGzK4Epj3UuN
 ++IIBVcPdwgnBu/Z4Cml0FZETYzSGkLAkLMsHsOfzFIZXPDNw6WnZMgTEKhf9Cj9Nj/n
 PFJw==
X-Gm-Message-State: AOAM533iyIGauByiUVrN8Yry4R+RdSn42kYuOZiaDt93OTOsnIjYjIcn
 MJBK2kahJFtwLdfF0M28sS5pwTTpEpI=
X-Google-Smtp-Source: ABdhPJyJi+HROJJQQrz0+okTxyGvznRAyt8fJgTSPYmXkqYKGtpWoRY8SrNpBruLwP4jEgvZmkMq6w==
X-Received: by 2002:a2e:7d17:: with SMTP id y23mr10003521ljc.105.1591000396671; 
 Mon, 01 Jun 2020 01:33:16 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:33:16 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/6] drm: panel-simple: add Seiko 70WVW2T 7" simple panel
Date: Mon,  1 Jun 2020 10:33:05 +0200
Message-Id: <20200601083309.712606-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNlaWtvIDcwV1ZXMlQgaXMgYSBkaXNjb250aW51ZWQgcHJvZHVjdCwgYnV0IG1heSBiZSB1
c2VkIHNvbWV3aGVyZS4KVGVzdGVkIG9uIGEgcHJvcHJpZXRhcnkgcHJvZHVjdC4KClNpZ25lZC1v
ZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFPDuHJlbiBBbmRlcnNl
biA8c2FuQHNrb3YuZGs+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwu
Y29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCmluZGV4IGIwNjdmNjZjZWEwZS4uODYyNGJiODAxMDhjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBAIC0zMTk0LDYgKzMxOTQsMzEgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBwYW5lbF9kZXNjIHNoZWxseV9zY2EwNzAxMF9iZm5fbG5uID0gewogCS5idXNf
Zm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I2NjZfMVgxOCwKIH07CiAKK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzaWlfNzB3dncydF9tb2RlID0geworCS5jbG9jayA9IDMz
MDAwLAorCS5oZGlzcGxheSA9IDgwMCwKKwkuaHN5bmNfc3RhcnQgPSA4MDAgKyAyNTYsCisJLmhz
eW5jX2VuZCA9IDgwMCArIDI1NiArIDAsCisJLmh0b3RhbCA9IDgwMCArIDI1NiArIDAgKyAwLAor
CS52ZGlzcGxheSA9IDQ4MCwKKwkudnN5bmNfc3RhcnQgPSA0ODAgKyAwLAorCS52c3luY19lbmQg
PSA0ODAgKyAwICsgMCwKKwkudnRvdGFsID0gNDgwICsgMCArIDAgKyA0NSwKKwkuZmxhZ3MgPSBE
Uk1fTU9ERV9GTEFHX05WU1lOQyB8IERSTV9NT0RFX0ZMQUdfTkhTWU5DLAorfTsKKworc3RhdGlj
IGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHNpaV83MHd2dzJ0ID0geworCS5tb2RlcyA9ICZzaWlf
NzB3dncydF9tb2RlLAorCS5udW1fbW9kZXMgPSAxLAorCS5zaXplID0geworCQkud2lkdGggPSAx
NTIsCisJCS5oZWlnaHQgPSA5MSwKKwl9LAorCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9S
R0I4ODhfMVgyNCwKKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURHRSwK
KwkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJLAorfTsKKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHN0YXJyeV9rcjA3MHBlMnRfbW9kZSA9IHsK
IAkuY2xvY2sgPSAzMzAwMCwKIAkuaGRpc3BsYXkgPSA4MDAsCkBAIC0zODc3LDYgKzM5MDIsOSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0g
ewogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAic2hlbGx5LHNjYTA3MDEwLWJmbi1sbm4iLAogCQku
ZGF0YSA9ICZzaGVsbHlfc2NhMDcwMTBfYmZuX2xubiwKKwl9LCB7CisJCS5jb21wYXRpYmxlID0g
InNpaSw3MHd2dzJ0IiwKKwkJLmRhdGEgPSAmc2lpXzcwd3Z3MnQsCiAJfSwgewogCQkuY29tcGF0
aWJsZSA9ICJzdGFycnksa3IwNzBwZTJ0IiwKIAkJLmRhdGEgPSAmc3RhcnJ5X2tyMDcwcGUydCwK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
