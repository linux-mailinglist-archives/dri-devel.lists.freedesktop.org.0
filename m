Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D22EF8BE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C296E8CC;
	Fri,  8 Jan 2021 20:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A066E8C9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t16so10169438wra.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tI0M520Tgf6Y/taglfeuNx5F4TLLe4OwvIOR0TyXZnU=;
 b=xw+bWeaEAWYrLVo8JxLnuBuwmxbi1iNsGy74mXZlvGNQ6Azts3YZMI9w5upfCOF1Tv
 ueejiFcYOTXV6jCZekcU8peSlcaVLVQR40i6N5WOK9qCJDOKgh6i5k+Ga3zjF4FmDOh7
 YJT9ZbCtfyjv1dNcHC3TxSyqBmoN65o2gglwSmZAUODShuenX/YQTTDETct5ct6hQf2h
 5YqNt9G1X9GUf8AmiY5eYEEW2GiZcPuiwUDJFHVOS6tCpZoWjAOOOHanmL9q2j2LyUGD
 R/vhENw9F8tYjeE7VhfKmnFgFBaK1ft6esGzXdO3uvtaj2eBjk6SEYx4KZc3erYgr6nd
 c4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tI0M520Tgf6Y/taglfeuNx5F4TLLe4OwvIOR0TyXZnU=;
 b=kr4mN2IHMMRAfuS+9gMqPaQfYVjABLKZ72sIkAiCJo2YnECfrJMG1hgTINn5ng8xl6
 9oZ5MRit29Svu4sD3Req1NObCz9uXsbX+X16YJoYmL86hu8ywgKy9bDE6L75rCVATEgp
 SBStBkOzMmxvmSQhmIeYiJxPUsb4LtFfEzDsT4Ozl/0dF3gtRyQTWTunGoJ823+s7g2k
 vFCpCoB4seTDajGv4NrQADu0SmFNoziHW6voX9xMb97UV1o5owZp9/mH4NQ2WOhGbbvT
 +PWjr/P5/gff7c/5TdMh69Zgrp8T9LK2evtmePvE5EQFYTuahlut74KvqrcxOlczFttS
 I9Zg==
X-Gm-Message-State: AOAM530S0zxbPMrXlv+ZyBG0TCKdDQZel/B7ypnxutE9q1Ik/lF6OeCT
 WOEZKNR7PJr0b7S+//hE3GD0EA==
X-Google-Smtp-Source: ABdhPJxCcw9Go7KcofC8FWaXvzbEXL0ut2OABm6WXFyyinCLRrroiqPvn7NOS8nrmWo89ywhbppXag==
X-Received: by 2002:adf:e590:: with SMTP id l16mr5282481wrm.294.1610136956461; 
 Fri, 08 Jan 2021 12:15:56 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/40] drm/amd/display/dc/dce/dce_i2c_hw: Make functions
 called by reference static
Date: Fri,  8 Jan 2021 20:14:53 +0000
Message-Id: <20210108201457.3078600-37-lee.jones@linaro.org>
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
Cc: Lewis Huang <Lewis.Huang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jOjQzODoz
NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2VfaTJjX2h3X2VuZ2lu
ZV93YWl0X29uX29wZXJhdGlvbl9yZXN1bHTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2kyY19ody5jOjUw
NTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZV9pMmNfaHdfZW5n
aW5lX3N1Ym1pdF9wYXlsb2Fk4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBh
bWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBMZXdpcyBIdWFuZyA8TGV3aXMuSHVhbmdAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX2h3LmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX2h3LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfaHcuYwppbmRleCA3ZmJkOTJmYmM2
M2E5Li5hNTI0ZjQ3MWUwZDc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9pMmNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9pMmNfaHcuYwpAQCAtNDM1LDcgKzQzNSw3IEBAIHN0cnVjdCBkY2VfaTJjX2h3
ICphY3F1aXJlX2kyY19od19lbmdpbmUoCiAJcmV0dXJuIGRjZV9pMmNfaHc7CiB9CiAKLWVudW0g
aTJjX2NoYW5uZWxfb3BlcmF0aW9uX3Jlc3VsdCBkY2VfaTJjX2h3X2VuZ2luZV93YWl0X29uX29w
ZXJhdGlvbl9yZXN1bHQoCitzdGF0aWMgZW51bSBpMmNfY2hhbm5lbF9vcGVyYXRpb25fcmVzdWx0
IGRjZV9pMmNfaHdfZW5naW5lX3dhaXRfb25fb3BlcmF0aW9uX3Jlc3VsdCgKIAlzdHJ1Y3QgZGNl
X2kyY19odyAqZGNlX2kyY19odywKIAl1aW50MzJfdCB0aW1lb3V0LAogCWVudW0gaTJjX2NoYW5u
ZWxfb3BlcmF0aW9uX3Jlc3VsdCBleHBlY3RlZF9yZXN1bHQpCkBAIC01MDIsNyArNTAyLDcgQEAg
c3RhdGljIHVpbnQzMl90IGdldF90cmFuc2FjdGlvbl90aW1lb3V0X2h3KAogCXJldHVybiBwZXJp
b2RfdGltZW91dCAqIG51bV9vZl9jbG9ja19zdHJldGNoZXM7CiB9CiAKLWJvb2wgZGNlX2kyY19o
d19lbmdpbmVfc3VibWl0X3BheWxvYWQoCitzdGF0aWMgYm9vbCBkY2VfaTJjX2h3X2VuZ2luZV9z
dWJtaXRfcGF5bG9hZCgKIAlzdHJ1Y3QgZGNlX2kyY19odyAqZGNlX2kyY19odywKIAlzdHJ1Y3Qg
aTJjX3BheWxvYWQgKnBheWxvYWQsCiAJYm9vbCBtaWRkbGVfb2ZfdHJhbnNhY3Rpb24sCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
