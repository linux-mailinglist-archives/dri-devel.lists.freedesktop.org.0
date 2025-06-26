Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9C3AEA4DD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 20:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA7710E8E6;
	Thu, 26 Jun 2025 18:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LfPztbur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1712710E8E6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 18:02:38 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-6065251725bso984875eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 11:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750960957; x=1751565757; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FuBXeZYcaGZJ+A3VKNOAHUUuR6YcnbhEEbsYOpI28oY=;
 b=LfPztburASdDVZ75Ukr5IPT6llNJRj2zrk/ZHv70/GzdRqDDTl/3WHnc3OdmRjW6pC
 jfWzV+PO75RBzAB5sUtxr4OOs5yj8egNWyXTLjZTSBlNSM9A/PYYOzLXtF5EHsyIbF0W
 FSWGu3LsIhdorNYx/1QglQzP8KwkZ+uQ/l4m8OXilFwNsMpZb75wJ6Ast5ai4Lxj0dXQ
 /IwsR6RLiPvX57x0NPAMhaa+rQvXltYR/DSuckXbdOhTJNdeUaV7BDWyzD+2PevFNrf4
 1kvJ2IxVhw48iWDA0FjWaKB4xYeVYiuernBjCLNnHyStkjKTghz77vmVpkVguW6YC31i
 4aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750960957; x=1751565757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FuBXeZYcaGZJ+A3VKNOAHUUuR6YcnbhEEbsYOpI28oY=;
 b=qWO2kqQ8C719KvC4JsKaQv02ymBB9V2CB/NUF/7sCZJIGN6eS5bxRzKbhUpX2O+M2V
 B1LCxvd3aH0fskDM8qAc7OK8tTFwrN/TJjO8Pd00zjh0+uo1E4aX0/FQzmB78KvwIxyY
 XxPv+98EehCkiaVh1cwXs2afx/bvbIJPJEharvNfEiBobTHFfkcPJkzpLv6+P5N/D6q+
 /jc9YDO67iTBBZuhaMtNewrK1YNK9wpQsXUz0joy9xuhm9viN166vSlVC3oC3vTe6l+G
 Lt1riYF/HgK9qZ+qcPFpXmwOgK1rRP6S2/OzizFdTx6hZW5xQBlmba+2S2V6hp0w+QIt
 +Abw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV71xSi6Q4SuMIsM0ITMNU8Py8YrhsOOsA96zsrs3aO0XdIjqgmlhG+RksDMr2lABbqtssNsOyKXkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXc2PGUfZ531r7SnHq7Q6GKHRC1LJzZ8HiAgVFohzPw7cRnJhR
 s22tdpAUVwMFV5crQVGJgIcwhCFX5iaEG6fUIMnFFQyailFHzZndqZiiyTAQY2VVluY=
X-Gm-Gg: ASbGncsbKym3KelYeghsgLOhHGEQa6PzERnLKN/dI9y6cs9GiCUQW0cqEy5ayyK9Rov
 ou+wUG4NmEl2jDRxe7j9kP0YSkhcN53MgRhi5iOQTyo+XAWZl5jVudxHA5VDZisTHCpcYcaSYT4
 ks8uj4108qRjF+okvBt424w9NvDPq8tzc/2StVbkFJ+ONhJSG/RmqZiG7npkky5D+iWl8mEfvpP
 QbNathpniIFdd2reIwSyZImy+925EkzQON3sWC0kby3ZoOWBrUWCA21eFbFckGTfjZ9WO4VOfeB
 Xz11IeUypyYm6gYtZps1E2UwOIMGKiL/0vOfiEmXm1O6vih8TWuwWZW8nA/xt65wNaCP
X-Google-Smtp-Source: AGHT+IE0Wq2OGy/UBABihaj30tjkXqQd3OF/6SvLXaubvLuwAxvs/RkGqwkr/Rqy+NYKM/SPFesEow==
X-Received: by 2002:a05:6870:f721:b0:2c3:1651:ca78 with SMTP id
 586e51a60fabf-2efed4b5be6mr15093fac.14.1750960957043; 
 Thu, 26 Jun 2025 11:02:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b0cf0sm453080fac.29.2025.06.26.11.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 11:02:35 -0700 (PDT)
Date: Thu, 26 Jun 2025 21:02:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <407addf1-4cda-485a-83a6-5eb2f6d5f7a9@suswa.mountain>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626172412.18355-1-abdun.nihaal@gmail.com>
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

On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:
> In the error paths after fb_info structure is successfully allocated,
> the memory allocated in fb_deferred_io_init() for info->pagerefs is not
> freed. Fix that by adding the cleanup function on the error path.
> 
> Fixes: c296d5f9957c ("staging: fbtft: core support")
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

