Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172694C7F6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FCF6E4FF;
	Thu, 20 Jun 2019 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946FA88A28;
 Wed, 19 Jun 2019 19:18:36 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p15so861200eds.8;
 Wed, 19 Jun 2019 12:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2bx2Y/hN4Cn5kEf9/eyTDQFYiuK9AF+r04fSjxWQhMk=;
 b=Ef1YIOnBvZDpOlFB28GmAUH2bTkF6ri5tA+ltK0VDctIm+piWmTTcL3lPWOmYGprZr
 rOAPeEKW8L8kRsmB8h5AvBbDPpysHm9ckuoHGq43bXqjwbGkXazVTcatJ8bTkg/8EoaO
 rH3OZlics7mU1wcBk1Gx0lEVLJzEBBP7hegvzXZdlfe+byaOtj6ZFaN2tR8HwVjOm4v5
 WPIIsCIKKVPUIS9O9+g7KyW9Mg24+HqhJ/ec8M//oJGtqpiXtXq5AXBoXPH79z6PQ69D
 MlO993drzVZiujj8PCKUS+U4+WQBI9D22RjbyP9DFZN7PM1bSYxtJc78n8gs0CxvD2P/
 /tjA==
X-Gm-Message-State: APjAAAWOch8UZcRYo3wvIrWnTCmKN+D/uWHnR3V2kxanx2b2b1+TCla6
 eyfq+Jsej4qmG1E7h2VrJJE=
X-Google-Smtp-Source: APXvYqziPGp5grduRzW0xyDykY6Q2CiVE7PN5wKnvPzCIrZ9ZOacu6Eabu5qSgjYqicqN2+JvVA1GQ==
X-Received: by 2002:a17:906:d052:: with SMTP id
 bo18mr26656411ejb.311.1560971915091; 
 Wed, 19 Jun 2019 12:18:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm3394270edb.8.2019.06.19.12.18.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 12:18:34 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH v2] drm/msm/dsi: Add parentheses to quirks check in
 dsi_phy_hw_v3_0_lane_settings
Date: Wed, 19 Jun 2019 12:17:23 -0700
Message-Id: <20190619191722.25811-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190619161913.102998-1-natechancellor@gmail.com>
References: <20190619161913.102998-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2bx2Y/hN4Cn5kEf9/eyTDQFYiuK9AF+r04fSjxWQhMk=;
 b=p4QDjw+Bv2jk955O2zyVMZTnM32O5HtfjIlCWhEuRixFfgSNTzxm3+9Db9HAM/EPC7
 tstzPBCbIXrF3RFtaB3HizOyM9SWWt5HWYQ1tbvRzXAGpWpEr+vN/lwN01wRxeSBoK9W
 bpQwqr1q1d1f9ppXB2he49kZel0QKKyW3o/HGDJHoFlPvbRsGP2jXnyhRVU6jG7uAoL1
 W2tfcNoZVssnqHgVl3JGM4wEF7bn+UznJ1M8rf23rTk4h0kfbgRrJEPYSN4e43Cwk0qk
 iYTnS7I/DRHzLihnqvb1zIqzOiPdryb4M+nAgN54VH8F8XwvS47EFgAOmNULEQvqm4f4
 9EVA==
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
Cc: kbuild test robot <lkp@intel.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2xhbmcgd2FybnM6Cgpkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmM6
ODA6Njogd2FybmluZzogbG9naWNhbCBub3QgaXMKb25seSBhcHBsaWVkIHRvIHRoZSBsZWZ0IGhh
bmQgc2lkZSBvZiB0aGlzIGJpdHdpc2Ugb3BlcmF0b3IKWy1XbG9naWNhbC1ub3QtcGFyZW50aGVz
ZXNdCiAgICAgICAgaWYgKCFwaHktPmNmZy0+cXVpcmtzICYgVjNfMF8wXzEwTk1fT0xEX1RJTUlO
R1NfUVVJUkspIHsKICAgICAgICAgICAgXiAgICAgICAgICAgICAgICAgfgpkcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmM6ODA6Njogbm90ZTogYWRkIHBhcmVudGhlc2Vz
CmFmdGVyIHRoZSAnIScgdG8gZXZhbHVhdGUgdGhlIGJpdHdpc2Ugb3BlcmF0b3IgZmlyc3QKICAg
ICAgICBpZiAoIXBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlS
SykgewogICAgICAgICAgICBeCiAgICAgICAgICAgICAoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICApCmRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lf
cGh5XzEwbm0uYzo4MDo2OiBub3RlOiBhZGQgcGFyZW50aGVzZXMKYXJvdW5kIGxlZnQgaGFuZCBz
aWRlIGV4cHJlc3Npb24gdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKICAgICAgICBpZiAoIXBoeS0+
Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykgewogICAgICAgICAg
ICBeCiAgICAgICAgICAgICggICAgICAgICAgICAgICAgKQoxIHdhcm5pbmcgZ2VuZXJhdGVkLgoK
QWRkIHBhcmVudGhlc2VzIGFyb3VuZCB0aGUgYml0d2lzZSBBTkQgc28gaXQgaXMgZXZhbHVhdGVk
IGZpcnN0IHRoZW4KbmVnYXRlZC4KCkZpeGVzOiAzZGJiZjhmMDllODMgKCJkcm0vbXNtL2RzaTog
QWRkIG9sZCB0aW1pbmdzIHF1aXJrIGZvciAxMG5tIHBoeSIpCkxpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzU0NwpSZXBvcnRlZC1ieToga2J1aWxk
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBKZWZmcmV5IEh1Z28gPGpl
ZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPgpTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JA
Z21haWwuY29tPgotLS0KCnYxIC0+IHYyOgoKKiBGaXggYnJva2VuIGxpbmsgKHRoYW5rcyB0byBT
ZWFuIGZvciBwb2ludGluZyBpdCBvdXQpCiogQWRkIFNlYW4ncyByZXZpZXdlZC1ieQoKIGRyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwppbmRleCBlYjI4OTM3ZjRiMzQuLjQ3NDAzZDRmMmQyOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwpAQCAtNzcsNyAr
NzcsNyBAQCBzdGF0aWMgdm9pZCBkc2lfcGh5X2h3X3YzXzBfbGFuZV9zZXR0aW5ncyhzdHJ1Y3Qg
bXNtX2RzaV9waHkgKnBoeSkKIAkJCSAgICAgIHR4X2RjdHJsW2ldKTsKIAl9CiAKLQlpZiAoIXBo
eS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykgeworCWlmICgh
KHBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykpIHsKIAkJ
LyogVG9nZ2xlIEJJVCAwIHRvIHJlbGVhc2UgZnJlZXplIEkvMCAqLwogCQlkc2lfcGh5X3dyaXRl
KGxhbmVfYmFzZSArIFJFR19EU0lfMTBubV9QSFlfTE5fVFhfRENUUkwoMyksIDB4MDUpOwogCQlk
c2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJFR19EU0lfMTBubV9QSFlfTE5fVFhfRENUUkwoMyks
IDB4MDQpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
