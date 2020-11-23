Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3622C0434
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068996E038;
	Mon, 23 Nov 2020 11:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953A889FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so18212746wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++Vz68Fmu1On4IoEFcmE3A4sGOg19/cMuiuu88qyFq4=;
 b=q2K/cwXYQSgDLZTSTd16fYGp8epOrbJawkVeEFI3/Pfsv/JGDv5qaPXYej0iOxd2ph
 48gor7LDZtGHEP5ggv34K4U71CCZv9PNpVNhUskTNwtJpMYERc9plx2o33yuqougCGaK
 yh+M9Fe4ynTg2rknsoZZeLyM8Li+5AUSRduvQKHd/942b6drv28cCsPj6Zau/rquxKGQ
 F+YRrQad5JTANuegzhgxb0GJ0o76zcEYQu+iUST9WB0x+lzVqqR3ZdSgZlreFanFYD2E
 Nh+s2voMHLrEHv9VGA3bJOwwKuePJECNJP1WSvjQ5MZDdOOehYGs7KqF4AdWw00B8RsW
 0rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=++Vz68Fmu1On4IoEFcmE3A4sGOg19/cMuiuu88qyFq4=;
 b=R7+EL6u5AjxPGFBk1+8+YwBTtFuUS54cMEnIa0bydsU2DVnHhtOn9XrB9J3AEiKT6G
 g3blqKir6i6cRr+WJIZWUwZT+nPbkTgTZ9KzvRwpcvzJQjw/EIrXpEUasn1OtoYRr3WA
 Ds6GxqRbjqkrj5SJa6WZ/evEbuPBWV4Avd6JcEtvj70A2p2WuoKnIb6Z3VuOn5r2kBxm
 QH8xQYzwOlyOE+dCIf2oNiznck2wHU1jmuovssrukRRnTinGA4/7Rj1n9nQG4xXCu5Rg
 DKHZ+OOgUgIQFXPElIhA7yCFEc57+dWA3NpILXjcio12uyvgaeSd/RLtBMf1i6tpNuzH
 TQ+g==
X-Gm-Message-State: AOAM531TaFmay/nB0XD6owMQuKV8nPMEvHeMbpEJHfvtuvyMUDTGf/tr
 JFsfwpSZbx1iKVMWFle6IDNbwg==
X-Google-Smtp-Source: ABdhPJw2M/yqWnzgMlKNV8eXvBuu+WRBtKXJ5jRrXE1nwLmznM70HcqS7e2cgfQC7oeumVBTkUrHgw==
X-Received: by 2002:a5d:6805:: with SMTP id w5mr5885075wru.266.1606130410214; 
 Mon, 23 Nov 2020 03:20:10 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/40] drm/amd/amdgpu/uvd_v4_2: Add one and remove another
 function param description
Date: Mon, 23 Nov 2020 11:19:13 +0000
Message-Id: <20201123111919.233376-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y0XzIuYzo0NDg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVzY3JpYmVkIGluICd1dmRfdjRfMl9yaW5n
X2VtaXRfZmVuY2UnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjRfMi5jOjQ0ODog
d2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0aW9uIGlu
ICd1dmRfdjRfMl9yaW5nX2VtaXRfZmVuY2UnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3V2ZF92NF8yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRf
djRfMi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y0XzIuYwppbmRleCAyYzhj
MzVjM2JjYTUyLi5iZjNkMWM2MzczOWI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS91dmRfdjRfMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92
NF8yLmMKQEAgLTQzOSw3ICs0MzksNyBAQCBzdGF0aWMgdm9pZCB1dmRfdjRfMl9zdG9wKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogICogQHJpbmc6IGFtZGdwdV9yaW5nIHBvaW50ZXIKICAq
IEBhZGRyOiBhZGRyZXNzCiAgKiBAc2VxOiBzZXF1ZW5jZSBudW1iZXIKLSAqIEBmZW5jZTogZmVu
Y2UgdG8gZW1pdAorICogQGZsYWdzOiBmZW5jZSByZWxhdGVkIGZsYWdzCiAgKgogICogV3JpdGUg
YSBmZW5jZSBhbmQgYSB0cmFwIGNvbW1hbmQgdG8gdGhlIHJpbmcuCiAgKi8KLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
