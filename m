Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088437D3D1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADA26E336;
	Thu,  1 Aug 2019 03:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E306E33D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:44:51 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t132so33262170pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uNdkweGhIzbmbLSCXzyijf1WMLgtz0ZE8h2SpBy/OLo=;
 b=XKo1ZWyC3vCOYThdoe2l1xpeQ0RnsaClWpuprGQRKpZVIAxzysm1BIkicTXkjazub3
 lhYhjIDhmnXF7ImduioDvQNChe3lXdcR42qZuZ489S90NbD/jFieIRnP4BsinsMt6zQr
 ZIGkPO8d2Wg3MAzzhFsSNoFi0KYutV+SzQpUbWj5cRMFVhiv0XVxHXYPKFGbIF2rHfot
 GssGO2HRW5c30MYOJyNDPAnRfctZ5HAEsrC1JmV7sb115MxhPlW1Vm3t0tTT0Wpj6ehN
 w8FZF5URUjHjUoIQj/eg0CvWUIxoKzwTFymzQs2/WNnMNQRZmuFeu9ra2MrQxBabIKRR
 9l6w==
X-Gm-Message-State: APjAAAV+ubHOxta7G4Rif6BrzGLzMghyFInvp8OXyQmXLSkApoMCn9pq
 7zRZSB5ocxAJZtCdc2ufR05SfQ==
X-Google-Smtp-Source: APXvYqwfB0iIhvHh7a7X5V8dzwGo5czS7fwWeWmrOVxTrJtTjuJRuF+OuaL2VM1n+uRJALrGYlIXlg==
X-Received: by 2002:a63:5c7:: with SMTP id 190mr114581537pgf.67.1564631090362; 
 Wed, 31 Jul 2019 20:44:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.44.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:44:49 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 03/26] drm: kirin: Remove HISI_KIRIN_DW_DSI config option
Date: Thu,  1 Aug 2019 03:44:16 +0000
Message-Id: <20190801034439.98227-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uNdkweGhIzbmbLSCXzyijf1WMLgtz0ZE8h2SpBy/OLo=;
 b=OGB11FXENEPh4SmCX7T3rKxhiL7ZrFfQKMccbHnaw+keOQERXnl3rUByFY0rxtcueb
 0gdBDp+kCsm2S46pdTzAUICilsvpQQGV6ye2oC5RONILIawaN//cDfc03LgJgGMhUWMe
 V+KS3Mgx3imySjEAjQXBFLa3TkfagcjTDMPhiUekfuwKIqg7FSXYRljXiI0RoNZsHziK
 sPJmToqUHV0pCU5f/YNVRIwuowSyESH0WKkJl+gQKOvtltdhQLTBQmQiTxYEaofcRPvv
 WzH7U4dT8+o9PR62Dv3+X6eK4loTM75es89zSiCneXGMPJUqwlyOz0Ef/PZhme7Lnk00
 SR3Q==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIENPTkZJR19ISVNJX0tJUklOX0RXX0RTSSBvcHRpb24gaXMgb25seSB1c2VkIHcvIGtpcmlu
CmRyaXZlciwgc28gY3V0IG91dCB0aGUgbWlkZGxlbWFuIGFuZCBjb25kZW5zZSB0aGUgY29uZmln
CmxvZ2ljIGRvd24uCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25ncm9uZ0BnbWFpbC5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxq
b2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2ly
aW4vS2NvbmZpZyAgfCAxMCArLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tp
cmluL01ha2VmaWxlIHwgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24v
a2lyaW4vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vS2NvbmZpZwpp
bmRleCAwZmEyOWFmMDhhZDAuLjI5MDU1M2UyZjZiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9raXJpbi9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4vS2NvbmZpZwpAQCAtNSwxNiArNSw4IEBAIGNvbmZpZyBEUk1fSElTSV9LSVJJTgog
CXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBEUk1fR0VNX0NNQV9IRUxQRVIKIAlzZWxl
Y3QgRFJNX0tNU19DTUFfSEVMUEVSCi0Jc2VsZWN0IEhJU0lfS0lSSU5fRFdfRFNJCisJc2VsZWN0
IERSTV9NSVBJX0RTSQogCWhlbHAKIAkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBh
IGhpc2lsaWNvbiBLaXJpbiBjaGlwc2V0cyhoaTYyMjApLgogCSAgSWYgTSBpcyBzZWxlY3RlZCB0
aGUgbW9kdWxlIHdpbGwgYmUgY2FsbGVkIGtpcmluLWRybS4KIAotY29uZmlnIEhJU0lfS0lSSU5f
RFdfRFNJCi0JdHJpc3RhdGUgIkhpU2lsaWNvbiBLaXJpbiBzcGVjaWZpYyBleHRlbnNpb25zIGZv
ciBTeW5vcHN5cyBEVyBNSVBJIERTSSIKLQlkZXBlbmRzIG9uIERSTV9ISVNJX0tJUklOCi0Jc2Vs
ZWN0IERSTV9NSVBJX0RTSQotCWhlbHAKLQkgVGhpcyBzZWxlY3RzIHN1cHBvcnQgZm9yIEhpU2ls
aWNvbiBLaXJpbiBTb0Mgc3BlY2lmaWMgZXh0ZW5zaW9ucyBmb3IKLQkgdGhlIFN5bm9wc3lzIERl
c2lnbldhcmUgRFNJIGRyaXZlci4gSWYgeW91IHdhbnQgdG8gZW5hYmxlIE1JUEkgRFNJIG9uCi0J
IGhpNjIyMCBiYXNlZCBTb0MsIHlvdSBzaG91bGQgc2VsZXQgdGhpcyBvcHRpb24uCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL01ha2VmaWxlIGIvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9raXJpbi9NYWtlZmlsZQppbmRleCBjMDUwMWZhM2ZlNTMuLmM1MDYw
NmNmYmJkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9NYWtl
ZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL01ha2VmaWxlCkBAIC0x
LDcgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiBraXJp
bi1kcm0teSA6PSBraXJpbl9kcm1fZHJ2Lm8gXAotCSAgICAgICBraXJpbl9kcm1fYWRlLm8KKwkg
ICAgICAga2lyaW5fZHJtX2FkZS5vIFwKKwkgICAgICAgZHdfZHJtX2RzaS5vCiAKIG9iai0kKENP
TkZJR19EUk1fSElTSV9LSVJJTikgKz0ga2lyaW4tZHJtLm8KIAotb2JqLSQoQ09ORklHX0hJU0lf
S0lSSU5fRFdfRFNJKSArPSBkd19kcm1fZHNpLm8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
