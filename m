Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A056510E8D3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 11:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622CF89F33;
	Mon,  2 Dec 2019 10:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C77D89F33
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 10:30:12 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l18so9491597lfc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 02:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWr52qMHrq81YooAhz2Ofw6lZ/vpXG4vSevmtkN9BzI=;
 b=NXHF7u/le8fJ8iRhF0P9IuYNcCFSsDi6XxrWU2zYi1v4jvGy2afnOCf6ywxnQWsitA
 /KDxxlMwspgwyblzfFXelAvqs2WftKCyXcpJ1IDbwu71Na4qeHi1nV2c+q7MgWSeEEbW
 nVGGVgHV+JfYyQAwv09iiD/xc2MUD+rFMxh9P/NyqP32q3bnVEQz+f5z70T9Z+P7kwNp
 b/j89v8RZalwo54A2I/Qs4nirQN1L1lQlu4o3qj0HcdXCzACg98014T+LU1NigpZl5Hg
 qwOuCWSteX7RZSzXJ0H/F8zajt1ke9wCJEq1JrcjoIANBIMfpRaywtkBqDDPvu1/ZBWy
 6D6g==
X-Gm-Message-State: APjAAAXhbIe8w4prXCW/VaUwFxQq+QDooS28ztTR2qNmjam6IVYsVija
 lalC7+DWVsuA25JNXlP7P4eybw==
X-Google-Smtp-Source: APXvYqxdt9mw05VHDFVIQCoRUqbucMGiKn4q6GIRQ9FIjqFtgOWo+9V1X+Hx7R2/CHUjcVWB1xmt0Q==
X-Received: by 2002:ac2:59dd:: with SMTP id x29mr34764008lfn.95.1575282610739; 
 Mon, 02 Dec 2019 02:30:10 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id a27sm5970051lfo.38.2019.12.02.02.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 02:30:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: ams369fg06: Drop GPIO include
Date: Mon,  2 Dec 2019 11:30:05 +0100
Message-Id: <20191202103005.102696-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWr52qMHrq81YooAhz2Ofw6lZ/vpXG4vSevmtkN9BzI=;
 b=w5Ng2dqj13R9FOOOpB/05Dco4H9wy/mMgfmQnTJwH4SHMCdUaGjOre1jDmnZXLhB4t
 o52U4kJ7iWSuluGmoYMmLV56GYofQsnUXP1BXm9JeBOLgx5iTe/I5PV005RxGTlC4dZZ
 n+tkyaHiHPptC8FP4lMMq8NJPbbaqDMcIWwU+zzLgzxYBnJE/aqbttw6WRUPEu53vsN3
 12UgTKvMY6BHBn9ja/RFEKiTkA6wCFHGnNiM8/F5JFrxjKqFH3JqQFVR807SZhRxFcqh
 7fjy4nJjtai+M7l+7sA1yTmethFPTHIwtUjmcZ/i0HjUgZPsIlfCnoA3NwpW/BLHB1Ll
 2qSg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBpbmNsdWRlcyA8bGludXgvZ3Bpby5oPiB5ZXQgZmFpbHMgdG8gdXNlIHN5bWJv
bHMKZnJvbSBhbnkgdGhlIGhlYWRlciBzbyBkcm9wIHRoZSBpbmNsdWRlLgoKU2lnbmVkLW9mZi1i
eTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2FtczM2OWZnMDYuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hbXMzNjlmZzA2
LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hbXMzNjlmZzA2LmMKaW5kZXggOTRjY2I5MDQy
NDQwLi44YTQzNjFlOTVhMTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2Ft
czM2OWZnMDYuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hbXMzNjlmZzA2LmMKQEAg
LTExLDcgKzExLDYgQEAKICNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxs
aW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2ZiLmg+Ci0jaW5jbHVkZSA8bGludXgvZ3Bp
by5oPgogI2luY2x1ZGUgPGxpbnV4L2xjZC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgog
I2luY2x1ZGUgPGxpbnV4L3NwaS9zcGkuaD4KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
