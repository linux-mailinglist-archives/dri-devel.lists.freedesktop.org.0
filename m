Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973192AB69
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 19:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840A0894E0;
	Sun, 26 May 2019 17:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008AC89394;
 Sun, 26 May 2019 17:35:47 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 188so12675140ljf.9;
 Sun, 26 May 2019 10:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FijAi/rRt9F6TihHYqQ6sKUIYt5GMGzzPG27K5Xhg7o=;
 b=mtWO0/GurBHi10emlEQS0vmXVxQ/W4OyRO8E7S5vzVP32yom9SiWAZJkocZTcjAlNP
 OagBSqT0fCOolbQPwGODxHc/8i+1J24qbuWg7n5SSu73A8Hre/qNxqsxCYv3Xu1g/LO0
 2VbsI5J3jYfRDS9f6W4VgXe5YwTrrs007/DjWvp4aBA7H/K5zhfgcGyidgcmPcrGp4TS
 ij3v0VrZk1ayu4En9dQtftFJ0Gf/VGo+92X0ZYRC4BivQTZ7WRzIvmXsNqPTPIWu+IYL
 8z6IeB1RG2tD+cf+s4EBciKTb5dWW8/SlqI9vsQmhuJfp2wQ309fTjsKRZu020lxB0Z8
 8qBw==
X-Gm-Message-State: APjAAAUNfmZhYJ0LuOONByqclurhueK0Wxg+yitqY5w/DTuFfS+QA7qo
 1GeO8RdTzl28V8vQWeLCjK84jT74
X-Google-Smtp-Source: APXvYqwdOLoFIjCLRpXn0vSc24rVGvqTEEmEbyb1ERbJRoKB3dHxqhm8jxscP/cnK8T2KhTAGdCoTA==
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr49367278ljj.47.1558892146156; 
 Sun, 26 May 2019 10:35:46 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n9sm1774489ljj.10.2019.05.26.10.35.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 10:35:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm: make drm_crtc_internal.h self-contained
Date: Sun, 26 May 2019 19:35:31 +0200
Message-Id: <20190526173535.32701-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526173535.32701-1-sam@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FijAi/rRt9F6TihHYqQ6sKUIYt5GMGzzPG27K5Xhg7o=;
 b=SNISuzws2bpcO0n1spcMRUeU6mpyG29KycFbDsgiyM4tRL5h15+5ThvkI8z9yxAN13
 VrDS3RfxvRA6Txtlr6q45UWIu/VL4d4f9QG1SCwKysamH5AweSPVxp1ibcBzGkL3UAF0
 9Bk3ZPEU2HsqV6A/bw71ORukmiQZepK97a62cdlDGYPeccJ72DBxQjQXRn6IQjXfhefS
 eCnDtfI8JA0401wehGUe45wccfhlmbgm2fhml4LApGyRmsocG18TBK/9YoEOXvWStD50
 /ZQhBBNJHPYObezMhfTHJBbZ36OsjV13tucME61w0qGjegcLeOTXTGmGbM0OtS+ymQvq
 03jg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX2NydGNfaW50ZXJuYWwuaCB0byBpbmNsdWRlIG90
aGVyCmZpbGVzIGp1c3QgdG8gbGV0IGl0IGJ1aWxkCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBi
b290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19pbnRlcm5hbC5oIHwgMjQgKysrKysrKysr
KysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaW50ZXJuYWwu
aCBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19pbnRlcm5hbC5oCmluZGV4IDA3MTlhMjM1ZDZj
Yy4uYzc4YTQ0ZmFkMTNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaW50
ZXJuYWwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaW50ZXJuYWwuaApAQCAtMzEs
MTQgKzMxLDMwIEBACiAgKiBhbmQgYXJlIG5vdCBleHBvcnRlZCB0byBkcml2ZXJzLgogICovCiAK
LWVudW0gZHJtX21vZGVfc3RhdHVzOworI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisKK2VudW0g
ZHJtX2NvbG9yX2VuY29kaW5nOworZW51bSBkcm1fY29sb3JfcmFuZ2U7CiBlbnVtIGRybV9jb25u
ZWN0b3JfZm9yY2U7CitlbnVtIGRybV9tb2RlX3N0YXR1czsKIAotc3RydWN0IGRybV9kaXNwbGF5
X21vZGU7Ci1zdHJ1Y3Qgd29ya19zdHJ1Y3Q7Ci1zdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsKK3N0cnVj
dCBkcm1fYXRvbWljX3N0YXRlOwogc3RydWN0IGRybV9icmlkZ2U7CitzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvcjsKK3N0cnVjdCBkcm1fY3J0YzsKK3N0cnVjdCBkcm1fZGV2aWNlOworc3RydWN0IGRybV9k
aXNwbGF5X21vZGU7CitzdHJ1Y3QgZHJtX2ZpbGU7CitzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyOwor
c3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iOworc3RydWN0IGRybV9tb2RlX2ZiX2NtZDI7Citz
dHJ1Y3QgZHJtX21vZGVfZmJfY21kOworc3RydWN0IGRybV9tb2RlX29iamVjdDsKK3N0cnVjdCBk
cm1fcGxhbmU7CitzdHJ1Y3QgZHJtX3Byb3BlcnR5Owogc3RydWN0IGVkaWQ7CitzdHJ1Y3Qga3Jl
ZjsKK3N0cnVjdCB3b3JrX3N0cnVjdDsKIAogLyogZHJtX2NydGMuYyAqLwogaW50IGRybV9tb2Rl
X2NydGNfc2V0X29ial9wcm9wKHN0cnVjdCBkcm1fbW9kZV9vYmplY3QgKm9iaiwKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
