Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F05F3A1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139146E2CD;
	Thu,  4 Jul 2019 07:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3D16E25D;
 Thu,  4 Jul 2019 05:52:46 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so4211092edr.11;
 Wed, 03 Jul 2019 22:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Zhm68nrjPNXV8ta4ASMn+FRqbc2t3yxMdtkIvDKOc4=;
 b=coYR0qXobkcbsio30za/BqzFLskiAvxNuZ4CDZw35/BKiABK0fJi0loKKrwQT6gx36
 nPT75KqonNhpIIUoSf1i8HKr6f7SlG8A9nP5ax1YAy3PAwU3Y0RMKGsUldy8aOhasWs4
 jinbGAQblhMZCRHUbLzZn1Jn3Rv/ttid2nSdEJzBJTBYllb4ho5ZHc0dltj8MggGwswP
 e1LqOOhols90J2TcoIAoBCTjkX9CRIhWQOKy/g7JG8MohP84BssMaueX3q4riuIT2FIA
 LyTENlm2KpUCoIlvjZ8iQi4YCjGlQ/ol3IVVyoM8ySZ6cgRTalm6FNOFvjWUKAe7i3v8
 rVgw==
X-Gm-Message-State: APjAAAXRZ1h0oEzWJC0KW0LjM1RJ/UPDvqGzuyEzHfMq08IFNVfZH68b
 R36CUal59lRJ65YucoKLbEk=
X-Google-Smtp-Source: APXvYqxQFUEDOhnvVoNZ0Db9O7mkDNsW7TSFMGzjisOwln697QwuYMDcDmma0VLRiSkvPfE9Lc/vGQ==
X-Received: by 2002:a17:906:74e:: with SMTP id
 z14mr36613416ejb.310.1562219565387; 
 Wed, 03 Jul 2019 22:52:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:44 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 1/7] drm/amdgpu/mes10.1: Fix header guard
Date: Wed,  3 Jul 2019 22:52:12 -0700
Message-Id: <20190704055217.45860-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Zhm68nrjPNXV8ta4ASMn+FRqbc2t3yxMdtkIvDKOc4=;
 b=XP0ka/sEA27+gCnCWLm1dzKrtk8lbVrGn2ZqYcTDK970tQdXsahKOmYbZZu4yHj/Ke
 boIp5FcbSeZb2/4yhYbjzrLoMPv0ZsNYmI3KY16LXqN28g6binjQioaU9NfEDcLcIUYp
 h+DV2KXYyLEQBT+E22CCvvC+vrkVyvsB+5cS3YEME2cH3cw+WcaKQk57KAzt2ulrQKhG
 gg0z3fN6SlI1akvG5k4ad/2Mc4S5cqRrlU6k5iAhXswD4+4uCcwHhFDyJDX4+XGXGQoD
 lfFCzhvYQNoSjuIp6l6ZfPl4zHGXgM+OXKtn5mmi51TiCbcpDeS7ax7+/G0iDHH9bFY6
 78jQ==
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

Y2xhbmcgd2FybnM6CgogSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L252LmM6NTM6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRncHUvbWVz
X3YxMF8xLmg6MjQ6OTogd2FybmluZzoKICdfX01FU19WMTBfMV9IX18nIGlzIHVzZWQgYXMgYSBo
ZWFkZXIgZ3VhcmQgaGVyZSwgZm9sbG93ZWQgYnkgI2RlZmluZSBvZgogYSBkaWZmZXJlbnQgbWFj
cm8gWy1XaGVhZGVyLWd1YXJkXQogI2lmbmRlZiBfX01FU19WMTBfMV9IX18KICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRncHUvbWVzX3Yx
MF8xLmg6MjU6OTogbm90ZToKICdfX01FU192MTBfMV9IX18nIGlzIGRlZmluZWQgaGVyZTsgZGlk
IHlvdSBtZWFuICdfX01FU19WMTBfMV9IX18nPwogI2RlZmluZSBfX01FU192MTBfMV9IX18KICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+CiAgICAgICAgIF9fTUVTX1YxMF8xX0hfXwogMSB3YXJuaW5n
IGdlbmVyYXRlZC4KCkNhcGl0YWxpemUgdGhlIFYuCgpGaXhlczogODg2ZjgyYWE3YTFkICgiZHJt
L2FtZGdwdS9tZXMxMC4xOiBhZGQgaXAgYmxvY2sgbWVzMTAuMSAodjIpIikKTGluazogaHR0cHM6
Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNTgyClNpZ25lZC1vZmYt
Ynk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmggfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21lc192MTBfMS5oCmluZGV4IDE3YjliNTNmYTg5Mi4uOWFmZDZkZGIwMWU5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuaApAQCAtMjIsNyArMjIsNyBAQAogICovCiAKICNp
Zm5kZWYgX19NRVNfVjEwXzFfSF9fCi0jZGVmaW5lIF9fTUVTX3YxMF8xX0hfXworI2RlZmluZSBf
X01FU19WMTBfMV9IX18KIAogZXh0ZXJuIGNvbnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVy
c2lvbiBtZXNfdjEwXzFfaXBfYmxvY2s7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
