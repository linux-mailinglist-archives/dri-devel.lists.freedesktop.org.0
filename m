Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC57EB0AF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087B66EC24;
	Thu, 31 Oct 2019 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583546EE1A;
 Thu, 31 Oct 2019 10:44:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p4so5654111wrm.8;
 Thu, 31 Oct 2019 03:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NM0ZQ0YqLj9AAkiTqqi3iRVNKR68xa3LpemkjK2oJlo=;
 b=PYEylknWi2jXa7ZDRgkZ5bU0JERvgcc2grjEGvVWrDT/8g+GI2Pfq7AKOUYbgxOBFT
 xV2syY+7RCY5KDd9g1trrRV2wuvi02Yzj1oYWuYWE/FnsNq7s6tpQM9THJHPCmz0ibnS
 7KZV/fnMhvmcUUorVe9aq9ua3f9l3uRfcaZDcBDry/wc0Kzp+dMNpXiWymnfoD2OGm4S
 LGUWSXCn87dZuMVmMWmbTHbxLesdyRa20c3S/zv+HRygkXJO+EkS7G1JRN3oCTzYljw3
 4wgeNwb8nsp81qRpES9TIkTdalNz17Th+qoER40Ng/xu/NmHDf217yTbGhvi0OI8oKBe
 vf5w==
X-Gm-Message-State: APjAAAW5Qe/h5YNxjueX5nJK0LCebFHXNIvw3teR8SX3EH7+P0y/tEeJ
 gIIeI9M5esdbksmhvPjh0L0=
X-Google-Smtp-Source: APXvYqwwV2FDAYew06BczHOcmRSBKQ86j1b6KPyVWTtXbhIIaRTinyvwMpz24ADKRLRF+C7LZg345w==
X-Received: by 2002:adf:f685:: with SMTP id v5mr5092282wrp.246.1572518651782; 
 Thu, 31 Oct 2019 03:44:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:44:11 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 3/7] drm/msm/mdp5: Add configuration for msm8x76
Date: Thu, 31 Oct 2019 11:43:58 +0100
Message-Id: <20191031104402.31813-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NM0ZQ0YqLj9AAkiTqqi3iRVNKR68xa3LpemkjK2oJlo=;
 b=ZjLZfc7nE+46nibZZiP0fBMLPB+5vGGJh5lEBWo3TmzmDxhvT3nO2okc+6tkBEW9Eg
 1hi/aRP6qhzbjvIfWBVRz1IGfkKCjBpzkYCxceGXHHy6o4dys75BmrL4VvMDpUgsQ/58
 vi2LZXBYHcFhliqVZEIFAnD8Xos/ujbRBqfKDyxaCGJbqiLK359pt5CZ+ozaeHpvcwZP
 eFXHEHX0Xl9p5ihQs9Sl7WTulNSTEMyORcZcPK2ljOy/9AYGX++X6i8SGL3yvuxlzGVw
 kL8KU5ZayxDME0bDDtf82yW3v6Cep7pQSyNGAwUPJxR4LI7p1L0SKyLDNcGb7fed7ed4
 6ebw==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKQWRk
IHRoZSBjb25maWd1cmF0aW9uIGVudHJpZXMgZm9yIHRoZSBNRFA1IHYxLjExLCBmb3VuZCBvbgpN
U004OTU2LCBNU004OTc2IGFuZCBBUFEgdmFyaWFudHMuCgpTaWduZWQtb2ZmLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8a2hvbGsxMUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jZmcuYyB8IDk4ICsrKysrKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NmZy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9jZmcuYwppbmRleCA3YzljMWRkYWU4MjEuLjFmNDhmNjQ1MzlhMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jZmcuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NmZy5jCkBAIC01NDUsNiArNTQ1LDEw
MyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kcDVfY2ZnX2h3IG1zbTh4OTZfY29uZmlnID0gewog
CS5tYXhfY2xrID0gNDEyNTAwMDAwLAogfTsKIAorY29uc3Qgc3RydWN0IG1kcDVfY2ZnX2h3IG1z
bTh4NzZfY29uZmlnID0geworCS5uYW1lID0gIm1zbTh4NzYiLAorCS5tZHAgPSB7CisJCS5jb3Vu
dCA9IDEsCisJCS5jYXBzID0gTURQX0NBUF9TTVAgfAorCQkJTURQX0NBUF9EU0MgfAorCQkJTURQ
X0NBUF9TUkNfU1BMSVQgfAorCQkJMCwKKwl9LAorCS5jdGwgPSB7CisJCS5jb3VudCA9IDMsCisJ
CS5iYXNlID0geyAweDAxMDAwLCAweDAxMjAwLCAweDAxNDAwIH0sCisJCS5mbHVzaF9od19tYXNr
ID0gMHhmZmZmZmZmZiwKKwl9LAorCS5zbXAgPSB7CisJCS5tbWJfY291bnQgPSAxMCwKKwkJLm1t
Yl9zaXplID0gMTAyNDAsCisJCS5jbGllbnRzID0geworCQkJW1NTUFBfVklHMF0gPSAxLCBbU1NQ
UF9WSUcxXSA9IDksCisJCQlbU1NQUF9ETUEwXSA9IDQsCisJCQlbU1NQUF9SR0IwXSA9IDcsIFtT
U1BQX1JHQjFdID0gOCwKKwkJfSwKKwl9LAorCS5waXBlX3ZpZyA9IHsKKwkJLmNvdW50ID0gMiwK
KwkJLmJhc2UgPSB7IDB4MDQwMDAsIDB4MDYwMDAgfSwKKwkJLmNhcHMgPSBNRFBfUElQRV9DQVBf
SEZMSVAJfAorCQkJTURQX1BJUEVfQ0FQX1ZGTElQCXwKKwkJCU1EUF9QSVBFX0NBUF9TQ0FMRQl8
CisJCQlNRFBfUElQRV9DQVBfQ1NDCXwKKwkJCU1EUF9QSVBFX0NBUF9ERUNJTUFUSU9OCXwKKwkJ
CU1EUF9QSVBFX0NBUF9TV19QSVhfRVhUCXwKKwkJCTAsCisJfSwKKwkucGlwZV9yZ2IgPSB7CisJ
CS5jb3VudCA9IDIsCisJCS5iYXNlID0geyAweDE0MDAwLCAweDE2MDAwIH0sCisJCS5jYXBzID0g
TURQX1BJUEVfQ0FQX0hGTElQCXwKKwkJCU1EUF9QSVBFX0NBUF9WRkxJUAl8CisJCQlNRFBfUElQ
RV9DQVBfREVDSU1BVElPTgl8CisJCQlNRFBfUElQRV9DQVBfU1dfUElYX0VYVAl8CisJCQkwLAor
CX0sCisJLnBpcGVfZG1hID0geworCQkuY291bnQgPSAxLAorCQkuYmFzZSA9IHsgMHgyNDAwMCB9
LAorCQkuY2FwcyA9IE1EUF9QSVBFX0NBUF9IRkxJUAl8CisJCQlNRFBfUElQRV9DQVBfVkZMSVAJ
fAorCQkJTURQX1BJUEVfQ0FQX1NXX1BJWF9FWFQJfAorCQkJMCwKKwl9LAorCS5waXBlX2N1cnNv
ciA9IHsKKwkJLmNvdW50ID0gMSwKKwkJLmJhc2UgPSB7IDB4NDQwREMgfSwKKwkJLmNhcHMgPSBN
RFBfUElQRV9DQVBfSEZMSVAJfAorCQkJTURQX1BJUEVfQ0FQX1ZGTElQCXwKKwkJCU1EUF9QSVBF
X0NBUF9TV19QSVhfRVhUCXwKKwkJCU1EUF9QSVBFX0NBUF9DVVJTT1IJfAorCQkJMCwKKwl9LAor
CS5sbSA9IHsKKwkJLmNvdW50ID0gMiwKKwkJLmJhc2UgPSB7IDB4NDQwMDAsIDB4NDUwMDAgfSwK
KwkJLmluc3RhbmNlcyA9IHsKKwkJCQl7IC5pZCA9IDAsIC5wcCA9IDAsIC5kc3BwID0gMCwKKwkJ
CQkgIC5jYXBzID0gTURQX0xNX0NBUF9ESVNQTEFZLCB9LAorCQkJCXsgLmlkID0gMSwgLnBwID0g
LTEsIC5kc3BwID0gLTEsCisJCQkJICAuY2FwcyA9IE1EUF9MTV9DQVBfV0IgfSwKKwkJCSAgICAg
fSwKKwkJLm5iX3N0YWdlcyA9IDgsCisJCS5tYXhfd2lkdGggPSAyNTYwLAorCQkubWF4X2hlaWdo
dCA9IDB4RkZGRiwKKwl9LAorCS5kc3BwID0geworCQkuY291bnQgPSAxLAorCQkuYmFzZSA9IHsg
MHg1NDAwMCB9LAorCisJfSwKKwkucHAgPSB7CisJCS5jb3VudCA9IDMsCisJCS5iYXNlID0geyAw
eDcwMDAwLCAweDcwODAwLCAweDcyMDAwIH0sCisJfSwKKwkuZHNjID0geworCQkuY291bnQgPSAy
LAorCQkuYmFzZSA9IHsgMHg4MDAwMCwgMHg4MDQwMCB9LAorCX0sCisJLmludGYgPSB7CisJCS5i
YXNlID0geyAweDZhMDAwLCAweDZhODAwLCAweDZiMDAwIH0sCisJCS5jb25uZWN0ID0geworCQkJ
WzBdID0gSU5URl9ESVNBQkxFRCwKKwkJCVsxXSA9IElOVEZfRFNJLAorCQkJWzJdID0gSU5URl9E
U0ksCisJCX0sCisJfSwKKwkubWF4X2NsayA9IDM2MDAwMDAwMCwKK307CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbWRwNV9jZmdfaHcgbXNtODkxN19jb25maWcgPSB7CiAJLm5hbWUgPSAibXNtODkx
NyIsCiAJLm1kcCA9IHsKQEAgLTc0NSw2ICs4NDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1k
cDVfY2ZnX2hhbmRsZXIgY2ZnX2hhbmRsZXJzX3YxW10gPSB7CiAJeyAucmV2aXNpb24gPSA2LCAu
Y29uZmlnID0geyAuaHcgPSAmbXNtOHgxNl9jb25maWcgfSB9LAogCXsgLnJldmlzaW9uID0gOSwg
LmNvbmZpZyA9IHsgLmh3ID0gJm1zbTh4OTRfY29uZmlnIH0gfSwKIAl7IC5yZXZpc2lvbiA9IDcs
IC5jb25maWcgPSB7IC5odyA9ICZtc204eDk2X2NvbmZpZyB9IH0sCisJeyAucmV2aXNpb24gPSAx
MSwgLmNvbmZpZyA9IHsgLmh3ID0gJm1zbTh4NzZfY29uZmlnIH0gfSwKIAl7IC5yZXZpc2lvbiA9
IDE1LCAuY29uZmlnID0geyAuaHcgPSAmbXNtODkxN19jb25maWcgfSB9LAogfTsKIAotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
