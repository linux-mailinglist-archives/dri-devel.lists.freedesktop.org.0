Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DAD4FB1E
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 12:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5E089AB2;
	Sun, 23 Jun 2019 10:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03A389A9A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 10:35:56 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p24so7964514lfo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 03:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5O14FWmnJRU3Nb7+trxAkaKhy47YhC3RudVdps7w9S0=;
 b=VD2E9GR9qk8fQ7jSFPlYvh/0iwGfaT9kcaqFLq6UYmg+i5rQZw2HeihnJj0EgAj1da
 QJT33tIlOQVOi0QRwEEIn/++nNh+fWYx2eCZ84PWEgSpzibHM3tapPZfdDjwCDev34If
 JFfmpD6tVeTTXhWXxHMQWZ7aOzcwtQATLwG+qQrB+9n6M7ejTi24EGeN84NXB8g2M15S
 euXIh0mO3msuYqWI9sLKtTAYBHgCDkr7PuHXa6wP+zTrGgklvOWUySQ1gVTEw/h81flH
 UtlpRfTur4t+nWLQRL3c8xcUCJMGyUKToxA5LAkUhMlg+sDaNgfItodb7ft2kT1B72Of
 PsHg==
X-Gm-Message-State: APjAAAWzfBWPzE/PkzqRdu7TmeKhjep21GOHxYKsHaq6ADBsdxf3HaR6
 1zugwB9nZIQzZZlU804t5AmYWgVZ94WT0Q==
X-Google-Smtp-Source: APXvYqyG3XA77ouBw8FWauIbPG24rApfn0pI99clVv3gix1W32Y7lXFUavdteNoszjr8XZfqJBu29g==
X-Received: by 2002:a19:2d51:: with SMTP id t17mr28958284lft.77.1561286154855; 
 Sun, 23 Jun 2019 03:35:54 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 x22sm1124248lfq.20.2019.06.23.03.35.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 03:35:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/mga: drop use of drmP.h
Date: Sun, 23 Jun 2019 12:35:41 +0200
Message-Id: <20190623103542.30697-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190623103542.30697-1-sam@ravnborg.org>
References: <20190623103542.30697-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5O14FWmnJRU3Nb7+trxAkaKhy47YhC3RudVdps7w9S0=;
 b=irz55E7vQqUn4agNQlJ3qM5AOfKDjLrg5sNz+dDnGNW2r9xCgpkD4HvTv+w49EKk+S
 k4lxiXmbV9jDXaayq7QYGXO941B15y13m559NU229+QO8xNg4WPa4zmxlQORCcXmjH1h
 dHS0MyQ74ybCusr+bkRQNBt4KOuIKXpZaR8EJC/vKe+VwX1NQImG0lIC1CH9JRh5qqOq
 1/k2yjPoEIiMkNutqi/ZGMuL+z5BM5mmrYUzbriZeTYIWxYYwHv0NXPVk9XkdvDXNL3A
 Lh0FZPmDrrhfJe7SRKLLBsGr4hy2D6TMMGsr4sdqfg2cslmcpVaKUM5tLanj70AosMti
 AHMg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB0aGUgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KQ2xlYW4g
dXAgbGlzdCBvZiBpbmNsdWRlIGZpbGVzIGFuZCBzb3J0IHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWdhL21nYV9kbWEuYyAgIHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfZHJ2LmMg
ICB8IDcgKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfaW9jMzIuYyB8IDMgKy0tCiBk
cml2ZXJzL2dwdS9kcm0vbWdhL21nYV9pcnEuYyAgIHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL21n
YS9tZ2Ffc3RhdGUuYyB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3dhcnAuYyAgfCA0
ICstLS0KIDYgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kbWEuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZ2EvbWdhX2RtYS5jCmluZGV4IGM1ZTdjMjEwOTk5Zi4uODVjNzQzNjRjZTI0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhL21nYV9kbWEuYwpAQCAtMzcsOCArMzcsNiBAQAogCiAjaW5jbHVkZSA8bGludXgvZGVs
YXkuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8ZHJtL21nYV9kcm0uaD4K
ICNpbmNsdWRlICJtZ2FfZHJ2LmgiCiAKICNkZWZpbmUgTUdBX0RFRkFVTFRfVVNFQ19USU1FT1VU
CTEwMDAwCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZ2EvbWdhX2Rydi5jCmluZGV4IDZlMWQxMDU0YWQwNi4uNzExMjhlNmY2YWU5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhL21nYV9kcnYuYwpAQCAtMzEsMTIgKzMxLDExIEBACiAKICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8ZHJtL21n
YV9kcm0uaD4KLSNpbmNsdWRlICJtZ2FfZHJ2LmgiCi0KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5o
PgogI2luY2x1ZGUgPGRybS9kcm1fcGNpaWRzLmg+CiAKKyNpbmNsdWRlICJtZ2FfZHJ2LmgiCisK
IHN0YXRpYyBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAltZ2FfUENJX0lE
UwogfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2lvYzMyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWdhL21nYV9pb2MzMi5jCmluZGV4IDI0NWZiMmUzNTljZi4uNmNjZDI3MDc4
OWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9pb2MzMi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2lvYzMyLmMKQEAgLTMwLDEwICszMCw5IEBACiAgKiBPVVQg
T0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVS
IERFQUxJTkdTCiAgKiBJTiBUSEUgU09GVFdBUkUuCiAgKi8KKwogI2luY2x1ZGUgPGxpbnV4L2Nv
bXBhdC5oPgogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KLSNpbmNsdWRlIDxkcm0vbWdhX2RybS5o
PgogI2luY2x1ZGUgIm1nYV9kcnYuaCIKIAogdHlwZWRlZiBzdHJ1Y3QgZHJtMzJfbWdhX2luaXQg
ewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfaXJxLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWdhL21nYV9pcnEuYwppbmRleCAxNTQ1YTM2OTRiNTMuLmE3ZTZmZmM4MGE3OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfaXJxLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21nYS9tZ2FfaXJxLmMKQEAgLTMxLDggKzMxLDYgQEAKICAqICAgIEVyaWMgQW5ob2x0IDxh
bmhvbHRARnJlZUJTRC5vcmc+CiAgKi8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVk
ZSA8ZHJtL21nYV9kcm0uaD4KICNpbmNsdWRlICJtZ2FfZHJ2LmgiCiAKIHUzMiBtZ2FfZ2V0X3Zi
bGFua19jb3VudGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZ2EvbWdhX3N0YXRlLmMKaW5kZXggMjk2YTFkYjdlNWVlLi43N2EwYjAwNmYwNjYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3N0YXRlLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21nYS9tZ2Ffc3RhdGUuYwpAQCAtMzIsOCArMzIsNiBAQAogICogICAgR2FyZXRoIEh1
Z2hlcyA8Z2FyZXRoQHZhbGludXguY29tPgogICovCiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgot
I2luY2x1ZGUgPGRybS9tZ2FfZHJtLmg+CiAjaW5jbHVkZSAibWdhX2Rydi5oIgogCiAvKiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV93YXJwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhL21nYV93YXJwLmMKaW5kZXggMGI3NjM1MjI2MGE5Li5iNWVmMWQyYzhiMWMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3dhcnAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhL21nYV93YXJwLmMKQEAgLTI5LDExICsyOSw5IEBACiAKICNpbmNsdWRlIDxs
aW51eC9maXJtd2FyZS5oPgogI2luY2x1ZGUgPGxpbnV4L2loZXguaD4KLSNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5j
bHVkZSA8ZHJtL21nYV9kcm0uaD4KICNpbmNsdWRlICJtZ2FfZHJ2LmgiCiAKICNkZWZpbmUgRklS
TVdBUkVfRzIwMCAibWF0cm94L2cyMDBfd2FycC5mdyIKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
