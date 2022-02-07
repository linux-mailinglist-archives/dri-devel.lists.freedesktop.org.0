Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A04AB77D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823310EDF9;
	Mon,  7 Feb 2022 09:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F510EDF9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 09:31:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s10so20972601wra.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 01:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=e71qr5cQmHNfaTvqFdZSatwMnOkMecpoZmeynQAfXfU=;
 b=IipD0Md8PLGqTRc8YbhUGW9RZUZYMQMHks4wT414D4MJkTvXaIaxCLgX7q7EqqZkkE
 RniraUcxZGQqnV/BLhI8fR3OhKUqDYUBLkiKkwsuJN/ZNCuhQa9etjVpPPbBQ9jyOrwx
 MGb+BBECiHqPAOCpL/b5+NFypnEjgPgL0Rb5qKUiTSwuyDcdtYMjQxjnCr4gVMsnv1db
 4Li8Ccoityy3n7nCqgyhw562KdbA+9+AlCO3h6k33jebIUk0d7GU1cLOM5H73yN+w4Xf
 YMhAHQA5StGpYsrAUVc3HUB89o5DXP0IdN5Syh15D5UZS0wH6QYVpbsbWtyqGxNwNZ4L
 OgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=e71qr5cQmHNfaTvqFdZSatwMnOkMecpoZmeynQAfXfU=;
 b=PBRb3NbKDjX02Iu9OkxXmso0Q+EOxHs5Xww5UGMN0HR9R+xk1nN+5sRhaw5pjTKI4M
 OLts9fWRRPsjFVwKFJxMMzFT1BEu9coa7knAjsYi1tSxnIRFtkCM8QatvudbO6c1IrZb
 EvS4J2ILjNw70btgvAULAWbFe640lqzP1Dz2uNtGhK715SGc7Wt7sy7SMlUkFTUlTCjs
 lYI9c3mBQiznC+tOtORbof9KurvAn402xP49dGvAuo0S5Ir9L5el0JaOSECS7ZPFtM4i
 II8dLF8G94Oomf+HbVdR+jDtD8L9qNW5SeuFXU7SlUlyqDRxiTf+3vPiM7Yz8M4i0qZn
 gzWA==
X-Gm-Message-State: AOAM532sRHdtuxPnByCJnSAc+NMVq4fmRl3GjYJR17cx2gcmLottiz1z
 d7oQuFcSSsCyiU4KO0m8kIiqpw==
X-Google-Smtp-Source: ABdhPJxyfEhDPaQTrpIwF3s8f+P5EuB6O3syjtuhYC4gv/uXtG6GnEb8OsVA43hN5ymF4KDaQpvKuQ==
X-Received: by 2002:a05:6000:385:: with SMTP id
 u5mr3350003wrf.105.1644226262555; 
 Mon, 07 Feb 2022 01:31:02 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id n15sm10497806wrf.37.2022.02.07.01.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 01:31:01 -0800 (PST)
Date: Mon, 7 Feb 2022 09:31:00 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid open coded arithmetic in memory
 allocation
Message-ID: <YgDm1FWtlneMLCTS@google.com>
References: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
 <20220207080128.xmvommcddjfgz7ey@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220207080128.xmvommcddjfgz7ey@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Feb 2022, Uwe Kleine-König wrote:

> On Sat, Feb 05, 2022 at 08:40:48AM +0100, Christophe JAILLET wrote:
> > kmalloc_array()/kcalloc() should be used to avoid potential overflow when
> > a multiplication is needed to compute the size of the requested memory.
> > 
> > So turn a kzalloc()+explicit size computation into an equivalent kcalloc().
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> LGTM
> 
> Acked-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Thanks
> Uwe

I am totally confused!

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
