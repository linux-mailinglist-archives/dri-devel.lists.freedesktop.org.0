Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B638DD52
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3A56E7D5;
	Wed, 14 Aug 2019 18:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08006E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:12 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 129so7187142pfa.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZyAGMPNMpuVXR2jkt8gh8WUfYnDQXgrGIfOGthyfg8o=;
 b=sbFnKAK/weNNhj0jXvXNM5SlWKT6Yo4wY2/zbrZcF1HYzFC6gtLvAn1+x3XDRbyHMO
 xvy5jJWeFg9hTOvUXQrDTdkx/YSyYq0ilGBVMYSGJbL2NtymMaPhTcDBzFD7rfLiQuje
 c4nMob4eExrHUjE5CujleYKaTKJWo1wbiUXaYiYiEJK4dfBR46+XQuSE2xIeg1EeJ1T0
 S/9c0hfkNvxTn08KGskdXWnYSf/FQAryoMy+i+LlM2WVOhM9MSbqOB0NEJjdwg5Rf95G
 F79XNbo0EwjWZoNblfzVhgf9bblSW+ZvEACgl3uJJzkqcAk0ElybwLNDbFMMWVdzjrB/
 MHOg==
X-Gm-Message-State: APjAAAUPnNoeNBRawz/ANm0DCmPDZJ195VDRjkQfHTLN4jlaBBtgQUtF
 bOjgp0ER340Cd64frulo3nFk0w==
X-Google-Smtp-Source: APXvYqx2ATmZWXgkLdV3QzZflhCxpHcPXcxbWBN7V0nc/tthxryzI4TQboQLFuMmgL6bwajwF4MfTQ==
X-Received: by 2002:a17:90a:aa98:: with SMTP id
 l24mr1091282pjq.64.1565808432086; 
 Wed, 14 Aug 2019 11:47:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:11 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 03/26] drm: kirin: Remove HISI_KIRIN_DW_DSI config
 option
Date: Wed, 14 Aug 2019 18:46:39 +0000
Message-Id: <20190814184702.54275-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZyAGMPNMpuVXR2jkt8gh8WUfYnDQXgrGIfOGthyfg8o=;
 b=new8xX0jxsoxrQMLLTjQzxCi9sEMmOw0y08XqrmCsvQjSiFIOUH2oFECZQOjzm47Ew
 cXFDtMTKt5ft82uI3BfQLWS/OucPSunD0m00lu6dNFtnM4Yfuj6jLpUqfTpGMp3RlxqZ
 g9GZTqDt3eOQchKPiQOtPjF78VjyeoPaP7K5itoS/AY+LMzle2ccLPW5i621gwojmzeQ
 Udq8vzMc/+yOPa5NVaijaIrBenAGLaCwPGUnOG2Equi+zkUn4KWtg9NK6iSdxz+xP+kt
 Rs5sSj4j5c6LTIoBzwooGqYLjO6iXDjfUVaEVudnMBD8BHVXYJcYoiO7/SScGSbtiXo9
 02zg==
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
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIENPTkZJR19ISVNJX0tJUklOX0RXX0RTSSBvcHRpb24gaXMgb25seSB1c2VkIHcvIGtpcmlu
CmRyaXZlciwgc28gY3V0IG91dCB0aGUgbWlkZGxlbWFuIGFuZCBjb25kZW5zZSB0aGUgY29uZmln
CmxvZ2ljIGRvd24uCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25ncm9uZ0BnbWFpbC5jb20+CkNj
OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9LY29uZmln
ICB8IDEwICstLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vTWFrZWZp
bGUgfCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9LY29uZmlnCmluZGV4IDBmYTI5
YWYwOGFkMC4uMjkwNTUzZTJmNmI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxp
Y29uL2tpcmluL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9L
Y29uZmlnCkBAIC01LDE2ICs1LDggQEAgY29uZmlnIERSTV9ISVNJX0tJUklOCiAJc2VsZWN0IERS
TV9LTVNfSEVMUEVSCiAJc2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUgogCXNlbGVjdCBEUk1fS01T
X0NNQV9IRUxQRVIKLQlzZWxlY3QgSElTSV9LSVJJTl9EV19EU0kKKwlzZWxlY3QgRFJNX01JUElf
RFNJCiAJaGVscAogCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgaGlzaWxpY29u
IEtpcmluIGNoaXBzZXRzKGhpNjIyMCkuCiAJICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUg
d2lsbCBiZSBjYWxsZWQga2lyaW4tZHJtLgogCi1jb25maWcgSElTSV9LSVJJTl9EV19EU0kKLQl0
cmlzdGF0ZSAiSGlTaWxpY29uIEtpcmluIHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIFN5bm9wc3lz
IERXIE1JUEkgRFNJIgotCWRlcGVuZHMgb24gRFJNX0hJU0lfS0lSSU4KLQlzZWxlY3QgRFJNX01J
UElfRFNJCi0JaGVscAotCSBUaGlzIHNlbGVjdHMgc3VwcG9ydCBmb3IgSGlTaWxpY29uIEtpcmlu
IFNvQyBzcGVjaWZpYyBleHRlbnNpb25zIGZvcgotCSB0aGUgU3lub3BzeXMgRGVzaWduV2FyZSBE
U0kgZHJpdmVyLiBJZiB5b3Ugd2FudCB0byBlbmFibGUgTUlQSSBEU0kgb24KLQkgaGk2MjIwIGJh
c2VkIFNvQywgeW91IHNob3VsZCBzZWxldCB0aGlzIG9wdGlvbi4KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2tpcmluL01ha2VmaWxlCmluZGV4IGMwNTAxZmEzZmU1My4uYzUwNjA2Y2ZiYmRiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL01ha2VmaWxlCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vTWFrZWZpbGUKQEAgLTEsNyArMSw3IEBA
CiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIGtpcmluLWRybS15IDo9
IGtpcmluX2RybV9kcnYubyBcCi0JICAgICAgIGtpcmluX2RybV9hZGUubworCSAgICAgICBraXJp
bl9kcm1fYWRlLm8gXAorCSAgICAgICBkd19kcm1fZHNpLm8KIAogb2JqLSQoQ09ORklHX0RSTV9I
SVNJX0tJUklOKSArPSBraXJpbi1kcm0ubwogCi1vYmotJChDT05GSUdfSElTSV9LSVJJTl9EV19E
U0kpICs9IGR3X2RybV9kc2kubwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
