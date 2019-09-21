Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C272ABAE25
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690A76E129;
	Mon, 23 Sep 2019 06:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D962E6E06D;
 Sat, 21 Sep 2019 10:04:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y19so9136146wrd.3;
 Sat, 21 Sep 2019 03:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8yDViXpHqhxHd9Sp8XJBl9klumTFt9ab9bndlNAw2U=;
 b=oyujEl+A/tHEqPOYgvcOmWtxerk5TlZSeT6v74cntIuzpaxlLM6hDf+cv7eHsU9rw9
 5ntjG4L8qIu/LQXepBqQwPvEBVHr9wHzmmfOBEYCeHRJv41uDklg4AA9GrcMzw8z6huV
 tNgM7n5uIB9zkFb6gEGQ5CB9zbXa8CseTV56C2mxIwgfqHOLxnLZ2RmBE5wgVkm1SSrH
 +ZIStNokavyAFhh1Z0aveb/We+JrAcSa4bNFy2eMvh7gyrSvFXDphyWOA/HiVchRdXBc
 91p321R6TsW46u/usH2nG47r8W7GaMQKLUWeyy7PCvYKPye+shYgUKlvYeIGYiwN89At
 euaA==
X-Gm-Message-State: APjAAAVlwolZVhIvfoZsVEaFV3Db/Hj4v+IVu0/72rltkwgTDuSSNNef
 2zHuw+5qvsBZftIBGegMFzc=
X-Google-Smtp-Source: APXvYqwkoDFR+0NW7IwW7dQ5FtdQpZ1ZxcryyVyI5DzLgyi+BjVgWOPH1MbsZm7NVXr+oaCJ1Ea+Sg==
X-Received: by 2002:a5d:694c:: with SMTP id r12mr10266988wrw.44.1569060285336; 
 Sat, 21 Sep 2019 03:04:45 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 03:04:44 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] drm/msm/mdp5: Add configuration for msm8x56
Date: Sat, 21 Sep 2019 12:04:36 +0200
Message-Id: <20190921100439.64402-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921100439.64402-1-kholk11@gmail.com>
References: <20190921100439.64402-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y8yDViXpHqhxHd9Sp8XJBl9klumTFt9ab9bndlNAw2U=;
 b=h+r1kNCWFx6IojVHXwozmqlihr97x2WF5h289HmqdRFtaHjkrQZBlnaXnWvcVbdODl
 9GuVcgzjT8IdUZllfHwcYyxFjVZWqibfu5MoxpOlRVO0gIJHoJRMYMZtyvRg/+XtQCva
 FBN37ygDlz/LKgyu/aCC3WEEgGWHpHB0GQRsQ94iupYIBU9QLBbpp8zABRhLXNM5/r+9
 5nSGFjVtd+D3kpAI4MPX5b+nZ7rnHnN1C0qqpDAHtp39Y+Id89YtqiY+8vdatzBrZiQR
 /WbzAe+cIzjWSLy4kWUaQz/ynU818JSs+qeazGn761bkQwGiUJQd7ehfo5tz4hn0IvgP
 N4yA==
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

RnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNvbT4KCkFkZCB0aGUg
Y29uZmlndXJhdGlvbiBlbnRyaWVzIGZvciB0aGUgTURQNSB2MS4xMSwgZm91bmQgb24gTVNNODk1
NgphbmQgQVBRODA1Ni4KClNpZ25lZC1vZmYtYnk6IEFuZ2VsbyBHLiBEZWwgUmVnbm8gPGtob2xr
MTFAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2Zn
LmMgfCA5OSArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5OSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9jZmcuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2ZnLmMKaW5kZXgg
ZGQxZGFmMGUzMDVhLi45ZmY0NGU3ZmM3YzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfY2ZnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9jZmcuYwpAQCAtNTQ1LDYgKzU0NSwxMDQgQEAgY29uc3Qgc3RydWN0IG1kcDVfY2Zn
X2h3IG1zbTh4OTZfY29uZmlnID0gewogCS5tYXhfY2xrID0gNDEyNTAwMDAwLAogfTsKIAorY29u
c3Qgc3RydWN0IG1kcDVfY2ZnX2h3IG1zbTh4NTZfY29uZmlnID0geworCS5uYW1lID0gIm1zbTh4
NTYiLAorCS5tZHAgPSB7CisJCS5jb3VudCA9IDEsCisJCS5jYXBzID0gTURQX0NBUF9TTVAgfAor
CQkJTURQX0NBUF9EU0MgfAorCQkJTURQX0NBUF9TUkNfU1BMSVQgfAorCQkJMCwKKwl9LAorCS5j
dGwgPSB7CisJCS5jb3VudCA9IDMsCisJCS5iYXNlID0geyAweDAxMDAwLCAweDAxMjAwLCAweDAx
NDAwIH0sCisJCS5mbHVzaF9od19tYXNrID0gMHhmZmZmZmZmZiwKKwl9LAorCS5zbXAgPSB7CisJ
CS5tbWJfY291bnQgPSAxMCwKKwkJLm1tYl9zaXplID0gMTAyNDAsCisJCS5jbGllbnRzID0gewor
CQkJW1NTUFBfVklHMF0gPSAxLCBbU1NQUF9WSUcxXSA9IDksCisJCQlbU1NQUF9ETUEwXSA9IDQs
CisJCQlbU1NQUF9SR0IwXSA9IDcsIFtTU1BQX1JHQjFdID0gOCwKKwkJfSwKKwl9LAorCS5waXBl
X3ZpZyA9IHsKKwkJLmNvdW50ID0gMiwKKwkJLmJhc2UgPSB7IDB4MDQwMDAsIDB4MDYwMDAgfSwK
KwkJLmNhcHMgPSBNRFBfUElQRV9DQVBfSEZMSVAJfAorCQkJTURQX1BJUEVfQ0FQX1ZGTElQCXwK
KwkJCU1EUF9QSVBFX0NBUF9TQ0FMRQl8CisJCQlNRFBfUElQRV9DQVBfQ1NDCXwKKwkJCU1EUF9Q
SVBFX0NBUF9ERUNJTUFUSU9OCXwKKwkJCU1EUF9QSVBFX0NBUF9TV19QSVhfRVhUCXwKKwkJCTAs
CisJfSwKKwkucGlwZV9yZ2IgPSB7CisJCS5jb3VudCA9IDIsCisJCS5iYXNlID0geyAweDE0MDAw
LCAweDE2MDAwIH0sCisJCS5jYXBzID0gTURQX1BJUEVfQ0FQX0hGTElQCXwKKwkJCU1EUF9QSVBF
X0NBUF9WRkxJUAl8CisJCQlNRFBfUElQRV9DQVBfREVDSU1BVElPTgl8CisJCQlNRFBfUElQRV9D
QVBfU1dfUElYX0VYVAl8CisJCQkwLAorCX0sCisJLnBpcGVfZG1hID0geworCQkuY291bnQgPSAx
LAorCQkuYmFzZSA9IHsgMHgyNDAwMCB9LAorCQkuY2FwcyA9IE1EUF9QSVBFX0NBUF9IRkxJUAl8
CisJCQlNRFBfUElQRV9DQVBfVkZMSVAJfAorCQkJTURQX1BJUEVfQ0FQX1NXX1BJWF9FWFQJfAor
CQkJMCwKKwl9LAorCS5waXBlX2N1cnNvciA9IHsKKwkJLmNvdW50ID0gMSwKKwkJLmJhc2UgPSB7
IDB4NDQwREMgfSwKKwkJLmNhcHMgPSBNRFBfUElQRV9DQVBfSEZMSVAJfAorCQkJTURQX1BJUEVf
Q0FQX1ZGTElQCXwKKwkJCU1EUF9QSVBFX0NBUF9TV19QSVhfRVhUCXwKKwkJCU1EUF9QSVBFX0NB
UF9DVVJTT1IJfAorCQkJMCwKKwl9LAorCisJLmxtID0geworCQkuY291bnQgPSAyLAorCQkuYmFz
ZSA9IHsgMHg0NDAwMCwgMHg0NTAwMCB9LAorCQkuaW5zdGFuY2VzID0geworCQkJCXsgLmlkID0g
MCwgLnBwID0gMCwgLmRzcHAgPSAwLAorCQkJCSAgLmNhcHMgPSBNRFBfTE1fQ0FQX0RJU1BMQVks
IH0sCisJCQkJeyAuaWQgPSAxLCAucHAgPSAtMSwgLmRzcHAgPSAtMSwKKwkJCQkgIC5jYXBzID0g
TURQX0xNX0NBUF9XQiB9LAorCQkJICAgICB9LAorCQkubmJfc3RhZ2VzID0gOCwKKwkJLm1heF93
aWR0aCA9IDI1NjAsCisJCS5tYXhfaGVpZ2h0ID0gMHhGRkZGLAorCX0sCisJLmRzcHAgPSB7CisJ
CS5jb3VudCA9IDEsCisJCS5iYXNlID0geyAweDU0MDAwIH0sCisKKwl9LAorCS5wcCA9IHsKKwkJ
LmNvdW50ID0gMywKKwkJLmJhc2UgPSB7IDB4NzAwMDAsIDB4NzA4MDAsIDB4NzIwMDAgfSwKKwl9
LAorCS5kc2MgPSB7CisJCS5jb3VudCA9IDIsCisJCS5iYXNlID0geyAweDgwMDAwLCAweDgwNDAw
IH0sCisJfSwKKwkuaW50ZiA9IHsKKwkJLmJhc2UgPSB7IDB4NmEwMDAsIDB4NmE4MDAsIDB4NmIw
MDAgfSwKKwkJLmNvbm5lY3QgPSB7CisJCQlbMF0gPSBJTlRGX0RJU0FCTEVELAorCQkJWzFdID0g
SU5URl9EU0ksCisJCQlbMl0gPSBJTlRGX0RTSSwKKwkJfSwKKwl9LAorCS5tYXhfY2xrID0gMzYw
MDAwMDAwLAorfTsKKwogY29uc3Qgc3RydWN0IG1kcDVfY2ZnX2h3IG1zbTg5MTdfY29uZmlnID0g
ewogCS5uYW1lID0gIm1zbTg5MTciLAogCS5tZHAgPSB7CkBAIC02MzcsNiArNzM1LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtZHA1X2NmZ19oYW5kbGVyIGNmZ19oYW5kbGVyc1tdID0gewogCXsg
LnJldmlzaW9uID0gNiwgLmNvbmZpZyA9IHsgLmh3ID0gJm1zbTh4MTZfY29uZmlnIH0gfSwKIAl7
IC5yZXZpc2lvbiA9IDksIC5jb25maWcgPSB7IC5odyA9ICZtc204eDk0X2NvbmZpZyB9IH0sCiAJ
eyAucmV2aXNpb24gPSA3LCAuY29uZmlnID0geyAuaHcgPSAmbXNtOHg5Nl9jb25maWcgfSB9LAor
CXsgLnJldmlzaW9uID0gMTEsIC5jb25maWcgPSB7IC5odyA9ICZtc204eDU2X2NvbmZpZyB9IH0s
CiAJeyAucmV2aXNpb24gPSAxNSwgLmNvbmZpZyA9IHsgLmh3ID0gJm1zbTg5MTdfY29uZmlnIH0g
fSwKIH07CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
