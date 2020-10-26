Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AF299417
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 18:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2410B6EA51;
	Mon, 26 Oct 2020 17:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353826EA4D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 17:41:26 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id h24so14840102ejg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vEA+HFm51flyUiQiTCFwYNYS+8z7T4/rq+WWurYVCKQ=;
 b=D8LusUe6ryChoRv/ZBCsYAjOiHupq+PaAYmEM4YyjPinnrW+nZMSoR/GbLGObovC5u
 fyHQHjySlp+s4g6YLA4eLmNLU8dmm/iWn2sTG9pjgwOuC7KXYqAYAE6j+b6/iig+h/z6
 5qBra6uOsv7H3DgSpm8ktf6lxVfCpywv+JlGFjSlznPDCYDomHQHzdlKp2PyjIa+OgGY
 Cp1NS9dbxKOToaF3dDM/5xoscSPwPTos4CMKBU5nZqcGv6EQznLbG3A+cDEwRrQOWPTQ
 4vAcA3Efn48Qj4cwJxH8nc8zgc/PJlCozEydVpCSnmU0XzI2/uXvCfJ7UiS4SyDYxG1M
 urqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEA+HFm51flyUiQiTCFwYNYS+8z7T4/rq+WWurYVCKQ=;
 b=V318/AjtUVK5lNEs7oNwwqHXqV6gceJy/CMEdpNF83N6u2Y750yy9GbQmZqpub4Ird
 y6aEHWAy/CSSsd+MVEHuIllmkaUMGuJDpmpWJxxBFhHcRJ/lmHLDsljvF3TU4iG+sruM
 K9kfLVeu8Kb0Im+l6IkeJOeScwv4UUNelpQIIBRsS/MMua4YnvUIPlzmo4OVm9SpW523
 4vEHW6/o3R7P4dNd60EV+ulHBBrpON+kwgacgIJ633X/p2MglTjLwMFzj97FzC/+93WS
 dZtLn/MmNJuyQSmETU9hmmRU2ZEx15iKl9PzVZOXEXq4ugsJoUEeQQlK92SP+aoYCM81
 lz9A==
X-Gm-Message-State: AOAM530A3s3Fn9nBTVOBtIITST398cSES1CjkKhb6nCF/Ixw0OuX8Z/u
 F+UZahsa0xvoxju7Kuu+S5ecXlqW6PI=
X-Google-Smtp-Source: ABdhPJxO5zJoatjKx5BH4PNFw85MteBiaIOwJVv8DYsK2P/bFvWtiQItn8jmBzuFZbnS6JAMrjxduA==
X-Received: by 2002:a17:906:c095:: with SMTP id
 f21mr17550035ejz.108.1603734084734; 
 Mon, 26 Oct 2020 10:41:24 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:203b:21f:8891:7b14])
 by smtp.gmail.com with ESMTPSA id i14sm6227325ejy.110.2020.10.26.10.41.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:41:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/vram_helpers: drop ttm_page_alloc.h include
Date: Mon, 26 Oct 2020 18:41:16 +0100
Message-Id: <20201026174117.2553-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026174117.2553-1-christian.koenig@amd.com>
References: <20201026174117.2553-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCBhcyBmYXIgYXMgSSBjYW4gc2VlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggNjgzNzYyYjJmOWE4Li4x
NmQ2OGMwNGVhNWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwpAQCAtMTUs
NyArMTUsNiBAQAogI2luY2x1ZGUgPGRybS9kcm1fcGxhbmUuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X3ByaW1lLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgotI2luY2x1
ZGUgPGRybS90dG0vdHRtX3BhZ2VfYWxsb2MuaD4KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Z2VtX29iamVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzOwogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
