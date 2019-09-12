Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C77B0937
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4254B6EBB7;
	Thu, 12 Sep 2019 07:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642C76E029
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 01:37:48 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d15so14828315pfo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jy5SRy6ysNBo94VTweaZaJHfTY+VCYVdnfQshAKb0WM=;
 b=rabTEELs/zx0+DnuiYAKmbCbmHW4XuxseTh7xzo0X3QvgRbSRP52V1eyLpgG5KRuAO
 Gms1NhndAJyN4frs8GBfhc1b7qnzrnOKURe5aMDgDvqm8IU5m5+i4vo4eXbw6ZBLCyxC
 y0ugwKsvvheTKanpVayP7ZLw3fh4Yw/7Razf6GtRPGP6vlZGXbo4eVREVRc2O0DEXNPg
 jmO6C3HsNeX7vP70Mp60UbDCU1lhRLKEM4kIrJF0s0hYL34LjsW0skZu+TMI6PXIyArx
 kpG+dCTx0Qvv9SxVIJH48eQru0Y6NtaQCPJnTtgnAZYCKLEBRHSTY6RdnH9ok+uPZP+z
 2PXA==
X-Gm-Message-State: APjAAAWRYHhp10LOVeD5UtsUJkfnz+q2Vusb/8gUQlzsc7NOYgPkfGD8
 foIB6ZOXIe8A1M3ISQkNAsVz5b0yySQ=
X-Google-Smtp-Source: APXvYqyt8MVFo3gbMGKTnWOJvKI7dY5EL+0DtCMd2EJSVzgh2no+WFBAS33R4p5z/B7AnHZZ/JevTA==
X-Received: by 2002:aa7:9194:: with SMTP id x20mr21524493pfa.126.1568252267613; 
 Wed, 11 Sep 2019 18:37:47 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net.
 [67.185.54.80])
 by smtp.gmail.com with ESMTPSA id f22sm8682967pgb.4.2019.09.11.18.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 18:37:46 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] tc358767 test mode
Date: Wed, 11 Sep 2019 18:37:38 -0700
Message-Id: <20190912013740.5638-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jy5SRy6ysNBo94VTweaZaJHfTY+VCYVdnfQshAKb0WM=;
 b=k4v95DuE7lWKvBVdtvsH9CRWmXvIB21882kOWRmrwlL/ePhEwfw9Umgw9vULw7E2pr
 NVdU9bQsOdCZ9OqGvvbpdJAhmfr/HLZM1qhPAMCz+vCZUV+CnNEz68izuCfyinsvaDB1
 2sFQgGdUAZz3MfMrzrAq1YQtmc5BG1DEqUsr+phrNgMVMYVdwBlM/YyBtDAMQDCShSG5
 nGvMZc8g6Sf2aEq2+Jtzzehmv8dHIuBfwjfj9fMTvOJCgni7U2tZUEB57QMy6ZTh8n4x
 ZS/EHtXKa8u2NVYMphQ0nK4dDJLbr9fFcW5/A5wfMK0uDo894TT2vJRFC0UkkWfZyT2N
 KYbQ==
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
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlcnlvbmU6CgpUaGlzIHNlcmllcyBpcyBhIGNvdXBsZSBvZiBwYXRjaGVzIGV4cG9zaW5nIFRl
c3RDdGwgcmVnaXN0ZXIgb2YKdGMzNTg3NjcsIHdoaWNoIGNhbiBiZSBwcmV0dHkgaGFuZHkgd2hl
biB0cm91Ymxlc2hvb3RpbmcgbGluayBwcm9ibGVtcy4KCkNoYW5nZXMgc2luY2UgW3YxXToKCiAg
ICAtIERlYnVnZnMgbW92ZWQgaW50byBhIHN0YW5kYWxvbmUgZGlyZWN0b3J5IGFuZCBpcyBub3cg
Y3JlYXRlZCBhcwogICAgICBhIHBhcnQgb2YgcHJvYmUoKQoKICAgIC0gQWRkZWQgdHN0Y3RsX2xv
Y2sgdG8gZW5zdXJlIG11dHVhbCBleGNsdXNpb24gb2YgdHN0Y3RsIGNvZGUgYW5kCiAgICAgIGJy
aWRnZSdzIGVuYWJsZS9kaXNhYmxlIG1ldGhvZHMKCiAgICAtIHRjX3RzdGN0bF9zZXQoKSBjaGFu
Z2VkIHRvIGZ1bmN0aW9uIG9ubHkgaWYgYnJpZGdlIHdhcyBwcmV2aW9zbHkKICAgICAgZW5hYmxl
ZAoKICAgIC0gQWRkZWQgY29tbWVudCBleHBsYWluaW5nIGRhdGEgZm9ybWF0IGV4cGVjdGVkIGJ5
ICJ0c3RjdGwiCgogICAgLSBEZWJ1Z2ZzIHBlcm1pc3Npb24gY2hhbmdlZCB0byByZWZsZWN0IHdy
aXRlLW9ubHkgbmF0dXJlIG9mIHRoaXMKICAgICAgZmVhdHVyZQoKICAgIC0gT3JpZ2luYWwgY29t
bWl0IHNwbGl0IGludG8gdHdvCgogICAgLSBNaW5vciBmb3JtYXR0aW5nIGNoYW5nZXMKClRoYW5r
cywKQW5kcmV5IFNtaXJub3YKClt2MV0gbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA4MjYxODI1MjQu
NTA2NC0xLWFuZHJldy5zbWlybm92QGdtYWlsLmNvbQoKQW5kcmV5IFNtaXJub3YgKDIpOgogIGRy
bS9icmlkZ2U6IHRjMzU4NzY3OiBJbnRyb2R1Y2UgX190Y19icmlkZ2VfZW5hYmxlL2Rpc2FibGUo
KQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBFeHBvc2UgdGVzdCBtb2RlIGZ1bmN0aW9uYWxpdHkg
dmlhIGRlYnVnZnMKCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAxODQgKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQ4IGluc2VydGlv
bnMoKyksIDM2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
