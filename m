Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E326139BC7
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 10:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40935892B4;
	Sat,  8 Jun 2019 08:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48454892B4
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 08:19:35 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so3686358ljh.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2019 01:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DKYCitC9bABt+Ua5CgD0ibzkHhv10Dhd8i7b9dFZW/E=;
 b=D5BBZy5XvJ/kI9/ytQoV3Xu5RUNc9LHSRix2UJ991HFxIrOufUIm6V16amvOPe2KrA
 G6lp4sTgwhvNvB+5ilF3h2ubSMbnO3vShhUFCi5LDB1RsDIvyc0v9G6x0Ddiwvk4Gtb2
 ST89dVjyYElJVua13tnJzr0PubHzZQuJrAImKWK3MNXZ3VfJOvPpVgNFUeNefY99L1c2
 RLmhh8jERVNdWN9gWafFoKNQBqOKUrLs2GbioAM3wcodnhVX7q5E7eq7f1cMuipeFIxZ
 aYD0Ei9SWH6N6YriS4GachEW77mDdxLyyHRq9TrrMquEyuelz5wyIbPtGteDLP4tJC/I
 S5ww==
X-Gm-Message-State: APjAAAUmp6YzTSGFlJNAZQfVaAVBRVadk/Y8y3Nx4YzKY/zUgrTVeDnt
 dFIhMA9RZQ4/qhvszK3+77SQh+UgNiU=
X-Google-Smtp-Source: APXvYqyPRF2Oxlwxd3YSdCDUTlx/5mubK2EMlkR3kG3yTqRz2Q36tTd9qQsdULjfoLsZvMhmU8m5Qw==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr31094963ljg.121.1559981973272; 
 Sat, 08 Jun 2019 01:19:33 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k82sm747311lje.30.2019.06.08.01.19.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:19:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/4] drm/mga: drop use of drmP.h
Date: Sat,  8 Jun 2019 10:19:22 +0200
Message-Id: <20190608081923.6274-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608081923.6274-1-sam@ravnborg.org>
References: <20190608081923.6274-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKYCitC9bABt+Ua5CgD0ibzkHhv10Dhd8i7b9dFZW/E=;
 b=guSMtP/oVFGZzidENB3/UOH6t4RC3i/pAGE0F73vkyq+ye5ZHRsXoARUu23M+88ivS
 DinVSSadsex9UL23T/DJ5rcZEMIXjRMqtoFicPUyQTTDjHr+WkU7riJ9M378bYgFauzl
 5wy+zKPZbfxlvzokiSkg8QLE1GaYk1F8gFhsVkCvTACx+iaMlj4ZnWj6hF0u3PovqD9/
 nZE64Lq+oBaJNkN+qbIcIHFlZ6qAdSw8sX7tPA0DKu5vk4G+Thema9NkuYC5uiGfy7bU
 PK95YTltazHwU+ih8lxI6/UhyS6xlhwbTK1wD1gdfXB/e5pv4hsb5mXgTcc6mSZKSNn4
 n4nw==
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
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdh
L21nYV9kbWEuYyAgIHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfZHJ2LmMgICB8IDcg
KysrLS0tLQogZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfaW9jMzIuYyB8IDMgKy0tCiBkcml2ZXJz
L2dwdS9kcm0vbWdhL21nYV9pcnEuYyAgIHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ff
c3RhdGUuYyB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3dhcnAuYyAgfCA0ICstLS0K
IDYgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
Z2EvbWdhX2RtYS5jCmluZGV4IDEyM2JlMmYzYTE1MS4uMTM5NTU0YTM3MzNkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdh
L21nYV9kbWEuYwpAQCAtMzcsOCArMzcsNiBAQAogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4K
IAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8ZHJtL21nYV9kcm0uaD4KICNpbmNs
dWRlICJtZ2FfZHJ2LmgiCiAKICNkZWZpbmUgTUdBX0RFRkFVTFRfVVNFQ19USU1FT1VUCTEwMDAw
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZ2EvbWdhX2Rydi5jCmluZGV4IDZlMWQxMDU0YWQwNi4uNzExMjhlNmY2YWU5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhL21nYV9kcnYuYwpAQCAtMzEsMTIgKzMxLDExIEBACiAKICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8ZHJtL21nYV9kcm0u
aD4KLSNpbmNsdWRlICJtZ2FfZHJ2LmgiCi0KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fcGNpaWRzLmg+CiAKKyNpbmNsdWRlICJtZ2FfZHJ2LmgiCisKIHN0YXRp
YyBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAltZ2FfUENJX0lEUwogfTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2lvYzMyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWdhL21nYV9pb2MzMi5jCmluZGV4IDI0NWZiMmUzNTljZi4uNmNjZDI3MDc4OWM2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9pb2MzMi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZ2EvbWdhX2lvYzMyLmMKQEAgLTMwLDEwICszMCw5IEBACiAgKiBPVVQgT0YgT1Ig
SU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJ
TkdTCiAgKiBJTiBUSEUgU09GVFdBUkUuCiAgKi8KKwogI2luY2x1ZGUgPGxpbnV4L2NvbXBhdC5o
PgogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KLSNpbmNsdWRlIDxkcm0vbWdhX2RybS5oPgogI2lu
Y2x1ZGUgIm1nYV9kcnYuaCIKIAogdHlwZWRlZiBzdHJ1Y3QgZHJtMzJfbWdhX2luaXQgewpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWdhL21nYV9pcnEuYwppbmRleCBjNmEzZmFiNWIwYzQuLjdjNDhmNGQwOTBhYyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2FfaXJxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21n
YS9tZ2FfaXJxLmMKQEAgLTMxLDggKzMxLDYgQEAKICAqICAgIEVyaWMgQW5ob2x0IDxhbmhvbHRA
RnJlZUJTRC5vcmc+CiAgKi8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8ZHJt
L21nYV9kcm0uaD4KICNpbmNsdWRlICJtZ2FfZHJ2LmgiCiAKIHUzMiBtZ2FfZ2V0X3ZibGFua19j
b3VudGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
Z2EvbWdhX3N0YXRlLmMKaW5kZXggMjk2YTFkYjdlNWVlLi43N2EwYjAwNmYwNjYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3N0YXRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21nYS9tZ2Ffc3RhdGUuYwpAQCAtMzIsOCArMzIsNiBAQAogICogICAgR2FyZXRoIEh1Z2hlcyA8
Z2FyZXRoQHZhbGludXguY29tPgogICovCiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgotI2luY2x1
ZGUgPGRybS9tZ2FfZHJtLmg+CiAjaW5jbHVkZSAibWdhX2Rydi5oIgogCiAvKiA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV93YXJwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhL21nYV93YXJwLmMKaW5kZXggMGI3NjM1MjI2MGE5Li5iNWVmMWQyYzhiMWMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3dhcnAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhL21nYV93YXJwLmMKQEAgLTI5LDExICsyOSw5IEBACiAKICNpbmNsdWRlIDxsaW51eC9m
aXJtd2FyZS5oPgogI2luY2x1ZGUgPGxpbnV4L2loZXguaD4KLSNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0jaW5jbHVkZSA8
ZHJtL21nYV9kcm0uaD4KICNpbmNsdWRlICJtZ2FfZHJ2LmgiCiAKICNkZWZpbmUgRklSTVdBUkVf
RzIwMCAibWF0cm94L2cyMDBfd2FycC5mdyIKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
