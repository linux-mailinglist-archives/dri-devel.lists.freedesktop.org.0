Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F80C0022
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3E26EE77;
	Fri, 27 Sep 2019 07:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD9A6ED0D;
 Thu, 26 Sep 2019 10:53:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so2179969wma.5;
 Thu, 26 Sep 2019 03:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mt79FACg8KJGTFknyOsP1lh+SJ3rZOsF4QnZInEDNyI=;
 b=XYfX6FanfYNS3+uHp8/epkP6djuIMPCupHDE+MKDeYwT9ci84V1hdpCysGFBC959nE
 1PqSTVlt/xWqtdpRY+Q2eDUFzurX69KWbUU2VN1Cn1TkFTjCGda7ZR8OiMDs7NtQvqDu
 +XARwPOyVoSAcG4ar/jNiCFjIA44vYyIb78OtkpmdXA8A/81POFmlUrqkB2ZFKKHM2ps
 2MafAkFtT6dza312HNSZf5+0ER6KTToQP8ztOu+pJFqOG7Ty6UhKnihZz/IFUiIOYMXa
 PVQCAzy0Nr6YFgyVZFdLDDUaU9up4WNKxn/cXZZWznuPoiyr0rREZ3ko6hvGyS0gB+St
 /sgw==
X-Gm-Message-State: APjAAAUTJNqVi6FR7yGtXxhRdipnvD6VxjlyejAKR/i9twt/0S62t9lw
 jTmKm+zZXhsjiAmvOo1tHFE=
X-Google-Smtp-Source: APXvYqynE9Yw48REoXunTGlHGzRSG4TmFdFacSTlp82JMH/IQvefsaQHUUOqxb3p8nNqfbSrE3ELOg==
X-Received: by 2002:a1c:5942:: with SMTP id n63mr2516877wmb.65.1569495204295; 
 Thu, 26 Sep 2019 03:53:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 03:53:23 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] drm/msm/dsi: Add configuration for 8x56
Date: Thu, 26 Sep 2019 12:52:55 +0200
Message-Id: <20190926105256.61412-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mt79FACg8KJGTFknyOsP1lh+SJ3rZOsF4QnZInEDNyI=;
 b=Z0Txe1CXgf8CZF9OifOCDKyTXm+6smxlCRq/3A43oGXtHQBazfHKzTGpWGaBae6SMY
 8ch0Ks6vv8mV0UsYhau99w8Ak5MDBD9iLRYe+QitJcjSqSJiymiWO/Uwrmwlwry37XeC
 7/Pd9v2ntYJnWUzb3kixRb+ER8FPn8uppwZFFm5Rce928DKlWJNJT478D6fXjqYWbGeS
 P785kMWl5CYyz+HunvLF+UAtBHj10Hlro3fR8FIX7N1xgbHfP2kH4OcC0wPy7FWwxxbP
 1r6C1JZAPdKDKas3f02/cTTP8o4pruxhL1+gZNNIqlWHZSAyCX6MtVqI7bt0kbosIZER
 l/Tg==
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

RnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNvbT4KCk1TTTg5NTYv
QVBRODA1NiBoYXMgRFNJIHZlcnNpb24gMzoxMDA0MDAwMiAoRFNJIDZHIFYxLjQuMiksIGZlYXR1
cmluZwp0d28gRFNJcy4gSXQgbmVlZHMgdGhyZWUgY2xvY2tzIChtZHBfY29yZSwgaWZhY2UsIGJ1
cyksIG9uZSBHRFNDIGFuZAp0d28gdnJlZ3MsIFZEREEgYXQgMS4yViBhbmQgVkRESU8gYXQgMS44
Vi4KClNpZ25lZC1vZmYtYnk6IEFuZ2VsbyBHLiBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYyB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuaCB8ICAxICsKIDIg
ZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHNpL2RzaV9jZmcuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcu
YwppbmRleCBiN2I3YzFhOTE2NGEuLmQ1ODVhYjdhY2RlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2Rz
aV9jZmcuYwpAQCAtNjYsNiArNjYsMjYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2Nv
bmZpZyBtc204OTE2X2RzaV9jZmcgPSB7CiAJLm51bV9kc2kgPSAxLAogfTsKIAorc3RhdGljIGNv
bnN0IGNoYXIgKiBjb25zdCBkc2lfODk1Nl9idXNfY2xrX25hbWVzW10gPSB7CisJIm1kcF9jb3Jl
IiwgImlmYWNlIiwgImJ1cyIsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9kc2lfY29u
ZmlnIG1zbTg5NTZfZHNpX2NmZyA9IHsKKwkuaW9fb2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwK
KwkucmVnX2NmZyA9IHsKKwkJLm51bSA9IDMsCisJCS5yZWdzID0geworCQkJeyJnZHNjIiwgLTEs
IC0xfSwKKwkJCXsidmRkYSIsIDEwMDAwMCwgMTAwfSwJLyogMS4yIFYgKi8KKwkJCXsidmRkaW8i
LCAxMDAwMDAsIDEwMH0sCS8qIDEuOCBWICovCisJCX0sCisJfSwKKwkuYnVzX2Nsa19uYW1lcyA9
IGRzaV84OTU2X2J1c19jbGtfbmFtZXMsCisJLm51bV9idXNfY2xrcyA9IEFSUkFZX1NJWkUoZHNp
Xzg5NTZfYnVzX2Nsa19uYW1lcyksCisJLmlvX3N0YXJ0ID0geyAweDFhOTQwMDAsIDB4MWE5NjAw
MCB9LAorCS5udW1fZHNpID0gMiwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9j
b25maWcgbXNtODk5NF9kc2lfY2ZnID0gewogCS5pb19vZmZzZXQgPSBEU0lfNkdfUkVHX1NISUZU
LAogCS5yZWdfY2ZnID0gewpAQCAtMTk3LDYgKzIxNyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXNtX2RzaV9jZmdfaGFuZGxlciBkc2lfY2ZnX2hhbmRsZXJzW10gPSB7CiAJCSZtc204OTE2X2Rz
aV9jZmcsICZtc21fZHNpXzZnX2hvc3Rfb3BzfSwKIAl7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1T
TV9EU0lfNkdfVkVSX01JTk9SX1YxXzRfMSwKIAkJJm1zbTg5OTZfZHNpX2NmZywgJm1zbV9kc2lf
NmdfaG9zdF9vcHN9LAorCXtNU01fRFNJX1ZFUl9NQUpPUl82RywgTVNNX0RTSV82R19WRVJfTUlO
T1JfVjFfNF8yLAorCQkmbXNtODk1Nl9kc2lfY2ZnLCAmbXNtX2RzaV82Z19ob3N0X29wc30sCiAJ
e01TTV9EU0lfVkVSX01BSk9SXzZHLCBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMl8yXzAsCiAJCSZt
c204OTk4X2RzaV9jZmcsICZtc21fZHNpXzZnX3YyX2hvc3Rfb3BzfSwKIAl7TVNNX0RTSV9WRVJf
TUFKT1JfNkcsIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzJfMSwKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2Rz
aV9jZmcuaAppbmRleCBlMmI3YTdkZmJlNDkuLjUwYTM3Y2ViNmEyNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaV9jZmcuaApAQCAtMTcsNiArMTcsNyBAQAogI2RlZmluZSBNU01fRFNJXzZHX1ZFUl9N
SU5PUl9WMV8zCTB4MTAwMzAwMDAKICNkZWZpbmUgTVNNX0RTSV82R19WRVJfTUlOT1JfVjFfM18x
CTB4MTAwMzAwMDEKICNkZWZpbmUgTVNNX0RTSV82R19WRVJfTUlOT1JfVjFfNF8xCTB4MTAwNDAw
MDEKKyNkZWZpbmUgTVNNX0RTSV82R19WRVJfTUlOT1JfVjFfNF8yCTB4MTAwNDAwMDIKICNkZWZp
bmUgTVNNX0RTSV82R19WRVJfTUlOT1JfVjJfMl8wCTB4MjAwMDAwMDAKICNkZWZpbmUgTVNNX0RT
SV82R19WRVJfTUlOT1JfVjJfMl8xCTB4MjAwMjAwMDEKIAotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
