Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFAB1A537
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037AC10E361;
	Mon,  4 Aug 2025 14:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jOmICTFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D27B10E361
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:49:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-459e0a249d6so2725e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 07:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754318962; x=1754923762; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5MAh85Y0saa+euoszKw3nA4pGBPwcX9w5nxBz0NKd0A=;
 b=jOmICTFZDI18/jzZqAipD8SqJV3spTOLCUs7melJIJwhrwgE7D+SW5DIuBnqD9RAkN
 FGfG3yASw1tYAQvO0W2YW3FpPOWh43dWKOX4k2LsuDtFL3s33fJrn2bTRQG1wJ7dfdDC
 YPG/YfCbLqB9ZA7BhBleej6eFrbwSOkXe2aUTmd7KY/DqpMCzOEE4sjSVlqNNm4k7sG2
 yRH8g78UKgj2pn/e1E6h6MRTHnGLAJFgaJztfdh1gWq6xxS/uxTqG8tJcjzad9WGAUkb
 I9JRWeY/BWRdM1zhqFyImt6U5ScRsw/IFq8ozWHYOkXqgbCBKzOA+HttkGWtHX6b25cp
 BDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754318962; x=1754923762;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5MAh85Y0saa+euoszKw3nA4pGBPwcX9w5nxBz0NKd0A=;
 b=BMctwQrB+oMsraOf+EgU1vp/q7SGG1LhYXsXUYur1lRAgAu8OtxC767deDkMw4SrOh
 8kLEwD3UVPP3vYlz2RknR+pJLI9qFA1coveR/pwhgOy0+JOEqDMKdS58Dueo62nvi4ld
 h+Iwha2AmNal6reqwreHT4TD+teTP5qIGc057DJxRhcY3C4rwI4vXSVb4zAtf4T3hegH
 PPww4jNdxEl6omk2jYn3ulPfCOTi6vXiMh5LK0EKZv1mehNYAgdqXGlQYJx3RnzPQ60C
 jvKVR7MA48FTNTgWNHK3ihfUvLFkPDhCnatJ/XE2AV5o6EO+0YaMKVUJUIQkzCMIi+lW
 plpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW82eNmoL3sloYEgYkVL9znBbdTO8AVMcVjUv3ZPmQ+bvfiVet8oBDmNL4kBOEUAf2WgVIVUUkz3oE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7ewJiCpbGwJk1NUs0sP0uo4sVenKXrasRyJzeEhT3ra2RSREG
 xksFDlmxLDDHcaYIh8mGpYcMbOTjpm2gadqVIEJsL4dRI4xpfp//u9MKgcr7RRgG6a8=
X-Gm-Gg: ASbGncurp/ZbO2MeFzqyAPM1wtI3fBho7wMiKLHVn1nf1K5Twv3pOWOib7D3/jOcpxq
 k52BllV/ji0l0AxN7/mKyxA1Kf3ZOzrfmKMu6ylrNtG3h+C3UbVCL9EQ8h+jBqQge+QnMeYDjw+
 sgKzzOg72u4+3eJB/SxkHnM9JosDt4kML9+kNtXsAr99fJOAW4oak8HOtTS5wWPVXfs7MJwcL72
 7T4VPrPH7j0qYeejfdD7ctrCdkZAHfJpVhufumGNryVKD/nlpdAvMk7QAyGdIlS7Vrns1wU2yJS
 mwmo1ylY9dFtf5eUUPqpj1ymNJ1nt8QtUwgQ81MuoPyfHAPwvcmJRBSHEXD5QRPh8DHnuTo9wyM
 PDo+4TOemSY/efa7X/2FsTK1maaLl54379zADWw==
X-Google-Smtp-Source: AGHT+IExUksj+hCR+gj7NMUPXAk78VVx0bqD4AGsjGqehS5x2aQlIlZBpW0rJUPuZBL200EPhOnGsQ==
X-Received: by 2002:a05:600c:3b9f:b0:458:bc3f:6a72 with SMTP id
 5b1f17b1804b1-458bc3f6d41mr61463425e9.4.1754318962444; 
 Mon, 04 Aug 2025 07:49:22 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458a7c91c0esm150589255e9.11.2025.08.04.07.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 07:49:22 -0700 (PDT)
Date: Mon, 4 Aug 2025 17:49:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
Message-ID: <c82931b5-0de2-4e45-a80b-3a90b0cc98a2@suswa.mountain>
References: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
 <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
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

On Mon, Aug 04, 2025 at 10:32:43AM -0400, Alex Deucher wrote:
> On Sat, Aug 2, 2025 at 4:22 AM Ethan Carter Edwards
> <ethan@ethancedwards.com> wrote:
> >
> > The repeated checks on grbm_soft_reset are unnecessary. Remove them.
> >
> 
> These are not NULL checks and they are necessary.  The code is
> checking if any bits are set in that register.  If not, then we can
> skip that code as there is nothing to do.
> 

It's not a null check, but it is a nested check and it's a local
variable so the patch is correct enough.  At this point we know that
grbm_soft_reset can't be zero.

regards,
dan carpenter

