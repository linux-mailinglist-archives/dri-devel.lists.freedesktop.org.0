Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB32F4DA5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15F6EA65;
	Wed, 13 Jan 2021 14:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539A46EA62
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t16so2417462wra.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GoUfRt23bqbKPl1TGglCjWozG44qym29OpcwnZGK6kU=;
 b=DVx9RGOhwl5u8ldZy5VrfBB5nqUBSa6oCbOAtc/naAE4if9nM+qG1VzCKee+LVG+3B
 pYMHjLmmVhejEEkmBIU3VqOIbS0QbervpRSbvt8RbrJ65WI6sdAQJIFHQBuqYquGY9sm
 C0BoNNBF1vlcU19yuj0aroZuKk5XVtUWIzVX0dv3Fl5+wU5eXqndsETD1SuasAlFPapO
 Ndex26m6UwPr44hJ1bIN/A68qcXyyjbFTxYEWrG/wLv+f8ePNT5PGN0tbNcfIJ6tyYVQ
 66n2l1NmCju3l+XV3FxP/N8a/cWJvm9uSD3UZcReTj1OIqHd9zRtoKkjQOixv9hbaPDF
 TjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GoUfRt23bqbKPl1TGglCjWozG44qym29OpcwnZGK6kU=;
 b=TKyK2xm2iEPjCQohGLGiVxC6nnOxP0hIn8sa18WhOQ4dFvjwjb5FGHsbJ7vsjGqaZ0
 RD/QQriswi4pLPBWgty0RYrsc6hsDwFjWvEBq3Et8dybJ/9NR0IqWLHJ8W+cj5lEectR
 IdqltW2bN3oMwuRce0ag4wfmv8q2iBNtSP/0XMEdBeFXQzAh6FgqoJCthuYQzMYiJjls
 Rfe59O5w2KeLJPRgWKGwzNSkn4nDwFEgLwZAAyCDrLSfFoWzLN9/yXxXJf4HJ+cvpNK5
 yMYrlK4rZeLzLfEZK/HaO1fmgDJJMwfSkNphKvtca0FHB5LJeNOzjoZccYlEHec952+z
 7SoQ==
X-Gm-Message-State: AOAM533mZ5TgZ249eRY1+tyITlbNiuW0EFRaU21YXt0ZkEHynHeqkZIN
 h1WeGX7meDY7HHchTDb9hvMDVQ==
X-Google-Smtp-Source: ABdhPJzAZpIkSU3ZuxYWodWKq2E4apdvM/gowpmYALF9g0lHHwu0yWyxlERCrNd/IkX0NEsPk4cbEg==
X-Received: by 2002:a5d:6852:: with SMTP id o18mr2897319wrw.371.1610549445789; 
 Wed, 13 Jan 2021 06:50:45 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/31] video: fbdev: cirrusfb: Remove unused variable 'dummy'
 from 'WHDR()'
Date: Wed, 13 Jan 2021 14:50:00 +0000
Message-Id: <20210113145009.1272040-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9jaXJydXNmYi5jOiBJbiBmdW5jdGlvbiDigJhXSERS4oCZOgogZHJpdmVy
cy92aWRlby9mYmRldi9jaXJydXNmYi5jOjI0NjY6MTY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGR1
bW154oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzog
SmVmZiBHYXJ6aWsgPGpnYXJ6aWtAcG9ib3guY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9mYmRl
di9jaXJydXNmYi5jIHwgMTQgKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRl
di9jaXJydXNmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jaXJydXNmYi5jCmluZGV4IGU5MDI3
MTcyYzBmNTUuLmYwNTE2MGZhMzRkYTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
Y2lycnVzZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NpcnJ1c2ZiLmMKQEAgLTI0NjMs
OCArMjQ2Myw2IEBAIHN0YXRpYyB2b2lkIEF0dHJPbihjb25zdCBzdHJ1Y3QgY2lycnVzZmJfaW5m
byAqY2luZm8pCiAgKi8KIHN0YXRpYyB2b2lkIFdIRFIoY29uc3Qgc3RydWN0IGNpcnJ1c2ZiX2lu
Zm8gKmNpbmZvLCB1bnNpZ25lZCBjaGFyIHZhbCkKIHsKLQl1bnNpZ25lZCBjaGFyIGR1bW15Owot
CiAJaWYgKGlzX2xhZ3VuYShjaW5mbykpCiAJCXJldHVybjsKIAlpZiAoY2luZm8tPmJ0eXBlID09
IEJUX1BJQ0FTU08pIHsKQEAgLTI0NzMsMTggKzI0NzEsMTggQEAgc3RhdGljIHZvaWQgV0hEUihj
b25zdCBzdHJ1Y3QgY2lycnVzZmJfaW5mbyAqY2luZm8sIHVuc2lnbmVkIGNoYXIgdmFsKQogCQlX
R2VuKGNpbmZvLCBWR0FfUEVMX01TSywgMHgwMCk7CiAJCXVkZWxheSgyMDApOwogCQkvKiBuZXh0
IHJlYWQgZHVtbXkgZnJvbSBwaXhlbCBhZGRyZXNzICgzYzgpICovCi0JCWR1bW15ID0gUkdlbihj
aW5mbywgVkdBX1BFTF9JVyk7CisJCVJHZW4oY2luZm8sIFZHQV9QRUxfSVcpOwogCQl1ZGVsYXko
MjAwKTsKIAl9CiAJLyogbm93IGRvIHRoZSB1c3VhbCBzdHVmZiB0byBhY2Nlc3MgdGhlIEhEUiAq
LwogCi0JZHVtbXkgPSBSR2VuKGNpbmZvLCBWR0FfUEVMX01TSyk7CisJUkdlbihjaW5mbywgVkdB
X1BFTF9NU0spOwogCXVkZWxheSgyMDApOwotCWR1bW15ID0gUkdlbihjaW5mbywgVkdBX1BFTF9N
U0spOworCVJHZW4oY2luZm8sIFZHQV9QRUxfTVNLKTsKIAl1ZGVsYXkoMjAwKTsKLQlkdW1teSA9
IFJHZW4oY2luZm8sIFZHQV9QRUxfTVNLKTsKKwlSR2VuKGNpbmZvLCBWR0FfUEVMX01TSyk7CiAJ
dWRlbGF5KDIwMCk7Ci0JZHVtbXkgPSBSR2VuKGNpbmZvLCBWR0FfUEVMX01TSyk7CisJUkdlbihj
aW5mbywgVkdBX1BFTF9NU0spOwogCXVkZWxheSgyMDApOwogCiAJV0dlbihjaW5mbywgVkdBX1BF
TF9NU0ssIHZhbCk7CkBAIC0yNDkyLDcgKzI0OTAsNyBAQCBzdGF0aWMgdm9pZCBXSERSKGNvbnN0
IHN0cnVjdCBjaXJydXNmYl9pbmZvICpjaW5mbywgdW5zaWduZWQgY2hhciB2YWwpCiAKIAlpZiAo
Y2luZm8tPmJ0eXBlID09IEJUX1BJQ0FTU08pIHsKIAkJLyogbm93IGZpcnN0IHJlc2V0IEhEUiBh
Y2Nlc3MgY291bnRlciAqLwotCQlkdW1teSA9IFJHZW4oY2luZm8sIFZHQV9QRUxfSVcpOworCQlS
R2VuKGNpbmZvLCBWR0FfUEVMX0lXKTsKIAkJdWRlbGF5KDIwMCk7CiAKIAkJLyogYW5kIGF0IHRo
ZSBlbmQsIHJlc3RvcmUgdGhlIG1hc2sgdmFsdWUgKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
