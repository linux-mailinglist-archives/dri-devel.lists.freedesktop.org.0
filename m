Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3B26725
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 17:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FD889B3B;
	Wed, 22 May 2019 15:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1E489B3B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 15:48:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j187so5028258wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 08:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ymCN4zK26ZTUFCEXX7eQSW+kelBNJC5uXfNvBUA89w=;
 b=jmtSKRfGHjdqiYDtPJScn4QaG4tWvlRcDiH7ndsaJC/j7zi20Uo0/cA+SqkDgS8sr4
 sa2Zo18fkmh7f3WSIU3v1MYAp1BWMOIuEkIoSnQgjjiZ5g9e+3MmkqqdGkwN3lYaeUDa
 m6Z/Oz2yyKAPwUUX2Ptb+1Z/I1MFUrWNv5Ez4vnxMexNJODUkiW0imSYgS9zZ0Yi7vsZ
 xZPkunPZ7+xZr57x/Lx01THByWM6VKqtFOmBHBl4IFMrmNC0yes2MBf+TKhBDunnF2pt
 XF3NQ2Cpwn4rAnee43za5FPHoL/AeIfW4rb4pn0OdiF6Cxdz/Psf8L06FM6MJkChKXSs
 T9AQ==
X-Gm-Message-State: APjAAAXQJIpxjcbJYCdyYZZ6NT3oTDbIZ2Pa1OhASBFfrfFeclBEN3EV
 Ono7uZrcAlmfSxJ3+J1DxfAaSszr
X-Google-Smtp-Source: APXvYqzs7YHIDcZN4IrAo88L1Gs+cRh/lgeCh5bjQJtVA479VVwk4p4HXw1ftnCxMsHoHR99X76uVA==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr1642875wmc.69.1558540107798; 
 Wed, 22 May 2019 08:48:27 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id t6sm12567117wmt.34.2019.05.22.08.48.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 08:48:27 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/tegra: remove irrelevant DRM_UNLOCKED flag
Date: Wed, 22 May 2019 16:46:59 +0100
Message-Id: <20190522154702.16269-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ymCN4zK26ZTUFCEXX7eQSW+kelBNJC5uXfNvBUA89w=;
 b=SFk/HRAUYcYrwCMhsQ2edNdvV5hwj+tm2jzDiidQKYpQ7PC6R3+2qJ6oihdSnqcAR5
 1N7zPNgIENz0Xa7mggkJ9pMW5U+leJ9FwbRm/ZuOf82rpKimd9LKqoE4Sey3atnhhtGH
 sgAYV8IDrSRwA//5yQ7YSMQeM2Hfdx8cC2XyUhoLMjcVbLLmZrPAiyaxDVDQZNgn7r4A
 dc5cv2fEPpkTY4wqXBc1BstyU6YwlQSwaEXsqERVK7MBXPT4rHoVMvHuMs7djKFPdmLA
 /VoeiSotnElK/vtb6xVFXGfRCD/eEkP1kn9AGBofejsYnXrngE6nq27zBuGj8/smPEcx
 fK2Q==
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkRSTV9VTkxP
Q0tFRCBkb2Vzbid0IGRvIGFueXRoaW5nIGZvciBub24tbGVnYWN5IGRyaXZlcnMuIFJlbW92ZSBp
dC4KCkNjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpDYzogbGludXgtdGVn
cmFAdmdlci5rZXJuZWwub3JnCkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNp
Z25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIHwgMjggKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcm0uYwppbmRleCAwYzVmMWU2YTA0NDYuLjg4MzZjMTEzYjM5MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcm0uYwpAQCAtODkxLDMzICs4OTEsMzMgQEAgc3RhdGljIGludCB0ZWdyYV9nZW1fZ2V0
X2ZsYWdzKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmRhdGEsCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9pb2N0bF9kZXNjIHRlZ3JhX2RybV9pb2N0bHNbXSA9IHsKICNpZmRlZiBDT05G
SUdfRFJNX1RFR1JBX1NUQUdJTkcKIAlEUk1fSU9DVExfREVGX0RSVihURUdSQV9HRU1fQ1JFQVRF
LCB0ZWdyYV9nZW1fY3JlYXRlLAotCQkJICBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9X
KSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoVEVHUkFfR0VN
X01NQVAsIHRlZ3JhX2dlbV9tbWFwLAotCQkJICBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FM
TE9XKSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoVEVHUkFf
U1lOQ1BUX1JFQUQsIHRlZ3JhX3N5bmNwdF9yZWFkLAotCQkJICBEUk1fVU5MT0NLRUQgfCBEUk1f
UkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9E
UlYoVEVHUkFfU1lOQ1BUX0lOQ1IsIHRlZ3JhX3N5bmNwdF9pbmNyLAotCQkJICBEUk1fVU5MT0NL
RUQgfCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lP
Q1RMX0RFRl9EUlYoVEVHUkFfU1lOQ1BUX1dBSVQsIHRlZ3JhX3N5bmNwdF93YWl0LAotCQkJICBE
Uk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyks
CiAJRFJNX0lPQ1RMX0RFRl9EUlYoVEVHUkFfT1BFTl9DSEFOTkVMLCB0ZWdyYV9vcGVuX2NoYW5u
ZWwsCi0JCQkgIERSTV9VTkxPQ0tFRCB8IERSTV9SRU5ERVJfQUxMT1cpLAorCQkJICBEUk1fUkVO
REVSX0FMTE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihURUdSQV9DTE9TRV9DSEFOTkVMLCB0ZWdy
YV9jbG9zZV9jaGFubmVsLAotCQkJICBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FMTE9XKSwK
KwkJCSAgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoVEVHUkFfR0VUX1NZ
TkNQVCwgdGVncmFfZ2V0X3N5bmNwdCwKLQkJCSAgRFJNX1VOTE9DS0VEIHwgRFJNX1JFTkRFUl9B
TExPVyksCisJCQkgIERSTV9SRU5ERVJfQUxMT1cpLAogCURSTV9JT0NUTF9ERUZfRFJWKFRFR1JB
X1NVQk1JVCwgdGVncmFfc3VibWl0LAotCQkJICBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVSX0FM
TE9XKSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoVEVHUkFf
R0VUX1NZTkNQVF9CQVNFLCB0ZWdyYV9nZXRfc3luY3B0X2Jhc2UsCi0JCQkgIERSTV9VTkxPQ0tF
RCB8IERSTV9SRU5ERVJfQUxMT1cpLAorCQkJICBEUk1fUkVOREVSX0FMTE9XKSwKIAlEUk1fSU9D
VExfREVGX0RSVihURUdSQV9HRU1fU0VUX1RJTElORywgdGVncmFfZ2VtX3NldF90aWxpbmcsCi0J
CQkgIERSTV9VTkxPQ0tFRCB8IERSTV9SRU5ERVJfQUxMT1cpLAorCQkJICBEUk1fUkVOREVSX0FM
TE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihURUdSQV9HRU1fR0VUX1RJTElORywgdGVncmFfZ2Vt
X2dldF90aWxpbmcsCi0JCQkgIERSTV9VTkxPQ0tFRCB8IERSTV9SRU5ERVJfQUxMT1cpLAorCQkJ
ICBEUk1fUkVOREVSX0FMTE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihURUdSQV9HRU1fU0VUX0ZM
QUdTLCB0ZWdyYV9nZW1fc2V0X2ZsYWdzLAotCQkJICBEUk1fVU5MT0NLRUQgfCBEUk1fUkVOREVS
X0FMTE9XKSwKKwkJCSAgRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoVEVH
UkFfR0VNX0dFVF9GTEFHUywgdGVncmFfZ2VtX2dldF9mbGFncywKLQkJCSAgRFJNX1VOTE9DS0VE
IHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQkgIERSTV9SRU5ERVJfQUxMT1cpLAogI2VuZGlmCiB9
OwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
