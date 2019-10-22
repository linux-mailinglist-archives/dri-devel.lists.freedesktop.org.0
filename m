Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414FDE13BB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06436E9A3;
	Wed, 23 Oct 2019 08:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54EC6E5F0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 11:47:05 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id r13so2011987pls.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 04:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bhx4XpOMOAvSvKbY+GNWUpjZmdRh9xAzVtH8yGRzOsQ=;
 b=tWXrNucZ78UOeJ/6rT4+Vm/EIQUS8cWTbFEoFHR5l7CwE8hNCx1G8yeje4Rjrr4/JK
 QHJKtcn0H6kGOJxBKNTT6B3z1iTqoE9OpqXpBjnsswIfQEG+3noNupwj59ec282Q8qqF
 9jV4v0msrEZpMrVBpjR1oV3XJPwPbn3n+LN87gSU+CgiHE9jP6DGNLLliADJF+DvX1ap
 Zu6rvJR+OVkXDAdqY1o7JZQHo0MiaWuhMIcgi2SuMGFnYf2h+yoeB84ikK4f/zPVI/LN
 BN+a89wVl7+2Gk+KYR/iGK9xILJCeKXHNt6ZxbisI7IE/hFNnyliiIoXAIZVq83UgZQI
 dqtg==
X-Gm-Message-State: APjAAAUPOGB28h3Aa7VxptD4Z5Syf5W/MbvxzEKRx3mZIZw8qdkvmIgN
 9LCWKzWCiRs7fDyDTvi2dYMLKMSMR5Ae
X-Google-Smtp-Source: APXvYqxav0HrOfMpw4960RSWWzv7KqgN4pnD2wXbdoyd8cYu/tGEv/ffv9S5k7+O4gnGu3yAJgDijmZjv4MQ
X-Received: by 2002:a63:6116:: with SMTP id v22mr3089716pgb.95.1571744825052; 
 Tue, 22 Oct 2019 04:47:05 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:03 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.4.I659b5e6b25155890b85eb1c361e60f92d2500b7e@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 4/6] ASoC: mediatek: mt8183: use hdmi-codec
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=bhx4XpOMOAvSvKbY+GNWUpjZmdRh9xAzVtH8yGRzOsQ=;
 b=SIBiN9miBukP2vHVz9yb1Z7FzYKWBp7bstUfIx/l48YcGQot4ut6+8V5YUJL6c1Vqp
 0A/NHXnagesp/88Em+/Q++21OMqJgdwe9fSH0k6LaOG4jpyJyc5tDwISjoBwE6mLxDSa
 5veKygBQcZRHA4AZSjrCwhGgXe5MlbkeCUSywhc1nboAqBjXAADehO5RiEnoH+Ya/rkn
 8ncAtmX9QmchPk8cZwR0wLlGED4guLq/cpUFd7MfjP5n9FZtZt9lRPqBFKOrIKm+5r9x
 hpFDohJpJTr9QNLCYOEN8Ii6mALgfaNKpGwWnkxxYn5ezvpwhygwN7nAytfE7CPmcqJN
 cXOw==
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERBSSBsaW5rIHRvIHVzZSBoZG1pLWNvZGVjLgoKU2lnbmVkLW9mZi1ieTogVHp1bmctQmkg
U2hpaCA8dHp1bmdiaUBnb29nbGUuY29tPgotLS0KIC4uLi9tdDgxODMvbXQ4MTgzLW10NjM1OC10
czNhMjI3LW1heDk4MzU3LmMgICAgICB8IDE2ICsrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9tZWRpYXRlay9tdDgxODMvbXQ4MTgzLW10NjM1OC10czNhMjI3LW1heDk4MzU3LmMgYi9z
b3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTgzL210ODE4My1tdDYzNTgtdHMzYTIyNy1tYXg5ODM1Ny5j
CmluZGV4IDA1NTVmN2Q3M2QwNS4uMjU4ZjE0MTZmYWUxIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mv
bWVkaWF0ZWsvbXQ4MTgzL210ODE4My1tdDYzNTgtdHMzYTIyNy1tYXg5ODM1Ny5jCisrKyBiL3Nv
dW5kL3NvYy9tZWRpYXRlay9tdDgxODMvbXQ4MTgzLW10NjM1OC10czNhMjI3LW1heDk4MzU3LmMK
QEAgLTE5MSw3ICsxOTEsNyBAQCBTTkRfU09DX0RBSUxJTktfREVGUyhpMnM1LAogCiBTTkRfU09D
X0RBSUxJTktfREVGUyh0ZG0sCiAJREFJTElOS19DT01QX0FSUkFZKENPTVBfQ1BVKCJURE0iKSks
Ci0JREFJTElOS19DT01QX0FSUkFZKENPTVBfRFVNTVkoKSksCisJREFJTElOS19DT01QX0FSUkFZ
KENPTVBfQ09ERUMoTlVMTCwgImkycy1oaWZpIikpLAogCURBSUxJTktfQ09NUF9BUlJBWShDT01Q
X0VNUFRZKCkpKTsKIAogc3RhdGljIGludCBtdDgxODNfbXQ2MzU4X3RkbV9zdGFydHVwKHN0cnVj
dCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtKQpAQCAtNDc5LDcgKzQ3OSw3IEBAIHN0YXRp
YyBpbnQKIG10ODE4M19tdDYzNThfdHMzYTIyN19tYXg5ODM1N19kZXZfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkID0gJm10
ODE4M19tdDYzNThfdHMzYTIyN19tYXg5ODM1N19jYXJkOwotCXN0cnVjdCBkZXZpY2Vfbm9kZSAq
cGxhdGZvcm1fbm9kZSwgKmVjX2NvZGVjOworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGxhdGZvcm1f
bm9kZSwgKmVjX2NvZGVjLCAqaGRtaV9jb2RlYzsKIAlzdHJ1Y3Qgc25kX3NvY19kYWlfbGluayAq
ZGFpX2xpbms7CiAJc3RydWN0IG10ODE4M19tdDYzNThfdHMzYTIyN19tYXg5ODM1N19wcml2ICpw
cml2OwogCWludCByZXQ7CkBAIC00OTYsOSArNDk2LDEyIEBAIG10ODE4M19tdDYzNThfdHMzYTIy
N19tYXg5ODM1N19kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWVj
X2NvZGVjID0gb2ZfcGFyc2VfcGhhbmRsZShwZGV2LT5kZXYub2Zfbm9kZSwgIm1lZGlhdGVrLGVj
LWNvZGVjIiwgMCk7CiAKKwloZG1pX2NvZGVjID0gb2ZfcGFyc2VfcGhhbmRsZShwZGV2LT5kZXYu
b2Zfbm9kZSwKKwkJCQkgICAgICAibWVkaWF0ZWssaGRtaS1jb2RlYyIsIDApOworCiAJZm9yX2Vh
Y2hfY2FyZF9wcmVsaW5rcyhjYXJkLCBpLCBkYWlfbGluaykgewotCQlpZiAoZGFpX2xpbmstPnBs
YXRmb3Jtcy0+bmFtZSkKLQkJCWNvbnRpbnVlOworCQlpZiAoIWRhaV9saW5rLT5wbGF0Zm9ybXMt
Pm5hbWUpCisJCQlkYWlfbGluay0+cGxhdGZvcm1zLT5vZl9ub2RlID0gcGxhdGZvcm1fbm9kZTsK
IAogCQlpZiAoZWNfY29kZWMgJiYgc3RyY21wKGRhaV9saW5rLT5uYW1lLCAiV2FrZSBvbiBWb2lj
ZSIpID09IDApIHsKIAkJCWRhaV9saW5rLT5jcHVzWzBdLm5hbWUgPSBOVUxMOwpAQCAtNTA5LDkg
KzUxMiwxMCBAQCBtdDgxODNfbXQ2MzU4X3RzM2EyMjdfbWF4OTgzNTdfZGV2X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQlkYWlfbGluay0+Y29kZWNzWzBdLmRhaV9uYW1l
ID0gIldha2Ugb24gVm9pY2UiOwogCQkJZGFpX2xpbmstPnBsYXRmb3Jtc1swXS5vZl9ub2RlID0g
ZWNfY29kZWM7CiAJCQlkYWlfbGluay0+aWdub3JlID0gMDsKLQkJfSBlbHNlIHsKLQkJCWRhaV9s
aW5rLT5wbGF0Zm9ybXMtPm9mX25vZGUgPSBwbGF0Zm9ybV9ub2RlOwogCQl9CisKKwkJaWYgKGhk
bWlfY29kZWMgJiYgc3RyY21wKGRhaV9saW5rLT5uYW1lLCAiVERNIikgPT0gMCkKKwkJCWRhaV9s
aW5rLT5jb2RlY3MtPm9mX25vZGUgPSBoZG1pX2NvZGVjOwogCX0KIAogCW10ODE4M19tdDYzNThf
dHMzYTIyN19tYXg5ODM1N19oZWFkc2V0X2Rldi5kbGMub2Zfbm9kZSA9Ci0tIAoyLjIzLjAuODY2
LmdiODY5Yjk4ZDRjLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
