Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885CB38548
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E4289A62;
	Fri,  7 Jun 2019 07:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35758940F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:26 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id t16so443427pfe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WGN3NR4MW1WrYhidVDjbYDvKJj0rx7B3nDJpv9Q+YA=;
 b=YzmQI9rSdwzbv4lq4wWjvgil9vBC6YiW8JYMsshL9/vEIDHfGcuCdRQmi7rAOd8P2U
 ABO95PnBl33mRw10vPiBqM5XxmWvv85Ts7ve++dy+YRXN7HH4ohEiv2FUEBHpuZvt/Mf
 ioLe4p4hy926Rs1x3fZdZFeBgXK1dEe3SiyUpBzMrMpBH7tUQrH3NsBOmWla+kSbv4zy
 BWAy1AwlPOYCQ3GAKKuLbQt1IUSK48lCdhiR9Y6QVyEoVrV0FGCdonNeOkophxCVzkFH
 Hz5s2xNrf3iTaOb7CsPqfrs7TSYkfbpI4D3xJFvtsUbHlIqHiCYEz8ag5mj8cryZYKsr
 2puQ==
X-Gm-Message-State: APjAAAWSESdHkfjUwo1PRtrwN2txVX8lMNVjcvjnkcWwgBcnkB0lnJ1C
 5HhvvYa+2z4gSr2q5gjRwm5AAMUIRZ8=
X-Google-Smtp-Source: APXvYqwU9vZPupXHfV6OqLtCeF44EiP7wQdlEprMWLsFY4ri4V5gLX5//Mdu4gski656XyMb8F7wXw==
X-Received: by 2002:a17:90b:8d8:: with SMTP id
 ds24mr3391153pjb.135.1559882785793; 
 Thu, 06 Jun 2019 21:46:25 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:24 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/15] tc358767 driver improvements
Date: Thu,  6 Jun 2019 21:45:35 -0700
Message-Id: <20190607044550.13361-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WGN3NR4MW1WrYhidVDjbYDvKJj0rx7B3nDJpv9Q+YA=;
 b=qsROZ8XOJbENYyPYXdqw9bNV22BT8EHKoWsX/pyjAYa+sTVHTkXr25YmcOeO+yqF3f
 d6ODsYN5z2v83Yoy5/Yf4RI0RH1bda03HvVd3l+B+pf0mDfer+SXR09LVhPVA2OXCGQr
 qaaZ2E2KfrYzk2ebgA9uUf3cWV1ZBTXgMdwDErKTjLiovBKKVTbxOia69mc9OfzFxd+v
 g5IoDhVzSFUqx6gZ6NwqianM2g4JcqcEbCSDOLRek7tI6l6AFSGLnePIzTWKejJ1+TJB
 X4RoQm69PQ1sz9KsYVXzgz9jzJgVn0OUIXlAOykYBOdfHiVUahFLHrueCj574plpwHQX
 erKg==
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
ZXkgU21pcm5vdgoKQ2hhbmdlcyBzaW5jZSBbdjNdOgoKICAgIC0gQ29sbGVjdGVkIFJldmlld2Vk
LWJ5cyBmcm9tIEFuZHJ6ZWoKICAgIAogICAgLSBEcm9wcGVkIGV4cGxpY2l0IGNoZWNrIGZvciAt
RVRJTUVET1VUIGluICJkcm0vYnJpZGdlOiB0YzM1ODc2NzoKICAgICAgU2ltcGxpZnkgcG9sbGlu
ZyBpbiB0Y19tYWluX2xpbmtfc2V0dXAoKSIgZm9yIGNvbnNpc3RlbmN5CgogICAgLSBBVVggdHJh
bnNmZXIgY29kZSBjb252ZXJ0ZWQgdG8gdXNlciByZWdtYXBfcmF3X3JlYWQoKSwKICAgICAgcmVn
bWFwX3Jhd193cml0ZSgpCgpDaGFuZ2VzIHNpbmNlIFt2Ml06CgogICAgLSBQYXRjaHNldCByZWJh
c2VkIG9uIHRvcCBvZiB2NCBvZiBUb21pJ3Mgc2VyaWVzIHRoYXQgcmVjZW50bHkKICAgICAgd2Vu
dCBpbiAoaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODE3Ni8jcmV2
NSkKICAgICAgCiAgICAtIEFVWCB0cmFuc2ZlciBjb2RlIGNvbnZlcnRlZCB0byB1c2VyIHJlZ21h
cF9idWxrX3JlYWQoKSwKICAgICAgcmVnbWFwX2J1bGtfd3JpdGUoKQoKQ2hhbmdlcyBzaW5jZSBb
djFdOgoKICAgIC0gUGF0Y2hzZXQgcmViYXNlZCBvbiB0b3Agb2YKICAgICAgaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODE3Ni8KICAgICAgCiAgICAtIFBhdGNoZXMg
dG8gcmVtb3ZlIGJvdGggdGNfd3JpdGUoKSBhbmQgdGNfcmVhZCgpIGhlbHBlcnMgYWRkZWQKCiAg
ICAtIFBhdGNoZXMgdG8gcmV3b3JrIEFVWCB0cmFuc2ZlciBjb2RlIGFkZGVkCgogICAgLSBCb3Ro
ICJkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgcG9sbGluZyBpbgogICAgICB0Y19tYWlu
X2xpbmtfc2V0dXAoKSIgYW5kICJkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkKICAgICAg
cG9sbGluZyBpbiB0Y19saW5rX3RyYWluaW5nKCkiIGNoYW5nZWQgdG8gdXNlIHRjX3BvbGxfdGlt
ZW91dCgpCiAgICAgIGluc3RlYWQgb2YgcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KCkKClt2M10g
bGttbC5rZXJuZWwub3JnL3IvMjAxOTA2MDUwNzA1MDcuMTE0MTctMS1hbmRyZXcuc21pcm5vdkBn
bWFpbC5jb20KW3YyXSBsa21sLmtlcm5lbC5vcmcvci8yMDE5MDMyMjAzMjkwMS4xMjA0NS0xLWFu
ZHJldy5zbWlybm92QGdtYWlsLmNvbQpbdjFdIGxrbWwua2VybmVsLm9yZy9yLzIwMTkwMjI2MTkz
NjA5Ljk4NjItMS1hbmRyZXcuc21pcm5vdkBnbWFpbC5jb20KCkFuZHJleSBTbWlybm92ICgxNSk6
CiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IFNpbXBsaWZ5IHRjX3BvbGxfdGltZW91dCgpCiAgZHJt
L2JyaWRnZTogdGMzNTg3Njc6IFNpbXBsaWZ5IHBvbGxpbmcgaW4gdGNfbWFpbl9saW5rX3NldHVw
KCkKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgcG9sbGluZyBpbiB0Y19saW5rX3Ry
YWluaW5nKCkKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgdGNfc2V0X3ZpZGVvX21v
ZGUoKQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBEcm9wIGN1c3RvbSB0Y193cml0ZSgpL3RjX3Jl
YWQoKSBhY2Nlc3NvcnMKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgQVVYIGRhdGEg
cmVhZAogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeSBBVVggZGF0YSB3cml0ZQogIGRy
bS9icmlkZ2U6IHRjMzU4NzY3OiBJbmNyZWFzZSBBVVggdHJhbnNmZXIgbGVuZ3RoIGxpbWl0CiAg
ZHJtL2JyaWRnZTogdGMzNTg3Njc6IFVzZSByZXBvcnRlZCBBVVggdHJhbnNmZXIgc2l6ZQogIGRy
bS9icmlkZ2U6IHRjMzU4NzY3OiBBZGQgc3VwcG9ydCBmb3IgYWRkcmVzcy1vbmx5IEkyQyB0cmFu
c2ZlcnMKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogSW50cm9kdWNlIHRjX3NldF9zeXNwbGxwYXJh
bSgpCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IEludHJvZHVjZSB0Y19wbGx1cGRhdGVfcGxsZW4o
KQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeSB0Y19hdXhfd2FpdF9idXN5KCkKICBk
cm0vYnJpZGdlOiB0YzM1ODc2NzogRHJvcCB1bm5lY2Vzc2FyeSA4IGJ5dGUgYnVmZmVyCiAgZHJt
L2JyaWRnZTogdGMzNTg3Njc6IFJlcGxhY2UgbWFnaWMgbnVtYmVyIGluIHRjX21haW5fbGlua19l
bmFibGUoKQoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDY0OCArKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNzIgaW5zZXJ0aW9ucygr
KSwgMjc2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
