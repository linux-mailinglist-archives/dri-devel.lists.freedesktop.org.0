Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D79954FD279
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D19B10E953;
	Tue, 12 Apr 2022 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5838110E87F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:13:37 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id b17so15465553qvf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b40J74AZXHQx3F3Kvksxnsm3IoWKYudmg3ktvmskBdg=;
 b=WaLc2Au2YbHOHeTL1tw2HzzO/XexflDPqyrLEkqsasuhDDsPBzB2egRw8/Mb1kpQPr
 IwGDR8MitazGyJCi9qrLug3qC2j4wNkksBlq1YnwmhLfKlyEPwBo24zPpfpymWuhKgKb
 Cuhp/E32I9b2OI0vWTxI4cAxPwlyvJZyNMuVrwuZT7BpyzV6njlMnSeRPTkOKvDeL0YH
 2rKVju2lsqh8wW/YMshRYKEssgEoVBjrqwYLMoVhg/F9F5csBew2HT8bMTBOOKddZv99
 qpqR1fuWa/j86MxFoK7URRFksGDJv0i64rGUUqcrE57wpyDc1SPjCF5pceQKA6c/l2TL
 k/Lg==
X-Gm-Message-State: AOAM530XOPynci/FT3oN2txfkbUKEody6O/SlCEZlMxHkTiYObYvHZ/J
 y4+eXEpod7AxRHoMqwVc4dn/JO4NEMZi+BQP
X-Google-Smtp-Source: ABdhPJzolqcXXHbizEe0RhmbomAAvVMaomfzfcpT1li1zvLVr4ITVYJUALobt5yutbXeY+5tseEFpQ==
X-Received: by 2002:a05:6214:2349:b0:444:2a7b:cd5c with SMTP id
 hu9-20020a056214234900b004442a7bcd5cmr2564486qvb.77.1649747615731; 
 Tue, 12 Apr 2022 00:13:35 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05622a130c00b002e1b3ccd9adsm26293243qtk.79.2022.04.12.00.13.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:13:35 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id v77so13441058ybi.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:13:34 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr24883011ybq.342.1649747614630; Tue, 12
 Apr 2022 00:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-2-javierm@redhat.com>
In-Reply-To: <20220411211243.11121-2-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 09:13:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+ieUSv1sjOX-fks3o+J3Eicg-prCK2+roTq-MFKTHBg@mail.gmail.com>
Message-ID: <CAMuHMdU+ieUSv1sjOX-fks3o+J3Eicg-prCK2+roTq-MFKTHBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The current compatible strings for SSD130x I2C controllers contain both an
> "fb" and "-i2c" suffixes. It seems to indicate that are for a fbdev driver
> and also that are for devices that can be accessed over an I2C bus.
>
> But a DT is supposed to describe the hardware and not Linux implementation
> details. So let's deprecate those compatible strings and add new ones that
> only contain the vendor and device name, without any of these suffixes.
>
> These will just describe the device and can be matched by both I2C and SPI
> DRM drivers.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
