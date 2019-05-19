Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6301226EE
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2698C89230;
	Sun, 19 May 2019 14:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0E88922E;
 Sun, 19 May 2019 14:01:02 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c17so8445144lfi.2;
 Sun, 19 May 2019 07:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zbWIRUfdicegOIO5BjuL5JhXb2OpAX0jb+b5zumUyDM=;
 b=lixaWpAx5W21NuLZ4wcHwT3z5H3G281OQNBkN0vSKQQb2Ron9s1awVCXbwm++fQfhO
 Weyo0UGNxifPf6iY9upzj9Y9hC6ZUpMq5/3Tf68K6aqevkiZkDZB3y0vY3b7ZmIoKdlj
 jcAk5tzrj+qdnrhyIfs7SH9wR7gFH3IXT6WIPUfd6E0qRTZpeqa86eVNiZsHpDF4ms+H
 Mtqd4S9YjUcgf+5joVrWpgw5q0rqbkjBzs/vBoZnec2txwa/t15hgK90YyX7WlXgMKh7
 yKk+WG8b6HLen/5syoTa1lY4YNFtAQaL0/4iC57kXbVirfcvFjWoTvla3w47ERqd6KFV
 AGcQ==
X-Gm-Message-State: APjAAAWCai3AWa7tNPOjISZ+Pwd6I+Cp2QlgeQ+hXLq+xGVokMwK9AJH
 lXVNHaUyQ+ggs+jKt+p+LfM=
X-Google-Smtp-Source: APXvYqxBe7VMQHPts3keLBIa297LvKo7QqoJbyMIXcU3DtuvRadhkM+sfPTeekt9ffZLrxg2VwWirQ==
X-Received: by 2002:a19:a50b:: with SMTP id o11mr20137074lfe.2.1558274460030; 
 Sun, 19 May 2019 07:01:00 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k18sm3153572ljk.70.2019.05.19.07.00.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:00:59 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Ben Skeggs <bskeggs@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/4] drm/nouveau: drop drmP.h from nouveau_drv.h
Date: Sun, 19 May 2019 16:00:42 +0200
Message-Id: <20190519140044.22142-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519140044.22142-1-sam@ravnborg.org>
References: <20190519140044.22142-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zbWIRUfdicegOIO5BjuL5JhXb2OpAX0jb+b5zumUyDM=;
 b=I8tMhjoH6lzEeHk08EQO7How31Xys4Fq7WpRZibl9qXEUxx1eji1pVqR1U45Ri3u9p
 BdTVvaXnFJ6XDZI+2y0Jxqjm2ygAUzRv+RMsIO3oTo7fmCCCYlJZAsB/De8Sj46Jx2NS
 ISFSRXwqkyoEULbkQ34PFGDwFoyEm2WrDVmudn/Xu3kmU7zx6+GU7cn83CcbJiCGB92/
 AWAVinv2aye03DxKzB08EstT4q2YmIpfOwrPsAgmpM6c73gK0VScOj7UU5yg3HY+NS8O
 uSuZ/KAXduR72TzJMvlG6lTcQykFzMImwad0g+oxr7jFUCgqCUJkz5y6Zk4IlKidNVDI
 zVyQ==
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

RHJvcCB0aGUgZGVwcmVjYXRlZCBkcm1QLmggaGVhZGVyIGZyb20gbm91dmVhdV9kcnYuaC4KRml4
IGZhbGxvdXQgaW4gb3RoZXIgcGFydHMgb2YgdGhlIGRyaXZlci4KCkJ1aWxkIHRlc3RlZCB1c2lu
ZyBhbGxtb2Rjb25maWcgYW5kIGFsbHllc2NvbmZpZy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvYmFzZTUwN2MuYyB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL292bHk1MDdlLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL3duZHcuYyAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2Rpc3BsYXkuaCAgIHwgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Ry
di5oICAgICAgIHwgNSArKysrLQogNSBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvYmFzZTUwN2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Jhc2U1MDdj
LmMKaW5kZXggZDVlMjk1Y2EyY2FhLi44MGUwMjA2MTFiY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Jhc2U1MDdjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvYmFzZTUwN2MuYwpAQCAtMjUsNyArMjUsOSBAQAogI2luY2x1ZGUg
PG52aWYvZXZlbnQuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wbGFuZV9oZWxwZXIu
aD4KKwogI2luY2x1ZGUgIm5vdXZlYXVfYm8uaCIKIAogdm9pZApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTUwN2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL292bHk1MDdlLmMKaW5kZXggY2M0MTc2NjRmODIzLi43MzU0YWFmNzkx
NTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk1MDdl
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTUwN2UuYwpAQCAt
MjMsNiArMjMsNyBAQAogI2luY2x1ZGUgImF0b20uaCIKIAogI2luY2x1ZGUgPGRybS9kcm1fYXRv
bWljX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9wbGFuZV9oZWxwZXIuaD4KIAogI2luY2x1ZGUgPG52aWYvY2w1MDdlLmg+CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93bmR3LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC93bmR3LmMKaW5kZXggYjk1MTgxMDI3YjMxLi5hNTAxYmI2
MjAzNGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93bmR3LmMKQEAgLTI2LDYg
KzI2LDggQEAKICNpbmNsdWRlIDxudmlmL2NsMDAwMi5oPgogCiAjaW5jbHVkZSA8ZHJtL2RybV9h
dG9taWNfaGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4KKwogI2luY2x1ZGUg
Im5vdXZlYXVfYm8uaCIKIAogc3RhdGljIHZvaWQKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kaXNwbGF5LmgKaW5kZXggMzExZTE3NWYwNTEzLi4zMWViODVmMjIzYjIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5oCkBAIC0xLDkgKzEsMTMgQEAKIC8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCiAjaWZuZGVmIF9fTk9VVkVBVV9E
SVNQTEFZX0hfXwogI2RlZmluZSBfX05PVVZFQVVfRElTUExBWV9IX18KKwogI2luY2x1ZGUgIm5v
dXZlYXVfZHJ2LmgiCisKICNpbmNsdWRlIDxudmlmL2Rpc3AuaD4KIAorI2luY2x1ZGUgPGRybS9k
cm1fZnJhbWVidWZmZXIuaD4KKwogc3RydWN0IG5vdXZlYXVfZnJhbWVidWZmZXIgewogCXN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgYmFzZTsKIAlzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibzsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmggYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oCmluZGV4IDM1ZmYwY2EwMWEzYi4uODFmODIzZGYx
OTg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgKQEAgLTQ2LDcgKzQ2LDEw
IEBACiAjaW5jbHVkZSA8bnZpZi9tbXUuaD4KICNpbmNsdWRlIDxudmlmL3ZtbS5oPgogCi0jaW5j
bHVkZSA8ZHJtL2RybVAuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPgorI2luY2x1
ZGUgPGRybS9kcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KKyNpbmNsdWRl
IDxkcm0vZHJtX2ZpbGUuaD4KIAogI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2FwaS5oPgogI2lu
Y2x1ZGUgPGRybS90dG0vdHRtX2JvX2RyaXZlci5oPgotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
