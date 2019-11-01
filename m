Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7ECEBCCE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 05:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E076E172;
	Fri,  1 Nov 2019 04:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078AD6E172
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 04:27:17 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o3so11506916qtj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 21:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HpS7M3wugMxRqvwJlP7zk8Xh32CVSZbs51QsUAEIzfw=;
 b=c0qzjVjyrfbVM/ZKmT8qS+kctVWyR9JMtlZJzSh/tIsBClM7p9GduWC3ocssiYywHt
 tGhKL6Gy8qiHtWOu87ql/Lt5wPgmF44aUqK3+s8xgo6ZThloghbvAevIB73atckAR2zO
 6pRpVtPoJgm7oaNrzNW8HLmu1pWrQp++0joucrpOk7fmQtyn6UpTy1ZbC1P8FAFQqMPj
 Ye2EP6bLHsEUfRSCg+uvS7EdjfyGElFiZN+xR4WzAYwwodCPLiNpGxNnVN0Xt9bEmVF/
 pO/6ZYdDkVfNn1g33MVI+duU/uYOeLameowHeqxuHrm2MpP3L3uhBepg2HS0JluO3iK4
 +IeQ==
X-Gm-Message-State: APjAAAWDjVHKFkFxbNAkCvKGlNIrgI52xLlWhWeJzqKTGCWZNAi4Qu4e
 GqpHJmj52sSj2fjxh+nycho=
X-Google-Smtp-Source: APXvYqzDwJYaREOSe2o21TAZV4qBy7f/mE8kw3SqL1wNgJYXEuC0QZxtcJYWENR6LVI7cPRVcn6ENw==
X-Received: by 2002:aed:24af:: with SMTP id t44mr1230263qtc.135.1572582435878; 
 Thu, 31 Oct 2019 21:27:15 -0700 (PDT)
Received: from localhost.localdomain ([187.106.44.83])
 by smtp.gmail.com with ESMTPSA id w24sm3719838qta.44.2019.10.31.21.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 21:27:15 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 corbet@lwn.net, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Subject: [PATCH] drm/doc: Adding VKMS module description and use to "Testing
 and Validation"
Date: Fri,  1 Nov 2019 01:27:06 -0300
Message-Id: <20191101042706.2602-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HpS7M3wugMxRqvwJlP7zk8Xh32CVSZbs51QsUAEIzfw=;
 b=eYOl9Xry51JB4XOdcoO0HKnLb5V3OO+fyyZXo3Gyk4O17pxoDfoSvQUCR7XNoasLmn
 1JpmLWlUEimCevap83AXVIUpMM4tmRf7BrH/H9HZPBHebQwP4EUXbC7Mpu/iAUjg9bx4
 K/Gnk0D2Xoe4iTxrsIsps+Z1VX4K2XAEJQe1EY4qUmWUkm2MDrHWhRSkW90OsfNKH+at
 djFMIo9+Ypc0/PLBXNAydL8HRDa6ovC53rdB2Yv+9dgU30Jc9nGMQ7WSDhRJ/YdLkB8p
 3j//UCXEPr/yf2jxd3nXQKS5QarHMHlwIztXZJv9pIM9MK5iHpry0oPwBnaUJMvVUwNU
 kw+Q==
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgZGVzY3JpcHRpb24gb24gVktNUyBtb2R1bGUgYW5kIHRoZSBjYXNlcyBpbiB3aGljaCBp
dCBzaG91bGQgYmUgdXNlZC4KVGhlcmUncyBhIGJyaWVmIGV4cGxhbmF0aW9uIG9uIGhvdyB0byBz
ZXQgaXQgYW5kIHVzZSBpdCBpbiBhIFZNLCBhbG9uZyB3aXRoCmFuIGV4YW1wbGUgb2YgcnVubmlu
ZyBhbiBpZ3QtdGVzdC4KClNpZ25lZC1vZmYtYnk6IEdhYnJpZWxhIEJpdHRlbmNvdXJ0IDxnYWJy
aWVsYWJpdHRlbmNvdXJ0MDBAZ21haWwuY29tPgoKLS0tCgpIaSBEUk0tY29tbXVuaXR5LAp0aGlz
IGlzIG15IGZpcnN0IChvZiBtYW55LCBJIGhvcGUpICBwYXRjaCBpbiB0aGlzIHN1YnN5c3RlbS4g
SSBob3BlIHRvIGhhdmUKYSBsb3Qgb2YgbGVhcm5pbmcgKGFuZCBmdW4gOikpIHdvcmtpbmcgd2l0
aCB5b3UgZ3V5cy4KSSdtIHN0YXJ0aW5nIGJ5IGRvY3VtZW50aW5nIHRoZSBWS01TIGRyaXZlciBp
biAiVXNlcmxhbmQgaW50ZXJmYWNlcyIsIGlmIEkKaGF2ZSBiZWVuIGluYWNjdXJhdGUgaW4gbXkg
ZGVzY3JpcHRpb24gb3IgaWYgSSBtaXN1bmRlcnN0b29kIHNvbWUgY29uY2VwdCwKcGxlYXNlIGxl
dCBtZSBrbm93LgotLS0KIERvY3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdCB8IDM4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0IGIvRG9j
dW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0CmluZGV4IDk0ZjkwNTIxZjU4Yy4uN2Q2Yzg2Yjdh
Zjc2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0CkBAIC0yODUsNiArMjg1LDQ0IEBAIHJ1bi10ZXN0
cy5zaCBpcyBhIHdyYXBwZXIgYXJvdW5kIHBpZ2xpdCB0aGF0IHdpbGwgZXhlY3V0ZSB0aGUgdGVz
dHMgbWF0Y2hpbmcKIHRoZSAtdCBvcHRpb25zLiBBIHJlcG9ydCBpbiBIVE1MIGZvcm1hdCB3aWxs
IGJlIGF2YWlsYWJsZSBpbgogLi9yZXN1bHRzL2h0bWwvaW5kZXguaHRtbC4gUmVzdWx0cyBjYW4g
YmUgY29tcGFyZWQgd2l0aCBwaWdsaXQuCiAKK1VzaW5nIFZLTVMgdG8gdGVzdCBEUk0gQVBJCist
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitWS01TIGlzIGEgc29mdHdhcmUtb25seSBtb2Rl
bCBvZiBhIEtNUyBkcml2ZXIgdGhhdCBpcyB1c2VmdWwgZm9yIHRlc3RpbmcKK2FuZCBmb3IgcnVu
bmluZyBjb21wb3NpdG9ycy4gVktNUyBhaW1zIHRvIGVuYWJsZSBhIHZpcnR1YWwgZGlzcGxheSB3
aXRob3V0Cit0aGUgbmVlZCBmb3IgYSBoYXJkd2FyZSBkaXNwbGF5IGNhcGFiaWxpdHkuIFRoZXNl
IGNoYXJhY3RlcmlzdGljcyBtYWRlIFZLTVMKK2EgcGVyZmVjdCB0b29sIGZvciB2YWxpZGF0aW5n
IHRoZSBEUk0gY29yZSBiZWhhdmlvciBhbmQgYWxzbyBzdXBwb3J0IHRoZQorY29tcG9zaXRvciBk
ZXZlbG9wZXIuIFZLTVMgaGVscHMgdXMgdG8gdGVzdCBEUk0gY29yZSBmdW5jdGlvbiBpbiBhIHZp
cnR1YWwKK21hY2hpbmUsIHdoaWNoIG1ha2VzIGl0IGVhc3kgdG8gdGVzdCBzb21lIG9mIHRoZSBj
b3JlIGNoYW5nZXMuCisKK1RvIFZhbGlkYXRlIGNoYW5nZXMgaW4gRFJNIEFQSSB3aXRoIFZLTVMs
IHN0YXJ0IHNldHRpbmcgdGhlIGtlcm5lbC4gVGhlCitWS01TIG1vZHVsZSBpcyBub3QgZW5hYmxl
ZCBieSBkZWZhdXQsIHNvIGVuYWJsZSBpdCBpbiB0aGUgbWVudWNvbmZpZzo6CisKKwkkIG1ha2Ug
bWVudWNvbmZpZworCitDb21waWxlIHRoZSBrZXJuZWwgd2l0aCB0aGUgVktNUyBlbmFibGVkIGFu
ZCBpbnN0YWxsIGl0IGluIHRoZSB0YXJnZXQKK21hY2hpbmUuIFZLTVMgY2FuIGJlIHJ1biBpbiBh
IFZpcnR1YWwgTWFjaGluZSAoUUVNVSwgdmlydG1lIG9yIHNpbWlsYXIpLgorSXQncyByZWNvbW1l
bmRlZCB0aGUgdXNlIG9mIEtWTSB3aXRoIHRoZSBtaW5pbXVtIG9mIDFHQiBvZiBSQU0gYW5kIGZv
dXIKK2NvcmVzLgorCitJdCdzIHBvc3NpYmxlIHRvIHJ1biB0aGUgSUdULXRlc3RzIGluIGEgVk0g
aW4gdHdvIHdheXM6CisxLiBVc2UgSUdUIGluc2lkZSBhIFZNCisyLiBVc2UgSUdUIGZyb20gdGhl
IGhvc3QgbWFjaGluZSBhbmQgd3JpdGUgdGhlIHJlc3VsdHMgaW4gYSBzaGFyZWQgZGlyZWN0b3J5
LgorCitBcyBmb2xsb3csIHRoZXJlIGlzIGFuIGV4YW1wbGUgb2YgdXNpbmcgYSBWTSB3aXRoIGEg
c2hhcmVkIGRpcmVjdG9yeSB3aXRoCit0aGUgaG9zdCBtYWNoaW5lIHRvIHJ1biBpZ3QtdGVzdHMu
IEFzIGV4YW1wbGUgaXQncyB1c2VkIHZpcnRtZTo6CisKKwkkIHZpcnRtZS1ydW4gLS1yd2RpciAv
cGF0aC9mb3Ivc2hhcmVkX2RpciAtLWtkaXI9cGF0aC9mb3Iva2VybmVsL2RpcmVjdG9yeSAtLW1v
ZHM9YXV0bworCitSdW4gdGhlIGlndC10ZXN0cywgYXMgZXhhbXBsZSBpdCdzIHJhbiB0aGUgJ2tt
c19mbGlwJyB0ZXN0czo6CisKKwkkIC9wYXRoL2Zvci9pZ3QtZ3B1LXRvb2xzL3NjcmlwdHMvcnVu
LXRlc3RzLnNoIC1wIC1zIC10ICJrbXNfZmxpcC4qIiAtdgorCitJbiB0aGlzIGV4YW1wbGUgaW5z
dGVhZCBvZiBidWlsZCB0aGUgaWd0X3J1bm5lciBpdCdzIHVzZWQgUGlnbGl0CisoLXAgb3B0aW9u
KTsgaXQncyBjcmVhdGVkIGh0bWwgc3VtbWFyeSBvZiB0aGUgdGVzdHMgcmVzdWx0cyBhbmQgaXQn
cyBzYXZlZAoraW4gdGhlIGZvbGRlciAiaWd0LWdwdS10b29scy9yZXN1bHRzIjsgaXQncyBleGVj
dXRlZCBvbmx5IHRoZSBpZ3QtdGVzdHMKK21hdGNoaW5nIHRoZSAtdCBvcHRpb24uCisKIERpc3Bs
YXkgQ1JDIFN1cHBvcnQKIC0tLS0tLS0tLS0tLS0tLS0tLS0KIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
