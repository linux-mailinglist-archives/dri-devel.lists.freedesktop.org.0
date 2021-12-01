Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D11465820
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 22:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31BE6E8F8;
	Wed,  1 Dec 2021 21:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46EE6E8F8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 21:04:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a9so55142504wrr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=dXdZwfGWDav+4+EuXXt9amZDrLIfxTbg+r3dcr+ghrc=;
 b=bRjBq1q/t59/oprvbtWyo+sLjo83k6AHf2tN9l+TrGv6plUjnh8vWlKcIxGgGzdcRf
 QD9T2Q5PCQgaUzRX0ukZcUhKlKfm0rvUy/1VfieI2pEP1Pu3rnns+sG/rzjHT64EONSO
 Nm0ESG+jjt1fUMcAjazUdlzfjlUFy9+ZWtwrhmO35Ere/MXLZKvMtqzwSelx42QxfPho
 njClcM7khrQ1IPnQqOzigf0SU41SrxYOsvUbUQRHkWur1CPWxQwvHT3DT4P1d0PsIYTS
 rRKoRoIasLF6mBxzZ8AQ0sTiVZlt5GPz93hII22xuQSXlCuBjXa1d1++r9K1EGS3FWpB
 yfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dXdZwfGWDav+4+EuXXt9amZDrLIfxTbg+r3dcr+ghrc=;
 b=U7Fm/uVewv9RDCXw+9xUdgej1JXnl96uQ/469SnqYmEa2Pp/3vfLjugV/Bqw2o43TX
 i/jJ6ntYlfhWRSCsoc/eHLAW5bbPZon5iDaNhMXoHSaKG2aAm03Lo3hLl2xh5OQ2lT4W
 v6jPDynmytIa1K9TXTqGFdfxdUk1j4GcdidC4cR8qDT64sNFiEKlkwkNAH7rZTz7tNAt
 pPNkMBPdCuanJR6xEUsZ6n3DQLFxMLsFno6tmCW5LsTROUcMpxiNtT6lsbt+CfFy+Jq0
 chsXpHonl2KeOgM6irlu+W/fXvKrQi2u7EMiLQ/yOUycZmb3IRFPmZDlnPqiNJa+wCfF
 Ti3Q==
X-Gm-Message-State: AOAM530QXUBocM68h+ppRdQ1vqntFCNXWROztmhCr5AgNmdK3BLMPpOP
 OXfWLV/7mf59irjTU3S6y8I=
X-Google-Smtp-Source: ABdhPJwtOQTmBKrSdV6HNqHEji/a4WAwj68V5PxjVwp3jDel7K0LwJlUzxHoMJ7/EjNxxLeRI3aL3g==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr9385949wrs.304.1638392663156; 
 Wed, 01 Dec 2021 13:04:23 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:4055:a69:db9e:1280?
 (p200300ea8f1a0f0040550a69db9e1280.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:4055:a69:db9e:1280])
 by smtp.googlemail.com with ESMTPSA id g16sm465221wmq.20.2021.12.01.13.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 13:04:22 -0800 (PST)
Message-ID: <65516be1-9588-af00-cf4f-053e20af9b45@gmail.com>
Date: Wed, 1 Dec 2021 22:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 2/2] staging: fbtft: sh1106: use new macro
 FBTFT_REGISTER_SPI_DRIVER
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <773dc6ff-f2b4-4192-a128-c34bd3f5be01@gmail.com>
In-Reply-To: <773dc6ff-f2b4-4192-a128-c34bd3f5be01@gmail.com>
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

Make fb_sh1106 the first user of new macro FBTFT_REGISTER_SPI_DRIVER.
In addition the MODULE_ALIASes can be removed. Module auto-loading
was successfully tested with a SH1106-based OLED module connected
to an Odroid C2.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/staging/fbtft/fb_sh1106.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_sh1106.c b/drivers/staging/fbtft/fb_sh1106.c
index 7b9ab39e1..9685ca516 100644
--- a/drivers/staging/fbtft/fb_sh1106.c
+++ b/drivers/staging/fbtft/fb_sh1106.c
@@ -173,12 +173,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "sinowealth,sh1106", &display);
-
-MODULE_ALIAS("spi:" DRVNAME);
-MODULE_ALIAS("platform:" DRVNAME);
-MODULE_ALIAS("spi:sh1106");
-MODULE_ALIAS("platform:sh1106");
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "sinowealth", "sh1106", &display);
 
 MODULE_DESCRIPTION("SH1106 OLED Driver");
 MODULE_AUTHOR("Heiner Kallweit");
-- 
2.34.1


