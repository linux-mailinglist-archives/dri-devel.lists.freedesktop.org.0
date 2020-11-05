Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D712A8172
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD756ED99;
	Thu,  5 Nov 2020 14:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4EF6ED99
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d142so1867693wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Xt9NPmWITpKLKGlbBp65KNc5QWwZDBhANixt0RAfzs=;
 b=CUpGQdFe0Fpy8mF0smnsFvAhA8XeNwRgzON8Ouemw6fHxmx52YrEcZAMwdSABsRq/7
 Lxy+ostf7rA/tdZRM7TSq0bo2YvzW5haVIiyQUoFDcaYBJtIcuzThdWaW98Rt/uf8hvR
 Yessl9lyLwVOyxg+4AEZljm+9pyh+9RuR49gHLGu4bQ+JI1lJesriHB1MV4d2kRG1j3P
 TIlRa/EgbhDezoFvNOXhtPQsF5zeJmrssB5jRQCoZyr63oGYwhQMu6w5h3uRW6a3fAba
 HW1hSPLM89nmRzJCEJlwbC+/dBHrd4TqiaEeCIChBj7BD98hF67RBzDmT4LCIdbTjJ7e
 r4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Xt9NPmWITpKLKGlbBp65KNc5QWwZDBhANixt0RAfzs=;
 b=tFAmx0ls9zvjaijm5f2kvmsmOg0/ynT57uVnc9ayg5yrzy16+2P9LUlqNIfyoyEVXG
 8vR5CHA7hWyTiYx8ZUvPlZ2lD8tG7UCrix5qj1nrWr+O2zDLzVPh2ePgUvMzex1OdzVW
 z2D1cecHCAsOhl8dfL2pTY0ZGkhki0omjRABratb86qgfHqsVIUbVqkVo4I5gfkLAUtR
 KRoXOxquxCONi5SjdyJFZoR0M3VZqqwZpWkEQ7ycRSYvGDfs4mKhCd+ymNJOfw9ayFJe
 tPDDGMpRkszFO31GmEUmSa7sn6vBDgfkUUMkCj0N5p1YFNM+fdS6EaW7Ic/RAEDsjefJ
 J0Wg==
X-Gm-Message-State: AOAM532SpsPuZyzkRZVTk5X10dteIRyquIQjCI9t4Wk/xkpuNTDZ3l9y
 zJKOI5C6OqbxTuw/KYpoeL+/xA==
X-Google-Smtp-Source: ABdhPJx4o/ngA4xvA0+rv6p3i9fdDVG+or+aahOHyJb8+xTTqmrY/O+FOfhIhBwkLVbCJU8toTdOCQ==
X-Received: by 2002:a1c:2803:: with SMTP id o3mr3018917wmo.97.1604587944829;
 Thu, 05 Nov 2020 06:52:24 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/19] gpu: drm: omapdrm: dss: dsi: Rework and remove a few
 unused variables
Date: Thu,  5 Nov 2020 14:45:06 +0000
Message-Id: <20201105144517.1826692-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOiBJbiBmdW5jdGlvbiDigJhfZHNpX3ByaW50X3Jl
c2V0X3N0YXR1c+KAmToKIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzoxMTMxOjY6
IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGzigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzogSW4gZnVu
Y3Rpb24g4oCYZHNpX3VwZGF0ZeKAmToKIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2ku
YzozOTQzOjEwOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkaOKAmSBzZXQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rz
aS5jOjM5NDM6Njogd2FybmluZzogdmFyaWFibGUg4oCYZHfigJkgc2V0IGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYyB8IDkgKystLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9kc2kuYwppbmRleCBlZWNjZjQwYmFlNDE2Li41OTI5YjMyMGIzY2ZhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL2RzaS5jCkBAIC0xMTI4LDEzICsxMTI4LDEyIEBAIHN0YXRpYyB2b2lk
IGRzaV9ydW50aW1lX3B1dChzdHJ1Y3QgZHNpX2RhdGEgKmRzaSkKIAogc3RhdGljIHZvaWQgX2Rz
aV9wcmludF9yZXNldF9zdGF0dXMoc3RydWN0IGRzaV9kYXRhICpkc2kpCiB7Ci0JdTMyIGw7CiAJ
aW50IGIwLCBiMSwgYjI7CiAKIAkvKiBBIGR1bW15IHJlYWQgdXNpbmcgdGhlIFNDUCBpbnRlcmZh
Y2UgdG8gYW55IERTSVBIWSByZWdpc3RlciBpcwogCSAqIHJlcXVpcmVkIGFmdGVyIERTSVBIWSBy
ZXNldCB0byBjb21wbGV0ZSB0aGUgcmVzZXQgb2YgdGhlIERTSSBjb21wbGV4CiAJICogSS9PLiAq
LwotCWwgPSBkc2lfcmVhZF9yZWcoZHNpLCBEU0lfRFNJUEhZX0NGRzUpOworCWRzaV9yZWFkX3Jl
Zyhkc2ksIERTSV9EU0lQSFlfQ0ZHNSk7CiAKIAlpZiAoZHNpLT5kYXRhLT5xdWlya3MgJiBEU0lf
UVVJUktfUkVWRVJTRV9UWENMS0VTQykgewogCQliMCA9IDI4OwpAQCAtMzk0MCw3ICszOTM5LDYg
QEAgc3RhdGljIGludCBkc2lfdXBkYXRlKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2Rldiwg
aW50IGNoYW5uZWwsCiAJCXZvaWQgKCpjYWxsYmFjaykoaW50LCB2b2lkICopLCB2b2lkICpkYXRh
KQogewogCXN0cnVjdCBkc2lfZGF0YSAqZHNpID0gdG9fZHNpX2RhdGEoZHNzZGV2KTsKLQl1MTYg
ZHcsIGRoOwogCiAJZHNpX3BlcmZfbWFya19zZXR1cChkc2kpOwogCkBAIC0zOTQ5LDExICszOTQ3
LDggQEAgc3RhdGljIGludCBkc2lfdXBkYXRlKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2Rl
diwgaW50IGNoYW5uZWwsCiAJZHNpLT5mcmFtZWRvbmVfY2FsbGJhY2sgPSBjYWxsYmFjazsKIAlk
c2ktPmZyYW1lZG9uZV9kYXRhID0gZGF0YTsKIAotCWR3ID0gZHNpLT52bS5oYWN0aXZlOwotCWRo
ID0gZHNpLT52bS52YWN0aXZlOwotCiAjaWZkZWYgRFNJX1BFUkZfTUVBU1VSRQotCWRzaS0+dXBk
YXRlX2J5dGVzID0gZHcgKiBkaCAqCisJZHNpLT51cGRhdGVfYnl0ZXMgPSBkc2ktPnZtLmhhY3Rp
dmUgKiBkc2ktPnZtLnZhY3RpdmUgKgogCQlkc2lfZ2V0X3BpeGVsX3NpemUoZHNpLT5waXhfZm10
KSAvIDg7CiAjZW5kaWYKIAlkc2lfdXBkYXRlX3NjcmVlbl9kaXNwYyhkc2kpOwotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
