Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA7226FC
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140489183;
	Sun, 19 May 2019 14:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388F789132
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:20:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h13so8433809lfc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 07:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FijAi/rRt9F6TihHYqQ6sKUIYt5GMGzzPG27K5Xhg7o=;
 b=oq+QsbiNgp8zuQcoJ+w8GxSKVJa6XZI7gprz4go0tInYmMUWk2qKnfXr63ZRxiVQwj
 esW60ohDo/1ZMFEiH9Vse+onGVgrJamY+YO2kEZ5JpwD1T7se6U/8WSIYHPogRDEXIiP
 EeQ0dfVafk465h+26yNhPu9K+9bokchzOfVNKJBReCJ2e+rxpUqYydydcqArW+tctODT
 IbD0MqGcxwc0BbRM11JaP2plBT+UXyuM9oF750ohCp60bVH9eFza2fCua5uvYB3+nRZf
 xm4rCOyyr2f6EZoj8WdyGrl0KBOuR0Y3wnoPFAYMK7OMY/wZ+NYKUDjRTKcds6SNBvEz
 OEBw==
X-Gm-Message-State: APjAAAWP2I/i+E4RnCZXZYyV+JKIeoPjvtKYyRyeLqC3Y8LGvY7lVO/R
 F50YNe/MqJifyvWFZhk0Lk2dxx6A
X-Google-Smtp-Source: APXvYqzJ0Xr7SLi3ktRwmvpKlp0x5XEXh81NvhNdUgO1KUQ9hoeYGWaNk2KQu0ht61ipmx4jpc1EGg==
X-Received: by 2002:a19:97d3:: with SMTP id z202mr1797524lfd.145.1558275652446; 
 Sun, 19 May 2019 07:20:52 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d5sm3231786lji.85.2019.05.19.07.20.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:20:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 03/06] drm: make drm_crtc_internal.h self-contained
Date: Sun, 19 May 2019 16:20:33 +0200
Message-Id: <20190519142036.22861-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519142036.22861-1-sam@ravnborg.org>
References: <20190519142036.22861-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FijAi/rRt9F6TihHYqQ6sKUIYt5GMGzzPG27K5Xhg7o=;
 b=Wk/+CLN3itt8VlNS1pa5T31qZqUzkAyiYagFUgoNpbIlRmHx93v2zfw4HI1pXvkdQi
 dGxqVCGuwhnyMJAiT+99wXsodo0kNtTLnB0bDCj2ifqpdFStA44pNZBnZN7mciPXw0Oc
 w4BCoARVM7sKW1I3bKk+MDNPqMhbyl0aJCobHPDzIh+4AnWPgxc5aQc8fsDHd/WKzMhG
 5/MyG660fr04n0xzlaD3bBnM5iMEQAJuhInWpyFQsbfbxvORhZTEM8ebOgIEuR0f6KVC
 W8e2ZiufO7bB4lnPB/OCq/Uduzex9V5+rnZy03+0mAQ8W5jX3OzxOHeMV1pl/EwYH7ii
 R/vw==
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
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
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
