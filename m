Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD82BDE591
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567E410E78D;
	Wed, 15 Oct 2025 11:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MMuosdNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B5410E784
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:57:37 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-6354a4b4871so7877421d50.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760529456; x=1761134256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieaWzRWGII3uqPa4WyCaS/MYjwfMUCH1mb2GlldqZ1k=;
 b=MMuosdNzHavTtoXUCb8cEmaYmcWibRcQbTp9KRfd2OYKxz3zOVrOvGavSswc7SYGHO
 4X3GnrxKJ5KtqXESZFLcDsj4blHpjtDDr0oBehAv2WYqLk9/OuNIR/W/B7az77ZlpJcd
 l/VlJk1D+ZNWupQddqM7Zc24XmC3QrKI9Y1Bi072ZR8D9fX96veCdvAzJhLk72p6kKCB
 1C879VqTwlGFkTg+YAOf0UnGbZH4usBH7wvjlnGO0RRiKi6H63tccT3/4l1QNIbGHl3D
 DGfmNaGr5HKZdNboyQ5B1IdsIA+WSTGmwYqPHO6cCoVsddmwOjpmYq0gEOCqeHsKzzmB
 qmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760529456; x=1761134256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieaWzRWGII3uqPa4WyCaS/MYjwfMUCH1mb2GlldqZ1k=;
 b=gDEkZ/f0ofzXz2BNPqtcx39QYOhCG+efgjd4AmGRax2Np1UzT2UjyJifSIgNpsPoqk
 LzE0clv9vz9Vk1qFqfblw5BCcKnNNqCIufO9/DnUaWlM8GBsL1kZLT/Bsm3KZjVhZSom
 f4H0lQ5cs13DpoFDQviSxJWHH8CjFfX5L3m7rt0224NNlFY/9uulRrzJB+cIm5dEkk2l
 0GV9nB8sYitBvHhRn3fEAJKoNjElKUXQlWYAS5th4YhxLzLQR8t/Tb4FmvGVlLz+1fWf
 TEb8AkDnLbsQ8wjtjn7P0nuii6MDc1CQhVNfw2gKr2GN7fB87hVajYMRcl4YH7cHYs9l
 UnhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6XyzTditMgxeNcRkfNRBBxRoMtoSdE8lKRh3P1ALFYH5XfvDreXWliw6zjvw6R0NOY5Z3O2SqRfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHNdaWq/GpV+67xIQtmLdCvYFxB1nrS819467VYmuZTeI90wdd
 YSmtNHqLbCaYFkp3M0z0Hs0i07ahMC9AGsfH/LUXPIW044rYz0d2gLW+lSv8XBM1QhOXtWF8OJL
 YTunQeFmPE7711dmDUgvl+37Hp24ucC8=
X-Gm-Gg: ASbGnctlcTw+33dXzvNeiL5p1P5vpoxFslpwnXh9FAL9RQtB9P2YuWZ8N9mGa7LNV8B
 /mhLv4R8arw2zwsTNQhntzZhWFfMMXe84uzhr0qCsyzgBowQLrzjnodED3COBXFkU9wJEu8z8Ip
 WjlGSauqaZFPXEDHkcj2ADl4/ZF1okHAfzIENbW7rWu4PNeJt93vUNaJX3Xo7SfZcCLL2k5mDX+
 ILt+QS4fsSvQMb9AMKKsE3HhA==
X-Google-Smtp-Source: AGHT+IFNe9SeQx840UU/MTW2ly7whPTiSlZ0Fatcdl+zHeGnhTcfrwo2zlexd/EV4UoupspsKkcGV6yrEL5HlrHNkQM=
X-Received: by 2002:a53:ceca:0:b0:63c:f5a7:3ff with SMTP id
 956f58d0204a3-63cf5a709f6mr9503871d50.67.1760529456518; Wed, 15 Oct 2025
 04:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-st7920-v3-0-4f89d656fa03@gmail.com>
 <20251006-st7920-v3-1-4f89d656fa03@gmail.com>
 <bf207d35-3ca9-40a2-807a-0dbb0d1504de@kernel.org>
In-Reply-To: <bf207d35-3ca9-40a2-807a-0dbb0d1504de@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 15 Oct 2025 13:57:25 +0200
X-Gm-Features: AS18NWDRb-G3sUnj4rnpU7SKnuODhp_u2ZhjVPW2nZFhRMfdfCfjUZN2mnbd71w
Message-ID: <CABdCQ=O-WSt9f_cbwUhRw1uy5a-P3-dEcJfcq8Y8thDAzVuS9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: sitronix,
 st7920: Add DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

El mar, 7 oct 2025 a las 11:12, Krzysztof Kozlowski
(<krzk@kernel.org>) escribi=C3=B3:
>
> On 07/10/2025 02:48, Iker Pedrosa wrote:
> > +
> > +properties:
> > +  compatible:
> > +    const: sitronix,st7920
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  spi-max-frequency:
> > +    maximum: 600000
> > +
>
> Datasheet I found on the web clearly stats you have at least VDD and XRES=
ET.
>
> Your binding is still not complete (and I asked...), while it should be
> complete (See writing bindings doc).

Thanks for the information. You're correct; I'll add the two suggested
properties, XRESET and VDD, to the binding. I'll also implement the
XRESET handling in the driver.

I missed the XRESET pin because my testing setup was working without
it. For VDD, it's currently connected to the RPi's 5V output.

While other Sitronix display bindings in the kernel don't currently
define a supply property (running "git grep -i supply
Documentation/devicetree/bindings/display/sitronix*" confirmed this),
I agree it should be included for a complete binding. I'll define it
as a fixed-regulator in my display DT node.

>
>
> Best regards,
> Krzysztof
