Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16E107CF
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 14:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015C8932A;
	Wed,  1 May 2019 12:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DAE8932A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 12:15:17 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id e67so8517485pfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 05:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImxxJmJZjyprEUOS1cjM4Ta2GXS4CI4CNxI78EJ27HQ=;
 b=SfVmm8wOw369kjUw36rFnTu4EWlGQyHCbbi2snlMYtVo5oyEbJjsiWB3UlunNAawVA
 Aoq4FT04QUwwehFmra5qNA7k6AE1t0u2+8rzS98Z+/HMgpigS5B84ISMg9OADhj9FA2J
 yt16Ov8/8pHrMjqM1wsYOWC4bSj4BqLToyAEId0f77K30fiXKOfxhXgN8m2KorhJhpEI
 DI1rwdd/chps8e4sxs/+DDMDaxlEGXfNvFPBSET4yCWNFeNzOfZ7EJ2ne+Wy/CeUdEFg
 k+HUDSq8FvTFbKnKR4OSqvePqwmBo+GAUljgiVWwisv8DdUut+AHFeCoFHJYqgBfQAss
 DciQ==
X-Gm-Message-State: APjAAAV8aSa6k9zC66hodIfE3hLOBObr5hkB6m9tabx6lCv3AdHamhfW
 Cv3SHANfDuXjY/Mv7pdfsNNf2g==
X-Google-Smtp-Source: APXvYqyNB0l+GQo7QXQib2EIHiEhvT+0vDtje0/2NwWvm1V+uu1x/xfQ0ZhL3ZmGNupLIEaeNg+Zcw==
X-Received: by 2002:a63:dd58:: with SMTP id g24mr44137179pgj.161.1556712916601; 
 Wed, 01 May 2019 05:15:16 -0700 (PDT)
Received: from localhost.localdomain ([183.82.229.33])
 by smtp.gmail.com with ESMTPSA id e193sm71082978pgc.53.2019.05.01.05.15.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 05:15:15 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] drm/panel: simple: Add FriendlyELEC HD702E 800x1280 LCD
 panel
Date: Wed,  1 May 2019 17:44:47 +0530
Message-Id: <20190501121448.3812-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImxxJmJZjyprEUOS1cjM4Ta2GXS4CI4CNxI78EJ27HQ=;
 b=BwOW8AiQot0lzdxqOFplQZcvP1cnjIsyBA+ciOZuAAZqCqvmuxA+r809VDSoc6Nxm+
 DgK9efe9hfbxEWRzzK61cZ9vBwUIZxJFiII9DwHZIJ8QD4wL5C+d0hZd/e6PY3TO6BS0
 kItv6s2QKpCPJF6QwRzs5Xaf0efnBpPc2hlNc=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEQ3MDJFIGxjZCBpcyBGcmllbmRseUVMRUMgZGV2ZWxvcGVkIGVEUCBMQ0QgcGFuZWwgd2l0aCA4
MDB4MTI4MApyZXNvbHV0aW9uLiBJdCBoYXMgYnVpbHQgaW4gR29vZGl4LCBHVDkyNzEgY2FwdGl2
ZSB0b3VjaHNjcmVlbgp3aXRoIGJhY2tsaWdodCBhZGp1c3RhYmxlIHZpYSBQV00uCgpBZGQgc3Vw
cG9ydCBmb3IgaXQuCgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNv
bT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVr
aSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvZnJp
ZW5kbHlhcm0saGQ3MDJlLnR4dCAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jICAgICAgICAgIHwgMjYgKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2ZyaWVu
ZGx5YXJtLGhkNzAyZS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9mcmllbmRseWFybSxoZDcwMmUudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZnJpZW5kbHlhcm0saGQ3MDJl
LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjY3MzQ5ZDdmNzli
ZQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2ZyaWVuZGx5YXJtLGhkNzAyZS50eHQKQEAgLTAsMCArMSwyOSBAQAorRnJp
ZW5kbHlFTEVDIEhENzAyRSA4MDB4MTI4MCBMQ0QgcGFuZWwKKworSEQ3MDJFIGxjZCBpcyBGcmll
bmRseUVMRUMgZGV2ZWxvcGVkIGVEUCBMQ0QgcGFuZWwgd2l0aCA4MDB4MTI4MAorcmVzb2x1dGlv
bi4gSXQgaGFzIGJ1aWx0IGluIEdvb2RpeCwgR1Q5MjcxIGNhcHRpdmUgdG91Y2hzY3JlZW4KK3dp
dGggYmFja2xpZ2h0IGFkanVzdGFibGUgdmlhIFBXTS4KKworUmVxdWlyZWQgcHJvcGVydGllczoK
Ky0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJmcmllbmRseWFybSxoZDcwMmUiCistIHBvd2VyLXN1
cHBseTogcmVndWxhdG9yIHRvIHByb3ZpZGUgdGhlIHN1cHBseSB2b2x0YWdlCisKK09wdGlvbmFs
IHByb3BlcnRpZXM6CistIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRldmlj
ZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKworT3B0aW9uYWwgbm9kZXM6CistIFZpZGVvIHBvcnQg
Zm9yIExDRCBwYW5lbCBpbnB1dC4KKworRXhhbXBsZToKKworCXBhbmVsIHsKKwkJY29tcGF0aWJs
ZSA9ImZyaWVuZGx5YXJtLGhkNzAyZSI7CisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKKwkJ
cG93ZXItc3VwcGx5ID0gPCZ2Y2MzdjNfc3lzPjsKKworCQlwb3J0IHsKKwkJCXBhbmVsX2luX2Vk
cDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZWRwX291dF9wYW5lbD47CisJ
CQl9OworCQl9OworCX07CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggOWU4
MjE4ZjZhM2YyLi45ZGIzYzBjNjVlZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMKQEAgLTExODQsNiArMTE4NCwyOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mg
Zm94bGlua19mbDUwMHd2cjAwX2EwdCA9IHsKIAkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRf
UkdCODg4XzFYMjQsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
ZnJpZW5kbHlhcm1faGQ3MDJlX21vZGUgPSB7CisJLmNsb2NrCQk9IDY3MTg1LAorCS5oZGlzcGxh
eQk9IDgwMCwKKwkuaHN5bmNfc3RhcnQJPSA4MDAgKyAyMCwKKwkuaHN5bmNfZW5kCT0gODAwICsg
MjAgKyAyNCwKKwkuaHRvdGFsCQk9IDgwMCArIDIwICsgMjQgKyAyMCwKKwkudmRpc3BsYXkJPSAx
MjgwLAorCS52c3luY19zdGFydAk9IDEyODAgKyA0LAorCS52c3luY19lbmQJPSAxMjgwICsgNCAr
IDgsCisJLnZ0b3RhbAkJPSAxMjgwICsgNCArIDggKyA0LAorCS52cmVmcmVzaAk9IDYwLAorCS5m
bGFncyAJCT0gRFJNX01PREVfRkxBR19OVlNZTkMgfCBEUk1fTU9ERV9GTEFHX05IU1lOQywKK307
CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBmcmllbmRseWFybV9oZDcwMmUgPSB7
CisJLm1vZGVzID0gJmZyaWVuZGx5YXJtX2hkNzAyZV9tb2RlLAorCS5udW1fbW9kZXMgPSAxLAor
CS5zaXplID0geworCQkud2lkdGgJPSA5NCwKKwkJLmhlaWdodAk9IDE1MSwKKwl9LAorfTsKKwog
c3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGdpYW50cGx1c19ncGc0ODI3Mzlx
czVfbW9kZSA9IHsKIAkuY2xvY2sgPSA5MDAwLAogCS5oZGlzcGxheSA9IDQ4MCwKQEAgLTI2MzQs
NiArMjY1Nyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29m
X21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJlZHQsZXRtMDcwMGcwZWRoNiIs
CiAJCS5kYXRhID0gJmVkdF9ldG0wNzAwZzBiZGg2LAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAi
ZnJpZW5kbHlhcm0saGQ3MDJlIiwKKwkJLmRhdGEgPSAmZnJpZW5kbHlhcm1faGQ3MDJlLAogCX0s
IHsKIAkJLmNvbXBhdGlibGUgPSAiZm94bGluayxmbDUwMHd2cjAwLWEwdCIsCiAJCS5kYXRhID0g
JmZveGxpbmtfZmw1MDB3dnIwMF9hMHQsCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
