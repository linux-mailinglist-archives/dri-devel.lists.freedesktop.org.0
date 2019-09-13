Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6EDB17EF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 07:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208266EE7A;
	Fri, 13 Sep 2019 05:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF3E6E96F;
 Fri, 13 Sep 2019 05:50:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q14so30709147wrm.9;
 Thu, 12 Sep 2019 22:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Phaw5vbTT2faE0N3gJYnU+Jk+6mkAT8/6QLIHkDqelw=;
 b=WZygozYOOHfKPV3WhhwdpkCoJ6eq6YhDzFApyjaBKTuqHpAhPuLW9AwznVkHq2V0St
 wmMuriNbu+7f7Kr4XUyC4Cc8/kAypS+7XVh8n38gEk2U7vZ9Saw8hVq3H3adlYhHMkEh
 PEcMsx5yidVwu9CEPL4Akd6Pm7VPk5bNsHTNN1YcyiQydaTxbjBaPexnKUhO8X2B0VNi
 YCrZJBtXmbDaUCuTXWpajKWkE5bzB7S5TWJHt96RuUzGcVKrSET0oL6xAYTENYE9x9w/
 41sObL84vy+Equ46NAvplVVaCGFM1kRimez7x89Ywo7kPXJXRhGc94tDq4H1ebuH/7gU
 awbA==
X-Gm-Message-State: APjAAAU3aoxO3vtkqBnH3V6vqUF2YhR645Hjlg18C2sxD6xWlGBRWmja
 Iyaiq/UOMuhTOC6tnm0M55c=
X-Google-Smtp-Source: APXvYqxD+ywAwmLzUEqqo3xtMGt3wUdwMno0tLYEvxObOX4qB9I3z8Lk53z/BkFdH6spnuGDE8Qo0A==
X-Received: by 2002:a05:6000:11cb:: with SMTP id
 i11mr2611823wrx.171.1568353857634; 
 Thu, 12 Sep 2019 22:50:57 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id h125sm2429279wmf.31.2019.09.12.22.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 22:50:56 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/etnaviv: update hardware headers from rnndb
Date: Fri, 13 Sep 2019 07:50:36 +0200
Message-Id: <20190913055052.25599-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Phaw5vbTT2faE0N3gJYnU+Jk+6mkAT8/6QLIHkDqelw=;
 b=n1Junbl+PAAZAQDIPZK5uCYARN4Il+YCpwChpr2oNQQ/fP6+kYqUaUmkGkk70Y0tja
 Q5hx+8kvb7FdV3kaQYo4PdOCoywynD4zVtl24jnqxOVHta064PTIy1KZZvCuCWIRlwUi
 bwmJ0jVW10DKFf/IqA67ybeyPxW6EQYIPAv6ivjUDpecnj6EyRTfH8ufY+vcLQ2oijC/
 Jzm9TJKV1lJe21DUh/wWh/gpOaYNePyjCtNBXWaORspnGSwCM7+Uigo4px77MrZ17ZNv
 n0Z+2il/JAMxWNZzJTwoUG5nHMBFD6kJW5xUgNdSYMEcZMhR5EdK/qyQpjXhe0gqSQhc
 pyHg==
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBkYXRlIHRoZSBzdGF0ZSBISSBoZWFkZXIgZnJvbSBybm5kYiBjb21taXQKYTA0MjgzNTkxYThh
IChybm5kYjogdXBkYXRlIE1NVSBleGNlcHRpb24gY2F1c2VzKS4KCkNoYW5nZXMgaW4gVjI6CiAt
IE9ubHkgdXBkYXRlIHN0YXRlX2hpLnhtbCBhcyBzdWdnZXN0ZWQgYnkgTHVjYXMgU3RhY2guCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L3N0YXRlX2hpLnhtbC5oIHwgMjUgKysr
KysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L3N0
YXRlX2hpLnhtbC5oIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvc3RhdGVfaGkueG1sLmgKaW5k
ZXggNDFkOGRhMmI2ZjRmLi4wZjkzZGJiYmFhZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L3N0YXRlX2hpLnhtbC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L3N0
YXRlX2hpLnhtbC5oCkBAIC04LDE3ICs4LDE3IEBAIFRoaXMgZmlsZSB3YXMgZ2VuZXJhdGVkIGJ5
IHRoZSBydWxlcy1uZy1uZyBoZWFkZXJnZW4gdG9vbCBpbiB0aGlzIGdpdCByZXBvc2l0b3J5CiBn
aXQgY2xvbmUgZ2l0Oi8vMHgwNC5uZXQvcnVsZXMtbmctbmcKIAogVGhlIHJ1bGVzLW5nLW5nIHNv
dXJjZSBmaWxlcyB0aGlzIGhlYWRlciB3YXMgZ2VuZXJhdGVkIGZyb20gYXJlOgotLSBzdGF0ZS54
bWwgICAgICggIDI2MDg3IGJ5dGVzLCBmcm9tIDIwMTctMTItMTggMTY6NTE6NTkpCi0tIGNvbW1v
bi54bWwgICAgKCAgMzU0NjggYnl0ZXMsIGZyb20gMjAxOC0wMS0yMiAxMzo0ODo1NCkKLS0gY29t
bW9uXzNkLnhtbCAoICAxNDYxNSBieXRlcywgZnJvbSAyMDE3LTEyLTE4IDE2OjUxOjU5KQotLSBz
dGF0ZV9oaS54bWwgICggIDMwMjMyIGJ5dGVzLCBmcm9tIDIwMTgtMDItMTUgMTU6NDg6MDEpCi0t
IGNvcHlyaWdodC54bWwgKCAgIDE1OTcgYnl0ZXMsIGZyb20gMjAxNi0xMi0wOCAxNjozNzo1NikK
LS0gc3RhdGVfMmQueG1sICAoICA1MTU1MiBieXRlcywgZnJvbSAyMDE2LTEyLTA4IDE2OjM3OjU2
KQotLSBzdGF0ZV8zZC54bWwgICggIDc5OTkyIGJ5dGVzLCBmcm9tIDIwMTctMTItMTggMTY6NTE6
NTkpCi0tIHN0YXRlX2JsdC54bWwgKCAgMTM0MDUgYnl0ZXMsIGZyb20gMjAxNy0xMi0xOCAxNjo1
MTo1OSkKLS0gc3RhdGVfdmcueG1sICAoICAgNTk3NSBieXRlcywgZnJvbSAyMDE2LTEyLTA4IDE2
OjM3OjU2KQotCi1Db3B5cmlnaHQgKEMpIDIwMTItMjAxOCBieSB0aGUgZm9sbG93aW5nIGF1dGhv
cnM6CistIHN0YXRlLnhtbCAgICAgKCAgMjY2NjYgYnl0ZXMsIGZyb20gMjAxOS0wOC0xMyAxMToy
Njo0OSkKKy0gY29tbW9uLnhtbCAgICAoICAzNTQ2OCBieXRlcywgZnJvbSAyMDE4LTAyLTEwIDEz
OjA5OjI2KQorLSBjb21tb25fM2QueG1sICggIDE0MzIyIGJ5dGVzLCBmcm9tIDIwMTktMDgtMjAg
MjA6MzE6NTApCistIHN0YXRlX2hpLnhtbCAgKCAgMzAzOTYgYnl0ZXMsIGZyb20gMjAxOS0wOC0y
MCAyMDozNDowMykKKy0gY29weXJpZ2h0LnhtbCAoICAgMTU5NyBieXRlcywgZnJvbSAyMDE4LTAy
LTEwIDEzOjA5OjI2KQorLSBzdGF0ZV8yZC54bWwgICggIDUxNTUyIGJ5dGVzLCBmcm9tIDIwMTgt
MDItMTAgMTM6MDk6MjYpCistIHN0YXRlXzNkLnhtbCAgKCAgODM1MDUgYnl0ZXMsIGZyb20gMjAx
OS0wOS0wNiAwOTozMjo1NCkKKy0gc3RhdGVfYmx0LnhtbCAoICAxNDI1MiBieXRlcywgZnJvbSAy
MDE5LTA4LTEzIDIwOjAwOjQyKQorLSBzdGF0ZV92Zy54bWwgICggICA1OTc1IGJ5dGVzLCBmcm9t
IDIwMTgtMDItMTAgMTM6MDk6MjYpCisKK0NvcHlyaWdodCAoQykgMjAxMi0yMDE5IGJ5IHRoZSBm
b2xsb3dpbmcgYXV0aG9yczoKIC0gV2xhZGltaXIgSi4gdmFuIGRlciBMYWFuIDxsYWFud2pAZ21h
aWwuY29tPgogLSBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29t
PgogLSBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQEAgLTQ4LDYgKzQ4LDkg
QEAgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogI2RlZmluZSBNTVVfRVhDRVBUSU9OX1NMQVZF
X05PVF9QUkVTRU5UCQkJCTB4MDAwMDAwMDEKICNkZWZpbmUgTU1VX0VYQ0VQVElPTl9QQUdFX05P
VF9QUkVTRU5UCQkJCTB4MDAwMDAwMDIKICNkZWZpbmUgTU1VX0VYQ0VQVElPTl9XUklURV9WSU9M
QVRJT04JCQkJMHgwMDAwMDAwMworI2RlZmluZSBNTVVfRVhDRVBUSU9OX09VVF9PRl9CT1VORAkJ
CQkweDAwMDAwMDA0CisjZGVmaW5lIE1NVV9FWENFUFRJT05fUkVBRF9TRUNVUklUWV9WSU9MQVRJ
T04JCQkweDAwMDAwMDA1CisjZGVmaW5lIE1NVV9FWENFUFRJT05fV1JJVEVfU0VDVVJJVFlfVklP
TEFUSU9OCQkJMHgwMDAwMDAwNgogI2RlZmluZSBWSVZTX0hJCQkJCQkJCTB4MDAwMDAwMDAKIAog
I2RlZmluZSBWSVZTX0hJX0NMT0NLX0NPTlRST0wJCQkJCTB4MDAwMDAwMDAKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
