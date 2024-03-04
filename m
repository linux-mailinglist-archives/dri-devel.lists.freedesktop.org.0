Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B202A86FB9F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 09:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E403F10FE32;
	Mon,  4 Mar 2024 08:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yeeNUWlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC5310FE36
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 08:20:55 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-4d34fbbd91eso757986e0c.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709540454; x=1710145254; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yyEcn3m2A7yavQvE00TpjSl9UF2QJItgWnXnzeCS3YM=;
 b=yeeNUWlpjlqf4DUX/vRxJchD0JZnxVck+V3cUdG3y0BrxDkHaeBvlWqBso9HNahhqI
 b3Q0kvwttBq7GjHM7HIds9ugLXGtIY83Q704SPYADNiOTYT0SRWsVFQ15mwLlTZeKHLU
 ZGbyVqjYDD11MkVTzTMBsD1J61/KwCo5fbI2T+24zkvInGLmrKZVyIzJSfuQK6sxMYDc
 AqUdpLgPHjv/MaKVjzLcWaBYyCVd0wW576oJ6u+QZqOG8bPMy2ywgTcq3mBknghxAN/c
 yADke+Pjh87nI4c9ptC+6qnidOlMBWDFgC8xLrac+VntAyMYHMqjDwaTbyOWTBpRN2xm
 6gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709540454; x=1710145254;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yyEcn3m2A7yavQvE00TpjSl9UF2QJItgWnXnzeCS3YM=;
 b=MzG4Vm3jM9bM8FpQf8yu20EPbbC40n5lb3waf69kTcYduU6Kx3kUYAPrgXCsWI7aNK
 Av2bPWm9ColZiN5EylZQo6Kfkc87ePZGwz9I8Yji/EfrVbdNbbwyZbP8jJ1S+aCnzZqb
 QZ56obkqwU4pNednMEf08vMtU8eQDKGmu3k0FkWOYy49ErABBQrYenY2Vb0LfmaGyHlv
 EfVh457VYy2JnDZvhwWcjFKIrEoEdWlkMfYYGyzEBXe8MrWi9raPu00rjW6S94bKAgmk
 rmMIAaxYWi8RgGKa/NrUumuXv/pfVvQUjgddczJM2zQNzvAm93xDjvHVJuKZZvOtxZLn
 UAqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXhD7UUpavVCdTUO/9yza3pA2qChwHTt99HVBFbNGD0+p3v34odVlByqviMaPkl98857UjNb7xuLb/m2YyrGpMNmCIgrPIU8APfUUDxnPk
X-Gm-Message-State: AOJu0YyMB764Pgl9qCzxsWSsLTlN1jOqykOU+0DFXqPOpcF1KQUpI54C
 tr0SGyOPcNMA+W7FKk7Os0tpmw7tpWoYwqh8yopy7JVUNzhDSHfe1KAVfAEYdiUO/zimElErQXv
 Nkedj0ZEtQRJpMoIgDzhXwSl6U7NShFdXCACg8Q==
X-Google-Smtp-Source: AGHT+IHi5xUT6VReqMwudYvcimoxVjZtj0eGM2mqhV92LARqhWB+invYdIZQv1GlviuVLJkoncYGckQNqOnQq2cbuuE=
X-Received: by 2002:a05:6122:917:b0:4d3:4aad:a8c6 with SMTP id
 j23-20020a056122091700b004d34aada8c6mr5928625vka.0.1709540454609; Mon, 04 Mar
 2024 00:20:54 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Mar 2024 13:50:43 +0530
Message-ID: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
Subject: fbdev/chipsfb.c:401:31: error: invalid use of undefined type 'struct
 backlight_device'
To: open list <linux-kernel@vger.kernel.org>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The powerpc ppc6xx_defconfig builds failed on today's Linux next tag
next-20240304.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
drivers/video/fbdev/chipsfb.c: In function 'chipsfb_pci_init':
drivers/video/fbdev/chipsfb.c:401:31: error: invalid use of undefined
type 'struct backlight_device'
  401 |                 pmac_backlight->props.power = FB_BLANK_UNBLANK;
      |                               ^~

Steps to reproduce:
 # tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig ppc6xx_defconfig
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2dDE297yLFrAr3gigIDy8tIleDh/tuxmake_reproducer.sh

Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919857/suite/build/test/gcc-13-ppc6xx_defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919857/suite/build/test/gcc-13-ppc6xx_defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919857/suite/build/test/gcc-13-ppc6xx_defconfig/history/


--
Linaro LKFT
https://lkft.linaro.org
