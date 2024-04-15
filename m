Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F098A4FBD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02FC10F8CE;
	Mon, 15 Apr 2024 12:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n3HAd0ga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B0410F8CE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:53:37 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41882c16824so337285e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185616; x=1713790416; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
 b=n3HAd0gaIY2TZqtRDLKakXPtM/gTmNrdQeOY86TAxjBPxXfUGHbs/elB9z/yZF3MeT
 pNiaW1zxL9NXWvIogpxtwvRgxF9Q5Phpr2c1FR/MOVoRfhK2wgc6rfo47TuxTv0WpkyE
 b1LI7qyG7AZmTUlofGkiC450No60HH3KkAq2WdYjOC2bI78R9XlwjS3zEBVW/9KcRq7L
 Z5R87Q/J60pofBXKzW08E0O5odLyZnVo9NeYyTM/ezoCmbO9Ol3ayi6Q3mbybdTFRUs4
 liwAp30M98ARedD+c9pEzYZTLbwqRh3QNahh3JfzKLoPOH2ILefgXBmhAkm1Hn3mcMp0
 3Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185616; x=1713790416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
 b=laAxmYvwuvDVFmr5H3v/7gdQGIUpFkC0rznxByaYU2sLhT8sjrbr+XUykiRqyxd2ee
 Am2o9kf62+pBFis/DuNefCT3RDmmm2qIP+eH/TU/CDPmu8Vs214x7AMMaQ2+SniuxSlk
 yLyvzDs+K6YgzPK+LSl/FlBVdC9n70fLGKkUNiZ00bo6Mdw2wKuvi5SJaoVbSRv6q5dT
 JXHPpzmIjdTzWfU3AHSmeClS8w6TPr4YFYA4K2FBVMvGMRRpDJXABc5aKNypfS5lk1Wj
 mhFguHpjtwBXBAyZNF0z3KD7tyBXqB+vHp9tj+50uY7RaIF/xIFklqn/OGM63MjaLbWm
 6y8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3uC0o4GnvNP45SNM9lLwj3E/gFGMe2epkhiCRpgdVGT9ISkhRX0J7J0JNC3qZIrZf2UqQrbcHh0a5ABQ29thyd+L1hPTuuwncwwGBU5jc
X-Gm-Message-State: AOJu0YyXpzJNRFUquapZWR69GXMlFYe7zANFF6+nXuDHUGqqYWLygic0
 h3PJKN6etpBXtlpjQx0R0xPqkygwW5riaxGi8+S1/hn3c0/bcR6polnEsdU1PyI=
X-Google-Smtp-Source: AGHT+IEN14JC4aKAm6IoQEiJFrZ1mUtV2GIjZnWInAUAurGR00ImSNVfIpNW8YhhEhxbJzeTLcDKvw==
X-Received: by 2002:a05:600c:5114:b0:416:605b:584d with SMTP id
 o20-20020a05600c511400b00416605b584dmr7777987wms.3.1713185615753; 
 Mon, 15 Apr 2024 05:53:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bh11-20020a05600c3d0b00b004187e71bcd9sm681454wmb.30.2024.04.15.05.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:53:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:53:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 08/18] backlight: l4f00242t03: Constify lcd_ops
Message-ID: <20240415125333.GH222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-8-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-8-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:06PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
