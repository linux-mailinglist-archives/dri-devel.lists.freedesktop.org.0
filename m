Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832C1DF64F
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5813E6E1B6;
	Sat, 23 May 2020 09:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003B06E3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 07:25:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z4so7728878wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 00:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZLZqiPmSDvovjhwGm4w627YXSjaGWbzcz2M2rVZdomQ=;
 b=oATR3FF6mh22GdA5Shgwzt7kSFsqqxk32t2cCBJuGQZUet9G3vkl+fJD6Eg5tKiK70
 lLKjarlUi1zCwgNx+s04jZ8UJkc1xGzejYUMsUbh/edZONvt9eSiqFrz7YBmeAItHsvE
 yo0pnKdrth0FO0mK/b/bgT7jAQG8J79ezXVlZHZO6JVu1aMv4HLixbeTKUuHeKpg6D5v
 YUoWbhjRLUin+sGsfwIfmmASbyr0xTSFJVOwPLiuhwJm4x8EPOiFf/UV44jvlaG5SagS
 8Ac+YtQLVgC5Hi5uM24l6/v57CoflPE/RSiNBaJyMS5MxyA7A5LsMzUHRFqdpI4a0OYl
 wBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZLZqiPmSDvovjhwGm4w627YXSjaGWbzcz2M2rVZdomQ=;
 b=rP6uMmWJGYS6sN2nKLX9ECMez3thsrB/hffL+Nz7Fke2vz/YU0fmg48EpHcQzJ1BhM
 H/bLJiPV1o32Pcg4xfymzCSjrB80J9gLe5sNC7geVQ0cO9DRnyRRgKMOQCs8odeGMMnc
 Ut22AyCLpTYIBI5E49lzfci9fs52hBY6NmmDxWUNv0cerX+Di4MTlGUKy2C2rkUma1HX
 tzQhU6FsqrnbiDdfpk2h5oDex4dkuoGuFVhY/YbJlVpHIrnuXOkpIJlbwydL4nkazD2Y
 DrqQI8WCRQMGskfd8KIK4t3RrRszD1tAFZkOL6VuQ0OiP/GGU3P38bibIyu6XkMZJU2w
 ESfg==
X-Gm-Message-State: AOAM533XzqQSKj8O7e+xlOSwiyxsKk3s2JOrHjWEjeJlSNpuZYVjddJM
 YbopfVtDBu9s6mmkrWQ/ArY=
X-Google-Smtp-Source: ABdhPJwu42LmV04Uv0SXsBsA+CPRsY5XoQxYdUKzxlKZnRrbArAX7FQTVSP60lbhmk3O4xW9mgutLQ==
X-Received: by 2002:a1c:6784:: with SMTP id b126mr6601248wmc.80.1590132328483; 
 Fri, 22 May 2020 00:25:28 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:28 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 0/5] mtd: rawnand: brcmnand: support v2.1-v2.2 controllers
Date: Fri, 22 May 2020 09:25:20 +0200
Message-Id: <20200522072525.3919332-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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

QWRkIHN1cHBvcnQgZm9yIHYyLjEgYW5kIHYyLjIgTkFORCBjb250cm9sbGVycy4KCnYzOiBmaXgg
djIuMSBwYWdlIHNpemUgc2hpZnQKdjI6IGludHJvZHVjZSBjaGFuZ2VzIHN1Z2dlc3RlZCBieSBN
aXF1w6hsLgoKw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzICg1KToKICBtdGQ6IHJhd25hbmQ6IGJy
Y21uYW5kOiByZW5hbWUgdjQgcmVnaXN0ZXJzCiAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogZml4
IENTMCBsYXlvdXQKICBtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiByZW5hbWUgcGFnZSBzaXplcwog
IGR0OiBiaW5kaW5nczogYnJjbW5hbmQ6IGFkZCB2Mi4xIGFuZCB2Mi4yIHN1cHBvcnQKICBuYW5k
OiBicmNtbmFuZDogc3VwcG9ydCB2Mi4xLXYyLjIgY29udHJvbGxlcnMKCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQgfCAgIDIgKwogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyAgICAgIHwgMTAwICsrKysrKysrKysrKysrKy0tLQog
MiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0tIAoy
LjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
