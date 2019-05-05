Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59C1453D
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E931894E3;
	Mon,  6 May 2019 07:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30FD892D6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 17:39:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w12so9122680ljh.12
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2019 10:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3qZZ7ZZQl8fJvpX3EEcO4LoQ4Uz3pz1vAeLF9xgXcY=;
 b=JnmW4DTQSWBruRU7hpDHdsh3P01rZyUW7dglN0agTWEMHoOPmFvjVLyla1bRXdY21q
 2SW/Sy7T0+l0OP6HyuMXV9BSaIHgfPbRnOuL0lpD4Z/fFalmdJIEeTRpV4VyAw8TdXBZ
 sN7pYlEV2Lz0difLE32KSa31HYaXUfhCNAh9PtcKHZhHlnd9oI76ijPj/UTWcPhjxWND
 PzGiQgHAu7E/8oTCYaKU5vINZATwxNj/h8QzfgL1EFGYeIxqUw8HMNTU8pyaOQUSamB8
 mtX4iWvQLKX5VD9t8ngcl8z6XXOJMBDi79yfYbn3Odfxufbt+K6a3nnRHrLG5f/gupWG
 hdoA==
X-Gm-Message-State: APjAAAUwB7yp4UXKW+jUwUPjEahE5kpGMqrIvOMC1QhQJS63ch1u84w3
 sZb/gkPEKqb6nlj9ni9x2QI=
X-Google-Smtp-Source: APXvYqyoVJ2csql4znGGg+oO1CL0Ntj6WRZze+OQ3Q7xJ0CCD2QHMcBpG2epnScOVORjx2hDBLkG8w==
X-Received: by 2002:a2e:2b89:: with SMTP id r9mr6160125ljr.7.1557077987169;
 Sun, 05 May 2019 10:39:47 -0700 (PDT)
Received: from localhost.localdomain (ppp94-29-35-107.pppoe.spdop.ru.
 [94.29.35.107])
 by smtp.gmail.com with ESMTPSA id z17sm1626938lja.26.2019.05.05.10.39.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 May 2019 10:39:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 0/3] Tegra DRM: Support memory bandwidth management for
 display
Date: Sun,  5 May 2019 20:37:04 +0300
Message-Id: <20190505173707.29282-1-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3qZZ7ZZQl8fJvpX3EEcO4LoQ4Uz3pz1vAeLF9xgXcY=;
 b=CKLNfZWtblLlw04L2dHz2j5I+ollT0Nhr7IwI1sWGxkHq9+tREv26DVAbAQvrxqfkF
 T07jtaf78nNT6eNLQVBmgV1vESgyD4+e3Szd9Dao6ODMilZCUfx03tmTuMMMOIgpV2mn
 E9g1l7CPH7XXhbkx66NghzHQRQ/uQWoCJcwuHhKUmYMERrrRALWNBgKAoFcJYIAKvW4P
 Sj/FkMpST7QKCgKnRDExtG6Fkk/z2CDZGJAwjjQ5pWEAveWKlofTgnoIEnh8n/shvXzL
 FbScpImF0R75BC9fVm+xHXRDJW5KSaw10G59FwmjhAhy3U4Mnj/mdk4iPjG7+932nAWx
 7IUA==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpEaXNwbGF5IGNvbnRyb2xsZXJzIGhhdmUgYSBuZWVkIGZvciBtaW5pbXVtIG1lbW9y
eSBiYW5kd2lkdGggaW4gb3JkZXIgdG8KbWFpbnRhaW4gZGF0YS1zdHJlYW0gdG8gb3V0cHV0IGF0
IGEgcmVxdWlyZWQgcmF0ZS4gVGhlcmUgaXMgYSB2aXN1YWwKY29ycnVwdGlvbiBvbmNlIHRoZSBy
ZXF1aXJlbWVudCBpcyB2aW9sYXRlZCBhbmQgQ1JUQyByZXNldCBtYXkgYmUgcmVxdWlyZWQKaW4g
b3JkZXIgdG8gcmVjb3Zlci4gVGhpcyBzZXJpZXMgYWRkcyBwcmVsaW1pbmFyeSBzdXBwb3J0IGZv
ciB0aGUgbWVtb3J5CmJhbmR3aWR0aCBtYW5hZ2VtZW50LCBpdCB3aWxsIGJlY29tZSBhY3RpdmUg
b25jZSBNZW1vcnkgQ29udHJvbGxlciBkcml2ZXJzCndpbGwgZ2V0IHN1cHBvcnQgZm9yIHRoZSBQ
TSBtZW1vcnkgYmFuZHdpZHRoIFFvUy4KCkRtaXRyeSBPc2lwZW5rbyAoMyk6CiAgZHJtL3RlZ3Jh
OiBkYzogVHVuZSB1cCBoaWdoIHByaW9yaXR5IHJlcXVlc3QgY29udHJvbHMgb24gVGVncmEyMAog
IGRybS90ZWdyYTogZGM6IEV4dGVuZCBkZWJ1ZyBzdGF0cyB3aXRoIHRvdGFsIG51bWJlciBvZiBl
dmVudHMKICBkcm0vdGVncmE6IFN1cHBvcnQgUE0gUW9TIG1lbW9yeSBiYW5kd2lkdGggbWFuYWdl
bWVudAoKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jICAgIHwgMjM0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oICAgIHwgIDEz
ICsrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgICB8ICAxOCArKysKIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9wbGFuZS5jIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9wbGFuZS5o
IHwgICA0ICstCiA1IGZpbGVzIGNoYW5nZWQsIDI2NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
