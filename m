Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 588322AFF9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 10:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7928289951;
	Mon, 27 May 2019 08:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997C989958;
 Mon, 27 May 2019 08:19:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e19so6599511wme.1;
 Mon, 27 May 2019 01:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJ0Q/F3ivyczd2SCCwAuk/1JuA4pK8OQ1/4ZOXtfZSI=;
 b=hFRRl+r9uOwpttNk8UiDcPPRGw+IoATMOc8Q1CvDCJgefYuQeTjgJkN5vujOHsGTT5
 Xi7Z1x5vp/QhtvfLCoM6tRducbP1+czWf2xafA88NSGLWpvcfFRMbObh7mLKxHigNn+x
 pjUfxkxi+AKaerpfE1rX77/nTM7h9XKjBscHZEy5pZ0MHAOZ2CkPoJEMkDKvhyX0lrkK
 ofoK58xzfgYMcRHhN9V/0HzcGayERHueNRQo6hEbkR2koLfi6X//oABAqgL/aMdqwasK
 H9QlkazFCXTxS3G5R/YiCAcytCeDT5KPnOi1F8dWyl8IyqqzgJWa3xNfjb4H35/NxeXU
 PyEw==
X-Gm-Message-State: APjAAAXzSD17HuDuaNATpSn2+FXMLh5V2bPCssK9x+aUfNagZyRn3RsN
 yCKjq6fWZHi0NVDgh4XeC1SZ/oSY
X-Google-Smtp-Source: APXvYqzRwajEzWcrZu406SRgKi029gr68gkFAe8r1wkBPUJDAke/kxtLo9TB11/yQZOMBs8CE1a9wg==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr25189688wmj.127.1558945160094; 
 Mon, 27 May 2019 01:19:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id a124sm7511876wmh.3.2019.05.27.01.19.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:19:19 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/13] drm/msm: drop DRM_AUTH usage from the driver
Date: Mon, 27 May 2019 09:17:35 +0100
Message-Id: <20190527081741.14235-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJ0Q/F3ivyczd2SCCwAuk/1JuA4pK8OQ1/4ZOXtfZSI=;
 b=AhaDtaOGQ4qr2iA6Ghx896z5xeaplQDwuJrVor5NcPLmuX3xDeGFQyuqTjG0GnJoa5
 fxmYYrpI0CINiW3yCBqrFkQ5ama4ZLF3VgIWSic57KfQWpH1cPZlMa0nnxtcMuGttm/v
 l5o5Y2Gnj0QSfTpNUZV9OAP/z+R6+pc3bL+Tfq2tUFJVjQpVN3DMEe77d9BztiJ32DMG
 BsK6VRbgEEjyzVlTqsb426iF4/ptOezXBbKAQBgYEMENtg318NPUbm/cU3/OtEuK7GJT
 AlEcTckcHPIhFhMh2hOXWpF3JlnCgZDKh8NLxEQ3E2aMJrJ5AUGR11BAPENbQK3axAro
 Nbkw==
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 emil.l.velikov@gmail.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBhdXRo
ZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSBy
ZW5kZXIKbm9kZS4KCkZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8gZGlzdGluY3Rpb24g
YmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgoKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8
c2VhbkBwb29ybHkucnVuPgpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xs
YWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIHwgMjIgKysrKysr
KysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKaW5kZXggMzFkZWI4N2FiZmM2Li5hYzFjN2E4
YTg1ZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCkBAIC05ODMsMTcgKzk4MywxNyBAQCBzdGF0aWMg
aW50IG1zbV9pb2N0bF9zdWJtaXRxdWV1ZV9jbG9zZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLAogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pb2N0bF9kZXNjIG1zbV9p
b2N0bHNbXSA9IHsKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VUX1BBUkFNLCAgICBtc21faW9j
dGxfZ2V0X3BhcmFtLCAgICBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExf
REVGX0RSVihNU01fR0VNX05FVywgICAgICBtc21faW9jdGxfZ2VtX25ldywgICAgICBEUk1fQVVU
SHxEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX0lORk8sICAg
ICBtc21faW9jdGxfZ2VtX2luZm8sICAgICBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKLQlE
Uk1fSU9DVExfREVGX0RSVihNU01fR0VNX0NQVV9QUkVQLCBtc21faW9jdGxfZ2VtX2NwdV9wcmVw
LCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VN
X0NQVV9GSU5JLCBtc21faW9jdGxfZ2VtX2NwdV9maW5pLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FM
TE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX1NVQk1JVCwgICBtc21faW9jdGxfZ2Vt
X3N1Ym1pdCwgICBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RS
VihNU01fV0FJVF9GRU5DRSwgICBtc21faW9jdGxfd2FpdF9mZW5jZSwgICBEUk1fQVVUSHxEUk1f
UkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX01BRFZJU0UsICBtc21f
aW9jdGxfZ2VtX21hZHZpc2UsICBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9D
VExfREVGX0RSVihNU01fU1VCTUlUUVVFVUVfTkVXLCAgIG1zbV9pb2N0bF9zdWJtaXRxdWV1ZV9u
ZXcsICAgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksCi0JRFJNX0lPQ1RMX0RFRl9EUlYoTVNN
X1NVQk1JVFFVRVVFX0NMT1NFLCBtc21faW9jdGxfc3VibWl0cXVldWVfY2xvc2UsIERSTV9BVVRI
fERSTV9SRU5ERVJfQUxMT1cpLAotCURSTV9JT0NUTF9ERUZfRFJWKE1TTV9TVUJNSVRRVUVVRV9R
VUVSWSwgbXNtX2lvY3RsX3N1Ym1pdHF1ZXVlX3F1ZXJ5LCBEUk1fQVVUSHxEUk1fUkVOREVSX0FM
TE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VUX1BBUkFNLCAgICBtc21faW9jdGxfZ2V0
X3BhcmFtLCAgICBEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VN
X05FVywgICAgICBtc21faW9jdGxfZ2VtX25ldywgICAgICBEUk1fUkVOREVSX0FMTE9XKSwKKwlE
Uk1fSU9DVExfREVGX0RSVihNU01fR0VNX0lORk8sICAgICBtc21faW9jdGxfZ2VtX2luZm8sICAg
ICBEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX0NQVV9QUkVQ
LCBtc21faW9jdGxfZ2VtX2NwdV9wcmVwLCBEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExf
REVGX0RSVihNU01fR0VNX0NQVV9GSU5JLCBtc21faW9jdGxfZ2VtX2NwdV9maW5pLCBEUk1fUkVO
REVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX1NVQk1JVCwgICBtc21faW9j
dGxfZ2VtX3N1Ym1pdCwgICBEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihN
U01fV0FJVF9GRU5DRSwgICBtc21faW9jdGxfd2FpdF9mZW5jZSwgICBEUk1fUkVOREVSX0FMTE9X
KSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fR0VNX01BRFZJU0UsICBtc21faW9jdGxfZ2VtX21h
ZHZpc2UsICBEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihNU01fU1VCTUlU
UVVFVUVfTkVXLCAgIG1zbV9pb2N0bF9zdWJtaXRxdWV1ZV9uZXcsICAgRFJNX1JFTkRFUl9BTExP
VyksCisJRFJNX0lPQ1RMX0RFRl9EUlYoTVNNX1NVQk1JVFFVRVVFX0NMT1NFLCBtc21faW9jdGxf
c3VibWl0cXVldWVfY2xvc2UsIERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9ERUZfRFJW
KE1TTV9TVUJNSVRRVUVVRV9RVUVSWSwgbXNtX2lvY3RsX3N1Ym1pdHF1ZXVlX3F1ZXJ5LCBEUk1f
UkVOREVSX0FMTE9XKSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19z
dHJ1Y3Qgdm1fb3BzID0gewotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
