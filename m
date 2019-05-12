Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A41ADD9
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 20:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42208936C;
	Sun, 12 May 2019 18:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19328936C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 18:48:41 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d3so5268447plj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 11:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+tmCd02fCJiDUSiTQt8UkGfYRxlwTjJZiePzrILeZA=;
 b=p33AHhr6oohR+27Y7EfWIUJBHsRW3lorgGAryV49wJ61h8S1cTPXNsyuizEPvFNIqH
 1qsJ36hYvqY637QY1OcofAOSgHMDGee6HOiGfm7DojlrtDuHSbQqP7m3eZXnuSOmRyNn
 mX93SvmRhlbRxiBH7zpU5QnTI8uep4wplLaMVlfclWB/6+YwR1DrNRa/ugxxLT47WBtj
 ytKsGxv8ctZfSS301ngKJsM4p5cVFAB66+UNOlHJAgllDgxpEgjDqb/nrUgr1dUkD8z7
 WwwNAlrOV9YbNACgvX8GpvqbMAffo8kpBivUWesQqiSeOl4HWU/VwX+T3QqlfuwXPjKd
 eKgg==
X-Gm-Message-State: APjAAAUvofNgLaF5boSIgDemwOQY3lsrG5bI5eFd4WAFCPbz8L/8nNxC
 THhx0yzNaYWc8KgQwqNHvOnGHQ==
X-Google-Smtp-Source: APXvYqxAqVOknDpYxgct8nDYNHZfPNhxQmUq8NyMFF+aGH7SDmm/VOXXqCbFjxQPR4tIHMOF2/a6TA==
X-Received: by 2002:a17:902:8f84:: with SMTP id
 z4mr25127180plo.124.1557686921322; 
 Sun, 12 May 2019 11:48:41 -0700 (PDT)
Received: from localhost.localdomain ([115.97.185.144])
 by smtp.gmail.com with ESMTPSA id t26sm15216683pgk.62.2019.05.12.11.48.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 11:48:40 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: st7701: Swap vertical front and back porch timings
Date: Mon, 13 May 2019 00:18:27 +0530
Message-Id: <20190512184827.13905-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L+tmCd02fCJiDUSiTQt8UkGfYRxlwTjJZiePzrILeZA=;
 b=bCbkjSfUL2gmcqSGvbPBb18gk9fHdbxrFoqityYU7SzakDp/If7y+tOR4CZzvjIWDs
 Njc7zBNZHf+z8/w6ZzH+nFE8RIHoj2ZXgL3eB8dXGJftZ9nQ3pRuG9sUgqQOB4Ju6WTs
 IGoDFDxJIS2FQxc8SlsUoESDbIDZL+54R/s9s=
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VmVydGljYWwgZnJvbnQgYW5kIGJhY2sgcG9yY2ggdmFsdWVzIG9uIGV4aXN0aW5nIGRyaXZlciBh
cmUgc3dhcHBlZC4KVGhlIGV4aXN0aW5nIHRpbWluZ3MgYXJlIHN0aWxsIHdvcmtpbmcgYXMgZXhw
ZWN0ZWQsIGJ1dCB0byBtYWtlIHN1cmUgCml0IGNhbiBjb21wYXRpYmxlIHdpdGggdGVjaHN0YXIg
dHM4NTUwYiBic3AgdGltaW5ncyB0aGlzIHBhdGNoIHN3YXAKdGhlIHNhbWUgdmFsdWVzLgoKU2ln
bmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0NzcwMS5jIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0NzcwMS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0NzcwMS5jCmluZGV4IDYzZjlhMWM3
ZmIxYi4uMDljNWQ5YTZmOWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2l0cm9uaXgtc3Q3NzAxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
dHJvbml4LXN0NzcwMS5jCkBAIC0zMDUsOSArMzA1LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlIHRzODU1MGJfbW9kZSA9IHsKIAkuaHRvdGFsCQk9IDQ4MCArIDM4ICsg
MTIgKyAxMiwKIAogCS52ZGlzcGxheQk9IDg1NCwKLQkudnN5bmNfc3RhcnQJPSA4NTQgKyA0LAot
CS52c3luY19lbmQJPSA4NTQgKyA0ICsgOCwKLQkudnRvdGFsCQk9IDg1NCArIDQgKyA4ICsgMTgs
CisJLnZzeW5jX3N0YXJ0CT0gODU0ICsgMTgsCisJLnZzeW5jX2VuZAk9IDg1NCArIDE4ICsgOCwK
KwkudnRvdGFsCQk9IDg1NCArIDE4ICsgOCArIDQsCiAKIAkud2lkdGhfbW0JPSA2OSwKIAkuaGVp
Z2h0X21tCT0gMTM5LAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
