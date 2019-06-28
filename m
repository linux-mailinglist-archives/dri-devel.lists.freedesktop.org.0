Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660A5B13A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8389D42;
	Sun, 30 Jun 2019 18:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101986E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:03:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 207so8490301wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
 b=cHRAnVGVy830wQHeVNWjVwEXGtarWD1efjirLitOvO/haD8k650v6sHj6guHDFvXfX
 oDYBTIgKYvuBt/DNkT45ouPVac+99vdzegZkAWUj9905gx8Ro+Gs+R/Zo6eZtqGrwsyr
 y8eaLqF1RL+v7458dAhd2a/2UwDKK5Km0LU3VR76Oq0JIFT0m9lo2BdGXN6jdmXehodT
 ca5Ifik3Gse8Ha0PFJzaifedyyWiIVhCqgHZ1ftTaOLNXPvNCoVO7xUldKZl8yqV3qPY
 4AZc2fE8JbjBxoBcOcPGe3/2o1TgIDYO13VwmECibSSm9sr1eM4wXHO6zVN5fm04ZOBj
 hROw==
X-Gm-Message-State: APjAAAU8z1g7KwurbJr02H59QdVnFJ3hNBaFhZLGgtIKIBQvaGWCQf66
 /hXgDZTG0Udguz6pekGXaRZKxQ==
X-Google-Smtp-Source: APXvYqwJX9x/uwYqffqMsBH3PX5OmMDmgZ/93GpHvTIYXbJMNuLuI1utY/Q3MxYU6lzYE9800yi4Gw==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr6397513wmc.175.1561716186765; 
 Fri, 28 Jun 2019 03:03:06 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 03:03:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFT 3/4] sh: ecovec24: don't set unused fields in platform data
Date: Fri, 28 Jun 2019 12:02:52 +0200
Message-Id: <20190628100253.8385-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
References: <20190628100253.8385-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
 b=1kAaf6/E5+mGz2iHvV/w6LgbjXUhE1J3FzxAzvc/ZMLUb2zRO7JwW9EipA8C/jmpZz
 5HUle30z3/HdqsLsnPco+ax5qINUWQ4s7k4ggjosmlI/fbBXZm++e4cEugXp9BjHU4Qx
 tDbhB8VtKAOUXH+bWAlP3YAAdpR1/eiNGnr8Lw/R5l0m9gvXcqTTk656VSTq2JetlXPl
 mOFupK5XnTtvkJeO3/5iAsjwwzfMMZDAE3F7gDLzbahlsVVEIgrGTVx5hTTAHoDNnoXS
 n6Ms2cgxcakJiTfWkYmP27eXz32j6fhqow/QWLg8746IpufcteQsu1UzegGhleFtdr8W
 63pA==
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
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClBs
YXRmb3JtIGRhdGEgZmllbGRzIG90aGVyIHRoYW4gZmJkZXYgYXJlIG5vIGxvbmdlciB1c2VkIGJ5
IHRoZQpiYWNrbGlnaHQgZHJpdmVyLiBSZW1vdmUgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEJhcnRv
c3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogYXJjaC9zaC9i
b2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0
dXAuYyBiL2FyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYwppbmRleCA2OTI2YmIz
ODY1YjkuLjY0YTVhMTY2MmI2ZCAxMDA2NDQKLS0tIGEvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292
ZWMyNC9zZXR1cC5jCisrKyBiL2FyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYwpA
QCAtMzg2LDkgKzM4Niw2IEBAIHN0YXRpYyBzdHJ1Y3QgcHJvcGVydHlfZW50cnkgZ3Bpb19iYWNr
bGlnaHRfcHJvcHNbXSA9IHsKIAogc3RhdGljIHN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9y
bV9kYXRhIGdwaW9fYmFja2xpZ2h0X2RhdGEgPSB7CiAJLmZiZGV2ID0gJmxjZGNfZGV2aWNlLmRl
diwKLQkuZ3BpbyA9IEdQSU9fUFRSMSwKLQkuZGVmX3ZhbHVlID0gMSwKLQkubmFtZSA9ICJiYWNr
bGlnaHQiLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaW5mbyBn
cGlvX2JhY2tsaWdodF9kZXZpY2VfaW5mbyA9IHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
