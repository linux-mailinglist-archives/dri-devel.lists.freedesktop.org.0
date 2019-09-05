Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BF9AB2E3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512AF6E182;
	Fri,  6 Sep 2019 07:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5976E0AD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 12:32:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h7so1560174wrw.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 05:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xuzP+vnCO2xAl32UsUr1yZq/4EL5LN563c95drnPuDA=;
 b=ea5Rxw9HDMfXs6GaXJ4JQ9RCXh70nzzLjjsQU9lcFkPN+6dCv6/7w1NPMhWobM2aCM
 cg4vR3VW9TR8vqhQ4dxH6hWUi/sBEePOh1DJ0pxZv4P6HrZjCqFtKiV1pn4yseV7Y064
 8dHMKnDGj2gHani3XWDPiOKyyEuNiDAtNqtpMBu4VcG9Lbk58DiKCkM+3dL/As3kaKKg
 c5CpFyk0Gq80T7/+exbbYhNQBFVZfpvzN8k65ZfyA0ORYc8gGxlpEBZJh8W8ehQ2rtWM
 c29/yW+7y7Q/gdHWlt/cTxtsg5xdmcY5G5qbQHejTkzxOdbwY/L+C9p7pbAegnvGXUmd
 2CuA==
X-Gm-Message-State: APjAAAWqJ035CHnNKa3Dar+lU9E3QPif4M3ZLh2KsY0X+xfumBgKv0Bt
 qVcvcwNT0aFoiOV/FgJEPnA=
X-Google-Smtp-Source: APXvYqyY5+R3jS7MmxUz3+8/IxXEe+qctgB4B9IZRZ+7x6oJRXKgAiEdvgW/q9wKkCY06WzNP26bjA==
X-Received: by 2002:a5d:6585:: with SMTP id q5mr2323071wru.162.1567686724272; 
 Thu, 05 Sep 2019 05:32:04 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de.
 [91.64.150.195])
 by smtp.gmail.com with ESMTPSA id t203sm3184535wmf.42.2019.09.05.05.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:32:03 -0700 (PDT)
From: Krzysztof Wilczynski <kw@linux.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] drm/exynos: Move static keyword to the front of declaration
Date: Thu,  5 Sep 2019 14:32:02 +0200
Message-Id: <20190905123202.28001-1-kw@linux.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xuzP+vnCO2xAl32UsUr1yZq/4EL5LN563c95drnPuDA=;
 b=YVHezsn8/40byllVUiMPUITf/cYMaBIGTm+rn+siVdtZq7jfAbSg54rrCLxSIfZImr
 qQu4WCFZdnotEBEJbisjCiY+i/D+GCLb3ZDxVSo0fj1NAzoEP1NHviR8krHYR28cHY4y
 HUgLTkdrkBDhYMxe58zH3odBfm0gQW4OAOofSJ8+nLQnLTUrkve4352kKie9+pD9vefQ
 w6Yur/wqZtUMjub7iHlynuc0UO/HmKG9gVgpSJR52Br+rOkNs7Jq0GuCuWjjuFUyMStm
 lMzdOzTZu6H3r+bEVzrCjsr3mUJZc2ZSkp4JuTitJbPKMyCTLUfme2l3NXI0TPgYzZzz
 thoA==
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
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSB0aGUgc3RhdGljIGtleXdvcmQgdG8gdGhlIGZyb250IG9mIGRlY2xhcmF0aW9uIG9mIG1v
ZGVzLAphbmQgcmVzb2x2ZSB0aGUgZm9sbG93aW5nIGNvbXBpbGVyIHdhcm5pbmcgdGhhdCBjYW4g
YmUgc2Vlbgp3aGVuIGJ1aWxkaW5nIHdpdGggd2FybmluZ3MgZW5hYmxlZCAoVz0xKToKCmRyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmM6MTA3NDoyOiB3YXJuaW5nOgogIOKAmHN0
YXRpY+KAmSBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0aW9uIFstV29sZC1zdHlsZS1k
ZWNsYXJhdGlvbl0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBXaWxjenluc2tpIDxrd0BsaW51
eC5jb20+Ci0tLQpSZWxhdGVkOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwODI3MjMz
MDE3LkdLOTk4N0Bnb29nbGUuY29tCgogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4
ZXIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwppbmRleCA3YjI0MzM4ZmFk
M2MuLjZjZmRiOTVmZWYyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfbWl4ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCkBA
IC0xMDY5LDkgKzEwNjksOSBAQCBzdGF0aWMgYm9vbCBtaXhlcl9tb2RlX2ZpeHVwKHN0cnVjdCBl
eHlub3NfZHJtX2NydGMgKmNydGMsCiAJc3RydWN0IG1peGVyX2NvbnRleHQgKmN0eCA9IGNydGMt
PmN0eDsKIAlpbnQgd2lkdGggPSBtb2RlLT5oZGlzcGxheSwgaGVpZ2h0ID0gbW9kZS0+dmRpc3Bs
YXksIGk7CiAKLQlzdHJ1Y3QgeworCXN0YXRpYyBjb25zdCBzdHJ1Y3QgewogCQlpbnQgaGRpc3Bs
YXksIHZkaXNwbGF5LCBodG90YWwsIHZ0b3RhbCwgc2Nhbl92YWw7Ci0JfSBzdGF0aWMgY29uc3Qg
bW9kZXNbXSA9IHsKKwl9IG1vZGVzW10gPSB7CiAJCXsgNzIwLCA0ODAsIDg1OCwgNTI1LCBNWFJf
Q0ZHX1NDQU5fTlRTQyB8IE1YUl9DRkdfU0NBTl9TRCB9LAogCQl7IDcyMCwgNTc2LCA4NjQsIDYy
NSwgTVhSX0NGR19TQ0FOX1BBTCB8IE1YUl9DRkdfU0NBTl9TRCB9LAogCQl7IDEyODAsIDcyMCwg
MTY1MCwgNzUwLCBNWFJfQ0ZHX1NDQU5fSERfNzIwIHwgTVhSX0NGR19TQ0FOX0hEIH0sCi0tIAoy
LjIyLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
