Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07B6A059
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428476E06B;
	Tue, 16 Jul 2019 01:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A991F89686
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:43:12 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so11597454qkl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 06:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=acQPukXBvJBOs+Csp0bFQoolQgtDonf3OOjuV7K26cg=;
 b=LZrtAQChvHLt3imU0jVFUyB1KuTOkCVj4vIGBjrhMnliTNEEz4lEBFZFYhTHPXy1FU
 S+KXsKfH9HFd5wvf+2juNKGNYa0GYpEE7D/er37SqIdpzgalXnGAXFZsEnLH6/88y+RA
 3U09gxWWCG6WZBSvK+devVw5oX42IGse5SEA/EOaGbc5xDLEn+xHmKPCSmS7I1v+oNC0
 DcJ1KqxNStCmIezd3JJEvSMC9wacpFMP9Qu0WoHTFEa1nVZvdoymZr+F/0ldRbqI5Lbj
 oSmpqwA9Gb00wwRCaKGWsJWE/eLlubGTJPpOON7vVhL3jKv3aOGdulfqHJc+0w+NaBzm
 2T5g==
X-Gm-Message-State: APjAAAWrcreqOMp43tQcS8k7lBKNCKVH1E9RycP4BzRUY3JRDUJiPCSF
 xSb222Lcu4HQIonpy22AOswMzQ==
X-Google-Smtp-Source: APXvYqzvUmAodjBwJQuKPzE2kilUHmZpzOUfF0Z9D+86p7J2KP5R2wAj5e1shFThrzBlDC1/gmrr2g==
X-Received: by 2002:a37:a010:: with SMTP id j16mr17159282qke.152.1563198191721; 
 Mon, 15 Jul 2019 06:43:11 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id s11sm7571874qkm.51.2019.07.15.06.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 06:43:10 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: emil.l.velikov@gmail.com
Subject: [PATCH] gpu/drm: fix a few kernel-doc "/**" mark warnings
Date: Mon, 15 Jul 2019 09:42:53 -0400
Message-Id: <1563198173-7317-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=acQPukXBvJBOs+Csp0bFQoolQgtDonf3OOjuV7K26cg=;
 b=QeLmVu2Ec51StMehpBdqKOJcnc6809a0Te+oZDlReyMcQ2425Mn0AOFLE+qo8qe0SH
 pIxNBk0iiouIk9w9HzQDSQZ/hBwn0DaoOA8Og8Ud4c+f7Z52fFP86cGKWR6pUwnF2pWN
 iw09VXz+M4RzW9vAWjUOcR5OMTl8OiQo/ODo2zkGBDDqC0ZQQRQ2Y7HF/+xixGVnyOK9
 qIbyU4jBa+UHKQh0Fze50N9G5ovvFRGlfuUT6AbLFPJTy9XAD/NLGdX5GuALxypgs/Ug
 Nvqbef8NON8FPuaVLwfFj6rRfEL+wwo1gAiuO+2JEs1EE3+nTAO0h0KqQT/ie5lGJ6YP
 /Qmw==
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
Cc: maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, Qian Cai <cai@lca.pw>,
 sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9wZW5pbmcgY29tbWVudCBtYXJrICIvKioiIGlzIHJlc2VydmVkIGZvciBrZXJuZWwtZG9j
IGNvbW1lbnRzLCBzbwppdCB3aWxsIGdlbmVyYXRlIHdhcm5pbmdzIGZvciBjb21tZW50cyB0aGF0
IGFyZSBub3Qga2VybmVsLWRvYyB3aXRoCiJtYWtlIFc9MSIuIEZvciBleGFtcGxlLAoKZHJpdmVy
cy9ncHUvZHJtL2RybV9tZW1vcnkuYzoyOiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKiBc
ZmlsZQpkcm1fbWVtb3J5LmMKClNpZ25lZC1vZmYtYnk6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3Pgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jICB8IDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZG1hLmMgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5
X21pc2MuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbG9jay5jICAgICAgICB8IDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fc2NhdHRlci5jICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdm0uYyAgICAg
ICAgICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9hZ3BzdXBwb3J0LmMKaW5kZXggNDBmYmExYzA0ZGZjLi5lZjU0OWM5
NWIwYjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jCkBAIC0xLDQgKzEsNCBAQAotLyoqCisv
KgogICogXGZpbGUgZHJtX2FncHN1cHBvcnQuYwogICogRFJNIHN1cHBvcnQgZm9yIEFHUC9HQVJU
IGJhY2tlbmQKICAqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RtYS5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kbWEuYwppbmRleCAzZjgzZTJjYTgwYWQuLmNiZmFhMmVhYWIwMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RtYS5jCkBAIC0xLDQgKzEsNCBAQAotLyoqCisvKgogICogXGZpbGUgZHJtX2RtYS5j
CiAgKiBETUEgSU9DVEwgYW5kIGZ1bmN0aW9uIHN1cHBvcnQKICAqCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeV9taXNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2Fj
eV9taXNjLmMKaW5kZXggMmZlNzg2ODM5Y2E4Li43NDVlYjk5Mzk0MTQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5X21pc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2xlZ2FjeV9taXNjLmMKQEAgLTEsNCArMSw0IEBACi0vKioKKy8qCiAgKiBcZmlsZSBkcm1fbGVn
YWN5X21pc2MuYwogICogTWlzYyBsZWdhY3kgc3VwcG9ydCBmdW5jdGlvbnMuCiAgKgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9sb2NrLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xv
Y2suYwppbmRleCBiNzAwNThlNzdhMjguLjI2MTBiZmYzZDUzOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9sb2NrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9sb2NrLmMKQEAg
LTEsNCArMSw0IEBACi0vKioKKy8qCiAgKiBcZmlsZSBkcm1fbG9jay5jCiAgKiBJT0NUTHMgZm9y
IGxvY2tpbmcKICAqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYwppbmRleCAxMzJmZWY4ZmYxYjYuLmQ5MmYyNGMz
MDhhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCkBAIC0xLDQgKzEsNCBAQAotLyoqCisvKgogICogXGZp
bGUgZHJtX21lbW9yeS5jCiAgKiBNZW1vcnkgbWFuYWdlbWVudCB3cmFwcGVycyBmb3IgRFJNCiAg
KgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zY2F0dGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3NjYXR0ZXIuYwppbmRleCBiYjgyOWExMTVmYzYuLmI2ZDg2MzY5OWQwZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zY2F0dGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9zY2F0dGVyLmMKQEAgLTEsNCArMSw0IEBACi0vKioKKy8qCiAgKiBcZmlsZSBkcm1f
c2NhdHRlci5jCiAgKiBJT0NUTHMgdG8gbWFuYWdlIHNjYXR0ZXIvZ2F0aGVyIG1lbW9yeQogICoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdm0uYwppbmRleCAxMGNmODNkNTY5ZTEuLjZjNzRjNjhmMTkyYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdm0uYwpAQCAt
MSw0ICsxLDQgQEAKLS8qKgorLyoKICAqIFxmaWxlIGRybV92bS5jCiAgKiBNZW1vcnkgbWFwcGlu
ZyBmb3IgRFJNCiAgKgotLSAKMS44LjMuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
