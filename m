Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B76357D1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B5895C4;
	Wed,  5 Jun 2019 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E0A89362
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:22 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id t16so5473192pfe.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnB/qPlcBVS1MiWf1Hu4nd4BnRwaadmudJ8+dogX3yE=;
 b=CVlI1ozSBO4cwiDyG1gH9tziaELgpYzKBBBFy4CMPrEtH+6OGu8eMOxYDCwRXSb/cl
 9+0nIfrvC5nXnyZ6Jw3rrOc278XzhDOgaTv27JQ+G2repKhzH/viIZYpE2PxpIf5yGWd
 UupIeqE7LQ9lc8LU8J3huEiM1DTm8pAag/fE1MWLDuQnq3Wf0b1wtt/xiufkjh5AWdzu
 j7qkU4Rr0eQxIfySEV319IJOZEOu9I71sICaxHcFmDHi39GPIyFBWWeBQFYu8fi5sA8f
 ikrgfIyqt7E+j6wlrY7y3ZIaL573efePTGu0VHm1lmMUe66RCmY+u54u7WM2omv+Ylnt
 qU+A==
X-Gm-Message-State: APjAAAXPI2ZsexNo8u/iBFhFpYJRuHXjh+CIc+yS74dmQLPRFi0LFjfa
 d5Gk6Fez+0lOgQX2SZpSek/1KV9F4jA=
X-Google-Smtp-Source: APXvYqxAyrt1q/R4SqiAji7XsTO61D4Lt92UY1lYf8hWESYxYph2ZgQKB++u5GJd3c4+kK09f2fGwA==
X-Received: by 2002:a63:eb0a:: with SMTP id t10mr2202889pgh.99.1559718321838; 
 Wed, 05 Jun 2019 00:05:21 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:20 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/15] tc358767 driver improvements
Date: Wed,  5 Jun 2019 00:04:52 -0700
Message-Id: <20190605070507.11417-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnB/qPlcBVS1MiWf1Hu4nd4BnRwaadmudJ8+dogX3yE=;
 b=RMx/P5RtZ+Kl66yQ52r1XgqEli3o9Rs7lILVOMVTCEPCdSkIp4K9237cxsJcgu5xQk
 5LcryYeX386IS5I7mdPCRMMYgAu/4+wSur+T5ziRnBZ/GRpsKdA9n5wSEE05CbDJszX7
 daC81Dev6VZ6kAH1/8N1esEpcVQK+45xBaXFYujYwgNWAjRbFOPH8I4PgAPZJ7vk7M+2
 vyxX/UcnL42bBGS2b9xYsfPvajuKIJPbK/ArUp9iLZR9nV6Zl7s/tuVElKfhG2GIod7K
 YMDYSnS/ZClOnXJ6r1wpHJvQfKLVIBtZcuA25Es/hplWU+7RTAq+Vt68I+a4zvXrsplP
 HZUg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlcnlvbmU6CgpUaGlzIHNlcmllcyBjb250YWlucyB2YXJpb3VzIGltcHJvdmVtZW50cyAoYXQg
bGVhc3QgaW4gbXkgbWluZCkgYW5kCmZpeGVzIHRoYXQgSSBtYWRlIHRvIHRjMzU4NzY3IHdoaWxl
IHdvcmtpbmcgd2l0aCB0aGUgY29kZSBvZiB0aGUKZHJpdmVyLiBIb3BlZnVseSBlYWNoIHBhdGNo
IGlzIHNlbGYgZXhwbGFuYXRvcnkuCgpGZWVkYmFjayBpcyB3ZWxjb21lIQoKVGhhbmtzLApBbmRy
ZXkgU21pcm5vdgoKQ2hhbmdlcyBzaW5jZSBbdjJdOgoKICAgIC0gUGF0Y2hzZXQgcmViYXNlZCBv
biB0b3Agb2YgdjQgb2YgVG9taSdzIHNlcmllcyB0aGF0IHJlY2VudGx5CiAgICAgIHdlbnQgaW4g
KGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTgxNzYvI3JldjUpCiAg
ICAgIAogICAtIEFVWCB0cmFuc2ZlciBjb2RlIGNvbnZlcnRlZCB0byB1c2VyIHJlZ21hcF9idWxr
X3JlYWQoKSwKICAgICByZWdtYXBfYnVsa193cml0ZSgpCgpDaGFuZ2VzIHNpbmNlIFt2MV06Cgog
ICAgLSBQYXRjaHNldCByZWJhc2VkIG9uIHRvcCBvZgogICAgICBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4MTc2LwogICAgICAKICAgIC0gUGF0Y2hlcyB0byByZW1v
dmUgYm90aCB0Y193cml0ZSgpIGFuZCB0Y19yZWFkKCkgaGVscGVycyBhZGRlZAoKICAgIC0gUGF0
Y2hlcyB0byByZXdvcmsgQVVYIHRyYW5zZmVyIGNvZGUgYWRkZWQKCiAgICAtIEJvdGggImRybS9i
cmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeSBwb2xsaW5nIGluCiAgICAgIHRjX21haW5fbGlua19z
ZXR1cCgpIiBhbmQgImRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeQogICAgICBwb2xsaW5n
IGluIHRjX2xpbmtfdHJhaW5pbmcoKSIgY2hhbmdlZCB0byB1c2UgdGNfcG9sbF90aW1lb3V0KCkK
ICAgICAgaW5zdGVhZCBvZiByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoKQoKW3YyXSBsa21sLmtl
cm5lbC5vcmcvci8yMDE5MDMyMjAzMjkwMS4xMjA0NS0xLWFuZHJldy5zbWlybm92QGdtYWlsLmNv
bQpbdjFdIGxrbWwua2VybmVsLm9yZy9yLzIwMTkwMjI2MTkzNjA5Ljk4NjItMS1hbmRyZXcuc21p
cm5vdkBnbWFpbC5jb20KCgpBbmRyZXkgU21pcm5vdiAoMTUpOgogIGRybS9icmlkZ2U6IHRjMzU4
NzY3OiBTaW1wbGlmeSB0Y19wb2xsX3RpbWVvdXQoKQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBT
aW1wbGlmeSBwb2xsaW5nIGluIHRjX21haW5fbGlua19zZXR1cCgpCiAgZHJtL2JyaWRnZTogdGMz
NTg3Njc6IFNpbXBsaWZ5IHBvbGxpbmcgaW4gdGNfbGlua190cmFpbmluZygpCiAgZHJtL2JyaWRn
ZTogdGMzNTg3Njc6IFNpbXBsaWZ5IHRjX3NldF92aWRlb19tb2RlKCkKICBkcm0vYnJpZGdlOiB0
YzM1ODc2NzogRHJvcCBjdXN0b20gdGNfd3JpdGUoKS90Y19yZWFkKCkgYWNjZXNzb3JzCiAgZHJt
L2JyaWRnZTogdGMzNTg3Njc6IFNpbXBsaWZ5IEFVWCBkYXRhIHJlYWQKICBkcm0vYnJpZGdlOiB0
YzM1ODc2NzogU2ltcGxpZnkgQVVYIGRhdGEgd3JpdGUKICBkcm0vYnJpZGdlOiB0YzM1ODc2Nzog
SW5jcmVhc2UgQVVYIHRyYW5zZmVyIGxlbmd0aCBsaW1pdAogIGRybS9icmlkZ2U6IHRjMzU4NzY3
OiBVc2UgcmVwb3J0ZWQgQVVYIHRyYW5zZmVyIHNpemUKICBkcm0vYnJpZGdlOiB0YzM1ODc2Nzog
QWRkIHN1cHBvcnQgZm9yIGFkZHJlc3Mtb25seSBJMkMgdHJhbnNmZXJzCiAgZHJtL2JyaWRnZTog
dGMzNTg3Njc6IEludHJvZHVjZSB0Y19zZXRfc3lzcGxscGFyYW0oKQogIGRybS9icmlkZ2U6IHRj
MzU4NzY3OiBJbnRyb2R1Y2UgdGNfcGxsdXBkYXRlX3BsbGVuKCkKICBkcm0vYnJpZGdlOiB0YzM1
ODc2NzogU2ltcGxpZnkgdGNfYXV4X3dhaXRfYnVzeSgpCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6
IERyb3AgdW5uZWNlc3NhcnkgOCBieXRlIGJ1ZmZlcgogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBS
ZXBsYWNlIG1hZ2ljIG51bWJlciBpbiB0Y19tYWluX2xpbmtfZW5hYmxlKCkKCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCA2NjggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzkyIGluc2VydGlvbnMoKyksIDI3NiBkZWxldGlvbnMoLSkK
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
