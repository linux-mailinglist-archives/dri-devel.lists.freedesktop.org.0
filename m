Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248AA7D0EB9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 13:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC8210E59B;
	Fri, 20 Oct 2023 11:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7152710E59B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 11:39:10 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507ad511315so1014030e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697801948; x=1698406748; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2WtnH3GQyjT74OubLFkdV/2dzKu0b/S7PutMK10lcQU=;
 b=CMuP03jIb3FcfLYBPol80Xkfm1pDGHdUkYxZImAU63KXELi9wKvah9KXIVr8cCaVs6
 yp+Dm2WEEEY7WCFaQTxXeaHRMZqAyZa1sVN1byYIzni6OWxrF+0n81Rt7PiLvE1CQukZ
 J9kTKJUZSffZtmIA9IawDXHtJPghdi5chbDAPOwO8d7NVZQG7D+hlebL9lVDEHKgKBfH
 Y0W0qTw6sqNLXfSM6y06zX4+ijF+G726LfZZB638/AGd3kVjKhmD3a/T+uiuxevOFE6K
 ZDHvj535NIEJVTY4vn9/AiFoARvUmkI049VmI0lDR57PuuWf4mttfJQfGDsl5gQgz1SO
 KsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697801948; x=1698406748;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WtnH3GQyjT74OubLFkdV/2dzKu0b/S7PutMK10lcQU=;
 b=bGd4kI0qof/FyV5PopYdVguSYp2vuPW0iTyOK4xGtfRP8frSuUD/av0vEY+zSP56OG
 tGzwLoH52OydPlYoK1lFSELhOX/wIMmZScjS3G2yMdLW9uzXBHFeEWLFp//lInzIxC2j
 eTygwzKlXyqXNE3JIxrw3nEHbdwEAQabwd2yBvkLSK7tuJzrhF+O4XhYYz8GiBIngXK+
 ixBRqgGzs5wWUmeZSiMuuufDBdFKqZgb091OR0Bkzneo+AYEjT+odmmydKuS8CbzWz4a
 2XOHLlT4u5ZtDmGDV7aalAWK0JFsF9Ad1pN1CmT/mlbkCsevcKMu6BK4JKCY1eHg+HSB
 SSBA==
X-Gm-Message-State: AOJu0Yz6YbkFjH5lHW0PEIv7hfBRSLBmb3gdPaBTYlONuaX02N52tkC6
 nsb7Y5hnqU8+CehrYaoWY64o2w==
X-Google-Smtp-Source: AGHT+IE5vdkgiq8uujLaMC49APLfLYDElAYjCcQESBWGYijPclE/B321c3SVW8uhvAm4k0EO83YpbA==
X-Received: by 2002:a05:6512:2815:b0:503:3447:b704 with SMTP id
 cf21-20020a056512281500b005033447b704mr1391724lfb.0.1697801948639; 
 Fri, 20 Oct 2023 04:39:08 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f7-20020adff587000000b0031fb91f23e9sm1499714wro.43.2023.10.20.04.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 04:39:08 -0700 (PDT)
Date: Fri, 20 Oct 2023 14:39:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ville.syrjala@linux.intel.com
Subject: Re: [bug report] drm: Warn about negative sizes when calculating
 scale factor
Message-ID: <2ad54714-b1b2-4454-95d4-c46fae4c9404@kadam.mountain>
References: <c7f0fd2f-a48d-4120-9291-a0cc58faadce@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7f0fd2f-a48d-4120-9291-a0cc58faadce@moroto.mountain>
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
Cc: Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
 kv-team <kv-team@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 05:17:42PM +0300, Dan Carpenter wrote:
> drivers/gpu/drm/drm_rect.c
>    134  static int drm_calc_scale(int src, int dst)
>    135  {
>    136          int scale = 0;
>    137  
>    138          if (WARN_ON(src < 0 || dst < 0))
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> These days, with automated fuzz testing, this WARN_ON() is problematic.
> WARN() is considered a kernel bug, and pr_warn() is the hip new way to
> alert the user about issues.

Btw, a lot of people (Greg claims it's the majority of Linux users)
these days have run kernels with panic on warn enabled so that's another
reason to avoid using WARN_ON() for stuff that it known to be possible.

regards,
dan carpenter

