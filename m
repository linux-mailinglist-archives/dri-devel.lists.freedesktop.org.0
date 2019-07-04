Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203455F39B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354856E293;
	Thu,  4 Jul 2019 07:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CD16E25D;
 Thu,  4 Jul 2019 05:52:58 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so4245220eds.4;
 Wed, 03 Jul 2019 22:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8j4/lfObWKsySJXHjiTJhYwv3YoOUa3RyuF9b2OiCM=;
 b=PFktc+J09sy8PMv4Q0Hh3Z8KndGly92m8j47D72Q9jlZOK3lAbjjP96iF8+z60vUOY
 gTOeFhHNyJw8SNkbueCgk0IN/Kp8Jvly+LJViTxiPzewV7hLOwNDk9tRTDJx4VXBziFJ
 aMwFTZjwJN0OwJCh/WsuOUaPeuucfI7sI7ikwJ2COZht7PmbL7dxOMpQXbVzxd+w3uVa
 CfcEHbkouuX5wH9HS2FvFi012l2pLU14/fsCKVPWIuyaRY6RL8LMJVe78vsxJTdrT5GV
 DbXhn4z3GSDgdqa5EK5d9Wir1/dZvcOPxQWH/acCTcsnCUz4w1fEqdSmfXy5CEW6CviQ
 7iXQ==
X-Gm-Message-State: APjAAAUtVgu9W5rZTJYaXWBDI5wEgR2bCyi9ixtu09+kU8zrcvzjBruh
 h4uf9jNj0cE5XXHYPpIOpEY=
X-Google-Smtp-Source: APXvYqyEV4E8nukKV6omo3iH8YCRstVAvf1CQz8Y0UriutmKpBEO8S4OT87MNMKrRaN3/rlsXae2Kw==
X-Received: by 2002:aa7:d68e:: with SMTP id d14mr46710516edr.253.1562219576755; 
 Wed, 03 Jul 2019 22:52:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:56 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 6/7] drm/amd/powerplay: Use proper enums in
 vega20_print_clk_levels
Date: Wed,  3 Jul 2019 22:52:17 -0700
Message-Id: <20190704055217.45860-7-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8j4/lfObWKsySJXHjiTJhYwv3YoOUa3RyuF9b2OiCM=;
 b=knXHCJL6QcZzMVgVNUiZIanYTejfXIDYg2v2DTquN8FlJf1PUoIPvsEtxcfPAoYlHC
 UEoUo//wjy3wqe8hDRPSZlJm6o1NaokVDYHJZqYjtg/2Ll4hDOsP50MQs1ObKlZlKGdK
 vlKr9Og8jwfSHADn/MqQXE17Mt2OCsbSNbCM0qFPR8cmCbdgSVqfGkXq81DMswrni7wT
 CmzUNIMVIm0tuj8dkJJddCMCVOSE8ziuHNXVRz7m0TdgV1bqSextCYzGeA+MMtXNZziH
 m37DPf7guudTsok5GLEYP0pgKsKJYisHc7u9FSdNVi8gu48ggzD9wWuDqyvQ5Xr4vPaU
 NTLQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2xhbmcgd2FybnM6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVn
YTIwX3BwdC5jOjk5NTozOTogd2FybmluZzoKaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1l
cmF0aW9uIHR5cGUgJ1BQQ0xLX2UnIHRvIGRpZmZlcmVudAplbnVtZXJhdGlvbiB0eXBlICdlbnVt
IHNtdV9jbGtfdHlwZScgWy1XZW51bS1jb252ZXJzaW9uXQogICAgICAgICAgICAgICAgcmV0ID0g
c211X2dldF9jdXJyZW50X2Nsa19mcmVxKHNtdSwgUFBDTEtfU09DQ0xLLCAmbm93KTsKICAgICAg
ICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+
fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2EyMF9w
cHQuYzoxMDE2OjM5OiB3YXJuaW5nOgppbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRp
b24gdHlwZSAnUFBDTEtfZScgdG8gZGlmZmVyZW50CmVudW1lcmF0aW9uIHR5cGUgJ2VudW0gc211
X2Nsa190eXBlJyBbLVdlbnVtLWNvbnZlcnNpb25dCiAgICAgICAgICAgICAgICByZXQgPSBzbXVf
Z2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBQUENMS19GQ0xLLCAmbm93KTsKICAgICAgICAgICAg
ICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+
CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0LmM6MTAz
MTozOTogd2FybmluZzoKaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5cGUg
J1BQQ0xLX2UnIHRvIGRpZmZlcmVudAplbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtfdHlw
ZScgWy1XZW51bS1jb252ZXJzaW9uXQogICAgICAgICAgICAgICAgcmV0ID0gc211X2dldF9jdXJy
ZW50X2Nsa19mcmVxKHNtdSwgUFBDTEtfRENFRkNMSywgJm5vdyk7CiAgICAgICAgICAgICAgICAg
ICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fgoK
VGhlIHZhbHVlcyBhcmUgbWFwcGVkIG9uZSB0byBvbmUgaW4gdmVnYTIwX2dldF9zbXVfY2xrX2lu
ZGV4IHNvIGp1c3QgdXNlCnRoZSBwcm9wZXIgZW51bXMgaGVyZS4KCkZpeGVzOiAwOTY3NjEwMTQy
MjcgKCJkcm0vYW1kL3Bvd2VycGxheTogc3VwcG9ydCBzeXNmcyB0byBnZXQgc29jY2xrLCBmY2xr
LCBkY2VmY2xrIikKTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51
eC9pc3N1ZXMvNTg3ClNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNl
bGxvckBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIw
X3BwdC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVn
YTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCmlu
ZGV4IDBmMTRmZTE0ZWNkOC4uZTYyZGQ2OTE5YjI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC05OTIsNyArOTkyLDcgQEAgc3RhdGljIGludCB2ZWdh
MjBfcHJpbnRfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJYnJlYWs7CiAK
IAljYXNlIFNNVV9TT0NDTEs6Ci0JCXJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUs
IFBQQ0xLX1NPQ0NMSywgJm5vdyk7CisJCXJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShz
bXUsIFNNVV9TT0NDTEssICZub3cpOwogCQlpZiAocmV0KSB7CiAJCQlwcl9lcnIoIkF0dGVtcHQg
dG8gZ2V0IGN1cnJlbnQgc29jY2xrIEZhaWxlZCEiKTsKIAkJCXJldHVybiByZXQ7CkBAIC0xMDEz
LDcgKzEwMTMsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LAogCQlicmVhazsKIAogCWNhc2UgU01VX0ZDTEs6Ci0JCXJldCA9IHNt
dV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xLX0ZDTEssICZub3cpOworCQlyZXQgPSBz
bXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBTTVVfRkNMSywgJm5vdyk7CiAJCWlmIChyZXQp
IHsKIAkJCXByX2VycigiQXR0ZW1wdCB0byBnZXQgY3VycmVudCBmY2xrIEZhaWxlZCEiKTsKIAkJ
CXJldHVybiByZXQ7CkBAIC0xMDI4LDcgKzEwMjgsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9wcmlu
dF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQlicmVhazsKIAogCWNhc2Ug
U01VX0RDRUZDTEs6Ci0JCXJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xL
X0RDRUZDTEssICZub3cpOworCQlyZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBT
TVVfRENFRkNMSywgJm5vdyk7CiAJCWlmIChyZXQpIHsKIAkJCXByX2VycigiQXR0ZW1wdCB0byBn
ZXQgY3VycmVudCBkY2VmY2xrIEZhaWxlZCEiKTsKIAkJCXJldHVybiByZXQ7Ci0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
