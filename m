Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3F2B0D1D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8831B6E3AA;
	Thu, 12 Nov 2020 19:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7866E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p1so7126354wrf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kn9g1kMG5JlU7ctdIXE2LbkwCeCLbWZDScIEWNzvtKI=;
 b=LW3L37TwALnk4Q2xAPgEMzfzdr9zoa+spFmcHccQPbuhCyr3wHoD9YOlFlgX+pwBlq
 zqmKPE0BGKQsYMGsz0hzah+uMSULv+3zZt050EZH+He85XYyfbQbsHB4IHGeHUINSDHO
 7A+WAD3QCV6qvf0ix7jhR0+05n8cQYNx8iQx/aTB1liHFtvjGBJxfS9/GwD4HphiSkMY
 pLEEMq4AAv0ASpigUk1pEOCF28p/s1xmpNClKI2Vrpu0YrQuMN8akO1yxONVW6yL9cja
 XhIaSQvd0CYJk3NXYpq1viX+Yy2ayRVZ7lNdPpSeiQr5YO9EFVKrHYN+A5s1NfQuE4nx
 wzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kn9g1kMG5JlU7ctdIXE2LbkwCeCLbWZDScIEWNzvtKI=;
 b=AQnlyKZWrUwXcOspz9ldtRUJQ+1VAxCea9RC5XTLaQ2zL881vD9GvMAxt8jRThFcQ2
 uiAaDip+Xhe8GYOJlsguFJSsz9xEJ8gGK4Yj/33o2jpwckdWVE321SIED2R9VF8NM4kF
 0YYJCKEIaDaIkay8pMGdLyvZarvKQZ9ZNQY8JFK6gYWE1zRktWXh3hdFA31zP1ZE0hpJ
 zWBda86w1TcMF90c9Y9ut15MN+le5Zd7YRO0YumF+MpLEokUN+0X9FYwwze83ry6vJBg
 1TEqKO5AP09FzGNVKooszrfjrkrvy2qXMd6BlAihKX6mpycmpyOzZhKg34Ymv6q+r1bV
 HuPA==
X-Gm-Message-State: AOAM531b3LuJ3ASZZGbb2i9sT4GZAlf2rYR45NHQvmeDtLPeY/qCgmy7
 VTHPrCIswqZSnz84b/gmAAOwwg==
X-Google-Smtp-Source: ABdhPJz24AiC3oFR5b0ByLxHCL2PfXIsq4dpRc1qmLG97PHeh7my9FDsIQnfL+CA3CUQyuEg5yYupw==
X-Received: by 2002:a5d:4690:: with SMTP id u16mr1106632wrq.263.1605207667284; 
 Thu, 12 Nov 2020 11:01:07 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/30] drm/vc4/vc4_hdmi: Remove set but unused variable 'ret'
Date: Thu, 12 Nov 2020 19:00:20 +0000
Message-Id: <20201112190039.2785914-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jOiBJbiBmdW5jdGlvbiDigJh2YzRfaGRtaV9zZXRfYXVk
aW9faW5mb2ZyYW1l4oCZOgogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jOjMzNDo2OiB3
YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KCkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hk
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwppbmRleCA5NTc3OWQ1MGNjYTBi
Li5iODBlYjlkM2Q5ZDVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1p
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCkBAIC0zMzEsOSArMzMxLDgg
QEAgc3RhdGljIHZvaWQgdmM0X2hkbWlfc2V0X2F1ZGlvX2luZm9mcmFtZShzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCiB7CiAJc3RydWN0IHZjNF9oZG1pICp2YzRfaGRtaSA9IGVuY29kZXJf
dG9fdmM0X2hkbWkoZW5jb2Rlcik7CiAJdW5pb24gaGRtaV9pbmZvZnJhbWUgZnJhbWU7Ci0JaW50
IHJldDsKIAotCXJldCA9IGhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZyYW1lLmF1ZGlvKTsK
KwloZG1pX2F1ZGlvX2luZm9mcmFtZV9pbml0KCZmcmFtZS5hdWRpbyk7CiAKIAlmcmFtZS5hdWRp
by5jb2RpbmdfdHlwZSA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfU1RSRUFNOwogCWZyYW1lLmF1
ZGlvLnNhbXBsZV9mcmVxdWVuY3kgPSBIRE1JX0FVRElPX1NBTVBMRV9GUkVRVUVOQ1lfU1RSRUFN
OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
