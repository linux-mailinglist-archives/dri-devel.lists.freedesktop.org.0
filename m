Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DBE2B428
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688D89C3F;
	Mon, 27 May 2019 12:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E3D6E14A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 07:03:59 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b76so6601556pfb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 00:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Ou9qucjjS1yvpscRKVmRRDKnwn1q8SEEK4iftZmvq6M=;
 b=JidvNaNo/eUxmvxp3ZdH1anQX7qlzmx8QYwupbpNV1QKNSjOw2V0qJPg2iyUx5dZX8
 anC6KA8JW5IaIFp/HzIxZl5huZK6obiVVIlgbmP620Dbjz3T2qbuJcy/rgfwpI2aH4B/
 tDSmn0pRU1PGOz0gxqBUR+CP4G7XoCo1Fp7zoQFVwpnTh9k+Kwj8H4wGDwIFywRXLYzy
 2RIISlrK9tqSPBKqRoCYmPQb6u5o3hP2cDECyPfNqFD3jHraFISSeJbf/qBgVS4nWI0D
 hFrx4S0Qw/ouLzVlegxS6qQMPTVqgHJUIUnqSyfryyQR3cdYj3/3s2E0OyMTEl/0zCy5
 1lww==
X-Gm-Message-State: APjAAAV7HOZw5Mu6eoxvJ96Ls1lmJcXcehQ3RGu61Xlw9zHskR0GjYLK
 Nuof/IVEBwIIA+qWpmDV8o8=
X-Google-Smtp-Source: APXvYqz2fGzaLhOvTZ21B/Yj6WrUS10LI1Zb4JIpAoP+/EKpHI31hwmtNsEYlR5FcngbX8d1WspBsA==
X-Received: by 2002:a17:90a:1b0b:: with SMTP id
 q11mr14288409pjq.80.1558767839357; 
 Sat, 25 May 2019 00:03:59 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id l3sm5637001pgl.3.2019.05.25.00.03.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 00:03:58 -0700 (PDT)
Date: Sat, 25 May 2019 12:33:53 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: fix warning PTR_ERR_OR_ZERO can be used
Message-ID: <20190525070353.GA6727@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=Ou9qucjjS1yvpscRKVmRRDKnwn1q8SEEK4iftZmvq6M=;
 b=ATa9IqXhpNknuRnnk037f1U6Wxr3N5YBbIe47DjrNQJKxe/WJi9JnrTLdBwB5NLGpb
 S0kubHshm4bHRHlbBkWQ61ZfQUbqLb7Ow9TotSlUyA+nDbq0aIfCRnn8BZ4fXwUJCED8
 9EvuIJka24CFEde+tWxY020XqIbnCNSmsM5KB0TZLb2GtZbJYZCbw/80PeG/gZq8YAm/
 iwX3FkCRSNamIt87A9L47qHWNqDAHMVbLX7UHvj1LSWzm9qRtfKkUcHhVRLM0N0Zdi2u
 E/k66nOFfavkbQG+MpD9q72O/P80f6xbNGslU9lZT8eDASSPMNN1FPiSpY62XJjE1lNY
 nMMQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zml4IGJlbG93IHdhcm5pbmdzIHJlcG9ydGVkIGJ5IGNvY2NpY2hlY2sKCi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHJtLmM6NTA5OjEtMzogV0FSTklORzogUFRSX0VSUl9PUl9aRVJPIGNhbiBiZQp1
c2VkCi4vZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jOjQxOToxLTM6IFdBUk5JTkc6IFBUUl9F
UlJfT1JfWkVSTyBjYW4gYmUKdXNlZAoKU2lnbmVkLW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8
aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Ry
bS5jIHwgNiArKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8IDUgKy0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
cm0uYwppbmRleCAwYzVmMWU2Li4wYThmY2MxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCkBAIC01MDYsMTAg
KzUwNiw4IEBAIHN0YXRpYyBpbnQgdGVncmFfZ2VtX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtLCB2b2lkICpkYXRhLAogCiAJYm8gPSB0ZWdyYV9ib19jcmVhdGVfd2l0aF9oYW5kbGUoZmls
ZSwgZHJtLCBhcmdzLT5zaXplLCBhcmdzLT5mbGFncywKIAkJCQkJICZhcmdzLT5oYW5kbGUpOwot
CWlmIChJU19FUlIoYm8pKQotCQlyZXR1cm4gUFRSX0VSUihibyk7Ci0KLQlyZXR1cm4gMDsKKwkK
KwlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGJvKTsKIH0KIAogc3RhdGljIGludCB0ZWdyYV9nZW1f
bW1hcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRhLApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCmlu
ZGV4IDRjY2UxMWYuLjZlMjdmYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9n
ZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKQEAgLTQxNiwxMCArNDE2LDcg
QEAgaW50IHRlZ3JhX2JvX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0
IGRybV9kZXZpY2UgKmRybSwKIAogCWJvID0gdGVncmFfYm9fY3JlYXRlX3dpdGhfaGFuZGxlKGZp
bGUsIGRybSwgYXJncy0+c2l6ZSwgMCwKIAkJCQkJICZhcmdzLT5oYW5kbGUpOwotCWlmIChJU19F
UlIoYm8pKQotCQlyZXR1cm4gUFRSX0VSUihibyk7Ci0KLQlyZXR1cm4gMDsKKwlyZXR1cm4gUFRS
X0VSUl9PUl9aRVJPKGJvKTsKIH0KIAogc3RhdGljIHZtX2ZhdWx0X3QgdGVncmFfYm9fZmF1bHQo
c3RydWN0IHZtX2ZhdWx0ICp2bWYpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
