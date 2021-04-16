Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B7F362296
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A9F6EC17;
	Fri, 16 Apr 2021 14:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE1B6EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id o20so6273770edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9QkHlwJDar64oIul6Zxhmqo4CTxwCRZxxTfk+OGqes=;
 b=eY+BehDOCCwJrQBgJvFkrLf60qYGNjp86LQ95v4aL7ItluI4Kc1SOgueUMBeL7xVO0
 HabFWzx1pws/L5MRCFq5LUoT5qfUy3s5FD/uSxeZFuyHKY3170WEz1Csbb4fSPaBDIqN
 oRoIS2YwYhl3F0P/wmetAgGaxJNwr8QMpvE56Jxb1rGkseV0sHdrWs1gzTSOL2x1NJS0
 Vj80LYVwo8lXzAojSa+aNSIeTjnQWOA9oP0WJp53MrM0/1L47DLNnl/6xm51fQAC1llu
 FYuAOZoo41nr91MY3qLkcrnWrr3xBTW/WLIuUjkwS7wdSBtV0LoR2GWHCg5gPjz2JP4q
 OdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9QkHlwJDar64oIul6Zxhmqo4CTxwCRZxxTfk+OGqes=;
 b=fcdXbGPKO08yN3HrtpB5nPUmhSKgtsrLw/MJ6jP25uk6CiEkVJYRDb79lfUtkdmADs
 d44YY4Xl3Bv91gcvi90bkpwSQXBkVcXEz95t4k1xwZX0u0CdY3INm0YtJeRnFup1QZwU
 E9GXG/9KELSTYIwYDbr2a4pA8IJ2Xg27rBOwR4v6kaeYupRBnwHXAAoV/BMFMuq7ONzW
 iD4VHYgJQd7HjU2TEd9qvhroPMPuETAVMH/j85ZGBMLK55kbALmQT5YtGT7rAzxTjeNh
 JsU9c0gYWTK2BgGUPNF0fM+N54/FAAlAhpoPTLyszlPNv+zjThtWNG5luOpfO3V6dR1p
 S0og==
X-Gm-Message-State: AOAM533DSw/V8oAbpYkgbYeabjleTCwqa4p8UHbRvByTctotZnUrgvb2
 5tKpRfHZGd0y/LGJBGWCr9Gw8g==
X-Google-Smtp-Source: ABdhPJyfwppiWNh6UNq5J0oc3JQa61CxtXjxBSY55rvdOBADEXG3x0lLiRIZS3Wa6Jra3UH/lva7pA==
X-Received: by 2002:a05:6402:cb3:: with SMTP id
 cn19mr2427916edb.206.1618583880589; 
 Fri, 16 Apr 2021 07:38:00 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/40] drm/amd/amdgpu/amdgpu_fence: Provide description for
 'sched_score'
Date: Fri, 16 Apr 2021 15:37:14 +0100
Message-Id: <20210416143725.2769053-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmM6NDQ0OiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdzY2hlZF9zY29yZScgbm90IGRlc2NyaWJlZCBpbiAnYW1k
Z3B1X2ZlbmNlX2RyaXZlcl9pbml0X3JpbmcnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBs
aW5hcm8ub3JnPgpDYzogSmVyb21lIEdsaXNzZSA8Z2xpc3NlQGZyZWVkZXNrdG9wLm9yZz4KQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1z
aWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCmluZGV4IDQ3ZWE0Njg1OTYxODQuLjMwNzcyNjA4ZWFj
NmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCkBAIC00MzQs
NiArNDM0LDcgQEAgaW50IGFtZGdwdV9mZW5jZV9kcml2ZXJfc3RhcnRfcmluZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsCiAgKgogICogQHJpbmc6IHJpbmcgdG8gaW5pdCB0aGUgZmVuY2UgZHJp
dmVyIG9uCiAgKiBAbnVtX2h3X3N1Ym1pc3Npb246IG51bWJlciBvZiBlbnRyaWVzIG9uIHRoZSBo
YXJkd2FyZSBxdWV1ZQorICogQHNjaGVkX3Njb3JlOiBvcHRpb25hbCBzY29yZSBhdG9taWMgc2hh
cmVkIHdpdGggb3RoZXIgc2NoZWR1bGVycwogICoKICAqIEluaXQgdGhlIGZlbmNlIGRyaXZlciBm
b3IgdGhlIHJlcXVlc3RlZCByaW5nIChhbGwgYXNpY3MpLgogICogSGVscGVyIGZ1bmN0aW9uIGZv
ciBhbWRncHVfZmVuY2VfZHJpdmVyX2luaXQoKS4KLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
