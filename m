Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1A2ADF82
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77389C59;
	Tue, 10 Nov 2020 19:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C102389C0D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so6754708wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Sm/diM1ysLxo1VzfvufUrkgqFPpDL8/DuxdgOjGpqk=;
 b=CZrD24nhvG2iKoj4noUsAlrwucBSgxTDbkGLYlEEUgSDr2Zy+HeJpNOHnLGyxd2YyB
 ZJQ6UXdgUfIMAhCAJ024R0H2Way6kwLlIHcQePC+l7iMTF0CV6X8kZDDmPGuaemhUSp8
 800pFOG3yycgu2nI36yUiLjHgtWG5tpiOGBqQpcARNijHSmCokrGz9nmDIu6zJ6tg/z5
 FCRP6rRBQCoRr3UUGixrgmzUVA8rkV0jAqYjmFjNigFQNMg0VIghzCyxk1PB5/rtlmmL
 wo5Jr7Q/LM8kPqSrNKHMXufrbqKBkDSEpL7HRj0P0JoHjIVks/WOc6vhahHnS895KRw/
 wI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Sm/diM1ysLxo1VzfvufUrkgqFPpDL8/DuxdgOjGpqk=;
 b=jK4suq+3i5bqniqbmz+FSdbCltjbIa8MbT8HseE0fIvpQQlaPGULODTUZMurzATE/m
 XQygvE5dZK9Ql6ihS2YdUoKvx4j4NNm+P21ZCGB47hX0HTWt8eVvX3Vn3Q3UR1DCi8Ki
 brfd+xBv0dVRQ/601zrMPR0ztXWvuUFBIci9eplrFySXs8TVqt+sIa8hXZr/noixThWV
 YslO5XywPkJhuwTjQ4JStanGNVAQ6bwE5JM+wbU4Y/pSDsogE56r84nAdFud4th0+J+t
 J3Zx8dLWLmhXQQIJr81OejKtOFxWQnH+KoEk/Z6Lo73CKPESAhK4Qpb/sG9cgIW/QSna
 J++g==
X-Gm-Message-State: AOAM532Kz/TvPS3QPkFi6OHQ7BpU4PTHF4nRwrV78FU2fG2vawMPg6i5
 a5xcQYdmrB+s0z58DUCfelB4TQ==
X-Google-Smtp-Source: ABdhPJydisdr0J37dZbJ7k4ipfoX1H7RQuZ8b5877kgvFGHpkWN/RL5fEew9s8dnutPJ9wQPzCIbdQ==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr8139860wrs.170.1605036707394; 
 Tue, 10 Nov 2020 11:31:47 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/30] drm/radeon/sumo_dpm: Move 'sumo_get_pi()'s prototype
 into shared header
Date: Tue, 10 Nov 2020 19:31:07 +0000
Message-Id: <20201110193112.988999-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zdW1vX2RwbS5jOjgxOjI1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yIOKAmHN1bW9fZ2V0X3Bp4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDgx
IHwgc3RydWN0IHN1bW9fcG93ZXJfaW5mbyAqc3Vtb19nZXRfcGkoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc3Vt
b19kcG0uaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zdW1vX3NtYy5jIHwgMiAtLQog
MiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fZHBtLmggYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3N1bW9fZHBtLmgKaW5kZXggZjE2NTExMzVhNDdhYi4uZGIyOWQzN2FlMjcwMyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zdW1vX2RwbS5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc3Vtb19kcG0uaApAQCAtMjA3LDYgKzIwNyw3IEBAIHUzMiBzdW1vX2dl
dF9zbGVlcF9kaXZpZGVyX2Zyb21faWQodTMyIGlkKTsKIHUzMiBzdW1vX2dldF9zbGVlcF9kaXZp
ZGVyX2lkX2Zyb21fY2xvY2soc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAJCQkJCSB1MzIg
c2NsaywKIAkJCQkJIHUzMiBtaW5fc2Nsa19pbl9zcik7CitzdHJ1Y3Qgc3Vtb19wb3dlcl9pbmZv
ICpzdW1vX2dldF9waShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAKIC8qIHN1bW9fc21j
LmMgKi8KIHZvaWQgc3Vtb19pbml0aWFsaXplX20zX2FyYihzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fc21jLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fc21jLmMKaW5kZXggZDc4MTQwNzA1NzM2Ni4uNzhk
ODcxNjA2NzMxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zdW1vX3NtYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc3Vtb19zbWMuYwpAQCAtMzAsOCArMzAsNiBA
QAogI2RlZmluZSBTVU1PX1NNVV9TRVJWSUNFX1JPVVRJTkVfQUxUVkRETkJfTk9USUZZICAyNwog
I2RlZmluZSBTVU1PX1NNVV9TRVJWSUNFX1JPVVRJTkVfR0ZYX1NSVl9JRF8yMCAgMjAKIAotc3Ry
dWN0IHN1bW9fcG93ZXJfaW5mbyAqc3Vtb19nZXRfcGkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYpOwotCiBzdGF0aWMgdm9pZCBzdW1vX3NlbmRfbXNnX3RvX3NtdShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwgdTMyIGlkKQogewogCXUzMiBnZnhfaW50X3JlcTsKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
