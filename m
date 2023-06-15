Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F67320D2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A672E10E53D;
	Thu, 15 Jun 2023 20:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283F10E53D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:20:25 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-341ed46e5c1so956055ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686860425; x=1689452425;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=98h4clkEAbJKyL0mPSeiS1aUtvolLi8t7UFMljZk2ik=;
 b=WtGdDdmISDteEpK/snik92BS1s1U04nuku6GagSM/TzzCGJ4DwC1GIitbByskS3wZI
 Js7/4GdxfWMj+4onDXS+SrcvP9L1reQeVPiPw15afpA1kTt3oKJEdxvOLhoJasOBn4a4
 eT1n2Af+uJuzHsU0pucD5aLb1yYNXCVV/xMhZFcewLshB3qM9lKiFOFboDjyBsdxARcE
 uejWwfMonOIE5kLliofJpUnwC9DUs3oe4Q5cNjqAtfdseZFrfmaf2DuyIXHmHdkDWyU+
 +Ufxxf9dz3LLI5fISwktXxnOoK1spP9lfEDZ4JbzqGh6Z1KXnefp70o5AqrjSSuBirOk
 Bkzg==
X-Gm-Message-State: AC+VfDyHTFjX/SMKK0LVdeoq8cS6LJlYJ9yymxNKO9XteThZOZIdJDTL
 2KXO0NVFRJcmNpomOLRPoQ==
X-Google-Smtp-Source: ACHHUZ6pGXCQ/jAqDTVq6IYMmb38pjQzkTICdrkSwqYxuDo2nMLr0hecMWf7qd/OGR1/8ZfLXohc0g==
X-Received: by 2002:a05:6602:22da:b0:777:8e86:7702 with SMTP id
 e26-20020a05660222da00b007778e867702mr362037ioe.16.1686860423911; 
 Thu, 15 Jun 2023 13:20:23 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a02b691000000b0041f49dbcaf3sm5773017jam.171.2023.06.15.13.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 13:20:23 -0700 (PDT)
Received: (nullmailer pid 1598537 invoked by uid 1000);
 Thu, 15 Jun 2023 20:20:21 -0000
Date: Thu, 15 Jun 2023 14:20:21 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: panel: mipi-dbi-spi: add
 shineworld lh133k compatible
Message-ID: <20230615202021.GA1594065-robh@kernel.org>
References: <20230614123222.4167460-1-l.goehrs@pengutronix.de>
 <20230614123222.4167460-3-l.goehrs@pengutronix.de>
 <81007308-02dc-b1fb-f336-21bc25033c12@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81007308-02dc-b1fb-f336-21bc25033c12@tronnes.org>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 12:35:25PM +0200, Noralf Trønnes wrote:
> 
> 
> On 6/14/23 14:32, Leonard Göhrs wrote:
> > The Shineworld LH133K is a 1.3" 240x240px RGB LCD with a MIPI DBI
> > compatible SPI interface.
> > The initialization procedure is quite basic with the exception of
> > requiring inverted colors.
> > A basic mipi-dbi-cmd[1] script to get the display running thus looks
> > like this:
> > 
> >     $ cat shineworld,lh133k.txt
> >     command 0x11 # exit sleep mode
> >     delay 120
> > 
> >     # The display seems to require display color inversion, so enable it.
> >     command 0x21 # INVON
> > 
> >     # Enable normal display mode (in contrast to partial display mode).
> >     command 0x13 # NORON
> >     command 0x29 # MIPI_DCS_SET_DISPLAY_ON
> > 
> >     $ mipi-dbi-cmd shineworld,lh133k.bin shineworld,lh133k.txt
> > 
> > [1]: https://github.com/notro/panel-mipi-dbi
> > 
> > Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> 
> Normally I would take this trough drm-misc-next but -rc6 is the cutoff
> so if I do that it won't make it to 6.5. If the other patches make it to
> 6.5 the dtb checks will fail. I'm okay with the patches going through
> another tree if that's preferred. Let me know if I should apply the
> mipi-dbi-spi patches.

I've applied patches 1, 2, and 3. The netdev folks should pick up the 
other bindings.

Rob
