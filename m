Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C288E042
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6104C6E862;
	Wed, 14 Aug 2019 22:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40E26E862;
 Wed, 14 Aug 2019 22:02:34 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i30so164798pfk.9;
 Wed, 14 Aug 2019 15:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oPlzvlPf3Rzc4cpgcIkobJmF5pbYWdwPlsySxjkAj0=;
 b=KEHjAuUitpPIsK9VXBPQrQtpuyVrt/Hbp0XxeZnqcCjhUoMV5DGiLFYNem3j9/ZMud
 7i1FuH30qMJ44kO1yN+WgKjIw1QJh93ypMBviT3qea3D+3wwKfdHpvksOZ+1FkPM1Jhd
 l6vT1nZJsVcqIHg28S+C1btGb9A8pL/hbmGUiGFgB4hwgC3w6GlJlvz/jqQ2jtUINATI
 hmgMmAD3O5qHbEBH8N34OOb09ojVFF3npZMbwvKub4utML1MtwaiOjzjtGtjT0yJVW2o
 6Gl5cDfaodJS6gZkscb6t8kOn6CuQyXaBTPP28YMwppRP6RUqA42lKXXsgHRe/cY04qm
 i9tQ==
X-Gm-Message-State: APjAAAWsjK3njPVOeZDxSHPhsIV/mxqBa33fP5TTXc8mw60jweYdyv0f
 n4u2pok4RwRAt55GloqxtrvoQbb9F83bvg==
X-Google-Smtp-Source: APXvYqzCBQPKmpeFEXKLaI6VKfcy6SgcaxLxPzYa/x4WSu39Iu3WSkxBPKAcusu6di8joy6ZTM5XDQ==
X-Received: by 2002:a62:4e09:: with SMTP id c9mr2268787pfb.130.1565820153895; 
 Wed, 14 Aug 2019 15:02:33 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id d129sm896504pfc.168.2019.08.14.15.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 15:02:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm+dma: cache support for arm, etc
Date: Wed, 14 Aug 2019 14:59:55 -0700
Message-Id: <20190814220011.26934-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oPlzvlPf3Rzc4cpgcIkobJmF5pbYWdwPlsySxjkAj0=;
 b=QsFDkKjaHSdT6ZUi+JJ7HPBAsxs4M45zVvakOMVd/f1v8yDy4Pe2ktVQIi6TcbQGs4
 +0rdap1k9RPnLJwD5sJG3RNHYDxiRp0DpzJa5rPFrWQYYZMFBDR8URhlW4LyWGSqLgDi
 v3nOVWGRXtObRIix2efxPL/FTSeXBV1Vh2bbPdS8+IInFkXk++Du4gd7sLVkXZIY9UIM
 oYSDp2D5AqVVqNwWUutnIu0wP3/+nwxYcTorj1iRwjtVLn7UIscolWVJf7FLpK6z/dax
 WEJZB9Z60/rNmcFNC4/QIfBMeYoSOqxs+6j8XIafhDh0BI51LPUU+2Cx0JIDhTMJ/+No
 RmDw==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT AARCH64 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Deepak Sharma <deepak.sharma@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Enrico Weigelt <info@metux.net>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhpcyBpcyBhIHJlcGxh
Y2VtZW50IGZvciBhIHByZXZpb3VzIHBhdGNoZXNbMV0gdGhhdCB3YXMgYWRkaW5nIGFybTY0CnN1
cHBvcnQgZm9yIGRybV9jbGZsdXNoLiAgSSd2ZSBhbHNvIGFkZGVkIGEgcGF0Y2ggdG8gc29sdmUg
YSBzaW1pbGFyCmNhY2hlIGlzc3VlIGluIHZnZW0uCgpUaGUgZmlyc3QgZmV3IHBhdGNoZXMganVz
dCBleHBvcnQgYXJjaF9zeW5jX2RtYV9mb3JfKigpLiAgUG9zc2libHkKaW5zdGVhZCB0aGUgRVhQ
T1JUX1NZTUJPTF9HUEwoKSBzaG91bGQgYmUgc29tZXdlcmUgY2VudHJhbCwgcmF0aGVyCnRoYW4g
cGVyLWFyY2ggKGJ1dCB3aGVyZSB3b3VsZCBtYWtlIHNlbnNlPykKClRoZSBmb3VydGggYWRkcyAo
YW5kIGV4cG9ydHMpIHRoZXNlIG9wcyBmb3IgYXJjaC9hcm0uICAoQXJuZCBCZXJnbWFubgptZW50
aW9uZWQgb24gSVJDIHRoYXQgQ2hyaXN0b3BoIEhlbGx3aWcgd2FzIHdvcmtpbmcgb24gdGhpcyBh
bHJlYWR5CmZvciBhcmNoL2FybSB3aGljaCBjb3VsZCByZXBsYWNlIHRoZSBmb3VydGggcGF0Y2gu
KQoKVGhlIGxhc3QgdHdvIHBhdGNoZXMgYWN0dWFsbHkgZml4IHRoaW5ncy4KClsxXSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY0NzMyLwoKUm9iIENsYXJrICg2KToK
ICBhcm02NDogZXhwb3J0IGFyY2hfc3luY19kbWFfZm9yXyooKQogIG1pcHM6IGV4cG9ydCBhcmNo
X3N5bmNfZG1hX2Zvcl8qKCkKICBwb3dlcnBjOiBleHBvcnQgYXJjaF9zeW5jX2RtYV9mb3JfKigp
CiAgYXJtOiBhZGQgYXJjaF9zeW5jX2RtYV9mb3JfKigpCiAgZHJtL21zbTogc3RvcCBhYnVzaW5n
IERNQSBBUEkKICBkcm0vdmdlbTogZml4IGNhY2hlIHN5bmNocm9uaXphdGlvbiBvbiBhcm0vYXJt
NjQgKHRha2UgdHdvKQoKIGFyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgMiAr
CiBhcmNoL2FybS9tbS9kbWEtbWFwcGluZy1ub21tdS5jICAgfCAgMTQgKysrCiBhcmNoL2FybS9t
bS9kbWEtbWFwcGluZy5jICAgICAgICAgfCAgMjggKysrKysrCiBhcmNoL2FybTY0L21tL2RtYS1t
YXBwaW5nLmMgICAgICAgfCAgIDIgKwogYXJjaC9hcm02NC9tbS9mbHVzaC5jICAgICAgICAgICAg
IHwgICAyICsKIGFyY2gvbWlwcy9tbS9kbWEtbm9uY29oZXJlbnQuYyAgICB8ICAgMiArCiBhcmNo
L3Bvd2VycGMvbW0vZG1hLW5vbmNvaGVyZW50LmMgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL2Ry
bV9jYWNoZS5jICAgICAgIHwgIDIwICsrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0u
YyAgICAgfCAgMzcgKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgICB8
IDE0NSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9jYWNo
ZS5oICAgICAgICAgICB8ICAgNCArCiAxMSBmaWxlcyBjaGFuZ2VkLCAxODIgaW5zZXJ0aW9ucygr
KSwgNzYgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
