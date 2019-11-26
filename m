Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901DA10A421
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 19:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F216E1E8;
	Tue, 26 Nov 2019 18:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2A26E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 18:43:44 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id k20so4067603pll.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pT2wJFLKID1h3HcgPf2KHbbcwubk2DWN3Ne5EOqdu0=;
 b=MHS0pZz/9PZya40FVNRKOwdZVdeo4GiGc2CCgxS5xAC+4WGy4658lHLF1suT+CdQKM
 2Lk9bbn8FyT8jNzvoSZoGHH27UpPdCP5FSx63QK/BHLysGKpIIPIjQ9nZakmXV/70jrK
 4HI+Wh/YbVlCbone1WOH9/LE/9bwKSnUCL0nDSJxBQ96i7E0VkVF2ck0MEEYBxv9NVqX
 TDz4PG9AQJixqn2bQoj+4kHoApnw9My6qttNuimYOL1IbAHxb+sASxy9jsXhW2KKIm6w
 F8XplVIc/qnBCPLOUwyl9XCu4Ax2OOjhxHLdF8WTlIPXryaF0/zckjvO7GtV/BStYD24
 C1eQ==
X-Gm-Message-State: APjAAAUfvMJ/auoNzMyReNRe6Tmo7T9Vi4tlj8qnyX58znX0UluPu4be
 3YHcFB54Z4n09liDVxzWbXSf5cc9qT0=
X-Google-Smtp-Source: APXvYqx+hgD3sxbcFBg+81vQ75EApEcwgIDBVlIX4ScwlmKZSn8HLnMxyNx34cTOMmGxAqDU3AFH4Q==
X-Received: by 2002:a17:902:24b:: with SMTP id
 69mr34751545plc.203.1574793824076; 
 Tue, 26 Nov 2019 10:43:44 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w5sm2642950pgb.78.2019.11.26.10.43.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 26 Nov 2019 10:43:43 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vram: remove unused definition
Date: Tue, 26 Nov 2019 10:43:39 -0800
Message-Id: <20191126184339.337-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pT2wJFLKID1h3HcgPf2KHbbcwubk2DWN3Ne5EOqdu0=;
 b=J2wb5QEklWkxxvBNA8Gh14fpm6LDTGyyApJLckFnpnWgjZ8Eh9CZuSfRC4Rx2k+6hG
 Mdn21XKnsevlW5tGthC2xszyD6RrT+ZkloyFyj+qiCz4VAMm6o8NzYTs+RvrF/xmOOIh
 cV99CPI0WSK4V8py1l/5vaZdcPkGOje/J0Ktk=
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
Cc: tzimmermann@suse.de, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IGIwZTQwZSAoInZyYW06IEhhdmUgVlJBTSBNTSBjYWxsIEdFTSBWUkFNIGZ1bmN0aW9u
cyBkaXJlY3RseSIpCnJlbW92ZWQgdGhpcy4KClNpZ25lZC1vZmYtYnk6IEd1cmNoZXRhbiBTaW5n
aCA8Z3VyY2hldGFuc2luZ2hAY2hyb21pdW0ub3JnPgotLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmgKaW5kZXggZTA0MDU0MWExMDVmLi4wOGFkYWYzNjk1ZWEgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKQEAgLTE2LDcgKzE2LDYgQEAgc3RydWN0IGRybV9t
b2RlX2NyZWF0ZV9kdW1iOwogc3RydWN0IGRybV9wbGFuZTsKIHN0cnVjdCBkcm1fcGxhbmVfc3Rh
dGU7CiBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGU7Ci1zdHJ1Y3QgZHJtX3ZyYW1fbW1f
ZnVuY3M7CiBzdHJ1Y3QgZmlscDsKIHN0cnVjdCB2bV9hcmVhX3N0cnVjdDsKIAotLSAKMi4yNC4w
LjQzMi5nOWQzZjVmNWI2My1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
