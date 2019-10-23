Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14047E13B3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086E26E999;
	Wed, 23 Oct 2019 08:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79FA6E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 05:00:36 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q21so12099469pfn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 22:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EDODrmyOGAOqB9qtNo2M1fV2YoGZiwu66fxJX/b8Z8c=;
 b=BTYEqFyNNfvsCqtdh+x0ksTGvA2KC37+RYRGlI9T3h9qCzPfnz0lxC249CR+Jgh4JW
 9zqHFTgYIY9XUn6pMDaoiog1LMS1zs95YfoNJIshvPR9tJz0QM1ojEDTB3QI7BK/PBJc
 Fjo1qfMfx8QjGWhsIJu5gML5FI9PtiTlz1H4t7K8lIVYH2Kvojj0+soug/Lwm9yPp/VN
 apYU6QoAHJ2T1bmt92K55ICSU5VC0vHit2ur3ONnjgHhSj7+wwdyB1FkkpEzUpTmRCJw
 KYNcHHZ5yKvpRTosutsHhXauWUrpyDZWXx/nvzboZbYsXKrjQrvSWcwL1EtcNHbsfVy4
 E9Gg==
X-Gm-Message-State: APjAAAXD+/ssY7wFDvha8xsGYXnBwSvjcT3JaV994UMaijrvMFAbtZK2
 X5uK0D7nTAegbBW58UyzOJs470R/
X-Google-Smtp-Source: APXvYqzdPLKD2gsnnjhVQJBuTwwKf4arW310y7iftzUWnyvp7oFMqc4OOwV9YsW/0CMRKEuW7o9fqg==
X-Received: by 2002:a62:7c4d:: with SMTP id x74mr8228577pfc.259.1571806835841; 
 Tue, 22 Oct 2019 22:00:35 -0700 (PDT)
Received: from bhanu-VirtualBox.danlawtech.com ([183.82.102.247])
 by smtp.gmail.com with ESMTPSA id c14sm24608529pfm.179.2019.10.22.22.00.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 22 Oct 2019 22:00:35 -0700 (PDT)
From: Bhanusree <bhanusreemahesh@gmail.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/gpu: Add comment for memory barrier
Date: Wed, 23 Oct 2019 10:30:02 +0530
Message-Id: <1571806802-17987-1-git-send-email-bhanusreemahesh@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EDODrmyOGAOqB9qtNo2M1fV2YoGZiwu66fxJX/b8Z8c=;
 b=uVlxHWghIR2+JXTTpztXjygYKoGAMmSxL3NOahmBrDhhldGyyWIM5XePjOzAufKIOR
 4U9hsBiNSGijA878rs56d+H3skI3lppWV0G00FyBTZZBzKEjQIyvU92vDStArXc15veV
 Zgf+gYM5HDH1uQrSb2QuOelsQk5uHgU7hRFJoweTE7Wj7qFD+jnhUj3dYBmBax9240el
 QLsj35hMT0PM1schY3Y5LizkfrDsv6rA/n0EnKz8Mtxc9KjTSmkYBlClzFOQi4FsErbb
 SKIUyPkDVs3+2DBQhh9vkXjpPTJv3JnyWIRX6D2Tubn2FMgr7w3ncklrAO9UIwnAzzAd
 rOew==
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
Cc: Bhanusree <bhanusreemahesh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LUFkZCBjb21tZW50IGZvciBtZW1vcnkgYmFycmllcgotSXNzdWUgZm91bmQgdXNpbmcgY2hlY2tw
YXRjaC5wbAoKU2lnbmVkLW9mZi1ieTogQmhhbnVzcmVlIDxiaGFudXNyZWVtYWhlc2hAZ21haWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKaW5k
ZXggM2JkNzZlOS4uMzk5MTBmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNo
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYwpAQCAtNjIsMTAgKzYyLDEwIEBA
IHN0YXRpYyB2b2lkIGRybV9jYWNoZV9mbHVzaF9jbGZsdXNoKHN0cnVjdCBwYWdlICpwYWdlc1td
LAogewogCXVuc2lnbmVkIGxvbmcgaTsKIAotCW1iKCk7CisJbWIoKTsgLyptYWtlIHN1cmUgcGFn
ZSBhZGRyZXNzIGlzIHJlYWQqLwogCWZvciAoaSA9IDA7IGkgPCBudW1fcGFnZXM7IGkrKykKIAkJ
ZHJtX2NsZmx1c2hfcGFnZSgqcGFnZXMrKyk7Ci0JbWIoKTsKKwltYigpOyAvKm1ha2Ugc3VyZSBh
bGwgYWRkcmVzc2VzIG9mIHBhZ2VzIGFyZSByZWFkIHNlcXVlbnRpYWxseSovCiB9CiAjZW5kaWYK
IAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
