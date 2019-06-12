Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1C4335F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C036892D8;
	Thu, 13 Jun 2019 07:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EF4892D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id d30so8525431pgm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gSrUr04JKpLIpOwomhEOW56Uag0Ke/jp4vOdSmNT5bQ=;
 b=rokHGaEF5PcSEVlZlTaC/Arz76GjSDcPRIFK8HIuupkxV4HeUFs5Y/JtYPPAP3Wn/u
 UmNBp0th6HiI8Wb8bkPpyI7p5oFikadHBeG3g+zNFrceXIwz0nSmVHym9K0d1K/UIaDk
 HjI7hN6eJ5borQhxSPdzfxF+74jt5wSKZSkpGiamv5YZMYxLtK8PF9wYWxmlSSdjbpMS
 yL5XmU4FHCrBSsmSxRs0jTiGC371Hc3L6cfuQ1wcmk2odvoX+bmXgdAQILSy3j4b11bC
 0Ghq8X+RpV0q+5ZIbLDFgG36XiwwFdMdpdgJv8Y41B6rx8A5gYzRlYxYveky7CBV2Lsr
 JyhQ==
X-Gm-Message-State: APjAAAVTc7iw142hqXjLtFornDN1zLcTrAEuSBm2DyOCt8UM/JxLW70j
 qoY9hTuaV3wyrJjtL0G6aEZwcGa3Uvc=
X-Google-Smtp-Source: APXvYqzT5VWa0aU04CQjd4fZk88OgtGA8DIKZsZZPPIUSO8gik3ubA2W6EhNUG7OikMEye7/Q6NSDQ==
X-Received: by 2002:a63:570c:: with SMTP id l12mr24528172pgb.252.1560328383919; 
 Wed, 12 Jun 2019 01:33:03 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:03 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/15] tc358767 driver improvements
Date: Wed, 12 Jun 2019 01:32:37 -0700
Message-Id: <20190612083252.15321-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gSrUr04JKpLIpOwomhEOW56Uag0Ke/jp4vOdSmNT5bQ=;
 b=f9TVrYhBQ/zkEya2XKd2pjH3MjRqUwg7uD3yMnCmOsA7SHlmsUUON085Zmv/NPLNHB
 ONWQ3QSC2uMyH7UsZGTRCRHlqTVF1CSx++o9uDs3kiCrf14y72Lg1lKnmyLLmJDE9Ris
 mBa+LCFmyzbI0QOZfyDFirHmMnF2AKkLh1419cV85Be7g09IvkwBl/xQd6XP1i4LR8FA
 vXxp/J0Yk+/sVtbG9iTKaq2rwPcSJpu8/PKGohMf3VpNjQ4TuAACF7uCD3+K/qaq9bDU
 tx65e9M5g2yv8SMo6w24Ih+eIh25mQqqIUiY9IZbT6hrAhqfXbY1FzJSgGULwptRT+sf
 R/xA==
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
ZXkgU21pcm5vdgoKQ2hhbmdlcyBzaW5jZSBbdjRdOgoKICAgIC0gdGNfcGxsdXBkYXRlX3BsbGVu
KCkgcmVuYW1lZCB0byB0Y19wbGx1cGRhdGUoKQoKICAgIC0gQ29sbGVjdGVkIFJldmlld2VkLWJ5
cyBmcm9tIEFuZHJ6ZWogZm9yIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMKCkNoYW5nZXMgc2luY2Ug
W3YzXToKCiAgICAtIENvbGxlY3RlZCBSZXZpZXdlZC1ieXMgZnJvbSBBbmRyemVqCiAgICAKICAg
IC0gRHJvcHBlZCBleHBsaWNpdCBjaGVjayBmb3IgLUVUSU1FRE9VVCBpbiAiZHJtL2JyaWRnZTog
dGMzNTg3Njc6CiAgICAgIFNpbXBsaWZ5IHBvbGxpbmcgaW4gdGNfbWFpbl9saW5rX3NldHVwKCki
IGZvciBjb25zaXN0ZW5jeQoKICAgIC0gQVVYIHRyYW5zZmVyIGNvZGUgY29udmVydGVkIHRvIHVz
ZXIgcmVnbWFwX3Jhd19yZWFkKCksCiAgICAgIHJlZ21hcF9yYXdfd3JpdGUoKQoKQ2hhbmdlcyBz
aW5jZSBbdjJdOgoKICAgIC0gUGF0Y2hzZXQgcmViYXNlZCBvbiB0b3Agb2YgdjQgb2YgVG9taSdz
IHNlcmllcyB0aGF0IHJlY2VudGx5CiAgICAgIHdlbnQgaW4gKGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTgxNzYvI3JldjUpCiAgICAgIAogICAgLSBBVVggdHJhbnNm
ZXIgY29kZSBjb252ZXJ0ZWQgdG8gdXNlciByZWdtYXBfYnVsa19yZWFkKCksCiAgICAgIHJlZ21h
cF9idWxrX3dyaXRlKCkKCkNoYW5nZXMgc2luY2UgW3YxXToKCiAgICAtIFBhdGNoc2V0IHJlYmFz
ZWQgb24gdG9wIG9mCiAgICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvNTgxNzYvCiAgICAgIAogICAgLSBQYXRjaGVzIHRvIHJlbW92ZSBib3RoIHRjX3dyaXRlKCkg
YW5kIHRjX3JlYWQoKSBoZWxwZXJzIGFkZGVkCgogICAgLSBQYXRjaGVzIHRvIHJld29yayBBVVgg
dHJhbnNmZXIgY29kZSBhZGRlZAoKICAgIC0gQm90aCAiZHJtL2JyaWRnZTogdGMzNTg3Njc6IFNp
bXBsaWZ5IHBvbGxpbmcgaW4KICAgICAgdGNfbWFpbl9saW5rX3NldHVwKCkiIGFuZCAiZHJtL2Jy
aWRnZTogdGMzNTg3Njc6IFNpbXBsaWZ5CiAgICAgIHBvbGxpbmcgaW4gdGNfbGlua190cmFpbmlu
ZygpIiBjaGFuZ2VkIHRvIHVzZSB0Y19wb2xsX3RpbWVvdXQoKQogICAgICBpbnN0ZWFkIG9mIHJl
Z21hcF9yZWFkX3BvbGxfdGltZW91dCgpCgpbdjRdIGxrbWwua2VybmVsLm9yZy9yLzIwMTkwNjA3
MDQ0NTUwLjEzMzYxLTEtYW5kcmV3LnNtaXJub3ZAZ21haWwuY29tClt2M10gbGttbC5rZXJuZWwu
b3JnL3IvMjAxOTA2MDUwNzA1MDcuMTE0MTctMS1hbmRyZXcuc21pcm5vdkBnbWFpbC5jb20KW3Yy
XSBsa21sLmtlcm5lbC5vcmcvci8yMDE5MDMyMjAzMjkwMS4xMjA0NS0xLWFuZHJldy5zbWlybm92
QGdtYWlsLmNvbQpbdjFdIGxrbWwua2VybmVsLm9yZy9yLzIwMTkwMjI2MTkzNjA5Ljk4NjItMS1h
bmRyZXcuc21pcm5vdkBnbWFpbC5jb20KCkFuZHJleSBTbWlybm92ICgxNSk6CiAgZHJtL2JyaWRn
ZTogdGMzNTg3Njc6IFNpbXBsaWZ5IHRjX3BvbGxfdGltZW91dCgpCiAgZHJtL2JyaWRnZTogdGMz
NTg3Njc6IFNpbXBsaWZ5IHBvbGxpbmcgaW4gdGNfbWFpbl9saW5rX3NldHVwKCkKICBkcm0vYnJp
ZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgcG9sbGluZyBpbiB0Y19saW5rX3RyYWluaW5nKCkKICBk
cm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgdGNfc2V0X3ZpZGVvX21vZGUoKQogIGRybS9i
cmlkZ2U6IHRjMzU4NzY3OiBEcm9wIGN1c3RvbSB0Y193cml0ZSgpL3RjX3JlYWQoKSBhY2Nlc3Nv
cnMKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogU2ltcGxpZnkgQVVYIGRhdGEgcmVhZAogIGRybS9i
cmlkZ2U6IHRjMzU4NzY3OiBTaW1wbGlmeSBBVVggZGF0YSB3cml0ZQogIGRybS9icmlkZ2U6IHRj
MzU4NzY3OiBJbmNyZWFzZSBBVVggdHJhbnNmZXIgbGVuZ3RoIGxpbWl0CiAgZHJtL2JyaWRnZTog
dGMzNTg3Njc6IFVzZSByZXBvcnRlZCBBVVggdHJhbnNmZXIgc2l6ZQogIGRybS9icmlkZ2U6IHRj
MzU4NzY3OiBBZGQgc3VwcG9ydCBmb3IgYWRkcmVzcy1vbmx5IEkyQyB0cmFuc2ZlcnMKICBkcm0v
YnJpZGdlOiB0YzM1ODc2NzogSW50cm9kdWNlIHRjX3NldF9zeXNwbGxwYXJhbSgpCiAgZHJtL2Jy
aWRnZTogdGMzNTg3Njc6IEludHJvZHVjZSB0Y19wbGx1cGRhdGUoKQogIGRybS9icmlkZ2U6IHRj
MzU4NzY3OiBTaW1wbGlmeSB0Y19hdXhfd2FpdF9idXN5KCkKICBkcm0vYnJpZGdlOiB0YzM1ODc2
NzogRHJvcCB1bm5lY2Vzc2FyeSA4IGJ5dGUgYnVmZmVyCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6
IFJlcGxhY2UgbWFnaWMgbnVtYmVyIGluIHRjX21haW5fbGlua19lbmFibGUoKQoKIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDY0OCArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNzIgaW5zZXJ0aW9ucygrKSwgMjc2IGRlbGV0aW9ucygt
KQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
