Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F54E1CD25B
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EE76E216;
	Mon, 11 May 2020 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D6889FDB
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m24so5817851wml.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QVJ+1fAj4aJcfIzG7KLUGxoLD4NHFj6b20tXq5SEIa4=;
 b=henRzJnuYReSCrFO8dT8/0yYkackqR7nMOzx+CWB4oeFTv+AEszy5e9EDWTTCZQRpu
 uXNji3zyuyRcjh6FpWhtXxFTODH/BlKbRc8ad91BkmERYkTJZXs1TUCg1YV2dQ6h798p
 o77l3IGx2Fv0gJ36qFihNpy/RYpdw1TT4FDh49jdB4Evh6940qKAV+Bmx97B2kSe7BnI
 dCFjplGGED5nzeXyp08yRQ2NxSlyPU1UC7Kwi8lu9Bn/mjRrz3tj3jtNxdd+Mo026ucw
 aeW8Re/ql4XxYQSuHsC6lLidLn8xVp6oKGL1AumKlgVuNfsPyG8aOhDVtXeBGQBqGVQW
 wJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QVJ+1fAj4aJcfIzG7KLUGxoLD4NHFj6b20tXq5SEIa4=;
 b=IUeS8dk2y2XktabZwUweE6cej1fw6sgHlpcE9zhi1zhcRW5e7srHSLEyKYiZdEmgVR
 5KXT/v0HEb8Aek4TwJZiaG/h5mj310GR6z9nhmrIcP5otLMhoZszDKu0mIggj90/+2G6
 GZmthIX4UsTJhHn9Bfl1qiNE2Xx4E+GVngzCbbgNf+8CZDY1rGjJFfJ0hKsO+5JyhUwV
 EcK1KY1mWRrU1SZNdJjATh/vQOCCB0jxP6R+fJ+tUO5SO+4T1Lm4a6587DmR7tyv9KTR
 CAo8VMWz8BFLZDrsGtaBY46ufZMQQVcEwkgM9MhbvDFJ3o78iCWTDL9f0+ZWH1QMmTdO
 wVAQ==
X-Gm-Message-State: AGi0PuYa2wewv1iE8Bnlis6RF0rk+V153vPA//193BKWywnRp3XQbqS5
 SY6LHANHCszrArwRG6NK5dY=
X-Google-Smtp-Source: APiQypK2evGKLkliWXP4Ao/8KEZGZEAKSrvQQOjhvUGgeRvZRYLGZZbaiAPW9psfNBrE9jGOqSgWnA==
X-Received: by 2002:a1c:4304:: with SMTP id q4mr28949907wma.152.1589129754970; 
 Sun, 10 May 2020 09:55:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 12/15] arm64: defconfig: Enable devfreq cooling device
Date: Sun, 10 May 2020 18:55:35 +0200
Message-Id: <20200510165538.19720-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGV2ZnJlcSBjb29saW5nIGRldmljZSBmcmFtZXdvcmsgaXMgdXNlZCBpbiBQYW5mcm9zdAp0byB0
aHJvdHRsZSBHUFUgaW4gb3JkZXIgdG8gcmVndWxhdGUgaXRzIHRlbXBlcmF0dXJlLgoKRW5hYmxl
IHRoaXMgZHJpdmVyIGZvciBBUk02NCBTb0MuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6ly
b24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25m
aWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
CmluZGV4IDY2OTQxMDI0NDE4Yy4uNDJkODVjMmMwOTQ1IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0
L2NvbmZpZ3MvZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKQEAg
LTQ5Niw2ICs0OTYsNyBAQCBDT05GSUdfU0VOU09SU19JTkEyWFg9bQogQ09ORklHX1NFTlNPUlNf
SU5BMzIyMT1tCiBDT05GSUdfVEhFUk1BTF9HT1ZfUE9XRVJfQUxMT0NBVE9SPXkKIENPTkZJR19D
UFVfVEhFUk1BTD15CitDT05GSUdfREVWRlJFUV9USEVSTUFMPXkKIENPTkZJR19USEVSTUFMX0VN
VUxBVElPTj15CiBDT05GSUdfUU9SSVFfVEhFUk1BTD1tCiBDT05GSUdfU1VOOElfVEhFUk1BTD15
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
