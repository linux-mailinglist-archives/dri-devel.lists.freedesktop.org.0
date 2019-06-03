Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB3325B7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 02:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4318A897C5;
	Mon,  3 Jun 2019 00:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F45897C5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 00:40:27 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id s15so7488963qtk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 17:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QsCqd2yLAm3v/y2LK2Q0yUQr1xp94e7dvfP1P+lbuqo=;
 b=YLtu7ENPGXBJUCOVxrfHq9Na3aq4M2uCh9hKUUOXJexouakm/Z447mK6Hh/BsVpUp0
 R0UUG0S8OLrqd3GxhlhUHRkyHueejf3Nbl3ePqT+HU3JFS358HcEHYcgsZUbf8huu3Df
 kZWqFTL/9cFk/7PA3DXh0WhxCVA9rgLlk6oSK/VcyFNeRzGzz1T5DaUYcZmipMIRFVJa
 0qviKCkwHejB783IBvqwIOzWaRgLebfQmMuEMHERLSHEB8GEawBMZ8gDChNe1mZOjSvx
 dMqcKYBpq73cLyUl9kijBZ0RKmHOaFzGn488KUc45nhhQqDLhH1MOOapuvQw9yeXCF+n
 vtsQ==
X-Gm-Message-State: APjAAAXMFkK/YmK7Zl3N1dDrIkTcBBaok6HGZjHAw0yN7BjCWlR8gYu1
 p8egcm7iCZyPcgOCOmjC+S5wNzu30C4=
X-Google-Smtp-Source: APXvYqxmf28aUujqfd45wMlNnP8CkCJJ9B5cEg6oMP7ac8PFHevjhOx5lG10KiLwpO8n0jqeueF9EA==
X-Received: by 2002:ac8:48c8:: with SMTP id l8mr19936420qtr.20.1559522425901; 
 Sun, 02 Jun 2019 17:40:25 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id t8sm1432609qtc.80.2019.06.02.17.40.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 17:40:25 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 00/10] Add C8, 30bpp and FP16 support to modetest
Date: Sun,  2 Jun 2019 20:40:08 -0400
Message-Id: <20190603004017.7114-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QsCqd2yLAm3v/y2LK2Q0yUQr1xp94e7dvfP1P+lbuqo=;
 b=gUOYLfP3Vu6/bp5QI5fuBQfsYr7EkV1gfYtmtVU4VHUX0qYGY/pliqZunNrv7d3SCY
 KFncaJdhPnFNEWIzWQ5kZGsVx7RPYmIcCG536jDsZzNPr0x03d92S8ROKs4q9Wt3b8tM
 12e57H24ljyG2k/qhu4V+9sCeZPwics/4H8Ciucupdymx1QpzdrmiTrxPRYCetPlsZ7i
 faloP/11xLkyeDHQ2j527uKoEIzNftId6TikCinEzkrQcGJHjvg69Xea9cwxyO1GVuE1
 x0awKtmBgBcf+4nyfBcygDhfNi9hzuXPBfeeqGRO+PUFDBDgEZVE2MmsYu/JSF9JGRbg
 Hmww==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIHBhdHRlcm4gZ2VuZXJhdGlvbiBsb2dpYyB0byBzdXBw
b3J0IGFkZGl0aW9uYWwKZm9ybWF0cywgYXMgd2VsbCBhcyBhIG5ldyAiZ3JhZGllbnQiIHBhdHRl
cm4gKHNlZSBwYXRjaCBjb21tZW50cyBvbiB3aHkKSSBmb3VuZCBpdCB1c2VmdWwpLgoKRnVydGhl
cm1vcmUsIHRoZXNlIGZvcm1hdHMgYXJlIHBpcGVkIHRocm91Z2ggdG8gbW9kZXRlc3QsIGluY2x1
ZGluZyB0aGUKYWJpbGl0eSB0byBzZXQgYSBnYW1tYSB0YWJsZSwgd2hpY2ggaXMgbmVjZXNzYXJ5
IGZvciB0aGUgQzggaW5kZXhlZApmb3JtYXQuCgpUaGlzIHdhcyB0ZXN0ZWQgb24gbm91dmVhdSwg
YW5kIHVzZWQgZm9yIGJyaW5nLXVwIG9mIHRoZSBDOCwgWEIzMCwgYW5kCkZQMTYgZm9ybWF0cyBv
biB0aGUgTlZJRElBIGhhcmR3YXJlIHRoYXQgc3VwcG9ydHMgdGhlc2UuCgpJbGlhIE1pcmtpbiAo
MTApOgogIHV0aWw6IGFkZCBDOCBmb3JtYXQsIHN1cHBvcnQgaXQgd2l0aCBTTVBURSBwYXR0ZXJu
CiAgdXRpbDogZml4IE1BS0VfUkdCQSBtYWNybyBmb3IgMTBicHAgbW9kZXMKICB1dGlsOiBhZGQg
Z3JhZGllbnQgcGF0dGVybgogIHV0aWw6IGFkZCBmcDE2IGZvcm1hdCBzdXBwb3J0CiAgdXRpbDog
YWRkIGNhaXJvIGRyYXdpbmcgZm9yIDMwYnBwIGZvcm1hdHMgd2hlbiBhdmFpbGFibGUKICBtb2Rl
dGVzdDogZG9uJ3QgcHJldGVuZCB0aGF0IGF0b21pYyBtb2RlIGluY2x1ZGVzIGEgZm9ybWF0CiAg
bW9kZXRlc3Q6IGFkZCBhbiBhZGRfcHJvcGVydHlfb3B0aW9uYWwgdmFyaWFudCB0aGF0IGRvZXMg
bm90IHByaW50CiAgICBlcnJvcnMKICBtb2RldGVzdDogYWRkIEM4IHN1cHBvcnQgdG8gZ2VuZXJh
dGUgU01QVEUgcGF0dGVybgogIG1vZGV0ZXN0OiBhZGQgdGhlIGFiaWxpdHkgdG8gc3BlY2lmeSBm
aWxsIHBhdHRlcm5zIG9uIHRoZSBjb21tYW5kbGluZQogIG1vZGV0ZXN0OiBhZGQgRlAxNiBmb3Jt
YXQgc3VwcG9ydAoKIHRlc3RzL21vZGV0ZXN0L2J1ZmZlcnMuYyAgfCAgMTMgKysKIHRlc3RzL21v
ZGV0ZXN0L21vZGV0ZXN0LmMgfCAxMDkgKysrKysrKystLQogdGVzdHMvdXRpbC9mb3JtYXQuYyAg
ICAgICB8ICAgNyArCiB0ZXN0cy91dGlsL3BhdHRlcm4uYyAgICAgIHwgNDMyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystCiB0ZXN0cy91dGlsL3BhdHRlcm4uaCAgICAgIHwg
ICA3ICsKIDUgZmlsZXMgY2hhbmdlZCwgNTQzIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygt
KQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
