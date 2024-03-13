Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C747C87AD60
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF6610E27C;
	Wed, 13 Mar 2024 17:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yzoc5SO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4129010E27C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:33:16 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a44cdb2d3a6so10067066b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710351194; x=1710955994; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9xJXU/djE+6AamWsghHa5QQd0IYVhNMehUxy5z/IImY=;
 b=Yzoc5SO1oYTJueD4nBxZb+QlnS1sXCdGYC/WkQLtTJ2K9HzY5QjHCVNIViNJRKYCBH
 rS7vsuTShVTIHnE/CMMCmUsw0NoGl1qcypuiY0AkeEd7JXEtQbWkikMCu9aKf6/RezS4
 vz2iQdJohUOhdSUlhbZ5vPUoz3ubNURXDa5ztwhVOTtWDDbubtYpGWHsilsQ5qv0z2pS
 C0M3rHERP2yCGdxzFl4SG1WDxkHhdUo+2OmlRkfWyVqKaDfuc9Rb/al3rwkVw/sXrE55
 x+gMvf/IzpLa3d+TcC+hQ19BRkz9uX1VgYy6dg6azwUh+Csafc9DaFpRacILwRTv7mOs
 fX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710351194; x=1710955994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xJXU/djE+6AamWsghHa5QQd0IYVhNMehUxy5z/IImY=;
 b=Y/DHwBTEaLNmieBVQPLm6nl1HKBVvi8PJERP+WGJglmsoQ275NI0zhvkxYPgaeu/L/
 Paj/W+xL7ZsyuPHFDcNpEdKhjhBgwAPxo/O3+Kciyy0CLQlqIIFEFM4JAazfT67WpgVY
 k/7H6YN6l3xapIqJ7DYmgCx5GRMoshRDtAnVUPJmGIhBBaG2OOdUzV7sdJWKt2M+Vu9J
 QsQzoDzjZYsQga+tPTjk/FY2grXJ2vEp80/3S05EaeIg2bi9uM+Q14QVKwL2DuBgJ+fw
 KNR4cThFSnBXqqKqlF+N3Qt0Gj6pXm1iCr513rLohYjDZw15gva5gyV6Pvhw0MxgzN4S
 JUXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Y/htmvhQJrE1z9+F+JLMg3T6acdn+mpnbnaM78WqTihC6oT8z7Z7f212LzppCBgwXcNjlsJ13Mb2v70NZkl5Jw+N1cbrKXjsHTJo4/Su
X-Gm-Message-State: AOJu0Yx2Urfag0xYKal44Yo5lYTsZObAxjKCMz8ljUwWTjUySGyAW3e0
 AtZnfMDOWo+iUnZ+Vp0gM02tm5tYJ+IwlZ11QCBfF/AQpJIDWU4V+ffKHu8FAa0=
X-Google-Smtp-Source: AGHT+IGWVrwxwMFG8QtjiHohVmMptNb7CchWBc6WHbIGEiRSXUj1DaCqpwulZHiaYzSMSsRwqF5bPw==
X-Received: by 2002:a17:906:2e86:b0:a45:4416:1fbd with SMTP id
 o6-20020a1709062e8600b00a4544161fbdmr4184614eji.39.1710351194341; 
 Wed, 13 Mar 2024 10:33:14 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 qx26-20020a170906fcda00b00a45a687b52asm5011259ejb.213.2024.03.13.10.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:33:13 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:33:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/6] staging/fbtft: Remove reference to fb_blank
Message-ID: <a30fe590-23c0-4fc8-ac2a-577a2fa15e97@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-6-tzimmermann@suse.de>
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

On Wed, Mar 13, 2024 at 04:45:04PM +0100, Thomas Zimmermann wrote:
> The field fb_blank in struct backlight_properties is deprecated and
> should not be used. Don't output its value in the driver's debug print.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/staging/fbtft/fb_ssd1351.c | 4 +---
>  drivers/staging/fbtft/fbtft-core.c | 5 ++---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

