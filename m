Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3E42B1C3B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3DA6E4EC;
	Fri, 13 Nov 2020 13:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79AA6E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so8577822wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGHBLLfArp3MHXb6jRmdWLcwUbJpj6uRO7upfU2OHuw=;
 b=QWB7Rb3uSLXYnQQ2cEAuBHkFwyMP09ZejFdY7z3yP4RvHuVLM8LVdxKcPQGfkX0TKa
 SVSi+znYIGs/2/tYZ/ZM7cf4ByhJpxXQ1r84QAhba/dAqu7NVoXFlaxI4/C8eZR1/+hG
 RIPQmHWl95mquQI5VjH7Var1GM0bDOgfEcy8Dk1k3CVLUlDdsDYrkKv85BsjY/OKbJUh
 JHKjCn8N4k+Se9bxCU06GpXUD0K37g+NsFV4+PVAHjDUROTTE+NPOCiZOYZqcT/8EWoM
 8VeZhX3TU86f3ojfoRTtOqaJN5quuiNEOpOHsuJdVbvH+o2SM9aDX4dtxdn5EQiojVNx
 k1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGHBLLfArp3MHXb6jRmdWLcwUbJpj6uRO7upfU2OHuw=;
 b=pJNjVO95O0kEAu2+OxUAu/6Uy0DxUr0/YVBXt0ixjFhaIoq+pjf3ZjqEqI/yB6zNLw
 ncsczQOhjwLYtFgMzIxTJz091KEmc31BUlhbR8LmKHWZkqDZaWiF+U9ADPjunK8/9rOe
 qKPJXAF/tpC6HKniENyi4lwY3wxTneLUBztMmJuTg9G9Wkb4XCdR4xgezIrZt/ba4uTy
 0wC6aLv6TKHHZA0StRR9dAtZoItEWx4bR5OvmmjPu93R1J8Y3+Tn8LQCtIYkagI2g6A1
 WCvhjf1QGrYUc0TPrZrV5CPsPTMsejL67lq9dAd2VJ8XZO57bwOTk2p3I8R0zraQ1AYp
 0r7g==
X-Gm-Message-State: AOAM530Jj79LshQic69wVA9Th/JbOlOvTVgeOnYx/4jM71McOpyShRMW
 OB4LoOPYP0mn2yoxzE55IkEYdA==
X-Google-Smtp-Source: ABdhPJzwfvzA9X+I0jwrBedFid2wysIoR3AvVUixW2DKt9Kt6WBq2YTZwEfgGhWJ9mTLrkrYjanI8A==
X-Received: by 2002:a1c:2583:: with SMTP id l125mr2655884wml.50.1605275411325; 
 Fri, 13 Nov 2020 05:50:11 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/40] drm/amd/amdgpu/amdgpu_ids: Supply missing docs for 'id'
 and 'vmhub'
Date: Fri, 13 Nov 2020 13:49:22 +0000
Message-Id: <20201113134938.4004947-25-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jOjI3MTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnaWQnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92bWlkX2dy
YWJfcmVzZXJ2ZWQnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWRzLmM6NTIz
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd2bWh1Yicgbm90IGRlc2Ny
aWJlZCBpbiAnYW1kZ3B1X3ZtaWRfcmVzZXQnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBs
aW5hcm8ub3JnPgpDYzogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CkNj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0t
c2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWRzLmMg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2lkcy5jCmluZGV4IDZlOWE5ZTVkYmVhMDcuLjYxYTEzMzFmNDgyYzUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWRzLmMKQEAgLTI1OSw2ICsyNTks
NyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bWlkX2dyYWJfaWRsZShzdHJ1Y3QgYW1kZ3B1X3ZtICp2
bSwKICAqIEBzeW5jOiBzeW5jIG9iamVjdCB3aGVyZSB3ZSBhZGQgZGVwZW5kZW5jaWVzCiAgKiBA
ZmVuY2U6IGZlbmNlIHByb3RlY3RpbmcgSUQgZnJvbSByZXVzZQogICogQGpvYjogam9iIHdobyB3
YW50cyB0byB1c2UgdGhlIFZNSUQKKyAqIEBpZDogcmVzdWx0aW5nIFZNSUQKICAqCiAgKiBUcnkg
dG8gYXNzaWduIGEgcmVzZXJ2ZWQgVk1JRC4KICAqLwpAQCAtNTE0LDYgKzUxNSw3IEBAIHZvaWQg
YW1kZ3B1X3ZtaWRfZnJlZV9yZXNlcnZlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAq
IGFtZGdwdV92bWlkX3Jlc2V0IC0gcmVzZXQgVk1JRCB0byB6ZXJvCiAgKgogICogQGFkZXY6IGFt
ZGdwdSBkZXZpY2Ugc3RydWN0dXJlCisgKiBAdm1odWI6IHZtaHViIHR5cGUKICAqIEB2bWlkOiB2
bWlkIG51bWJlciB0byB1c2UKICAqCiAgKiBSZXNldCBzYXZlZCBHRFcsIEdXUyBhbmQgT0EgdG8g
Zm9yY2Ugc3dpdGNoIG9uIG5leHQgZmx1c2guCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
