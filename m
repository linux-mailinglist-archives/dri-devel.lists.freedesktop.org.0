Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CCEB0BC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F09E6EE76;
	Thu, 31 Oct 2019 13:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6386EE1A;
 Thu, 31 Oct 2019 10:44:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n1so5658297wra.10;
 Thu, 31 Oct 2019 03:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
 b=J/QT2RYefU04glxndtytkLt6Llzbxx3TxMVa0vvYBGX6DrUGu6QSIlIMAlABNmpd88
 adF26cHt/QoA+rbvCvuRYdF118Fpog4zlGS2KVUgEJDZIyeWYff3GeeiS4maEXr62Jiw
 UW7+5yJBZiRsRTSjTUvCFAMojYDD6yZU5aiZ2wc8d1bAqrc1pGA0QzWN2wJKcq+VFXHG
 jzJFcwfW0tAfKyYaOlqX3XZ/TgeOceFyEZ7r032/5NIW2r9uZ7bPr5UC4MrsZGLIk57u
 FRZFMXKL8JMnqMyz6hcMWxs+ijQmwU+YOAsiGtL+Cips+jynZZRk4cS1x2HNuloTFy2i
 n/jQ==
X-Gm-Message-State: APjAAAVdlPe1HpctCGqMO+dXHenhyj3bWYF0z13gYNecgCPa8xvfHzZZ
 HX8UO+x30QHzO7d/BJtLiI0=
X-Google-Smtp-Source: APXvYqxH8oTHqLA63a1Uj/b4VAZDUACC4QbsyC80mYG0ahfDrOcSQv4/iYny9FdB+G3gt3lS0nfK0Q==
X-Received: by 2002:adf:d850:: with SMTP id k16mr5042506wrl.204.1572518649714; 
 Thu, 31 Oct 2019 03:44:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:44:09 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/7] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date: Thu, 31 Oct 2019 11:43:56 +0100
Message-Id: <20191031104402.31813-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
 b=Vjx22jOAuDKUp3zgblNS0LdjjxujAQl2/ARRTmo3LQXhidPT+z4nMCPRKb9iB5OIy9
 /J06LIS3zoauIwJFHBCbiMZTTZf7acrneJGWnbQdYW+9aUeQn1WuF1wEWLc4UZ5i4iL6
 Q0zNMmKLsRf8jiYBEuvTreX5bvOkET1U4wNrRnaQwdAytLNO3tqU2dlu5YxNWB+q5u7U
 ZAIe8m7ZiurX0sRNlIlytDWwCX16dKjHfAiKw0ERAvEzp/bnAk7h5mIl0KnLJHaapeKJ
 YrXJwQsCeHVMTkb3YGb2xMAgCKrdQKP/WvqKkwfbTHjdZdeURR+oTeliwuCaIiKv2yYV
 jFwg==
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

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKU29t
ZSBTb0NzLCBsaWtlIE1TTTg5NTYvODk3NiAoYW5kIEFQUSB2YXJpYW50cyksIGRvIGZlYXR1cmUg
dGhlc2UKY2xvY2tzIGFuZCB3ZSBuZWVkIHRvIGVuYWJsZSB0aGVtIGluIG9yZGVyIHRvIGdldCBi
b3RoIG9mIHRoZQpodyAobWRwNS9yb3QpIFRyYW5zbGF0aW9uIEJ1ZmZlciBVbml0cyAoVEJVcykg
dG8gcHJvcGVybHkgd29yay4KClNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDxraG9sazExQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NS9tZHA1X2ttcy5jIHwgMTAgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwppbmRleCA1NDc2ODkyYTMz
NWYuLmU0M2VjZDRiZTEwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2tt
cy5jCkBAIC0zMDksNiArMzA5LDEwIEBAIGludCBtZHA1X2Rpc2FibGUoc3RydWN0IG1kcDVfa21z
ICptZHA1X2ttcykKIAltZHA1X2ttcy0+ZW5hYmxlX2NvdW50LS07CiAJV0FSTl9PTihtZHA1X2tt
cy0+ZW5hYmxlX2NvdW50IDwgMCk7CiAKKwlpZiAobWRwNV9rbXMtPnRidV9ydF9jbGspCisJCWNs
a19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+dGJ1X3J0X2Nsayk7CisJaWYgKG1kcDVfa21z
LT50YnVfY2xrKQorCQljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwNV9rbXMtPnRidV9jbGspOwog
CWNsa19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+YWhiX2Nsayk7CiAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKG1kcDVfa21zLT5heGlfY2xrKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUobWRw
NV9rbXMtPmNvcmVfY2xrKTsKQEAgLTMyOSw2ICszMzMsMTAgQEAgaW50IG1kcDVfZW5hYmxlKHN0
cnVjdCBtZHA1X2ttcyAqbWRwNV9rbXMpCiAJY2xrX3ByZXBhcmVfZW5hYmxlKG1kcDVfa21zLT5j
b3JlX2Nsayk7CiAJaWYgKG1kcDVfa21zLT5sdXRfY2xrKQogCQljbGtfcHJlcGFyZV9lbmFibGUo
bWRwNV9rbXMtPmx1dF9jbGspOworCWlmIChtZHA1X2ttcy0+dGJ1X2NsaykKKwkJY2xrX3ByZXBh
cmVfZW5hYmxlKG1kcDVfa21zLT50YnVfY2xrKTsKKwlpZiAobWRwNV9rbXMtPnRidV9ydF9jbGsp
CisJCWNsa19wcmVwYXJlX2VuYWJsZShtZHA1X2ttcy0+dGJ1X3J0X2Nsayk7CiAKIAlyZXR1cm4g
MDsKIH0KQEAgLTk2NSw2ICs5NzMsOCBAQCBzdGF0aWMgaW50IG1kcDVfaW5pdChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJLyogb3B0aW9u
YWwgY2xvY2tzOiAqLwogCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT5sdXRfY2xrLCAibHV0Iiwg
ZmFsc2UpOworCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT50YnVfY2xrLCAidGJ1IiwgZmFsc2Up
OworCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT50YnVfcnRfY2xrLCAidGJ1X3J0IiwgZmFsc2Up
OwogCiAJLyogd2UgbmVlZCB0byBzZXQgYSBkZWZhdWx0IHJhdGUgYmVmb3JlIGVuYWJsaW5nLiAg
U2V0IGEgc2FmZQogCSAqIHJhdGUgZmlyc3QsIHRoZW4gZmlndXJlIG91dCBodyByZXZpc2lvbiwg
YW5kIHRoZW4gc2V0IGEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCmlu
ZGV4IGQxYmY0ZmRmYzgxNS4uMTI4ODY2NzQyNTkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9tZHA1L21kcDVfa21zLmgKQEAgLTUzLDYgKzUzLDggQEAgc3RydWN0IG1kcDVfa21zIHsKIAlz
dHJ1Y3QgY2xrICphaGJfY2xrOwogCXN0cnVjdCBjbGsgKmNvcmVfY2xrOwogCXN0cnVjdCBjbGsg
Kmx1dF9jbGs7CisJc3RydWN0IGNsayAqdGJ1X2NsazsKKwlzdHJ1Y3QgY2xrICp0YnVfcnRfY2xr
OwogCXN0cnVjdCBjbGsgKnZzeW5jX2NsazsKIAogCS8qCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
