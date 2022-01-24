Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E4497D72
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 11:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1A310E710;
	Mon, 24 Jan 2022 10:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D8110E710
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:53:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f17so12755550wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 02:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AWyFv6pGSlo5DklimzoRbZU1SIfMIBepmw9wE4YDVeo=;
 b=koQzdbfOEuh0RiAzV1r6d12nfvmRNGlCkk3husGtJd9DwCn4I26dh5I719KqzIQEru
 VxBafBluv7aRzZd/LjJ6MtQoyDQ550qXtjZYWLlYWBEf2x6RRDjrT54V29gpuFeXuYpn
 WXUleMGWssXxtZVRvIZxXDG2Rk8tC3J2LNIJQ80PqsVJFi2XYpb6yvFxbZsDoOrxWCGt
 Z8NG91onuecWNEUOmaqdAC0ZlFREXBPQHTGCyp6/UxmH7b427nGiXEmjKyJoAaXdGt71
 B0pFrHwJIs5/Kv4aVyyJ37n63ha+Yv5nTcEEF8aDWPLiRle6n4+KOwKj1rJ2+Us74VXu
 vaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AWyFv6pGSlo5DklimzoRbZU1SIfMIBepmw9wE4YDVeo=;
 b=TUyx5lzSgGyIQoq8bXpDZq6P6lkGX/k1BgzRCm1WfcAVzAgyyJRCZInL2/pnwne3Na
 5uBIO9iwg53OZ/bE76ijqVYJzJ78+6qYGa/tosesfEvOuqtfqdWrCEbtBQbrlQ+54Gu/
 /6gDoeJgij1VlUTik7baIUZwl2R+rZVOwY1FZFoaM+cZlJvhtXDadIHfh6FqrCe1ZW1c
 TbMWe/toheoJdw0slRVVV5N1lckg4DnrMxn2sL+f9kI8aEXKtjReuarYJWPJ8bKGNJWw
 uVn7oBKpM5GmON97fG6jR/qvQ3u1LKMyjljx/tM+8Kakglha0r9bnkx2Rt87c87+aUI3
 0hYw==
X-Gm-Message-State: AOAM530uxQw+GAOzU6nY2adt0ngJvp1BrT3bbW5SCLttOw69+SkjNhGe
 hjMnnB9od8ZuVAFSWdGtwQ2L/A==
X-Google-Smtp-Source: ABdhPJzJ0fM/5P4fiblE5AHsartrM9QQbDW+P9/ZhxZAzoai2fjsYFQvSzMoj4/VZN+WbA3fpvbaFg==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr13307344wrp.416.1643021596270; 
 Mon, 24 Jan 2022 02:53:16 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net.
 [86.15.223.86])
 by smtp.gmail.com with ESMTPSA id a1sm14343535wrf.42.2022.01.24.02.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:53:15 -0800 (PST)
Date: Mon, 24 Jan 2022 10:53:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Luiz Sampaio <sampaio.ime@gmail.com>
Subject: Re: [PATCH 24/31] video: backlight: changing LED_* from enum
 led_brightness to actual value
Message-ID: <Ye6FGUPJ7KH5gYdf@google.com>
References: <20220121170540.w6c4wqwrqzpde2lm@maple.lan>
 <20220121180948.2501-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220121180948.2501-1-sampaio.ime@gmail.com>
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
Cc: daniel.thompson@linaro.org, michael.hennerich@analog.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jan 2022, Luiz Sampaio wrote:

> Hello, Daniel
> 
> Thanks for your reply. This is one of my first patches, so I am still
> learning. This series of patches affects others subsystems too (hid,
> leds, sound etc). Should I create series for each subsystem
> separately, instead of creating one series for everyone?
> What do you mean by "this patch might wants to land in one tree"?

Can the individual patches be applied on their own without causing
issues (warnings/errors) with the build?  If so, they can be applied
separately via their associated subsystem trees.  If not, someone will
have to collect them all and take them via a single tree with Acks
from the other subsystem maintainers.

It's difficult to make that decision for ourselves since you didn't
share all of the patches with all of the maintainers.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
