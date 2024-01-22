Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA34836E62
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 18:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D524810ED73;
	Mon, 22 Jan 2024 17:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787310ED73
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 17:51:35 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-337b8da1f49so3109364f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 09:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705945834; x=1706550634; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sYGuiuUN/VCPpW9oWOQ4p73+grZOykVwihNpjjDuv0Q=;
 b=xofAnwLSgh3tw/yQOmzbQjWfTMLIgmeBlKUhAWIYqmt8CRPwY9OJUxUryBGVhGbkdg
 PQ8PwvGDz56VPYkuhF+K+ObLlWQQavNMTesgb4cGQnL3Z7vhdhWkHA7VzfpZoIgKfv4n
 oeXxBxjMHpK5Zova4LF66Yv1Kc+QStbtjs6+zGoCEAi3uhffMQbyr/HppzkAN0NYQbAD
 Qc0vBAEehwMVBYtIfNKVzq8mC4Kwrx6pveGKJXXCiqaLUj23Pce5Rahvyu2PsN/wtNoU
 Ay7HcLF+ZIljhoA/PFcsQ8CY/YPk7T1TlMyEp0I/oAAmME7c8MTwmB6GgFRD5aJtZpq5
 +PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705945834; x=1706550634;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sYGuiuUN/VCPpW9oWOQ4p73+grZOykVwihNpjjDuv0Q=;
 b=EIda+9PFP4tSin1UoTK4EhXqU773Ceitp2JJ3u0U8ld9D/vFEcIYNRFX2ViRZBchgQ
 6Q6FZblGQ9sG2aUY6odf2efLdou0dk7lFADIjoSX5FAoo/hclf++lKyKW45tqsZ2f1mZ
 123Ki0iQ63VVhK1D/vJ9S8ywlzRo30tfvkHDb/H/cSRqd21v7iabnL2C0c1lD+AHtO+o
 PaGQ9ord8YKVMQ7enHKS28QNrygdRUyA3Ahzm5iFvkuEwLWSJ2DvGjOBP8W0yjqZKYew
 5eMnUlDrWN9hHhPNb0WG12h1D22x8w/xjkQ3QNkIXOidJCdRRiGm+AspJfPF6RpdN4ts
 2/UA==
X-Gm-Message-State: AOJu0Yypb9LRjjN8iLMb2PBZdtL0zjJjbFSWGTKvOptFJEDSX8AeJvZ8
 B/H8WPn3vL/1AW2QSX8eLC06FtNVrGSEUEFFWWuq6fXzDVkmrKcwhczvK/IrFmc=
X-Google-Smtp-Source: AGHT+IGMKjXfBPPqRjfBziR7QI5pQ0EzWnQZly3+fsLmJWUOsG/MDJPaYvuxqQs8u+NniIHlytAXNQ==
X-Received: by 2002:adf:a199:0:b0:337:bdf2:26fe with SMTP id
 u25-20020adfa199000000b00337bdf226femr2086857wru.161.1705945834114; 
 Mon, 22 Jan 2024 09:50:34 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a5d6a8f000000b00336898daceasm11996072wru.96.2024.01.22.09.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 09:50:33 -0800 (PST)
Date: Mon, 22 Jan 2024 17:50:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240122175031.GC8815@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240122165011.GA8815@aspen.lan> <23373359.6Emhk5qWAg@radijator>
 <3603320.R56niFO833@radijator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3603320.R56niFO833@radijator>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 06:26:04PM +0100, Duje Mihanović wrote:
> On Monday, January 22, 2024 5:57:53 PM CET Duje Mihanović wrote:
> > On Monday, January 22, 2024 5:50:11 PM CET Daniel Thompson wrote:
> > > AFAICT nothing will inhibit setting GPIOLIB so allyes- and allmodconfig
> > > builds will always end up with GPIOLIB enabled. If we are happy to
> > > select it then I think that is enough!
> >
> > In that case I guess I'll just make it select GPIOLIB.
>
> Nevermind that, it'll have to be 'depends on' after all:
>
> drivers/gpio/Kconfig:6:error: recursive dependency detected!
> drivers/gpio/Kconfig:6: symbol GPIOLIB is selected by LEDS_EXPRESSWIRE
> drivers/leds/Kconfig:184:       symbol LEDS_EXPRESSWIRE depends on NEW_LEDS

Can this dependency could be broken by declaring LEDS_EXPRESSWIRE at
the top (or bottom) of the KConfig file (it's an option without a UI
and does not need to be within the if NEW_LEDS block).

I'm aware this kind of change could provoke an argument about which
sub-system the expresswire code should live in... but I think it's
a worthwhile change anyway! We shouldn't need NEW_LEDS for this.


Daniel.
