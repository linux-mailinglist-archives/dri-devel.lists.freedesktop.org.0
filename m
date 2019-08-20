Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CE96CB5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663CE6E8B8;
	Tue, 20 Aug 2019 23:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F163A6E8AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:06:34 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f19so229104plr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i6m141WDgWo2fEqKOTQPkh65ch/WaZ2zC8BGag2kGAk=;
 b=fP9tFsJ75Npcl8tRJkGMMnlCfT6SLRjm2ELMATPUnIWgKoDm29YfG+DDobJ4pLNflK
 CXin2556xgFrhRFAaG2ifJPx/Vca4xe/X2lkvpaaUGV3fbFYA3lYnP2xWjX/Ikt9KRlW
 mCGVgOn0wc42k87Jilw0xnFInlFRcuoe9vVY28nvorwRrwzmtabLTE671y848brVDaex
 gQjR7n/ZgtBCWpygVs8UEl6a8HgisUiWKah3Z8OG4Sn1LBVMQ7M1XAPw/VPdgHD+EtpN
 LabOTTO15oz9BlRTPxvi1TMqf5MXLX/9hrAc/QlKwZNlfGOVhYCnyy1LlVR9457t6voV
 NAaw==
X-Gm-Message-State: APjAAAXzc/8F/t7vAdFKThpMzqChrsnPn2shQ0ByTuspZhvKat57CJex
 Zwa2BfxApIbzhI87KPtxxQTutA==
X-Google-Smtp-Source: APXvYqwSD86miSdIr5XIL6amQdd092Qu4cUoqGCUj8MABeZCa7rID5KZaxQ4HCPPF75msEeuaCPuMg==
X-Received: by 2002:a17:902:9f8e:: with SMTP id
 g14mr31066446plq.67.1566342394450; 
 Tue, 20 Aug 2019 16:06:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:06:33 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 03/25] drm: kirin: Remove unreachable return
Date: Tue, 20 Aug 2019 23:06:04 +0000
Message-Id: <20190820230626.23253-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i6m141WDgWo2fEqKOTQPkh65ch/WaZ2zC8BGag2kGAk=;
 b=xU3RqNBdba+sjj16E8oEggAfQ3tfoyAiSrPQbTkSPPgvVvJd17JZENyO47OSnMtF/J
 arQsfrqPH6HE4qSgYaDIVVZ6NYgELBTOHWU/uyOzReRxybENDaylvj05Wldh9PDCSIq+
 klWJKX6XnHYYBbQjNTWo7zETkfk8t+J8XCBHpHQo8hKOQ1S/r/9h/0fWizsnZfbbCjIo
 AnEX938ZPQIanIojy4XrVQtESf5XZhDnt1rTmD/UY/C6opfQvyxkOscJKzqEW4vhIZj8
 nn9z024aVq6ZGP02cOJejzYba2lo48VNhCqvPSz+C1pNe1BTXFzJ+ttD2lu/QbK81nDn
 k2iw==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdyZXR1cm4gMCcgaW4ga2lyaW5fZHJtX3BsYXRmb3JtX3Byb2JlKCkgaXMgdW5yZWFjaGFi
bGUKY29kZSwgc28gcmVtb3ZlIGl0LgoKQ2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21h
aWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFja2VkLWJ5OiBYaW5saWFu
ZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU3VnZ2VzdGVkIGJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5n
QGhpc2lsaWNvbi5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2Rydi5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwppbmRleCAyMDRjOTRj
MDFlM2QuLmZjZGQ2YjFlMTY3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNv
bi9raXJpbi9raXJpbl9kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fZHJ2LmMKQEAgLTIwOCw4ICsyMDgsNiBAQCBzdGF0aWMgaW50IGtpcmlu
X2RybV9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCW9mX25v
ZGVfcHV0KHJlbW90ZSk7CiAKIAlyZXR1cm4gY29tcG9uZW50X21hc3Rlcl9hZGRfd2l0aF9tYXRj
aChkZXYsICZraXJpbl9kcm1fb3BzLCBtYXRjaCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGlj
IGludCBraXJpbl9kcm1fcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
