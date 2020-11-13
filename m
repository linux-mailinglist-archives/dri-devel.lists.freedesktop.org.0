Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFA2B1C28
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB526E500;
	Fri, 13 Nov 2020 13:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B156E500
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so9992288wrt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UkvWdURTsPkEdVDzyHJ8FYZlYEKq+y0hj/4CtFCIFp4=;
 b=it1slg7eKp4pW5KEZ7vtYMFSfeU183JFhubZH/qEBglZ8gc2voRRHBhujz3X936q5b
 +GVVysYWqybRxo9yD89WDkhMwxfHo+LuchKiHgoHcQ2gJXPV/7HRRVeubA2tSXQLAMfG
 mC6diUMtNPUA5UQGKuOoJO6KrBaduJmWWbiEgMT+hiqY2Kw+zDp5BYifY7RIm46ASjr0
 SWkmDqmf5q9w1Tto3DKwzzdWjTRTdYhNAqyfztmrvvWgN7II9jiaKHa4vOBjygqNu3PK
 EILFa43AKAy6VL+b1aQ7cXSAeiKoyOthV07rLPzm+JcX2NASAGhGdm8fWoR7AP6OFQk+
 rkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UkvWdURTsPkEdVDzyHJ8FYZlYEKq+y0hj/4CtFCIFp4=;
 b=q3hOmvn9Rn7hCi9Is+ADBDK+Hc1NH2DsIv9wwILqbxloM3Tl52YrzI050lwY1O2qOl
 iD+wd0haOqH6RaFt1FXiXMRIpIKZRibfgfNrWxGbr0yFI9Awu2+Cx/bUS1ryH5lJZHgC
 VkqQSUEEWYG3eG3o92f86K3iqsBLq0rrisOoRiKhEuXvtgUG/mAeHTs8ivAlQdU0O57F
 Rn6QTEL8mJBCCzw0BEXLwlpoqyVSxyrXv6lBJsn7gmJL7o18w6mjERYZSxD4uaZjQcfg
 e3IowdCLk8ACL3d0oDr9JkVHATkLrXBfKKOohbuHvBwAS29YDiFuELh491eRW2DWG0SY
 bbcg==
X-Gm-Message-State: AOAM530chak7Flfl+GGW6hKG9D5nk9RPA2D7QX1QrGtZGI9HUGC7z5J7
 2RBJM2SsGjwFlnQShTWVLnwmPMp5cCQnMK2P
X-Google-Smtp-Source: ABdhPJxnNPMHkiRv4CvlSdVHRyP+EPDWdkVMC26JII0l+dTlSjh9rvGeHvEsOFiDMueCPHdGDTu2Bg==
X-Received: by 2002:adf:f852:: with SMTP id d18mr3463400wrq.232.1605275385374; 
 Fri, 13 Nov 2020 05:49:45 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/40] drm/amd/display/dc/core/dc_link_dp: Move
 DP_VGA_LVDS_CONVERTER_ID_{2, 3} to where they're used
Date: Fri, 13 Nov 2020 13:49:00 +0000
Message-Id: <20201113134938.4004947-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXhlcyA+MjAwIHdhcm5pbmdzLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEg
a2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5cGVzLmg6MTIzOjIyOiB3YXJuaW5nOiDigJhE
UF9WR0FfTFZEU19DT05WRVJURVJfSURfM+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtY29uc3QtdmFyaWFibGU9XQogMTIzIHwgc3RhdGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xW
RFNfQ09OVkVSVEVSX0lEXzNbXSA9ICJkbm9tbEEiOwogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9pbmNsdWRlL2RkY19z
ZXJ2aWNlX3R5cGVzLmg6MTIxOjIyOiB3YXJuaW5nOiDigJhEUF9WR0FfTFZEU19DT05WRVJURVJf
SURfMuKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQog
MTIxIHwgc3RhdGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzJbXSA9
ICJzaXZhclQiOwoKTkI6IFJlcGVhdGVkIH4xMDAgdGltZXMgLSBzbmlwcGVkIGZvciBicmV2aXR5
CgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmMgICAgICAgIHwgNSArKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMuaCB8IDQgLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCmluZGV4IDZjNjBjMWZkZWJkYzEu
LmYyMDIzZDJiNTMyMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjX2xpbmtfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmMKQEAgLTE1LDYgKzE1LDExIEBACiAjaW5jbHVkZSAiZGNfZG11Yl9z
cnYuaCIKICNpbmNsdWRlICJkY2UvZG11Yl9od19sb2NrX21nci5oIgogCisvKlRyYXZpcyovCitz
dGF0aWMgY29uc3QgdWludDhfdCBEUF9WR0FfTFZEU19DT05WRVJURVJfSURfMltdID0gInNpdmFy
VCI7CisvKk51dG1lZyovCitzdGF0aWMgY29uc3QgdWludDhfdCBEUF9WR0FfTFZEU19DT05WRVJU
RVJfSURfM1tdID0gImRub21sQSI7CisKICNkZWZpbmUgRENfTE9HR0VSIFwKIAlsaW5rLT5jdHgt
PmxvZ2dlcgogI2RlZmluZSBEQ19UUkFDRV9MRVZFTF9NRVNTQUdFKC4uLikgLyogZG8gbm90aGlu
ZyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRj
X3NlcnZpY2VfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2Rk
Y19zZXJ2aWNlX3R5cGVzLmgKaW5kZXggYzliZTg5OWNkMjVjZC4uYjQ1M2NlNWE5YmZkYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2Vf
dHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2Vy
dmljZV90eXBlcy5oCkBAIC0xMTcsMTAgKzExNyw2IEBAIHN0cnVjdCBhdl9zeW5jX2RhdGEgewog
CXVpbnQ4X3QgYXVkX2RlbF9pbnMzOy8qIERQQ0QgMDAwMkRoICovCiB9OwogCi0vKlRyYXZpcyov
Ci1zdGF0aWMgY29uc3QgdWludDhfdCBEUF9WR0FfTFZEU19DT05WRVJURVJfSURfMltdID0gInNp
dmFyVCI7Ci0vKk51dG1lZyovCi1zdGF0aWMgY29uc3QgdWludDhfdCBEUF9WR0FfTFZEU19DT05W
RVJURVJfSURfM1tdID0gImRub21sQSI7CiAvKkRQIHRvIER1YWwgbGluayBEVkkgY29udmVydGVy
Ki8KIHN0YXRpYyBjb25zdCB1aW50OF90IERQX0RWSV9DT05WRVJURVJfSURfNFtdID0gIm0yRFZJ
YSI7CiBzdGF0aWMgY29uc3QgdWludDhfdCBEUF9EVklfQ09OVkVSVEVSX0lEXzVbXSA9ICIzMzkz
TjIiOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
