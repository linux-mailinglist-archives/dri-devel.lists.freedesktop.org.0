Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB532F4D87
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4726EA54;
	Wed, 13 Jan 2021 14:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1256EA4B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i9so2417752wrc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvE9T1Sdi1RAuyfyFAKYPhv+PIZJRg/gdw+xAA12HNM=;
 b=U7XZpCynbw9Y5AThFO42Dm2JoFqWJsr9KG6TgiBESTQlNc3fAWqvrv/vV8/bWuW37L
 5Fjmhghbx5eL6EY4Moqeeu/yko+J0D69QRMZW6dhXQ+Nm9vDb4yEtKNNPUG+swW/GUbD
 nAaRi2O/qE3tCVsaODzksTZRhF5TfWSJtIznTgVmbKSYSnmBQqobEUxuFMK2YTYRo0L7
 5w6ysuaaYARhRutz78Bmdnh6Kc8gc9Z/V8eH/apGCKxMK7Ke/jwJuBK4NTtqahNEJg7W
 TA2E0XY8ZoQAjFera38Ev01dBrJEDrnnCeyVsmeOs34OMOGtHvVAEe9zC9dc+VdMb3Ui
 iGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvE9T1Sdi1RAuyfyFAKYPhv+PIZJRg/gdw+xAA12HNM=;
 b=m5LS+s18cDIdewop85viIN2e8c46Z5kexVMrzrCta6URJ6sJv3MPdD/tHLBATPxFqA
 XzzT5bq2EmBspme6dx6iQ0s2hNRhILierVuaovyIn8xKZwNn5eWBci1mM6du28DEC7fN
 xXrjUSMa2Ua4LfwnuV3m6kzBZgJTXtW9MlQeef/pumun56F4mpWtqxa/t3C0IS7jJmXw
 AprpCVkP2xDI6ZOy4+THR4oiHaTsvz0LEfk0kL76k/7nr1PvAsPsmCjI8zvJC/qcyJjX
 arp9JQco8wV4n6YgZBfXu6GPg6AMFSU4TgqAMwyRqms9G5UwGX1qnxvsMgq+L4JE3MYm
 b/9w==
X-Gm-Message-State: AOAM530BmjULUzOqyGuOPtnFZaAuYEYBD9oCFNWQmeyqyktVeBZ5zo34
 bpDtKUx1bJNlzzWFP55+YeBbfA==
X-Google-Smtp-Source: ABdhPJw8rEyi0DM19K9SdWt8OAokANJ3aIc/AvHlDFnh4GZL9+DaYT3IWFB1YtzXdbd84j6vPII+bw==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr3187110wro.244.1610549419211; 
 Wed, 13 Jan 2021 06:50:19 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/31] video: fbdev: aty: atyfb_base: Mark 'dac_type' as
 __maybe_unused
Date: Wed, 13 Jan 2021 14:49:42 +0000
Message-Id: <20210113145009.1272040-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: "Eddie C. Dost" <ecd@skynet.be>, linux-fbdev@vger.kernel.org,
 Anthony Tong <atong@uiuc.edu>, Alex Kern <alex.kern@gmx.de>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J2RhY190eXBlJyBpcyBvbmx5IHVzZWQgaW4gdGhlICcjaWZkZWYgQ09ORklHX0FUQVJJJyBjbGF1
c2UuCgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmM6IEluIGZ1bmN0aW9uIOKAmGF0eV9p
bml04oCZOgogZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jOjIzNjM6Njogd2Fy
bmluZzogdmFyaWFibGUg4oCYZGFjX3R5cGXigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KCkNjOiBWYWliaGF2IEd1cHRhIDx2YWliaGF2Z3VwdGE0MEBnbWFp
bC5jb20+CkNjOiBBbGV4IEtlcm4gPGFsZXgua2VybkBnbXguZGU+CkNjOiAiRWRkaWUgQy4gRG9z
dCIgPGVjZEBza3luZXQuYmU+CkNjOiBBbnRob255IFRvbmcgPGF0b25nQHVpdWMuZWR1PgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJu
ZWwub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkv
YXR5ZmJfYmFzZS5jCmluZGV4IDExYzMyOGYwNTg1Y2UuLjliMDU2YjQ5ZjI4MDcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZiX2Jhc2UuYworKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMKQEAgLTIzNjAsNyArMjM2MCw3IEBAIHN0YXRpYyBp
bnQgYXR5X2luaXQoc3RydWN0IGZiX2luZm8gKmluZm8pCiAjaWZkZWYgQ09ORklHX0ZCX0FUWV9H
WAogCWlmICghTTY0X0hBUyhJTlRFR1JBVEVEKSkgewogCQl1MzIgc3RhdDA7Ci0JCXU4IGRhY190
eXBlLCBkYWNfc3VidHlwZSwgY2xrX3R5cGU7CisJCXU4IF9fbWF5YmVfdW51c2VkIGRhY190eXBl
LCBkYWNfc3VidHlwZSwgY2xrX3R5cGU7CiAJCXN0YXQwID0gYXR5X2xkX2xlMzIoQ05GR19TVEFU
MCwgcGFyKTsKIAkJcGFyLT5idXNfdHlwZSA9IChzdGF0MCA+PiAwKSAmIDB4MDc7CiAJCXBhci0+
cmFtX3R5cGUgPSAoc3RhdDAgPj4gMykgJiAweDA3OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
