Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39F38CE32
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 21:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A3389F3B;
	Fri, 21 May 2021 19:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6BF6F8D0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 19:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621625387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W/zi/LtHS0XDym1cIKLNS5P4Tl2hUYuQ3Q4oc605Ruc=;
 b=Cqwe/bY66ooJfR25I1soKntvmPfWhfa93TjsFgjp4hW4LSLWPG5yaN7AuLiADujpif+vuT
 nMJntlxsWoGP1gzQHn4uD5Wm2cDG5MTuy8D7WpwcRdHcggn+GHTOmTgeDb+bjxvdKWlSjA
 6u/n1Mbqm5lCezuoVJrunqQjbXz6Ejs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-v47tyBVmPEaNFQqvwNUxFg-1; Fri, 21 May 2021 15:29:45 -0400
X-MC-Unique: v47tyBVmPEaNFQqvwNUxFg-1
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so9779025wre.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 12:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/zi/LtHS0XDym1cIKLNS5P4Tl2hUYuQ3Q4oc605Ruc=;
 b=LrlgoMLhYIN0pyGNSf4dlv5LXwhIO0P4lWsJtxAgEiA1HzFPmJFCnGYgZJG5v/wLzQ
 YABOU/CsQK6W0pcAhaZrZZEY4kvwQqi42+7x4lPGwEOlcwaSjsGymwDnfuOkFzv7CSoG
 U0mexmONKHfRHorI83HzKbOV06XchRXSTQLMpxzp14QfKnh69nbYG3KmYNmh9Ku9JTnz
 rQ6BCu88PP34DTgUnxOW1SxqOhwugXsjJsjuZze1yM7E09JaINUsI2RYIUtXWmX76Cvb
 /zRCt2Pct/SWC7CwpJ9Hagpr8Pw/Zs00DKHjhbnpDf2XKEtcu3gWE1m+KleMz251wp9A
 SrWg==
X-Gm-Message-State: AOAM531iJlQW6XR9twSpbY/tWjXGl9q5uy+aS/Tu3JNmW932Ky+flTcT
 xp+1FND044jah6n8Tt0bBd8m1NLXyLfRj56Ded4pOW7xQYklJf6fRC2LrAH8YZFB+Z9kgbqd70a
 df4Erunkj73bA+SJYb0MlBUeO9jUs
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr10110492wmp.71.1621625384767; 
 Fri, 21 May 2021 12:29:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/OyYpeLIFQQtA9P7euza3ZHBvS4POGpr3Wcj1AR1IOx4wP4WYkmEu/V4dSruhwNMjfWVl2Q==
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr10110469wmp.71.1621625384534; 
 Fri, 21 May 2021 12:29:44 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id s7sm434402wmh.35.2021.05.21.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 12:29:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] allow the sysfb support to be used in non-x86 arches
Date: Fri, 21 May 2021 21:29:04 +0200
Message-Id: <20210521192907.3040644-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: linux-efi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The x86 architecture platform has a Generic System Framebuffers (sysfb)
support, that register a system frambuffer platform devices. It either
registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
VGA/EFI FB devices for the vgafb/efifb drivers.

Besides this, the EFI initialization code used by other architectures such
as aarch64 and riscv, has similar logic but only register an EFI FB device.

The sysfb is generic enough to be reused by other architectures and can be
moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
logic used by non-x86 architectures to be folded into sysfb as well.

Patch #1 in this series do the former while patch #2 the latter. This has
been tested on x86_64 and aarch64 machines using the efifb, simplefb and
simpledrm drivers. But more testing will be highly appreciated, to make
sure that no regressions are being introduced by these changes.

Since this touches both arch/{x86,arm,arm64,riscv} and drivers/firmware, I
don't know how it should be merged. But I didn't find a way to split these.

Best regards,
Javier


Javier Martinez Canillas (2):
  drivers/firmware: move x86 Generic System Framebuffers support
  drivers/firmware: consolidate EFI framebuffer setup for all arches

 arch/arm/Kconfig                              |  1 +
 arch/arm/include/asm/efi.h                    |  5 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/efi.h                  |  5 +-
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/efi.h                  |  5 +-
 arch/x86/Kconfig                              | 27 +-----
 arch/x86/kernel/Makefile                      |  3 -
 drivers/firmware/Kconfig                      | 30 +++++++
 drivers/firmware/Makefile                     |  2 +
 drivers/firmware/efi/Makefile                 |  2 +
 drivers/firmware/efi/efi-init.c               | 90 -------------------
 .../firmware/efi}/sysfb_efi.c                 | 79 +++++++++++++++-
 {arch/x86/kernel => drivers/firmware}/sysfb.c | 42 +++++----
 .../firmware}/sysfb_simplefb.c                | 31 ++++---
 .../x86/include/asm => include/linux}/sysfb.h | 34 +++----
 16 files changed, 182 insertions(+), 176 deletions(-)
 rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb.c (70%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (82%)
 rename {arch/x86/include/asm => include/linux}/sysfb.h (68%)

-- 
2.31.1

