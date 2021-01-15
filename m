Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A912F83A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BDC6E4C9;
	Fri, 15 Jan 2021 18:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E446E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d13so10175678wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klcbd1e9WNIfeT7Kw/V+fGmeHX8/YIMOVJeu6cqS6p8=;
 b=Jeva4W7b5GmkLma0e0Xq2LyelIdviMQ5Xtdc74BWOdiUZov1iTUGSs4RdBxLNmQI6C
 xZ9R5zA0dodI3/TxwKcWEepE4zEOvD40upf9vjbHymNQhp+QdNYGPJzgJIKkQbocLbc8
 cE32+iJI5yVLlTDqLJI9VzVuWhPNvOuhdmUMumzV9EXyb2S83X1nTD0CtHsod8AmpZYQ
 L6y8sevlrSKQa0OomUujlM4Vl0UDvZ7LIStc5x9v9qb62+xiBlnUDNgiirVMuLMGkv1d
 OTqR4QgreqpMCp2pOorq5hOFyE5Pklwlns+yu4dxl3V7HNxbLo/QgIRVxAW56aXa1zOs
 G0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klcbd1e9WNIfeT7Kw/V+fGmeHX8/YIMOVJeu6cqS6p8=;
 b=EWBSVIdtDNh5bT8OYEI10jq1PHBZ4h4FWlDMHi2rZlWhYj9w2xR4DETLJ/4QzwWp/0
 cG5o+53dcsZhHCh0XQRDvuyR/WidAcxglxKmFQs4C3cuM8OUi1a3Z0zcTltUAReB8Vil
 aNO1+Bprrcqry6KEaVfm6jtosghuG3r8g+LQc7YW02YHsQ1kwVn7rHF1be1NXQWp2vP2
 cOHWetqdvdVa63U2gcD3T3um2Pxrbqd4BAlu8WMwWdPZKUhMOtQHI8mlwdkMY+kz3wjB
 YJjr8e0V0C72UMh4BSV3E458vnQVUo4JS6FZpfpQH1jNl1k80sXiiIi0jUPocV3y/LRB
 K/zw==
X-Gm-Message-State: AOAM533VRpryakTtJkaYXJWtFjgh3IYhBCzKeZ17IkRZIkBOjopJV5KY
 DRaCFlMXNaBSi0Rc5suLZWkeiA==
X-Google-Smtp-Source: ABdhPJySoMYDbbVCZgUWIxIqiX91GdBD0424m3xS2BiLVfk/hmUs+W5i3x0nPZ2KmzwAXV+nPvMwOw==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr14224637wry.184.1610734579303; 
 Fri, 15 Jan 2021 10:16:19 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/29] drm/vmwgfx/ttm_object: Demote half-assed headers and
 fix-up another
Date: Fri, 15 Jan 2021 18:15:41 +0000
Message-Id: <20210115181601.3432599-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Rob Clark <rob.clark@linaro.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmM6NjA6IGVycm9yOiBDYW5ub3QgcGFyc2Ugc3Ry
dWN0IG9yIHVuaW9uIQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmM6OTc6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ21lbV9nbG9iJyBub3QgZGVzY3Jp
YmVkIGluICd0dG1fb2JqZWN0X2RldmljZScKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX29i
amVjdC5jOjk3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdvcHMnIG5v
dCBkZXNjcmliZWQgaW4gJ3R0bV9vYmplY3RfZGV2aWNlJwogZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC90dG1fb2JqZWN0LmM6OTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIg
J2RtYWJ1Zl9yZWxlYXNlJyBub3QgZGVzY3JpYmVkIGluICd0dG1fb2JqZWN0X2RldmljZScKIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX29iamVjdC5jOjk3OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdkbWFfYnVmX3NpemUnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV9v
YmplY3RfZGV2aWNlJwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmM6OTc6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2lkcicgbm90IGRlc2NyaWJlZCBp
biAndHRtX29iamVjdF9kZXZpY2UnCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3Qu
YzoxMjg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3JjdV9oZWFkJyBu
b3QgZGVzY3JpYmVkIGluICd0dG1fcmVmX29iamVjdCcKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dHRtX29iamVjdC5jOjEyODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
dGZpbGUnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV9yZWZfb2JqZWN0JwogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC90dG1fb2JqZWN0LmM6NTgyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdkbWFidWYnIG5vdCBkZXNjcmliZWQgaW4gJ2dldF9kbWFfYnVmX3VubGVzc19kb29t
ZWQnCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYzo1ODI6IHdhcm5pbmc6IEV4
Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2RtYV9idWYnIGRlc2NyaXB0aW9uIGluICdnZXRfZG1h
X2J1Zl91bmxlc3NfZG9vbWVkJwoKQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3Mt
bWFpbnRhaW5lckB2bXdhcmUuY29tPgpDYzogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZt
d2FyZS5jb20+CkNjOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KQ2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQGxpbmFyby5vcmc+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdHRtX29iamVjdC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC90dG1fb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYwppbmRl
eCAwZmU4NjlkMGZhZDEyLi5iM2ZkYzYzMDQ5N2NiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3R0bV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9v
YmplY3QuYwpAQCAtNzMsNyArNzMsNyBAQCBzdHJ1Y3QgdHRtX29iamVjdF9maWxlIHsKIAlzdHJ1
Y3Qga3JlZiByZWZjb3VudDsKIH07CiAKLS8qKgorLyoKICAqIHN0cnVjdCB0dG1fb2JqZWN0X2Rl
dmljZQogICoKICAqIEBvYmplY3RfbG9jazogbG9jayB0aGF0IHByb3RlY3RzIHRoZSBvYmplY3Rf
aGFzaCBoYXNoIHRhYmxlLgpAQCAtOTYsNyArOTYsNyBAQCBzdHJ1Y3QgdHRtX29iamVjdF9kZXZp
Y2UgewogCXN0cnVjdCBpZHIgaWRyOwogfTsKIAotLyoqCisvKgogICogc3RydWN0IHR0bV9yZWZf
b2JqZWN0CiAgKgogICogQGhhc2g6IEhhc2ggZW50cnkgZm9yIHRoZSBwZXItZmlsZSBvYmplY3Qg
cmVmZXJlbmNlIGhhc2guCkBAIC01NjgsNyArNTY4LDcgQEAgdm9pZCB0dG1fb2JqZWN0X2Rldmlj
ZV9yZWxlYXNlKHN0cnVjdCB0dG1fb2JqZWN0X2RldmljZSAqKnBfdGRldikKIC8qKgogICogZ2V0
X2RtYV9idWZfdW5sZXNzX2Rvb21lZCAtIGdldCBhIGRtYV9idWYgcmVmZXJlbmNlIGlmIHBvc3Np
YmxlLgogICoKLSAqIEBkbWFfYnVmOiBOb24tcmVmY291bnRlZCBwb2ludGVyIHRvIGEgc3RydWN0
IGRtYS1idWYuCisgKiBAZG1hYnVmOiBOb24tcmVmY291bnRlZCBwb2ludGVyIHRvIGEgc3RydWN0
IGRtYS1idWYuCiAgKgogICogT2J0YWluIGEgZmlsZSByZWZlcmVuY2UgZnJvbSBhIGxvb2t1cCBz
dHJ1Y3R1cmUgdGhhdCBkb2Vzbid0IHJlZmNvdW50CiAgKiB0aGUgZmlsZSwgYnV0IHN5bmNocm9u
aXplcyB3aXRoIGl0cyByZWxlYXNlIG1ldGhvZCB0byBtYWtlIHN1cmUgaXQgaGFzCi0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
