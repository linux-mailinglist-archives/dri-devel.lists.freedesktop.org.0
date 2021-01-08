Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9432EF8A9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E06A6E8D9;
	Fri,  8 Jan 2021 20:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEA86E8D5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a6so8731801wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+rKqjsgsMRrWlbR0mS6qqZSklymAWueG82I2hOJ6Ds=;
 b=UjObcNpLmHgcVOeAiK1W8DH7qr/VTvKYYZvqwqgnSssxmyVRRzsJZmTvoKlwdQs01J
 NH7S9Mex2LrJ2/AaEUzm3rNqG8I12C/Xpj1PsvDO1wyi8oGualF6qkSrVPunrDULTTom
 xWhM/2mwjk08/4+J6spoCMxRTl9G0Gw/r0h4588xd8hz4X9VkBA/dx45Yd8tNUUewq6e
 zPICIlZTExobP1md8Ivtbr/c55KpzqTHL5gUtGhOv3CbcwSOfFoXTfvsHz6wLvTGD+4T
 4JJku0UmibFovBql4Ll+pwP24pQJS2iS/Ra4slhfru8dhDevYzSAhuUjzHo1VmJinivG
 6x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+rKqjsgsMRrWlbR0mS6qqZSklymAWueG82I2hOJ6Ds=;
 b=OtjHu0q8qrs0xPu1BQme4j5RR7y3wydamfaLv7q9L5ynC8P5mHDQA9ga2p6rGmb8oL
 gAzRjSPyo+8wzWGz5t+kivlrCPd6NMf0ii1tX/StzEHi9ym+HPlJgSPqFm3mJqKHTQLk
 IH0tKrL75BknjBRfCurNiN4Gr7BQU7P1lDBVxQUpr/pQpsZwoqAD4Pul1+X1otsbrrzB
 gEvzDLpSKvbyvWDYlHsc6FJSbP9++NKBCvpIXbUJJDyX62lDaq84/nsI7mW03i7sl6i5
 m7u8Oa1zIU7LVExrDk6hZhFsm22CNIbN+jrluFLZwod7LnJx7rpn8yNbxL2WWEQnL0Id
 gPHA==
X-Gm-Message-State: AOAM533YLwP807Av2jtqf6rhJi9hBYDpgjEATeDOIs4En4gZ2RlYqOiI
 FNQkmtW1seQBjy2tHLuf9sekaA==
X-Google-Smtp-Source: ABdhPJzB7xilZqzkaJwNBTqYl/8XOYXzJhHqfV3T6uGCy6KkEdJfdWEONiV4H4I/V6KCmnexrpAfPw==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr4508553wmc.186.1610136929497; 
 Fri, 08 Jan 2021 12:15:29 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/40] drm/amd/display/dc/bios/bios_parser: Make local
 functions static
Date: Fri,  8 Jan 2021 20:14:34 +0000
Message-Id: <20210108201457.3078600-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Igor Kravchenko <Igor.Kravchenko@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmM6MjU4
ODoxNjogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJh1cGRhdGVfc2xvdF9s
YXlvdXRfaW5mb+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIuYzoyNjkyOjE2OiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGdldF9icmFja2V0X2xheW91dF9yZWNvcmTi
gJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IElnb3IgS3JhdmNo
ZW5rbyA8SWdvci5LcmF2Y2hlbmtvQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmMKaW5kZXggMjNhMzczY2E5NGI1Yy4u
ZjA1NGM1ODcyYzYxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jpb3MvYmlvc19wYXJzZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Ymlvcy9iaW9zX3BhcnNlci5jCkBAIC0yNTg1LDcgKzI1ODUsNyBAQCBzdGF0aWMgc3RydWN0IGlu
dGVncmF0ZWRfaW5mbyAqYmlvc19wYXJzZXJfY3JlYXRlX2ludGVncmF0ZWRfaW5mbygKIAlyZXR1
cm4gTlVMTDsKIH0KIAotZW51bSBicF9yZXN1bHQgdXBkYXRlX3Nsb3RfbGF5b3V0X2luZm8oCitz
dGF0aWMgZW51bSBicF9yZXN1bHQgdXBkYXRlX3Nsb3RfbGF5b3V0X2luZm8oCiAJc3RydWN0IGRj
X2Jpb3MgKmRjYiwKIAl1bnNpZ25lZCBpbnQgaSwKIAlzdHJ1Y3Qgc2xvdF9sYXlvdXRfaW5mbyAq
c2xvdF9sYXlvdXRfaW5mbywKQEAgLTI2ODksNyArMjY4OSw3IEBAIGVudW0gYnBfcmVzdWx0IHVw
ZGF0ZV9zbG90X2xheW91dF9pbmZvKAogfQogCiAKLWVudW0gYnBfcmVzdWx0IGdldF9icmFja2V0
X2xheW91dF9yZWNvcmQoCitzdGF0aWMgZW51bSBicF9yZXN1bHQgZ2V0X2JyYWNrZXRfbGF5b3V0
X3JlY29yZCgKIAlzdHJ1Y3QgZGNfYmlvcyAqZGNiLAogCXVuc2lnbmVkIGludCBicmFja2V0X2xh
eW91dF9pZCwKIAlzdHJ1Y3Qgc2xvdF9sYXlvdXRfaW5mbyAqc2xvdF9sYXlvdXRfaW5mbykKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
