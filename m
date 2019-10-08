Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A8FD07FA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AE56E8FD;
	Wed,  9 Oct 2019 07:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484C989956
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:05:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l21so17240467lje.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 05:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZ+v3Ie5jsyMpg1/r8HbbsX7sXk3b8d5gKwzOHbV1b8=;
 b=Pu1kZK0IUfZtr330BdrMD5X7QxnFOrhMz7C3SY2zpHqwttuZlkDaUqcggL0LSTNSd2
 vmrQQM9nbxCmp4zHRuruA9exT+Lljq/O43VcS23MBzOwNTBjcMAm1BiVzT5Adwe/sAnD
 Y6n33+YGhMYbIH1W94VKJ4weVc8rQV1Ve2K9u2Q+CQ6lbvzp459UJ9vIyN4HRyIzWmHP
 r23Mk3cWCWxkXE8lwgU3y6IVLs9IMI4KvwfK+r0o/rj61Sfylual+sFEjmdnqcPCCCKy
 Oq9A26ACfRAd+nBqIANd76nxOue7Vajbpqqt1pmWAmjHFT98OZstn1VGdaV0wbxRJimG
 butg==
X-Gm-Message-State: APjAAAXZvOQ/XNeGQaLpA5kyQHpCE+elCqEbjz+bSi5/qcXQesMhXFKc
 4V9sRCO7tm5VxFEVcWfeq+cbsA==
X-Google-Smtp-Source: APXvYqxr3LSKZs/gnEdARVmL8Fu4FXziognliaJ/7eGB45xQLrMsXf20NWCHuBIyf534zW7ay+klcg==
X-Received: by 2002:a2e:810e:: with SMTP id d14mr22480784ljg.160.1570536318667; 
 Tue, 08 Oct 2019 05:05:18 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z18sm3918033ljh.17.2019.10.08.05.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 05:05:17 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/4] backlight: pwm_bl: fix cie1913 comments and constant
Date: Tue,  8 Oct 2019 14:03:24 +0200
Message-Id: <20191008120327.24208-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZ+v3Ie5jsyMpg1/r8HbbsX7sXk3b8d5gKwzOHbV1b8=;
 b=W0ddgUpZ8caX090N18rJXEGsy5RctbdFr4Uj8eEHV+WXpAquDOJGemg+ouB0b7rO2k
 wQfnFphLbbQKFY/9KqpuIJl8qs1h1g3Lae36ILXsc4WNO/eomzP41sRPtH5RcLggU2XK
 ai8CJyNSJdiOh5PVAUkZIqTEPEq2lsZk8iZhY=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJicmVhay1ldmVuIiBwb2ludCBmb3IgdGhlIHR3byBmb3JtdWxhcyBpcyBMPT04LCB3aGlj
aCBpcyBhbHNvCndoYXQgdGhlIGNvZGUgYWN0dWFsbHkgaW1wbGVtZW50cy4gW0luY2lkZW50YWxs
eSwgYXQgdGhhdCBwb2ludCBvbmUKaGFzIFk9MC4wMDg4NTYsIG5vdCAwLjA4ODU2XS4KCk1vcmVv
dmVyLCBhbGwgdGhlIHNvdXJjZXMgSSBjYW4gZmluZCBzYXkgdGhlIGxpbmVhciBmYWN0b3IgaXMg
OTAzLjMKcmF0aGVyIHRoYW4gOTAyLjMsIHdoaWNoIG1ha2VzIHNlbnNlIHNpbmNlIHRoZW4gdGhl
IGZvcm11bGFzIGFncmVlIGF0Ckw9PTgsIGJvdGggeWllbGRpbmcgdGhlIDAuMDA4ODU2IGZpZ3Vy
ZSB0byBmb3VyIHNpZ25pZmljYW50IGRpZ2l0cy4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmls
bGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+Ci0tLQogZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMgfCAxMiArKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwppbmRleCA3
NDZlZWJjNDExZGYuLmNjNDRhMDJlOTVjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKQEAg
LTE1NSw4ICsxNTUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9vcHMgcHdtX2Jh
Y2tsaWdodF9vcHMgPSB7CiAgKgogICogVGhlIENJRSAxOTMxIGxpZ2h0bmVzcyBmb3JtdWxhIGlz
IHdoYXQgYWN0dWFsbHkgZGVzY3JpYmVzIGhvdyB3ZSBwZXJjZWl2ZQogICogbGlnaHQ6Ci0gKiAg
ICAgICAgICBZID0gKEwqIC8gOTAyLjMpICAgICAgICAgICBpZiBMKiDiiaQgMC4wODg1NgotICog
ICAgICAgICAgWSA9ICgoTCogKyAxNikgLyAxMTYpXjMgICAgaWYgTCogPiAwLjA4ODU2CisgKiAg
ICAgICAgICBZID0gKEwqIC8gOTAzLjMpICAgICAgICAgICBpZiBMKiDiiaQgOAorICogICAgICAg
ICAgWSA9ICgoTCogKyAxNikgLyAxMTYpXjMgICAgaWYgTCogPiA4CiAgKgogICogV2hlcmUgWSBp
cyB0aGUgbHVtaW5hbmNlLCB0aGUgYW1vdW50IG9mIGxpZ2h0IGNvbWluZyBvdXQgb2YgdGhlIHNj
cmVlbiwgYW5kCiAgKiBpcyBhIG51bWJlciBiZXR3ZWVuIDAuMCBhbmQgMS4wOyBhbmQgTCogaXMg
dGhlIGxpZ2h0bmVzcywgaG93IGJyaWdodCBhIGh1bWFuCkBAIC0xNjksOSArMTY5LDE1IEBAIHN0
YXRpYyB1NjQgY2llMTkzMSh1bnNpZ25lZCBpbnQgbGlnaHRuZXNzLCB1bnNpZ25lZCBpbnQgc2Nh
bGUpCiB7CiAJdTY0IHJldHZhbDsKIAorCS8qCisJICogQGxpZ2h0bmVzcyBpcyBnaXZlbiBhcyBh
IG51bWJlciBiZXR3ZWVuIDAgYW5kIDEsIGV4cHJlc3NlZAorCSAqIGFzIGEgZml4ZWQtcG9pbnQg
bnVtYmVyIGluIHNjYWxlIEBzY2FsZS4gQ29udmVydCB0byBhCisJICogcGVyY2VudGFnZSwgc3Rp
bGwgZXhwcmVzc2VkIGFzIGEgZml4ZWQtcG9pbnQgbnVtYmVyLCBzbyB0aGUKKwkgKiBhYm92ZSBm
b3JtdWxhcyBjYW4gYmUgYXBwbGllZC4KKwkgKi8KIAlsaWdodG5lc3MgKj0gMTAwOwogCWlmIChs
aWdodG5lc3MgPD0gKDggKiBzY2FsZSkpIHsKLQkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NFU1Rf
VUxMKGxpZ2h0bmVzcyAqIDEwLCA5MDIzKTsKKwkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NFU1Rf
VUxMKGxpZ2h0bmVzcyAqIDEwLCA5MDMzKTsKIAl9IGVsc2UgewogCQlyZXR2YWwgPSBpbnRfcG93
KChsaWdodG5lc3MgKyAoMTYgKiBzY2FsZSkpIC8gMTE2LCAzKTsKIAkJcmV0dmFsID0gRElWX1JP
VU5EX0NMT1NFU1RfVUxMKHJldHZhbCwgKHNjYWxlICogc2NhbGUpKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
