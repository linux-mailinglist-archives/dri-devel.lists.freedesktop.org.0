Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27EF5AEFB
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C26E9E5;
	Sun, 30 Jun 2019 06:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144EC6E9EA
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:20:00 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y17so6615315lfe.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2NM063G39Ydk6jo6xqQhafdxZWyQDrb/IpYnc/L7esI=;
 b=ZA8GmKL+s/WdVrWhyFovrrTkqhgag0kmNGtPvonr+SwrobVcX5EM6aiqhtP/MFBYbo
 YdnwG//fQ6cHnvvtDnDoEDNoFZSv6lJkJ6Ms3bipVXMKrmEkG86xKBUCKpnAjPxriN3S
 UhwxBoiTRcg+Ktah0TtQwdFWNl7i4pGJAA9MlyFkWb0HIRgpFdd75DuaI6ZmZf1/QZxZ
 8dU7DEr1fcI5vNRxVcLi3wSpsJZjlIQzuoKoDeC/8ynJAbMMkHPBxaZGbF000bUU7Yyw
 p3JwBGtV6CfxwEKGrE961WCzK1lLmo574/rHiBiqPh5emPaScbcHA7c9IShk+7mX/5rk
 0+zQ==
X-Gm-Message-State: APjAAAU2hlnJy+V67EcrzeGrw+vv0uuZHCf/e+UNAcmV1iGQg7MzMpLx
 TsVKojr3jiNRRqy9jiZDU/rQ2O5rGQv8cw==
X-Google-Smtp-Source: APXvYqy23/qYhSPkpPoJD5LfrS40vSJEuv8lbStFVATtBJ2xLl0O0ARcFm9BrNDcSI6y6VMhWIZwBg==
X-Received: by 2002:a19:8c06:: with SMTP id o6mr8772593lfd.176.1561875598331; 
 Sat, 29 Jun 2019 23:19:58 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 30/33] drm: add missing include to drm_vram_mm_helper.h
Date: Sun, 30 Jun 2019 08:19:19 +0200
Message-Id: <20190630061922.7254-31-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NM063G39Ydk6jo6xqQhafdxZWyQDrb/IpYnc/L7esI=;
 b=BcbHKAR1ucYZwpQrPjLpUU3AHWn9J6yktM63ugT2yN/pG+bSQ5N6wVgLI4CVeDp9wI
 dFaFnKy7X9tp3YDcXwQaJnEVRufRTK8J6XZmqcJABAYKO+ikQnUWNVwWychFhFN9Wmof
 dU4hLC2IyKRJzGN3An8HY2GVVRFnBYsUjtY7+xnhDZRv9viajXjHKX8p9qNvCspegLts
 jBHqo1DGcD5Vdg24jhkAXeD069BaExeRg+qDfngOtKNaIU3VUIWSCL5fsUlRoUxJrIwC
 dlwbdHPed7uYMbByR2qVqm7y2Sjpq4b1iBslQHQ+q0gajIBbRlhhIqsb1OfCdMpYCFCP
 yuIw==
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

VGhlIG1hY3JvIERSTV9WUkFNX01NX0ZJTEVfT1BFUkFUSU9OUyByZWZlcmVuY3MKZnVuY3Rpb25z
IGRlY2xhcmVkIGluIG90aGVyIGhlYWRlciBmaWxlcy4KSW5jbHVkZSB0aGVzZSBoZWFkZXIgZmls
ZXMgc28gdGhpcyBoZWFkZXIgZmlsZXMKcHVsbHMgaW4gd2hhdCBpdCByZWZlcmVuY2VzLgoKU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tClRoZSBsaXN0IG9mIGNjOiB3YXMgdG9vIGxhcmdl
IHRvIGFkZCBhbGwgcmVjaXBpZW50cyB0byB0aGUgY292ZXIgbGV0dGVyLgpQbGVhc2UgZmluZCBj
b3ZlciBsZXR0ZXIgaGVyZToKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMv
ZHJpLWRldmVsLzIwMTktSnVuZS90aHJlYWQuaHRtbApTZWFyY2ggZm9yICJkcm06IGRyb3AgdXNl
IG9mIGRybXAuaCBpbiBkcm0tbWlzYyIKCiAgICAgICAgU2FtCgogaW5jbHVkZS9kcm0vZHJtX3Zy
YW1fbW1faGVscGVyLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggYi9pbmNsdWRlL2Ry
bS9kcm1fdnJhbV9tbV9oZWxwZXIuaAppbmRleCBhOGZmZDg1OTliMDguLjJhYWNmYjFjY2ZhZSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKQEAgLTMsNiArMyw4IEBACiAjaWZuZGVmIERSTV9W
UkFNX01NX0hFTFBFUl9ICiAjZGVmaW5lIERSTV9WUkFNX01NX0hFTFBFUl9ICiAKKyNpbmNsdWRl
IDxkcm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8
ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+CiAKIHN0cnVjdCBkcm1fZGV2aWNlOwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
