Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F21511D2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 22:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEA06E030;
	Mon,  3 Feb 2020 21:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04A56E030
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 21:31:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so20228679wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 13:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLGuWd5d9cmXYj1Rt40fXm0YVG0wDFFoc6RvbGn23XM=;
 b=EnGOUkpexmwwCQn6VrhcVpti2U8L8lnKSWGfAjRpuTsRw6AbDSb7kyyk/4AuL3zaOY
 WDQszwY0Pmy6LpxQbMRC2Hq4rZM1dVv4q8ay/jfC4cSW+AoMw2E61LJ6JNYzAAwYN0um
 U0xgyKi+1Hd0PHGH2cKeLKjBgUl3rk5vpssmfPi+QA7w+uN7Qjy39Bit8igSgzxN1q3U
 xsBm83R5NPgrrgQtnerMUfilzE7vS810La4rTQ0wqSIcSnW7131Pr1X/CogBo5yW3iaH
 0WcVW0K0xcCZxnivfhS+g8irhu5aLvb57bpNNO5k4RmJXDfXuVeaQkmYlhEZd+m+8edM
 Sr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLGuWd5d9cmXYj1Rt40fXm0YVG0wDFFoc6RvbGn23XM=;
 b=mff/LhIaolD8Tx7RIHhzAIgFlffhbIsseC4qCToB5gJ9jDuUGNSEVbkuHpxd0wzqQp
 UB2AJAqTEp5Q/YEh7CKZwFauHIFreaME3O7xhWbVQHiTb3VAzqyGOLJjCnmEUAylir0f
 9DEKyKNbEVYwsITn3s2LOaq2NQvkzhCWkie7OH4aw9tWevnvh7xxLFDhrBtQQ0H5/XT8
 9P68KL/DlJL5roed/BeLZEYfmcr2C+cdPnOg5tTuSW36P2s+InRWlZRp+m6KAU1Z0mSH
 WKnNd3lNb2eUZgl7QLLvBUUr3VCQKEnIvyX9Yz73SLJa+bNgMLnwzNXMNjstcqjuSafp
 FqbA==
X-Gm-Message-State: APjAAAWcaVom4zI3R4fGiblqrMNnWr0BUexcSDQcsXqm0gj6cubBaxZv
 5SRm140vVJsDaJ9+DQwq0dKNhOOn
X-Google-Smtp-Source: APXvYqzs1foiqO5jr921TBJ5bSENLRUCJFdCq26Pt8YqSghytA7RaC8PaKbxZqYc1AGQtJNthhu7Kg==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr17276360wrt.408.1580765481223; 
 Mon, 03 Feb 2020 13:31:21 -0800 (PST)
Received: from utente-desktop.station (net-93-147-77-206.cust.vodafonedsl.it.
 [93.147.77.206])
 by smtp.googlemail.com with ESMTPSA id s16sm27814776wrn.78.2020.02.03.13.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 13:31:20 -0800 (PST)
From: Mauro Rossi <issor.oruam@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: fix building error
Date: Mon,  3 Feb 2020 22:31:13 +0100
Message-Id: <20200203213113.28183-1-issor.oruam@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Mauro Rossi <issor.oruam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZGluZyBlcnJvcjoKCkNDIFtNXSDCoGRyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5vCn4vcGllLXg4Nl9rZXJuZWwva2VybmVsL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jOiBJbiBmdW5jdGlvbiAnY2VhX21vZGVfYWx0ZXJuYXRlX3RpbWluZ3MnOgp+L3Bp
ZS14ODZfa2VybmVsL2tlcm5lbC9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYzozMjc1OjI6IGVy
cm9yOiBjYWxsIHRvICdfX2NvbXBpbGV0aW1lX2Fzc2VydF8zMjgyJwpkZWNsYXJlZCB3aXRoIGF0
dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDogY2VhX21vZGVfZm9yX3ZpYyg4KS0+
dnRvdGFsICE9IDI2MiB8fCBjZWFfbW9kZV9mb3JfdmljKDkpLT52dG90YWwgIT0gMjYyIHx8IGNl
YV9tb2RlX2Zvcl92aWMoMTIpLT52dG90YWwgIT0gMjYyIHx8IGNlYV9tb2RlX2Zvcl92aWMoMTMp
LT52dG90YWwgIT0gMjYyIHx8IGNlYV9tb2RlX2Zvcl92aWMoMjMpLT52dG90YWwgIT0gMzEyIHx8
IGNlYV9tb2RlX2Zvcl92aWMoMjQpLT52dG90YWwgIT0gMzEyIHx8IGNlYV9tb2RlX2Zvcl92aWMo
MjcpLT52dG90YWwgIT0gMzEyIHx8IGNlYV9tb2RlX2Zvcl92aWMoMjgpLT52dG90YWwgIT0gMzEy
Cm1ha2VbNF06ICoqKiBbfi9waWUteDg2X2tlcm5lbC9rZXJuZWwvc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDoyNjU6IGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5vXSBFcnJvciAxCgpGaXhlczogN2Jl
ZmU2MiAoImRybS9lZGlkOiBBYnN0cmFjdCBhd2F5IGNlYV9lZGlkX21vZGVzW10iKQpTaWduZWQt
b2ZmLWJ5OiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCA5OTc2OWQ2YzlmODQuLjgwNWZiMDA0
YzhlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTMyMTEsNyArMzIxMSw3IEBAIHN0YXRpYyB1OCAqZHJt
X2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkKIAlyZXR1cm4gY2Vh
OwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmNlYV9tb2RlX2Zv
cl92aWModTggdmljKQorc3RhdGljIF9fYWx3YXlzX2lubGluZSBjb25zdCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2aWMpCiB7CiAJQlVJTERfQlVHX09OKDEg
KyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzEpIC0gMSAhPSAxMjcpOwogCUJVSUxEX0JVR19P
TigxOTMgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzE5MykgLSAxICE9IDIxOSk7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
