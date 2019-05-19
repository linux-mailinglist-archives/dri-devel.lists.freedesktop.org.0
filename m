Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC51226F2
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF758922E;
	Sun, 19 May 2019 14:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E798922E;
 Sun, 19 May 2019 14:01:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so10146117ljw.0;
 Sun, 19 May 2019 07:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YwQq6tpsIJUjZjHqd4i7+DX7pgU4440gy5ysY3OWQks=;
 b=kDM5jBsf6ChJbMzw1CHrXUkum934HEZMrqvBtVVnRGEsOnV5OZPq/4mrFrIdy0BkQV
 JEPWLTSL/3hnGS9cCbc9XD82mt8OOqB1mOvUVfNExg/IGNGd7z6CufTerAZqLgGYatQJ
 9/ZWeW5A1ziLSOPoYhrC83X8ZDvPIs4zMGWTxZW1ricZaD0hSCZldrvLCfwFp5IQeT+R
 jEGNWOXxFPLNzG6z7cAUXSCVGer/7x/hF6llac2KQjDsUIpnMYUSjPN+agsNC6Rj0vUh
 A/oXwcdGThhNU7tW9fb382YhC4ESuCMgkl2te8aUny/+/Ve78qAOLtVh6kroi5QzSyuc
 8zsw==
X-Gm-Message-State: APjAAAWNgj9dEWhLmeVl88am0XZKzV9wtnH6bHxocj0jm2YXg8pOAiY5
 tK6yOT7oSfiCbqu6APrzPitHgHKf
X-Google-Smtp-Source: APXvYqyuAo7WrSTC3v3+lE51RhfVmnBLjyUJQofQlEbTXS9qItUObR2bZVV54sl1Vv+tWyvs4DSLkg==
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr4222640lji.189.1558274462980; 
 Sun, 19 May 2019 07:01:02 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k18sm3153572ljk.70.2019.05.19.07.01.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:01:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Ben Skeggs <bskeggs@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/4] drm/nouveau: drop drmP.h from all header files
Date: Sun, 19 May 2019 16:00:43 +0200
Message-Id: <20190519140044.22142-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519140044.22142-1-sam@ravnborg.org>
References: <20190519140044.22142-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwQq6tpsIJUjZjHqd4i7+DX7pgU4440gy5ysY3OWQks=;
 b=KUDS3As3P1hvqR4iV1eLk4D1IOaN47ZcJNxHIEN+m/Ds0IIpkaSFCOipKj688N8FK2
 n0nSvkfM5rcqrjmyW4y8OY25+vhnlarPsY/Ctanba45a7bmCUOm55t41AVgdKkGx6RW0
 lmidhdQGvQOdzJnzNNCxvoNOUOn2Mr+LL5JKTtQSIomhL6Yxdj2VN4lxCIkd2h3ReAqy
 Flf61aOlOMVlTtW9Rl3x12AC1/tu7OZPxhp5E9msT5hQ+goAjerFmw/K6F1bzUAtXRAL
 g3p3XzQXSh2PsEFqHL4InEnfgIS6IrL/9Lw9cORc+m2FqrErtk6nVWxahzbpxzgvvoaX
 bjCQ==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCBpbmNsdWRlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBmcm9tIGFsbCBub3V2ZWF1IGhl
ZGVyIGZpbGVzLgpUaGlzIGFsbG93cyB1cyB0byByZW1vdmUgZHJtUC5oIGZyb20gYWxsIC5jIGZp
bGVzIHdpdGhvdXQgYW55CnNpZGUtZWZmZWN0cyBpbiBhIGZvbGxvdy11cCBjb21taXQuCgpCdWls
ZCB0ZXN0ZWQgdXNpbmcgYWxseWV5Y29uZmlnIGFuZCBhbGxtb2Rjb25maWcKClNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEJlbiBTa2VnZ3MgPGJza2Vn
Z3NAcmVkaGF0LmNvbT4KQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvaHcuaCAgICAgfCAxIC0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfY3J0Yy5oICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmggfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2dlbS5oICAgICB8IDIgLS0KIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjA0L2h3LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9ody5oCmluZGV4
IDNhMmJlNDdmYjRmMS4uNjk4N2UxNzY2Y2QyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnYwNC9ody5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djA0L2h3LmgKQEAgLTIzLDcgKzIzLDYgQEAKICNpZm5kZWYgX19OT1VWRUFVX0hXX0hfXwogI2Rl
ZmluZSBfX05PVVZFQVVfSFdfSF9fCiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUg
ImRpc3AuaCIKICNpbmNsdWRlICJudnJlZy5oIgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2NydGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfY3J0Yy5oCmluZGV4IDM2NmFjYjkyOGY1Ny4uN2Y2M2JlMmVjMzVkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2NydGMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2NydGMuaApAQCAtMjcsNiArMjcsOCBAQAogI2lmbmRlZiBfX05P
VVZFQVVfQ1JUQ19IX18KICNkZWZpbmUgX19OT1VWRUFVX0NSVENfSF9fCiAKKyNpbmNsdWRlIDxk
cm0vZHJtX2NydGMuaD4KKwogI2luY2x1ZGUgPG52aWYvbm90aWZ5Lmg+CiAKIHN0cnVjdCBub3V2
ZWF1X2NydGMgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
ZWJ1Z2ZzLmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RlYnVnZnMuaAppbmRl
eCAxZDAxYTgyZDRiNmYuLjFmMmQ5N2I3MjExYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kZWJ1Z2ZzLmgKQEAgLTIsNyArMiw3IEBACiAjaWZuZGVmIF9fTk9VVkVBVV9ERUJV
R0ZTX0hfXwogI2RlZmluZSBfX05PVVZFQVVfREVCVUdGU19IX18KIAotI2luY2x1ZGUgPGRybS9k
cm1QLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kZWJ1Z2ZzLmg+CiAKICNpZiBkZWZpbmVkKENPTkZJ
R19ERUJVR19GUykKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9nZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmgKaW5kZXggZmUz
OTk5OGY2NWNjLi42MTUxNTZmZWZjYmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZ2VtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9n
ZW0uaApAQCAtMiw4ICsyLDYgQEAKICNpZm5kZWYgX19OT1VWRUFVX0dFTV9IX18KICNkZWZpbmUg
X19OT1VWRUFVX0dFTV9IX18KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0KICNpbmNsdWRlICJu
b3V2ZWF1X2Rydi5oIgogI2luY2x1ZGUgIm5vdXZlYXVfYm8uaCIKIAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
