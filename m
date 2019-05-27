Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0BB2AFF2
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 10:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0993C89954;
	Mon, 27 May 2019 08:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2124189838
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 08:19:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y3so15204745wmm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 01:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ohXizjfAaR462L3eOhvMCvBzEMDgTc7BEV6UBo4dGE=;
 b=LYt6+pCY+4mQGQltHZwS1IXeF/12PWuHQbDbOAVfmoDthq5MNz33eO8u79QObfOBYb
 7UmeEq4RGjag6RNr+1JSLEjKIs9ZjexLlod7ZxEpy2PADOQ21laSxvmlBVK30FCMS/OA
 DYQhZe9vtwWrf55Vs+jFg0dhGlEa6RHXieb0hSiiqlTh8dCkyLV/g1livsOXAxRe7eML
 38ayMFtXiJuqw8Nb1M7bVdbtcpIqhbNEOLwUZrodp3KFgCbaPdKXvHg9k9CplU2tmM61
 321VxFNzML8Lo9yzyKctiP4JOYptcN/GqwXz7XP/8oYJPzCucDvL2AsBWyiBcisBt34K
 grRw==
X-Gm-Message-State: APjAAAVVr8n8SgK3xC2rQniRXhxDIA3L/WiqIWkMhvNlC+E1I67xxdI2
 dFcndEltRh8WbM7DyiOu6Y8HUB2L
X-Google-Smtp-Source: APXvYqwM7nYzliBoIjpj58mCPP/+W/58TrYzTpfoxNejsGEBc3js5DryEqMOVBbs2kTJ3p7CLvVQ2w==
X-Received: by 2002:a7b:c3c3:: with SMTP id t3mr26065327wmj.88.1558945156587; 
 Mon, 27 May 2019 01:19:16 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id a124sm7511876wmh.3.2019.05.27.01.19.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:19:16 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/13] drm/exynos: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
Date: Mon, 27 May 2019 09:17:32 +0100
Message-Id: <20190527081741.14235-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ohXizjfAaR462L3eOhvMCvBzEMDgTc7BEV6UBo4dGE=;
 b=rmw4CxgmbUUZCVNJPr2fRPED5on9xKPuk91IF6HnoRTBX4k7DWvoaef+lOv5fkJVKG
 MRZVEjpKMnWv/O/qUKjnuH9zrJ6CWyr9GhrMyQGwfLOS22FGYGKaP5OQ4rhBCqJj7vcY
 t4v8R2e0dVLI6b5evLtAl2xBGeQqyHOdTEMTPxInrwAsm1ki+f/SSgVB9Sbmk9Sksg0F
 KZMnh5GO1dEoRFKgR9ha90drp3eiBrFaRR/8zIhjT6cqtAW16+LQiTUGtUD1IKgZn3Sr
 yncUJN1CVNivZTTSFeeMe/xsWvxfZsBf13nHUrQ1HuXxl1rXfEZMHI7pjULXVgBrf4hA
 9OKA==
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
Cc: emil.l.velikov@gmail.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBhdXRo
ZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSBy
ZW5kZXIKbm9kZS4KCkZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8gZGlzdGluY3Rpb24g
YmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgoKQ2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KQ2M6IEpvb255b3VuZyBT
aGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5r
aW1Ac2Ftc3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcu
Y29tPgpDYzogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+ClNp
Z25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0t
LQpHZW50cywgSSd2ZSBsb29rZWQgYXJvdW5kIGZvciB1c2Vyc3BhY2UgYW5kIGZvdW5kIG9ubHkg
bGliZHJtIC0gdGhlCmV4eW5vcyBsaWJyYXJ5ICsgc2ltcGxlIGFwcHMgYW5kIHRoZSBYIGRyaXZl
ci4gQWxsIG9mIHdoaWNoIGFyZSBzYWZlCndpdGggdGhpcyBwYXRjaC4KClBsZWFzZSBoYXZlIGEg
bG9vayB0aHJvdWdoIG90aGVyIHNvbWUgb3Blbi1zb3VyY2UgdXNlcnNwYWNlIHRoYXQgeW91Cmhh
dmUgYXJvdW5kLgoKVG9iaWFzLCB5b3UgbWVudGlvbmVkIHVzZXJzcGFjZSBwcm9qZWN0cyAobXB2
LCBsaWJyZXRybywgb3RoZXIpIHdoZXJlCnlvdSd2ZSBhZGRlZCBleHlub3MgYmFja2VuZC4gQ2Fu
IHlvdSBwbGVhc2UgY2hlY2sgdGhleSB3b3JrIGZpbmUgd2l0aAp0aGlzIHBhdGNoPwoKVGhhbmtz
CkVtaWwKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgfCAxOCAr
KysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jCmluZGV4IGUx
ZWY5ZGM5ZWJmMy4uYjQ2MWQ4OWFjY2ZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2Rydi5jCkBAIC04MSwyOSArODEsMjkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVy
YXRpb25zX3N0cnVjdCBleHlub3NfZHJtX2dlbV92bV9vcHMgPSB7CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgZXh5bm9zX2lvY3Rsc1tdID0gewogCURSTV9JT0NUTF9ERUZf
RFJWKEVYWU5PU19HRU1fQ1JFQVRFLCBleHlub3NfZHJtX2dlbV9jcmVhdGVfaW9jdGwsCi0JCQlE
Uk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAorCQkJRFJNX1JFTkRFUl9BTExPVyksCiAJRFJN
X0lPQ1RMX0RFRl9EUlYoRVhZTk9TX0dFTV9NQVAsIGV4eW5vc19kcm1fZ2VtX21hcF9pb2N0bCwK
LQkJCURSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQlEUk1fUkVOREVSX0FMTE9XKSwK
IAlEUk1fSU9DVExfREVGX0RSVihFWFlOT1NfR0VNX0dFVCwgZXh5bm9zX2RybV9nZW1fZ2V0X2lv
Y3RsLAogCQkJRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoRVhZTk9TX1ZJ
RElfQ09OTkVDVElPTiwgdmlkaV9jb25uZWN0aW9uX2lvY3RsLAogCQkJRFJNX0FVVEgpLAogCURS
TV9JT0NUTF9ERUZfRFJWKEVYWU5PU19HMkRfR0VUX1ZFUiwgZXh5bm9zX2cyZF9nZXRfdmVyX2lv
Y3RsLAotCQkJRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKKwkJCURSTV9SRU5ERVJfQUxM
T1cpLAogCURSTV9JT0NUTF9ERUZfRFJWKEVYWU5PU19HMkRfU0VUX0NNRExJU1QsIGV4eW5vc19n
MmRfc2V0X2NtZGxpc3RfaW9jdGwsCi0JCQlEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAor
CQkJRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoRVhZTk9TX0cyRF9FWEVD
LCBleHlub3NfZzJkX2V4ZWNfaW9jdGwsCi0JCQlEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cp
LAorCQkJRFJNX1JFTkRFUl9BTExPVyksCiAJRFJNX0lPQ1RMX0RFRl9EUlYoRVhZTk9TX0lQUF9H
RVRfUkVTT1VSQ0VTLAogCQkJZXh5bm9zX2RybV9pcHBfZ2V0X3Jlc19pb2N0bCwKLQkJCURSTV9B
VVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQlEUk1fUkVOREVSX0FMTE9XKSwKIAlEUk1fSU9D
VExfREVGX0RSVihFWFlOT1NfSVBQX0dFVF9DQVBTLCBleHlub3NfZHJtX2lwcF9nZXRfY2Fwc19p
b2N0bCwKLQkJCURSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCisJCQlEUk1fUkVOREVSX0FM
TE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihFWFlOT1NfSVBQX0dFVF9MSU1JVFMsCiAJCQlleHlu
b3NfZHJtX2lwcF9nZXRfbGltaXRzX2lvY3RsLAotCQkJRFJNX0FVVEggfCBEUk1fUkVOREVSX0FM
TE9XKSwKKwkJCURSTV9SRU5ERVJfQUxMT1cpLAogCURSTV9JT0NUTF9ERUZfRFJWKEVYWU5PU19J
UFBfQ09NTUlULCBleHlub3NfZHJtX2lwcF9jb21taXRfaW9jdGwsCi0JCQlEUk1fQVVUSCB8IERS
TV9SRU5ERVJfQUxMT1cpLAorCQkJRFJNX1JFTkRFUl9BTExPVyksCiB9OwogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBleHlub3NfZHJtX2RyaXZlcl9mb3BzID0gewotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
