Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A81F1BF0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297776EDF1;
	Wed,  6 Nov 2019 17:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EA06EDF0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:01:09 +0000 (UTC)
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXs8PvtBNfIQ=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id e07688vA6H12hLp
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 6 Nov 2019 18:01:02 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] drm/mcde: DSI video mode fixes
Date: Wed,  6 Nov 2019 17:58:28 +0100
Message-Id: <20191106165835.2863-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573059666; 
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=S1CYtW/UKvourRGitE9tLFPWLqns2bi9wjMLuuoA2Yo=;
 b=dTPO4WMUPfqCabQeKXmey4p2IJWew4vwvwi9WTFLG/7ws8au7vUJ0Gm8ft3yzua5el
 shGIVxJYqsC1bdgj/o+/Xb8shjfl/3ILeJE6uEjhBSKk38n8o5wQKZbWCc7DqeyV6yx/
 bbmW5wg8fOaSJP6F1XDlwHwz8erlwN3VITd94q4wfEcZQePk7Ausc6UxQC+Y3kiICM80
 sXicvN5wmSZqe3ZvzY+gSaXJOpq8WYyC1/0no9cPr2btUASHT7YHcAT+XaCpN8qbnhA1
 yhr8HT8fSw8Lo4lrUoeAerecIjq/ujwzgyNTNkdTvmdUbHILqYhvg0tSgdKkY5LdjQrZ
 A30Q==
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
Cc: David Airlie <airlied@linux.ie>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIGNvbGxlY3Rpb24gb2YgZml4ZXMgdG8gbWFrZSBEU0kgdmlkZW8gbW9kZSB3b3Jr
IGJldHRlcgp1c2luZyB0aGUgTUNERSBkcml2ZXIuIFdpdGggdGhlc2UgY2hhbmdlcywgTUNERSBh
cHBlYXJzIHRvIHdvcmsKcHJvcGVybHkgZm9yIHRoZSB2aWRlbyBtb2RlIHBhbmVsIEkgaGF2ZSBi
ZWVuIHRlc3Rpbmcgd2l0aC4KCk5vdGU6IFRoZSBwYXRjaCB0aGF0IGZpeGVzIHRoZSBEU0kgbGlu
ayByZWdpc3RlciBzZXR1cCBmb3IKdmlkZW8gbW9kZSBbMV0gaXMgc3RpbGwgbmVjZXNzYXJ5OyBi
dXQgd2Ugc3RpbGwgbmVlZCB0byBmaW5pc2ggaXQKYW5kIGFjdHVhbGx5IG1ha2UgaXQgaW5pdGlh
bGl6ZSBhIHBhbmVsIGNvcnJlY3RseS4KClRoaXMgc2VyaWVzIGNvbnRhaW5zIG9ubHkgcGF0Y2hl
cyBmb3IgdGhlIG90aGVyIHBhcnRzIGluIE1DREUuCkkgaGF2ZSB0ZXN0ZWQgaXQgYnkgZGlzYWJs
aW5nIG1vc3Qgb2YgdGhlIHJlZ2lzdGVyIHNldHVwIGluIHRoZQpEU0kgZHJpdmVyLCB3aGljaCBt
YWtlcyBpdCByZS11c2UgdGhlIHByb3Blcmx5IHdvcmtpbmcgRFNJIHJlZ2lzdGVyCnNldCBieSB0
aGUgYm9vdGxvYWRlci4KClsxXTogaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2
ZXMvZHJpLWRldmVsLzIwMTktT2N0b2Jlci8yMzgxNzUuaHRtbAoKU3RlcGhhbiBHZXJob2xkICg3
KToKICBkcm0vbWNkZTogUHJvdmlkZSB2YmxhbmsgaGFuZGxpbmcgdW5jb25kaXRpb25hbGx5CiAg
ZHJtL21jZGU6IEZpeCBmcmFtZSBzeW5jIHNldHVwIGZvciB2aWRlbyBtb2RlIHBhbmVscwogIGRy
bS9tY2RlOiBkc2k6IE1ha2UgdmlkZW8gbW9kZSBlcnJvcnMgbW9yZSB2ZXJib3NlCiAgZHJtL21j
ZGU6IGRzaTogRGVsYXkgc3RhcnQgb2YgdmlkZW8gc3RyZWFtIGdlbmVyYXRvcgogIGRybS9tY2Rl
OiBkc2k6IEZpeCBkdXBsaWNhdGVkIERTSSBjb25uZWN0b3IKICBkcm0vbWNkZTogZHNpOiBFbmFi
bGUgY2xvY2tzIGluIHByZV9lbmFibGUoKSBpbnN0ZWFkIG9mIG1vZGVfc2V0KCkKICBkcm0vbWNk
ZTogSGFuZGxlIHBlbmRpbmcgdmJsYW5rIHdoaWxlIGRpc2FibGluZyBkaXNwbGF5CgogZHJpdmVy
cy9ncHUvZHJtL21jZGUvbWNkZV9kaXNwbGF5LmMgIHwgIDU3ICsrKysrLS0tLQogZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kcm0uaCAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tY2Rl
L21jZGVfZHJ2LmMgICAgICB8ICAxOCArLS0KIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNp
LmMgICAgICB8IDE2NyArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tY2RlL21jZGVfZHNpX3JlZ3MuaCB8ICAxMCArKwogNSBmaWxlcyBjaGFuZ2VkLCAxMjYgaW5z
ZXJ0aW9ucygrKSwgMTI3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
