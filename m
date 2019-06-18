Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E64B2A1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CD96E2A5;
	Wed, 19 Jun 2019 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x462.google.com (mail-wr1-x462.google.com
 [IPv6:2a00:1450:4864:20::462])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E376E106
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:41:52 +0000 (UTC)
Received: by mail-wr1-x462.google.com with SMTP id r16so12723764wrl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TcaLpkr7BrB6h5k/fFe5VxsiPI+n9NLSNDwWnvmzuGA=;
 b=bqrUdx919MSTVKX9kvMHMtMkW+YXGr2t88bkxNrZoa3G0aw124c6B5DAXzrlSXQd45
 h4ATih971lglUZT2clJHuVd4/usbRyndLzn/fzLjUsLgOWhv0EXWhTUnDIkSx75S9bBb
 Cl0ucSvg72Nr8jovkPwovvCP6JFJ7xx97tG2cbG13j9iJ+Y2X5qlxQCocvz1MKlTpR7o
 GgPRKSgbVvR84w8OywIk4KMeyxNN3IsiaY+KV8y8e2gVoYp9tAIE0Iw/I14sPNpRb9M8
 /cpPjoGQ6UUKz76EpGWQXMqBGkvSLdn+tLXMiUE/Ko0tdnAQRsSa/gIFpe4L7qGZy+wq
 B7HA==
X-Gm-Message-State: APjAAAWRcEjty+CjvwrFsuvpkbwG3cXIhrK8WrJcXQVxQBiLymPsLj3j
 xZVxeZWRyV0jA91cuePf+gbPw51a4BoyNdU9VAMyzm7Bm6Jjrw==
X-Google-Smtp-Source: APXvYqzow8GoPJC+En04+NCBYrUu0w+fEr5jV/VXyg8XMEXtqBhw1OEsNThbpc9r0JizrrVw2kts9Y2dzEZ6
X-Received: by 2002:a5d:5607:: with SMTP id l7mr50973455wrv.228.1560843710723; 
 Tue, 18 Jun 2019 00:41:50 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
 by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 00:41:50 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From: Marko Kohtala <marko.kohtala@okoko.fi>
To: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] video: ssd1307fb: Support more displays
Date: Tue, 18 Jun 2019 10:41:05 +0300
Message-Id: <20190618074111.9309-1-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=okoko.fi; s=okoko;
 h=from:to:cc:subject:date:message-id;
 bh=TcaLpkr7BrB6h5k/fFe5VxsiPI+n9NLSNDwWnvmzuGA=;
 b=f00Dh/O46hmUfacv++d2NLddEDx10ZY8ZiTRN4baj57YhzsMxlrzWtI3dBq00FvxP3
 v7vxxqBoSCmY3KE3mJhBfQTNl9JiYsZ5CCo4Mmg0R6+uQ8pekPTaXBvMRzarzV01JC6R
 PpaoUu81imcci5U35+0rUahFy84wYPR+lYSOQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Marko Kohtala <marko.kohtala@okoko.fi>,
 Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGtlcm5lbCBkcml2ZXIgZm9yIHNzZDEzMDdmYiBkaWQgbm90IGFsbG93IGZvciBhbGwgcHJv
cGVyCmluaXRpYWxpemF0aW9uIGZvciBhIERlbnNpdHJvbiAxMjh4MzYgZGlzcGxheS4gVGhlIHRy
ZW5kIGluIHRoZSBkcml2ZXIKaGFzIGJlZW4gdG8gYWRkIGRldmljZXRyZWUgcHJvcGVydGllcyBm
b3IgdGhlIGNvbnRyb2xsZXIgaW5pdGlhbGl6YXRpb24KYW5kIHRoZXNlIHBhdGNoZXMgY29udGlu
dWUgb24gdGhhdCB0cmVuZC4KClRoZXJlIGFsc28gd2VyZSBzb21lIHNwYXJzZSBhbmQgQ29jY2lu
ZWxsZSBlcnJvcnMuCgpBIHNtYWxsIGJ1ZyBjYXVzaW5nIHNjcm9sbGluZyBvbiBkaXNwbGF5IHVw
ZGF0ZXMgd2l0aCBub256ZXJvIHBhZ2Vfb2Zmc2V0CndhcyBhIGJpdCBzdXJwcmlzaW5nLiBJdCB3
b3VsZCBzZWVtIHRoZSBkcml2ZXIgaGFzIG9ubHkgYmVlbiB1c2VkIHdpdGgKcGFnZV9vZmZzZXQg
c2V0IHRvIHplcm8uIEJ1ZyBoYXMgYmVlbiB0aGVyZSBzaW5jZSBjb21taXQKMzAxYmMwNjc1YjY3
N2E5ODQ3NTE4NzA1MGQ1NmNkMmIzOWZmMGFjZiAoInZpZGVvOiBzc2QxMzA3ZmI6IE1ha2UgdXNl
IG9mCmhvcml6b250YWwgYWRkcmVzc2luZyBtb2RlIikuCgpNYXJrbyBLb2h0YWxhICg2KToKICB2
aWRlbzogc3NkMTMwN2ZiOiBVc2Ugc2NyZWVuX2J1ZmZlciBpbnN0ZWFkIG9mIHNjcmVlbl9iYXNl
CiAgdmlkZW86IHNzZDEzMDdmYjogUmVtb3ZlIHVubmVlZGVkIHNlbWljb2xvbnMKICB2aWRlbzog
c3NkMTMwN2ZiOiBTdGFydCBwYWdlIHJhbmdlIGF0IHBhZ2Vfb2Zmc2V0CiAgdmlkZW86IHNzZDEz
MDdmYjogSGFuZGxlIHdpZHRoIGFuZCBoZWlnaHQgdGhhdCBhcmUgbm90IG11bHRpcGxlIG9mIDgK
ICBkdC1iaW5kaW5nczogZGlzcGxheTogc3NkMTMwN2ZiOiBBZGQgaW5pdGlhbGl6YXRpb24gcHJv
cGVydGllcwogIHZpZGVvOiBzc2QxMzA3ZmI6IEFkZCBkZXZpY2V0cmVlIGNvbmZpZ3VyYXRpb24g
b2YgZGlzcGxheSBzZXR1cAoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3NkMTMw
N2ZiLnR4dCB8ICAxMCArKwogZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyAgICAgICAg
ICAgICAgIHwgMTMwICsrKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5z
ZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
