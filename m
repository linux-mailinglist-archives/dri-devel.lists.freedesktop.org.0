Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E5358E3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 10:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535AF8952F;
	Wed,  5 Jun 2019 08:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B158952F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:46:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so6129496wru.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 01:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAh0tQYxRGivtLwVSpTEFqNc9NXs0jToXbtvZ2UvbRY=;
 b=SKNtZUNxVkpkZt0t2QvJa98UKVdKFsnIu9FuwYsteg39BZm6F3pcIqHNTJwy+nXJXz
 c0Ogbvlub0sFBgnY+J/VNMYF2+G3CNNRa5ftZO7FxqNMGJ+bSl31yvTIuVgy3KizECZL
 G7m40EBhKS5vhMgO6vYvmkqB/7Uj7plJar7y0t+1/Cq1CTWdMEQ9E3XBIHOSZhzjMCJ8
 J3N0ki8bE18WJwV3s92+5uyJg0FUrXNv1idZ5U5Bhv2UUeNWnPjPxtLP2bjrDqkVu3wZ
 kT/qO5mTpjSCg0hMnrLjl8rUI4Kfo7T4VzdrHtxDNV4aXETyRro4eTdgxQ8Yl3vzHHNh
 U7IQ==
X-Gm-Message-State: APjAAAWjjNkj8Brv3AT8MPuFKzeF66wSIxSNUAh4wev4FRnhIsy1mRER
 lTdooSQDqN/Y8JA3N9+PcbQ=
X-Google-Smtp-Source: APXvYqw888SyctRbwhPUlMKJr6n5Z0t3+u+hUpReww+AM+kBbXY/8usZ6rnXOrfTptTVDa803MKKGQ==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr3787886wrl.54.1559724366992; 
 Wed, 05 Jun 2019 01:46:06 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id 88sm26581553wrl.68.2019.06.05.01.46.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 05 Jun 2019 01:46:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: Increase maximum DMA segment size
Date: Wed,  5 Jun 2019 10:46:05 +0200
Message-Id: <20190605084605.12225-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAh0tQYxRGivtLwVSpTEFqNc9NXs0jToXbtvZ2UvbRY=;
 b=KgU2NAvYFSJydcbmDhCQIjjonGQRe2XpasElf/BJSCoRJK76zv7lDRUlG90AyFhqjp
 HMOXsENXMgdzXJTjznrIm/H+c+qf0jqqhon1vCUMNUsVEcrDS+ZtYOBq8KCtkNGWnVKi
 MDUE1+YTEKthuvmiUzJ2zyfK1qSCIM5eoo3wb2WHCixUOzvOKWsv7KTQWNvsJ91Sarz4
 WcjkiLhaFXJ48TE31TeEIJcu9k3EJYoKHoKBQXm8OS0YQ+hc2dzP/O5QPCs+oLTSkX2t
 0UyV3sW1lgMXHjYEXl367XnF7GslTTTFBVUKh1FqB8gPK4oBidPhj5omO1mjGZi8iYSu
 A7Gw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJlY2VudCB2ZXJzaW9u
cyBvZiB0aGUgRE1BIEFQSSBkZWJ1ZyBjb2RlIGhhdmUgc3RhcnRlZCB0byB3YXJuIGFib3V0CnZp
b2xhdGlvbnMgb2YgdGhlIG1heGltdW0gRE1BIHNlZ21lbnQgc2l6ZS4gVGhpcyBpcyBiZWNhdXNl
IHRoZSBzZWdtZW50CnNpemUgZGVmYXVsdHMgdG8gNjQgS2lCLCB3aGljaCBjYW4gZWFzaWx5IGJl
IGV4Y2VlZGVkIGluIGxhcmdlIGJ1ZmZlcgphbGxvY2F0aW9ucyBzdWNoIGFzIHVzZWQgaW4gRFJN
L0tNUyBmb3IgZnJhbWVidWZmZXJzLgoKVGVjaG5pY2FsbHkgdGhlIFRlZ3JhIFNNTVUgYW5kIEFS
TSBTTU1VIGRvbid0IGhhdmUgYSBtYXhpbXVtIHNlZ21lbnQKc2l6ZSAodGhleSBtYXAgaW5kaXZp
ZHVhbCBwYWdlcyBpcnJlc3BlY3RpdmUgb2Ygd2hldGhlciB0aGV5IGFyZQpjb250aWd1b3VzIG9y
IG5vdCksIHNvIHRoZSBjaG9pY2Ugb2YgNCBNaUIgaXMgYSBiaXQgYXJiaXRyYXJ5IGhlcmUuIFRo
ZQptYXhpbXVtIHNlZ21lbnQgc2l6ZSBpcyBhIDMyLWJpdCB1bnNpZ25lZCBpbnRlZ2VyLCB0aG91
Z2gsIHNvIHdlIGNhbid0CnNldCBpdCB0byB0aGUgY29ycmVjdCBtYXhpbXVtIHNpemUsIHdoaWNo
IHdvdWxkIGJlIHRoZSBzaXplIG9mIHRoZQphcGVydHVyZS4KClNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2J1
cy5jIHwgMyArKysKIGluY2x1ZGUvbGludXgvaG9zdDF4LmggICB8IDIgKysKIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1
cy5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jCmluZGV4IDk3OTdjY2IwYTA3My4uNjM4NzMw
MmMxMjQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMKKysrIGIvZHJpdmVy
cy9ncHUvaG9zdDF4L2J1cy5jCkBAIC00MTQsNiArNDE0LDkgQEAgc3RhdGljIGludCBob3N0MXhf
ZGV2aWNlX2FkZChzdHJ1Y3QgaG9zdDF4ICpob3N0MXgsCiAKIAlvZl9kbWFfY29uZmlndXJlKCZk
ZXZpY2UtPmRldiwgaG9zdDF4LT5kZXYtPm9mX25vZGUsIHRydWUpOwogCisJZGV2aWNlLT5kZXYu
ZG1hX3Bhcm1zID0gJmRldmljZS0+ZG1hX3Bhcm1zOworCWRtYV9zZXRfbWF4X3NlZ19zaXplKCZk
ZXZpY2UtPmRldiwgU1pfNE0pOworCiAJZXJyID0gaG9zdDF4X2RldmljZV9wYXJzZV9kdChkZXZp
Y2UsIGRyaXZlcik7CiAJaWYgKGVyciA8IDApIHsKIAkJa2ZyZWUoZGV2aWNlKTsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaG9zdDF4LmggYi9pbmNsdWRlL2xpbnV4L2hvc3QxeC5oCmluZGV4
IGNmZmYzMGI5YTYyZS4uZTZlZWE0NWUxMTU0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2hv
c3QxeC5oCisrKyBiL2luY2x1ZGUvbGludXgvaG9zdDF4LmgKQEAgLTI5Nyw2ICsyOTcsOCBAQCBz
dHJ1Y3QgaG9zdDF4X2RldmljZSB7CiAJc3RydWN0IGxpc3RfaGVhZCBjbGllbnRzOwogCiAJYm9v
bCByZWdpc3RlcmVkOworCisJc3RydWN0IGRldmljZV9kbWFfcGFyYW1ldGVycyBkbWFfcGFybXM7
CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBob3N0MXhfZGV2aWNlICp0b19ob3N0MXhfZGV2
aWNlKHN0cnVjdCBkZXZpY2UgKmRldikKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
