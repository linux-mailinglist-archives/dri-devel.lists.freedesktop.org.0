Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FEA8E6A1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1D86E8F9;
	Thu, 15 Aug 2019 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588AD6E897
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 04:26:54 +0000 (UTC)
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <matthew.ruffell@canonical.com>)
 id 1hy7Lg-0002HI-F0
 for dri-devel@lists.freedesktop.org; Thu, 15 Aug 2019 04:26:52 +0000
Received: by mail-pg1-f198.google.com with SMTP id k20so578557pgg.15
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrzC/rPA4rQcsv4L5S0BuwwBNCWsX0pTF40tc4ZcQvM=;
 b=cN4ntuYuVIoCvS7dY/GowfdAPOmJzoAOmU44GxI789XVmvb1UCgpqmfRPHl9ZRLH1E
 X6OqhZQDEfjJj2vY4DaHV4Ky6gSXcALF4Y5QmJNsACUAR6+v10Q+Ir//V9u6WyOlyoqk
 kmfIF7wpKH0tk/1v7ItQtPTgEcMyzo5jnpPrXex+fjLkdEF0G9i8TGUr4DXjFAvQKz5U
 xVR3TSsE07GE39cm/2Y6xl5gVL46Elf9ZFPlRd/vpF/NAUNo6zudWSprQcVVZ6TFH6ce
 JAZfnBpGjDaYx8j3GJSzU9tCdKL2lOEA6d/RAtgrNiztfJD6m+NbfmZqckf5VAD5G9B1
 kYmg==
X-Gm-Message-State: APjAAAUET0+hOhg0TN+RI3xotoEOwM4+bDgSyfh2rNtI2xV3qxd8XZk9
 dSp5R79VGQeMK+pHdUMeNmpFEDM9HK9i2LUOU1ajxfXudfqZeqHUj0610l2sSu+UolLIPA8SYk6
 e0wgHOiwXIBtfUv/oKMNI1w5fVkHiyz3mrEs1qyy+6ai1kg==
X-Received: by 2002:a62:f208:: with SMTP id m8mr3417978pfh.108.1565843210804; 
 Wed, 14 Aug 2019 21:26:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzCrswy3Ko+RcXcxoLnvV7Z/4VZyYCeFmUlnK618nvL/XJMTfNraZMzVmYK/X7uuzNS3/0VQ==
X-Received: by 2002:a62:f208:: with SMTP id m8mr3417969pfh.108.1565843210599; 
 Wed, 14 Aug 2019 21:26:50 -0700 (PDT)
Received: from localhost.localdomain (125-238-115-161-fibre.sparkbb.co.nz.
 [125.238.115.161])
 by smtp.gmail.com with ESMTPSA id t8sm240758pji.24.2019.08.14.21.26.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 21:26:50 -0700 (PDT)
From: Matthew Ruffell <matthew.ruffell@canonical.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm/hisilicon/hibmc: Make CONFIG_DRM_HISI_HIBMC depend on
 ARM64
Date: Thu, 15 Aug 2019 16:26:39 +1200
Message-Id: <20190815042640.26938-1-matthew.ruffell@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
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
Cc: Guang Lou Yang <yangguanglou@huawei.com>,
 Zhanglei Mao <zhanglei.mao@canonical.com>, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Gavin Guo <gavin.guo@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgphbWQ2NCBiYXNlZCBIdWF3ZWkgc2VydmVycyBoYXZlIHByb2JsZW1zIHdoZXJlIHRoZSBk
aXNwbGF5IG91dHB1dCBvZiB0aGVpciBpQk1DIApjaGlwcyBpcyBicm9rZW4sIHJlc3VsdGluZyBp
biBhICJibHVycnkiIHNjcmVlbiB3aGVuIHZpZXdlZCBmcm9tIHRoZWlyIGluIGhvdXNlIApyZW1v
dGUga3ZtLWxpa2UgY29uc29sZS4KCkV4YW1wbGU6CgpodHRwczovL2xhdW5jaHBhZGxpYnJhcmlh
bi5uZXQvMzY1OTA3NjY4L2NyZWVuX3BpY3R1cmVfZm9yX2JsdXIucG5nCgpUaGUgaXNzdWUgaXMg
Y2F1c2VkIGJ5IHRoZSBoaWJtY19kcm0ga2VybmVsIG1vZHVsZSBiZWluZyBsb2FkZWQuIFRoZSBQ
Q0kgSUQgZm9yIAp0aGUgaUJNQyBjaGlwcyBvbiBhbWQ2NCBoYXJkd2FyZSBpcyB0aGUgc2FtZSBh
cyBhcm02NCBoYXJkd2FyZSwgYnV0IHRoZQpoaWJtY19kcm0gZHJpdmVyIHdhcyBkZXZlbG9wZWQg
b25seSBmb3IgdXNlIG9uIGFybTY0IGhhcmR3YXJlLCBtb3N0IG5vdGFibHkgZm9yIAp0aGUgSHVh
d2VpIEQwNSBkZXZlbG9wbWVudCBib2FyZC4KClRoZSBpbXBhY3QgdG8gSHVhd2VpIGlzIHRoYXQg
dGhlaXIgY3VzdG9tZXJzIGNhbm5vdCB1c2UgVWJ1bnR1IHNlcnZlciBpbnN0YWxsCm1lZGlhIGFz
IHRoZSBzY3JlZW4gZ29lcyAiYmx1cnJ5IiB3aGVuIHRoZSBkLWkgaW5zdGFsbCBtZWRpYSBvciBz
dWJ1cWl0eQppbnN0YWxsZXIgbG9hZHMgdGhlIGhpYm1jX2RybSBrZXJuZWwgbW9kdWxlIGFmdGVy
IGxhbmd1YWdlIHNlbGVjdGlvbi4KClRoZSBvbmx5IHdvcmthcm91bmQgZm9yIHRoZWlyIGN1c3Rv
bWVycyBpcyB0byBwcmVzcyB0aGUgIkUiIGtleSBkdXJpbmcgdGhlIHZlcnkgCmZpcnN0IGluc3Rh
bGxlciBtZW51IGFuZCBhZGRpbmcgIm1vZHByb2JlLmJsYWNrbGlzdD1oaWJtY19kcm0iIHRvIHRo
ZSBrZXJuZWwgCmNvbW1hbmQgbGluZSBpbiB0aGUgZ3J1YiBtZW51LiBUaGlzIGlzIG5vdCBnb29k
IGZvciBjdXN0b21lciBleHBlcmllbmNlIHdpdGggCnRoZWlyIHNlcnZlcnMuCgpIdWF3ZWkgaGVs
cCBzaXRlIG9uIHRoZSBtYXR0ZXI6CgpodHRwczovL3N1cHBvcnQuaHVhd2VpLmNvbS9lbnRlcnBy
aXNlL2VuL2tub3dsZWRnZS9FS0IxMTAwMDE1NTIxCgpPdGhlciBwcm9ibGVtcyBleGlzdCBmb3Ig
dGhlIGhpYm1jX2RybSBkcml2ZXIgb24gYW1kNjQsIHN1Y2ggYXMgd29ya2luZyBvbgpiaW9zLCBi
dXQgbm90IHVlZmksIGFuZCBub3QgYmVpbmcgd2F5bGFuZCBjb21wYXRpYmxlLCBtYWtpbmcgdGhl
IHNjcmVlbiAiYmx1cnJ5IiAKd2hlbmV2ZXIgYSBkZXNrdG9wIHNlc3Npb24gaXMgc3RhcnRlZCBh
bmQgZ2RtIGxvYWRlZC4KCk1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGFib3ZlIGNhbiBiZSBm
b3VuZCBvbiBMYXVuY2hwYWQ6CgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE3NjI5
NDAKCkh1YXdlaSBoYXZlIGFza2VkIHVzIHRvIHJlbW92ZSBoaWJtY19kcm0gZnJvbSBhbGwgYXJj
aGl0ZWN0dXJlcyBleGNlcHQgYXJtNjQsCmFuZCB0aGlzIGFsaWducyB3aXRoIGFkdmljZSBmcm9t
IEhpc2lsaWNvbi4KCkhpYm1jIG1haW50YWluZXJzLCBjYW4geW91IHBsZWFzZSByZXZpZXcgdGhl
IHN0YXR1cyBvZiBoaWJtY19kcm0gb24gYW1kNjQgYW5kCmNvbmZpcm0gdGhhdCB0aGVzZSBpc3N1
ZXMgZXhpc3QsIGFuZCBjb25zaWRlciBtZXJnaW5nIHRoZSBwYXRjaCB0byB1cGRhdGUKS2NvbmZp
ZyB0byBzZXQgQ09ORklHX0RSTV9ISVNJX0hJQk1DIGFybTY0IG9ubHkuCgpNYXR0aGV3IFJ1ZmZl
bGwgKDEpOgogIGRybS9oaXNpbGljb24vaGlibWM6IE1ha2UgQ09ORklHX0RSTV9ISVNJX0hJQk1D
IGRlcGVuZCBvbiBBUk02NAoKIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvS2NvbmZp
ZyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
