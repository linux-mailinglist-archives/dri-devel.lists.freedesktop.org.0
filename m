Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F905F3AC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291096E2BC;
	Thu,  4 Jul 2019 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66656E248
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 02:36:12 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id j2so2185216pfe.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 19:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=M8gkH2EuGEhpnR2pTwKfU95prWM3XzY3XXen65sRHVg=;
 b=g5QHni92JujCuo9mcJcjJnnSzerQ67BV6cQzlNVgu/q2Em/8NJ31NM28va/MfXFekf
 pQQZKV+l+9FBp+d1/BX2XaSl2xC7KDrUwpDzx//U+UXlGGujJtM2GJtjUX8m6vnjOtyV
 kQvKr1z7WDAOW7xdC+Z7HOmKfhzYqNTStxL94o8HlPNqwlgz3hbI1xCqpFwhwdYydzxv
 IFehSNR7VxGh/TEaN1gS79Gkuz16Nz8rLMC74AIn/dvlVPq7ZsCAhLEInBRhRLoIYKW6
 4eqnzqgG/T8uVhn1Eqig0W7wfnnv4zFdzUosmEnTtQnAWTXrAyQ0Nh2rVQh1cXu6FsB3
 uX9g==
X-Gm-Message-State: APjAAAVIWgJ4keMUR7Hn5x1o0WK6LEwooYBe4SflozfM8GgcLrqkGT2G
 CvaQaK1utXOhJN33M172rsc=
X-Google-Smtp-Source: APXvYqyxwE96epy4/x19vlPe8oqA/kJ2mWSaBEXoQouHkUsGqF1WmvzBIURboBYiWkqDMvcD02U5Cg==
X-Received: by 2002:a17:90a:bf08:: with SMTP id
 c8mr16472122pjs.75.1562207772377; 
 Wed, 03 Jul 2019 19:36:12 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id k70sm7858346pje.14.2019.07.03.19.36.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 19:36:12 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [Patch v2 04/10] drm/panfrost: using dev_get_drvdata directly
Date: Thu,  4 Jul 2019 10:36:05 +0800
Message-Id: <20190704023605.4597-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=M8gkH2EuGEhpnR2pTwKfU95prWM3XzY3XXen65sRHVg=;
 b=ATQ3ihl05TYcxtg43qA/s8JbGDT/wgAy7Vl3nMui1WpNeUypKZ5Q4vATOEVms+yAz6
 dhkYBbOUGQ/9h/3iHkDXixRnBqKcQV/deA30JWCK9yTPjFHatnwvq+TFFgHAiApSS5fA
 SqD9VQKfMP2HxhpI7gk9OOt2B9Tiv5QC8NPsZ1q1yv/UWfVYffGdT6HldhOV8kMnYJHm
 rLUR/uhzuOTi5X7Mt2Bj+p0xn6NxJj1RQ+UYv1a7LGge1G/J6NsWitN1mXoPeHlAQkN1
 GUeTPYRaOs590b1UG3RyQHvuaiIJq4ZLJdmUtqZIUJshx2xvotmQqsYqa8zr3o96YtZc
 yMuw==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgNiArKystLS0KIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyAgfCA2ICsrLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKaW5kZXggZGI3OTg1MzJiMGI2Li5iZWY1
ZGY0ZDk5YWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZmcmVxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEu
YwpAQCAtMTgsNyArMTgsNyBAQCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3VwZGF0ZV91
dGlsaXphdGlvbihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgaQogc3RhdGljIGludCBw
YW5mcm9zdF9kZXZmcmVxX3RhcmdldChzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcg
KmZyZXEsCiAJCQkJICAgdTMyIGZsYWdzKQogewotCXN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEodG9fcGxhdGZvcm1fZGV2aWNlKGRldikpOworCXN0
cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJc3Ry
dWN0IGRldl9wbV9vcHAgKm9wcDsKIAl1bnNpZ25lZCBsb25nIG9sZF9jbGtfcmF0ZSA9IHBmZGV2
LT5kZXZmcmVxLmN1cl9mcmVxOwogCXVuc2lnbmVkIGxvbmcgdGFyZ2V0X3ZvbHQsIHRhcmdldF9y
YXRlOwpAQCAtODYsNyArODYsNyBAQCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc2V0
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogc3RhdGljIGludCBwYW5mcm9zdF9kZXZm
cmVxX2dldF9kZXZfc3RhdHVzKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkJICAgc3RydWN0IGRl
dmZyZXFfZGV2X3N0YXR1cyAqc3RhdHVzKQogewotCXN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEodG9fcGxhdGZvcm1fZGV2aWNlKGRldikpOworCXN0
cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJaW50
IGk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgTlVNX0pPQl9TTE9UUzsgaSsrKSB7CkBAIC0xMTcsNyAr
MTE3LDcgQEAgc3RhdGljIGludCBwYW5mcm9zdF9kZXZmcmVxX2dldF9kZXZfc3RhdHVzKHN0cnVj
dCBkZXZpY2UgKmRldiwKIAogc3RhdGljIGludCBwYW5mcm9zdF9kZXZmcmVxX2dldF9jdXJfZnJl
cShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgKmZyZXEpCiB7Ci0Jc3RydWN0IHBh
bmZyb3N0X2RldmljZSAqcGZkZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YSh0b19wbGF0Zm9ybV9k
ZXZpY2UoZGV2KSk7CisJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKIAogCSpmcmVxID0gcGZkZXYtPmRldmZyZXEuY3VyX2ZyZXE7CiAKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCAzYjJiY2VkMWIwMTUu
LmVkMTg3NjQ4ZTZkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYwpAQCAtMjI3LDggKzIyNyw3IEBAIGNvbnN0IGNoYXIgKnBhbmZyb3N0X2V4Y2VwdGlvbl9u
YW1lKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCB1MzIgZXhjZXB0aW9uCiAjaWZkZWYg
Q09ORklHX1BNCiBpbnQgcGFuZnJvc3RfZGV2aWNlX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiB7Ci0Jc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShk
ZXYpOwotCXN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7CisJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsKIAogCXBhbmZyb3N0X2dwdV9zb2Z0X3Jlc2V0KHBmZGV2KTsKIApAQCAtMjQzLDgg
KzI0Miw3IEBAIGludCBwYW5mcm9zdF9kZXZpY2VfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikK
IAogaW50IHBhbmZyb3N0X2RldmljZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKLQlz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7Ci0J
c3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKKwlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
OwogCiAJaWYgKCFwYW5mcm9zdF9qb2JfaXNfaWRsZShwZmRldikpCiAJCXJldHVybiAtRUJVU1k7
Ci0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
