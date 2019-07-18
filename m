Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162C06D1A8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472AD6E435;
	Thu, 18 Jul 2019 16:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E466E432;
 Thu, 18 Jul 2019 16:15:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i21so27952733ljj.3;
 Thu, 18 Jul 2019 09:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xuHi/x4to3SX7TRrtv62bR81bCU79XMtB/fuZqAmK/4=;
 b=A1J5OQualNXE0U0mphkRKMr6I7gnDL55/Q4/eIFsJJ1qh/eNLipXKXkAccoWCa4QJI
 +mteQ3sIgn3gXiParkRI0AYtRxEK29j5Im5mapm6oDXa3rDv1bU2Je7VxxHSqj3RRsIL
 lLeKBngonm0NSX1/YE4d6tEonqTU7kLR7cSqmMvPauqjsy8c1f3JIQIHhWOMltzFjOje
 ufy7iPRAc3HKRHoDzj5bhWRDubjbuP09vfCfGI7iHt0UpV+Fe9H3A/Ycf8AEp33zdF2J
 RiRfizN31CJhlt+ftY5/H2+2C/2TG6AfOqP+T8eIJhtT9OoYxhO4FrwEXl6wUPhS1v3d
 TqBg==
X-Gm-Message-State: APjAAAXNcpl8wngdHrWKRxKzNqhn+JvjNLfA4FK2hWQJX/5e/xX40gNE
 wHWONycatuJqBG1zTQ0jOuwRjFpSp7xMew==
X-Google-Smtp-Source: APXvYqxopRd2EXz7d6DIiAHotDUEDdlvCMB5sah0WnzkQlftdAyegfCZa4HP9SqflNRkyus/8Vkv5w==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr24655350ljj.113.1563466525895; 
 Thu, 18 Jul 2019 09:15:25 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:25 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 01/11] drm/panel: make drm_panel.h self-contained
Date: Thu, 18 Jul 2019 18:14:57 +0200
Message-Id: <20190718161507.2047-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xuHi/x4to3SX7TRrtv62bR81bCU79XMtB/fuZqAmK/4=;
 b=ccIpMj7bhqxadUhNYMQ8D6hZbjvh1AFYYDWwpHuL4jXZxpIWt1NRNWHGGxm/4zWkRX
 OjFGkqH9blEdvYLUOfyXGZ+I5aCmIUdxkPhT78M1nxDqGFphQCPafb8D+kaFVnoxB9OF
 pjCBT8Y1UHgxZgDNYGw5y+89GY17TgS0OytKu4Bv93YoVbtU6hiC+hf00a3CNSsLasKd
 MEUK0SZrZ7yHvSQVNPdPig/hu3XSvMNtoXVNBVZdQrF4lNvyH5r6YEzisPPOVdCRv3JK
 RPbsQsokKKabA/u3yRc5DJEXGwUhjcH5bBsdJpASfO2qWGblFfltPmUDAE0hO++IeSx6
 FRLA==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCkZpeCBidWlsZCB3YXJu
aW5nIGlmIGRybV9wYW5lbC5oIGlzIGJ1aWx0IHdpdGggQ09ORklHX09GPW4gb3IKQ09ORklHX0RS
TV9QQU5FTD1uIGFuZCBpbmNsdWRlZCB3aXRob3V0IHRoZSBwcmVyZXF1aXNpdGUgZXJyLmg6Cgou
L2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oOiBJbiBmdW5jdGlvbiDigJhvZl9kcm1fZmluZF9wYW5l
bOKAmToKLi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaDoyMDM6OTogZXJyb3I6IGltcGxpY2l0IGRl
Y2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmEVSUl9QVFLigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCiAgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiAgICAgICAgIF5+
fn5+fn4KLi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaDoyMDM6OTogZXJyb3I6IHJldHVybmluZyDi
gJhpbnTigJkgZnJvbSBhIGZ1bmN0aW9uIHdpdGggcmV0dXJuIHR5cGUg4oCYc3RydWN0IGRybV9w
YW5lbCAq4oCZIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2Vy
cm9yPWludC1jb252ZXJzaW9uXQogIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwogICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+CgpGaXhlczogNWZhOGU0YTIyMTgyICgiZHJtL3BhbmVsOiBNYWtlIG9m
X2RybV9maW5kX3BhbmVsKCkgcmV0dXJuIGFuIEVSUl9QVFIoKSBpbnN0ZWFkIG9mIE5VTEwiKQpD
YzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb20+ClNpZ25lZC1v
ZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CkFja2VkLWJ5OiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5oIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fcGFuZWwuaCBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCmluZGV4IDhjNzM4YzBlNmU5Zi4u
MjYzNzc4MzYxNDFjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAorKysgYi9p
bmNsdWRlL2RybS9kcm1fcGFuZWwuaApAQCAtMjQsNiArMjQsNyBAQAogI2lmbmRlZiBfX0RSTV9Q
QU5FTF9IX18KICNkZWZpbmUgX19EUk1fUEFORUxfSF9fCiAKKyNpbmNsdWRlIDxsaW51eC9lcnIu
aD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
