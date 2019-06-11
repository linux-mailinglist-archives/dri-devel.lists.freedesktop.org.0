Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411493D0A8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 17:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49116891EB;
	Tue, 11 Jun 2019 15:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13CF891EB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:21:59 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i34so14985578qta.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ravhFNkMcQ1um+wHwyFB5Wth+TRF0BDgyAEGNz2KUCk=;
 b=NhSNSjEaoSRRtgWx19amI65rqn6HkFEHy9gD0cN14s/QFwwLa+TzAkQQtVJCrixtvl
 y2pSc9PIn6uohhdiB2JSE8N9GQAacJtIHgN+pcC9NER+qXLAnvnghraI110pR3g6PgLS
 mZDPkc6xoGIvV2M/osbZ1OMJnem0VAtcIMNWvNobwB1shqYsnuRAow+0zmIMMxp9NErw
 HmRYp/EzMifrGjlhA4sjE0DCIL0Xo3SKfEtGyCBzWY4FLy44K92eSz1jp6seI7u8ZtXA
 O3K0W74l2vlYgi2MvTtiAy2SbfyGMF0WA3nhu/bTYao7NBBJVss+LukH2dygcwS8/JCk
 VgFw==
X-Gm-Message-State: APjAAAU2BPF4sWFH8E4cq0FxwSTl6VCmXmPGCRjhkWv3gz9dtG1wMhdy
 hReuoXilFSRIgRX80oM8BuM=
X-Google-Smtp-Source: APXvYqyn6VxU4w7nnlCaITaoBVyqp00ofinH+zDu6x4uybj6TI8SAWeWPL5idNuksgBnxkCdcparGg==
X-Received: by 2002:ac8:336a:: with SMTP id u39mr1884140qta.178.1560266518873; 
 Tue, 11 Jun 2019 08:21:58 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id h40sm1602597qth.4.2019.06.11.08.21.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 08:21:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: l.stach@pengutronix.de
Subject: [PATCH] drm/etnaviv: Use dev_info() instead of pr_info()
Date: Tue, 11 Jun 2019 12:21:57 -0300
Message-Id: <20190611152157.18716-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ravhFNkMcQ1um+wHwyFB5Wth+TRF0BDgyAEGNz2KUCk=;
 b=huJZ31GPMLnfdngL9iBNTerhV2CkN1abvSWml7PQwbYZt72zw+Pwb8MjrDxBY7Jp0I
 G4dUKq/cMO1iZUJqGK27UpTvVqP3WDNLN0AqTlHmX3nLq9292QCyG5BPYRHVCpkAyXI2
 ulcXmxcNE9vlgr83eDyeM+ofyp5KC2kvYrOUA2HD7kpPtkjZLYx8ScNuzbqX7ocqP5rG
 kVYq5Zf1mXIJWsibfEHR0SlYuchZIwUOUjeJVONja5Sj9bWe1uIs8n9W35/Bc0W+3u9/
 2yl2Ar0YI8RVtnZ4Y06oOUFvUqIyDhj0o7uElWm8eoKJAg/e4uLZSvnFLboQVa6shC7B
 OZTw==
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
Cc: dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2X2luZm8oKSBpcyBtb3JlIGFwcHJvcHJpYXRlIGZvciBwcmludGluZyBlcnJvciBtZXNzYWdl
cyBpbnNpZGUKZHJpdmVycywgc28gc3dpdGNoIHRvIGRldl9pbmZvKCkuCgpTaWduZWQtb2ZmLWJ5
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9idWZmZXIuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9ldG5hdml2X2J1ZmZlci5jCmluZGV4IDE2MGNlM2MwNjBhNS4uODI3YjVlNDJkYmUzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMKQEAgLTQxNCwxOCArNDE0
LDE4IEBAIHZvaWQgZXRuYXZpdl9idWZmZXJfcXVldWUoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUs
IHUzMiBleGVjX3N0YXRlLAogCQkJICAgIGJ1ZmZlci0+dXNlcl9zaXplIC0gNCk7CiAKIAlpZiAo
ZHJtX2RlYnVnICYgRFJNX1VUX0RSSVZFUikKLQkJcHJfaW5mbygic3RyZWFtIGxpbmsgdG8gMHgl
MDh4IEAgMHglMDh4ICVwXG4iLAotCQkJcmV0dXJuX3RhcmdldCwgZXRuYXZpdl9jbWRidWZfZ2V0
X3ZhKGNtZGJ1ZiksCi0JCQljbWRidWYtPnZhZGRyKTsKKwkJZGV2X2luZm8oZ3B1LT5kZXYsICJz
dHJlYW0gbGluayB0byAweCUwOHggQCAweCUwOHggJXBcbiIsCisJCQkgcmV0dXJuX3RhcmdldCwg
ZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKGNtZGJ1ZiksCisJCQkgY21kYnVmLT52YWRkcik7CiAKIAlp
ZiAoZHJtX2RlYnVnICYgRFJNX1VUX0RSSVZFUikgewogCQlwcmludF9oZXhfZHVtcChLRVJOX0lO
Rk8sICJjbWQgIiwgRFVNUF9QUkVGSVhfT0ZGU0VULCAxNiwgNCwKIAkJCSAgICAgICBjbWRidWYt
PnZhZGRyLCBjbWRidWYtPnNpemUsIDApOwogCi0JCXByX2luZm8oImxpbmsgb3A6ICVwXG4iLCBi
dWZmZXItPnZhZGRyICsgd2FpdGxpbmtfb2Zmc2V0KTsKLQkJcHJfaW5mbygiYWRkcjogMHglMDh4
XG4iLCBsaW5rX3RhcmdldCk7Ci0JCXByX2luZm8oImJhY2s6IDB4JTA4eFxuIiwgcmV0dXJuX3Rh
cmdldCk7Ci0JCXByX2luZm8oImV2ZW50OiAlZFxuIiwgZXZlbnQpOworCQlkZXZfaW5mbyhncHUt
PmRldiwgImxpbmsgb3A6ICVwXG4iLCBidWZmZXItPnZhZGRyICsgd2FpdGxpbmtfb2Zmc2V0KTsK
KwkJZGV2X2luZm8oZ3B1LT5kZXYsICJhZGRyOiAweCUwOHhcbiIsIGxpbmtfdGFyZ2V0KTsKKwkJ
ZGV2X2luZm8oZ3B1LT5kZXYsICJiYWNrOiAweCUwOHhcbiIsIHJldHVybl90YXJnZXQpOworCQlk
ZXZfaW5mbyhncHUtPmRldiwgImV2ZW50OiAlZFxuIiwgZXZlbnQpOwogCX0KIAogCS8qCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
