Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3563B8B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 21:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AE389FD4;
	Tue,  9 Jul 2019 19:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817F889FD4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 19:00:14 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id m30so9734746pff.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 12:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m85WlLZHJVH8RETgsg0HqiVDllfx4XvsXRbdu3drMNc=;
 b=F3JszP/Zn7A4coiGQZvP2jbzk57FryD2clPfsxSYW51FOhY0+rji2QVYZKdNmuOyit
 IQwc13jUpaM4IJI+1HjOyHzPv9XN6GcH7pSYsLlqzwQBxktxoIlWB0TiWostWXpC+EWk
 fgvuy9Bj+Fwoy7a2ulcpsEAPH6Ll2L0/kiPvx9eRDTgEpR8oTUXnWY4EuV0vthrVlkOZ
 n1hiSmDUWZbYSm/G3s1zy31nH8uYACIkiwrDYoCuBSKSvPUr6DCPJSdEqboZIQrKAube
 Ypx0GlULrDqe6D6LhwVlpcYi3Jw89Wfcrs/JFe+nHVk1Gc3einqVXjjQU+s+Zhb/DePo
 t8mQ==
X-Gm-Message-State: APjAAAWGab/Leh8IkopicWrEbPT2JbYZZOXZbvdr5iFJiX/e46feLTEw
 UpwTqC0f/AIVLLeBMoD+rGRTAg==
X-Google-Smtp-Source: APXvYqxDiBZW0Xb64K9vuI4D4EUi9LKfdzKQ60nHEzq2OO07kpy0OeqgLete4I10Vsc93WIyQfVezg==
X-Received: by 2002:a63:a1a:: with SMTP id 26mr31979652pgk.265.1562698814151; 
 Tue, 09 Jul 2019 12:00:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id g62sm3356521pje.11.2019.07.09.12.00.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 12:00:13 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 1/4] MAINTAINERS: Add entry for stable backlight sysfs ABI
 documentation
Date: Tue,  9 Jul 2019 12:00:04 -0700
Message-Id: <20190709190007.91260-2-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190709190007.91260-1-mka@chromium.org>
References: <20190709190007.91260-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m85WlLZHJVH8RETgsg0HqiVDllfx4XvsXRbdu3drMNc=;
 b=isQf2VDU03YGOtf8dFbZaoe7mOqoq6z2fbnfI76lyieAkq9c/O3MWRQWJsEu7o6Kv6
 +sO3jC2+6lChlABv2PHw4N+6FJo/vPGNbtghULmIYVEdHFqpxVU20P941UYVUnUfnmw0
 h+yt4jFHUsAjNf4RH7qkXTZR+LeFbJpXpHuk8=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIGVudHJ5IGZvciB0aGUgc3RhYmxlIGJhY2tsaWdodCBzeXNmcyBBQkkgdG8gdGhlIE1B
SU5UQUlORVJTCmZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNo
cm9taXVtLm9yZz4KQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxp
bmFyby5vcmc+Ci0tLQpDaGFuZ2VzIGluIHYzOgotIG5vbmUKCkNoYW5nZXMgaW4gdjI6Ci0gYWRk
ZWQgRGFuaWVsJ3MgJ0Fja2VkLWJ5JyB0YWcKLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwppbmRleCA1N2Y0OTZjZmY5OTkuLmQ1MWU3NDM0MDg3MCAxMDA2NDQKLS0tIGEvTUFJ
TlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTI4NTcsNiArMjg1Nyw3IEBAIEY6CWRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0LwogRjoJaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaAogRjoJaW5j
bHVkZS9saW51eC9wd21fYmFja2xpZ2h0LmgKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodAorRjoJRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2Zz
LWNsYXNzLWJhY2tsaWdodAogCiBCQVRNQU4gQURWQU5DRUQKIE06CU1hcmVrIExpbmRuZXIgPG1h
cmVrbGluZG5lckBuZW9tYWlsYm94LmNoPgotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
