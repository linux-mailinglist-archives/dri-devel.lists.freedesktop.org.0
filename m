Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A9592B59
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5B5A9502;
	Mon, 15 Aug 2022 10:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A0B8E7D3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:09:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h13so8517748wrf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 03:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=CsB/NoAW56ne050I2nV0A7tDW+eX2gZVyLlTc8MEkXE=;
 b=Q2bJb0gcve+toJBBcF3NJDnzAW0PYtNEMYzldvGWquVi3ZwNnMiF927RQ4XD401w1Q
 aqApE+LzZaF804S8NHNrDNnz8VcYTD2U6CLYjQtPCA0hvMrO7+jrWUUN0416udv6b/3N
 j0DcxZKkFiISmo3jjJ5bHRXLA5SH+pXC1EGwootfPQIhe0uOztl/i8zAmb8ixOT9pd3T
 azeux2MTH1rpO1Q7ByHU5ZrZAkuuadpYbpO6FTBqH/DVLWI4sSbbZUDAwJTGXgIB3Fj9
 aZXYEa2IyWIsKp+g0FPxJ3fQADvGYEJEXTALcSEbjJ1sUhjschl72EaI+m1QKh6kQEKp
 mNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=CsB/NoAW56ne050I2nV0A7tDW+eX2gZVyLlTc8MEkXE=;
 b=0/0QR2fdigEq3H7Wcxy1drmi1Rj90IVhs1Yx/E9W4xENAfmJfcvTj1EYXgYDiXl8Qp
 e5Pf7dY8KdJGXfh4fCA2P6DwhUJksg5XgPkvLuQsAGq8+PNaeWojmYep6SH6kur+oA3d
 QvB5FePHcUHRauyiU955lkoYKVaGUCjmeharYcBs/Cs+od/GA0sR7Hjh6R59n/1zuDd/
 yMvMpoMKOTyUcS5zxQCYSiRJ1APBwt+rmafX30G2XsUDJdtVgqvvWaWzKw83MhMpeJMT
 5V7/kuYIrcMs7jrgJRQGRSW/KNqH1/O7eWDyx+r+jQ/+4SaidbJ2MMkpIM7GaH4lbIV7
 elMg==
X-Gm-Message-State: ACgBeo2n9OQpuQKlViPrMt59gW4ees7vhp4RiNmp46tnUY6dgFY+K3Dg
 HIH2t7ZY2o9KRv7u+ldyAicxzQ==
X-Google-Smtp-Source: AA6agR6d5kQNwJdr555MMH+HrNG3/sAUb0Op9EljHjT0wTZDPmBgOVTbFs55jQ216/Ed/j4i1HlcVw==
X-Received: by 2002:adf:f851:0:b0:220:732b:2df2 with SMTP id
 d17-20020adff851000000b00220732b2df2mr8761477wrq.716.1660558142782; 
 Mon, 15 Aug 2022 03:09:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 l14-20020a5d560e000000b0021f0558e51asm6890533wrv.55.2022.08.15.03.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 03:09:00 -0700 (PDT)
Date: Mon, 15 Aug 2022 11:08:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [RESEND PATCH v8 12/12] video: backlight: mt6370: Add MediaTek
 MT6370 support
Message-ID: <20220815100857.hcna3ksejzcq5x3l@maple.lan>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
 <20220815090125.27705-13-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815090125.27705-13-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, deller@gmx.de, lee@kernel.org,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 mazziesaccount@gmail.com, szunichen@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 sre@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 15, 2022 at 05:01:25PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add support for the MediaTek MT6370 backlight driver.
> It controls 4 channels of 8 series WLEDs in
> 2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
> current steps (30 mA) in exponential or linear mapping curves.
>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
