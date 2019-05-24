Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87712939F
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155416E0C1;
	Fri, 24 May 2019 08:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F706E0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:09 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e24so13341776edq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yy90SY5/chDu3adwLkHoQhEeL0uOM1NOJmociVMUU4s=;
 b=ayoHJYkiGk/sVBB6Fuww7i/6Adt9RDHrFfzqnSPSLGZDr1BwhX6p8hpGW2BQVuNPmZ
 rNzlLt2oMgwyIvsbGRaL5p/LESD9fBCyD8uj88qi0dyT1EzKZG5gLm7p47+Uo02ckQQp
 h3ky9UVHOj4uKJpfFkl0bxCymdx0AdYk9jMNwTFsh6LRVdPZoKQ9xwHQRAMjbm6GpDKt
 T03yIWPAcLP7BjBU7aUoDXS9f8DkLAktSDrAHqQVSyROvItCZbZ/S6DGKGStRvTAQ9/x
 uy+dWNOwcqtYfk1FlNRrmDWWmwrNAreQvVdui36JmhdIINXdBj1xFlLXk2mrUgglRBkl
 k/qw==
X-Gm-Message-State: APjAAAXtaGxSJECbhuvWrNglWuwlY3r5ccles26O7LKJyhrWUoP7hme8
 m608jUSSKhJLEwdlwo6Sls5OKA==
X-Google-Smtp-Source: APXvYqz15CcdTjoLDAvdkpWywDjCZ1ETBfsWrIz7EZVLfyKyYHnY14mFy7VmZfhdjvd4e/aLWEyXzA==
X-Received: by 2002:a50:b19a:: with SMTP id
 m26mr103783554edd.243.1558688048165; 
 Fri, 24 May 2019 01:54:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 06/33] fbdev/cyber2000: Remove struct display
Date: Fri, 24 May 2019 10:53:27 +0200
Message-Id: <20190524085354.27411-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yy90SY5/chDu3adwLkHoQhEeL0uOM1NOJmociVMUU4s=;
 b=cr4/gjFrfCNevqAiAU9XqP6SgaiJysx3vBZGTSUBi4Tj3eINXfE6JbxBD90g/EpTwJ
 4JQVeLiyNj3LzpQgPFL5r1fEe1QbInyfZNSa+ug0Hhv2ZX76nidAtG293D6DcIILXwb9
 ub+6k0ddJsOAmQfUOdPQyaUFYod34VrM/+dBQ=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW50aXJlbHkgdW51c2VkLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+CkNjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4K
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwotLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY3liZXIyMDAwZmIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMKaW5kZXggOWE1NzUxY2I0ZTE2Li40NTJlZjA3
YjNhMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY3liZXIyMDAwZmIuYworKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMKQEAgLTYxLDcgKzYxLDYgQEAKIHN0
cnVjdCBjZmJfaW5mbyB7CiAJc3RydWN0IGZiX2luZm8JCWZiOwogCXN0cnVjdCBkaXNwbGF5X3N3
aXRjaAkqZGlzcHN3OwotCXN0cnVjdCBkaXNwbGF5CQkqZGlzcGxheTsKIAl1bnNpZ25lZCBjaGFy
CQlfX2lvbWVtICpyZWdpb247CiAJdW5zaWduZWQgY2hhcgkJX19pb21lbSAqcmVnczsKIAl1X2lu
dAkJCWlkOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
