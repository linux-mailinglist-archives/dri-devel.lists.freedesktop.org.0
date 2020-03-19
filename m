Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8518C150
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4191C6EA75;
	Thu, 19 Mar 2020 20:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3337D6EA74
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:25:10 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o10so4027630ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G66dWEfIht98auXMyzuqyEBS45yksLnYa42PvLRm7ts=;
 b=rzIxNrRvhG30EzUvpKLaiXO+bZz93mHtAQJVu1a7JH3uilUHpDj3ur56WT/8BSu3dC
 bEl0hIEYyKsxw6hi6nkJgUKrkvFQ0rxzeVWOrq9FzqB9sCND8chxZxQ4z+UZM9B0B9Ht
 nyMCDyX3pxEQMZQonDKcxVFVHUKGgxa0XAp6p23YwXzNpGhw24RMGE8Ok5b/NmS9eI9b
 EoUXM01Y8yOfXsc+Dq1T0ar/6m6teaeUpV3gMlB0H6fHp+b8pyPvh1xOKACfz9+bDwFI
 YW3UUxuoxWpthVnpg+paPxU3po3t+v+sgP/XkSvIGd29hKkCvdDt6zZVo/JanWukNHkj
 ccew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G66dWEfIht98auXMyzuqyEBS45yksLnYa42PvLRm7ts=;
 b=t3WfGVdQpSVVCFNqw9kw70/jktf+EfYonKQx+OVXNXTqP46U14k6AtsKt1NF5re1ek
 MI23eSf/K8KWLhwXqLb1R4vH8BxCQBnkDAP9S1SJ7S9dgdx1wNJuKjwKrePnilfn2j6f
 lW382+Z39RPB1woOpWN2m1qNuJQQeepEKq06/wBFKWLg+RvX8D23xG5/pa2lcHa8PCGr
 CqJrwL0BfFe+JMi813nFs00olgpN6cbaKv3VNTZ4iaLr0AkVlH3TiHFFW91yTfxY87QI
 tky5NaOfrmr3WDpGTsWxGx8fBP7Yv0r37d6Bxjlk5jd+gSFWJUj4TCwa84FxGVICtznM
 RlRA==
X-Gm-Message-State: ANhLgQ0F/zKhPuLlFAe/OUzDMVgJN2pA5J3SoebMux5eUZ/igZMN3tUf
 uMKR1qCYmLAdiUNaOaO5m1AHG10S04Q=
X-Google-Smtp-Source: ADFU+vtWtO7NPj5rf7meV3KtiqCY4Bx2jvhQkeJYjPQKan1a+/AW1cl7isCXFn1cnBEoFVTlC0KCuw==
X-Received: by 2002:a05:651c:204:: with SMTP id
 y4mr3089259ljn.280.1584649508166; 
 Thu, 19 Mar 2020 13:25:08 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v3sm2074372lfp.8.2020.03.19.13.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:25:07 -0700 (PDT)
From: rscheidegger.oss@gmail.com
X-Google-Original-From: sroland@vmware.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/17] drm/vmwgfx: Use vmwgfx version 2.18 to signal SM5
 compatibility
Date: Thu, 19 Mar 2020 21:24:14 +0100
Message-Id: <20200319202414.9296-18-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319202414.9296-1-sroland@vmware.com>
References: <20200319202414.9296-1-sroland@vmware.com>
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+
ClJldmlld2VkLWJ5OiBDaGFybWFpbmUgTGVlIDxjaGFybWFpbmVsQHZtd2FyZS5jb20+ClJldmll
d2VkLWJ5OiBCcmlhbiBQYXVsIDxicmlhbnBAdm13YXJlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9s
YW5kIFNjaGVpZGVnZ2VyIChWTXdhcmUpIDxyc2NoZWlkZWdnZXIub3NzQGdtYWlsLmNvbT4KX19f
CnYyOiBVc2UgMi4xOCBpbnN0ZWFkIG9mIDIuMTcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Ry
di5oIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKaW5kZXggYWE0MTMxZjVm
OGZjLi5lMGEzNjcwMjg3N2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oCkBAIC01
OCw3ICs1OCw3IEBACiAjZGVmaW5lIFZNV0dGWF9EUklWRVJfTkFNRSAidm13Z2Z4IgogI2RlZmlu
ZSBWTVdHRlhfRFJJVkVSX0RBVEUgIjIwMjAwMTE0IgogI2RlZmluZSBWTVdHRlhfRFJJVkVSX01B
Sk9SIDIKLSNkZWZpbmUgVk1XR0ZYX0RSSVZFUl9NSU5PUiAxNworI2RlZmluZSBWTVdHRlhfRFJJ
VkVSX01JTk9SIDE4CiAjZGVmaW5lIFZNV0dGWF9EUklWRVJfUEFUQ0hMRVZFTCAwCiAjZGVmaW5l
IFZNV0dGWF9GSUZPX1NUQVRJQ19TSVpFICgxMDI0KjEwMjQpCiAjZGVmaW5lIFZNV0dGWF9NQVhf
UkVMT0NBVElPTlMgMjA0OAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
