Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CBC10FE9
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 01:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDF6892CA;
	Wed,  1 May 2019 23:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70FE89338
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 23:04:44 +0000 (UTC)
Received: by mail-oi1-x24a.google.com with SMTP id m207so340767oig.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 16:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=chqbiB4K0p/zEKsVbXe4iW2Xpj6yAVIrWQhjpUaEvyA=;
 b=TL3hqaTdsWQ1KqRKG7tHx7HEvUituCVz9eU65xIA0n4XmWvQ9P0UePiKisiZPVZYiE
 T8XtsK3P80W+slL2/hILCX12zLnKWjz4Z42aHnCfOk8cPiZqp/P3pngm8JD+26xtzSqX
 Wej6/siPTQp5sC7U3MeSYwSJxt7N4A7u5P1RfqMpIFrSNY4ZKNJIBSzhMta8+BGOgzIk
 9Zis1kBBQ7yRx18ZHnpSqBK6ic3LSqr67OD8AdKBGOpjAQMPshmAQnvQA+mQ4r1zaY4h
 uFbqRyVZMKbRimXKGxndG3WDMUjrR7QZb8tuvE+F7B1HsK1+NKStYzW5Xb8/OgK3hHzN
 XHXw==
X-Gm-Message-State: APjAAAXzHMzCMsaM4mn+IGtussDkxkUo7XuUvjPpmMLReBfUtTG/cbEx
 9/f58V9KHNOzrHG4KErbvXnCdl4ZgyWT7o7HLoazUw==
X-Google-Smtp-Source: APXvYqziahGWgdBZbQfWG2ft5ebLp+ozkgppLiv8kSSis3P9fMvGcrL9eofrdvhLG15CPkadoMaZYjcvL9G8Pk6lBON+yg==
X-Received: by 2002:aca:cd88:: with SMTP id d130mr481038oig.63.1556751883876; 
 Wed, 01 May 2019 16:04:43 -0700 (PDT)
Date: Wed,  1 May 2019 16:01:22 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-14-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 13/17] kunit: defconfig: add defconfigs for building KUnit
 tests
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=chqbiB4K0p/zEKsVbXe4iW2Xpj6yAVIrWQhjpUaEvyA=;
 b=GE0P464mBtC8wrhfBO7g793E4I4dqW2RIP7+tHwU/PC57hjNo6fmzw5HElvCwVJ32i
 ZkuQrQPVcHSfFt6v723klhDSf/BCGNNvLIImZbUWeECzTjsM5G6js6Y4BB5vjlq16LAN
 nySbgJK0p0eYO+3PMfew/5txRXxjgd1tovWq5YKZjGYzlDxEQ+Q6GSZnOMuy+DFhqKMT
 uJ3lLNt16MIjzkoA11kKC2qDuhYsfvUVFDvaTEF8ASb3zPAzcT2kDwqalnmACvYsWp+Z
 7T2yCIRZwzp4TkmtK1c2L5CoSAeNHI4xKfYHm9/xZ7l5IMHM0zff93mqcrZ2D4EpNlPo
 NA2Q==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRlZmNvbmZpZyBmb3IgVU1MIGFuZCBhIGZyYWdtZW50IHRoYXQgY2FuIGJlIHVzZWQgdG8g
Y29uZmlndXJlIG90aGVyCmFyY2hpdGVjdHVyZXMgZm9yIGJ1aWxkaW5nIEtVbml0IHRlc3RzLiBB
ZGQgb3B0aW9uIHRvIGt1bml0X3Rvb2wgdG8gdXNlCmEgZGVmY29uZmlnIHRvIGNyZWF0ZSB0aGUg
a3VuaXRjb25maWcuCgpTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdn
aW5zQGdvb2dsZS5jb20+Ci0tLQogYXJjaC91bS9jb25maWdzL2t1bml0X2RlZmNvbmZpZyAgICAg
ICAgICAgICAgfCAgOCArKysrKysrKwogdG9vbHMvdGVzdGluZy9rdW5pdC9jb25maWdzL2FsbF90
ZXN0cy5jb25maWcgfCAgOCArKysrKysrKwogdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdC5weSAg
ICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKystLQogdG9vbHMvdGVzdGluZy9rdW5p
dC9rdW5pdF9rZXJuZWwucHkgICAgICAgICAgfCAgMyArKy0KIDQgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Vt
L2NvbmZpZ3Mva3VuaXRfZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGlu
Zy9rdW5pdC9jb25maWdzL2FsbF90ZXN0cy5jb25maWcKCmRpZmYgLS1naXQgYS9hcmNoL3VtL2Nv
bmZpZ3Mva3VuaXRfZGVmY29uZmlnIGIvYXJjaC91bS9jb25maWdzL2t1bml0X2RlZmNvbmZpZwpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwLi5iZmU0OTY4OTAzOGYxCi0t
LSAvZGV2L251bGwKKysrIGIvYXJjaC91bS9jb25maWdzL2t1bml0X2RlZmNvbmZpZwpAQCAtMCww
ICsxLDggQEAKK0NPTkZJR19PRj15CitDT05GSUdfT0ZfVU5JVFRFU1Q9eQorQ09ORklHX09GX09W
RVJMQVk9eQorQ09ORklHX0kyQz15CitDT05GSUdfSTJDX01VWD15CitDT05GSUdfS1VOSVQ9eQor
Q09ORklHX0tVTklUX1RFU1Q9eQorQ09ORklHX0tVTklUX0VYQU1QTEVfVEVTVD15CmRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL2t1bml0L2NvbmZpZ3MvYWxsX3Rlc3RzLmNvbmZpZyBiL3Rvb2xz
L3Rlc3Rpbmcva3VuaXQvY29uZmlncy9hbGxfdGVzdHMuY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAuLmJmZTQ5Njg5MDM4ZjEKLS0tIC9kZXYvbnVsbAorKysg
Yi90b29scy90ZXN0aW5nL2t1bml0L2NvbmZpZ3MvYWxsX3Rlc3RzLmNvbmZpZwpAQCAtMCwwICsx
LDggQEAKK0NPTkZJR19PRj15CitDT05GSUdfT0ZfVU5JVFRFU1Q9eQorQ09ORklHX09GX09WRVJM
QVk9eQorQ09ORklHX0kyQz15CitDT05GSUdfSTJDX01VWD15CitDT05GSUdfS1VOSVQ9eQorQ09O
RklHX0tVTklUX1RFU1Q9eQorQ09ORklHX0tVTklUX0VYQU1QTEVfVEVTVD15CmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL2t1bml0L2t1bml0LnB5IGIvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5p
dC5weQppbmRleCA3NDEzZWM3MzUxYTIwLi42M2U5ZmIzYjYwMjAwIDEwMDc1NQotLS0gYS90b29s
cy90ZXN0aW5nL2t1bml0L2t1bml0LnB5CisrKyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXQu
cHkKQEAgLTExLDYgKzExLDcgQEAgaW1wb3J0IGFyZ3BhcnNlCiBpbXBvcnQgc3lzCiBpbXBvcnQg
b3MKIGltcG9ydCB0aW1lCitpbXBvcnQgc2h1dGlsCiAKIGltcG9ydCBrdW5pdF9jb25maWcKIGlt
cG9ydCBrdW5pdF9rZXJuZWwKQEAgLTM2LDE0ICszNywyNiBAQCBwYXJzZXIuYWRkX2FyZ3VtZW50
KCctLWJ1aWxkX2RpcicsCiAJCSAgICAnZGlyZWN0b3J5LicsCiAJCSAgICB0eXBlPXN0ciwgZGVm
YXVsdD1Ob25lLCBtZXRhdmFyPSdidWlsZF9kaXInKQogCi1jbGlfYXJncyA9IHBhcnNlci5wYXJz
ZV9hcmdzKCkKK3BhcnNlci5hZGRfYXJndW1lbnQoJy0tZGVmY29uZmlnJywKKwkJICAgIGhlbHA9
J1VzZXMgYSBkZWZhdWx0IGt1bml0Y29uZmlnLicsCisJCSAgICBhY3Rpb249J3N0b3JlX3RydWUn
KQogCi1saW51eCA9IGt1bml0X2tlcm5lbC5MaW51eFNvdXJjZVRyZWUoKQorZGVmIGNyZWF0ZV9k
ZWZhdWx0X2t1bml0Y29uZmlnKCk6CisJaWYgbm90IG9zLnBhdGguZXhpc3RzKGt1bml0X2tlcm5l
bC5LVU5JVENPTkZJR19QQVRIKToKKwkJc2h1dGlsLmNvcHlmaWxlKCdhcmNoL3VtL2NvbmZpZ3Mv
a3VuaXRfZGVmY29uZmlnJywKKwkJCQlrdW5pdF9rZXJuZWwuS1VOSVRDT05GSUdfUEFUSCkKKwor
Y2xpX2FyZ3MgPSBwYXJzZXIucGFyc2VfYXJncygpCiAKIGJ1aWxkX2RpciA9IE5vbmUKIGlmIGNs
aV9hcmdzLmJ1aWxkX2RpcjoKIAlidWlsZF9kaXIgPSBjbGlfYXJncy5idWlsZF9kaXIKIAoraWYg
Y2xpX2FyZ3MuZGVmY29uZmlnOgorCWNyZWF0ZV9kZWZhdWx0X2t1bml0Y29uZmlnKCkKKworbGlu
dXggPSBrdW5pdF9rZXJuZWwuTGludXhTb3VyY2VUcmVlKCkKKwogY29uZmlnX3N0YXJ0ID0gdGlt
ZS50aW1lKCkKIHN1Y2Nlc3MgPSBsaW51eC5idWlsZF9yZWNvbmZpZyhidWlsZF9kaXIpCiBjb25m
aWdfZW5kID0gdGltZS50aW1lKCkKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3Vu
aXRfa2VybmVsLnB5IGIvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF9rZXJuZWwucHkKaW5kZXgg
MDdjMGFiZjJmNDdkZi4uYmYzODc2ODM1MzMxMyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9r
dW5pdC9rdW5pdF9rZXJuZWwucHkKKysrIGIvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF9rZXJu
ZWwucHkKQEAgLTE0LDYgKzE0LDcgQEAgaW1wb3J0IG9zCiBpbXBvcnQga3VuaXRfY29uZmlnCiAK
IEtDT05GSUdfUEFUSCA9ICcuY29uZmlnJworS1VOSVRDT05GSUdfUEFUSCA9ICdrdW5pdGNvbmZp
ZycKIAogY2xhc3MgQ29uZmlnRXJyb3IoRXhjZXB0aW9uKToKIAkiIiJSZXByZXNlbnRzIGFuIGVy
cm9yIHRyeWluZyB0byBjb25maWd1cmUgdGhlIExpbnV4IGtlcm5lbC4iIiIKQEAgLTgxLDcgKzgy
LDcgQEAgY2xhc3MgTGludXhTb3VyY2VUcmVlKG9iamVjdCk6CiAKIAlkZWYgX19pbml0X18oc2Vs
Zik6CiAJCXNlbGYuX2tjb25maWcgPSBrdW5pdF9jb25maWcuS2NvbmZpZygpCi0JCXNlbGYuX2tj
b25maWcucmVhZF9mcm9tX2ZpbGUoJ2t1bml0Y29uZmlnJykKKwkJc2VsZi5fa2NvbmZpZy5yZWFk
X2Zyb21fZmlsZShLVU5JVENPTkZJR19QQVRIKQogCQlzZWxmLl9vcHMgPSBMaW51eFNvdXJjZVRy
ZWVPcGVyYXRpb25zKCkKIAogCWRlZiBjbGVhbihzZWxmKToKLS0gCjIuMjEuMC41OTMuZzUxMWVj
MzQ1ZTE4LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
