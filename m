Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8E2F836C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E336E47E;
	Fri, 15 Jan 2021 18:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62736E486
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g10so8392548wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J8jnXbYZh9fQLGbXGQ/O0REzwyF7YhVgi5AkTd6twPI=;
 b=uF/0vIlBVC846lYN4HISdxnnS7K8yJ+3K/lfoibQMwkvdkdW1pKP/jh6fQ3gVoS9DA
 VIwmyj5LSrRc/XtozbDaXoUExRLAfyrQOFdiV/o1k3v32UjqQXeZ02YrXYIwbJ418a7X
 KGMiWIg3PhKnYEnxeDp94ruSxvdzn1VRb2iUPR1NKnkGlOcnpOgbvmHn7jucnhF/CO1X
 Vv8mqhwmgXj78y3TC0NcSG6YV3Udw6VRK6/89Hp2/XetCnbN5nVwvc4e7racI41l8zAW
 Y3CFATlEdyGbecMlUCoVJ6U5yJMiFQvDwf/ziz8hJ0s/wpbJe6M9MEfGlReSz0+cFrDn
 q2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J8jnXbYZh9fQLGbXGQ/O0REzwyF7YhVgi5AkTd6twPI=;
 b=fs4AyHGRZyRhvWdOSAXF4IWhI/Q/XTI1uuSwGh9ChEKC8MN5wdzQG5fdqdjM5/ipuH
 14aj05futOEpJg+6r7hNrJK4f7uOxhkV2umBd15mRheOy1EZ1z7jEC+h8cWpsxij9+65
 w+VhHeVJFy4BLnrIwm/pqj9ZGibhoqUc1U6QrN/kMy1TVxtyIWmHHgUnbir64rjIVu/1
 iyRaq0MWDwLuqahlM3xjUJMU9Dg4JXnpflAWcegJodv3pGf3GUMrKlb1VzZF/c4hDi/8
 l2yFaeOT05A34cxfAlUlv3qZyeBrHknj0vTbWbxL2LLLWWbPK05YIAbXkgcqka0qu39X
 ocjg==
X-Gm-Message-State: AOAM530EJOgXZ803YGAL5QPH2zNK6ESM4X5tpLiAj0H2j9ea67Ny6pi+
 pT4qkN5lDJ0RcE4i/DhU44WzHg==
X-Google-Smtp-Source: ABdhPJwnCR0Nzz3e0c6LzffEGLK2o6EAODTUN633CFgBq6cZO9FrWPi92VhlIb0jckP0HwOwMQr3lQ==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr10045620wmg.189.1610734419371; 
 Fri, 15 Jan 2021 10:13:39 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/40] drm/gma500/gem: Add and rename some function parameter
 descriptions
Date: Fri, 15 Jan 2021 18:12:48 +0000
Message-Id: <20210115181313.3431493-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9nZW0uYzo1Nzo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmHBzYl9nZW1fY3JlYXRl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmM6NTk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ3N0b2xlbicgbm90IGRlc2NyaWJlZCBpbiAncHNiX2dlbV9jcmVhdGUnCiBkcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL2dlbS5jOjU5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdhbGlnbicgbm90IGRlc2NyaWJlZCBpbiAncHNiX2dlbV9jcmVhdGUnCiBkcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL2dlbS5jOjExMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnZmlsZScgbm90IGRlc2NyaWJlZCBpbiAncHNiX2dlbV9kdW1iX2NyZWF0ZScK
IGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmM6MTEwOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rp
b24gcGFyYW1ldGVyICdkcm1fZmlsZScgZGVzY3JpcHRpb24gaW4gJ3BzYl9nZW1fZHVtYl9jcmVh
dGUnCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dlbS5jOjEzNTogd2FybmluZzogRXhjZXNzIGZ1
bmN0aW9uIHBhcmFtZXRlciAndm1hJyBkZXNjcmlwdGlvbiBpbiAncHNiX2dlbV9mYXVsdCcKCkNj
OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvZ2VtLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dlbS5jCmluZGV4IGRiODI3ZTU5MTQwM2MuLjVlZjU0
ODBmOTk5ZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nZW0uYwpAQCAtNDksNiArNDksOCBAQCBjb25zdCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgcHNiX2dlbV9vYmplY3RfZnVuY3MgPSB7CiAgKglAZGV2
OiBvdXIgZGV2aWNlCiAgKglAc2l6ZTogdGhlIHNpemUgcmVxdWVzdGVkCiAgKglAaGFuZGxlcDog
cmV0dXJuZWQgaGFuZGxlIChvcGFxdWUgbnVtYmVyKQorICoJQHN0b2xlbjogdW51c2VkCisgKglA
YWxpZ246IHVudXNlZAogICoKICAqCUNyZWF0ZSBhIEdFTSBvYmplY3QsIGZpbGwgaW4gdGhlIGJv
aWxlcnBsYXRlIGFuZCBhdHRhY2ggYSBoYW5kbGUgdG8KICAqCWl0IHNvIHRoYXQgdXNlcnNwYWNl
IGNhbiBzcGVhayBhYm91dCBpdC4gVGhpcyBkb2VzIHRoZSBjb3JlIHdvcmsKQEAgLTk3LDcgKzk5
LDcgQEAgaW50IHBzYl9nZW1fY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdTY0IHNpemUsCiAKIC8qKgogICoJcHNiX2dlbV9kdW1iX2NyZWF0ZQkt
CWNyZWF0ZSBhIGR1bWIgYnVmZmVyCi0gKglAZHJtX2ZpbGU6IG91ciBjbGllbnQgZmlsZQorICoJ
QGZpbGU6IG91ciBjbGllbnQgZmlsZQogICoJQGRldjogb3VyIGRldmljZQogICoJQGFyZ3M6IHRo
ZSByZXF1ZXN0ZWQgYXJndW1lbnRzIGNvcGllZCBmcm9tIHVzZXJzcGFjZQogICoKQEAgLTExNiw3
ICsxMTgsNiBAQCBpbnQgcHNiX2dlbV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUs
IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAKIC8qKgogICoJcHNiX2dlbV9mYXVsdAkJLQlwYWdl
ZmF1bHQgaGFuZGxlciBmb3IgR0VNIG9iamVjdHMKLSAqCUB2bWE6IHRoZSBWTUEgb2YgdGhlIEdF
TSBvYmplY3QKICAqCUB2bWY6IGZhdWx0IGRldGFpbAogICoKICAqCUludm9rZWQgd2hlbiBhIGZh
dWx0IG9jY3VycyBvbiBhbiBtbWFwIG9mIGEgR0VNIG1hbmFnZWQgYXJlYS4gR0VNCi0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
