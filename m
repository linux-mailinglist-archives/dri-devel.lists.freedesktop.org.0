Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DBEB0B5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBDB6EE61;
	Thu, 31 Oct 2019 13:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610456EE21;
 Thu, 31 Oct 2019 10:44:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s1so5701820wro.0;
 Thu, 31 Oct 2019 03:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e5McPQ27o3b2k3AkmZCezEVbDePR7P5Jqw8CpztVvKw=;
 b=l/E7dJhNNGKTD3DdJ1nqCZykN4QGXlxMQ3I+fNpVzAuztpA8E5Zpi8duVtQV53qaad
 XovouW0ZNzYMSL/uxjcE21/9zZVCKGTxFOvzgoLbKjLxQlzYL2Q2iYiwGukmqO1IyUS+
 G7K1WUhRMQEjiLUGpTAvf6vaGXJbsU8s+Pi0bftBLNgNeVP908BXdXwQzILcZw3tnaBL
 beCwuZ0Sz1NW2aS7RNef8svtXvaeO515LJhnVce8FIilIsBpSKK3eACR0nDcZqtSCvtj
 6fTMsveEMdm65lJSM+96g0G1NzyUqAGePmkRo2L9WD7DUXhNV321Sir2inBlm5yBqdJP
 Btpg==
X-Gm-Message-State: APjAAAUmXbAX4r9ugFVGlLcnnltQ3sIocupeZ9Wd6mLX1rzHbAjsWu8g
 vPeMiy5x6/GT1KVntZRS1VQ=
X-Google-Smtp-Source: APXvYqzNAMGJgqUeP+OuGJei/BXUJvxFdtY3GYAf5ZvYMfZ2dVnow3NFPqGhq06eUZsP4LzuqAGayA==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr5127533wrr.114.1572518654866; 
 Thu, 31 Oct 2019 03:44:14 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:44:14 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 6/7] drm/msm/dsi: Add configuration for 8x76
Date: Thu, 31 Oct 2019 11:44:01 +0100
Message-Id: <20191031104402.31813-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e5McPQ27o3b2k3AkmZCezEVbDePR7P5Jqw8CpztVvKw=;
 b=niL3U2vKEJO7RBQ+ImKWRyuR/qZTGddCZAOuKbd+7egeMdBsdMTBwuQlx7yyB9vdub
 zHP28MUtdZySPVBUMQlltnjMQIaIHfJg7kvSXSh/LEsaWfbtNZVI2PjepUT4rc3hlJgY
 NEYWjuxyhElnGrH4tvf7k9Db9AXf11PmBHswr6zHcpACLKg/z1rusGlUcoxHvySltgM0
 kZDyq64WVEj9dHTt1qs07LKKlWP9rrtApchBjaOj+NefQBFoR1FcoV8lCcl/lCpv4/ER
 GpwwUkDlOMo2tiZpCOoiiCBCusb31YN9BHlYm5EGwIUO+PkftqlDbWIKzTQdGtr7RKLK
 tCJw==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKTVNN
ODk3NiwgTVNNODk3NiBhbmQgQVBRIHZhcmlhbnRzIGhhdmUgRFNJIHZlcnNpb24gMzoxMDA0MDAw
MgooRFNJIDZHIFYxLjQuMiksIGZlYXR1cmluZyB0d28gRFNJcy4KVGhleSBuZWVkIHRocmVlIGNs
b2NrcyAobWRwX2NvcmUsIGlmYWNlLCBidXMpLCBvbmUgR0RTQyBhbmQKdHdvIHZyZWdzLCBWRERB
IGF0IDEuMlYgYW5kIFZERElPIGF0IDEuOFYuCgpTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2No
aW5vIERlbCBSZWdubyA8a2hvbGsxMUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21z
bS9kc2kvZHNpX2NmZy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvZHNpX2NmZy5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCmluZGV4IGU3NGRjOGNjOTA0Yi4uODZh
ZDNmZGYyMDdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCkBAIC02Niw2ICs2NiwyNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9kc2lfY29uZmlnIG1zbTg5MTZfZHNpX2NmZyA9IHsK
IAkubnVtX2RzaSA9IDEsCiB9OwogCitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGRzaV84OTc2
X2J1c19jbGtfbmFtZXNbXSA9IHsKKwkibWRwX2NvcmUiLCAiaWZhY2UiLCAiYnVzIiwKK307CisK
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25maWcgbXNtODk3Nl9kc2lfY2ZnID0gewor
CS5pb19vZmZzZXQgPSBEU0lfNkdfUkVHX1NISUZULAorCS5yZWdfY2ZnID0geworCQkubnVtID0g
MywKKwkJLnJlZ3MgPSB7CisJCQl7Imdkc2MiLCAtMSwgLTF9LAorCQkJeyJ2ZGRhIiwgMTAwMDAw
LCAxMDB9LAkvKiAxLjIgViAqLworCQkJeyJ2ZGRpbyIsIDEwMDAwMCwgMTAwfSwJLyogMS44IFYg
Ki8KKwkJfSwKKwl9LAorCS5idXNfY2xrX25hbWVzID0gZHNpXzg5NzZfYnVzX2Nsa19uYW1lcywK
KwkubnVtX2J1c19jbGtzID0gQVJSQVlfU0laRShkc2lfODk3Nl9idXNfY2xrX25hbWVzKSwKKwku
aW9fc3RhcnQgPSB7IDB4MWE5NDAwMCwgMHgxYTk2MDAwIH0sCisJLm51bV9kc2kgPSAyLAorfTsK
Kwogc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NvbmZpZyBtc204OTk0X2RzaV9jZmcgPSB7
CiAJLmlvX29mZnNldCA9IERTSV82R19SRUdfU0hJRlQsCiAJLnJlZ19jZmcgPSB7CkBAIC0xOTcs
NiArMjE3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NmZ19oYW5kbGVyIGRzaV9j
ZmdfaGFuZGxlcnNbXSA9IHsKIAkJJm1zbTg5MTZfZHNpX2NmZywgJm1zbV9kc2lfNmdfaG9zdF9v
cHN9LAogCXtNU01fRFNJX1ZFUl9NQUpPUl82RywgTVNNX0RTSV82R19WRVJfTUlOT1JfVjFfNF8x
LAogCQkmbXNtODk5Nl9kc2lfY2ZnLCAmbXNtX2RzaV82Z19ob3N0X29wc30sCisJe01TTV9EU0lf
VkVSX01BSk9SXzZHLCBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMV80XzIsCisJCSZtc204OTc2X2Rz
aV9jZmcsICZtc21fZHNpXzZnX2hvc3Rfb3BzfSwKIAl7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1T
TV9EU0lfNkdfVkVSX01JTk9SX1YyXzJfMCwKIAkJJm1zbTg5OThfZHNpX2NmZywgJm1zbV9kc2lf
NmdfdjJfaG9zdF9vcHN9LAogCXtNU01fRFNJX1ZFUl9NQUpPUl82RywgTVNNX0RTSV82R19WRVJf
TUlOT1JfVjJfMl8xLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2Nm
Zy5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCmluZGV4IGUyYjdhN2RmYmU0
OS4uNTBhMzdjZWI2YTI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lf
Y2ZnLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCkBAIC0xNyw2ICsx
Nyw3IEBACiAjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YxXzMJMHgxMDAzMDAwMAogI2Rl
ZmluZSBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMV8zXzEJMHgxMDAzMDAwMQogI2RlZmluZSBNU01f
RFNJXzZHX1ZFUl9NSU5PUl9WMV80XzEJMHgxMDA0MDAwMQorI2RlZmluZSBNU01fRFNJXzZHX1ZF
Ul9NSU5PUl9WMV80XzIJMHgxMDA0MDAwMgogI2RlZmluZSBNU01fRFNJXzZHX1ZFUl9NSU5PUl9W
Ml8yXzAJMHgyMDAwMDAwMAogI2RlZmluZSBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMl8yXzEJMHgy
MDAyMDAwMQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
