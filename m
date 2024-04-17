Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7A8A8F70
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B467113877;
	Wed, 17 Apr 2024 23:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVMxAb//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFB1113877
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:36:29 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516d487659bso228313e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713396988; x=1714001788; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+aUpmgDVeLgvB2gSLG8XIN5pGL3HNCRw5PXYjYZlX2s=;
 b=sVMxAb//Iw/eDWdFkL4es6sPWpbUf9xjlpQT0he6WhoQnY01zGQHb2iwzN9OhtvkBf
 HUiV/cnOCZq+zOOZJ8jf716uauop/MaoyPyQTJN99aL9DSyl/XIoFwRMUpQxikVNt3I5
 3jP54Wxpf/PpU4aksoOENIUg4ysWedGZP1d/9MQ1+SL006hAwTQkXCqr4V9bLx/YwI8T
 2C3HYXVF9umBYCIiCv+/G6S3TxexVJpt9ubdNXPczI5P9uUNPJ9BSCt4doDUTZkiAdtA
 82qFg8ABOCRwe3YdvnS6cNOMIB/03eYeBwmlf0U4Oztpq7D0K3BZfPPYN2Hk1nP0Hb/i
 jZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713396988; x=1714001788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+aUpmgDVeLgvB2gSLG8XIN5pGL3HNCRw5PXYjYZlX2s=;
 b=R1dqPl/zHWLiUcEhxyPbAVvCIlHsb5bxYVuEO/kxQS7nfOsixZO4P9sEYLP9WxzFP+
 Uz0Et9J8GHa+Apnx0vhMQwhOhVc+mIN0JsLvnr4Mot9J+9+0Sw5fmJUTLOLMXBkW0IOu
 VZSXTYSfVKg5KB4QAAp8ZzpL7A684dV8OFAoey8BrlXmvugKYuLOqWEdSU95GUbysrRM
 hEElhPA8cMJvWC4gmFXyAdKdP1meuP3kQwK/PdalzQrru+eydrx5Ls2eWwOCXWhs1Tmy
 gs5ctN2vh+tsqIrAU+PtQnzr+jWIPulClUs/W64hsvVyjuLh/m2c8AUgxT+EOK0tI6U/
 oRng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMjXkjrxrG5DTG+89CQxnxsI6WiC3ZSzKHXHVjXmbNayq0yvsZeVkLVIWQF5EBkeVWQNn6XBATs18uBjujNl1S1OQDNmTbty0xtAMXBWK8
X-Gm-Message-State: AOJu0YzW2eb7mYlMB9tDIMNauGII1snSIiaciRxIsJNuyH0nOoh+tyBi
 /NXkAKVjfZawSEhoPKSs8mWU3Ms/f0r0FbrhrG1GxkMpwYFm1kTJjLXJ9eOsA1qY+g2Kg2ViS4L
 g
X-Google-Smtp-Source: AGHT+IERQ79ZpiSXTN99GLjWRAUeUxpJZ+H08cR71Lgik0OTCXPJvVrs/pYv2CJjCEnsG4k28u0TvA==
X-Received: by 2002:ac2:5234:0:b0:516:d0c0:3c5 with SMTP id
 i20-20020ac25234000000b00516d0c003c5mr348212lfl.24.1713396987745; 
 Wed, 17 Apr 2024 16:36:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 eq22-20020a056512489600b00515ce9f4a2bsm36470lfb.35.2024.04.17.16.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:36:27 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:36:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herman van Hazendonk <github.com@herrie.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] component: Support masters with no subcomponents
Message-ID: <4xywfprr7qkxpncmnhqjc3lrrcjbv46tsmlzz5yxvcr4xr2dnq@w57ni7u2hpvu>
References: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
 <CACRpkdbijfwYFhg2XigzVKoPDjU00K+arqaL_kP3FNxsS82gHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbijfwYFhg2XigzVKoPDjU00K+arqaL_kP3FNxsS82gHg@mail.gmail.com>
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

On Wed, Apr 17, 2024 at 01:39:16PM +0200, Linus Walleij wrote:
> Hi Herman,
> 
> thanks for your patch!
> 
> Do you actually have this working on real hardware? I never
> submitted this patch because I could not get the hardware
> working.
> 
> I was hoping for smarter people (Dmitry Baryshkov...) to step
> in and help out to actually make it work before submitting
> patches.

I have LVDS working on apq8064, but it requires fixes in the MMCC
driver, in the MDP4 driver and in DTS. I need to clean up them first
before even attempting to send them out. Also a PWM/LPG driver would
help as otherwise the power supply is quick to be overloaded by the
backlight.

Nevertheless, LVDS/LCDC-only MDP4 is a valid usecase, but it has to be
handled in the driver rather than in the core lib.

-- 
With best wishes
Dmitry
