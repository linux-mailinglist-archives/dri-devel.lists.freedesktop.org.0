Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5622799A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070C26E42F;
	Tue, 21 Jul 2020 07:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924386E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:39:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 17so1854341wmo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJUflLSxHtf/sa8csoJgmFcN71WVeF/7yJM+R1zANs4=;
 b=aNZscceQn1Dl45cuBWyWTUy4PJD9d6KTGqmPfZ+4chPoR4Dl6+IMEpbgutX90tTDCc
 mYqm3dJZd9xCJyxoJoxg5iduHcWbg1nRZeRTkz9BQ1UE9HaSElwDMcKE0VImX+gSk+VS
 vSBnvljYJV7ZTwM6AZK4VCDxCZsECTxSXV19qEfiW4lrKi5/l0z2egPui2rS7FKf11Vp
 qx1SZBu4DpSYMnU+8tjOFzSp3GUzE7hjMnY1iZ3FUzp35hGe+UJqmvnx9pR2kauU2KoT
 U9zlJHrAt4LtfWmnsPtkuFq7jea/Q4E6zhR1ZS0owhTslgy0AZM2+CUsjA7beEUURO4i
 l1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJUflLSxHtf/sa8csoJgmFcN71WVeF/7yJM+R1zANs4=;
 b=cRf87cfRX6BiYv9iA7xtMwbqIoAqnfd2tXHEJwHybPsub26rtlNNobGLhkEP+YOsBK
 YBccql14uHsaFmftt1FiHkL4y2h4y94bhWAbKtFYZ1AABZnvlbExRXg8Rad6M1E2OydS
 hUmidcp0QCdb6n6EXvE4WsB/YNCQXbZ4jVHkPOjofHxNNV9WRfS1rSnOu3L2we0ObCnT
 ha3lJWixt9X0zSSV/BjPX02I4Ns40tT7THs5mg6hqOF8D2LAYkNKNKP9crNhYC1+saEp
 2NoszvnqZwsEAQEwBpFI347L/n43pFjm21n/J6s3tro8Or0ZnSLu8zl1a1oLBKzn4i6f
 o50Q==
X-Gm-Message-State: AOAM530Moi84n9QsfQ+WJj8p+h2VttlcEX7mcZV91AOnHMVoenztscGb
 74W6IwFx271UhsiCGb3gkjhzMg==
X-Google-Smtp-Source: ABdhPJzbYVjXuGfCryUzJsjd1CTsxTUcEGzi8mFH5cZrwPDVBk6/y6QpO5ShaXYOJYxZo542tq2TKg==
X-Received: by 2002:a1c:dd86:: with SMTP id u128mr2752246wmg.123.1595317166220; 
 Tue, 21 Jul 2020 00:39:26 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id a123sm2484009wmd.28.2020.07.21.00.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:39:25 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/1] video: backlight: cr_bllcd: Remove unused variable
 'intensity'
Date: Tue, 21 Jul 2020 08:39:19 +0100
Message-Id: <20200721073919.925935-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBrZXJuZWwgYnVpbGQgd2FybmluZzoKCiBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9jcl9ibGxjZC5jOiBJbiBmdW5jdGlvbiDigJhjcl9iYWNrbGlnaHRfc2V0X2lu
dGVuc2l0eeKAmToKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmM6NjI6Njogd2Fy
bmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGludGVuc2l0eeKAmSBbLVd1bnVzZWQtdmFyaWFibGVd
CiA2MiB8IGludCBpbnRlbnNpdHkgPSBiZC0+cHJvcHMuYnJpZ2h0bmVzczsKIHwgXn5+fn5+fn5+
CgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGFuaWVsIFRob21wc29u
IDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFA
Z21haWwuY29tPgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNh
bXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgt
ZmJkZXZAdmdlci5rZXJuZWwub3JnCkZpeGVzOiAyNGQzNDYxN2MyNGYgKCJiYWNrbGlnaHQ6IGNy
X2JsbGNkOiBJbnRyb2R1Y2UgZ3Bpby1iYWNrbGlnaHQgc2VtYW50aWNzIikKU2lnbmVkLW9mZi1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9jcl9ibGxjZC5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmMgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9jcl9ibGxjZC5jCmluZGV4IGEyNGQ0MmUxZWEzY2QuLjRhZDBhNzI1
MzFmZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmMKKysr
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvY3JfYmxsY2QuYwpAQCAtNTksNyArNTksNiBAQCBz
dHJ1Y3QgY3JfcGFuZWwgewogCiBzdGF0aWMgaW50IGNyX2JhY2tsaWdodF9zZXRfaW50ZW5zaXR5
KHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpiZCkKIHsKLQlpbnQgaW50ZW5zaXR5ID0gYmQtPnBy
b3BzLmJyaWdodG5lc3M7CiAJdTMyIGFkZHIgPSBncGlvX2JhciArIENSVk1MX1BBTkVMX1BPUlQ7
CiAJdTMyIGN1ciA9IGlubChhZGRyKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
