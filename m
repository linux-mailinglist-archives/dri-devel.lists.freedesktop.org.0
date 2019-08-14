Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB28DFDD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 23:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6AA6E84C;
	Wed, 14 Aug 2019 21:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AAE6E848
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f72so467666wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XYZjU1RTDpOkzFDReluCSDSSmZ91Zx0fRKtSGoSAbAQ=;
 b=ak0x1SKguTOWsyrKoSW2UkpfUupJp0BphTBMkcdJMxxlGAQuxl5l4psXyRIUFvCWQV
 /yXk7IshjpA5str83oeJmR2pu/1beW4gP6CX30Lm5xKw1z72Q95j5aILc0GB+e7ezSLs
 1YH4tZhO8Q9KUXb0gTMBCE6j7vSc8/H2WaVzfngqxZQ8USFjrKXey4Tr9PenqcHAqipK
 I6zk9Att5IM976Y6WYl7rY7U0zKMK150nGNSIAiarf/DIm4zolUxY11nIH9SAu4ENGHI
 Bt9NiweeAB58Am1pW4eD8IQA90x0Gq49F7M4lXmemICe/V1FI68xUdLVEfsNmL+9kyQ8
 S2cQ==
X-Gm-Message-State: APjAAAX1oJv6GEPhsU6r2kNgK+4gL8S/wabliedd3iDHx/+3YsSgBTbI
 Yf4RZzW8rR8P3OMG3MSmkTImCw==
X-Google-Smtp-Source: APXvYqzNvd+OhowbMV5UPI7p1DFhfCV5EFIScUQVzbZ3KQZm996fQEnm0XDNrUvLBitBCCdEL8ugqA==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr884035wml.169.1565818284752; 
 Wed, 14 Aug 2019 14:31:24 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:24 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 2/7] Revert "ACPI / OSI: Add OEM _OSI string to enable NVidia
 HDMI audio"
Date: Wed, 14 Aug 2019 23:31:13 +0200
Message-Id: <20190814213118.28473-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA4ODc1MzJjYTdjYTU5ZmNmMDU0N2E3OTIxMTc1Njc5MTEyODAz
MGEzLgoKV2UgaGF2ZSBhIGJldHRlciBzb2x1dGlvbiBmb3IgdGhpczogYjUxNmVhNTg2ZDcxNwoK
QW5kIHNhbWUgYXMgd2l0aCB0aGUgbGFzdCBjb21taXQ6ICJOVmlkaWEgTGludXggZHJpdmVyIiB0
aGF0J3MgTm91dmVhdSwgYW55Cm91dCBvZiB0cmVlIGRyaXZlciBkb2VzIF9ub3RfIG1hdHRlci4g
QW5kIHdpdGggTm91dmVhdSBhbGwgb2YgdGhpcyB3b3JrcyBldmVuCnRob3VnaCBpdCByZXF1aXJl
ZCBhIHByb3BlciBmaXggZmlyc3QsIGJ1dCB3ZSBoYXZlIHRoYXQgbm93LgoKU2lnbmVkLW9mZi1i
eTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+CkNDOiBBbGV4IEh1bmcgPGFsZXgu
aHVuZ0BjYW5vbmljYWwuY29tPgpDQzogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29j
a2lAaW50ZWwuY29tPgpDQzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ0M6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNDOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy9hY3BpL29zaS5jIHwgOCAtLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL29zaS5jIGIvZHJp
dmVycy9hY3BpL29zaS5jCmluZGV4IDliMjBhYzRkNzlhMC4uNTZjYzk1YjZiNzI0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2FjcGkvb3NpLmMKKysrIGIvZHJpdmVycy9hY3BpL29zaS5jCkBAIC01Mywx
NCArNTMsNiBAQCBvc2lfc2V0dXBfZW50cmllc1tPU0lfU1RSSU5HX0VOVFJJRVNfTUFYXSBfX2lu
aXRkYXRhID0gewogCSAqIGJlIHJlbW92ZWQgaWYgYm90aCBuZXcgYW5kIG9sZCBncmFwaGljcyBj
YXJkcyBhcmUgc3VwcG9ydGVkLgogCSAqLwogCXsiTGludXgtRGVsbC1WaWRlbyIsIHRydWV9LAot
CS8qCi0JICogTGludXgtTGVub3ZvLU5WLUhETUktQXVkaW8gaXMgdXNlZCBieSBCSU9TIHRvIHBv
d2VyIG9uIE5WaWRpYSdzIEhETUkKLQkgKiBhdWRpbyBkZXZpY2Ugd2hpY2ggaXMgdHVybmVkIG9m
ZiBmb3IgcG93ZXItc2F2aW5nIGluIFdpbmRvd3MgT1MuCi0JICogVGhpcyBwb3dlciBtYW5hZ2Vt
ZW50IGZlYXR1cmUgb2JzZXJ2ZWQgb24gc29tZSBMZW5vdm8gVGhpbmtwYWQKLQkgKiBzeXN0ZW1z
IHdoaWNoIHdpbGwgbm90IGJlIGFibGUgdG8gb3V0cHV0IGF1ZGlvIHZpYSBIRE1JIHdpdGhvdXQK
LQkgKiBhIEJJT1Mgd29ya2Fyb3VuZC4KLQkgKi8KLQl7IkxpbnV4LUxlbm92by1OVi1IRE1JLUF1
ZGlvIiwgdHJ1ZX0sCiB9OwogCiBzdGF0aWMgdTMyIGFjcGlfb3NpX2hhbmRsZXIoYWNwaV9zdHJp
bmcgaW50ZXJmYWNlLCB1MzIgc3VwcG9ydGVkKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
