Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE81675C9B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD1C10E396;
	Fri, 20 Jan 2023 18:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531F10E375
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:36:12 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id v23so5661649plo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hzUIXogxNC2LuEDM1xVMXzkSxiYCr1nrc0O00OgWk8k=;
 b=TB16WPJZIflVsi0zlcQbnuKOCknFMT8RnyBgg1qnTo7yKx8+N6YVICzxScP5HQODuG
 o0eessBo5utL6uBJMcEE8XKEGpkxosLrMulIVZX09YaUtQHl4w6wmrUSlXxz3iU4+Zxe
 ISBYxLEBaehrPsRVwi55gOmxOHQLK/lX/FbjKXCIa3sEANyJOcfLqld7dNgPwPpP/Tsq
 OTE00csLFsU8hBJxIuiUOd2C55aJW8zZGmbXX8RfjH9xHL1oUhxtrHg8NtW4+w2F8GKN
 AebrekO+YNbH1Vr2HfA8XDBGXBtGy+e+5LW8KTi9y3Hd4FnmWCGOvXHY1pLr/84Urbi9
 wTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzUIXogxNC2LuEDM1xVMXzkSxiYCr1nrc0O00OgWk8k=;
 b=n3l8UEtMm/N+xLJOsfiUyu+FJRSEKA//ZU585AeSSekfFnHxgbhwU0y0kQSoStFAu8
 KCgTK3cp+pmdWJreUOAm5pMWv5b82OOWTvfZ3Rz9IeK00ym8GmowGcZZR/oTofawPTc1
 hgCiXXCLjoKJ9VZ9nAt6aw+M4idfarJoAI34cd04tCdOG1nzu/7z9Gb1ORzvSJ6Frave
 Zf6M7vBgQgG0jUfotIdOVipaSNQe2ZVNXjHVM+Ige60CWsbmiMJppcxJH6xPTxtTL+BD
 wrA03YUVS7MEbuYHV5/grWm7UnQM790ypMLTDbtUEXa6NvcsfQfrS93jbsf55jmtx4RR
 MCyQ==
X-Gm-Message-State: AFqh2kqXaPFIRYw/41HIVKFjFNkwx4oNoJ+hY71d/EC8a2ek91032YMf
 irLqzeLHbRke8tzUYogFmA7/c4q/RHE=
X-Google-Smtp-Source: AMrXdXvUg47NBubgdHUZ0ryXUX+qmjm+8K5V5RITNIEGsc94Qke9sNDv48/IGVW725kOihcfqngJ2g==
X-Received: by 2002:a17:902:ce82:b0:194:84ef:5f9c with SMTP id
 f2-20020a170902ce8200b0019484ef5f9cmr36426713plg.29.1674228971827; 
 Fri, 20 Jan 2023 07:36:11 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902714800b00192721d4f2dsm2866134plm.82.2023.01.20.07.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:36:11 -0800 (PST)
Date: Fri, 20 Jan 2023 23:36:04 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y8q05Cz+y2Zio//t@Gentoo>
References: <20230120094728.19967-1-lujianhua000@gmail.com>
 <Y8qxofrfiQbRmsGZ@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8qxofrfiQbRmsGZ@aspen.lan>
X-Mailman-Approved-At: Fri, 20 Jan 2023 18:19:29 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 03:22:09PM +0000, Daniel Thompson wrote:
> On Fri, Jan 20, 2023 at 05:47:27PM +0800, Jianhua Lu wrote:
> > Add Kinetic KTZ8866 backlight binding documentation.
> >
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > [...]
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > new file mode 100644
> > index 000000000000..b1d0ade0dfb6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > @@ -0,0 +1,74 @@
> > [...]
> > +  current-ramping-time-ms:
> > +    description: LED current ramping time in milliseconds.
> > +    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]
> 
> This doesn't look like it goes low enough (wasn't there a value lower
> than 2?).
Sorry, I sent a wrong message, it isn't be fixed in v8,
I send a v9 patch to add it.
> 
> 
> Daniel.
