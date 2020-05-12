Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97F1D0B7F
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217736E0ED;
	Wed, 13 May 2020 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753956E858
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:33:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f134so8394798wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G5WeydaheRjYC65flS9VBT/GaukdHAjM5PopK1ROBpE=;
 b=uGzylulqminwzQ6povM6ovuuUBe0WiR4xU6SJn+/ZSYfSjJBCwlFQK0jgTnK48gceG
 BDESWCgsNMop/6BdmxKJRpgdT3qA6z/M4og5XoHwArvwSsUiVikxCWL9PR/d2Q3oJBKd
 4D4ag5Wj03XHA0MDGSxGSyso2qvooQRLfFHGagytBBiB0WhxpFyYrtC8cw9Ivc0xJFnJ
 PFp0FFvnX0h1gm8K85juN3SgJ0GpLAjMP0aEVxM8vLScYZd6dZNMwt0Oz6fSSqxoq7nA
 mB5n366zhZTIJpm4Pw+AAsQjkZ3mKxBcWuxqm2tLqFlhrYTVGJ8jTPiVU87inTwss5TP
 vJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5WeydaheRjYC65flS9VBT/GaukdHAjM5PopK1ROBpE=;
 b=dkjkDr/vjy4hCpH2p6CywFD9w5MypQGWhLnp1O8WcH1KbCpq/H99SbnXh87EKYvXpD
 M38s64bUlvzQicMT5j6D3QnE/RuD1u6yL4aXEpx2srd2tOvi+31+JwOfl+akz91bvUr8
 n7W201Eq1oIyBrFZYT7LWZyJyF/EwJ5tfV6/IQ/iJKzeXagKm3rJKLSSNUSHCK5bLT2H
 eXYoc1CZhT4g7UFmmvx1J+XhcPcCrKHivMs0PBjlDNA89NfGQMtoxQxk01yMArzWKHqq
 VtFc8djpNXpB4Zs0oD0HPof+YhguH3Ys8B13QSvvFgIA8uMhb8hfUzPafbrnI34eAnCv
 uisA==
X-Gm-Message-State: AOAM53095eAwuvowPNSzeVvCDhL71xuxCt0JCJ5dWM3m2vr7I46oRat5
 jW6Ym0L3NOmzgneasUgfjVA=
X-Google-Smtp-Source: ABdhPJy5oH7h1efIv7HKPXfxD75jowwabOsBtrEQiCX/KAWe4Acx+HNa053Yh3bIJDVBJsMfhrDqJg==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr1320114wmg.162.1589268817065; 
 Tue, 12 May 2020 00:33:37 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:36 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 3/5] mtd: rawnand: brcmnand: rename page sizes
Date: Tue, 12 May 2020 09:33:27 +0200
Message-Id: <20200512073329.742893-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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

Q3VycmVudCBwYWdlcyBzaXplcyBhcHBseSB0byBjb250cm9sbGVycyBhZnRlciB2My40CgpTaWdu
ZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgot
LS0KIHYyOiBhZGQgbmV3IHBhdGNoLgoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXgg
NzJiMjY4ZDhlM2E0Li5lZjYwZGJiZWFjMmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYwpAQCAtNTcxLDcgKzU3MSw3IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2
aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKIHsKIAlzdGF0aWMg
Y29uc3QgdW5zaWduZWQgaW50IGJsb2NrX3NpemVzX3Y2W10gPSB7IDgsIDE2LCAxMjgsIDI1Niwg
NTEyLCAxMDI0LCAyMDQ4LCAwIH07CiAJc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBibG9ja19z
aXplc192NFtdID0geyAxNiwgMTI4LCA4LCA1MTIsIDI1NiwgMTAyNCwgMjA0OCwgMCB9OwotCXN0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcGFnZV9zaXplc1tdID0geyA1MTIsIDIwNDgsIDQwOTYs
IDgxOTIsIDAgfTsKKwlzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHBhZ2Vfc2l6ZXNfdjNfNFtd
ID0geyA1MTIsIDIwNDgsIDQwOTYsIDgxOTIsIDAgfTsKIAogCWN0cmwtPm5hbmRfdmVyc2lvbiA9
IG5hbmRfcmVhZHJlZyhjdHJsLCAwKSAmIDB4ZmZmZjsKIApAQCAtNjE4LDcgKzYxOCw3IEBAIHN0
YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxl
ciAqY3RybCkKIAkJY3RybC0+bWF4X3BhZ2Vfc2l6ZSA9IDE2ICogMTAyNDsKIAkJY3RybC0+bWF4
X2Jsb2NrX3NpemUgPSAyICogMTAyNCAqIDEwMjQ7CiAJfSBlbHNlIHsKLQkJY3RybC0+cGFnZV9z
aXplcyA9IHBhZ2Vfc2l6ZXM7CisJCWN0cmwtPnBhZ2Vfc2l6ZXMgPSBwYWdlX3NpemVzX3YzXzQ7
CiAJCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNjAwKQogCQkJY3RybC0+YmxvY2tfc2l6
ZXMgPSBibG9ja19zaXplc192NjsKIAkJZWxzZQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
