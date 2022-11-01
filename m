Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1726154C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 23:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D744B10E42C;
	Tue,  1 Nov 2022 22:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2EB10E42C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 22:11:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id k2so40678948ejr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 15:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5Y/A6SSzTvtgQd0X9k5UHqLVvCbmHi58+YPHiyn5LI0=;
 b=UEsC8dfcL1SN1KwslTQut54Ja0Dcuo54K14G5dsQp6Y4hrtS2ikmKJlbrqiw5J+SBw
 Rn3jMiDwbcEvBCcvhHecyrMgqBp+bBF8yJGdFKCiWsQTArnihCApm1QiK6skzrW8jI9f
 bOOT6UQXs+PQjZ6F1Di7vs2WWHSB6KpFSy39aMbI29aIIiq39kpofw2jR01FPsqK7NhU
 no/fRlC6HarBNc9IaNsuOJ4bNgWivS7WbRXTCbo/24VFaanKkGJg18Q7LQASN4KtF/zP
 wR+izGKjNokpkTtC6G3ah29TxD6b45/NlAc3V+TnrMCYg/TbjUkiQOhXG4RrEzQ+gLyu
 d9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Y/A6SSzTvtgQd0X9k5UHqLVvCbmHi58+YPHiyn5LI0=;
 b=2ndcJw/iP2fkT2giyXQ6B0UebWjQocJgiiByfZyit6XlDovDjQK4kqdDlOstJeniFr
 /ZtlABVnwUR7VLMxQgYK25SSnEyWr6ISWEio6oHerappyTfLHNI17Ci1duVzUMzkTGrs
 q5Hr041OrmFuWZCrZhtIUJmysllg5q75/oUZ1pXZR9vlAlM/7cS8SbT6llSh6bLo6yCT
 3FGRDFqh3UdQ8/uCnUvwvNzyluD70siAv/t/NdD2Hni4e6v3G8aAvO7zbe0G5j1V1aUx
 mLEQniSPcfalO14J5lVVuSdWnXg6vLqzfl4sJ39xRDmAnYURQr3LEUDlB+gTYwyMVrT1
 mshQ==
X-Gm-Message-State: ACrzQf3+nq1+0eW+GP3ABerEcYxrQSixqjL+W7H3rzZZewGTmMYuRpsb
 C8ybqcXlf5160X7k0NRaiVhtvMi9IHGi7kQ6iwlywQ==
X-Google-Smtp-Source: AMsMyM7i2A+ix3+IM6q74RmQWGaByXsdPydkfUl5Y9MamGostJsml5qeW4zFDk6cgRj8PxAee1nY5if5XTdACscAjiE=
X-Received: by 2002:a17:906:dc8f:b0:7a5:8160:1995 with SMTP id
 cs15-20020a170906dc8f00b007a581601995mr20627886ejc.500.1667340666448; Tue, 01
 Nov 2022 15:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221014231042.468033-1-marex@denx.de>
In-Reply-To: <20221014231042.468033-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Nov 2022 23:10:55 +0100
Message-ID: <CACRpkdZ4hpzY1PUPBSyef55dy8F_6610WzTmmQNJA2_2ATpitw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/panel-sitronix-st7701: Clean up CMDnBKx
 selection
To: Marek Vasut <marex@denx.de>
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
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 15, 2022 at 1:10 AM Marek Vasut <marex@denx.de> wrote:

> There are two command register files, CMD1 and CMD2, where only the CMD2
> contains additional register sub-files BK0..3 . Pull the register file
> selection call into separate function instead of duplicating it all over
> the driver. The CMD2BK2 file is undocumented in datasheet, and is used
> for BIST. No functional change.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Patch applied.

Yours,
Linus Walleij
