Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7AE2F4DA4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67F96EA6D;
	Wed, 13 Jan 2021 14:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A956EA62
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r3so2427416wrt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8R8CrMmu7yuBA/ZNIQZlAyfMprfiOkPW3GpI5ayBsWg=;
 b=q1+kp8rlc5YHssN6Eq89+XBI9+3PExs7mtj+vKpE1TFKE1rjX2///yzy+zDTZKSmOo
 veDWfzfkp2jlcqkWf6hyrhxd4ZIDNoNqF9HS7ddPt4booh+FDzx3O5uQ2G8rdhZHcVp3
 PA1ZgIYstzQ14gHP1p8JOg40/+Qe5fqobxdt9bJb49f5X37fSTQnByGZCt6BqgU83z6p
 QzAtbnYyN0YvKG7g442YVr2E98ZQvzgo4BnA5yP33ogF0/EDLppn6AMEy+q/dBx0eQ5f
 Im6lCkgNGn1IZSkhzSUaYdClRbl34RHO4jN1MiOjnXDBZW66eOJRiiEjwIv769RVoAR7
 qlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8R8CrMmu7yuBA/ZNIQZlAyfMprfiOkPW3GpI5ayBsWg=;
 b=GQ1lQN5CN3t9N/nXuruGJoYAdWYGOY79rmAytG/C0SfoOcGyeNYZ4m10yqdDs7sLfw
 wdFoSB/Reg3bFTOfKRSstbYGfPwsBKITY5DJzPuD7xLuo3jd8tW77JlH9o8SxfY84SCM
 MLZodTCW75uMn1ILiok170Aq2v0Kb0u1VBL5q1uKV9gieh51DOcUETslAwI6wT2AU7Wq
 Rm8msV+CwUyqaA3HX2T57tLm0D+mSV3JUyGEQvGXaPWELWswJwr2Hy1Ow0vFAWAVLk1A
 4b65RonXvFx0YxYBV3wx7vILMR5OfIAco9kb2KBhcJZCg6qk4nHlBXScC0ye87UcYj14
 sYtg==
X-Gm-Message-State: AOAM5318xAsc9vOz2FApyJmedyy8DGpvJHy2L0Ti26qeZ+FQjXkx/P8T
 bEOcX52EzY6zHj3V58qCK9mimA==
X-Google-Smtp-Source: ABdhPJwF8QB82NwqEyn+scjHeSXF56DRGMKoUHEnV/4pPFJaM/1IosDrCdd2x+tLam8CZhkoj23PHQ==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr2926797wru.43.1610549446928; 
 Wed, 13 Jan 2021 06:50:46 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/31] video: fbdev: s1d13xxxfb: Mark debug variables as
 __maybe_unused
Date: Wed, 13 Jan 2021 14:50:01 +0000
Message-Id: <20210113145009.1272040-24-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Thibaut VARENE <varenet@parisc-linux.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Dooks <ben@simtec.co.uk>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FuJ3QgZGVjbGFyZSB0aGVzZSB1bmRlciB0aGUgc2FtZSBjbGF1c2UgYXMgdGhlaXIgdXNlLCBz
aW5jZQpkZWJ1Z2dpbmcgaXMgZW5hYmxlZCBtYW51YWxseSB3aXRoIGFuICcjaWYgezAsMX0nLCBz
byBtYXJrIHRoZW0gYXMKX19tYXliZV91bnVzZWQgaW5zdGVhZCB0byBub3RpZnkgdGhlIGNvbXBp
bGVyIHRoYXQgdGhpcyBiZWhhdmlvdXIgaXMKZXhwZWN0ZWQuCgpGaXhlcyB0aGUgZm9sbG93aW5n
IFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3MxZDEz
eHh4ZmIuYzogSW4gZnVuY3Rpb24g4oCYczFkMTN4eHhmYl9mZXRjaF9od19zdGF0ZeKAmToKIGRy
aXZlcnMvdmlkZW8vZmJkZXYvczFkMTN4eHhmYi5jOjY0NDoxNjogd2FybmluZzogdmFyaWFibGUg
4oCYaXNfZHVhbOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQogZHJpdmVycy92aWRlby9mYmRldi9zMWQxM3h4eGZiLmM6NjQzOjExOiB3YXJuaW5nOiB2YXJp
YWJsZSDigJhsY2RfYnBw4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCgpDYzogS3Jpc3RvZmZlciBFcmljc29uIDxrcmlzdG9mZmVyLmVyaWNzb25AZ21haWwu
Y29tPgpDYzogVGhpYmF1dCBWQVJFTkUgPHZhcmVuZXRAcGFyaXNjLWxpbnV4Lm9yZz4KQ2M6IEJl
biBEb29rcyA8YmVuQHNpbXRlYy5jby51az4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvczFk
MTN4eHhmYi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvczFkMTN4eHhmYi5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9zMWQxM3h4eGZiLmMKaW5kZXggNDU0MWFmY2Y5Mzg2ZS4u
ZTZlOGJjNzQ0MTJjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zMWQxM3h4eGZi
LmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zMWQxM3h4eGZiLmMKQEAgLTY0MCw4ICs2NDAs
OCBAQCBzdGF0aWMgdm9pZCBzMWQxM3h4eGZiX2ZldGNoX2h3X3N0YXRlKHN0cnVjdCBmYl9pbmZv
ICppbmZvKQogCXUxNiBvZmZzZXQ7CiAJdTMyIHhyZXMsIHlyZXM7CiAJdTMyIHhyZXNfdmlydHVh
bCwgeXJlc192aXJ0dWFsOwotCWludCBicHAsIGxjZF9icHA7Ci0JaW50IGlzX2NvbG9yLCBpc19k
dWFsLCBpc190ZnQ7CisJaW50IGJwcCwgX19tYXliZV91bnVzZWQgbGNkX2JwcDsKKwlpbnQgaXNf
Y29sb3IsIF9fbWF5YmVfdW51c2VkIGlzX2R1YWwsIGlzX3RmdDsKIAlpbnQgbGNkX2VuYWJsZWQs
IGNydF9lbmFibGVkOwogCiAJZml4LT50eXBlID0gRkJfVFlQRV9QQUNLRURfUElYRUxTOwotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
