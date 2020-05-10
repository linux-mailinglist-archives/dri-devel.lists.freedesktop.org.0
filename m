Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B51CD265
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E136E22C;
	Mon, 11 May 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A696E6E193
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 15:14:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u16so16001541wmc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyysxUp4XjcgsqI2Lfus556dLlr5fhri7TKgWrqmiJE=;
 b=qb0OGWexu2cHDt229RIuaammyh4YBvZZQ5yFQ34zvb7DmJHEISASUaV3F10i9spuge
 PeFpaIbgR75Ge1v/Xy9jvA8k7EudCWJ0H/rXfjl0kz/+dQ6EnkVAnexAjI+igxqPnd3u
 /+SCj/KyEPZEu6x6WDR66FUZModaorWk3lOtnhfAfPA2jZoimFZqOOvvvKoEIP+EsgWo
 11z+YBCsklt4cIlPMqlyiOlaUR6RdpJzdw0HqRWGZNyW66x4XPVbBJlL9HWZn5uCY0PH
 QK3wc2kQyb7edTGCm+1hMAEHKJJPbKd7NFRZHEwtqmyDk8+CkuSVCaecAmSaLfIU55UZ
 /Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyysxUp4XjcgsqI2Lfus556dLlr5fhri7TKgWrqmiJE=;
 b=abYDeQ7JHtP2DMQ85bVZKXIYmOn5UiP/oMh3P9Nu+ApZF5stysdKRcCdObQYHkYpt/
 TE4iKvvT6EmaxOsukhDC+Zc4mGomspMg70DJauT0qL+cLvOtvLxMotC63KfVHGKpp+Oi
 LIPwCSZSWM/shCtCXHxfy00twuBzFv6XALHDlePI428oyXwZ8elp36bol4KodTuD/3Hc
 s+lz0w/ar4a2AunPPgTZogV1HuvVQdrAHOQTioMX34Sbk00nXY24X7LeSUqf5I14B2Gm
 icYFbdfz3dazKleUDGfAkdEsPddNTiIfAF1OyBUBeAYXXANO1mMoUJAfTszQmLPcLpdB
 u/DA==
X-Gm-Message-State: AGi0PuZW/AgPIdhV0an6fnba5Ycl8garnX+0ClL29dupvj7GZAvAsQFb
 dMQS3VWqNx+Tn2h4pkgaypM=
X-Google-Smtp-Source: APiQypLLdc4lGN0pRsmfHFAo/Jd2cV7QfHwh3umlf/UMcLSrbBtkd/KW0StN+PjHbPwn1DCEEK+KUw==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr2456741wme.80.1589123676201;
 Sun, 10 May 2020 08:14:36 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d133sm25176897wmc.27.2020.05.10.08.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 08:14:35 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/3] nand: brcmnand: rename v4 registers
Date: Sun, 10 May 2020 17:14:04 +0200
Message-Id: <20200510151406.2527856-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXggZTRlM2NlZWFjMzhmLi42YTA4ZGQwN2IwNTggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMzM4LDggKzMzOCw4
IEBAIGVudW0gYnJjbW5hbmRfcmVnIHsKIAlCUkNNTkFORF9GQ19CQVNFLAogfTsKIAotLyogQlJD
TU5BTkQgdjQuMCAqLwotc3RhdGljIGNvbnN0IHUxNiBicmNtbmFuZF9yZWdzX3Y0MFtdID0gewor
LyogQlJDTU5BTkQgdjMuMy12NC4wICovCitzdGF0aWMgY29uc3QgdTE2IGJyY21uYW5kX3JlZ3Nf
djMzW10gPSB7CiAJW0JSQ01OQU5EX0NNRF9TVEFSVF0JCT0gIDB4MDQsCiAJW0JSQ01OQU5EX0NN
RF9FWFRfQUREUkVTU10JPSAgMHgwOCwKIAlbQlJDTU5BTkRfQ01EX0FERFJFU1NdCQk9ICAweDBj
LApAQCAtNTkxLDggKzU5MSw4IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChz
dHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKIAkJY3RybC0+cmVnX29mZnNldHMgPSBi
cmNtbmFuZF9yZWdzX3Y2MDsKIAllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNTAw
KQogCQljdHJsLT5yZWdfb2Zmc2V0cyA9IGJyY21uYW5kX3JlZ3NfdjUwOwotCWVsc2UgaWYgKGN0
cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA0MDApCi0JCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5h
bmRfcmVnc192NDA7CisJZWxzZSBpZiAoY3RybC0+bmFuZF92ZXJzaW9uID49IDB4MDMwMykKKwkJ
Y3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFuZF9yZWdzX3YzMzsKIAogCS8qIENoaXAtc2VsZWN0
IHN0cmlkZSAqLwogCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNzAxKQotLSAKMi4yNi4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
