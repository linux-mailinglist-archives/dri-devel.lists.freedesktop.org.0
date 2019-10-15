Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8405D7BF8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D5B6E860;
	Tue, 15 Oct 2019 16:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B096E2D3;
 Tue, 15 Oct 2019 10:11:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j11so23126906wrp.1;
 Tue, 15 Oct 2019 03:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTcxngXEkdeT6TmpQoj373zyfLdTNEDntvuleghb3z0=;
 b=LXzO29c6J1Fsr2gycH05tePZdjxBFlf685JycVDJvS+U4V9shl7q9lIoTP//DV+Iam
 25iYQSQwIILAZ9io3GKDua9DHG4/BgmvxFdf9WGs08EHoBjueDmoA4HctZgxLb7VHtAA
 chJDORGj9U0jrmcZ+y6j58mOxwWimKx2r1fuN8npj81alnrxNKisZ+pZ46RSLEVNzrta
 YSgO3KcUpBV2y0miMlOjunr0JO9m3RhLrOMnatJz3v8qxxcXvVSRSuQCXy/l6i5c+r8r
 a61y3f3lRaVWJ/Pieia339hsKy9zmBfe/UkLEf49MmNwFRQIUWE5qJVxT7ve3Uv4b/ul
 DJQw==
X-Gm-Message-State: APjAAAXHhDAp48k3JAixTsNJOh7rG6BeWGggyyFIAhzWckJHVBOqAPni
 oA4GuW4uuJVBL4oWIP2thQA=
X-Google-Smtp-Source: APXvYqx432gjFnXZKeEVX6PE1pt4uYSzdjJ9xDnwcnNJxxi74raOf/9SMD8lTM3ejiLUqunU0pwGkA==
X-Received: by 2002:adf:f511:: with SMTP id q17mr1444270wro.3.1571134265626;
 Tue, 15 Oct 2019 03:11:05 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 03:11:05 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 4/7] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date: Tue, 15 Oct 2019 12:10:55 +0200
Message-Id: <20191015101058.37157-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTcxngXEkdeT6TmpQoj373zyfLdTNEDntvuleghb3z0=;
 b=Tk3U4INVvMhn3XuqivdMRKYFmy1lMLS1ACVuZo/76VgXTjomtOlZ9OqUlracsv33Vq
 xFRM90kKKiMBBX2Ye8yIe2AWio4DmGOfvK5e4FCxQkKGwiajFBGfMYSrMFidAo0JZqt6
 sqYkVftgtyc21x4VFhS+jB1QojVVwJSYMIR2Z5Q3r/PL97TAb8HnkzZSTa1YdE7o4UtC
 kTdMD3UDPaRixQN4c+ux/5arVaXw77pxXkwEQAN4WwhuvZ1nwrH/6bTQ6H+XfJU0NNH6
 zIblq1TUfLvRJo3U16cbRxDaSlq06we2oGa/E3UW2RxmRX6fJiHbl/wtLhzm4NuxMHEG
 QuEw==
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
YzJhYS4uM2I5MzAwNTQ1ZTE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
aHkvZHNpX3BoeV8yOG5tLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9w
aHlfMjhubS5jCkBAIC0xNDIsNiArMTQyLDI0IEBAIGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9j
ZmcgZHNpX3BoeV8yOG5tX2hwbV9jZmdzID0gewogCS5udW1fZHNpX3BoeSA9IDIsCiB9OwogCitj
b25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMjhubV9ocG1fZmFtYl9jZmdzID0g
eworCS50eXBlID0gTVNNX0RTSV9QSFlfMjhOTV9IUE0sCisJLnNyY19wbGxfdHJ1dGh0YWJsZSA9
IHsge3RydWUsIHRydWV9LCB7ZmFsc2UsIHRydWV9IH0sCisJLnJlZ19jZmcgPSB7CisJCS5udW0g
PSAxLAorCQkucmVncyA9IHsKKwkJCXsidmRkaW8iLCAxMDAwMDAsIDEwMH0sCisJCX0sCisJfSwK
Kwkub3BzID0geworCQkuZW5hYmxlID0gZHNpXzI4bm1fcGh5X2VuYWJsZSwKKwkJLmRpc2FibGUg
PSBkc2lfMjhubV9waHlfZGlzYWJsZSwKKwkJLmluaXQgPSBtc21fZHNpX3BoeV9pbml0X2NvbW1v
biwKKwl9LAorCS5pb19zdGFydCA9IHsgMHgxYTk0NDAwLCAweDFhOTQ4MDAgfSwKKwkubnVtX2Rz
aV9waHkgPSAyLAorfTsKKwogY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzI4
bm1fbHBfY2ZncyA9IHsKIAkudHlwZSA9IE1TTV9EU0lfUEhZXzI4Tk1fTFAsCiAJLnNyY19wbGxf
dHJ1dGh0YWJsZSA9IHsge3RydWUsIHRydWV9LCB7dHJ1ZSwgdHJ1ZX0gfSwKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
