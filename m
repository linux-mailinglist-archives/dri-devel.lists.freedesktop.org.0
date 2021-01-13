Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB152F4D8C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552936EA4C;
	Wed, 13 Jan 2021 14:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECC36EA52
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a12so2391917wrv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Pf7w6hja2pyQaiiphc9339t7wWdI+GqQadABJm8g7Y=;
 b=sst9frRzW/IJefwutBUvPoGyyHkMdmNCE2/2cJ1SvAob/HspH1X56uzjWNN7XPuilz
 wdKSM/9Hqj3XNtAA/hBuaE7G/g9i5BxwEMY6nf9eunFCXOpEAB+tkTQ53x6HPpg6jtJ5
 4/CwTTvIH5eIMy9CUXAYqkwetX52U5C8J5iXu+ftxRcgI6ioB4TaWFUZokVU0jMRv4go
 iVThPqkc16K5jm14VkBnPxRc0KOF1l7502J6ctNsR0SVyVrAujPyJcOPpNmjUaQa0T2D
 QXsr/aNolpDchgMH7vINY63kaYmkDnVOFM9EKwvSgcfdyGaw5+y6o1AKmnSdmQwT2uZv
 +w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Pf7w6hja2pyQaiiphc9339t7wWdI+GqQadABJm8g7Y=;
 b=DR+rtkr2T85YbDq2Xp8tN5gn0UjTgXWls3SntR1ew+HfvRjskaQgP46v5iAE6DsTUh
 yinqfVCKPCtFrz6A5alGdAepzcLadGy5eDR3pUuXFJ5oegfG0WMI3XjywyMWbdCF4iLs
 pKq3J0L11kbY1pwsO1/Ej6n9yVbc4FfU+z7XOGK3iyRPeqPwSx2DH1Irt4MjNVNd7luO
 zPGr1frQqJeMY42gzpsxFCuzMY+JcuuVZpT6mhDD67pkfBD5blQOLLkFlXoFp4/9cXPd
 KRHtzwvqDyNZyjgyjziogTUx6t96KD2v7MuQcQMZg6B6LvJTTUBOyOx5IBawHMqByGb3
 IoOw==
X-Gm-Message-State: AOAM5309PS/5Cb+u3t4/r2E5SYruALIKpvCv1HIiCOXcnMccNDzbkK81
 odsAUzIyjvmCvEcEkTAs8BzexrT0k4riKEYH
X-Google-Smtp-Source: ABdhPJw7YBO0Y3mdZUBWXhnPmv13OWbKuieV4zDqiFanxqcxWiLlKLymFuWigA/Hr4jjfIkyPRZuxQ==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr3137113wro.338.1610549428139; 
 Wed, 13 Jan 2021 06:50:28 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/31] video: fbdev: sis: Remove superfluous include of
 'init.h'
Date: Wed, 13 Jan 2021 14:49:47 +0000
Message-Id: <20210113145009.1272040-10-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Winischhofer <thomas@winischhofer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpdGhlciAnc2lzLmgnIG5vciBhbnkgb2YgaXRzIGNvbnN1bWVycyB1c2VzIHRoZXNlIHRhYmxl
cy4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIGRy
aXZlcnMvdmlkZW8vZmJkZXYvc2lzL2luaXQuaDoxNDQ6Mjg6IHdhcm5pbmc6IOKAmFNpU19WR0Ff
REFD4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy9pbml0Lmg6MTMyOjI4OiB3YXJuaW5nOiDigJhTaVNfRUdB
X0RBQ+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQog
ZHJpdmVycy92aWRlby9mYmRldi9zaXMvaW5pdC5oOjEyMDoyODogd2FybmluZzog4oCYU2lTX0NH
QV9EQUPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0K
IGRyaXZlcnMvdmlkZW8vZmJkZXYvc2lzL2luaXQuaDoxMDg6Mjg6IHdhcm5pbmc6IOKAmFNpU19N
REFfREFD4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1d
CiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy9pbml0Lmg6MTA2OjI5OiB3YXJuaW5nOiDigJhNb2Rl
SW5kZXhfMzEwXzIwNDh4MTUzNuKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29u
c3QtdmFyaWFibGUKIGRyaXZlcnMvdmlkZW8vZmJkZXYvc2lzL2luaXQuaDoxMDU6Mjk6IHdhcm5p
bmc6IOKAmE1vZGVJbmRleF8zMDBfMjA0OHgxNTM24oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1jb25zdC12YXJpYWJsZQogZHJpdmVycy92aWRlby9mYmRldi9zaXMvaW5pdC5oOjEw
NDoyOTogd2FybmluZzog4oCYTW9kZUluZGV4XzE5MjB4MTQ0MOKAmSBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogZHJpdmVycy92aWRlby9mYmRldi9zaXMv
aW5pdC5oOjEwMzoyOTogd2FybmluZzog4oCYTW9kZUluZGV4XzE5MjB4MTA4MOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogZHJpdmVycy92aWRlby9m
YmRldi9zaXMvaW5pdC5oOjEwMjoyOTogd2FybmluZzog4oCYTW9kZUluZGV4XzE2MDB4MTIwMOKA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogZHJpdmVy
cy92aWRlby9mYmRldi9zaXMvaW5pdC5oOjEwMToyOTogd2FybmluZzog4oCYTW9kZUluZGV4XzE2
ODB4MTA1MOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9
XQogZHJpdmVycy92aWRlby9mYmRldi9zaXMvaW5pdC5oOjEwMDoyOTogd2FybmluZzog4oCYTW9k
ZUluZGV4XzE0MDB4MTA1MOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3Qt
dmFyaWFibGU9XQoKTkI6IFNuaXBwZWQgLSB0aGVyZSBhcmUgMjc3IG9mIHRoZXNlIQoKQ2M6IFRo
b21hcyBXaW5pc2NoaG9mZXIgPHRob21hc0B3aW5pc2NoaG9mZXIubmV0PgpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy92aWRlby9mYmRldi9zaXMvc2lzLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zaXMvc2lzLmggYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3Npcy9zaXMuaAppbmRleCA5ZjRjMzA5M2NjYjM2Li5kNjMyZjA5NjA4M2Iz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy9zaXMuaAorKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3Npcy9zaXMuaApAQCAtMTUsNyArMTUsNiBAQAogCiAjaW5jbHVkZSAidmdh
dHlwZXMuaCIKICNpbmNsdWRlICJ2c3RydWN0LmgiCi0jaW5jbHVkZSAiaW5pdC5oIgogCiAjZGVm
aW5lIFZFUl9NQUpPUgkJMQogI2RlZmluZSBWRVJfTUlOT1IJCTgKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
