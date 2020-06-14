Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FF1F8FA8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DD96E1B9;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C1A89F9F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 19:04:05 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u16so8236941lfl.8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KE3Cp/6ehIOZgJvolIteO7RRh/P+B1vr5r/zeIK+g48=;
 b=CM8pkeiPpV/67TLF7YKAfKe5HVs3AYuhSnj5bs2/s2CG6DXNwaswpbOihAWLTH4+st
 eyGNcsyT8xG+s2M8sSKl1ae7Fy6glbgrPOCRBHbtwlV8r0bsbwKYTrbhrD8Zm4yhSYGZ
 K0mX2nWPdcw0WQnQnLgFTnXIYSeMGKGOacsfzxijAwpxpOC4QkFXTWD8c2BpuAXCszgB
 jhRewBYI0z/KoFZD6ubZqR/hNx+oQtl2CTdleIKgtR2z6tYPRulxQXJznsCZ+h44DrLy
 QjnAEtRX+2uxqXhRgRw0D+PliEZBcMKmaC5Vo7gt9L+1KQJXc4VhzSvA0x/EcWnQpeGG
 v3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KE3Cp/6ehIOZgJvolIteO7RRh/P+B1vr5r/zeIK+g48=;
 b=YGD9OH9BXwkSlYwcACV0yiibKwI5cN9lEKAT0/+UUC7+7Gg985etxCEvyrKrhKoMMK
 QVdvxlsfjKm38uyzFbUnCgT+1MlhIE39O0obivFuwTj6jO1ns33puVCNiyKO7ScVxWVT
 R2rMi0GOiApF+2ZUFLsTdx6xzldyOEOeI4oG1eFnT7rei8Sgw/CNFBorZSviOdvjYySf
 4cDaoAhubfr2bPqOgmMhFJ9R6l6Vjy2+Mq6MTEtRbF27Z9XJsxfFVsIFHpQK3uNoh1NF
 1ZrGmbS1vYxaMtDNKWRxwLr9hfz/NibQJcCv3EfcbapXRLp5YGEZ0bNadBk6Z1PQ1PNV
 EJ3w==
X-Gm-Message-State: AOAM532XDBY4JXBfLUxPGLSl8Vwu03eC/ccfp+Nzp4FwXJKNuPDWxiD/
 Z6M8KVpFJ4T+ggxmPQRPX6Y=
X-Google-Smtp-Source: ABdhPJxNedxUdUCkWwvqkcgI48DIxGqZguFQL2MNpeDFwrd7JYgemHr0/qUfI5fIGeC1nd13rG1z9g==
X-Received: by 2002:ac2:5324:: with SMTP id f4mr11951627lfh.209.1592161443982; 
 Sun, 14 Jun 2020 12:04:03 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id p15sm3410856ljn.53.2020.06.14.12.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 12:04:03 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v1 0/6] 180° rotation support for NVIDIA Tegra DRM
Date: Sun, 14 Jun 2020 22:03:42 +0300
Message-Id: <20200614190348.12193-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpUaGlzIHNlcmllcyBhZGRzIDE4MMKwIGRpc3BsYXkgcGxhbmUgcm90YXRpb24gc3Vw
cG9ydCB0byB0aGUgTlZJRElBIFRlZ3JhCkRSTSBkcml2ZXIgd2hpY2ggaXMgbmVlZGVkIGZvciBk
ZXZpY2VzIHRoYXQgaGF2ZSBkaXNwbGF5IHBhbmVsIHBoeXNpY2FsbHkKbW91bnRlZCB1cHNpZGUt
ZG93biwgbGlrZSBOZXh1cyA3IHRhYmxldCBkZXZpY2UgZm9yIGV4YW1wbGUgWzFdLiBTaW5jZQpE
Uk0gcGFuZWwgcm90YXRpb24gaXMgYSBuZXcgdGhpbmcgZm9yIGEgdXNlcnNwYWNlLCBjdXJyZW50
bHkgb25seQpPcGVudGVncmEgWG9yZyBkcml2ZXIgaGFuZGxlcyB0aGUgcm90YXRlZCBkaXNwbGF5
IHBhbmVsIFsyXSwgYnV0IHRoaXMKaXMgZ29vZCBlbm91Z2ggZm9yIHRoZSBzdGFydC4KCk5vdGUg
dGhhdCBsYXRlciBvbiBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gaW1wbGVtZW50IGEgdHJhbnNw
YXJlbnQgMTgwwrAKZGlzcGxheSByb3RhdGlvbiBmb3IgVGVncmEgRFJNIGRyaXZlciB3aGljaCB3
aWxsIHJlbW92ZSB0aGUgbmVlZCB0byBoYXZlCmEgYmxlZWRpbmcgZWRnZSB1c2Vyc3BhY2UgdGhh
dCBrbm93cyBob3cgdG8gcm90YXRlIGRpc3BsYXkgcGxhbmVzIGFuZCBJJ20Kc2xvd2x5IHdvcmtp
bmcgb24gaXQuIEZvciB0aGUgc3RhcnRlciB3ZSBjYW4gZ28gd2l0aCB0aGUgbWluaW1hbCByb3Rh
dGlvbgpzdXBwb3J0LCBzbyBpdCdzIG5vdCBhIGJsb2NrZXIuCgpUaGlzIHNlcmllcyBpcyBiYXNl
ZCBvbiB0aGUgd29yayB0aGF0IHdhcyBtYWRlIGJ5IERlcmVrIEJhc2Vob3JlIGZvciB0aGUKTWVk
aWF0ZWsgZHJpdmVyIFszXSwgaGlzIHBhdGNoZXMgYXJlIGluY2x1ZGVkIGludG8gdGhpcyBwYXRj
aHNldC4gSSBhZGRlZApteSB0ZXN0ZWQtYnkgdGFncyB0byB0aGUgRGVyZWsncyBwYXRjaGVzLgoK
UGxlYXNlIHJldmlldyBhbmQgYXBwbHksIHRoYW5rcyBpbiBhZHZhbmNlIQoKWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC10ZWdyYS9wYXRjaC8yMDIwMDYwNzE1
NDMyNy4xODU4OS0zLWRpZ2V0eEBnbWFpbC5jb20vClsyXSBodHRwczovL2dpdGh1Yi5jb20vZ3Jh
dGUtZHJpdmVyL3hmODYtdmlkZW8tb3BlbnRlZ3JhL2NvbW1pdC8yOGViMjBhMzk1OWJiZTViYzNh
M2I2N2U1NTk3NzA5M2ZkNTExNGNhClszXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC8zLzUv
MTExOQoKRGVyZWsgQmFzZWhvcmUgKDIpOgogIGRybS9wYW5lbDogQWRkIGhlbHBlciBmb3IgcmVh
ZGluZyBEVCByb3RhdGlvbgogIGRybS9wYW5lbDogU2V0IGRpc3BsYXkgaW5mbyBpbiBwYW5lbCBh
dHRhY2gKCkRtaXRyeSBPc2lwZW5rbyAoNCk6CiAgZHJtL3BhbmVsOiBsdmRzOiBTZXQgdXAgcGFu
ZWwgb3JpZW50YXRpb24KICBkcm0vdGVncmE6IHBsYW5lOiBSZW5hbWUgYm90dG9tX3VwIHRvIHJl
ZmxlY3RfeQogIGRybS90ZWdyYTogcGxhbmU6IFN1cHBvcnQgaG9yaXpvbnRhbCByZWZsZWN0aW9u
IG1vZGUKICBkcm0vdGVncmE6IHBsYW5lOiBTdXBwb3J0IDE4MMKwIHJvdGF0aW9uCgogZHJpdmVy
cy9ncHUvZHJtL2RybV9wYW5lbC5jICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgfCAgNiArKysKIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kYy5jICAgICAgICAgfCA0MyArKysrKysrKysrKysrKysrKystLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuaCAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9wbGFuZS5jICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Bs
YW5lLmggICAgICB8ICAzICstCiBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCAgICAgICAgICAgIHwg
NTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDE2MiBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
