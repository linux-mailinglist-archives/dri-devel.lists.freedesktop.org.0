Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3B7196F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 15:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAA96E20F;
	Tue, 23 Jul 2019 13:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BEE6E20F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 13:38:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h28so29355511lfj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktAJuIJ9KXqby1Ak7scwTAEzieMJIsOT18B61deNl2M=;
 b=GUFNJfHoybmG6R3EWomQnB5H3dVfM4oW6IJx3z+fdgnHLV1wcAb5hYxYbQQK1oxdDi
 MKlmg/9x3kqBi8rI4yZVKyiQEZ0SGspmegaKe/hPtjFcDFeLZVZDqLn0kIYuKretitpE
 eQMGXLJLLIa6VVkWEa2J0JW3K1MVd/oD1i/rK6Tn5Erjc8NSLO1RjIEUxRYb7h1YH6Pi
 zjbdKgV5TfG0o/WsEHwId98scv99wQXyKEm3PsywXipxR+k8pRUuA612eWdLY4lF6ISz
 pIZvtHPIhJRIt6KYc5CmY5u+/2Swwx7rhHoNnXA6lkJrd8Gnj7LfhLZeJAO1ZILy+IBW
 0MPQ==
X-Gm-Message-State: APjAAAUy/4o2Q/9rkwRoM5juMyIfolxntqq0mOnHnkp6MOJHMc2xmFdJ
 wy9nvOqMB89SRQqV0A2ZTK9RoOyG7Es=
X-Google-Smtp-Source: APXvYqzjveNqA9ZUcV25S+gLWC8uVypFal/gu2ZEyUFlv0+xvo819wdakKCilrmEEtLUTmTsnC+3WQ==
X-Received: by 2002:a19:48c5:: with SMTP id v188mr34546643lfa.69.1563889081429; 
 Tue, 23 Jul 2019 06:38:01 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id l24sm8069411lji.78.2019.07.23.06.38.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 06:38:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Daniel Tang <dt.tangr@gmail.com>,
	Fabian Vogt <fabian@ritter-vogt.de>
Subject: [PATCH 0/3] RFT: PL111 DRM conversion of nspire
Date: Tue, 23 Jul 2019 15:37:52 +0200
Message-Id: <20190723133755.22677-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktAJuIJ9KXqby1Ak7scwTAEzieMJIsOT18B61deNl2M=;
 b=IOHG8EdqQTEgJQ4hE28am0duu+7wfJe9cI9ps0P+6q9NodmUKIyWVwaDmwkRpWqbvM
 XQhZHmU6j0l0pUsRHJnHQrhAV213lArsWk3eFFM4pz7DoWecbK3DbxBh/BUdEgzeeQ4g
 b27rCQsENSd3Gl0vybn5+PVATdtYn1zQyqzq0SLl6HTjedTHeScJJDvjij0COsASmu5T
 ro5Hgc57ug6avJwmpE3+vZU6GjCGSFMS7qhAQ10m7LcCMsw9Qvd2smSk6uiZl5Z9eDoa
 zr+wYW823XuPthBYn8z3hjG61x2/o5c62dw4zpLgYGK7dof3SNfsfTsIMnT0LA5SA94h
 leCQ==
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gdGhpcyBpcyBhIGNvbGQtY29kZWQgYXR0ZW1wdCB0byBtb3ZlIHRoZSBUSSBuc3BpcmUgb3Zl
ciB0bwp1c2luZyBEUk0uIEl0IGlzIG1vcmUgb3IgbGVzcyB0aGUgbGFzdCB1c2VyIG9mIHRoZSBv
bGQgZmJkZXYKZHJpdmVyIHNvIGl0IGlzIGEgbm9ibGUgY2F1c2UgYW5kIGludGVyZXN0aW5nIHVz
ZWNhc2UuCgpUaGlzIGNhbiBiZSBhcHBsaWVkIG9uIHRvcCBvZiBhIHZhbmlsbGEgVG9ydmFsZHMg
djUuMy1yYzEKa2VybmVsIG91dCBzaW5jZSBzdW5kYXkuCgpJIGRvIG5vdCBleHBlY3QgdGhlc2Ug
cGF0Y2hlcyB0byAianVzdCB3b3JrIiwgSSBleHBlY3QgdGhlbSB0bwpuZWVkIHNvbWUgaGFja2lu
Zywgc28gc29tZW9uZSB3aG8gaXMgYWN0dWFsbHkgd29ya2luZyBvbiB0aGUKaGFyZHdhcmUgd2ls
bCBuZWVkIHRvIHN0ZXAgaW4gYW5kIGZpeCBpdCB1cC4KCkl0IGRvZXMgb3V0bGluZSB0aGUgb3Zl
cmFsbCBpZGVhIG9mIGhvdyB0byBkbyB0aGlzLgoKSSBmb3VuZCBubyBkZWZjb25maWcgZm9yIG5z
cGlyZSBpbiB0aGUga2VybmVsIHNvIEkgdXNlZApBUk12NHQgbXVsdGkuCgpDb25maWd1cmluZyB0
aGUgZHJpdmVyIGZvciBuc3BpcmU6CgotIERpc2FibGUgQ09ORklHX0ZCX0FSTUNMQ0QKLSBFbmFi
bGUgQ09ORklHX0RSTV9QTDExMSwgQ09ORklHX0RSTV9QQU5FTF9TSU1QTEUKCkhhY2tlciBub3Rl
cyBmb3IgbnNwaXJlOgoKLSBJIGRvbid0IGtub3cgd2hpY2ggUHJpbWVDZWxsIElEIHRoaXMgaGFy
ZHdhcmUgaGFzLCBJIGhvcGUKICB0aGUgYW1iYV9pZCBtYXNrIGluIGRyaXZlcnMvZ3B1L2RybS9w
bDExMS9wbDExMV9kcnYuYyBmb3IKICBQTDExMSBhbmQgUEwxMTAgd2lsbCBtYXRjaCBpdC4gUGxl
YXNlIGNvbmZpcm0gdGhhdCB5b3UgZ2V0CiAgYSBjbGVhbiBwcm9iZSBjYWxsLCBlbHNlIHJlcG9y
dCB3aGF0IElEIHRoaXMgaGFzLgoKLSBUaGUgMjRiaXQgUkdCIGZyYW1lIGJ1ZmZlciBtYXkgYmUg
YSBiaXQgbXVjaCBmb3IgdGhlIFBMMTExCiAgaW4gdGhlIFRJIG5zcGlyZSB0byBoYW5kbGUuIFRy
eSBlZGl0aW5nIHRoZSAuZmJfYnBwIGluCiAgZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Ry
di5jIGRvd24gdG8gMTYgaWYgdGhpcyBpcwogIHRoZSBQTDExMSB2YXJpYW50LiBJZiBpdCBpcyB0
aGUgUEwxMTAgdmFyaWFudCwgd2Ugd2lsbCBnZXQKICAxNiBidXRzIGZyYW1lYnVmZmVyIGFueXdh
eS4KCi0gSSBoYXZlIGhhcmQtY29kZWQgdGhlIHBhbmVscyB0byAxTUh6LCBiYXNlZCBvbiB0aGUg
ZmFjdAogIHRoYXQgdGhlIEFIQiBjbG9jayBpbnRvIHRoZSBDTENEIGFwcGVhcnMgdG8gYmUgNDgg
TUh6CiAgYW5kIHRoZSBoYXJkLWNvZGVkIFRJTTIgdmFsdWUgZm9yIHRoZSBjbGFzc2ljIG1lYW5z
CiAgImRpdmlkZSBieSA0OCIgYW5kIHRoaXMgc2VlbXMgdG8gd2FudCB0aGUgY2xvY2sgZnJlcQog
IGRpdmlkZWQgZG93biB0byAxTUh6LiBWZXJpZnkgdGhpcyBieSBhZGRpbmcgcHJpbnRzCiAgaW5z
aWRlIGRyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMgaW4gdGhlCiAgZnVuY3Rp
b24gcGwxMTFfY2xrX2Rpdl9zZXRfcmF0ZSgpIHRvIHZlcmlmeSB0aGF0IHRoZQogIGRpdmlkZXIg
Z2V0cyBzZXQgdG8gNDggaW4gVElNMl9QQ0RfSEkgYW5kCiAgVElNMl9QQ0RfTE8uIFRJTTJfUENE
X0xPIGJpdHMgMC4uNCA9IDEwMDAwIGFuZAogIFRJTTJfUENEX0hJIGJpdHMgMjcuLjMxID0gMDAw
MDEgaW4gdGhhdCByZWdpc3Rlci4KClBsZWFzZSB0ZXN0IGFuZCBmaXgsIGlmIHlvdSBjYW4uCgpM
aW51cyBXYWxsZWlqICgzKToKICBSRlQ6IGRybS9wbDExMTogU3VwcG9ydCBncmF5c2NhbGUKICBS
VEY6IGRybS9wYW5lbDogc2ltcGxlOiBBZGQgVEkgbnNwaXJlIHBhbmVscwogIFJGVDogQVJNOiBu
c3BpcmU6IE1vdmUgQ0xDRCBzZXQtdXAgdG8gZGV2aWNlIHRyZWUKCiBhcmNoL2FybS9ib290L2R0
cy9uc3BpcmUtY2xhc3NpYy5kdHNpIHwgIDE5ICsrKystCiBhcmNoL2FybS9ib290L2R0cy9uc3Bp
cmUtY3guZHRzICAgICAgIHwgIDE4ICsrKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL25zcGlyZS5kdHNp
ICAgICAgICAgfCAgMTAgKystCiBhcmNoL2FybS9tYWNoLW5zcGlyZS9NYWtlZmlsZSAgICAgICAg
IHwgICAxIC0KIGFyY2gvYXJtL21hY2gtbnNwaXJlL2NsY2QuYyAgICAgICAgICAgfCAxMTQgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtL21hY2gtbnNwaXJlL2NsY2QuaCAgICAg
ICAgICAgfCAgMTAgLS0tCiBhcmNoL2FybS9tYWNoLW5zcGlyZS9uc3BpcmUuYyAgICAgICAgIHwg
IDI1IC0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jICB8ICA2MyAr
KysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYyB8ICAy
OCArKysrKystCiBpbmNsdWRlL2xpbnV4L2FtYmEvY2xjZC1yZWdzLmggICAgICAgIHwgICAxICsK
IDEwIGZpbGVzIGNoYW5nZWQsIDEzMyBpbnNlcnRpb25zKCspLCAxNTYgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1uc3BpcmUvY2xjZC5jCiBkZWxldGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1uc3BpcmUvY2xjZC5oCgotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
