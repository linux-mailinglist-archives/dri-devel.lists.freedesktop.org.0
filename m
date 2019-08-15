Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDE98E6CF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423256E90E;
	Thu, 15 Aug 2019 08:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7766E88E;
 Thu, 15 Aug 2019 00:49:18 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 794583EA24;
 Thu, 15 Aug 2019 00:49:17 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH RFC 10/11] ARM: dts: qcom: msm8974: add HDMI nodes
Date: Wed, 14 Aug 2019 20:48:53 -0400
Message-Id: <20190815004854.19860-11-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830158;
 bh=SH5QC5W6ScpXRbQk/bxm6ycmyn+BwV2nQJz7QhBnCZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CoHO95m541ra2JxESP14PeSWxmMgK/RpMhhr8BrHGVhrPUGGDrqK37N8b/0jiTLDW
 youqx3ITy0pDNSmzOq6fYOzWmozzih25HM3gNXN/FqaFK1jeYz+EIFR847fXVrQnCR
 YgR2Aw7pxnkRi1q/6SxJbh/X8xATgknLqCIchHQ4=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIEhETUkgdHggYW5kIHBoeSBub2RlcyB0byBzdXBwb3J0IGFuIGV4dGVybmFsIGRpc3BsYXkg
dGhhdCBjYW4gYmUKY29ubmVjdGVkIG92ZXIgdGhlIFNsaW1Qb3J0LiBUaGlzIGlzIGJhc2VkIG9u
IHdvcmsgZnJvbSBKb25hdGhhbiBNYXJlay4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8
bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KVGhlIGhkbWktdHggbm9kZSBpbiB0aGUgZG93bnN0
cmVhbSBNU00gc291cmNlczoKaHR0cHM6Ly9naXRodWIuY29tL0FJQ1Ava2VybmVsX2xnZV9oYW1t
ZXJoZWFkL2Jsb2IvbjcuMS9hcmNoL2FybS9ib290L2R0cy9tc204OTc0LW1kc3MuZHRzaSNMMTAx
CgogYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LmR0c2kgfCA4MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpCmluZGV4IDM2OWU1OGY2NDE0NS4uMzVjNTEzMzZhOWQ0
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQpAQCAtMTEzOSw2ICsxMTM5LDEzIEBA
CiAKIAkJCQkJcG9ydEAwIHsKIAkJCQkJCXJlZyA9IDwwPjsKKwkJCQkJCW1kcDVfaW50ZjNfb3V0
OiBlbmRwb2ludCB7CisJCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX2luPjsKKwkJCQkJ
CX07CisJCQkJCX07CisKKwkJCQkJcG9ydEAxIHsKKwkJCQkJCXJlZyA9IDwxPjsKIAkJCQkJCW1k
cDVfaW50ZjFfb3V0OiBlbmRwb2ludCB7CiAJCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkc2kw
X2luPjsKIAkJCQkJCX07CkBAIC0xMjE2LDYgKzEyMjMsNzkgQEAKIAkJCQljbG9ja3MgPSA8Jm1t
Y2MgTURTU19BSEJfQ0xLPjsKIAkJCQljbG9jay1uYW1lcyA9ICJpZmFjZSI7CiAJCQl9OworCisJ
CQloZG1pOiBoZG1pLXR4QGZkOTIyMTAwIHsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCisJ
CQkJY29tcGF0aWJsZSA9ICJxY29tLGhkbWktdHgtODk3NCI7CisJCQkJcmVnID0gPDB4ZmQ5MjIx
MDAgMHgzNWM+LAorCQkJCSAgICAgIDwweGZjNGI4MDAwIDB4NjBmMD47CisJCQkJcmVnLW5hbWVz
ID0gImNvcmVfcGh5c2ljYWwiLAorCQkJCSAgICAgICAgICAgICJxZnByb21fcGh5c2ljYWwiOwor
CisJCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmbWRzcz47CisJCQkJaW50ZXJydXB0cyA9IDw4IElS
UV9UWVBFX0xFVkVMX0hJR0g+OworCisJCQkJcG93ZXItZG9tYWlucyA9IDwmbW1jYyBNRFNTX0dE
U0M+OworCisJCQkJY2xvY2tzID0gPCZtbWNjIE1EU1NfTURQX0NMSz4sCisJCQkJICAgICAgICAg
PCZtbWNjIE1EU1NfQUhCX0NMSz4sCisJCQkJICAgICAgICAgPCZtbWNjIE1EU1NfSERNSV9DTEs+
LAorCQkJCSAgICAgICAgIDwmbW1jYyBNRFNTX0hETUlfQUhCX0NMSz4sCisJCQkJICAgICAgICAg
PCZtbWNjIE1EU1NfRVhUUENMS19DTEs+OworCQkJCWNsb2NrLW5hbWVzID0gIm1kcF9jb3JlIiwK
KwkJCQkgICAgICAgICAgICAgICJpZmFjZSIsCisJCQkJICAgICAgICAgICAgICAiY29yZSIsCisJ
CQkJICAgICAgICAgICAgICAiYWx0X2lmYWNlIiwKKwkJCQkgICAgICAgICAgICAgICJleHRwIjsK
KworCQkJCWhwZC01di1zdXBwbHkgPSA8JnBtODk0MV81dnMyPjsKKwkJCQljb3JlLXZkZGEtc3Vw
cGx5ID0gPCZwbTg5NDFfbDEyPjsKKwkJCQljb3JlLXZjYy1zdXBwbHkgPSA8JnBtODk0MV9zMz47
CisKKwkJCQkvKgorCQkJCSAqIEZJWE1FIC0gZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWku
YyB2aWEgaHBkX3JlZ19uYW1lc184eDc0CisJCQkJICogbG9va3MgZm9yIGhwZC1nZHNjLXN1cHBs
eS4gV2hhdCBzaG91bGQgYmUgdXNlZCBoZXJlPyBTaG91bGRuJ3QKKwkJCQkgKiB0aGlzIGZ1bmN0
aW9uYWxpdHkgYmUgcHJvdmlkZWQgYnkgdGhlIHBvd2VyLWRvbWFpbnMgYWJvdmU/CisJCQkJICov
CisKKwkJCQlwaHlzID0gPCZoZG1pX3BoeT47CisJCQkJcGh5LW5hbWVzID0gImhkbWlfcGh5IjsK
KworCQkJCXBvcnRzIHsKKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJCSNzaXplLWNl
bGxzID0gPDA+OworCisJCQkJCXBvcnRAMCB7CisJCQkJCQlyZWcgPSA8MD47CisJCQkJCQloZG1p
X2luOiBlbmRwb2ludCB7CisJCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtZHA1X2ludGYzX291
dD47CisJCQkJCQl9OworCQkJCQl9OworCisJCQkJCXBvcnRAMSB7CisJCQkJCQlyZWcgPSA8MT47
CisJCQkJCX07CisJCQkJfTsKKwkJCX07CisKKwkJCWhkbWlfcGh5OiBoZG1pLXBoeUBmZDkyMjUw
MCB7CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKworCQkJCWNvbXBhdGlibGUgPSAicWNvbSxo
ZG1pLXBoeS04OTc0IjsKKwkJCQlyZWcgPSA8MHhmZDkyMjUwMCAweDdjPjsKKwkJCQlyZWctbmFt
ZXMgPSAiaGRtaV9waHkiOworCisJCQkJY2xvY2tzID0gPCZtbWNjIE1EU1NfQUhCX0NMSz4sCisJ
CQkJICAgICAgICAgPCZtbWNjIE1EU1NfSERNSV9BSEJfQ0xLPjsKKwkJCQljbG9jay1uYW1lcyA9
ICJpZmFjZSIsCisJCQkJICAgICAgICAgICAgICAiYWx0X2lmYWNlIjsKKworCQkJCWNvcmUtdmRk
YS1zdXBwbHkgPSA8JnBtODk0MV9sMTI+OworCQkJCXZkZGlvLXN1cHBseSA9IDwmcG04OTQxX3Mz
PjsKKworCQkJCSNwaHktY2VsbHMgPSA8MD47CisJCQl9OwogCQl9OwogCX07CiAKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
