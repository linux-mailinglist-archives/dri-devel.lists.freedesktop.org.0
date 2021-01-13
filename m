Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C102F4D9E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70996EA63;
	Wed, 13 Jan 2021 14:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EB36EA75
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id h17so1655136wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fiTAiO1+djM4LYXjGKueW16bvgv2sBtNiLbtIOEARdk=;
 b=IDza5YLilamkwPDT+g2/a0lofmuncKNpAv/y/6ZQX7PTgZHHrzIscPArIaLwzgGk21
 +PTQkWm+NELC+KC9BFDcWCwiEBGUoc7D99iVhf/b8Zau/fF4+imDj62ocQwZfhj48s7p
 G301bdVxqdgcGdeZ0mOu5lmhiQU2WC/WPRGqNZpFfUOiJAjYflnQOI3iCRme45LwRAT5
 UA87z3v5OeC740plgM+jScryysn9swGK41grynXPhZPBHzL1uyI195awHeRx0r0D+KV6
 M3YDyk1IDQxUtVgKliH+QZdMV6naG94aZh3W2EpFGPxDHMNQ6+AhIUIbY31cyP7lq5uP
 Fxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fiTAiO1+djM4LYXjGKueW16bvgv2sBtNiLbtIOEARdk=;
 b=rneRT7ri/RTMWCtOSg7OhjsZrFRRh49Wnpqutk3HDzl+ojmUxL9aF0t1lkLCPEjTgx
 ONwJCL0CzgCBneuXb12y8xV33nbj31OCTqfkrBqOPzj9NcgBELWMHMzD8922do009kAm
 OHSDekLujc0I4GooXF7JecdknudzaxMntKeqEaNwp95ctZi+q2zlnKW6B5W9tJ3EmgnE
 YReGkt1kjeBZbc9wGm4EslDPkHBmoYLq1yx1n+xSqxfoAS/vuk8+LPe3GFJzJE/RuALH
 QMEaHnQEw+mXuPF9FHAoJus1vXgdsia8B04rkRU4cqiNx+4sZDooCj5V0p1FJjpBj+qS
 r5mQ==
X-Gm-Message-State: AOAM531n9i+1lMbqHAh0kL6SwipylXuwhg5JlktlQ7z6dJx02Uqo0On6
 oq8um7t2qw2JZq8Pp8lLqHKEow==
X-Google-Smtp-Source: ABdhPJzn0hsHSArPV+PdoU3MwAI+uaM7MfxzC+Q9pFqpa5/9nfQ0iIqmvEqP+hOl9RxA7AZoMzJjNw==
X-Received: by 2002:a1c:988f:: with SMTP id a137mr2554157wme.130.1610549450459; 
 Wed, 13 Jan 2021 06:50:50 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/31] video: fbdev: riva: riva_hw: Remove set but unused
 variables 'vus_p' and 'vus_n'
Date: Wed, 13 Jan 2021 14:50:04 +0000
Message-Id: <20210113145009.1272040-27-lee.jones@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Jeff Garzik <jgarzik@pobox.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuYzogSW4gZnVuY3Rpb24g4oCYbnYxMENhbGNBcmJp
dHJhdGlvbuKAmToKIGRyaXZlcnMvdmlkZW8vZmJkZXYvcml2YS9yaXZhX2h3LmM6ODQ1OjIzOiB3
YXJuaW5nOiB2YXJpYWJsZSDigJh2dXNfcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQogZHJpdmVycy92aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuYzo4NDU6
MTY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHZ1c19u4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogQW50b25pbm8gRGFwbGFzIDxhZGFwbGFzQGdtYWls
LmNvbT4KQ2M6IEplZmYgR2FyemlrIDxqZ2FyemlrQHBvYm94LmNvbT4KQ2M6IGxpbnV4LWZiZGV2
QHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
dmlkZW8vZmJkZXYvcml2YS9yaXZhX2h3LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3JpdmEvcml2YV9ody5jIGIvZHJpdmVycy92aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuYwpp
bmRleCA0ZWU2M2Y3ZDg0ZDNlLi4yYmM1MTBjMjRhYTllIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3JpdmEvcml2YV9ody5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcml2YS9y
aXZhX2h3LmMKQEAgLTg0Miw3ICs4NDIsNyBAQCBzdGF0aWMgdm9pZCBudjEwQ2FsY0FyYml0cmF0
aW9uCiAgICAgaW50IGZvdW5kLCBtY2xrX2V4dHJhLCBtY2xrX2xvb3AsIGNicywgbTE7CiAgICAg
aW50IG1jbGtfZnJlcSwgcGNsa19mcmVxLCBudmNsa19mcmVxLCBtcF9lbmFibGU7CiAgICAgaW50
IHVzX20sIHVzX21fbWluLCB1c19uLCB1c19wLCBjcnRjX2RyYWluX3JhdGU7Ci0gICAgaW50IHZ1
c19tLCB2dXNfbiwgdnVzX3A7CisgICAgaW50IHZ1c19tOwogICAgIGludCB2cG1fdXMsIHVzX3Zp
ZGVvLCBjcG1fdXMsIHVzX2NydCxjbHdtOwogICAgIGludCBjbHdtX3JuZF9kb3duOwogICAgIGlu
dCBtMnVzLCB1c19waXBlX21pbiwgcDFjbGssIHAyOwpAQCAtOTI0LDggKzkyNCw2IEBAIHN0YXRp
YyB2b2lkIG52MTBDYWxjQXJiaXRyYXRpb24KICAgICAgIHVzX3BpcGVfbWluID0gdXNfbV9taW4g
KyB1c19uICsgdXNfcDsKIAogICAgICAgdnVzX20gPSBtY2xrX2xvb3AgKjEwMDAqMTAwMCAvIG1j
bGtfZnJlcTsgLyogTWNsayBsYXRlbmN5IGluIHVzICovCi0gICAgICB2dXNfbiA9ICg0KSoxMDAw
KjEwMDAgLyBudmNsa19mcmVxOy8qIG52Y2xrIGxhdGVuY3kgaW4gdXMgKi8KLSAgICAgIHZ1c19w
ID0gMCoxMDAwKjEwMDAgLyBwY2xrX2ZyZXE7LyogcGNsayBsYXRlbmN5IGluIHVzICovCiAKICAg
ICAgIGlmKHZpZGVvX2VuYWJsZSkgewogICAgICAgICBjcnRjX2RyYWluX3JhdGUgPSBwY2xrX2Zy
ZXEgKiBicHAvODsgLyogTUIvcyAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
