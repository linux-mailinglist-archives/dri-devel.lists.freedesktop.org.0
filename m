Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19775AEF0
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9072C6E9DC;
	Sun, 30 Jun 2019 06:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608E36E9C9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:46 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i21so9820675ljj.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zd3qVnLZi9zmIdF9Hj9MDJw7CJB7LOZ6+Ka2Da1rPI4=;
 b=pbjGXEG3KNRaredMeyGxWIZDGhlOo9xMlugYhC98CnhVl7+QL+rDKZVA/eyEub2v+H
 7tVsp0hrIhKZZ0rKbODNXotkVfLsKYehCuQSrKUyDH1tS7U6WL8lUC3jdnkbzGBhgt/P
 HjwbJYNfCmHceLxYY1Mr/wm8Eas/UpthO+LyDqz/ox08+DeVhfXkXMEnWkYmkduoeUSJ
 Z6NJI4SHzYRVL+R6FSAFAMW3qnMvOZft0Jrjvfe1W57WA72WRwhT2YjXB1XwgJtfmjtA
 /qO+UmsloBhdrdeKeFvlF5yV5ugUQwFthMsoK8uHQp3XRDvUtIxfuxb67uHd4TJWMjSS
 oSrQ==
X-Gm-Message-State: APjAAAVmSWZ689btfgL3ZQ3RoCAuwXigy5z8H4KLfUfM3gacnvLN56z8
 U4qzQhUJkSZaRImU1NVqHAY7ssy6qM2MHA==
X-Google-Smtp-Source: APXvYqyo3XZgOtt4SdTk+mI1B7M+tFbnMHaXSJ7nFLcTpEWJc3D6zU47AmKGqrpv1w9+cxxXjBw7vA==
X-Received: by 2002:a2e:959a:: with SMTP id w26mr10748258ljh.150.1561875583073; 
 Sat, 29 Jun 2019 23:19:43 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:42 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 15/33] drm/r128: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:04 +0200
Message-Id: <20190630061922.7254-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zd3qVnLZi9zmIdF9Hj9MDJw7CJB7LOZ6+Ka2Da1rPI4=;
 b=JWtbMY/l1DPABRMNTDdRfrz73xL4BtS5vMsz4+wsWr3cct2gki22eY26NnlXxlBY+M
 D7dzc85OaEhQZIWlIMZ1AHtB8IScLpxjTxNz4PVRJ9Qa/JNpnXseGxIhFTkiWZlxC6zY
 OyKEPExJ3mtm5z0e4THyYm9i8cCA29dqrFHUo0YCgm9YMVNdOrQjGPOhbO52FqznNUU3
 VJIJhUf9UlHQJG8JNR5CH64fyc7N1zOQJem6sL+5B2vhlD+oKDfsQt4ofvGd/Q0FcaPO
 ydBoUFkQY9Z8qrjsbXsxC2odkIgXO6/vF1qMRqE9ZuBPVp1osJAYWLZ0llb1MlCcRjTt
 +2UQ==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlCndpdGggcmVs
ZXZhbnQgaW5jbHVkZXMuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Ci0tLQpUaGUgbGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBhZGQgYWxsIHJlY2lwaWVudHMg
dG8gdGhlIGNvdmVyIGxldHRlci4KUGxlYXNlIGZpbmQgY292ZXIgbGV0dGVyIGhlcmU6Cmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUvdGhy
ZWFkLmh0bWwKU2VhcmNoIGZvciAiZHJtOiBkcm9wIHVzZSBvZiBkcm1wLmggaW4gZHJtLW1pc2Mi
CgogICAgICAgIFNhbQoKIGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaW9jMzIuYyB8IDMgKyst
CiBkcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2lycS5jICAgfCA1ICsrKystCiAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2lvYzMyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4
X2lvYzMyLmMKaW5kZXggNjU4OWY5ZTAzMTBlLi42YWM3MTc1NWMyMmQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaW9jMzIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcjEy
OC9yMTI4X2lvYzMyLmMKQEAgLTI5LDEwICsyOSwxMSBAQAogICogT1VUIE9GIE9SIElOIENPTk5F
Q1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUwogICog
SU4gVEhFIFNPRlRXQVJFLgogICovCisKICNpbmNsdWRlIDxsaW51eC9jb21wYXQuaD4KIAotI2lu
Y2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5jbHVkZSA8ZHJtL3IxMjhfZHJtLmg+CisKICNpbmNsdWRl
ICJyMTI4X2Rydi5oIgogCiB0eXBlZGVmIHN0cnVjdCBkcm1fcjEyOF9pbml0MzIgewpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
MTI4L3IxMjhfaXJxLmMKaW5kZXggOTczMGY0OTE4OTQ0Li5kODRlOWM5NmUyMGEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaXJxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3IxMjgvcjEyOF9pcnEuYwpAQCAtMzAsOCArMzAsMTEgQEAKICAqICAgIEVyaWMgQW5ob2x0IDxh
bmhvbHRARnJlZUJTRC5vcmc+CiAgKi8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CisjaW5jbHVk
ZSA8ZHJtL2RybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CisjaW5jbHVk
ZSA8ZHJtL2RybV92YmxhbmsuaD4KICNpbmNsdWRlIDxkcm0vcjEyOF9kcm0uaD4KKwogI2luY2x1
ZGUgInIxMjhfZHJ2LmgiCiAKIHUzMiByMTI4X2dldF92YmxhbmtfY291bnRlcihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
