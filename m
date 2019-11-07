Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F57F36D9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 19:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AF76F77E;
	Thu,  7 Nov 2019 18:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1613B6F77E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 18:17:18 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o49so3387264qta.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 10:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MC/3DvNi4KXiErQVhTtosWEoKUsYj6Co+yyEmPZ2HDY=;
 b=H03p9I7CjA5VoA/tDUB79Y7eOE2L+7DhNNZCCRnjcapBBoYeloVKLKnX6igcMS8JW/
 PZyzT5xmxFve/6OThhQmonGAVaPZwuNSzTqF43uapQmCVIRbpLEV4pFzsX3H7fwQHmno
 /wfxsefe8Q/go0LI8NrRao/FCSKmN2e26+T9eXZk5j9UzZeLVJj+Da+xhUu+Oe+0cswO
 vvTUawdjbWTky+SGbHVLIcIfornwgpJTDYRBhClKR3ojN6oio8y6WgODxquOCkTBwD/x
 OK7TnviIE7cZ3iC3j//oBXBaO6xhAbCAfXh+IaNU+JVxW2RIVu7cjs7xGXPEjBWDfPqe
 3Vyw==
X-Gm-Message-State: APjAAAUAIl0ZhqnQXT8AhZy6DXCA5XwK5HNxQFKKMS2qT1jlhZVIEFSq
 Ki19CX29ZAO6g/dnqzNvMt8=
X-Google-Smtp-Source: APXvYqw72Ys9YJsFtgifM1NHtIC+1zcLzs/+a3JNmsaVV1oTlm+P5/8vxzqGPKf3TtbUjQXUwCgrzw==
X-Received: by 2002:aed:212b:: with SMTP id 40mr5371850qtc.206.1573150636998; 
 Thu, 07 Nov 2019 10:17:16 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id y145sm1523318qkb.101.2019.11.07.10.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 10:17:16 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: stefan@agner.ch
Subject: [PATCH] drm/mxsfb: Remove brackets for single line if block
Date: Thu,  7 Nov 2019 15:17:08 -0300
Message-Id: <20191107181708.22033-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MC/3DvNi4KXiErQVhTtosWEoKUsYj6Co+yyEmPZ2HDY=;
 b=Q2P36do2baP+PJP/GWYRY3Fc9pOccxm4LifYGqC7YNJaTydDG19121+VCWsJ+yF6mA
 5EU8cm5ZJ1p+GIIpZE+k3gr+3f1EVjTZCO8eH26ZrgU+wv5pkzEkJM+bmXYXsllNl/ea
 qidVmKas/9IvZ1es28Jy6Yty38kHRG8YJ6Pw/S/A53W4CsywRD24qQFtZvQ2pPABpHqq
 rd6CRgFtzjnIjHJ/eGopx3ARN1qA+dzJcJDWs/gqxOOCiZS/PqjbIQ92eTPxbKXsIV2L
 VIBs8iRTMvRsdUxsPJYULmzrdz0mfIGf7LaU6ew7s5CjWFyNDzsK0gAo94JxfXxgCYbo
 lr5g==
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

VGhlcmUgaXMgbm8gbmVlZCBmb3IgYnJhY2tldHMgd2hlbiBmb3IgYSBzaW5nbGUgbGluZSBpbnNp
ZGUKdGhlICdpZicgYmxvY2ssIHNvIHJlbW92ZSB0aGUgdW5uZWVkZWQgYnJhY2tldHMuIAoKU2ln
bmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9teHNmYi9teHNmYl9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0
Yy5jCmluZGV4IGI2OWFjZThiZjUyNi4uYmFjZDFmMmIyZmIzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9jcnRjLmMKQEAgLTMyNiwxMSArMzI2LDEwIEBAIHZvaWQgbXhzZmJfcGxhbmVfYXRvbWlj
X3VwZGF0ZShzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2ZiLAogCWlmIChldmVudCkgewog
CQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwogCi0JCWlmIChkcm1fY3J0Y192YmxhbmtfZ2V0
KGNydGMpID09IDApIHsKKwkJaWYgKGRybV9jcnRjX3ZibGFua19nZXQoY3J0YykgPT0gMCkKIAkJ
CWRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQoY3J0YywgZXZlbnQpOwotCQl9IGVsc2UgeworCQll
bHNlCiAJCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBldmVudCk7Ci0JCX0KIAl9
CiAJc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
