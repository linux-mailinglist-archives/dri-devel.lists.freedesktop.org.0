Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED980A1D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 11:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D65689FA9;
	Sun,  4 Aug 2019 09:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFEF89FA9
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 09:41:54 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m23so76605409lje.12
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 02:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dafJ51pWjlSMMKmje8uyWBSzlpRZ3vlrMRQDfaXXm+I=;
 b=FA4WRrKZoonLbZbY0xZr/OgnARN7yNk5LnZzEDXkpkAqCSoaOWWdZyzHDlYtl341xY
 MTFsoCZOg6XgNaabv38L3+fUsgguPzebXJ09UKYkhGyoH+VCVkomqVKbJKQG6vTSqlqV
 WRdopBCf5cPLZfa1Z9HmbRUHObvZ8N4CgJyavjRRisoofMih8pIea1yLP+18u5AC7c9m
 x0WMcKofDkseAhMjCryOyGTnwJ5MywSx8/mT41nNL2ecJOSMswnKWgtMe4j9xoivWhw+
 doe+OXfUVOl465DOi0ZYmhPockcB1h8RZbEoluQ2V42Etobf1MrZM9AOkBEgCqFfcCSC
 bV5w==
X-Gm-Message-State: APjAAAUVvnsepFDKy4B4TL1wZRtsSZtz7kz3Zr8Q9UBoh9R6Z2TN+hJ6
 id3uBBqhwVU2AkaRbQLRvBaZLpzo7MA=
X-Google-Smtp-Source: APXvYqxKvDIXNk5hC0HOtNDMbpuXDXA801J8FRJXWqD4g6qi8xlCjntuFwmXiY7iKqOVHtMV0EPP5g==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr75925007ljj.122.1564911713008; 
 Sun, 04 Aug 2019 02:41:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 25sm16230194ljn.62.2019.08.04.02.41.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 02:41:52 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/i2c/tda998x: drop use of drmP.h
Date: Sun,  4 Aug 2019 11:41:29 +0200
Message-Id: <20190804094132.29463-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804094132.29463-1-sam@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dafJ51pWjlSMMKmje8uyWBSzlpRZ3vlrMRQDfaXXm+I=;
 b=VJKKuspPkJ/iptGVaAIoL945E1CzQwsN5G4ksjAZNP8PXf2Ff3dv+gS/FLoY9VWU05
 w8q3mWa/IuxNK47fbQt2rYa73+ocaMbglQIKs1eqXhDFXafeznzGsR4vzux/6sUs20cD
 QjFlISCWneiUfF/0n368zWU8jpTJViwhxlySi37hox1yoPBK1PakzLZMcLniiNyUUAUC
 eOpmBnh7ej7+c/ZGjO1NUUNb4yvPp83pOztqSDOCfPjub7MbSJtYi2qbl1MNb9j2Qh1i
 3uT8JZ0BBiAxUZPdS6iwJpVZXJ3441zFnjxXTFiKqzfecyfHwQWuKq6C4KSnDoXI92Mo
 99Bw==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, malidp@foss.arm.com,
 linux-tegra@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpGaXggZmFsbG91
dC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFJ1
c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pMmMvdGRhOTk4eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwpp
bmRleCA2MWUwNDI5MThhN2YuLjg0YzZkNGM5MWM2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9k
cnYuYwpAQCAtMTMsMTAgKzEzLDEwIEBACiAjaW5jbHVkZSA8c291bmQvYXNvdW5kZWYuaD4KICNp
bmNsdWRlIDxzb3VuZC9oZG1pLWNvZGVjLmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZWRpZC5o
PgogI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vaTJjL3RkYTk5
OHguaD4KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
