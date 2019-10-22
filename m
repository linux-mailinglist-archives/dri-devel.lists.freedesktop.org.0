Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F1BE13B4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B6F6E99C;
	Wed, 23 Oct 2019 08:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF936E462
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o28so16995483wro.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
 b=CuZ7XO0BZdhdMYH1/T2H8cb7TREychOYags2zpBC0L9U4JvUABi/B46fc9SP7xLeA6
 KJHQy1F/3s35qREQY7L9Tu7IsvlLfZVnLv+g1LE2K6bTvCh4fF1J/cA65/L2WNK4uaEq
 FFhIS20TRbN2UEq7Vo/TTOdC4YBiXBNhDPc87kc6oFsisK2mlPiatSTf0HKcWQsGEUic
 U9KF+tO+Yvl4aszYTmy0kmmN2j6PUpC5976SsCO8WdEHLcEh7gg2loqSif6zV4xeAH1x
 I6FzPE6ieh4u8740Ml5HCO3gnSO/dXW6A5FUhuH1Lcrh49LBKRbxCHZFt1fckwR1uyq5
 xXLQ==
X-Gm-Message-State: APjAAAXZEJLSd/3p0Mekpqdnd8fdiybi3xNSdMPs/UVCXea48psbxc5g
 QZufiHgfvxX0Ag0fdfbO52ii/g==
X-Google-Smtp-Source: APXvYqw+u7/kRo/kyLMNI3vyXRrtnO/cCP4ewAM9p5Okg1CflyD/yuwcP6eDPcrZB/Mod7dBy1vY5g==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr2324652wrr.66.1571733404239;
 Tue, 22 Oct 2019 01:36:44 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 7/9] backlight: gpio: remove unused fields from platform
 data
Date: Tue, 22 Oct 2019 10:36:28 +0200
Message-Id: <20191022083630.28175-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
 b=Fl1qTLhBQubCYTQvRFZGlqbpTFflj9tu3q08e1MlJzphl6MWRcspjYmiPTZQO2Nj6m
 L8FuqvAa/MmSqZfgRT8BK0odPTKh92doGHJtbxLFNYQ3Jq2IqO3h+/SX7sLrKDVjoZtO
 NcsW0dTxbzZRRQW+zVYC1/6FTVbUgWunR1cAtZ3QCODI0ZCAAS2VbKr/ZExzWJTjRnsS
 KZLvPQUIrnpg2BtCQrB5jK7IDHSB+/Xb4so9Es0sPAL3l52ve8BH3H/ygjsm0WkUjgPo
 z2OAjaxIvLaCP34M2mpYEXRyVWyNDFawxbs0agydIqrrRAhnwOhSTieVDVfZL8yBb/J3
 YAug==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJl
bW92ZSB0aGUgcGxhdGZvcm0gZGF0YSBmaWVsZHMgdGhhdCBub2JvZHkgdXNlcy4KClNpZ25lZC1v
ZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJl
dmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVs
LmNvbT4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5v
cmc+Ci0tLQogaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAz
IC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggYi9pbmNsdWRlL2xpbnV4L3Bs
YXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaAppbmRleCAzNDE3OWQ2MDAzNjAuLjFhOGI1YjE5
NDZmZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xp
Z2h0LmgKKysrIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmgK
QEAgLTksOSArOSw2IEBAIHN0cnVjdCBkZXZpY2U7CiAKIHN0cnVjdCBncGlvX2JhY2tsaWdodF9w
bGF0Zm9ybV9kYXRhIHsKIAlzdHJ1Y3QgZGV2aWNlICpmYmRldjsKLQlpbnQgZ3BpbzsKLQlpbnQg
ZGVmX3ZhbHVlOwotCWNvbnN0IGNoYXIgKm5hbWU7CiB9OwogCiAjZW5kaWYKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
