Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6D26682
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 17:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131C689AC9;
	Wed, 22 May 2019 15:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDAE89AC9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 15:03:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 15so2572862wmg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 08:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LW/Ud+w+z0PxvG2JwRl1UYHPfxMf4hKL7DmvJrgwan4=;
 b=UKKyCsSyd+PBpDqbrVh+xSiFnkoq5OIRVSmCDB0lDN1c11fAnAoweAZhECfhA7L5lQ
 tzpBmJS7RZVGcrigDMysehcdoLzmAwuHSaT5u//qWaVG3cfvB8/B5lD0JIf7mKm4T+eR
 RmBhDh/COjl2gVVYMZr0eoViALQ7V0rYVOck+wAD+9Ou5pTA3+Kxoh6vFKWem0Qzq0FB
 l7Wyv38YneLZaAD5u/2W9HjNH/6FMCSooiw4RuFGnd6bj4+jhaixm7RIXjNddNC4WAPh
 GhtzMC0IF2RwxwdGJweFN9xj0vLKILD8yYs3yAW0KXhG7wvdJq5pZf2eUMNMPKXY3WC3
 1yvQ==
X-Gm-Message-State: APjAAAX6ohP8w+RMaHMbL9m3W502fMrx8n1SvfZsRPvybiIQZrslTCaE
 nePH7509LtB+quYCRnPg3HWF0aYI
X-Google-Smtp-Source: APXvYqzPtjy30OSXSrGKRXrvKTrZhtRPbImmfhf2h4TSvAvD4Q4hNqDdHPaDnKxY02EEceiZoFYZzA==
X-Received: by 2002:a1c:b3c3:: with SMTP id c186mr7836117wmf.93.1558537421731; 
 Wed, 22 May 2019 08:03:41 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l14sm21978468wrt.57.2019.05.22.08.03.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 08:03:40 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/omap: remove open-coded drm_invalid_op()
Date: Wed, 22 May 2019 16:02:18 +0100
Message-Id: <20190522150219.13913-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LW/Ud+w+z0PxvG2JwRl1UYHPfxMf4hKL7DmvJrgwan4=;
 b=NdZHS2h8+7MPlZFTi+5KPBGNrWwx3QLE7wQ+0yhuu5vGNGcoJByjSHT9aiTixjkgSN
 OFb/nWIP/VDZynzOqxLZOroTVyB+y9WPVsz5wrWbYedwuwFUPVtkxLYq0kATcp429jcU
 BESIbmiZeyDtVjC/RhaK7KYCiZ9j2FVtqTTDsMuQkVaZ+Xs7YlTSVry9oBs9k+N4k9p8
 QgZ1+oE6JYmohnzh6Vx0R4Xks5wyDw78iARWblDITJRm/isRCc056b6S1Ej46FRLNaya
 Nf8AR/pJfWKDqfq1orbgtU2V7wAmfhGR4aZQDa+hNce34oUY7A2sA9OV2zx92r91nmAc
 OsNw==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkNjOiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBFbWlsIFZl
bGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZHJ2LmMgfCAxNiArLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Ry
di5jCmluZGV4IDFiOWI2ZjVlNDhlMS4uNjcyZTBmOGFkMTFjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZHJ2LmMKQEAgLTQzOSwyMCArNDM5LDYgQEAgc3RhdGljIGludCBpb2N0bF9nZXRfcGFy
YW0oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlyZXR1cm4gMDsKIH0KIAot
c3RhdGljIGludCBpb2N0bF9zZXRfcGFyYW0oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKLQkJc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpCi17Ci0Jc3RydWN0IGRybV9vbWFw
X3BhcmFtICphcmdzID0gZGF0YTsKLQotCXN3aXRjaCAoYXJncy0+cGFyYW0pIHsKLQlkZWZhdWx0
OgotCQlEQkcoInVua25vd24gcGFyYW1ldGVyICVsbGQiLCBhcmdzLT5wYXJhbSk7Ci0JCXJldHVy
biAtRUlOVkFMOwotCX0KLQotCXJldHVybiAwOwotfQotCiAjZGVmaW5lIE9NQVBfQk9fVVNFUl9N
QVNLCTB4MDBmZmZmZmYJLyogZmxhZ3Mgc2V0dGFibGUgYnkgdXNlcnNwYWNlICovCiAKIHN0YXRp
YyBpbnQgaW9jdGxfZ2VtX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLApA
QCAtNDkyLDcgKzQ3OCw3IEBAIHN0YXRpYyBpbnQgaW9jdGxfZ2VtX2luZm8oc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lvY3RsX2Rl
c2MgaW9jdGxzW0RSTV9DT01NQU5EX0VORCAtIERSTV9DT01NQU5EX0JBU0VdID0gewogCURSTV9J
T0NUTF9ERUZfRFJWKE9NQVBfR0VUX1BBUkFNLCBpb2N0bF9nZXRfcGFyYW0sCiAJCQkgIERSTV9B
VVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCi0JRFJNX0lPQ1RMX0RFRl9EUlYoT01BUF9TRVRfUEFS
QU0sIGlvY3RsX3NldF9wYXJhbSwKKwlEUk1fSU9DVExfREVGX0RSVihPTUFQX1NFVF9QQVJBTSwg
ZHJtX2ludmFsaWRfb3AsCiAJCQkgIERSTV9BVVRIIHwgRFJNX01BU1RFUiB8IERSTV9ST09UX09O
TFkpLAogCURSTV9JT0NUTF9ERUZfRFJWKE9NQVBfR0VNX05FVywgaW9jdGxfZ2VtX25ldywKIAkJ
CSAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
