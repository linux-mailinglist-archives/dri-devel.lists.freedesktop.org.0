Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA646B11
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6C289911;
	Fri, 14 Jun 2019 20:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4AA8984C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:29 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so5222582edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1K5gHUH66VVqzh7UAeMon8dGU/CWhoeaJEa8aQTsAVk=;
 b=k15PRhyTv0uiM0tW7YiatQ3x+WJbvrHN7WFibaPcnhSThVEydhZL5SdJ2fUzaTAkgq
 UFPO0m/Bmt8M/B3YMt+QUbefXE9gZZM3OqXHDLDifRFjM1trAepzI3F+piQ0+N5lLVXz
 dKQGa0OCfluYOPr/FHQyuZn9PLPix1yT0f6TT99qjDf97nGBveXPPYH96le4N5X/oIxe
 e4cfxQeoSXE6KOT4cpKwsMdAFkjBh/urbr0xE47lGKb6yDn2IXpUxnytyMRqioTOemnH
 dEwFbt5X3lqs1jdBPlli00WErGnuvrDj4DK81FllvwaToHs8euKnlyzIcD4Qpt92PGSU
 N08Q==
X-Gm-Message-State: APjAAAUo3WDJAZXknNDIDksYhPt1XKGPP2ZWDAx9Yz83JZ40JKWc3RYv
 jT8ybsOa1qLAPFzNEQ98x7wOBsr+SIo=
X-Google-Smtp-Source: APXvYqzuM+XPRtiL8TsxrPUJK8i9bGVa3U2FTEao0kO/2dFR1W5aDvY4KKMHc4BqWRd1mJFuc7PQfQ==
X-Received: by 2002:aa7:df93:: with SMTP id b19mr26006957edy.153.1560544647884; 
 Fri, 14 Jun 2019 13:37:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 58/59] drm/todo: Add new debugfs todo
Date: Fri, 14 Jun 2019 22:36:14 +0200
Message-Id: <20190614203615.12639-59-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1K5gHUH66VVqzh7UAeMon8dGU/CWhoeaJEa8aQTsAVk=;
 b=IFCXlLm4omIFJ3WO45Pgmupj2Z+027I+y67j+iNRtL3oAbPnU+ROtF1Ct9xgGO+9Jz
 ccInSuSZLR0B3Ugdbcc3yLT+OHDWp5uY74gZJE2tRUdS4jhjGxZZhEvmcyTE2ibsPPgy
 Fbh/4zuGjHvjLDBg3XnAh9jb4B+x2cwA5weN0=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R3JlZyBpcyBidXN5IGFscmVhZHksIGJ1dCBtYXliZSBoZSB3b24ndCBkbyBldmVyeXRoaW5nIC4u
LgoKQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+ClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0K
IERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0Rv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4IDk3MTc1NDBlZTI4Zi4uMDI2ZTU1YzUxN2Ux
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0
aW9uL2dwdS90b2RvLnJzdApAQCAtMzc1LDYgKzM3NSw5IEBAIFRoZXJlJ3MgYSBidW5jaCBvZiBp
c3N1ZXMgd2l0aCBpdDoKICAgdGhpcyAodG9nZXRoZXIgd2l0aCB0aGUgZHJtX21pbm9yLT5kcm1f
ZGV2aWNlIG1vdmUpIHdvdWxkIGFsbG93IHVzIHRvIHJlbW92ZQogICBkZWJ1Z2ZzX2luaXQuCiAK
Ky0gRHJvcCB0aGUgcmV0dXJuIGNvZGUgYW5kIGVycm9yIGNoZWNraW5nIGZyb20gYWxsIGRlYnVn
ZnMgZnVuY3Rpb25zLiBHcmVnIEtIIGlzCisgIHdvcmtpbmcgb24gdGhpcyBhbHJlYWR5LgorCiBD
b250YWN0OiBEYW5pZWwgVmV0dGVyCiAKIEtNUyBjbGVhbnVwcwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
