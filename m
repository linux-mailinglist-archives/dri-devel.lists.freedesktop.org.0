Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3225F90B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 13:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A4D6E32F;
	Mon,  7 Sep 2020 11:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67226E32F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:10:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j2so15372387wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyfLckJhiZ5sjHjg6KN13DoyRvqbjPb2/1GNLHUTQ18=;
 b=QmBXtZscSFhFSWmsqbWRggCLAvMzSVGeAB6uNwTdM11fep54tfrxptBj+Rd04GjKwU
 ZO/seRoLaVJDlrcn5Y6Q0GrKitqT9URFvyE7524RsQd0UKxWpDkp5+3VoKjiIB03A7kN
 7KaO/TzW3UYcLcuzYXkfNpJnYtgbkKkfMJaq2ZGjOvKxpsb8egJGHVNPLx/+YZ7D7HIL
 X/prO/CU2BMymmOCgs45XbqHNZlv10+915vQvZBs5+UG6V2+a6HZ/qTz0X/nGD7UNIn8
 wJApzbh0qn5frSxnTrjUygmG6ePUI1fgFhcZ7gy0KmuLbmJ8Kiy1rQVx+IG4GypJQfeZ
 LOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyfLckJhiZ5sjHjg6KN13DoyRvqbjPb2/1GNLHUTQ18=;
 b=jjKpZZmqrtTB9ZAvpVsmYEBWUw7kONiEA4CKKd2UURqnJZS29cEZWnd1I2CuVYK8OP
 u8uFX4WMNhS4ra3AlSJxNz2Fwt+/gWvXAqt6VMBcQS2bjNKb4Q7SZfhmMOfBpo8uYLc/
 41jBLvezftSwLpQvnTxOiXY4J8jKh9H0w7mm3l5XNYQhZDYKJxxyZ1N4V2UiOJdNSfkJ
 9gxOb/Yaq4psDxiot+7kjflXWW/iHeXM/UKH+63xC7Soo7vrDwX4tuDp3YEZtgeremoj
 ln6cRWlwfqA1XZekhOcgTHhI2Gj4a33Rqj/SECeYy/BH+OemqiSbLSVAtbJBspsp08FL
 aqrg==
X-Gm-Message-State: AOAM531iOTjmQ/i4hp1/vOdxZYvE3LmhC+zSPaT+F0v1IxepNJEbhDGF
 6o4u0OW6ehVb3v99mxRtVsaZyw==
X-Google-Smtp-Source: ABdhPJydVdSsCLGHaYXiDQPPFXJqDlI3Gq8+/+6752E5DlDac2zDdha6cnWoGI5J0cNDYNsz91bj7A==
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr20751383wrc.123.1599477030165; 
 Mon, 07 Sep 2020 04:10:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u13sm19922111wrm.77.2020.09.07.04.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 04:10:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH 0/3] drm: panel: add support for TDO tl070wsh30 panel
Date: Mon,  7 Sep 2020 13:10:24 +0200
Message-Id: <20200907111027.21933-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHN1cHBvcnQgYmluZGluZ3MgYW5kIHN1cHBvcnQgZm9yIHRoZSBURE8gVEwwNzBX
U0gzMCBURlQtTENEIHBhbmVsCm1vZHVsZSBzaGlwcGVkIHdpdGggdGhlIEFtbG9naWMgUzQwMCBE
ZXZlbG9wbWVudCBLaXQuClRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlvbiBhbmQg
dXNlcyAyNCBiaXQgUkdCIHBlciBwaXhlbC4KSXQgcHJvdmlkZXMgYSBNSVBJIERTSSBpbnRlcmZh
Y2UgdG8gdGhlIGhvc3QsIGEgYnVpbHQtaW4gTEVEIGJhY2tsaWdodAphbmQgdG91Y2ggY29udHJv
bGxlci4KCkNoYW5nZXMgc2luY2UgdjEgYXQgWzFdOgotIGFkZGVkIG1pc3NpbmcgdmVuZG9yLXBy
ZWZpeGVzIHBhdGNoCi0gcmVtb3ZlZCB2cmVmcmVzaAotIGZpeGVkIHdhcm5pbmcgb24gYWRkX3Bh
bmVsIHJldHVybgotIHJlbW92ZWQgRFJNIGxvZ2dpbmcKClsxXSBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzgxMzc2LyNyZXYxCgpOZWlsIEFybXN0cm9uZyAoMyk6CiAg
ZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogQWRkIFNoYW5naGFpIFRvcCBEaXNwbGF5CiAg
ICBPcHRvbGVsZWN0cm9uaWNzIHZlbmRvciBwcmVmaXgKICBkdC1iaW5kaW5nczogZGlzcGxheTog
cGFuZWw6IGFkZCBURE8gdGwwNzB3c2gzMCBEU0kgcGFuZWwgYmluZGluZ3MKICBkcm06IHBhbmVs
OiBhZGQgVERPIHRsMDcwd3NoMzAgcGFuZWwgZHJpdmVyCgogLi4uL2Rpc3BsYXkvcGFuZWwvdGRv
LHRsMDcwd3NoMzAueWFtbCAgICAgICAgIHwgIDU4ICsrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
S2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMTEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL01h
a2VmaWxlICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10ZG8tdGwwNzB3c2gzMC5jICB8IDI1NiArKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hh
bmdlZCwgMzI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC90ZG8sdGwwNzB3c2gzMC55YW1sCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRkby10bDA3MHdz
aDMwLmMKCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
