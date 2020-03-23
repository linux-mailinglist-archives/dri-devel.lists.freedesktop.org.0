Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BE1901AB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C006E427;
	Mon, 23 Mar 2020 23:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D995C6E413
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:12:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h15so7072730wrx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spVhFc67JCUYedrt0P+Nd+75ec7c0ig3jD1XTrDeaWg=;
 b=r//O25fFzTCuvagt9dtJzT758y0+CXkbplEse/EBAgaGk5zp5pWvJtBgLhWzIPBQ4r
 Lyr6fHKq067sO0WCDLVn9eZubUEyX5LigFdmFVrmylMw5u1sQaDXwDbX/HQgAoZqVIdp
 YbI2/i5PCL4siFVGc6BTb05HSBzoAgo+Ielq4RTTPO6Pm2CXn8RDmCmrZYCHPoadN+Xg
 tEmGY0K1u9nw/Z8gYYYtAwK122/fecK4FIKBRfcmsGo6eOvVH7ucxFe6QlHjpuy9Kw8j
 yYxeySc8bkO1uBiadDuzWhPu2jJUAIDN+iv4K0mGTmXXy3hMXmQe3Znb3C/wvNO//oEz
 qnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spVhFc67JCUYedrt0P+Nd+75ec7c0ig3jD1XTrDeaWg=;
 b=Hz+6yUYJeRiXU/JOCaf4dTXYahk0A2IEUY7XpPH13N3twx/mlR6WhHN/JCuyaL6f8Q
 X8cA9bpOFPt9HfFlWtob+sTE7s+rbnKeBhuvLt3WtRyRcfOpXpmcdMMdgIcFIVj2R9yo
 aAUEZmd9MnRynx+X4wDOi/3H+z/kR7/gVOkg9R0LI5xJBXSZpDvJPwfwA4NkUgD34qsP
 I/DZhUtl5Q8SymjwVHwua9hXWh/XeHgvAS4b1Z2ybXTHqlsVEqAsRF6IY4jwqvEvV56V
 Oj3lXerr3wBLZbs7+OmUA6h6sE8gUd/MynTjb6p6Ww1JX5B+loZ8CvhzWD23TPETsGh+
 vlCg==
X-Gm-Message-State: ANhLgQ3HbcTZaZyBFoK5xxIpw1HHsHdxLsqv08O2aanD+9gvhN0sgW26
 Yl3rT0kT2NygBMoMWOhkgkey7Tmx
X-Google-Smtp-Source: ADFU+vtxXdADIzsSLGWDhXGGDCyHg+oBR8MojcyVnKEMNqdYNqog9WM9I/gFR88S+YUGQdTtgtDUPw==
X-Received: by 2002:a05:6000:370:: with SMTP id
 f16mr33696936wrf.9.1585005168237; 
 Mon, 23 Mar 2020 16:12:48 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id b82sm1495262wmb.46.2020.03.23.16.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:12:47 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 06/17] drm/vmwgfx: Add a new enum for SM5 graphics context
 capability
Date: Tue, 24 Mar 2020 00:12:27 +0100
Message-Id: <20200323231238.14839-7-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
References: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
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

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwuY29tPgoKQSBuZXcgZW51bSB0
byByZXByZXNlbnQgbmV3IFNNNSBncmFwaGljcyBjb250ZXh0IGNhcGFiaWxpdHkgaW4gdm13Z2Z4
LgoKdjI6IHVzZSBuZXcgY29ycmVjdCBjYXAgYml0cyAobWVyZ2VkIHNldmVyYWwgbGF0ZXIgY29t
bWl0cyBpbnRvIGl0KS4KClNpZ25lZC1vZmYtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0LmZsb3Nz
QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRo
b21hc19vc0BzaGlwbWFpbC5vcmc+ClJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNy
b2xhbmRAdm13YXJlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9s
YW5kQHZtd2FyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMg
fCAxMSArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggfCAx
MyArKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCmluZGV4IDUyNzdiOTgzMmQ1OC4uYjU1YmQzYjVmNWNk
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwpAQCAtMjkwLDYgKzI5MCw4IEBAIHN0
YXRpYyB2b2lkIHZtd19wcmludF9jYXBhYmlsaXRpZXMyKHVpbnQzMl90IGNhcGFiaWxpdGllczIp
CiAJCURSTV9JTkZPKCIgIEdyb3cgb1RhYmxlLlxuIik7CiAJaWYgKGNhcGFiaWxpdGllczIgJiBT
VkdBX0NBUDJfSU5UUkFfU1VSRkFDRV9DT1BZKQogCQlEUk1fSU5GTygiICBJbnRyYVN1cmZhY2Ug
Y29weS5cbiIpOworCWlmIChjYXBhYmlsaXRpZXMyICYgU1ZHQV9DQVAyX0RYMykKKwkJRFJNX0lO
Rk8oIiAgRFgzLlxuIik7CiB9CiAKIHN0YXRpYyB2b2lkIHZtd19wcmludF9jYXBhYmlsaXRpZXMo
dWludDMyX3QgY2FwYWJpbGl0aWVzKQpAQCAtOTAwLDYgKzkwMiwxMyBAQCBzdGF0aWMgaW50IHZt
d19kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGNoaXBz
ZXQpCiAKIAkJaWYgKHZtd19yZWFkKGRldl9wcml2LCBTVkdBX1JFR19ERVZfQ0FQKSkKIAkJCWRl
dl9wcml2LT5zbV90eXBlID0gVk1XX1NNXzRfMTsKKworCQlpZiAoaGFzX3NtNF8xX2NvbnRleHQo
ZGV2X3ByaXYpICYmCisJCSAgICAoZGV2X3ByaXYtPmNhcGFiaWxpdGllczIgJiBTVkdBX0NBUDJf
RFgzKSkgeworCQkJdm13X3dyaXRlKGRldl9wcml2LCBTVkdBX1JFR19ERVZfQ0FQLCBTVkdBM0Rf
REVWQ0FQX1NNNSk7CisJCQlpZiAodm13X3JlYWQoZGV2X3ByaXYsIFNWR0FfUkVHX0RFVl9DQVAp
KQorCQkJCWRldl9wcml2LT5zbV90eXBlID0gVk1XX1NNXzU7CisJCX0KIAl9CiAKIAlyZXQgPSB2
bXdfa21zX2luaXQoZGV2X3ByaXYpOwpAQCAtOTEzLDYgKzkyMiw4IEBAIHN0YXRpYyBpbnQgdm13
X2RyaXZlcl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgY2hpcHNl
dCkKIAogCURSTV9JTkZPKCJBdG9taWM6ICVzXG4iLCAoZGV2LT5kcml2ZXItPmRyaXZlcl9mZWF0
dXJlcyAmIERSSVZFUl9BVE9NSUMpCiAJCSA/ICJ5ZXMuIiA6ICJuby4iKTsKKwlpZiAoZGV2X3By
aXYtPnNtX3R5cGUgPT0gVk1XX1NNXzUpCisJCURSTV9JTkZPKCJTTTUgc3VwcG9ydCBhdmFpbGFi
bGUuXG4iKTsKIAlpZiAoZGV2X3ByaXYtPnNtX3R5cGUgPT0gVk1XX1NNXzRfMSkKIAkJRFJNX0lO
Rk8oIlNNNF8xIHN1cHBvcnQgYXZhaWxhYmxlLlxuIik7CiAJaWYgKGRldl9wcml2LT5zbV90eXBl
ID09IFZNV19TTV80KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
ZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCAyNDM3MzE4
MTM4ODcuLjI2MmU1NzYyM2RmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAg
LTQ0NiwxMiArNDQ2LDE0IEBAIGVudW0gewogICogQFZNV19TTV9MRUdBQ1k6IFByZSBEWCBjb250
ZXh0LgogICogQFZNV19TTV80OiBDb250ZXh0IHN1cHBvcnQgdXB0byBTTTQuCiAgKiBAVk1XX1NN
XzRfMTogQ29udGV4dCBzdXBwb3J0IHVwdG8gU000XzEuCisgKiBAVk1XX1NNXzU6IENvbnRleHQg
c3VwcG9ydCB1cCB0byBTTTUuCiAgKiBAVk1XX1NNX01BWDogU2hvdWxkIGJlIHRoZSBsYXN0Lgog
ICovCiBlbnVtIHZtd19zbV90eXBlIHsKIAlWTVdfU01fTEVHQUNZID0gMCwKIAlWTVdfU01fNCwK
IAlWTVdfU01fNF8xLAorCVZNV19TTV81LAogCVZNV19TTV9NQVgKIH07CiAKQEAgLTY4NCw2ICs2
ODYsMTcgQEAgc3RhdGljIGlubGluZSBib29sIGhhc19zbTRfMV9jb250ZXh0KGNvbnN0IHN0cnVj
dCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpCiAJcmV0dXJuIChkZXZfcHJpdi0+c21fdHlwZSA+PSBW
TVdfU01fNF8xKTsKIH0KIAorLyoqCisgKiBoYXNfc201X2NvbnRleHQgLSBEb2VzIHRoZSBkZXZp
Y2Ugc3VwcG9ydCBTTTUgY29udGV4dC4KKyAqIEBkZXZfcHJpdjogRGV2aWNlIHByaXZhdGUuCisg
KgorICogUmV0dXJuOiBCb29sIHZhbHVlIGlmIGRldmljZSBzdXBwb3J0IFNNNSBjb250ZXh0IG9y
IG5vdC4KKyAqLworc3RhdGljIGlubGluZSBib29sIGhhc19zbTVfY29udGV4dChjb25zdCBzdHJ1
Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2KQoreworCXJldHVybiAoZGV2X3ByaXYtPnNtX3R5cGUg
Pj0gVk1XX1NNXzUpOworfQorCiBleHRlcm4gdm9pZCB2bXdfc3ZnYV9lbmFibGUoc3RydWN0IHZt
d19wcml2YXRlICpkZXZfcHJpdik7CiBleHRlcm4gdm9pZCB2bXdfc3ZnYV9kaXNhYmxlKHN0cnVj
dCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
