Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD15A2306
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 20:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3C46E0DE;
	Thu, 29 Aug 2019 18:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BEC6E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 18:10:53 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id gn20so1955027plb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3lwos/Txl+3gJ4cILwAcWrc0vlbFbaTwlZO2rHBSP/g=;
 b=gB5WCbdvVRFOBcPSdxziXE+/t8tKsyYgN1kNe94uxdXQUd99+l7+QotUvphFRCEO0d
 OL54xOa1jebZF9AM64uyXjFtVQ+U/UrDobX7u0h71BjJKhYx8XGzjnQ7QU+fAsAUsIsX
 +IDSWALg93qyqPHyErgi5GuD6++r8L54fgypFc+rRWjQFZoKEOgaFF9ZaUjK3TNVKZXh
 TfgkaTzZlUvB1l7kVX5uYyvxlNRtAnW5U/f3571vLck2IeEeLkijKq96+UJeJoGkSa6m
 uWO0Uo7+qamgO5kE+rfVfLbeIdbOI0YCGTk+flkurShsn0NUnapKUruPYOxUn7qcFy07
 NXgg==
X-Gm-Message-State: APjAAAUF+oJyVLjIELZPV+LEuEA9zEOvGGCvQDoJq7iOUj07ODJQBWZM
 /mfp1PRhO41WbwQzX3d4tgd9URRs4+o=
X-Google-Smtp-Source: APXvYqxFwYcGOl9PjVxoCcJRS8hZlP04fX9JS17R0y0SbFnrBi0/2SdeNJuIOCodksbEc47ozvhz3A==
X-Received: by 2002:a17:902:2d03:: with SMTP id
 o3mr9958930plb.311.1567102252861; 
 Thu, 29 Aug 2019 11:10:52 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id 21sm3928774pfb.96.2019.08.29.11.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 11:10:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/bridge: adv7511: Attach to DSI host at probe time"
Date: Thu, 29 Aug 2019 11:08:35 -0700
Message-Id: <20190829180836.14453-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3lwos/Txl+3gJ4cILwAcWrc0vlbFbaTwlZO2rHBSP/g=;
 b=bi/RX1M1Ijpbeh12VwSBgshy5Fjr5hDjA9Qwq2DtksyQQOnnol0bIbdh0RSDIEq/+A
 lXOdQnRCLC2j7BBwoV6jXBSlyY/iHXu44XilPrlFGyd71C0CSG1RGLnNUsXWruQa+o7c
 v84kM6U3RwWLO7hRE5inK8Vwbwau/vcRYLUE7d4m0G/19HVyByJ0vV4VrAleCE7xDNGc
 6SJSPEmlw8FG21udJd5UyG3PoUrC/k8pMkbtC7RpgZtWj7+hQpkzHI1EbCTZ9KMAa86k
 zT5hAhsJlxEte35pG/eyo19c4Mi33KonhZk9Y4xCT/DJEBmWsh8M0oYEjSzAUNCq7H1c
 PIVw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhpcyByZXZlcnRzIGNv
bW1pdCA4M2YzNWJjM2E4NTJmMWMzODkyYzc0NzQ5OThjNWNlYzcwN2M3YmEzLgoKVGhpcyBjb21t
aXQgdGhlIHdyb25nIGRpcmVjdGlvbiwgd2Ugc2hvdWxkIHJlYWxseSBiZSBjaGFuZ2luZyBwYW5l
bApmcmFtZXdvcmsgdG8gYXR0YWNoIGRzaSBob3N0IGFmdGVyIHByb2JlLCByYXRoZXIgdGhhbiBp
bnRyb2R1Y2luZwp0aGUgc2FtZSBwcm9iZS1vcmRlciBwcm9ibGVtIHRoYXQgcGFuZWxzIGFscmVh
ZHkgaGF2ZSB0byBicmlkZ2VzLgoKVGhlIHJlYXNvbiBpcywgdGhhdCBpbiBvcmRlciB0byBkZWFs
IHdpdGggZGV2aWNlcyB3aGVyZSBkaXNwbGF5IGlzCmVuYWJsZWQgYnkgYm9vdGxvYWRlciBhbmQg
ZWZpZmIvc2ltcGxlZmIgaXMgdXNlZCB1bnRpbCB0aGUgcmVhbApkcml2ZXIgcHJvYmVzLCB3ZSBu
ZWVkIHRvIGJlIGNhcmVmdWwgdG8gbm90IHRvdWNoIHRoZSBoYXJkd2FyZQp1bnRpbCB3ZSBoYXZl
IGFsbCB0aGUgcGllY2VzIHByb2JlZCBhbmQgcmVhZHkgdG8gZ28sIG90aGVyd2lzZSB5b3UKd2ls
bCBraWxsIHRoZSB3b3JraW5nIGRpc3BsYXksIGxlYXZpbmcgeW91cnNlbGYgKGF0IGxlYXN0LCBp
biB0aGUKY2FzZSBvZiByZWFsIGNvbnN1bWVyIGRldmljZXMgdGhhdCBkbyBub3QgaGF2ZSBhIGRl
YnVnIFVBUlQpIHdpdGgKbm8gZ29vZCB3YXkgdG8gZGVidWcgd2hhdCB3ZW50IHdyb25nLgoKU2ln
bmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIHwgMTIgKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMKaW5kZXggOThiY2NhY2U4
YzFjLi5mNmQyNjgxZjY5MjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2
NzUxMS9hZHY3NTExX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9h
ZHY3NTExX2Rydi5jCkBAIC04NzQsNiArODc0LDkgQEAgc3RhdGljIGludCBhZHY3NTExX2JyaWRn
ZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAkJCQkgJmFkdjc1MTFfY29ubmVj
dG9yX2hlbHBlcl9mdW5jcyk7CiAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcigmYWR2LT5j
b25uZWN0b3IsIGJyaWRnZS0+ZW5jb2Rlcik7CiAKKwlpZiAoYWR2LT50eXBlID09IEFEVjc1MzMp
CisJCXJldCA9IGFkdjc1MzNfYXR0YWNoX2RzaShhZHYpOworCiAJaWYgKGFkdi0+aTJjX21haW4t
PmlycSkKIAkJcmVnbWFwX3dyaXRlKGFkdi0+cmVnbWFwLCBBRFY3NTExX1JFR19JTlRfRU5BQkxF
KDApLAogCQkJICAgICBBRFY3NTExX0lOVDBfSFBEKTsKQEAgLTEyMTksMTcgKzEyMjIsOCBAQCBz
dGF0aWMgaW50IGFkdjc1MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYywgY29uc3Qgc3Ry
dWN0IGkyY19kZXZpY2VfaWQgKmlkKQogCWRybV9icmlkZ2VfYWRkKCZhZHY3NTExLT5icmlkZ2Up
OwogCiAJYWR2NzUxMV9hdWRpb19pbml0KGRldiwgYWR2NzUxMSk7Ci0KLQlpZiAoYWR2NzUxMS0+
dHlwZSA9PSBBRFY3NTMzKSB7Ci0JCXJldCA9IGFkdjc1MzNfYXR0YWNoX2RzaShhZHY3NTExKTsK
LQkJaWYgKHJldCkKLQkJCWdvdG8gZXJyX3JlbW92ZV9icmlkZ2U7Ci0JfQotCiAJcmV0dXJuIDA7
CiAKLWVycl9yZW1vdmVfYnJpZGdlOgotCWRybV9icmlkZ2VfcmVtb3ZlKCZhZHY3NTExLT5icmlk
Z2UpOwogZXJyX3VucmVnaXN0ZXJfY2VjOgogCWkyY191bnJlZ2lzdGVyX2RldmljZShhZHY3NTEx
LT5pMmNfY2VjKTsKIAlpZiAoYWR2NzUxMS0+Y2VjX2NsaykKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
