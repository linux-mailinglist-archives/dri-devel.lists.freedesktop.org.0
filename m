Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E562B1C46
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7226E530;
	Fri, 13 Nov 2020 13:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8916E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h62so8559538wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQkfxQ/U8Tk4/T1pD4+koDIKxw+zqPvW8TyQwINa4Hk=;
 b=p+qCr72t4ihE18soadDlaCQDbatISUugUvivCXWYBcpCtMq7piGK6yvdMfWe5dOlUz
 epwJ2cODurA7r/6VuUAYrYXfYCAU309NoyA05LOmjaELk3tFujk8ElkHboNXnaQcpc8G
 zZLHqhh1zUmkJivv/y8jjofUTY2mjY/xirZHrK5r42BuPbpXaoaH2hGm0sBHW0PClrfn
 G3tz9jkPvZiZZK0f28wsPfX8I29xo+ErTlJfaLfsnvomw33WeZmaQHc1upjKvr0LlHdV
 UJLl0EKZ4iN0XSw7CplmsnLCoN3kUHPWQWCAquy6HaUTX8YX0wKSNf3DqpVb36uZwhnF
 2k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQkfxQ/U8Tk4/T1pD4+koDIKxw+zqPvW8TyQwINa4Hk=;
 b=VLJq9KWEakKMHIufg2SCJfX6QYj9XXuMi8J6GDgYpneB0d6iL6nNOw8v2wct6+eTej
 J7O4Ni6twCN1GyG63YclC/DYjpy3hRnTVacW5eNnNkSkTMDL0tutXJtT4IRGgZ6muk5l
 W27civHtlYdTRx4vChqaiClhLUmfqigannJWeeO4KHhLysxe59vRPkmwKz2PAwWJtSCs
 fdeaH54I+zQC0ra8wZQLEsgmdzMj8fCJd5TtfJEzBI6avnqq7dqrjyb94AmXZCI7OTp9
 aEK6COAw1KvQoKWFg6rmPXFnn901fw2xwjBfhYhnul7IO1HiGZ1hjJLBULoW5L/gTPkK
 r61w==
X-Gm-Message-State: AOAM531zl2h0D5z4DNWMzP/Ej6lMxaHMvE+bXma2EislQg2wo2JlDAlJ
 F6IgXS6343G493RnzK7K2FaJcw==
X-Google-Smtp-Source: ABdhPJymL/fKIayM3ll+Scbr9dyC1LRXBH326riSmfGznT+FB8Ojz4hiHyuPNwQSLAqi/i9sv8er5g==
X-Received: by 2002:a1c:6209:: with SMTP id w9mr2608331wmb.120.1605275410099; 
 Fri, 13 Nov 2020 05:50:10 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/40] drm/lima/lima_sched: Remove unused and unnecessary
 variable 'ret'
Date: Fri, 13 Nov 2020 13:49:21 +0000
Message-Id: <20201113134938.4004947-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jOiBJbiBmdW5jdGlvbiDigJhsaW1hX3NjaGVkX3J1
bl9qb2LigJk6CiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmM6MjI3OjIwOiB3YXJu
aW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCkNjOiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbWFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfc2NoZWQuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2xpbWEvbGltYV9zY2hlZC5jIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5j
CmluZGV4IGEwNzBhODVmOGYzNjguLjYzYjRjNTY0M2Y5Y2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfc2NoZWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1h
X3NjaGVkLmMKQEAgLTIyNCw3ICsyMjQsNiBAQCBzdGF0aWMgc3RydWN0IGRtYV9mZW5jZSAqbGlt
YV9zY2hlZF9ydW5fam9iKHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IpCiAJc3RydWN0IGxpbWFf
c2NoZWRfcGlwZSAqcGlwZSA9IHRvX2xpbWFfcGlwZShqb2ItPnNjaGVkKTsKIAlzdHJ1Y3QgbGlt
YV9kZXZpY2UgKmxkZXYgPSBwaXBlLT5sZGV2OwogCXN0cnVjdCBsaW1hX2ZlbmNlICpmZW5jZTsK
LQlzdHJ1Y3QgZG1hX2ZlbmNlICpyZXQ7CiAJaW50IGksIGVycjsKIAogCS8qIGFmdGVyIEdQVSBy
ZXNldCAqLwpAQCAtMjQ2LDcgKzI0NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICpsaW1h
X3NjaGVkX3J1bl9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYikKIAkvKiBmb3IgY2FsbGVy
IHVzYWdlIG9mIHRoZSBmZW5jZSwgb3RoZXJ3aXNlIGlycSBoYW5kbGVyCiAJICogbWF5IGNvbnN1
bWUgdGhlIGZlbmNlIGJlZm9yZSBjYWxsZXIgdXNlIGl0CiAJICovCi0JcmV0ID0gZG1hX2ZlbmNl
X2dldCh0YXNrLT5mZW5jZSk7CisJZG1hX2ZlbmNlX2dldCh0YXNrLT5mZW5jZSk7CiAKIAlwaXBl
LT5jdXJyZW50X3Rhc2sgPSB0YXNrOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
