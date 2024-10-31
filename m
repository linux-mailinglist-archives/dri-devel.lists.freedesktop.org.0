Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D209B85B6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 22:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9B410E941;
	Thu, 31 Oct 2024 21:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GVFIX6hO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6B10E941
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 21:49:37 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so13712451fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730411376; x=1731016176; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ivfGkCZ0mrmNexWfTqhxP/zEQh+Tbty2EOu6qMw1oQg=;
 b=GVFIX6hOZX5VokspJXI0p7au4HSxMefgblTmXD90+3cBykpbkAUi+Z6NPeoZi2nXyc
 6pcLNi4+wwb1pNJn6bxEZ9aCjKN4A8GP/T5HNuXN7Byj9NhVS3vs8P1LXtITsmrOk7I4
 6/hXEI5FNGxHAGo3fo5xuH2LO+iOGRMGMMh9h1nqJrFgzG+gGIMIxdhAyhYyL+Oc1Uqo
 dWwRfbDHjoJ+Bur2iVOoqk17PRwGO9RQsi9bwzNp5UF6PLbtzIqDQT+itU4bveKLEGZd
 XEmo1e4xbIxEYrII03B20oTiDqkXIxsoSgsFTwfJwnn6TCzVhIPmseuWVr8A6PqaMV0f
 tnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411376; x=1731016176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ivfGkCZ0mrmNexWfTqhxP/zEQh+Tbty2EOu6qMw1oQg=;
 b=SjErPJx5LNANvpFb3Ygh1Qhcssn0+8YnhWAKf+nEJopNEU1Qb4adaPYWIKq6iDJW5A
 I791c5KoWkkvM4UHStDNLWRJBs4S+eWgm2ixwTiaKTOqcBwsl40NADFXr2PxuqZKnH6F
 /Ba+XYMGAjePJCZmX4hHeK44sH7W9/u9Z2J4nUo+gWLX33anmF6yvO8nunPjkSmUb6jx
 6Uen9vORcNLm4GOBUPqhazAXcjh2clUV/Bi9IQCZCfrIcAyTMUUbevaoKXx43laFYqo7
 F6RQh99J4mOg5gxZ/u4En5fHCFm0N6b6JWm+WUbGye/7KjE5aFlMZChWVphnmbh2GhbR
 y6ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKhyun3UBKMyUvyEvZyXg8s8xPU+Y8Nm354BZhFdJwY61/QcaAwwP13QEkSyQyU6LZ6o6hh6TXK4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVRT5s+ohe1WV30tQ8TTU6gFoZTfDST0Tz18bQ9+UX5efYPyX9
 42pl7/nDCenwyLNsma1qUn4hR6yUcqWOHVOwkCRjaN3mzx4NZ5dEuf7kwsi2xuE=
X-Google-Smtp-Source: AGHT+IHYp4tKv3as+ggUd44i4cpLy86BJrk5qwSuE48uwh1PDxKXFTNz2rfp2/D48hptfPQBZqbd5w==
X-Received: by 2002:a2e:b8d2:0:b0:2fb:587d:2ee with SMTP id
 38308e7fff4ca-2fcbdf7d926mr107044591fa.12.1730411375970; 
 Thu, 31 Oct 2024 14:49:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef6180easm3381771fa.68.2024.10.31.14.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 14:49:34 -0700 (PDT)
Date: Thu, 31 Oct 2024 23:49:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 chenjun102@huawei.com
Subject: Re: [PATCH 1/2] drm/i2c/ch7006: Add a check to prevent NULL pointer
 dereference
Message-ID: <2tc5cfnzw4m56uqvbxfuqxafo273twk5dkiu5xo3rrav7wxrpr@c2vxe4m47ihn>
References: <20241025073408.27481-1-zhangzekun11@huawei.com>
 <20241025073408.27481-2-zhangzekun11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025073408.27481-2-zhangzekun11@huawei.com>
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

On Fri, Oct 25, 2024 at 03:34:07PM +0800, Zhang Zekun wrote:
> drm_mode_duplicate() could return NULL due to lack of memory,
> which will then call NULL pointer dereference. Add a check to
> prevent it.
> 
> Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  drivers/gpu/drm/i2c/ch7006_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
