Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90912F4D9F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30D96EA6A;
	Wed, 13 Jan 2021 14:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2546EA5F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d13so2384746wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AKZe0pvPLHu3x895juPn/Z4GbXtcqzxxje+6pz86KU=;
 b=MweOdz1mBiZ3YANYAenthalC1RAZ2L7YBzcfY2mxwBScLf0FZ7dfPLhGVCYJ3wStLt
 C3s1vvBrFa415Wr1aCWWYyc6yuvzFexaNiSTEv/rsPJ+qSMCxbo/gkIkbK6PkL7+YYiN
 j4X4qJFw6IVfKE3+eKxdcIPKq3uf/B3BN8WWKumhwaTV44EooXi7ZrrsGRMN/hPU9R9g
 aM2d+N3S2d8PdXVSrkZFhnz4GytrdOwPuh2vbjAk7nR/Um1bObWFqsibjGktJZnkTX2+
 LSnF9sH+yRTO8ixzJlE682O8bs4obJ1NQRctXzq69GkYjy20O7QmRaSjmdm9hW95TO4e
 51pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AKZe0pvPLHu3x895juPn/Z4GbXtcqzxxje+6pz86KU=;
 b=ila38zexkNwRpGNl0t79I9dEPhmRPQEn86XqxtyJ4ctQvhkWSMWUOEF2dpZBWJ086/
 YvLuPnno9SSkHdxDRn/hCDsbkecZqXUUaMCPJOTcAYcnUtNF2QvSVwqr7zdaehmE0dIm
 FBkQyuDRU8Blqukpoi6I+i57m3n7wPs3JW/Za+lS31avP3AjarNuA+WyLLxKY2fJie3G
 9r41w9M4iJQp28sEiq3qk+64dhDWaDZWXfnBAKBlpuKN5S4Hjv3WP8GuDH3BcGpEaCEU
 GYgoI/UwuinhfgHz8huxCagQQpFLcO2E1FdqsLt01P+ENKgKyjS3mgSVgTMuRVwrhaR+
 Mxug==
X-Gm-Message-State: AOAM532l1rFInmhaCi3sccWZ8228/GwqCdbGWdbnUmDP+68SsRcs1rjb
 eVul080fptuNWD+hw0MJw0LE9A==
X-Google-Smtp-Source: ABdhPJw5rVCSN67wNU6TdCizFMPeOQwAc4JEScwBmwUscxQjY1orEkpeVLOPrWKc5N9q4Vjxl5enIA==
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr3073602wrx.310.1610549443321; 
 Wed, 13 Jan 2021 06:50:43 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/31] video: fbdev: core: fbcon: Mark 'pending' as
 __maybe_unused
Date: Wed, 13 Jan 2021 14:49:58 +0000
Message-Id: <20210113145009.1272040-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Jes Sorensen <jds@kom.auc.dk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 William Rucklidge <wjr@cs.cornell.edu>, Emmanuel Marty <core@ggi-project.org>,
 carter@compsci.bristol.ac.uk, Martin Mares <mj@ucw.cz>,
 Jakub Jelinek <jj@ultra.linux.cz>, Brad Douglas <brad@neruo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J3BlbmRpbmcnIGlzIG9ubHkgdXNlZCBpZiBGQkNPTkRFQlVHIGlzIGRlZmluZWQuCgpGaXhlcyB0
aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJjb24uYzogSW4gZnVuY3Rpb24g4oCYZmJjb25fZXhpdOKAmToKIGRyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jOjMyOTU6Nzogd2FybmluZzogdmFyaWFibGUg4oCY
cGVuZGluZ+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoK
Q2M6IGNhcnRlckBjb21wc2NpLmJyaXN0b2wuYWMudWsKQ2M6IFdpbGxpYW0gUnVja2xpZGdlIDx3
anJAY3MuY29ybmVsbC5lZHU+CkNjOiBKZXMgU29yZW5zZW4gPGpkc0Brb20uYXVjLmRrPgpDYzog
RW1tYW51ZWwgTWFydHkgPGNvcmVAZ2dpLXByb2plY3Qub3JnPgpDYzogSmFrdWIgSmVsaW5layA8
ampAdWx0cmEubGludXguY3o+CkNjOiBNYXJ0aW4gTWFyZXMgPG1qQHVjdy5jej4KQ2M6IEJyYWQg
RG91Z2xhcyA8YnJhZEBuZXJ1by5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJjb24uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKaW5kZXggYmY2MTU5OGJmMWMzOS4uZjNkNjI4
ZmQwN2RjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKQEAgLTMyOTIsNyArMzI5Miw3IEBA
IHN0YXRpYyB2b2lkIGZiY29uX2V4aXQodm9pZCkKICNlbmRpZgogCiAJZm9yX2VhY2hfcmVnaXN0
ZXJlZF9mYihpKSB7Ci0JCWludCBwZW5kaW5nID0gMDsKKwkJaW50IF9fbWF5YmVfdW51c2VkIHBl
bmRpbmcgPSAwOwogCiAJCW1hcHBlZCA9IDA7CiAJCWluZm8gPSByZWdpc3RlcmVkX2ZiW2ldOwot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
