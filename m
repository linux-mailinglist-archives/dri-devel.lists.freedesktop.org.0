Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73D5F399
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03D66E29A;
	Thu,  4 Jul 2019 07:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFAD6E241
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 02:36:04 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id p10so2163443pgn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 19:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=calKg31YDJ74yDzQJN7XSSUBsHnK7/+Pchjehhl+BSk=;
 b=R2nLbqlOmryIN7E+YorjJdohr/YNMF4Jc6epmRSPx++JzUeMk9qsV1GmIK/P1sSD+f
 xcvuVHlGRrFoUVyRnNVvj/AUKG/4ooNUTdM6MzBEj6MOg5g9GaUlQyvyWy2qHE1thKe/
 IxY5Ttmo7aj5w9CkaBOOd72eMQiX2NjH8mAYkxSTYfv6vre+X/7Km8JJb526W9qjoB7H
 dxP0v+xYSf8VLs6wIz6RZAhFI5p3oZwgtqC19Qhjb69LNigGF4on4Bzgj+6hO60t57DJ
 /4kIA9OWVcq1Ir+2oBHVrqzhlCQ+Xv3edLHmOONTMNdQQe0vnakpMMAXTEYjDlLoufbZ
 HgXg==
X-Gm-Message-State: APjAAAXiis19SmG1tcn6pw4kjr0NiFOjybzEs42XCJM4uTfPb4t8bQos
 44/g+w2sJjkplgIR7SplF3xXAEfsitY=
X-Google-Smtp-Source: APXvYqysTT1dJ+qo2p+TuEhYNUmmNz27UgpVXslH1JJ0TzquvDJbtGeKR1AwuVM/ccNZGP4PjGgeuA==
X-Received: by 2002:a17:90a:9a83:: with SMTP id
 e3mr16236570pjp.105.1562207764004; 
 Wed, 03 Jul 2019 19:36:04 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id e10sm3921153pfi.173.2019.07.03.19.36.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 19:36:03 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [Patch v2 03/10] drm/omapdrm: using dev_get_drvdata directly
Date: Thu,  4 Jul 2019 10:35:57 +0800
Message-Id: <20190704023557.4551-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=calKg31YDJ74yDzQJN7XSSUBsHnK7/+Pchjehhl+BSk=;
 b=iQs2b90eTP+P2KlFVEZCLVMHWJNammzNFcmzkyKAhLlut/Ybw8o8K0xGKutmmk6NK9
 stKiMAYKREnsQ8jRQEsfNUpzFokHBOXHXckaEiZwyHVuu5OEGIR74xy8dZ22lPy2+oTO
 pqiR9Mt9yZbPg5INQQxUGYJrGxnD9oHO083RdgSoN36ZzQuIE09TTvIROkhWwOZEk3Tn
 aePttRcpNdP/IxDSZFticngv4IEZ0Csdlj9BJEHg4wVF7mO80l/H9U6rhwV4cl4W4+mA
 qyVP8deBLAhdCKvsgMMiddfHfssxZZ51wc+liQp2HOJvB6KTVEBT8NijJ/caa6NS8riB
 Sr2g==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Fuqian Huang <huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V2ZXJhbCBkcml2ZXJzIGNhc3QgYSBzdHJ1Y3QgZGV2aWNlIHBvaW50ZXIgdG8gYSBzdHJ1Y3QK
cGxhdGZvcm1fZGV2aWNlIHBvaW50ZXIgb25seSB0byB0aGVuIGNhbGwgcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEoKS4KVG8gaW1wcm92ZSByZWFkYWJpbGl0eSwgdGhlc2UgY29uc3RydWN0cyBjYW4gYmUg
c2ltcGxpZmllZApieSB1c2luZyBkZXZfZ2V0X2RydmRhdGEoKSBkaXJlY3RseS4KClNpZ25lZC1v
ZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgotLS0KQ2hhbmdl
cyBpbiB2MjoKICAtIE1ha2UgdGhlIGNvbW1pdCBtZXNzYWdlIG1vcmUgY2xlYXJseS4KCiBkcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyB8IDE1ICsrKysrLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNp
LWNtLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYwpp
bmRleCA4ZWRlZjhlZjIzYjAuLjUzMjQwZGExMzliMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMKQEAgLTQwNyw4ICs0MDcsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9vcHMgZHNpY21fYmxfb3BzID0gewogc3RhdGljIHNz
aXplX3QgZHNpY21fbnVtX2Vycm9yc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJc3RydWN0
IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKIHsKLQlzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7Ci0Jc3RydWN0IHBhbmVsX2Ry
dl9kYXRhICpkZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBwYW5l
bF9kcnZfZGF0YSAqZGRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlzdHJ1Y3Qgb21hcF9k
c3NfZGV2aWNlICpzcmMgPSBkZGF0YS0+c3JjOwogCXU4IGVycm9ycyA9IDA7CiAJaW50IHI7CkBA
IC00MzksOCArNDM4LDcgQEAgc3RhdGljIHNzaXplX3QgZHNpY21fbnVtX2Vycm9yc19zaG93KHN0
cnVjdCBkZXZpY2UgKmRldiwKIHN0YXRpYyBzc2l6ZV90IGRzaWNtX2h3X3JldmlzaW9uX3Nob3co
c3RydWN0IGRldmljZSAqZGV2LAogCQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hh
ciAqYnVmKQogewotCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9k
ZXZpY2UoZGV2KTsKLQlzdHJ1Y3QgcGFuZWxfZHJ2X2RhdGEgKmRkYXRhID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7CisJc3RydWN0IHBhbmVsX2Rydl9kYXRhICpkZGF0YSA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKnNyYyA9IGRkYXRhLT5zcmM7
CiAJdTggaWQxLCBpZDIsIGlkMzsKIAlpbnQgcjsKQEAgLTUwNiw4ICs1MDQsNyBAQCBzdGF0aWMg
c3NpemVfdCBkc2ljbV9zaG93X3VscHMoc3RydWN0IGRldmljZSAqZGV2LAogCQlzdHJ1Y3QgZGV2
aWNlX2F0dHJpYnV0ZSAqYXR0ciwKIAkJY2hhciAqYnVmKQogewotCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKLQlzdHJ1Y3QgcGFuZWxfZHJ2
X2RhdGEgKmRkYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IHBhbmVs
X2Rydl9kYXRhICpkZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXVuc2lnbmVkIGludCB0
OwogCiAJbXV0ZXhfbG9jaygmZGRhdGEtPmxvY2spOwpAQCAtNTIxLDggKzUxOCw3IEBAIHN0YXRp
YyBzc2l6ZV90IGRzaWNtX3N0b3JlX3VscHNfdGltZW91dChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJ
CXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAogCQljb25zdCBjaGFyICpidWYsIHNpemVf
dCBjb3VudCkKIHsKLQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1f
ZGV2aWNlKGRldik7Ci0Jc3RydWN0IHBhbmVsX2Rydl9kYXRhICpkZGF0YSA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBwYW5lbF9kcnZfZGF0YSAqZGRhdGEgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKIAlzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpzcmMgPSBkZGF0YS0+c3Jj
OwogCXVuc2lnbmVkIGxvbmcgdDsKIAlpbnQgcjsKQEAgLTU1Myw4ICs1NDksNyBAQCBzdGF0aWMg
c3NpemVfdCBkc2ljbV9zaG93X3VscHNfdGltZW91dChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCXN0
cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAogCQljaGFyICpidWYpCiB7Ci0Jc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwotCXN0cnVjdCBw
YW5lbF9kcnZfZGF0YSAqZGRhdGEgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKKwlzdHJ1
Y3QgcGFuZWxfZHJ2X2RhdGEgKmRkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJdW5zaWdu
ZWQgaW50IHQ7CiAKIAltdXRleF9sb2NrKCZkZGF0YS0+bG9jayk7Ci0tIAoyLjExLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
