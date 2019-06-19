Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E64B2DD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E1B6E2E4;
	Wed, 19 Jun 2019 07:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0C16E293
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:33 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id k8so5727403plt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r96RXcx0qK4dSLyydqVxx5Qg6T7ocvW76D16O15OAj8=;
 b=fHnevu3fGRKo85NOu0jHOQ53Ox68rIErjqsJMZfM7vzrE8nApp+1ySqEit25PiCK4w
 TXsc4vX05i5B8oJbwpKym2Ub6J2qnp2lFvvOkoL3o0vFWkw+dlTeirnt3vLOdLozHy8s
 dik3baCMYx96YUVmdSNfMPbgY3v6aaRcR3ElYgqcFF/v6Cy3sVBquPhVhn0qoTYKIHwg
 jNyezyM+ybfY17O7x6lpgcpsWsH4K03qSfubRI87+94xO9ctGFUAS7mmOFlbH9Xd4MfH
 yFqFum8TLAj0i6NGqsPJbvpC9ewXSIePF4JrXT28JoO3oMUKwvae2RW9fUVvhEReOarq
 QyjQ==
X-Gm-Message-State: APjAAAW60u0JXzk0VubnFHhGbIg2SHPwhw1ZQszsYI3gGzQfmjYQStjQ
 MjyFEDR5DWu59yjHdeTwuncDpbgKgrM=
X-Google-Smtp-Source: APXvYqzendITaoqu8TWhn3geMSiN8kTHOHsa+u+ZzcAkHKGvwtNQ3TxVx3HOPtVjhZksup7nLGRj/A==
X-Received: by 2002:a17:902:8649:: with SMTP id
 y9mr40104814plt.289.1560922052461; 
 Tue, 18 Jun 2019 22:27:32 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:31 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 00/15] tc358767 driver improvements
Date: Tue, 18 Jun 2019 22:27:01 -0700
Message-Id: <20190619052716.16831-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r96RXcx0qK4dSLyydqVxx5Qg6T7ocvW76D16O15OAj8=;
 b=Hs5C14Tq40it0FE0YaoL9PhrcAKDTvTmlkZ/G/ZiHFHD3E2SAGd9h4BjVYeclCFYea
 PWVUjc49ShDDrapL+B7Sky97yGc/gOcZJkkGj0/bn7NtZ171IXH2L0szgUBUe1dYz9g4
 St9p7tjppOH8R5lSh/32h/d8+UW7sVlVrsP43zDFXCxJ9w0DZAW6yCh6eeWiggM1NWA4
 hqssV8ylp5zMwvNpMkok+lByfDtg4mSKJKSi/wYx7Ic1GjL+73/bdnqzMhQhL31HyG21
 OHpQTFGoquBHS5xAPCmwPzST8JKscW7kp0vy+tqICNc3ZNh0kib6V1ZLAan4gtjg2tKx
 +M1g==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
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
ZXkgU21pcm5vdgoKQ2hhbmdlcyBzaW5jZSBbdjVdOgoKICAgIC0gRml4ZWQgcmVncmVzc2lvbiBp
biAiZHJtL2JyaWRnZTogdGMzNTg3Njc6IEFkZCBzdXBwb3J0IGZvcgogICAgICBhZGRyZXNzLW9u
bHkgSTJDIHRyYW5zZmVycyIgdGhhdCBicm9rZSBFRElEIHJlYWRpbmcKCiAgICAtIE1vdmVkIHNh
aWQgcGF0Y2ggdG8gYmUgdGhlIGxhc3QgaW4gY2FzZSBpdCBpcyBzdGlsbCBjYXVzaW5nCiAgICAg
IHByb2JsZW1zIGFuZCBuZWVkcyB0byBiZSBkcm9wcGVkCgpDaGFuZ2VzIHNpbmNlIFt2NF06Cgog
ICAgLSB0Y19wbGx1cGRhdGVfcGxsZW4oKSByZW5hbWVkIHRvIHRjX3BsbHVwZGF0ZSgpCgogICAg
LSBDb2xsZWN0ZWQgUmV2aWV3ZWQtYnlzIGZyb20gQW5kcnplaiBmb3IgdGhlIHJlc3Qgb2YgdGhl
IHNlcmllcwoKQ2hhbmdlcyBzaW5jZSBbdjNdOgoKICAgIC0gQ29sbGVjdGVkIFJldmlld2VkLWJ5
cyBmcm9tIEFuZHJ6ZWoKICAgIAogICAgLSBEcm9wcGVkIGV4cGxpY2l0IGNoZWNrIGZvciAtRVRJ
TUVET1VUIGluICJkcm0vYnJpZGdlOiB0YzM1ODc2NzoKICAgICAgU2ltcGxpZnkgcG9sbGluZyBp
biB0Y19tYWluX2xpbmtfc2V0dXAoKSIgZm9yIGNvbnNpc3RlbmN5CgogICAgLSBBVVggdHJhbnNm
ZXIgY29kZSBjb252ZXJ0ZWQgdG8gdXNlciByZWdtYXBfcmF3X3JlYWQoKSwKICAgICAgcmVnbWFw
X3Jhd193cml0ZSgpCgpDaGFuZ2VzIHNpbmNlIFt2Ml06CgogICAgLSBQYXRjaHNldCByZWJhc2Vk
IG9uIHRvcCBvZiB2NCBvZiBUb21pJ3Mgc2VyaWVzIHRoYXQgcmVjZW50bHkKICAgICAgd2VudCBp
biAoaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODE3Ni8jcmV2NSkK
ICAgICAgCiAgICAtIEFVWCB0cmFuc2ZlciBjb2RlIGNvbnZlcnRlZCB0byB1c2VyIHJlZ21hcF9i
dWxrX3JlYWQoKSwKICAgICAgcmVnbWFwX2J1bGtfd3JpdGUoKQoKQ2hhbmdlcyBzaW5jZSBbdjFd
OgoKICAgIC0gUGF0Y2hzZXQgcmViYXNlZCBvbiB0b3Agb2YKICAgICAgaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODE3Ni8KICAgICAgCiAgICAtIFBhdGNoZXMgdG8g
cmVtb3ZlIGJvdGggdGNfd3JpdGUoKSBhbmQgdGNfcmVhZCgpIGhlbHBlcnMgYWRkZWQKCiAgICAt
IFBhdGNoZXMgdG8gcmV3b3JrIEFVWCB0cmFuc2ZlciBjb2RlIGFkZGVkCgogICAgLSBCb3RoICJk
cm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgcG9sbGluZyBpbgogICAgICB0Y19tYWluX2xp
bmtfc2V0dXAoKSIgYW5kICJkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkKICAgICAgcG9s
bGluZyBpbiB0Y19saW5rX3RyYWluaW5nKCkiIGNoYW5nZWQgdG8gdXNlIHRjX3BvbGxfdGltZW91
dCgpCiAgICAgIGluc3RlYWQgb2YgcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KCkKClt2NV0gbGtt
bC5rZXJuZWwub3JnL3IvMjAxOTA2MTIwODMyNTIuMTUzMjEtMS1hbmRyZXcuc21pcm5vdkBnbWFp
bC5jb20KW3Y0XSBsa21sLmtlcm5lbC5vcmcvci8yMDE5MDYwNzA0NDU1MC4xMzM2MS0xLWFuZHJl
dy5zbWlybm92QGdtYWlsLmNvbQpbdjNdIGxrbWwua2VybmVsLm9yZy9yLzIwMTkwNjA1MDcwNTA3
LjExNDE3LTEtYW5kcmV3LnNtaXJub3ZAZ21haWwuY29tClt2Ml0gbGttbC5rZXJuZWwub3JnL3Iv
MjAxOTAzMjIwMzI5MDEuMTIwNDUtMS1hbmRyZXcuc21pcm5vdkBnbWFpbC5jb20KW3YxXSBsa21s
Lmtlcm5lbC5vcmcvci8yMDE5MDIyNjE5MzYwOS45ODYyLTEtYW5kcmV3LnNtaXJub3ZAZ21haWwu
Y29tCgpBbmRyZXkgU21pcm5vdiAoMTUpOgogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlm
eSB0Y19wb2xsX3RpbWVvdXQoKQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeSBwb2xs
aW5nIGluIHRjX21haW5fbGlua19zZXR1cCgpCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IFNpbXBs
aWZ5IHBvbGxpbmcgaW4gdGNfbGlua190cmFpbmluZygpCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6
IFNpbXBsaWZ5IHRjX3NldF92aWRlb19tb2RlKCkKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogRHJv
cCBjdXN0b20gdGNfd3JpdGUoKS90Y19yZWFkKCkgYWNjZXNzb3JzCiAgZHJtL2JyaWRnZTogdGMz
NTg3Njc6IFNpbXBsaWZ5IEFVWCBkYXRhIHJlYWQKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2lt
cGxpZnkgQVVYIGRhdGEgd3JpdGUKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogSW5jcmVhc2UgQVVY
IHRyYW5zZmVyIGxlbmd0aCBsaW1pdAogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBVc2UgcmVwb3J0
ZWQgQVVYIHRyYW5zZmVyIHNpemUKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogSW50cm9kdWNlIHRj
X3NldF9zeXNwbGxwYXJhbSgpCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IEludHJvZHVjZSB0Y19w
bGx1cGRhdGUoKQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeSB0Y19hdXhfd2FpdF9i
dXN5KCkKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogRHJvcCB1bm5lY2Vzc2FyeSA4IGJ5dGUgYnVm
ZmVyCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IFJlcGxhY2UgbWFnaWMgbnVtYmVyIGluIHRjX21h
aW5fbGlua19lbmFibGUoKQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBBZGQgc3VwcG9ydCBmb3Ig
YWRkcmVzcy1vbmx5IEkyQyB0cmFuc2ZlcnMKCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMgfCA2NTEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMzc2IGluc2VydGlvbnMoKyksIDI3NSBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
