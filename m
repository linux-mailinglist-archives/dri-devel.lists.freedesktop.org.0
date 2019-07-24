Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D67A72EAB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DBF6E51B;
	Wed, 24 Jul 2019 12:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DC56E4AE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:25:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so45895334wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtXEm5EHLkMfau18VS0/ndTlnG64/pDTlbKgiSCBHXM=;
 b=S8pGlH+DtoE0bFokt4L2RjtUucdSEPtHD/rqNTVpYPGOlmZMYpf5eR7tOSBUdu7YE8
 Gjg8r/1cSnis4wuz+u7KuSuFTLhcnNEFl9JCxJB81fUeL5pNgarqWCTCLWquZqCSQxdC
 wC5lq4CNJT5Tp4z7792MjhbsfNhauiiaajlzyZnN3F4gvdpqoQnP5M+zySM1KLtreU0w
 2lGsUlupM5xL7Q/IWg7ONR8oZeqoGM2td3buAvtITsVD4XneYuGOXQvnDCvTP1RBg4nz
 CF7n9aHMH+6DOZouCShIPyYKPgZf77Af6La8XtO+qFr0291SJ8PCKonmEhvBtZw/oWMR
 pcEA==
X-Gm-Message-State: APjAAAVfJ/EeEUintQK6A7fbAwLwj4Hjch/xjKngDw2YPs6L4+gbNe+s
 DorfU73tHS6mjReENxD5bHw=
X-Google-Smtp-Source: APXvYqwzyOuZJqgrEqGk5ckOvAjzeH6Yh+/HufAQdFV4AXpJer4oPxFe3x+2qPBsY0spQGgjJr4fWA==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr11543282wrn.11.1563956717025; 
 Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:25:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 4/7] backlight: gpio: remove unused fields from platform
 data
Date: Wed, 24 Jul 2019 10:25:05 +0200
Message-Id: <20190724082508.27617-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtXEm5EHLkMfau18VS0/ndTlnG64/pDTlbKgiSCBHXM=;
 b=pjvnwWlg1S0JJObJ4VAQYglevZH6RzmSr9LO8Vogmks9DNfq/Ol7Vv994gV+BUd3ea
 BzBvGJRFZG460Sx04z9WdPLd5/AWYUsRQsPfSbsvEdQZbEzWUWAM2vwkxE7EBHXG+iQY
 h3q3/kwA6euG7dAy9zWHIe292Lm41qMYTqLzrGHC6RXOOWBrDIlBoML4fRdfoSzJrh1v
 8924F2s+Z5KscpUb/O8kWJ0k9TcHopYH2o18DLKSTopAiitXP7ZveOS4UIOKF6zdZHJm
 QGVgGP4zLRsWceIkaRs7WzkZzgwaK5qgmUcXdwmgxGYb9fTRcWyQYB+4fwYPsXpV6aCj
 u2xA==
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
LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaCB8
IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaCBiL2luY2x1ZGUvbGludXgv
cGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oCmluZGV4IDM0MTc5ZDYwMDM2MC4uMWE4YjVi
MTk0NmZlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNr
bGlnaHQuaAorKysgYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQu
aApAQCAtOSw5ICs5LDYgQEAgc3RydWN0IGRldmljZTsKIAogc3RydWN0IGdwaW9fYmFja2xpZ2h0
X3BsYXRmb3JtX2RhdGEgewogCXN0cnVjdCBkZXZpY2UgKmZiZGV2OwotCWludCBncGlvOwotCWlu
dCBkZWZfdmFsdWU7Ci0JY29uc3QgY2hhciAqbmFtZTsKIH07CiAKICNlbmRpZgotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
