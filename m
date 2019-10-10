Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB7D1ECA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 05:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0C389F43;
	Thu, 10 Oct 2019 03:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30C489EB4;
 Thu, 10 Oct 2019 03:10:34 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id r5so6665551qtd.0;
 Wed, 09 Oct 2019 20:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8nEjbxWO9JS4rU149iy3FemArtCnR7HT1hRW+UvvpE=;
 b=BLAeNjC9dvXXk6O+sGXml+G9BiNf+v5wR+jg9gJW5MZgQ/heUkPlsgTgi85Zfshva2
 FF1NfTnaN8VFVe/C7KNvFUb8i/8WMleEKYMX4N7cqRdmGiRI6PXEDSqjCiIvkjKXJs42
 agEbzAnTZWrwzEx424jSGSVxafB5nPUuGo/ZU7tya98+7itMdxHfVpxJqNVTRyLwEqdV
 4DxxxanBd/OgnZdoObm6DgR8Fjk+roK2yTXss7pciiUfBoN+MgVMjsQ0aps4ASFSM/Qd
 O0+1ZdozH2VtnQAF5QSW1Y7LpHYH6Wpls6c8NZMTDavwNskyMYNNTdw7T0naFRA6flZ2
 xnNQ==
X-Gm-Message-State: APjAAAVGZnwX8Ks3OMAi8HeZple3SM8BLw2R6Xw2rkfmRSYyl3H6ZzOv
 lTU7KSXluT9IYnSpcpI4JWOipEk7
X-Google-Smtp-Source: APXvYqyznjDzaxnYeQOPMxykY5lHOKDv/yuIQHJImGYcjzHiDRLpnyg9JQjV87/7ZlM/eRqDwBBQyw==
X-Received: by 2002:ad4:4204:: with SMTP id k4mr7390300qvp.16.1570677033227;
 Wed, 09 Oct 2019 20:10:33 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id o124sm1781352qke.66.2019.10.09.20.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 20:10:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.4
Date: Wed,  9 Oct 2019 22:10:23 -0500
Message-Id: <20191010031023.23359-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8nEjbxWO9JS4rU149iy3FemArtCnR7HT1hRW+UvvpE=;
 b=jX/lIZUHc68N7kRojxgiKVAmaKdnpBmZTUGkeFRF+10VAEKZSBB3MzRmc5WO1HVnQi
 TPBOBqnMk/CLodcBr+J3wjWEv3ZOrk0GZHTLq1w6VFwqbrXO+E4Qo/1sxFI+O5LfTRji
 IWh0vriA52Hp/JK/PpsiEjl45PMkMZB94aUzjC6tAjGUF887NCEkMxzEBkKUMjOIZxYJ
 Sk1jOgfdHBDwFeKOV3bF9z6R8LxjYOplkFpdVqkVCLi7RRD03b++X1zBvTAU7GoHtphP
 5w/WV+EiUTqy58Mi+AsrpbgdC0SXvTg5QDxHV6ulbLSxGZ+1DEjKT3CmThq/ibHEIvxE
 MjSQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKSnVzdCBhIHNpbmdsZSBmaXggdGhpcyB3ZWVrIGZvciA1LjQuCgpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGRhMGM5ZWExNDZjYmU5MmI4MzJmMWIw
ZjY5NDg0MGVhOGViMzNjY2U6CgogIExpbnV4IDUuNC1yYzIgKDIwMTktMTAtMDYgMTQ6Mjc6MzAg
LTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8v
cGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggdGFncy9kcm0tZml4ZXMtNS40LTIw
MTktMTAtMDkKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwODMxNjRkYmRiMTdjNWVh
NGFkOTJjMTc4MmI1OWM5ZDc1NTY3NzkwOgoKICBkcm0vYW1kZ3B1OiBmaXggbWVtb3J5IGxlYWsg
KDIwMTktMTAtMDkgMTE6NDU6NTkgLTA1MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS1maXhlcy01LjQtMjAxOS0x
MC0wOToKCmFtZGdwdToKLSBmaXggbWVtb3J5IGxlYWsgaW4gYm9fbGlzdCBpb2N0bCBlcnJvciBw
YXRoCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCk5pcm1veSBEYXMgKDEpOgogICAgICBkcm0vYW1kZ3B1OiBmaXggbWVtb3J5
IGxlYWsKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jIHwgMTQg
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
