Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2683EB0B1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D4D6EC2E;
	Thu, 31 Oct 2019 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAA6EE1E;
 Thu, 31 Oct 2019 10:44:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i22so470231wrb.11;
 Thu, 31 Oct 2019 03:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2V3G3eqO0b2zEeTGJ2/qICJ5g4Ftbp7opa3Bf/EES5w=;
 b=oP0Fk9lKDXXMqB3BBZJp5AVHwTzHjjYj4UuOv2GDAsbEGTCaJUWwVzmJdlFCDhb5mp
 FGWIHLUIPSGIjGJCAKhHvOWI4xl6F8ITPUqTiaJuKmn4UUO8flMqpzXivSz/f0aYq78T
 iyBsO+ZIDwRlHEvVl7GzCvyC1o9xgMKjNfjpmCCj7gLw+JTPRd/ewm3T/DkrcJUkO9YL
 n0Ry7EBhC2yPTXfJeRaMLt751IopG0K0uo619m5L8dnJu4me2Hsn/PXMChY+7m0huosa
 Kt2liiLDNLX3lD3ovPcME6p8Zpj4jwyGnIiGm138MZAy5xUiGbVZvS2mIdhrxTpJVvac
 aQRg==
X-Gm-Message-State: APjAAAWSK7fZHQI3/bfA9jSijBzZudeGbL7/vYZMjdsY2hLG6xF79U6U
 CwpBGAWQOXHzBskdk+gNaWw=
X-Google-Smtp-Source: APXvYqwRHYSziJoiQR+nup4mTG0Zlw2/c3rwnMJrjI4CVn73leuABFCBOWBC85SvizBg56y8Gzeh/A==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr4132519wrw.129.1572518652788; 
 Thu, 31 Oct 2019 03:44:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:44:12 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 4/7] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date: Thu, 31 Oct 2019 11:43:59 +0100
Message-Id: <20191031104402.31813-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2V3G3eqO0b2zEeTGJ2/qICJ5g4Ftbp7opa3Bf/EES5w=;
 b=cQBA1tLQt7c0V6n710Dum1PpYILvFekB8wiJGk2TTMzOLwrFR/i1T/WhlO6OB0Xh1W
 vXxA9iHIvpU2BPMAsmc45ecurrtOB2Mey6rlgs9Q39myDqntyist+AG0g/8UkRoKYZ/7
 s21oJJcF/xbtdYyFeWYU7DAn6mtiLffG+V5bG7Yt3J9TrZdOBEAWEgYTstC0XrMYARUd
 VgXxmxH6GKbDLP48TFm0Uv8meCqWbnO4vBjOwhuJLYRpW624YC5a/4AxrkUYKq9Iu0XR
 Db5ibgagVOLskTsgtKgtZH1H2i894D6BXpObadIaVzZpbrecz7D0Zt0tTsyPC9HrmyzN
 B2Cg==
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

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKVGhl
IDI4bm0gUExMIGhhcyBhIGRpZmZlcmVudCBpb3NwYWNlIG9uIE1TTS9BUFEgZmFtaWx5IEIgU29D
czoKYWRkIGEgbmV3IGNvbmZpZ3VyYXRpb24gYW5kIHVzZSBpdCB3aGVuIHRoZSBEVCByZXBvcnRz
IHRoZQoicWNvbSxkc2ktcGh5LTI4bm0taHBtLWZhbS1iIiBjb21wYXRpYmxlLgoKU2lnbmVkLW9m
Zi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgICAgICB8ICAyICsrCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5oICAgICAgfCAgMSArCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8yOG5tLmMgfCAxOCArKysrKysrKysrKysrKysrKysK
IDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
aHkvZHNpX3BoeS5jCmluZGV4IGFhMjJjM2FlNTIzMC4uYjBjZmE2N2QyYTU3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMKQEAgLTQ4Myw2ICs0ODMsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBkc2lfcGh5X2R0X21hdGNoW10gPSB7CiAjaWZkZWYgQ09O
RklHX0RSTV9NU01fRFNJXzI4Tk1fUEhZCiAJeyAuY29tcGF0aWJsZSA9ICJxY29tLGRzaS1waHkt
MjhubS1ocG0iLAogCSAgLmRhdGEgPSAmZHNpX3BoeV8yOG5tX2hwbV9jZmdzIH0sCisJeyAuY29t
cGF0aWJsZSA9ICJxY29tLGRzaS1waHktMjhubS1ocG0tZmFtLWIiLAorCSAgLmRhdGEgPSAmZHNp
X3BoeV8yOG5tX2hwbV9mYW1iX2NmZ3MgfSwKIAl7IC5jb21wYXRpYmxlID0gInFjb20sZHNpLXBo
eS0yOG5tLWxwIiwKIAkgIC5kYXRhID0gJmRzaV9waHlfMjhubV9scF9jZmdzIH0sCiAjZW5kaWYK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmggYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5oCmluZGV4IGM0MDY5Y2U2YWZlNi4uMjRi
Mjk0ZWQzMDU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3Bo
eS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmgKQEAgLTQwLDYg
KzQwLDcgQEAgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyB7CiB9OwogCiBleHRlcm4gY29uc3Qgc3Ry
dWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzI4bm1faHBtX2NmZ3M7CitleHRlcm4gY29uc3Qg
c3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzI4bm1faHBtX2ZhbWJfY2ZnczsKIGV4dGVy
biBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMjhubV9scF9jZmdzOwogZXh0
ZXJuIGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgZHNpX3BoeV8yMG5tX2NmZ3M7CiBleHRl
cm4gY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzI4bm1fODk2MF9jZmdzOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMjhubS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMjhubS5jCmluZGV4IGIzZjY3OGY2
YzJhYS4uNjY1MDZlYTg2ZGQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
aHkvZHNpX3BoeV8yOG5tLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9w
aHlfMjhubS5jCkBAIC0xNDIsNiArMTQyLDI0IEBAIGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9j
ZmcgZHNpX3BoeV8yOG5tX2hwbV9jZmdzID0gewogCS5udW1fZHNpX3BoeSA9IDIsCiB9OwogCitj
b25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMjhubV9ocG1fZmFtYl9jZmdzID0g
eworCS50eXBlID0gTVNNX0RTSV9QSFlfMjhOTV9IUE0sCisJLnNyY19wbGxfdHJ1dGh0YWJsZSA9
IHsge3RydWUsIHRydWV9LCB7ZmFsc2UsIHRydWV9IH0sCisJLnJlZ19jZmcgPSB7CisJCS5udW0g
PSAxLAorCQkucmVncyA9IHsKKwkJCXsidmRkaW8iLCAxMDAwMDAsIDEwMH0sCisJCX0sCisJfSwK
Kwkub3BzID0geworCQkuZW5hYmxlID0gZHNpXzI4bm1fcGh5X2VuYWJsZSwKKwkJLmRpc2FibGUg
PSBkc2lfMjhubV9waHlfZGlzYWJsZSwKKwkJLmluaXQgPSBtc21fZHNpX3BoeV9pbml0X2NvbW1v
biwKKwl9LAorCS5pb19zdGFydCA9IHsgMHgxYTk0NDAwLCAweDFhOTY0MDAgfSwKKwkubnVtX2Rz
aV9waHkgPSAyLAorfTsKKwogY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzI4
bm1fbHBfY2ZncyA9IHsKIAkudHlwZSA9IE1TTV9EU0lfUEhZXzI4Tk1fTFAsCiAJLnNyY19wbGxf
dHJ1dGh0YWJsZSA9IHsge3RydWUsIHRydWV9LCB7dHJ1ZSwgdHJ1ZX0gfSwKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
