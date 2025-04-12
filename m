Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E3A86DB1
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 16:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C92E10E0A4;
	Sat, 12 Apr 2025 14:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zhyGdhEo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2D410E1B0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 14:28:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso30073005e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744468124; x=1745072924; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yug8Lg77jkFOaaSI2hhnGA0YoGthbaYjMrZs5RGYQTk=;
 b=zhyGdhEoxqONFclnTWorn31LGd6WOJI9ant+mweJQKsXj5LzevrvsnNc2iPvjFqDkt
 FC5cwr3zwV+QetoRVcYvo6Q7O1M4e+dUwOADqWbzgBYqzjH/AoBpbZMVqfT4UQ0HN3CX
 1J/ehYwKn4B+UXPqhKqQrI7awI+jKneeXm3naxK74ofz6nl0Wa/GJcgBYDZhO3HbVDD9
 w+wvjb2o59+7BH9quHtO/BtnMQ525n5Rbhjn26DwNIQfakIoV4vIq9Y8la0pyCXakScd
 hp4xO/K0+Nk3UoIkN5yEbF4JqSndJV5WlgdfMGvFP2Vx8LYiEOuT3O6R4KM6d4l+SUvf
 s8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744468124; x=1745072924;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yug8Lg77jkFOaaSI2hhnGA0YoGthbaYjMrZs5RGYQTk=;
 b=ilG2b7F46IJNZhBzQNHz7M0M9Ieddc4+fKOBsZqcHqrX5/TMvk+PKSGiKTtBkrejE8
 /mgB8h2y2HPUw+7kguoGe0Dx81XMAjvAiKuDAfjRf95zCy0YQd3PBfPxJ/Mx+1qjWHg1
 +is8LT+GBwO8gGiFpsyslhWgJhJOynv7aIGEoyFI8SjL4DyPUTmqRqV3H+4c/5r2UMOG
 zXp2axwXM9YmYiKfrV6S3V8js3S4YbBoGdjUGaaRMylgQkXLB6/4dIDH4ScpGxnt/6z5
 V1F5RQiF5kEjNREND4St6uescB+vbgNVTW3HKpNUNqGFGlaXTihIGtg46y6YraUEsygS
 F7eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmjHrFyi7JQI8MqhHuemHzucqRJO6Uj8DdH7bWkUXPRMyT/2RwN3DkiJNtVvV515kGzEeujhxd6lc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzwVg8mfdC3GU920mWZ+eSBlvNqvut38CYjXFQF8xjuEno/3PK
 Y1FUoSF5tA1/2vpysY4HuHhiKtcB6VjsfiF18ky4Hgi0NcgdHhlkzVLKP1AExfY=
X-Gm-Gg: ASbGncvakanfdc1iHj9syyd3kzDi0wGLtbqhOW5h3qO3SDVAG9T4d8TtHZNATiDHgIy
 txNhgYkSxY98v7XT7ZWPhHmoKSJjwwotMYKfjVI48lN1Rt3UvpDCVqlxXF2AWGLyklgqNlfkHFQ
 CAYSgY9U6vyTQagG12H5pI6/2nSMNeXh8bM316ZUUZ+8dWSYDsQKG9kiJC5RZEtBqoBKnTxUGM/
 x0OdpCteBjpK9Q9bSGE5rdCz1Sv4jPuGrf7SZE7j4QJLf8ux+qKqfI6vLSG9qTVQ+6BN7BUFt3a
 boy1G4ZTN55+kVjgyInrTMmjYnQCJ6scB8y9zkstyUKrbdB9iIwx4/KW
X-Google-Smtp-Source: AGHT+IH34D5glm0+0TkKdRd2QqYl+pfjKMVxmTngaZruRkPsk03mWnWy81pDX8UHh5AZeQmoxzxDVQ==
X-Received: by 2002:a05:6000:2507:b0:390:e311:a8c7 with SMTP id
 ffacd0b85a97d-39ea51ecbecmr5651152f8f.5.1744468123668; 
 Sat, 12 Apr 2025 07:28:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae96c074sm5086157f8f.28.2025.04.12.07.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 07:28:43 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:28:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Yadav, Arvind" <arvyadav@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <344bcc64-bf13-4726-8530-48eca7d643d1@stanley.mountain>
References: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
 <92b7d28e-6103-4c76-17dd-6ae94552a043@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92b7d28e-6103-4c76-17dd-6ae94552a043@amd.com>
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

On Thu, Apr 10, 2025 at 10:29:31PM +0530, Yadav, Arvind wrote:
> Please change this also instead of 'goto free_fence_drv' just return err.
> 
>         fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
>         if (!fence_drv) {
>                 DRM_ERROR("Failed to allocate memory for fence driver\n");
>                 r = -ENOMEM;
>                 goto free_fence_drv; // this should be replace by return.
>         }
> 
> ~arvind

I noticed that when I was writing my patch as well.  I'm always in favor
of direct returns, but it makes the patch confusing to add this unrelated
cleanup...  I'll send it as a separate patch.

regards,
dan carpenter

