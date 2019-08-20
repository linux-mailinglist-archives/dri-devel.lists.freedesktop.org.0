Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2D96CAE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA4D6E8AB;
	Tue, 20 Aug 2019 23:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703266E8AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:06:33 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i30so82017pfk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a1GVwhYagMUqR4YrGTGm12es7UZSRELJ0+S6Uqb2xtg=;
 b=pA3WhP/znFq1a2q7/hGgQF9CDmIxkW9ejQtrB1FNqZ3nQVWD5hLAjsLRyw4b1ghe7X
 xnbOdcTWZHnnLshEUvIzK0hs7W//k/J7cDgnmG3NjQ4RsuKVg9pHS8J0VZuKiKUK/7xb
 AESjXVK7AdSvAycKnzGAZ0pPzJwt/on4EY6FNGqAbTW55klymcS22kswPSW5J7WSqH8M
 PIxKZwYeMX6IVKBciTPCaghRBlscjLE6lVRCvOcj81Nc+t+Fcsx7SS6ID9HIndgvZ4jx
 JqycuTAmWLYhA+wkuap3uHjMhu9SsWvBPTLKpQBMkiqKOSVDPPYovrhm0v27XInQ2EHa
 S5wA==
X-Gm-Message-State: APjAAAX9d8ORA8L6YlwosRxuO3Zgb11U51WrVyhQ9KiRjlivDSakgBKk
 Cze8YU4eWzEwDb4FIaWpcdCmHw==
X-Google-Smtp-Source: APXvYqxT0eCJKaQPFDkMyQyR74+WfkWox/lmoKEdkV85flDMF6esaDLd5hpaiKtRGi2yjMmv8A+vDQ==
X-Received: by 2002:aa7:96dc:: with SMTP id h28mr32692331pfq.86.1566342392992; 
 Tue, 20 Aug 2019 16:06:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:06:32 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 02/25] drm: kirin: Remove HISI_KIRIN_DW_DSI config option
Date: Tue, 20 Aug 2019 23:06:03 +0000
Message-Id: <20190820230626.23253-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a1GVwhYagMUqR4YrGTGm12es7UZSRELJ0+S6Uqb2xtg=;
 b=yFWWviaoJKvZh1gOUEEuvxQyXX8glgCMCwN+TIErGjfUlBngteyvmSPNhOofiL4Mii
 Zbop9rO9WeLspnC+iAyTRUzfQxjE0X7FR3LQ5A1amxtR1piWk0eyqPKNBvLkjhft2YgQ
 X0jPP1nB5GA03sEkSLeQwBSzMwgaNgn/joRlvd2tIjyt3cOwRVZk8+2tgd/HDUEH4wJ3
 jue0x0mf0hH83Pi/S34CETHHke/BbfFjwoAfxSgh4OUtbGoO38fwqqCPgmvxQQDVgftO
 dM5+qSshsRvTfLN2y7XS1oZf1DVuar/RI+KH01AtphduE0GzPy0N2Y8o3LTivXll9sZS
 t7wg==
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
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IFhpbmxpYW5nIExpdSA8ei5s
aXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGlu
YXJvLm9yZz4KLS0tCnY1OiBCdWlsZCBmaXh1cCBmb3IgbW9kdWxlIGNvbmZpZyBub3RpY2VkIGJ5
IFNhbQotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vS2NvbmZpZyAgfCAxMCAr
LS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL01ha2VmaWxlIHwgIDMg
Ky0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9LY29uZmlnIGIvZHJp
dmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9LY29uZmlnCmluZGV4IDBmYTI5YWYwOGFkMC4u
MjkwNTUzZTJmNmI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmlu
L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9LY29uZmlnCkBA
IC01LDE2ICs1LDggQEAgY29uZmlnIERSTV9ISVNJX0tJUklOCiAJc2VsZWN0IERSTV9LTVNfSEVM
UEVSCiAJc2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUgogCXNlbGVjdCBEUk1fS01TX0NNQV9IRUxQ
RVIKLQlzZWxlY3QgSElTSV9LSVJJTl9EV19EU0kKKwlzZWxlY3QgRFJNX01JUElfRFNJCiAJaGVs
cAogCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgaGlzaWxpY29uIEtpcmluIGNo
aXBzZXRzKGhpNjIyMCkuCiAJICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBj
YWxsZWQga2lyaW4tZHJtLgogCi1jb25maWcgSElTSV9LSVJJTl9EV19EU0kKLQl0cmlzdGF0ZSAi
SGlTaWxpY29uIEtpcmluIHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIFN5bm9wc3lzIERXIE1JUEkg
RFNJIgotCWRlcGVuZHMgb24gRFJNX0hJU0lfS0lSSU4KLQlzZWxlY3QgRFJNX01JUElfRFNJCi0J
aGVscAotCSBUaGlzIHNlbGVjdHMgc3VwcG9ydCBmb3IgSGlTaWxpY29uIEtpcmluIFNvQyBzcGVj
aWZpYyBleHRlbnNpb25zIGZvcgotCSB0aGUgU3lub3BzeXMgRGVzaWduV2FyZSBEU0kgZHJpdmVy
LiBJZiB5b3Ugd2FudCB0byBlbmFibGUgTUlQSSBEU0kgb24KLQkgaGk2MjIwIGJhc2VkIFNvQywg
eW91IHNob3VsZCBzZWxldCB0aGlzIG9wdGlvbi4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tp
cmluL01ha2VmaWxlCmluZGV4IGMwNTAxZmEzZmU1My4uZDkzMjNmNjZhN2Q0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL01ha2VmaWxlCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24va2lyaW4vTWFrZWZpbGUKQEAgLTIsNiArMiw1IEBACiBraXJpbi1k
cm0teSA6PSBraXJpbl9kcm1fZHJ2Lm8gXAogCSAgICAgICBraXJpbl9kcm1fYWRlLm8KIAotb2Jq
LSQoQ09ORklHX0RSTV9ISVNJX0tJUklOKSArPSBraXJpbi1kcm0ubworb2JqLSQoQ09ORklHX0RS
TV9ISVNJX0tJUklOKSArPSBraXJpbi1kcm0ubyBkd19kcm1fZHNpLm8KIAotb2JqLSQoQ09ORklH
X0hJU0lfS0lSSU5fRFdfRFNJKSArPSBkd19kcm1fZHNpLm8KLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
