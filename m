Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D38474FE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D381D89255;
	Sun, 16 Jun 2019 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEB4890BD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:31:54 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id r7so2095248pfl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AtSiqk5nC9LJRg1jpcdANXdpq0IBjpFzpPAT20QKwLs=;
 b=hFr12WsPWZMwdo4enppKqG5bW4vkacMMywTRc75HmQv6DkICnpwOsG0RAy7fsxWhy0
 MoBGRI9TKqH6/DL5XZ6sp3yPWlcy7HMs2Oj5M2k4ddv4s2+OpymYOuQXIgScAcdwXcdx
 0upwudL2+rchai+5276/504G7mzO6y3HETYm96XiyBRBBu/VYHciy3H5STbXMetJKOhQ
 oqThRSyLPh6n934G3fX3kMsD7bp5Dvg8q/BJ9GnjESWYKOYzCsR8QSuhHClUMv+i7Hhb
 SjmQsNX6Ngl73OuPmcbevG6+0tYQI51OmlnArj7jQ3B3lwz9F4R9TRItoyABxyhTjnZH
 cJMA==
X-Gm-Message-State: APjAAAUjNPvXTqTZTQjcuHJqQrb3hCdPcF8UqQL3m0uMg17Dc2N6Uquo
 m007XfC/2msdWbrfi7PxKxM=
X-Google-Smtp-Source: APXvYqzGVKsRY/HKe8P6drib97plaMeKe2fpFoiPvoa234LjxzhsrXYVgV3vx4vgJagc9QCCwyR/rA==
X-Received: by 2002:a17:90a:b00b:: with SMTP id
 x11mr13055151pjq.120.1560544314155; 
 Fri, 14 Jun 2019 13:31:54 -0700 (PDT)
Received: from localhost.localdomain ([162.251.69.147])
 by smtp.gmail.com with ESMTPSA id 188sm5189016pfe.30.2019.06.14.13.31.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:31:53 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org
Subject: [PATCH 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date: Fri, 14 Jun 2019 13:31:44 -0700
Message-Id: <20190614203144.3850-2-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614203144.3850-1-joseph.kogut@gmail.com>
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AtSiqk5nC9LJRg1jpcdANXdpq0IBjpFzpPAT20QKwLs=;
 b=D9Zi0GLfXAxnK/1KAzAoqvnxrpDfxQcd8uc+ubVdKQ8OWuZFEibKd2qRjzla+7IFNS
 Q0jYmMOKetE6GkCPQSOh1Px3ZltrpfqKqD4nw/byc6+q4sDy9zWbPkXB0jfy0q1IshZt
 Dbvv2CUtzxO24ht5eBCHUlSqX9cW/hndKnXLLRKl9o1rfIhaYqDAKrmASX1w2High6cv
 hLJzPEwnHLsK2w2GSL7UIwCthVhtCjb6QXAjl2/SUr9wfuPN9ga76ohI6viKZpEdzCL0
 L7J5XP/W+JurJSnwUPDddLZE7080G/vEk45SeYWimus+OdZg/7hvF2Ukr//3/uHwM3WZ
 zerA==
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIG5vZGUgZm9yIG1hbGkgZ3B1IG9uIE9kcm9pZCBYVTMgU29Dcy4KClNp
Z25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KLS0tCiAu
Li4vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kgIHwgMTggKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpIGIv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kKaW5kZXgg
OTNhNDhmMmRkYTQ5Li4xZjJhZTE5ZDAxYWYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCkBAIC00OCw2ICs0OCwyNCBAQAogCQlj
b29saW5nLWxldmVscyA9IDwwIDEzMCAxNzAgMjMwPjsKIAl9OwogCisJZ3B1OiBncHVAMTE4MDAw
MDAgeworCQljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zLW1hbGkiLCAiYXJtLG1hbGktdDYy
OCI7CisJCXJlZyA9IDwweDExODAwMDAwIDB4NTAwMD47CisJCWludGVycnVwdHMgPSA8MCAxMTcg
MD4sCisJCQkgICAgIDwwIDIxOSAwPiwKKwkJCSAgICAgPDAgNzQgIDA+OworCQlpbnRlcnJ1cHQt
bmFtZXMgPSAiZ3B1IiwgImpvYiIsICJtbXUiOworCQljbG9ja3MgPSA8JmNsb2NrIENMS19HM0Q+
LAorCQkJIDwmY2xvY2sgQ0xLX0RPVVRfQUNMS19HM0Q+LAorCQkJIDwmY2xvY2sgQ0xLX0ZPVVRf
VlBMTD47CisJCW1hbGktc3VwcGx5ID0gPCZidWNrNF9yZWc+OworCQlvcGVyYXRpbmctcG9pbnRz
ID0gPAorCQkJLyogS0h6ICB1ViAgICovCisJCQk2MDAwMDAgIDExNTAwMDAKKwkJCTE3NzAwMCAg
ODEyNTAwCisJCT47CisJfTsKKwogCXRoZXJtYWwtem9uZXMgewogCQljcHUwX3RoZXJtYWw6IGNw
dTAtdGhlcm1hbCB7CiAJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRtdV9jcHUwIDA+OwotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
