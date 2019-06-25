Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F08A5640B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCB56E2C4;
	Wed, 26 Jun 2019 08:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164026E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:34:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so18581997wrw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2g1huIVKZozNkv7icnrH8UYyhFSdx5OaAzsnOBD/wug=;
 b=dNWJdDxtLmIp3fcQetyr7nGVPpjM4kCqXJPEMAEW6JFTxbiJHx7OukQVn8mGIjuFmu
 In65DPxCq0+pz2fzytfaa3JWiyvBVtIFouyGtshtW5QSU/nviV42fb1dB1v18GLPRo1z
 j7zRZnJHA6UPRgTEnVw6O78F25AR9yQrs+k/2iUKjFCdBLyWm4lYMYbQ+0bqkVsW9KSz
 GW/JBWPsjNJRQmTZNon1o3FVphP4cMwi1BOiokiukAd6dQYt0S2ppUuZyV+E9pJXaElV
 adlABTIqhzEG54Ots9+fwSec71zL5O4iO51v04Q1MBfTISDrpBZc0XCiROwWHapf5LtK
 LDGg==
X-Gm-Message-State: APjAAAVagLyv+ybAkRQOYZ9/AURukiK5K9BYMCG0vyywpNfOyaLa2get
 1K0SMD8qOEYWjQl/cOlDbrOnWQ==
X-Google-Smtp-Source: APXvYqwvUGzuhdRcRqrCnTEpE5XZ6xpDDtphMfdnxdkKNg7ns8U+hGGMdSWdjbAlt4fd7Q2s17qqjA==
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr27001554wrt.295.1561480496798; 
 Tue, 25 Jun 2019 09:34:56 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:34:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 04/12] ARM: davinci: refresh davinci_all_defconfig
Date: Tue, 25 Jun 2019 18:34:26 +0200
Message-Id: <20190625163434.13620-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2g1huIVKZozNkv7icnrH8UYyhFSdx5OaAzsnOBD/wug=;
 b=XfV694/+ba+iJjm7XndfMMr4t/G9R6WZsl7ZClO8hbM2sE6598a/agfQtKVXIRT+/V
 AoWfR7WcIGSYP9NtRwQLMxrVuN8omLG3udtaeoq83oK2iDO6nbVLJEHwc4tAlzDRKnUW
 gS/on6mUn/wFH3kWwFQKEFahEkn+l8s83Ssn4MxCUCfZZpg6XEZM2S6oO7wDsjKHlSzK
 6DdCjzey8fw1L2Sr3nfWJAfvgsIF/hpbPE/j6G7N0faVlvQgkRP+V8rn2kBlHP6VSfn7
 CBY8w6r9dg4x854xvpQB8f/T0kExSZQfy1QZEFOwDaubHwfdoPP9zoCw6SwKAt13nfeI
 zNkg==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJl
ZnJlc2ggZGF2aW5jaV9hbGxfZGVmY29uZmlnIHdpdGggY3VycmVudCBtYXN0ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgot
LS0KIGFyY2gvYXJtL2NvbmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnIHwgMjcgKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL2RhdmluY2lfYWxsX2Rl
ZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnCmluZGV4IDRh
OGNhZDRkMzcwNy4uMTNkNzg0NmM2MTNkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL2Rh
dmluY2lfYWxsX2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL2RhdmluY2lfYWxsX2Rl
ZmNvbmZpZwpAQCAtMyw2ICszLDcgQEAgQ09ORklHX1NZU1ZJUEM9eQogQ09ORklHX1BPU0lYX01R
VUVVRT15CiBDT05GSUdfTk9fSFo9eQogQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15CitDT05GSUdf
UFJFRU1QVD15CiBDT05GSUdfSUtDT05GSUc9eQogQ09ORklHX0lLQ09ORklHX1BST0M9eQogQ09O
RklHX0xPR19CVUZfU0hJRlQ9MTQKQEAgLTEwLDEzICsxMSw2IEBAIENPTkZJR19DR1JPVVBTPXkK
IENPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkU9eQogQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKIENP
TkZJR19FWFBFUlQ9eQotQ09ORklHX01PRFVMRVM9eQotQ09ORklHX01PRFVMRV9VTkxPQUQ9eQot
Q09ORklHX01PRFVMRV9GT1JDRV9VTkxPQUQ9eQotQ09ORklHX01PRFZFUlNJT05TPXkKLUNPTkZJ
R19QQVJUSVRJT05fQURWQU5DRUQ9eQotIyBDT05GSUdfSU9TQ0hFRF9ERUFETElORSBpcyBub3Qg
c2V0Ci0jIENPTkZJR19JT1NDSEVEX0NGUSBpcyBub3Qgc2V0CiBDT05GSUdfQVJDSF9EQVZJTkNJ
PXkKIENPTkZJR19BUkNIX0RBVklOQ0lfRE02NDR4PXkKIENPTkZJR19BUkNIX0RBVklOQ0lfRE0z
NTU9eQpAQCAtMzEsOSArMjUsNyBAQCBDT05GSUdfTUFDSF9NSVRZT01BUEwxMzg9eQogQ09ORklH
X01BQ0hfT01BUEwxMzhfSEFXS0JPQVJEPXkKIENPTkZJR19EQVZJTkNJX01VWF9ERUJVRz15CiBD
T05GSUdfREFWSU5DSV9NVVhfV0FSTklOR1M9eQotQ09ORklHX1BSRUVNUFQ9eQogQ09ORklHX0FF
QUJJPXkKLUNPTkZJR19DTUE9eQogQ09ORklHX1NFQ0NPTVA9eQogQ09ORklHX1pCT09UX1JPTV9U
RVhUPTB4MAogQ09ORklHX1pCT09UX1JPTV9CU1M9MHgwCkBAIC00Niw2ICszOCwxMiBAQCBDT05G
SUdfQ1BVX0ZSRVFfR09WX1BFUkZPUk1BTkNFPW0KIENPTkZJR19DUFVfRlJFUV9HT1ZfUE9XRVJT
QVZFPW0KIENPTkZJR19DUFVfRlJFUV9HT1ZfT05ERU1BTkQ9bQogQ09ORklHX0NQVV9JRExFPXkK
K0NPTkZJR19NT0RVTEVTPXkKK0NPTkZJR19NT0RVTEVfVU5MT0FEPXkKK0NPTkZJR19NT0RVTEVf
Rk9SQ0VfVU5MT0FEPXkKK0NPTkZJR19NT0RWRVJTSU9OUz15CitDT05GSUdfUEFSVElUSU9OX0FE
VkFOQ0VEPXkKK0NPTkZJR19DTUE9eQogQ09ORklHX05FVD15CiBDT05GSUdfUEFDS0VUPXkKIENP
TkZJR19VTklYPXkKQEAgLTYzLDcgKzYxLDYgQEAgQ09ORklHX0JUX0hDSVVBUlRfTEw9eQogQ09O
RklHX0RFVlRNUEZTPXkKIENPTkZJR19ERVZUTVBGU19NT1VOVD15CiBDT05GSUdfRldfTE9BREVS
PW0KLUNPTkZJR19ETUFfQ01BPXkKIENPTkZJR19EQThYWF9NU1RQUkk9eQogQ09ORklHX01URD1t
CiBDT05GSUdfTVREX1RFU1RTPW0KQEAgLTE2Nyw4ICsxNjQsNiBAQCBDT05GSUdfU09VTkQ9bQog
Q09ORklHX1NORD1tCiBDT05GSUdfU05EX1VTQl9BVURJTz1tCiBDT05GSUdfU05EX1NPQz1tCi1D
T05GSUdfU05EX1NPQ19UTFYzMjBBSUMzWD1tCi1DT05GSUdfU05EX1NPQ19EQVZJTkNJX01DQVNQ
PW0KIENPTkZJR19TTkRfU09DX0RBVklOQ0lfRVZNPW0KIENPTkZJR19TTkRfU0lNUExFX0NBUkQ9
bQogQ09ORklHX0hJRD1tCkBAIC0yMTMsMTQgKzIwOCwxMiBAQCBDT05GSUdfTU1DX0RBVklOQ0k9
eQogQ09ORklHX05FV19MRURTPXkKIENPTkZJR19MRURTX0NMQVNTPW0KIENPTkZJR19MRURTX0dQ
SU89bQotQ09ORklHX0xFRFNfVFJJR0dFUlM9eQogQ09ORklHX0xFRFNfVFJJR0dFUl9USU1FUj1t
CiBDT05GSUdfTEVEU19UUklHR0VSX0hFQVJUQkVBVD1tCiBDT05GSUdfTEVEU19UUklHR0VSX0RF
RkFVTFRfT049bQogQ09ORklHX1JUQ19DTEFTUz15CiBDT05GSUdfUlRDX0RSVl9PTUFQPW0KIENP
TkZJR19ETUFERVZJQ0VTPXkKLUNPTkZJR19USV9FRE1BPXkKIENPTkZJR19DT01NT05fQ0xLX1BX
TT1tCiBDT05GSUdfUkVNT1RFUFJPQz1tCiBDT05GSUdfREE4WFhfUkVNT1RFUFJPQz1tCkBAIC0y
NTgsMTAgKzI1MSwxMCBAQCBDT05GSUdfTkxTX0NPREVQQUdFXzQzNz15CiBDT05GSUdfTkxTX0FT
Q0lJPW0KIENPTkZJR19OTFNfSVNPODg1OV8xPXkKIENPTkZJR19OTFNfVVRGOD1tCisjIENPTkZJ
R19DUllQVE9fSFcgaXMgbm90IHNldAorQ09ORklHX0NSQ19UMTBESUY9bQorQ09ORklHX0RNQV9D
TUE9eQogQ09ORklHX0RFQlVHX0ZTPXkKIENPTkZJR19ERUJVR19SVF9NVVRFWEVTPXkKIENPTkZJ
R19ERUJVR19NVVRFWEVTPXkKLSMgQ09ORklHX0FSTV9VTldJTkQgaXMgbm90IHNldAogQ09ORklH
X0RFQlVHX1VTRVI9eQotIyBDT05GSUdfQ1JZUFRPX0hXIGlzIG5vdCBzZXQKLUNPTkZJR19DUkNf
VDEwRElGPW0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
