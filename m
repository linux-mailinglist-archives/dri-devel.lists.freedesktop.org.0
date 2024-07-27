Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24693E027
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 18:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27E410E046;
	Sat, 27 Jul 2024 16:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jDLyqGtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1610E046
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 16:30:51 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5d5d0535396so603389eaf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722097851; x=1722702651; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pSZQAyMIRObm618hS6wHfoirqkRF5Nnp2L7TvwbLNbI=;
 b=jDLyqGtjILwC1uDNaJvr2KDve17s5Wf4kHz4U1FoWLj4gMXf7obn8buXG0XJSlSAHa
 DuC9hPPa2lbHfdZhPRbpaGGXJ33XIdOGPeSYcJ2gkgAD/xf3tj8UyxiD2SDeIOse2rZz
 ZFzRM4xHlW/zGB43xjAtvkxpybjxDgnBeQut9cZ2gHe+MAgSIk/5kddFf3nYQvflXqbC
 4tNlZylaJZrtjqvRcai6o3Yg13KKM3O+A35JiuoAby1H/LbNzMeQsEUIyWPevELiO3iB
 fmcZ1p7kGSTEmIoiOVnizUSyoEOSFsGSK8zQYIHLNSVi4JNrfROIfVi8X6CesHF4InIz
 zsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722097851; x=1722702651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSZQAyMIRObm618hS6wHfoirqkRF5Nnp2L7TvwbLNbI=;
 b=XLedCqFbphpxUVm7e1u/v7b3TD6JUxJQ3vy02DgJY22Lf+/it792MNyyEfcaLdP1Go
 nZ9U85eKGtBLzUeZ/Cvd35p/DB/eFHlqzhT0W/M02ZuSFIbeNUG+tVqWExLhMZbP4P14
 UKuyFb5VCfDnkI83vZcVKjxpRhqn7463Cm0YiyQDlDO9MGqIuS30pCzh5dHoajSN51n+
 +13BntXURI8akKoeYoyhregxL7tHZBUgX1SyRcTmqHKd9CLJdOsnOOKk1U1y2V3a7U3P
 ufZ9bvj614gWbRDYDo1XOJyEbBzjaSEmrSX+nRhXibL1jpEJO7Oh0N9YMonR/GH+U62J
 X8ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyqVWPcHKJGbm2PH0+rYcRxkea/8I6VRe67XB3VuqSZ+NB2MkiHtfLox+V2EOSXZgLvKg/H4zpZyUWre5uuNqjxtNlUZ5FN7Ta9p7uSqhF
X-Gm-Message-State: AOJu0Yy1ulPVGwML4IIv96+RaphJsJzcLdTmB3LmGO/8XjAQ54uAkVso
 Upfl8ALhH4gxJWOLcmYGN9T0y0b6UtSPKgmhsp3J3PyUFrCm5KFX
X-Google-Smtp-Source: AGHT+IEX+cctMy9+qbckneOibrEfIU1roDKKau6ih6elPcuSQOKlNgrpj2aZKDnI7HV7rLbOHmKljw==
X-Received: by 2002:a05:6358:f07:b0:1a4:8048:56df with SMTP id
 e5c5f4694b2df-1adc06ca0bcmr249912955d.22.1722097850909; 
 Sat, 27 Jul 2024 09:30:50 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f925de2sm30472186d6.64.2024.07.27.09.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 09:30:50 -0700 (PDT)
Date: Sat, 27 Jul 2024 12:30:48 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Message-ID: <7zpp4ebzj5xk3wbbpt7l5xnhqg3i52mdjhn3grmn562mres4k5@a3g2xxftk2td>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-2-lanzano.alex@gmail.com>
 <c7bf08aa-e7a0-4b60-b9fe-b43215ce3fb9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7bf08aa-e7a0-4b60-b9fe-b43215ce3fb9@kernel.org>
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

On Thu, Jul 25, 2024 at 08:17:01AM GMT, Krzysztof Kozlowski wrote:
> On 25/07/2024 02:47, Alex Lanzano wrote:
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sharp,ls010b7dh04
> > +      - sharp,ls011b7dh03
> > +      - sharp,ls012b7dd01
> > +      - sharp,ls013b7dh03
> > +      - sharp,ls013b7dh05
> > +      - sharp,ls018b7dh02
> > +      - sharp,ls027b7dh01
> > +      - sharp,ls027b7dh01a
> > +      - sharp,ls032b7dd02
> > +      - sharp,ls044q7dh01
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  spi-cs-high: true
> 
> You can drop it.
> 

This is a required property in order for the display to function correctly.
But I have no issues removing it if there's a better place to document it.

Best regards,
Alex
