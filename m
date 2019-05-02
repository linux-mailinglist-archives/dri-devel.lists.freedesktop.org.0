Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9EA1232F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 22:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481B5897F9;
	Thu,  2 May 2019 20:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE672897F9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:24:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g4so4202813qtq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 13:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/6qNotoliIpbPHnDpGzPxcs8ZNPZhDNNCLjPstNPrT8=;
 b=MAOsQpDc9mRf0H0bpFa+jKBiJ2RhKejz/NzzBew7phtuLzcRZno5Lv3RKN3IsJb0Rc
 2YYczhLRQY0OsqZ952Uo+3ilnBFca1qizifu8KhBZ4wSBo46h6mIktPOqJ8bmZaf3SnP
 wOHZQETg/33uBH5UXQQG0jiSTqXpN9X2MJK3LNhTmJUlNBFZbxiCU7hCD12VjG4RfqlD
 kgqqC7t1mdMztHdINYxn5fvjlUsAHF/vQr+PX1mwiTqQhr5f/gMLxgN0utkvBGwDWjot
 lI28ass8RAEZJJA+AzFBS1fkT4GUO69tbz43n23odJqgqZ8Y2PcIwcvNP1fy2raYIeA7
 2jIQ==
X-Gm-Message-State: APjAAAVbPpMsBxj6tPHaM6z81263Ih4xlS5zCAY5+lAMrm4m7ymbarw9
 3Hl/yJcz1l13EP89fG0iCF0lmA1vswQ=
X-Google-Smtp-Source: APXvYqwSU1Jdrkyw3M+MyjI6lPDb3x/ZKyog0Rh3SrhdsdOj+e3kblRkHPJvXnL3UfDPqGFLVUtz0w==
X-Received: by 2002:ac8:35ec:: with SMTP id l41mr5257887qtb.109.1556828691717; 
 Thu, 02 May 2019 13:24:51 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j25sm114467qtc.24.2019.05.02.13.24.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 13:24:51 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/doc: Remove atomic_state_helper.h from
 drm-kms-helpers.rst
Date: Thu,  2 May 2019 16:24:29 -0400
Message-Id: <20190502202449.237184-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/6qNotoliIpbPHnDpGzPxcs8ZNPZhDNNCLjPstNPrT8=;
 b=fuLFXSmMYasKCbAvERQIDPmeji6jmUCut5rU3+vXaNqJapiPf+Pd76zCuQ9iRqkGrg
 jtTJT2SKM3FzXrxp628Mk9GRNOuyz9a89X4RECJyGW7SkSE9PpfvH43NM/DBPW07d99W
 9fLXZGcFt4JzXs5/+Yq/zhpAHIigS0l8030J3q9hvc9SfiyCyJVhDxiEkrplr6OQnUbR
 LGMfuwMwHbhO4kjqwaX6f5GQx3SE0ma4wXa6l9EAe1C6oA4fhAzEw7/GvyTrO3+o4quS
 3uOi8vAb5+oBrQBV1TGoYfsFSAUBPQPmxuvfUB1WKEhxyUomR4f2/zDgdfqspPFM2l8W
 JMpw==
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGVyZSBhcmUgbm8gc3Ry
dWN0dXJlZCBjb21tZW50cyBpbiB0aGUgZmlsZSwgc28gaXQgZ2VuZXJhdGVzIHRoaXMKd2Fybmlu
ZyBvbiBjb21waWxhdGlvbjoKCmluY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmg6
MTogd2FybmluZzogbm8gc3RydWN0dXJlZCBjb21tZW50cyBmb3VuZAoKRml4ZXM6IDllZjhhOWRj
NGIyMSAoImRybTogRXh0cmFjdCBkcm1fYXRvbWljX3N0YXRlX2hlbHBlci5baGNdIikKQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1v
ZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIERvY3VtZW50YXRp
b24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJz
LnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QKaW5kZXggMTQxMDJh
ZTAzNWRjLi5lNzgwNGE5ZWVmOWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1r
bXMtaGVscGVycy5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJzLnJz
dApAQCAtNzcsOSArNzcsNiBAQCBBdG9taWMgU3RhdGUgUmVzZXQgYW5kIEluaXRpYWxpemF0aW9u
CiBBdG9taWMgU3RhdGUgSGVscGVyIFJlZmVyZW5jZQogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIAotLi4ga2VybmVsLWRvYzo6IGluY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVs
cGVyLmgKLSAgIDppbnRlcm5hbDoKLQogLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljX3N0YXRlX2hlbHBlci5jCiAgICA6ZXhwb3J0OgogCi0tIApTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
