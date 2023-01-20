Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7F675CA4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217BE10EABE;
	Fri, 20 Jan 2023 18:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F99C10EA8D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:29:43 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id o13so5953905pjg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ul3iDoMJbnRKpRfKhk81+1OwaFEBot8AK23yaBuGdK8=;
 b=hgL85ZaqP6xkBJhm4n/1oiRGWuBvACMT8oRk+Q7oJCI0EF/XpXS70egr7zANYUa69x
 vMW5Gv2HuX8FvBE7WTogZzUcVE8K9bC5f0m4D+SMMBfepJHm3Y2AD95bm2ngUR7bkEl0
 d0V1PQA9rJJ2YOU8C2DGYCoiFBItUBzrbxm0GpVp9zF1RZ29lx9g+6C07t4UXo8HfeGY
 wlwB+xWRueVtazh1OpNN7cAu6CsNCJ37Sj8ZAQbgGFkYbCywugACAisc7/H6ihoXVr6C
 g4vxbP30dhabfcvGMMhw3UPuWtlrusNSmIFcRg2TLSrSufG6fm2SOKS6DFjqeSYuUCxu
 eXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ul3iDoMJbnRKpRfKhk81+1OwaFEBot8AK23yaBuGdK8=;
 b=AQMPIoc9w9KZkWBdGoU41kD6nJNmeVclrMFBT/zZ6GCIUW2B2HW1hxHLMdMcBuRwBE
 Rw20x+IKr9fRF98Cu7U8i/Q/Hym6yyRxVXgIEYFnjWMkTK98QSh61B5wEjumgeGyM9dA
 7pertvAMCTzVqCz/FMmRDreSi3QKu3YRMfWDKFHKEgYaEB4yW89Hxvoi3QO0fVa+h2PO
 dRiRmu6mxjha3ZGJo8P1f356y3yWeq4TQyuoCPLoU2I/8WBHaPQ8L+aU5iWDEPQilcMZ
 EcpRpL6gS1p+aWjqZHfnCL2HXqNnpGP0Zk9LxDhREihfuIDTPXqDbf1bv1kkud74DXH2
 J2nQ==
X-Gm-Message-State: AFqh2kqJcKUW7be/QjpplXHTu44JTIT+IX+S6IGcsItimTeuuN8GYCUf
 NlVTLJIaMtqgDbdBoUXc1nKgsjZQY58=
X-Google-Smtp-Source: AMrXdXumMAZRnOcjUhzgN86mucVy1/T6eUZElVp1f89wmzB5tY/SeqFKOTVGUyj572QsW9U8f9n/Ag==
X-Received: by 2002:a05:6a21:170f:b0:af:9dda:b033 with SMTP id
 nv15-20020a056a21170f00b000af9ddab033mr16021707pzb.37.1674228582783; 
 Fri, 20 Jan 2023 07:29:42 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a634812000000b00478162d9923sm10458730pga.13.2023.01.20.07.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:29:42 -0800 (PST)
Date: Fri, 20 Jan 2023 23:29:34 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y8qzXpNV5dA0UnFs@Gentoo>
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
> 
Yes, I have sent a v8 patch to add it.
Thanks for reply.
> 
> Daniel.
