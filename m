Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884285641E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF86E2DC;
	Wed, 26 Jun 2019 08:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5776E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:34:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d18so18647086wrs.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNjXZTa0eehs8U6TXIJ1xtY97Iu/6Eek+y81QQNtjK4=;
 b=KXJrnFaxgX5UwzlhhzhEFqAkUQA5XJgunh8yAj5Az6X9UxFF5v8RyMAmdHnuWf3LEM
 qculMqR+aUA/SSekxqixhnLaw/NhNfiwnzKHEIuuDsmVOCdV91exEjMCPqbiKKB2niUj
 zq4Rb0/scNnvfAovq1WQG+Q9ZyanznqU8lkJ4JBqdWcZDYymnxCTpbt8NoYvOhll0F3w
 vd81u7YQOhd4ZQECbyDkhxuxJwa9FO8u2SLoF695rUvGW80XS/vsSk10hpMmtG3Xcv9s
 wJXwtbJeOwmN3ffjvew44CWrLu4OMiEnfU4aB9ECxuh8Tl4Q6ML97QEmqXUqpPnSsQRq
 0h9w==
X-Gm-Message-State: APjAAAUyk6hKyQYPEpDlGujVfmpH74GZRg6hmMNAuYQdvaBe4+mCiLbB
 AGvymJJAzbunK6qZHafCIkonYw==
X-Google-Smtp-Source: APXvYqwGZ61fCCBpD9shDosEmPm3n3rtBVEJAron1RaBsQFJZuBhiFZxaTmMz81yYUZI1bSgnfdGEg==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr106263069wrv.164.1561480491732; 
 Tue, 25 Jun 2019 09:34:51 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:34:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/12] ARM: davinci: da850-evm: remove more legacy GPIO calls
Date: Tue, 25 Jun 2019 18:34:22 +0200
Message-Id: <20190625163434.13620-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNjXZTa0eehs8U6TXIJ1xtY97Iu/6Eek+y81QQNtjK4=;
 b=B8LuQu66bgMmpBHn0CbN+gVJmLWy3c3N7z8bxuh0JXGKTw6PWfsSrpdrk5mrFYRvmt
 CeUcFrYqeCPgbiCJ+jIiEUE2NbmgnQFalb/wUcSM8ab3BddXyQ02/10RO9om9ObUS8VI
 sGVmk+ffQ8YrqfA7m/lbU2K1B/9/tczAwT7KMOOrh4Sd13TAzAhT66t4CKX4s9yQH1PU
 l8BYKVJU3d61u7wZ4h/eYquVn0tk1mbumj6t91PAzxrKbo2uiCe1uu/MMQkGxLylJ/5D
 zHz02i20yGrgLom/qdpFn5k25qlFJq2s36M/p6mmBeIaxkvGXx1yijivOajz10lQ2ZDo
 hrMQ==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
aXMgaXMgYW5vdGhlciBzbWFsbCBzdGVwIG9uIHRoZSBwYXRoIHRvIGxpYmVyYXRpbmcgZGF2aW5j
aSBmcm9tIGxlZ2FjeQpHUElPIEFQSSBjYWxscyBhbmQgc2hyaW5raW5nIHRoZSBkYXZpbmNpIEdQ
SU8gZHJpdmVyIGJ5IG5vdCBoYXZpbmcgdG8Kc3VwcG9ydCB0aGUgYmFzZSBHUElPIG51bWJlciBh
bnltb3JlLgoKVGhpcyB0aW1lIHdlJ3JlIHJlbW92aW5nIHRoZSBsZWdhY3kgY2FsbHMgdXNlZCBp
bmRpcmVjdGx5IGJ5IHRoZSBMQ0RDCmZiZGV2IGRyaXZlci4KClRoZSBmaXJzdCB0aHJlZSBwYXRj
aGVzIG1vZGlmeSB0aGUgR1BJTyBiYWNrbGlnaHQgZHJpdmVyLiBUaGUgZmlyc3QKb2YgdGhlbSBh
ZGRzIHRoZSBuZWNlc3NhcnkgZnVuY3Rpb25hbGl0eSwgdGhlIG90aGVyIHR3byBhcmUganVzdAp0
d2Vha3MgYW5kIGNsZWFudXBzLgoKTmV4dCB0d28gcGF0Y2hlcyBlbmFibGUgdGhlIEdQSU8gYmFj
a2xpZ2h0IGRyaXZlciBpbgpkYXZpbmNpX2FsbF9kZWZjb25maWcuCgpQYXRjaCA2LzEyIG1vZGVs
cyB0aGUgYmFja2xpZ2h0IEdQSU8gYXMgYW4gYWN0dWFsIEdQSU8gYmFja2xpZ2h0IGRldmljZS4K
ClBhdGNoZXMgNy05IGV4dGVuZCB0aGUgZmJkZXYgZHJpdmVyIHdpdGggcmVndWxhdG9yIHN1cHBv
cnQgYW5kIGNvbnZlcnQKdGhlIGRhODUwLWV2bSBib2FyZCBmaWxlIHRvIHVzaW5nIGl0LgoKTGFz
dCB0aHJlZSBwYXRjaGVzIGFyZSBpbXByb3ZlbWVudHMgdG8gdGhlIGRhOHh4IGZiZGV2IGRyaXZl
ciBzaW5jZQp3ZSdyZSBhbHJlYWR5IHRvdWNoaW5nIGl0IGluIHRoaXMgc2VyaWVzLgoKQmFydG9z
eiBHb2xhc3pld3NraSAoMTIpOgogIGJhY2tsaWdodDogZ3BpbzogYWxsb3cgdG8gcHJvYmUgbm9u
LXBkYXRhIGRldmljZXMgZnJvbSBib2FyZCBmaWxlcwogIGJhY2tsaWdodDogZ3BpbzogdXNlIGEg
aGVscGVyIHZhcmlhYmxlIGZvciAmcGRldi0+ZGV2CiAgYmFja2xpZ2h0OiBncGlvOiBwdWxsIHRo
ZSBub24tcGRhdGEgZGV2aWNlIHByb2JpbmcgY29kZSBpbnRvIHByb2JlKCkKICBBUk06IGRhdmlu
Y2k6IHJlZnJlc2ggZGF2aW5jaV9hbGxfZGVmY29uZmlnCiAgQVJNOiBkYXZpbmNpX2FsbF9kZWZj
b25maWc6IGVuYWJsZSBHUElPIGJhY2tsaWdodAogIEFSTTogZGF2aW5jaTogZGE4NTAtZXZtOiBt
b2RlbCB0aGUgYmFja2xpZ2h0IEdQSU8gYXMgYW4gYWN0dWFsIGRldmljZQogIGZiZGV2OiBkYTh4
eDogYWRkIHN1cHBvcnQgZm9yIGEgcmVndWxhdG9yCiAgQVJNOiBkYXZpbmNpOiBkYTg1MC1ldm06
IHN3aXRjaCB0byB1c2luZyBhIGZpeGVkIHJlZ3VsYXRvciBmb3IgbGNkYwogIGZiZGV2OiBkYTh4
eDogcmVtb3ZlIHBhbmVsX3Bvd2VyX2N0cmwoKSBjYWxsYmFjayBmcm9tIHBsYXRmb3JtIGRhdGEK
ICBmYmRldjogZGE4eHgtZmI6IHVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKQog
IGZiZGV2OiBkYTh4eC1mYjogZHJvcCBhIHJlZHVuZGFudCBpZgogIGZiZGV2OiBkYTh4eDogdXNl
IHJlc291cmNlIG1hbmFnZW1lbnQgZm9yIGRtYQoKIGFyY2gvYXJtL2NvbmZpZ3MvZGF2aW5jaV9h
bGxfZGVmY29uZmlnICAgfCAgMjggKysrLS0tCiBhcmNoL2FybS9tYWNoLWRhdmluY2kvYm9hcmQt
ZGE4NTAtZXZtLmMgIHwgIDkwICsrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9ncGlvX2JhY2tsaWdodC5jIHwgIDY3ICsrKysrLS0tLS0tLS0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvZGE4eHgtZmIuYyAgICAgICAgICAgfCAxMTggKysrKysrKysrKysrKy0tLS0tLS0tLS0K
IGluY2x1ZGUvdmlkZW8vZGE4eHgtZmIuaCAgICAgICAgICAgICAgICAgfCAgIDEgLQogNSBmaWxl
cyBjaGFuZ2VkLCAxNjUgaW5zZXJ0aW9ucygrKSwgMTM5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
