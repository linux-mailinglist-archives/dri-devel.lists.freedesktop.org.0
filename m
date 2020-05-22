Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438171DF661
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959306E91C;
	Sat, 23 May 2020 09:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97706E14D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:15:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t8so4304021wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKAL92q0Ci52kZCwbvnlfVSuzATsT4BlcolHSe2kRwA=;
 b=Ma0iYnPOu18BXyUM2shyVIEPYAFkkDlzr4V0aTIoaJMJu2X0bZtj1x1MiTOvGqa0JJ
 zbe9aFR1z083hhwx2sYPPpD6K9MDaa0JNYDfZPYkWb6+ZQRnKlKKvUwB3jiJzxk96bTg
 AMaQW8IYqJnKo6PBH1UilzfJGZB7TjcrcfZHu+9CuPAr200CyRAcfMd1oU0q0x5Y9oO3
 Im1+W9qaZ4mikvdB91CP83kXAywPrthNh0duQHX+hVNot/MxYoWc9r03BvS2nx7iIUlu
 k+fVjm1ZPvi9cYlCfBraVVSAz6BN9dIQR3xGAz68B1GQg37++HQNgvYF4dH1w8egnrh3
 6CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKAL92q0Ci52kZCwbvnlfVSuzATsT4BlcolHSe2kRwA=;
 b=uFNT4CKsKanHsDNsrAVLM6rabMpKNyG/tnfWMYQPTTdvyCjhidsdNkd7z9ADLFYvr5
 F59IbcnC+IE7afQD7rU3/TKsQvYwUQcR5Rn2XEC8BB4V1N6xrl6djpEHx+fLVVK0O6JS
 aXTeolcYLdi1nVMmUDjs3saZBCD4wen6lx1XBesCP5invPQZohc4VX7yVpw0kWUOS/uq
 0xp6xjSwzvjc2iveoGjplxNmDstC4ktMayhf7LsjU3rKNwLvHRqjG6U2Ps9QJROZXXUR
 9Jhu0Hd7Uz2tYN6PAbTfYN/vgKHutPTAgsGsJbRVzJGEkOPL1kgAOUeljRlSxZHyQ9vJ
 33Zg==
X-Gm-Message-State: AOAM532VqQ7gnYu0rF+SdP0dC2FefO3Qo1pol7dVJDcyXJb1k9mKhQZi
 E7AOkb6dwOXJP9rAvmZFTEU=
X-Google-Smtp-Source: ABdhPJxfxLCgrUYA6xryeUMaIeXfb1eR8QQ5Ia19IxIsjWiD/P2PTMcWNjzdcSkchlscqpb3L5SE7w==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr14105746wmh.121.1590149728253; 
 Fri, 22 May 2020 05:15:28 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:27 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date: Fri, 22 May 2020 14:15:20 +0200
Message-Id: <20200522121524.4161539-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KIHY0OiBubyBjaGFu
Z2VzLgogdjM6IG5vIGNoYW5nZXMuCiB2MjogZml4IGNvbW1pdCB0aXRsZS4KCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YnJjbW5hbmQvYnJjbW5hbmQuYwppbmRleCBlNGUzY2VlYWMzOGYuLjZhMDhkZDA3YjA1OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0zMzgsOCArMzM4LDgg
QEAgZW51bSBicmNtbmFuZF9yZWcgewogCUJSQ01OQU5EX0ZDX0JBU0UsCiB9OwogCi0vKiBCUkNN
TkFORCB2NC4wICovCi1zdGF0aWMgY29uc3QgdTE2IGJyY21uYW5kX3JlZ3NfdjQwW10gPSB7Cisv
KiBCUkNNTkFORCB2My4zLXY0LjAgKi8KK3N0YXRpYyBjb25zdCB1MTYgYnJjbW5hbmRfcmVnc192
MzNbXSA9IHsKIAlbQlJDTU5BTkRfQ01EX1NUQVJUXQkJPSAgMHgwNCwKIAlbQlJDTU5BTkRfQ01E
X0VYVF9BRERSRVNTXQk9ICAweDA4LAogCVtCUkNNTkFORF9DTURfQUREUkVTU10JCT0gIDB4MGMs
CkBAIC01OTEsOCArNTkxLDggQEAgc3RhdGljIGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0
cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsKQogCQljdHJsLT5yZWdfb2Zmc2V0cyA9IGJy
Y21uYW5kX3JlZ3NfdjYwOwogCWVsc2UgaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA1MDAp
CiAJCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192NTA7Ci0JZWxzZSBpZiAoY3Ry
bC0+bmFuZF92ZXJzaW9uID49IDB4MDQwMCkKLQkJY3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFu
ZF9yZWdzX3Y0MDsKKwllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwMzAzKQorCQlj
dHJsLT5yZWdfb2Zmc2V0cyA9IGJyY21uYW5kX3JlZ3NfdjMzOwogCiAJLyogQ2hpcC1zZWxlY3Qg
c3RyaWRlICovCiAJaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA3MDEpCi0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
