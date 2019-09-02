Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC866A54DF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E13989A0F;
	Mon,  2 Sep 2019 11:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714D189A0F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:29 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g7so13683810wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYiUY5p+TWatTxX9qBGkn9VrpmRhMnZJh/hFNFOnOtM=;
 b=kRZ3iZ6hjY0ptISTsBdOhM4Qbm7RdpwaBe/BnEzufX3q5rIbMz5R+oVBnMYqvQ55on
 nPCSgCLIzBkN6BuqpKxTeaKxFkcdENbhmPNXHBCfCqJL8eLRt0g2xqqPJoV8nSVN2/yT
 Qagx7PtC4HcoOYiEzg409yLOmjGHbuYttz1izx+bBKChJoRbdX/6AQYr7aqiIHEUqGUU
 XHhDAeDLbSUwI3PhWn/Sq44QUPqhyA4zN+XvVeFD7HbJA+VXnCB5HLzWHcjZl7seiLkf
 UirO57crDKq3ECLsqP0u2Z02FAsvjxWPTc4QqRuFIW29igHXay7opRnZSTf9gG2rEJw4
 f6Fw==
X-Gm-Message-State: APjAAAXG/M0XLQ1h53zL3lL4ZfEp63e0lR4FiR//5gVVZ9kh48T5WiDa
 1DPqrcz+J2mhty9KbeZcNdFkcC1I
X-Google-Smtp-Source: APXvYqylhdz2i1zMmBSidgeCSzkA7ZytiSHhEFLlAoZipJm3BEGmIIBVxnFZs34O6SPNA4iS6AGN1w==
X-Received: by 2002:adf:dc81:: with SMTP id r1mr35521231wrj.52.1567423887674; 
 Mon, 02 Sep 2019 04:31:27 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id f18sm15421768wrx.85.2019.09.02.04.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:26 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/21] drm/dp: Add missing kerneldoc for struct drm_dp_link
Date: Mon,  2 Sep 2019 13:31:02 +0200
Message-Id: <20190902113121.31323-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYiUY5p+TWatTxX9qBGkn9VrpmRhMnZJh/hFNFOnOtM=;
 b=ZTNkAg8tts7B5hzn7TGJdFVyc3qlaNfy+WIH+Q0TPiYl9XqZHrn4NsAkPFXWKU7jnF
 P34091jZBibKIrHmZsNeq2oox461Q4hTgn6ZaUJoEj7M/OubNiJlQc8IT5yxsUdHb9+F
 FzeMq+60MniEQVKYKyhNn4blaFbe96Q76JipsBGtElf9FDl82MNkN6LwBaZ0CryFuc54
 mURgEgaca2L3IIPG6lKL0anp7VZ6cwVPwoQtnNI1dp9ZJlxNhcxKRKggYGPgjG+ucVXu
 IS6/TBnTC5Df2Sh3XguJvej34dI0/Q9P0t8cfVLczufyMj8iKkBhWRuwQIzL3/8pNKeK
 QZ1w==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkcm1fZHBfbGlu
ayBzdHJ1Y3R1cmUgdHJhY2tzIGNhcGFiaWxpdGllcyBvbiB0aGUgRFAgbGluay4gQWRkIHNvbWUK
a2VybmVsZG9jIHRvIGV4cGxhaW4gd2hhdCBlYWNoIG9mIGl0cyBmaWVsZHMgbWVhbnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGluY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCAxMTQyNjExNThiNzMuLjkzNWYzMzFlNmU3
MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTM1OCw2ICsxMzU4LDEzIEBAIGludCBkcm1fZHBfZHBj
ZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAgKi8KICNkZWZpbmUg
RFBfTElOS19DQVBfRU5IQU5DRURfRlJBTUlORyAoMSA8PCAwKQogCisvKioKKyAqIHN0cnVjdCBk
cm1fZHBfbGluayAtIERQIGxpbmsgY2FwYWJpbGl0aWVzCisgKiBAcmV2aXNpb246IERQIHNwZWNp
ZmljYXRpb24gcmV2aXNpb24gc3VwcG9ydGVkIG9uIHRoZSBsaW5rCisgKiBAcmF0ZTogbWF4aW11
bSBjbG9jayByYXRlIHN1cHBvcnRlZCBvbiB0aGUgbGluaworICogQG51bV9sYW5lczogbWF4aW11
bSBudW1iZXIgb2YgbGFuZXMgc3VwcG9ydGVkIG9uIHRoZSBsaW5rCisgKiBAY2FwYWJpbGl0aWVz
OiBiaXRtYXNrIG9mIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQgb24gdGhlIGxpbmsKKyAqLwogc3Ry
dWN0IGRybV9kcF9saW5rIHsKIAl1bnNpZ25lZCBjaGFyIHJldmlzaW9uOwogCXVuc2lnbmVkIGlu
dCByYXRlOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
