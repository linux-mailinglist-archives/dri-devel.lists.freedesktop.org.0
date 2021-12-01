Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B9465819
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 22:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DA56E4EC;
	Wed,  1 Dec 2021 21:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D896E4EC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 21:01:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c4so55086335wrd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 13:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:content-language
 :subject:content-transfer-encoding;
 bh=cwvui+qdm6o4ZBCSGekTkzJQ8eW+ZDFl8qkzfDK7qGs=;
 b=nnni6Cz9XfrpnREjVjJ3qU6idrJQkxJ/izedgQZiwydqcV/yvi1TSe8JbV+ZZwB0vg
 raD7MTVw+DvHc16prhi1HeVDtnZ+ImRbwqGZXeQQBzb2caYcpxDWFbWKdSLuJBpZ/8Rj
 kL4/UzcIF2XPKrArZBYEADnm8HMXijVuPb+7WaWzNBWg3Erw+r3qqrOwV8CK2Dfssye/
 P0RdI8pYEN8if0Ah4IsZe+f8WnbaFW3TGEXBb5WKsdH2ZnPCDbdsnzUKHjI3ZB2Pran/
 nK5sIABvihfVQ5pjGqdCVVS74macaZpbzxHsecDBkZeD3OCGEQ2WcYBW6GouaS8qqsSl
 RTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:content-language:subject:content-transfer-encoding;
 bh=cwvui+qdm6o4ZBCSGekTkzJQ8eW+ZDFl8qkzfDK7qGs=;
 b=ZNCY04tlg9iBD2W/+X888xDNDLhOfrkSiQ7YtA/gC4b4UPcM7JawKHsk19R9M6pI2o
 MZG8Ytv5iCV2DOUKJqSv/1SF0PBqDItf8wgeaIIP7co4hliI3GvhzhBxCUsORtGeEWhK
 fk/gzamDiG23wx0Uy/Bsmmi/YXXGiJnea2eok6PXPBu0YJk4BQsYG3JtEW3zzztXLcIY
 cqLDlLAGqERiji3mBOUt1ERUUa7AJMsXNbJtr0f4ZRMIku6yTrEqkbTCeK+MvH/JrLpx
 m1lIrbfcxh89uBJ8rSdYWtQAffAJrvuD6x9o9ChuP7q4UmL99OA9flXwZymFdYuyxLL3
 CgZA==
X-Gm-Message-State: AOAM531bAL3LPoRZRXWP6LV5zeh+s4KVXfvb95rXyJI7PVHcM07qQfJ0
 i2/iYhxzVvuIPR6OoZUgwsQ=
X-Google-Smtp-Source: ABdhPJwA2PlDRxVgGoDQjj93GVxXQ9ndvQaEeP3vjhUM1LswijOqOb6p3niWW+1ygygaj6qcarOO8w==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr9423868wrg.433.1638392494414; 
 Wed, 01 Dec 2021 13:01:34 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:4055:a69:db9e:1280?
 (p200300ea8f1a0f0040550a69db9e1280.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:4055:a69:db9e:1280])
 by smtp.googlemail.com with ESMTPSA id y6sm323567wma.37.2021.12.01.13.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 13:01:33 -0800 (PST)
Message-ID: <773dc6ff-f2b4-4192-a128-c34bd3f5be01@gmail.com>
Date: Wed, 1 Dec 2021 22:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Language: en-US
Subject: [PATCH v2 0/2] staging: fbtft: add and use macro
 FBTFT_REGISTER_SPI_DRIVER
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
compatible") we need to add spi id_tables. Changing existing macro
FBTFT_REGISTER_DRIVER would have meant to change arguments and
therefore adjust all fbtft drivers.

This series adds a new and simplified macro FBTFT_REGISTER_SPI_DRIVER
that includes a spi id_table, and in addition to that:
- does not define a platform driver
- uses macro module_spi_driver()

Also the MODULE_ALIASes can be removed.

Works for me with a SH1106-based OLED display incl. module autoload.
For now I changed this driver only because I have hw to test it.

v2:
- consider that spi id_table name consists of device part of compatible string only
- instead of changing the existing macro, add a new one and make fb_sh1106 the first user

Heiner Kallweit (2):
  staging: fbtft: add macro FBTFT_REGISTER_SPI_DRIVER
  staging: fbtft: sh1106: use new macro FBTFT_REGISTER_SPI_DRIVER

 drivers/staging/fbtft/fb_sh1106.c |  7 +-----
 drivers/staging/fbtft/fbtft.h     | 41 +++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 6 deletions(-)

-- 
2.34.1


