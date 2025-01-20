Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E413A1673C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 08:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B07A10E31F;
	Mon, 20 Jan 2025 07:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g4MTfO1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A897F10E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 07:21:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f796586so44363795e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 23:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737357713; x=1737962513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pHsq3uOy5eJ5dVbh8dVdNYReOLOhPHBDenlW0oUhiJ0=;
 b=g4MTfO1HqC1WL4S3vBy7MmjqaW48EeGwDusf2AkEIpfFSUjvdYRiTMEi7V58vMubkZ
 eTrnwN1NKY4gb7GsYIOJuvumOpVkpfAw6JtfpaGwjlyYF1creRj10XRNqvO/L1ViuziC
 +MMgxwEn3QssqUGXr3UPpzsOvcPNQvp+DXwOV76yOHsqLfRGOq/IVceoQ+NoZPRo0/93
 DSy5WS6yoGf7sb4ou1odRnb116Pjv5WTr9xBr4pwQXzI1bIB7ZEfD1/p0mlCfDsf6IfS
 Fm+NW1rIuY5F4L6m3hEfhuAJK0JNv8qkYhk183Eo6uEWbA7TBxRZbr16o37oJ3lgcjyK
 u8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737357713; x=1737962513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHsq3uOy5eJ5dVbh8dVdNYReOLOhPHBDenlW0oUhiJ0=;
 b=r0/CFKb6/590cRL2QFbwB9nN8LRsy7UYBHlCIlHyhT7JUmugyczlUWk0XgsDYyze68
 wm8v5NPwttdYympxmzlnyHFn+3mWVCVzHg+VdZ2wdDjFM1A4h+uiZa68jZ/I5h/jymzt
 gD5ivu/DDkDIPOkQakCPvecgZLleLfHJLQV9BYKtKlcjbKzQj6cPXLPZBAMEmhBma+mO
 6oPKhiYOwua/xOHcbp8HRrkFAEPf0Jq+RA2xuS3ysaIYvjY+jwDpTjyro3HPqyQACQvp
 UJEIsCWNKBsdh7kSob1zNh6JvPjsoF+/kPCxXiAwb9iITug3qWWYRuT3rTOndDqP+MPt
 z6tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAvrb7R9vSM7dayEbgrpAn7V5Ox/GGuq/P0hOqmBOaTf55lg7fr49jkZ7YzFkIZRJJFBRCCVmaVxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdydU9ELfGAAE7c9L7gzloeHoZDu2QHP+XrtlMMcX0Qt2ygytC
 xFUw8noqYaEH4mznvNURsEVFsle/RrBbDUrI2BPxWvkJBVjqG4uGdISM6oBaW98=
X-Gm-Gg: ASbGncuAelCmwhaE6y7ugUnEboA6QCujXcd38BBbn9Z24tCGwG49c4uyIqBi5OMkPfy
 ppbvy2hRof4bCCbCDuwErireejztrTZkU2noRQzrAWaQLEVazReQc7Yz26yN3lxIyh0XQTb4VU6
 ERqbNuTAWZk/FbpnAIkhYfOthvHGNg+w4BjX1++8gGk5zxrsT259d9olb6JtlWlMNo8VY1wi5So
 Zc5x9tZOympgKZj48d9DAo5uS6BuhQOjRG/bit968ASMcMnoGhjVPU6QKGd+t7s9/DalSuhBLQ=
X-Google-Smtp-Source: AGHT+IFxoEn538osLb1odgajYw9fSAUZgF6WvPtYoUG5YWbbVnrdjB5k6/fOChqeptiWxLNN08rLeg==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id
 5b1f17b1804b1-438913cf2e0mr106268555e9.8.1737357713032; 
 Sun, 19 Jan 2025 23:21:53 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32222d1sm9595035f8f.38.2025.01.19.23.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2025 23:21:52 -0800 (PST)
Date: Mon, 20 Jan 2025 10:21:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, mary.guillemard@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
Message-ID: <01bf1bd2-2764-41a1-85aa-962f1197387f@stanley.mountain>
References: <20250119025828.1168419-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119025828.1168419-1-suhui@nfschina.com>
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

On Sun, Jan 19, 2025 at 10:58:29AM +0800, Su Hui wrote:
> 'priorities_info' is uninitialized, and the uninitialized value is copied
> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
> 'priorities_info' to avoid this garbage value problem.
> 
> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

How did you find this bug?

regards,
dan carpenter

