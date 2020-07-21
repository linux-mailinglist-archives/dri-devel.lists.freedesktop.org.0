Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C061F22860D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B506E28A;
	Tue, 21 Jul 2020 16:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FBB6E28A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:42:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 88so11573290wrh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TVya3i2RYFmjDn+ApSCZmjqKSuYsjstrD5lmzrYcCv8=;
 b=cSQhe3GpFZLwDcOqe8hrwIBcCqhy1WXeYMuIdLJfCfWZeBQCDXPzn3pMxB1nazlOE/
 CVswu4QRfwLMmGkgIjLDb+7ABgpgobEgfnOJF108eU188HMAFiDMqHSw1O86PMZxaytv
 jnMG7es22SSHN5QWOamQFJi/CJb8wp5fyvtc10G4sgM5J06aQkF9/ZJ1vTR08HVDKixA
 GiMfdcdsnFiPPXBLQNg0Bfb3KkCk/6H5gBokXyKRP1b8xxrLEnj42rm923hcEK1MFw/g
 oapqloEgzSomASzZ08MYGCEk5YLYbGvntXakIiGl4DkBG/g/BeBfRMCfZmCJbZ2H8bdq
 CikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVya3i2RYFmjDn+ApSCZmjqKSuYsjstrD5lmzrYcCv8=;
 b=QZAf4my+TutOo2DwTGDCGZVFPdy1FNbDiQM9FKANQxNF8ZwvjR9YoQPcG2UulieGvK
 s9GldjFF7gRJDY+FTEEwr5OpH9fYiEXcJl6t8E1Q7U9yrU5YW/daQsJVEg7nPbGPvEto
 aH90qoMiM0JwOqVfqDpOakUg/iPj0Py3R/xCim+EDBZK2PPA3kkQvByb4RPKqKufYt+d
 DpajupjDY7qePlmnpbkN3EfVhRLixajlDKGlUrVI0C97kQO50Va5Sbr1RS0O0H1lEU+d
 1OpOmXAkMggc8+r2/4UeKy6XdY112x6IAuqdSZh79/jGHQNfuh2Vq7SzlxYAS7T3u5C5
 /Mrg==
X-Gm-Message-State: AOAM530mKfO0r8lFF5lp6v7Ge56y/drlRHaLFKO/6gQAGOlU5kn5d9g2
 1ROSM9iNsq07/hOMYjhhx3px/A==
X-Google-Smtp-Source: ABdhPJyYJSQbCGjzZ/HHRSdXd5WAJbAKCE0eLK46l5v37puMWdWQo3SYyslUvw9wc5pEwhmtZ1gg9w==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr4952074wrf.309.1595349765151; 
 Tue, 21 Jul 2020 09:42:45 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id m4sm3933524wmi.48.2020.07.21.09.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:42:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH 34/40] scsi: csiostor: csio_lnode: Demote kerneldoc that fails
 to meet the criteria
Date: Tue, 21 Jul 2020 17:41:42 +0100
Message-Id: <20200721164148.2617584-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200721164148.2617584-1-lee.jones@linaro.org>
References: <20200721164148.2617584-1-lee.jones@linaro.org>
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
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYXRjaGVzIHNvbWUgb2YgdGhlIG90aGVyIGhlYWRlcnMgaW4gdGhlIGZpbGUuCgpGaXhl
cyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL3Nj
c2kvY3Npb3N0b3IvY3Npb19sbm9kZS5jOjIwNzk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ2h3JyBub3QgZGVzY3JpYmVkIGluICdjc2lvX2xub2RlX2luaXQnCiBkcml2
ZXJzL3Njc2kvY3Npb3N0b3IvY3Npb19sbm9kZS5jOjIwNzk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ3Bsbicgbm90IGRlc2NyaWJlZCBpbiAnY3Npb19sbm9kZV9pbml0
JwoKQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGluYXJvLW1tLXNpZ0Bs
aXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Ci0tLQogZHJpdmVycy9zY3NpL2NzaW9zdG9yL2NzaW9fbG5vZGUuYyB8IDMgKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zY3NpL2NzaW9zdG9yL2NzaW9fbG5vZGUuYyBiL2RyaXZlcnMvc2NzaS9jc2lv
c3Rvci9jc2lvX2xub2RlLmMKaW5kZXggNzRmZjhhZGM0MWY3Ny4uNjFjZjU0MjA4NDUxYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zY3NpL2NzaW9zdG9yL2NzaW9fbG5vZGUuYworKysgYi9kcml2ZXJz
L3Njc2kvY3Npb3N0b3IvY3Npb19sbm9kZS5jCkBAIC0yMDY4LDEwICsyMDY4LDkgQEAgY3Npb19s
bl9leGl0KHN0cnVjdCBjc2lvX2xub2RlICpsbikKIAlsbi0+ZmNmaW5mbyA9IE5VTEw7CiB9CiAK
LS8qKgorLyoKICAqIGNzaW9fbG5vZGVfaW5pdCAtIEluaXRpYWxpemUgdGhlIG1lbWJlcnMgb2Yg
YW4gbG5vZGUuCiAgKiBAbG46CQlsbm9kZQotICoKICAqLwogaW50CiBjc2lvX2xub2RlX2luaXQo
c3RydWN0IGNzaW9fbG5vZGUgKmxuLCBzdHJ1Y3QgY3Npb19odyAqaHcsCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
