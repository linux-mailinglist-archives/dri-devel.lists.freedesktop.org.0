Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB283AFBE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 18:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F49510F78D;
	Wed, 24 Jan 2024 17:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF0610F78D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:26:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40ec048e0c1so16647535e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706117110; x=1706721910; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fQP8/M1QomdvhevshrbbyC+G3774Cm3toGMmsbZ5S08=;
 b=vV/+hzymvOx8Xzn0bQn/uQ/yMVQaLghfCOC1DAevcF2XIraLf5HF2exohU+5rvSXP3
 fyOrM+A4SoFkZ638pva0CgBVpgkAjllWyGsNN52EQH+E1ht76Q4YaxJWNAJEMHMstYul
 c9Pd9AJiDcLGvn6ygILf+C8MLGytE0e69Cw61SHWiFGrlBFczq3gizmtQ6fR9Y8VdI1L
 M9sPYn2WOFuTjieAyEgmle+miG4Ab+UEd8ssntOz3+IdFZFL6leAl161+QKycx6fdVte
 plS2mrgAtqkhk7XNsoPPsVQRD/0aSt+zCCRsPAcSokohnm1HDZX97GdSiGySbGtqCJPA
 XqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706117110; x=1706721910;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQP8/M1QomdvhevshrbbyC+G3774Cm3toGMmsbZ5S08=;
 b=ksyEiOUxexHDyBXAbevgaycGKJ8Xs+aOxqzw25PgjHCkjOiD/U/ipwNzz6z7Wr44N6
 29J7A9cUo1qXTB9zTR5q3u32xbVaChViNWe9I8Y4zdmCW7BAxpp2fIbD3ZZAcuyeGPir
 P10bEzi8XEsO83wIKJpb1hxtseiU2MMQX4B2jw9WlC/kU8FaevaG83n8+vx+JigP+zP0
 4Kkyfx7oyU2A33wZejO0Grb18lc3oHqWys/QsTNq9l/poqO/35q0fE2qfV1Rp+KGHbap
 wB7sPCz4epkMxDYJikpi6tGIUgP5SaIZNE7x+wagpas7heMeZjP6ENJT202J9C4iHIS4
 BaMA==
X-Gm-Message-State: AOJu0YzVyHvz5pQovN9ptTdaeXDxXtYGBcj8WDbhobU+HcThvdavuKot
 6UOqTako9s7QWnsyIfgTd27F/wYjZp2zAF4mE6uQH3Ospt8zGPGQfgq+fgiwk4k=
X-Google-Smtp-Source: AGHT+IHtZmUsImHUN6vx4IajyMpk1NjS/10baW8IunEC4zx4kdLeWpbSforzB18JvfYxa35SxlP9Hw==
X-Received: by 2002:a05:600c:470a:b0:40e:7516:2c7b with SMTP id
 v10-20020a05600c470a00b0040e75162c7bmr1904703wmo.38.1706117109977; 
 Wed, 24 Jan 2024 09:25:09 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 fc6-20020a05600c524600b0040d53588d94sm285281wmb.46.2024.01.24.09.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:25:09 -0800 (PST)
Date: Wed, 24 Jan 2024 17:25:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 4/4] backlight: hx8357: Utilise temporary variable for
 struct device
Message-ID: <20240124172507.GA16024@aspen.lan>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114152759.1040563-5-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 14, 2024 at 05:25:11PM +0200, Andy Shevchenko wrote:
> We have a temporary variable to keep pointer to struct device.
> Utilise it inside the ->probe() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
