Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A30D7BEA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BDB6E849;
	Tue, 15 Oct 2019 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8CC6E7AF;
 Tue, 15 Oct 2019 10:11:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r3so23114805wrj.6;
 Tue, 15 Oct 2019 03:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sejk2YL89CpJ4d32oSXQDgSXo7RkFLMYz8ZMaclYygI=;
 b=S6gdssyEqwRBa/VmxPq07WKi2tHsnBf298V8lZiQMbVz1QgxUWgDFB0U/EITqwKlGO
 7lS1igRdd2hsr3w78JPngj/lWJFdjLo/1WJwhHKyILi9KtAL+xKiQlaj1gCJqTB7u0NJ
 o636/xZAAs8SHjRLPtBN33XPDp/62hzmJ7ODtC1lcDGl3mpji+KdM4EoBCL0JJOIQFxZ
 MDmegcEzcSN8cbvrdKee+P0g3gcro2+8PI/i+p1xUSAhomzOytX15XD6oERbOqcFkrU3
 en7DqJ8ZXvODMbow8G3boVnZXM6XlageONNouRIzTojYHzcViYt1O4RoA9r0Ppr7+Nca
 Is+A==
X-Gm-Message-State: APjAAAWRAVl4z3NI1LA/f6co+HvUImR3FBBAXfsrrZzoW57LIBapwWTo
 ZIgyiW8+6S471S2A/ok0ySw=
X-Google-Smtp-Source: APXvYqzh6ikhkAJIxT1JM2CyTFo8oYKiPl5pxfYWLXs0MtiFztOCEJ9XFRTRIUT8A9Ah3RBu5rJkWg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr7287863wrm.351.1571134267656; 
 Tue, 15 Oct 2019 03:11:07 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 03:11:07 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 6/7] drm/msm/dsi: Add configuration for 8x76
Date: Tue, 15 Oct 2019 12:10:57 +0200
Message-Id: <20191015101058.37157-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sejk2YL89CpJ4d32oSXQDgSXo7RkFLMYz8ZMaclYygI=;
 b=B+SgmOVhnzWDeXUA1P8zwLGAoRtUEyIp+HEVXLWOPieJYMxyG1a0Bx70L/QJXyGE9i
 +sETZCc6wUutYHXvZFmjDLgnMlzi5Y68riDfpGJlvnjbQH3BR0k5HiCJF8TNKAT3J/Uc
 MxaCL0nGuYADWtT9RgY4qmxKI++JEqHMUl7HNZpwGh8ROxHAoRO0Xijej2FM5sF7zJg1
 gKIvibt2mIwmsTFKLulHIATbXxF/iKOtd24RYNkJzQ6LxSUqwOzdwS1nBJp7jU61ukbO
 5WMjEIxs3wZtrxAoFebWSmUXfsashy0tUNpOJNfkC40K323my2wModg+yncwM8CE99mu
 2PbA==
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
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCmluZGV4IGU3NGRjOGNjOTA0Yi4uODM2
NGMyZGMzZjM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMK
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
