Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB65A86DD3
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 16:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D1210E29D;
	Sat, 12 Apr 2025 14:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mwXb2Pfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178A10E1B0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 14:39:32 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso1767363f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744468771; x=1745073571; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fH5ONljI8GT+5P19EKjih5JtNzqqyZ9zYDYMcWxctBA=;
 b=mwXb2PfpBl5Hn4qAzi9Hx+6xXkcfhozEzNkK/v2ZVTYuobNzXAdDuLuQ00ppBX5+V+
 BYdFe9vO5Mz1GF6b4zHuIUn0AW/4r+LilIGhaQxh7puFLAd/GHyh6DZVe+io2lTXbYBj
 o3sLuogWIDyKVCymA9+TuKsf+CypGgJ1B2WDBemIqOTlTG5fglJymtBn3b8YkB9jwc4V
 JL9rSsCArXKUlULuIMeEv9Mdba6y5YT2FaVl+Vj8801MmcL03w/Wdactq2fRcADe6ypO
 MdV4WPx4pEQC/izu75Z8s9ZRZwuv49jW1IwZhInEqMKSA/ZH8JXt9EiH+Rhu3SWm+N18
 kwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744468771; x=1745073571;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fH5ONljI8GT+5P19EKjih5JtNzqqyZ9zYDYMcWxctBA=;
 b=wHijV8ZPfNkFdRWvqRs2j8zyiFzX0siWv3QIbNsiVoKhkq9UX0f7ccdLTbLB1OGLCC
 7WEjdjC/M/otuFbR19+E7b1/Ol4p00m75y51FdJKBQllYVQtFNS0ygzoRfby15d3+HMa
 fsEO+4psSu8+5JRXaDOf/DmKv1yBcv4JVlaDs14VOI61i2/Tq0hLoMjU+RD/qXDv6TOi
 dGYOYolxSaizobuN96FS1x0jPmO4bkKH12nj6X76OuTAsWOrn4CTZxo+m8qiInxN/29i
 u+kFb3CnDC+16oi5uMV1BEpMYUJv0bJWH4GrEZhVnaTyRUaW+R5wIj4ZDVzMqp0tC3Yn
 57Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwmupF5T8dAyncZleGnDJzcl9QmNS9nlc81PMrX3HC5fRrtdvFHIY7/8quEpnI/lZ8CsHPzITOLpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxv/0i6wW6uoUiwmtnmOs8UdxdYD9w8pugUgGHwjevf8ERBt73
 Jz8L9n/wR0hD/vCufiUAEdge+9c1MHn5lM82hfkxudeq3b/KsD0S/T67WKNPrUk=
X-Gm-Gg: ASbGncvb6WlwyTmZ/1Vr06GD0FyaWEz0vB38IkrVdWq9NUqi+E/tYput6/t/hTJhnLv
 4LkhLjmzZH3Cor4wB7D6mRq8X0bcs2QkpKlZRzSHbaeagHznmHdkS1yfgcsxkVOiEcRvCS6tvEe
 XDsh2hV2IdE5ssj1M7a6JuRMffOv594Nk9621sWLuED6mm9vCsrW3yTFQlGS5DnSTGn5r/Y2sqk
 4jxLLnEIJudn6I08Cdyzb/hyxBMOtzhgT19giuM71pPgFwnxe85kb97sZdN5FMt/c4i2HfOeD0b
 ECtI8ARUYR+oLW/w+rPvC8Nq0gIGDSCkeOl5Th6QI6zZDg==
X-Google-Smtp-Source: AGHT+IF4Ob5u/42ggewD7xMGFQEe6dX1to90QjwleLQR/ueLvNKKi8zaTz7pgBKjx4hQiQ1U9Aob6A==
X-Received: by 2002:a5d:5f4a:0:b0:39c:dcc:6451 with SMTP id
 ffacd0b85a97d-39eaaebc75dmr5347890f8f.43.1744468770666; 
 Sat, 12 Apr 2025 07:39:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f2066d14fsm120982665e9.21.2025.04.12.07.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 07:39:30 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:39:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shashank Sharma <shashank.sharma@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/2] drm/amdgpu: Fixes to amdgpu_userq_fence_driver_alloc()
Message-ID: <cover.1744468610.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This fixes a double free on one error path in
amdgpu_userq_fence_driver_alloc() and cleans up another error path.

v2:
Did some additional cleanup

Dan Carpenter (2):
  drm/amdgpu: Fix double free in amdgpu_userq_fence_driver_alloc()
  drm/amdgpu: Clean up error handling in
    amdgpu_userq_fence_driver_alloc()

 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

-- 
2.47.2

