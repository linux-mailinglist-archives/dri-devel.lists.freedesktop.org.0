Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1B9FDD57
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 05:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37F610E264;
	Sun, 29 Dec 2024 04:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t5Gm8N1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0778910E264
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 04:51:52 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso94654081fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 20:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735447850; x=1736052650; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/vkoVwSLPI1coIX/JA0W8yclcKQGo59oXgI/Yfces/4=;
 b=t5Gm8N1rcXjbqncz23HPxFR3S0DWXz/+YlSvqHwVdNpLeiUcd0Zbo8FoImqqxzENWP
 SyY+QbGJEJQKepv6AGOGWGNOhcQqD7BrzPis7g7qgF4On330kHk5eTSLJdfIVkRGO1dj
 oF+0wpPWU8y+B8BQPLgckGT0VhKV7GBaNnSW+ixjl6NCyZpXq1ue5xnWrvYFherpz5Bl
 2qKoAyGn1nwGrvJPa4sDyUu8Iis7MZPY0rGDEQ0pupREQfIirYZSZkkpVah+rIs6b+un
 WK8xZi+gW7m5OrGr8bkzNgadG3UAy5lL1WZxEL8nm2EpmCBiS2McLbYWR4fucyqaJGxM
 ZpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735447850; x=1736052650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/vkoVwSLPI1coIX/JA0W8yclcKQGo59oXgI/Yfces/4=;
 b=HFCVkfhCJNIT5Otl1IEdZXOy+Z4/rqU0f54824+iYV0qU871DHVMibPBCtsqlPBPPi
 iqpOEwbJ+eIdr99K8Lix7Hkv/BDXpuHlzNbVhlYX4FPaXBxSWBsBtZ/aI/vyIKdgod7C
 MUX0oG7De0+LH8Vq9TxYmcGzTlWojNhFq/JU+bMAKxrUxoPNnX/Te9lcgXk0oJfsp0DP
 qIhWK8Colp1pxFqQ6x1JBDLHYIPJw0hlC0GDKGavK6JaRzD4LNuJYPG/HwLpqOG5AScF
 OOA+8X2NC9qnEvhs2G1Sx/CAegzPQu2gMswMzc1rXGFJZubueMHFSrP6z/QdO9PDr0Pb
 x8kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhHSh1ReiWqWvCuYPb9KOsdrmQm1pK02v8eWezbb4QlmmmvDDbyQo4bPqqfnObDMZXYXy145Ek3vE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+nhwxYKDp4FFVauSg82D4CP3pLAlnJiUee2LJu8rJLR4kNNQ3
 ARfPciIPq9Ik8V+JqosgjCRLb9ckOt5tnDfAFVn+e7JoqXOIAo46QcwPbcoIaLA=
X-Gm-Gg: ASbGncummDl8g9/ZBdUSPUUA8oP/Z5LTZp4paGpY7EAyFZd74Le1Y+xBkjNfNAFZk0U
 /fV3Rp1HTGdGWJNxirCLNmWbBNRugZwRV4jOkXrUO3/0Xwa+JgcFz/96qbGdFZpycrb+ICgZoVu
 zo1q71kUsmcPvtsmIHUR5cJ9vmoqKLzg98Dq5DP25JLQ1LTJuCMuYAtJbtPL8OalGA3yt1AdUKA
 Uv7Cf8gbL7FEngSpco/M3axivJ+vEJ2B+IXFOt48yZ0zXzsijkW52XahGEPbFgH9URPCH3wt21z
 UchyuZAyEdGNfTuHI3PcjYqBlUcALFvDpJJC
X-Google-Smtp-Source: AGHT+IEsNXGZt2QOXuXj9OJSqWCxJoh9IxQNwSFDjV5JTFWQrndLXIX8JMTwPgrw564c1ha9VHBhRw==
X-Received: by 2002:a05:6512:1114:b0:540:2567:469b with SMTP id
 2adb3069b0e04-54229533e5amr11323899e87.16.1735447850491; 
 Sat, 28 Dec 2024 20:50:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542236024c7sm2833143e87.110.2024.12.28.20.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 20:50:49 -0800 (PST)
Date: Sun, 29 Dec 2024 06:50:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 deller@gmx.de, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Message-ID: <gugwtvw6qqknstlscr4hxfrvcgfa4gfwwgxdosr24mf7huk433@oh7axkbesrjs>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
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

On Thu, Dec 26, 2024 at 02:27:45AM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This set removes a bunch of functions in ipu-v3 that
> have been unused for a long time (since 2012-2017).
> 
>   No changes to functions are made, just full deletions.
> 
>   Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 


For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
