Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417B2B4CDA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749ED89FCA;
	Mon, 16 Nov 2020 17:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1B89FA6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:30:21 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d12so19570948wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZGU4hgv9ySSnT3lm5gi+Q8yFIEoSUWPQdVLIUJTRR4=;
 b=ZBnRjH5bHdD/fr6ODOIv3yB6B8MvWEu+w+dRaMNIJ4yj/v3SIIw+od+35JUs/9KuDj
 6EvYZOlRHK6d8G5VJC6PLs36kwAf6UNWM/yp0+plhP0iT2JasQSq7sbtCZBmG7RW6I/y
 CPHErLD7H3mfTjWmpJe+4+Iw8jAixy/VmX9ZGE0ATZOsIOYh0HotctE6qn7L3M6MGr1Z
 +35D5kBsbJuc9PJh3i5k8I2oVKNMPpvyShGgTjIfeimqPDkzv8iOUMk03rUMgfHR0aU4
 1EvaXPkzLiEBYvnXqyRSYdGLmg4zeP1xgEzByo1a2XjImHxIyIMaft1/2IqoHjk+6l9D
 oZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZGU4hgv9ySSnT3lm5gi+Q8yFIEoSUWPQdVLIUJTRR4=;
 b=VaYAE+vCJW5JMA4fo2ntxrzUGZ7wlCb2ZkTsckLR3gzNlTL+zV/AbanujzuG2/qnQ/
 qWRtNZH7FOnMy6vCZpf1VKhML7ytOdrKjMcfEGjy5ZvZ5FXFAumQI6UzTGAAzpX2W4pQ
 Q0FrX5Fy11+zKKN396tb/3J5iXRZby8LhBmb88YyUxmGj/O+A606QKidDvc8umo35VKI
 Tajtf67Tc9YHoNTnASi75gr7YxFneguorySZ4ug39R23LlhAUAdnGQnpSQlnZxfjIYlL
 st2e3fpw7JwRzcJGbPlz6CrPtpTjzgMyu6BSn6PDeNplJAYXlR8Mv1Ct9/i/xgeyj8xH
 tZPA==
X-Gm-Message-State: AOAM530mX/iWqZK/yLtn2OdqoKemqusTCrrlvNel1/t/HLmMAKmo4+t8
 g9PF0OwWMsWYJcfMhDpzKGEzHg==
X-Google-Smtp-Source: ABdhPJw8KV+7wDQGTEX7r+P3jFUndKbF178C178OZT+4NFAaB6TbWQSLwP68uPGl6BK/lRpgQ3Mreg==
X-Received: by 2002:adf:e287:: with SMTP id v7mr21598502wri.252.1605547819721; 
 Mon, 16 Nov 2020 09:30:19 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:30:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/43] drm/radeon/radeon_irq_kms: Demote non-conformant
 kernel-doc fix another
Date: Mon, 16 Nov 2020 17:29:30 +0000
Message-Id: <20201116173005.1825880-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173005.1825880-1-lee.jones@linaro.org>
References: <20201116173005.1825880-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU2OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpcnEnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9kcml2ZXJf
aXJxX2hhbmRsZXJfa21zJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5j
OjU2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhcmcnIG5vdCBkZXNj
cmliZWQgaW4gJ3JhZGVvbl9kcml2ZXJfaXJxX2hhbmRsZXJfa21zJwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU3MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnbicgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX2lycV9rbXNfc2V0X2lycV9u
X2VuYWJsZWQnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pcnFfa21zLmM6NTcxOiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdudW0nIGRlc2NyaXB0aW9uIGluICdy
YWRlb25faXJxX2ttc19zZXRfaXJxX25fZW5hYmxlZCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25faXJxX2ttcy5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9pcnFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9p
cnFfa21zLmMKaW5kZXggYjg2YmM4OGFkNDMwOC4uYTI0MmI2MDUzZDQ3ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYwpAQCAtNDMsMTEgKzQzLDkgQEAKIAogI2RlZmlu
ZSBSQURFT05fV0FJVF9JRExFX1RJTUVPVVQgMjAwCiAKLS8qKgorLyoKICAqIHJhZGVvbl9kcml2
ZXJfaXJxX2hhbmRsZXJfa21zIC0gaXJxIGhhbmRsZXIgZm9yIEtNUwogICoKLSAqIEBpbnQgaXJx
LCB2b2lkICphcmc6IGFyZ3MKLSAqCiAgKiBUaGlzIGlzIHRoZSBpcnEgaGFuZGxlciBmb3IgdGhl
IHJhZGVvbiBLTVMgZHJpdmVyIChhbGwgYXNpY3MpLgogICogcmFkZW9uX2lycV9wcm9jZXNzIGlz
IGEgbWFjcm8gdGhhdCBwb2ludHMgdG8gdGhlIHBlci1hc2ljCiAgKiBpcnEgaGFuZGxlciBjYWxs
YmFjay4KQEAgLTU0OSwxNCArNTQ3LDE0IEBAIHZvaWQgcmFkZW9uX2lycV9rbXNfZGlzYWJsZV9o
cGQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHVuc2lnbmVkIGhwZF9tYXNrKQogfQogCiAv
KioKLSAqIHJhZGVvbl9pcnFfa21zX3VwZGF0ZV9pbnRfbiAtIGhlbHBlciBmb3IgdXBkYXRpbmcg
aW50ZXJydXB0IGVuYWJsZSByZWdpc3RlcnMKKyAqIHJhZGVvbl9pcnFfa21zX3NldF9pcnFfbl9l
bmFibGVkIC0gaGVscGVyIGZvciB1cGRhdGluZyBpbnRlcnJ1cHQgZW5hYmxlIHJlZ2lzdGVycwog
ICoKICAqIEByZGV2OiByYWRlb24gZGV2aWNlIHBvaW50ZXIKICAqIEByZWc6IHRoZSByZWdpc3Rl
ciB0byB3cml0ZSB0byBlbmFibGUvZGlzYWJsZSBpbnRlcnJ1cHRzCiAgKiBAbWFzazogdGhlIG1h
c2sgdGhhdCBlbmFibGVzIHRoZSBpbnRlcnJ1cHRzCiAgKiBAZW5hYmxlOiB3aGV0aGVyIHRvIGVu
YWJsZSBvciBkaXNhYmxlIHRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIKICAqIEBuYW1lOiB0aGUgbmFt
ZSBvZiB0aGUgaW50ZXJydXB0IHJlZ2lzdGVyIHRvIHByaW50IHRvIHRoZSBrZXJuZWwgbG9nCi0g
KiBAbnVtOiB0aGUgbnVtYmVyIG9mIHRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIgdG8gcHJpbnQgdG8g
dGhlIGtlcm5lbCBsb2cKKyAqIEBuOiB0aGUgbnVtYmVyIG9mIHRoZSBpbnRlcnJ1cHQgcmVnaXN0
ZXIgdG8gcHJpbnQgdG8gdGhlIGtlcm5lbCBsb2cKICAqCiAgKiBIZWxwZXIgZm9yIHVwZGF0aW5n
IHRoZSBlbmFibGUgc3RhdGUgb2YgaW50ZXJydXB0IHJlZ2lzdGVycy4gQ2hlY2tzIHdoZXRoZXIK
ICAqIG9yIG5vdCB0aGUgaW50ZXJydXB0IG1hdGNoZXMgdGhlIGVuYWJsZSBzdGF0ZSB3ZSB3YW50
LiBJZiBpdCBkb2Vzbid0LCB0aGVuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
