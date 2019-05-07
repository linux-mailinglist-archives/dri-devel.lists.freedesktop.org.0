Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410916438
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 15:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5F36E7CD;
	Tue,  7 May 2019 13:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3876E7CD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 13:07:40 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 10so8652355pfo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 06:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rmbbR+nEPRU8PAUrqs/Xp1Cybc4IWp6SjLWLlkBHpm0=;
 b=oh2Wbh2mQbqGnEyHezDOatBXUxLjC5GWzjanQV7GlY9aFcJFEts1y0YTqUyC6gnmqE
 l0YC1FGbgS0G8Kj5BmMYx8jXpnUEIKcBgAdED5z4w46scNkFRNjIzSqKqJp5Uxo7q+Ae
 UOzLtrTyCLqOcLZhucVuj3NiNJGXRL0YSgwOPHoJ3bgj8plL3oShr4cjicMAycDu50SE
 2KW/vRiv5gsuDz+Zq0iJczwPgJ9iakv5uoTv3fHMcX14bQYzCWh7n06rVtBDUGAqleGY
 P0Yk4SEWgAQ69OM5ONK2b8mFAafAS2eCOjYfkzs6R4YM0z53Ud1jTcHBXglxUOc533mf
 kAEg==
X-Gm-Message-State: APjAAAWS+/UtQ/mw7JA/GJFdT33CTawEk+e/3Y4DWEpeFy5oVP5MnvAP
 dYtM9xUjdxm9GAPffcB0o782dA==
X-Google-Smtp-Source: APXvYqxLeInLf88kjLthLdkTwo1/yWUp+xFEYrpTiTrZa+Gcgm+ciJnRApUuxQzvX/3b2mjsA5Dy5Q==
X-Received: by 2002:aa7:92c4:: with SMTP id k4mr42376765pfa.183.1557234459930; 
 Tue, 07 May 2019 06:07:39 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:3682:cdb6:452:ecda:bdfa:452e])
 by smtp.gmail.com with ESMTPSA id w190sm21889823pfb.101.2019.05.07.06.07.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 06:07:39 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [DO NOT MERGE] [PATCH v2 3/3] arm64: rockchip: rk3399: nanopc-t4:
 Enable FriendlyELEC HD702E eDP panel
Date: Tue,  7 May 2019 18:37:08 +0530
Message-Id: <20190507130708.11255-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190507130708.11255-1-jagan@amarulasolutions.com>
References: <20190507130708.11255-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rmbbR+nEPRU8PAUrqs/Xp1Cybc4IWp6SjLWLlkBHpm0=;
 b=MQeNgF/ztfyfJPkOLp8v44evWaHK6oQNiqkbYk6h5b2kjyPiu6a9LJ5OzAeVCfV1bv
 eXov666QPajT8xgYjzaUgoDgyOvsb27oueOSiVnHWAqcG9Q6V47EeBKCQryKWP53/JtH
 G8SChDw3Fr+NIFF9Q/ph7KdV8veIMSpgTWz04=
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

RnJpZW5kbHlFTEVDIEhENzAyRSBpcyBvbmUgb2Ygb3B0aW9uYWwgTENEIHBhbmVsIGZvcgpOYW5v
UEMgVDQgZURQIGludGVyZmFjZS4KCkl0IGZlYXR1cmVzIDgwMHgxMjgwIHJlc29sdXRpb25zLCB3
aXRoIGJ1aWx0IGluIEdUOTI3MSBjYXB0aXZlCnRvdWNoc2NyZWVuIGFuZCBhZGp1c3RhYmxlIGJh
Y2tsaWdodCB2aWEgUFdNLgoKZURQIHBhbmVsIGNvbm5lY3Rpb25zIGFyZToKLSBWQ0MzVjNfU1lT
OiAzLjNWIHBhbmVsIHBvd2VyIHN1cHBseQotIEdQSU80X0MyOiBQV00wX0JMIHBpbgotIEdQSU80
X0Q1X0xDRF9CTF9FTjogQmFja2xpZ2h0IGVuYWJsZSBwaW4KLSBWQ0MxMlYwX1NZUzogMTJWIGJh
Y2tsaWdodCBwb3dlciBzdXBwbHkKLSBUb3VjaHNjcmVlbiBjb25uZWN0ZWQgdmlhIEkyQzQKLSBH
UElPMV9DNF9UUF9JTlQ6IHRvdWNoc2NyZWVuIGludGVycnVwdCBwaW4KLSBHUElPMV9CNV9UUF9S
U1Q6IHRvdWNoc2NyZWVuIHJlc2V0IHBpbgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFn
YW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2MjoKLSB1c2UgZm9yY2Ut
aHBkIGFuZCBkZWxldGUtcHJvcGVydHkgZm9yIGVkcAotIHVzZSBnZW5lcmljIGJhY2tsaWdodCBi
cmlnaHRuZXNzCi0gYWRkIHNpbXBsZS1wYW5lbCBmYWxsYmFjayBjb21wYXRpYmxlCgogLi4uL2Jv
b3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1uYW5vcGMtdDQuZHRzICAgIHwgNTAgKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1uYW5vcGMtdDQuZHRzIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTktbmFub3BjLXQ0LmR0cwppbmRleCA5MzFjM2Ri
ZjFiN2QuLjRjYWNkMDk2NThkYyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2Nr
Y2hpcC9yazMzOTktbmFub3BjLXQ0LmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tj
aGlwL3JrMzM5OS1uYW5vcGMtdDQuZHRzCkBAIC00Niw2ICs0NiwxNCBAQAogCQl9OwogCX07CiAK
KwliYWNrbGlnaHQ6IGJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7
CisJCWVuYWJsZS1ncGlvcyA9IDwmZ3BpbzQgUktfUEQ1IEdQSU9fQUNUSVZFX0hJR0g+OwkvKiBH
UElPNF9ENV9MQ0RfQkxfRU4gKi8KKwkJcHdtcyA9IDwmcHdtMCAwIDI1MDAwIDA+OworCQlwb3dl
ci1zdXBwbHkgPSA8JnZjYzEydjBfc3lzPjsKKwkJc3RhdHVzID0gIm9rYXkiOworCX07CisKIAlp
ci1yZWNlaXZlciB7CiAJCWNvbXBhdGlibGUgPSAiZ3Bpby1pci1yZWNlaXZlciI7CiAJCWdwaW9z
ID0gPCZncGlvMCBSS19QQTYgR1BJT19BQ1RJVkVfTE9XPjsKQEAgLTY0LDYgKzcyLDE4IEBACiAJ
CWZhbi1zdXBwbHkgPSA8JnZjYzEydjBfc3lzPjsKIAkJcHdtcyA9IDwmcHdtMSAwIDUwMDAwIDA+
OwogCX07CisKKwlwYW5lbCB7CisJCWNvbXBhdGlibGUgPSJmcmllbmRseWFybSxoZDcwMmUiLCAi
c2ltcGxlLXBhbmVsIjsKKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCQlwb3dlci1zdXBw
bHkgPSA8JnZjYzN2M19zeXM+OworCisJCXBvcnQgeworCQkJcGFuZWxfaW5fZWRwOiBlbmRwb2lu
dCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZlZHBfb3V0X3BhbmVsPjsKKwkJCX07CisJCX07
CisJfTsKIH07CiAKICZjcHVfdGhlcm1hbCB7CkBAIC05NCw2ICsxMTQsMjUgQEAKIAl9OwogfTsK
IAorJmVkcCB7CisJc3RhdHVzID0gIm9rYXkiOworCWZvcmNlLWhwZDsKKwkvZGVsZXRlLXByb3Bl
cnR5LyBwaW5jdHJsLTA7CisKKwlwb3J0cyB7CisJCWVkcF9vdXQ6IHBvcnRAMSB7CisJCQlyZWcg
PSA8MT47CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+Owor
CisJCQllZHBfb3V0X3BhbmVsOiBlbmRwb2ludEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbl9lZHA+OworCQkJfTsKKwkJfTsKKwl9OworfTsKKwog
JmdwdV90aGVybWFsIHsKIAl0cmlwcyB7CiAJCWdwdV93YXJtOiBncHVfd2FybSB7CkBAIC0xMzAs
NiArMTY5LDE3IEBACiAJfTsKIH07CiAKKyZpMmM0IHsKKwl0b3VjaHNjcmVlbkA1ZCB7CisJCWNv
bXBhdGlibGUgPSAiZ29vZGl4LGd0OTExIjsKKwkJcmVnID0gPDB4NWQ+OworCQlpbnRlcnJ1cHQt
cGFyZW50ID0gPCZncGlvMT47CisJCWludGVycnVwdHMgPSA8UktfUEM0IElSUV9UWVBFX0VER0Vf
RkFMTElORz47CisJCWlycS1ncGlvID0gPCZncGlvMSBSS19QQzQgR1BJT19BQ1RJVkVfSElHSD47
CS8qIEdQSU8xX0M0X1RQX0lOVCAqLworCQlyZXNldC1ncGlvID0gPCZncGlvMSBSS19QQjUgR1BJ
T19BQ1RJVkVfTE9XPjsJLyogR1BJTzFfQjVfVFBfUlNUICovCisJfTsKK307CisKICZzZGhjaSB7
CiAJbW1jLWhzNDAwLTFfOHY7CiAJbW1jLWhzNDAwLWVuaGFuY2VkLXN0cm9iZTsKLS0gCjIuMTgu
MC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
