Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5D2C30F8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02B16E573;
	Tue, 24 Nov 2020 19:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD0B6E529
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so23510161wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ea+MZ4SETfT4WFr3DgwI9kjy4D+XbqEDvpGgUqZKcMo=;
 b=HDVEve22PQjQLPJNjH06mAipBi1w1c7FoGv7APARQFJEB8Lr7iNE1bZmbMz/vKKHML
 MQbRNDETI8MJrbuDGnUlheO5oFIYvZhdgDkHAWeSfRGV1g30bzYvMQC0uEsTFezPno+9
 UfEdVjcFhZTiVurEuXLqw5ZwLN5D4ZJ7ZS3kLSvAEnWM2zOsNvbeT9xnwv53Fi3X9pHC
 a7tn66AwHqo1Sj+a3BtoVJKB/w0noZKMEJQGi2O4xjUktRfbFIY/yWoLkJgvzDOnwNsz
 WfchD4urO01qtQaCsZzEiMMD1eTjxmLWUBlzX04sdihIgMKaIKJu5vEY/dxR3jXH12Hf
 yHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ea+MZ4SETfT4WFr3DgwI9kjy4D+XbqEDvpGgUqZKcMo=;
 b=VUdupruoiOz5ygkDS/P3ZZsVyQ8HECd7nW8dXZa3SIwfNhPM+nc4aRIwO11ZpufRkF
 EtijyluETl7+kKgu6l0kxMGzbSIzkQcztSUJ1wNtBlJ6lYsaPrxWbyhoX1gO15r9zo9l
 aiUfY54nG0o2Dmr1qXaMxP7hNGomAVV4mtCfzvKBy1H/ctbLLDMopeXMvve1eGNo1U96
 XdfXO7UVSFnkZWZXCnSSg1avpEfkTROslwAWEumHv7g6gdtJDrdyiZh5xqNTo3J8q31x
 VZNXVlms6p943YIHA9t9QIBYfyIp5RvAgfm22RBYBzl+3iYWddsuhgM3skL3LOYTcYP1
 ykAQ==
X-Gm-Message-State: AOAM5317uN3uoLEZVDyemLK2QyLyy4GYMkCVYV1LoSUeWrHA5shO7cVG
 uOc7MnJAw7XatFEs6JQWPm+R0Q==
X-Google-Smtp-Source: ABdhPJzJscRsPSjrCdloGZX4iKtODDfMRSxXemQOx5ZBCJc8vyH6N4DZpRSGqUy0OS0ELBbGEslFew==
X-Received: by 2002:adf:bd86:: with SMTP id l6mr66630wrh.205.1606247080372;
 Tue, 24 Nov 2020 11:44:40 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/40] drm/amd/amdgpu/vcn_v3_0: Remove unused variable
 'direct_poll' from 'vcn_v3_0_start_sriov()'
Date: Tue, 24 Nov 2020 19:38:17 +0000
Message-Id: <20201124193824.1118741-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYzogSW4gZnVuY3Rpb24g4oCYdmNuX3YzXzBf
c3RhcnRfc3Jpb3bigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjNfMC5jOjEy
NDI6Mzogd2FybmluZzogdmFyaWFibGUg4oCYZGlyZWN0X3BvbGzigJkgc2V0IGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YzXzAuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92M18wLmMKaW5kZXggYzVlMGE1MzFjYWJhZi4u
ZTA1YWY2OTY1MTcyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YzXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjNfMC5jCkBAIC0x
MjM4LDggKzEyMzgsNiBAQCBzdGF0aWMgaW50IHZjbl92M18wX3N0YXJ0X3NyaW92KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCQlkaXJlY3Rfd3QgPSB7IHswfSB9OwogCXN0cnVjdCBtbXNj
aF92M18wX2NtZF9kaXJlY3RfcmVhZF9tb2RpZnlfd3JpdGUKIAkJZGlyZWN0X3JkX21vZF93dCA9
IHsgezB9IH07Ci0Jc3RydWN0IG1tc2NoX3YzXzBfY21kX2RpcmVjdF9wb2xsaW5nCi0JCWRpcmVj
dF9wb2xsID0geyB7MH0gfTsKIAlzdHJ1Y3QgbW1zY2hfdjNfMF9jbWRfZW5kIGVuZCA9IHsgezB9
IH07CiAJc3RydWN0IG1tc2NoX3YzXzBfaW5pdF9oZWFkZXIgaGVhZGVyOwogCkBAIC0xMjQ3LDgg
KzEyNDUsNiBAQCBzdGF0aWMgaW50IHZjbl92M18wX3N0YXJ0X3NyaW92KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCQlNTVNDSF9DT01NQU5EX19ESVJFQ1RfUkVHX1dSSVRFOwogCWRpcmVj
dF9yZF9tb2Rfd3QuY21kX2hlYWRlci5jb21tYW5kX3R5cGUgPQogCQlNTVNDSF9DT01NQU5EX19E
SVJFQ1RfUkVHX1JFQURfTU9ESUZZX1dSSVRFOwotCWRpcmVjdF9wb2xsLmNtZF9oZWFkZXIuY29t
bWFuZF90eXBlID0KLQkJTU1TQ0hfQ09NTUFORF9fRElSRUNUX1JFR19QT0xMSU5HOwogCWVuZC5j
bWRfaGVhZGVyLmNvbW1hbmRfdHlwZSA9CiAJCU1NU0NIX0NPTU1BTkRfX0VORDsKIAotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
