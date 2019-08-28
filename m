Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA7A1328
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7519A6E037;
	Thu, 29 Aug 2019 08:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F5A894DD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:38:05 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id t6so1563040ios.7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 11:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WHcgLtBVTpOTGkvzzyFJrMalfpvT5RoFcnOBKCVmA5U=;
 b=F5n66FU5864w0zswo8IXQDMH+EFGgdogKYe/nTcjAo8WWy/AT/YlQruGkZ8GTiyoSz
 JJab/6G76SPLmEchlnJx3GhnIkEmkXZX2kx3dypBxhsDVcN0W/l70NbSbmXFFFzTgEAl
 b+/N0/8q44KnclwNnPBbx08ITirB5Jio9UMvMbevPi641GVC555AjQpLIB4c8ZKQ4fMj
 w8m4qKKrRoi/ihp/QhlMf7K6QdKVICsvhVTPOEUiCuI97ffl1LwDqHP83JKoUrSRS+oz
 aBCtYDimW7R3NA1Z/KFhicoKnJB06zlhqLRlGJOZPSoTg/TVLjOwB54pK+I2vBmLs3Nq
 rqtw==
X-Gm-Message-State: APjAAAWnixImXfjcmFbz7LZpVhUU9v+/eNb8PZWi8ghXBv86uzqu7Umh
 dTgvLKAyryynpkbP4A/sTFzrfA==
X-Google-Smtp-Source: APXvYqyTJ1bJXyGDWbBc6lK10AP1JqjnjpqqnNcWjg3el8gUSPgtA5J0MKM5o872ZZtIlfFPuskZ7Q==
X-Received: by 2002:a6b:da1a:: with SMTP id x26mr5912882iob.285.1567017484708; 
 Wed, 28 Aug 2019 11:38:04 -0700 (PDT)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
 by smtp.gmail.com with ESMTPSA id s4sm4599667iop.25.2019.08.28.11.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2019 11:38:04 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/amd/display: fix struct init in update_bounding_box
Date: Wed, 28 Aug 2019 12:37:58 -0600
Message-Id: <20190828183758.11553-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WHcgLtBVTpOTGkvzzyFJrMalfpvT5RoFcnOBKCVmA5U=;
 b=Prfgnz7bfxDp5kmjxjC/BLb48ridESw18bqWlWy5WpdGoMrDZkp/Ty3yA21Va0soPb
 OgE8LcXLLqF/nBbyU/mNa9Aiqv3tcLDZblvAD0rYJ4H/oyzvRTnLRfk2BCMFR/Gs1GPl
 gTGZ/V/78VeoGFu7mHjHQQ2E88PDCxxgrmERk=
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
Cc: Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Raul E Rangel <rrangel@chromium.org>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGNuMjBfcmVzb3VyY2UuYzoyNjM2Ojk6IGVycm9yOiBtaXNzaW5nIGJyYWNlcyBhcm91bmQgaW5p
dGlhbGl6ZXIgWy1XZXJyb3I9bWlzc2luZy1icmFjZXNdCiAgc3RydWN0IF92Y3NfZHBpX3ZvbHRh
Z2Vfc2NhbGluZ19zdCBjYWxjdWxhdGVkX3N0YXRlc1tNQVhfQ0xPQ0tfTElNSVRfU1RBVEVTXSA9
IHswfTsKICAgICAgICAgXgpGaXhlczogN2VkNGU2MzUyYzE2ZiAoImRybS9hbWQvZGlzcGxheTog
QWRkIERDTjIgSFcgU2VxdWVuY2VyIGFuZCBSZXNvdXJjZSIpCgpTaWduZWQtb2ZmLWJ5OiBSYXVs
IEUgUmFuZ2VsIDxycmFuZ2VsQGNocm9taXVtLm9yZz4KLS0tClNvIGFwcGFyZW50bHkgYHt9YCBp
cyBhIGdjYyBleHRlbnNpb24uIFRoZSBDIHN0YW5kYXJkIHJlcXVpcmVzIGF0IGxlYXN0Cm9uZSBl
eHByZXNzaW9uLiBTbyB7ezB9fSBpcyBjb3JyZWN0LiBJIGdvdCBhIGxpbnQgZXJyb3IgYWJvdXQg
e3swfX0KbmVlZGluZyBhIHNwYWNlLCBzbyBpIHVzZSBgeyB7MH0gfWAuCgpDaGFuZ2VzIGluIHYy
OgotIFVzZSB7IHswfSB9IGluc3RlYWQgb2Yge30KCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggYjk0OWUyMDJkNmNiLi44
ZTY0MzNiZTIyNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0yNjMzLDcgKzI2MzMsNyBAQCBzdGF0aWMgdm9p
ZCBjYXBfc29jX2Nsb2NrcygKIHN0YXRpYyB2b2lkIHVwZGF0ZV9ib3VuZGluZ19ib3goc3RydWN0
IGRjICpkYywgc3RydWN0IF92Y3NfZHBpX3NvY19ib3VuZGluZ19ib3hfc3QgKmJiLAogCQlzdHJ1
Y3QgcHBfc211X252X2Nsb2NrX3RhYmxlICptYXhfY2xvY2tzLCB1bnNpZ25lZCBpbnQgKnVjbGtf
c3RhdGVzLCB1bnNpZ25lZCBpbnQgbnVtX3N0YXRlcykKIHsKLQlzdHJ1Y3QgX3Zjc19kcGlfdm9s
dGFnZV9zY2FsaW5nX3N0IGNhbGN1bGF0ZWRfc3RhdGVzW01BWF9DTE9DS19MSU1JVF9TVEFURVNd
ID0gezB9OworCXN0cnVjdCBfdmNzX2RwaV92b2x0YWdlX3NjYWxpbmdfc3QgY2FsY3VsYXRlZF9z
dGF0ZXNbTUFYX0NMT0NLX0xJTUlUX1NUQVRFU10gPSB7IHswfSB9OwogCWludCBpOwogCWludCBu
dW1fY2FsY3VsYXRlZF9zdGF0ZXMgPSAwOwogCWludCBtaW5fZGNmY2xrID0gMDsKLS0gCjIuMjMu
MC4xODcuZzE3ZjViNzU1NmMtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
