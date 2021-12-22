Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38EF47D092
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79A10E544;
	Wed, 22 Dec 2021 11:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ABA10E544
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:13:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso2157945wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DGipiHp1dIs1kPPtmTbLZRl22a1nYVdRac1K8tE6rBA=;
 b=QcR/y3ZwpHfN4gNWKrz9BvGpuEVg78TYqXWw0lQwPjyYFafuag/+R5ZJVNbuKu+985
 2BKxn3tUT201fUsvqrvngR+HIJISXdiX8RkzL02jYcGY56bgDAZ5CxbKEg10mg3UpmA4
 DIjXrubi7Oe7jdKtPHYTWyQH5upvZPgATVEUAyskBopZ9sbn4XVQkH58/3eRpezAs8Rp
 mfXBVdQtxftepK9EGkdEIfF6rFGShXVA6s99ENjN9GzemWoQyX9kyp8wbAOLh8wzdpNo
 Kr+hpMW0dPio6EBlyLgdzZNj2XINdhK/V6ih4oukxLUpE7ZJ2kLpK3Zla3p9SgsFBAvL
 6lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DGipiHp1dIs1kPPtmTbLZRl22a1nYVdRac1K8tE6rBA=;
 b=I8Pe6H8EdZ6XAILCE2OKj7nYHKGNR4vOcJ45ZVTIm7H+62BjxsL+YG+G0MeQ4xAzXR
 NyFPnkrSqYbjLryMK5KxDvrbVEvE+1/P/viMiKOdBs4CS29oR7R7OfspeTSxpkCi0FX8
 O8c2aPowWjvj/URA1DVvLMcOyPzL6Ik1TnqCGMD0VmS4S8R8qq3l9C7XZzht02NP+vD1
 g0h/0Bt9YJwVoCLrOAY1DAsYcokRvRmLoYcNS0BGAqOZrM741o+Dh15bP9RNQdYMR3UK
 Y73BmGspOStRFW03e037rdCs+8bVHv1GgBJL8bCA1ANnWZq5Kup8IzsBnUNVfnQh9m3k
 kqmQ==
X-Gm-Message-State: AOAM5309aqi08Eoo0kNPKWAV5dJ/OL4VYJ/wVPSBVbox2kMi+KRE7T0C
 3Qatz+an6YuXMc2CC/8d6t0CXA==
X-Google-Smtp-Source: ABdhPJzt9PwMM7/bA80ZynZIswm6UDaMmNQRRGkgVsd7FGmmrG3zlaVQDMskTcVW7MU4iOIjy+gLTA==
X-Received: by 2002:a05:600c:40d6:: with SMTP id
 m22mr579448wmh.163.1640171625022; 
 Wed, 22 Dec 2021 03:13:45 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id h19sm1415043wmm.13.2021.12.22.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:13:44 -0800 (PST)
Date: Wed, 22 Dec 2021 11:13:42 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/3] backlight: lp855x: Add dev helper variable to
 lp855x_probe()
Message-ID: <YcMIZgofh7Z/X5qQ@google.com>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102225504.18920-2-hdegoede@redhat.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Nov 2021, Hans de Goede wrote:

> Add a dev local variable to the lp855x_probe(), to replace "&cl->dev"
> and "lp->dev" in various places.
> 
> Also switch to dev_err_probe() in one case which takes care of not
> printing -EPROBE_DEFER errors for us.
> 
> This is mostly a preparation for adding ACPI enumeration support which
> will use the new "dev" variable more.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/video/backlight/lp855x_bl.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
