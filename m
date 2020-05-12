Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB821D0B8D
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A196E9A6;
	Wed, 13 May 2020 09:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254AB6E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:33:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v12so13991739wrp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2h4884sQ1T4p7Y1kwQszHkwyBYLx3tAh+LvfZpaf3HA=;
 b=hj/t/bZrtKe6lucKS7eLxk781GNPG4OAwZMgiwqSb4m+80VHsBvJ2uhamejAGXeZ7r
 q5IHXTdDoR6EbasRYLMtwfmGdCZ+JkpqaIGoqizE4+YyjlCbNAFY6zKIFSzVsUWnESIk
 yo6FGZgqQb6kTxXPKhZ/n1whbyQhEZGjSVb6+v9iFqhmo/rC7mU/Lt37DWJOGFCNKa2x
 +zEmCbnrjQLfkLv3XzC2sOy7Tt+9YUMTOPXi7UyvRNGpnosSkp66Gg9cVEpMJ0QE7Pio
 OJ1xjLMLWq9cWmVfXLOzZwz8Ngn/Fh6n6Uj15s1m8J7DLsnEkzrlwx0AVM6Fp7nOPazs
 +YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2h4884sQ1T4p7Y1kwQszHkwyBYLx3tAh+LvfZpaf3HA=;
 b=Y6qJvje1ZayGAmMBlBeAGQ65Ma5ypOimHbOyiUg2IbJBfyUUCkEZD6HOa88gSkcHvY
 p2pxmSL+75ADsVsQTJiMh4s5bExFDx+l542mX82aMc9sacnKfhmJ9SCH+VuNcsmkUG56
 FX6eYRy0b3Bc/0X6OUeUKuRwxobel+D4SS2uvx2aKvxJ6veZr3fXG4ZySSITI03YFWgK
 greMfMT3k8ezgrnic5usOjePqdDSlyoxm2t2XpP1BzaXeUIpJ0sBsAikKDO1SjbzgtVt
 zW/xyHqAinNkJpkrIviCS83LoHqwetCD7f4nXISbz78JM2k8Q44PWo3e3xBgQj4N6O88
 GVkw==
X-Gm-Message-State: AGi0PublmaB+5Iz6q5NKfEvTFn64E3vh7ESHvT2DmKkT37+WD1TnWLWf
 H+ck46A13KcOgXPfcMcaZC4=
X-Google-Smtp-Source: APiQypJg8hk4LeUiyc13Z6+SkueRhsAG3TusMR8RvPF7r54iGrokpgamTGkrM3NiCt+K/Id90NJKtA==
X-Received: by 2002:adf:b786:: with SMTP id s6mr22880078wre.287.1589268812747; 
 Tue, 12 May 2020 00:33:32 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:32 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 0/5] mtd: rawnand: brcmnand: support v2.1-v2.2 controllers
Date: Tue, 12 May 2020 09:33:24 +0200
Message-Id: <20200512073329.742893-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510151406.2527856-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHYyLjEgYW5kIHYyLjIgTkFORCBjb250cm9sbGVycy4KCnYyOiBpbnRy
b2R1Y2UgY2hhbmdlcyBzdWdnZXN0ZWQgYnkgTWlxdcOobC4KCsOBbHZhcm8gRmVybsOhbmRleiBS
b2phcyAoNSk6CiAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogcmVuYW1lIHY0IHJlZ2lzdGVycwog
IG10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IGZpeCBDUzAgbGF5b3V0CiAgbXRkOiByYXduYW5kOiBi
cmNtbmFuZDogcmVuYW1lIHBhZ2Ugc2l6ZXMKICBkdDogYmluZGluZ3M6IGJyY21uYW5kOiBhZGQg
djIuMSBhbmQgdjIuMiBzdXBwb3J0CiAgbmFuZDogYnJjbW5hbmQ6IHN1cHBvcnQgdjIuMS12Mi4y
IGNvbnRyb2xsZXJzCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQu
dHh0IHwgIDIgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyAgICAg
IHwgODkgKysrKysrKysrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25z
KCspLCAxNSBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
