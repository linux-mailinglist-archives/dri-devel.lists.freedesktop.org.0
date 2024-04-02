Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693F6895201
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6C10FC86;
	Tue,  2 Apr 2024 11:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eUHucCjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FEF10FB84;
 Tue,  2 Apr 2024 09:00:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4161d73d876so903625e9.3; 
 Tue, 02 Apr 2024 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712048431; x=1712653231; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7HP43l12eov1KUoh9mzxUyEYfgWNMnEq1EVajRpXoI=;
 b=eUHucCjDjdWtoZrOvfp8lQtzuyFUNnok+lJz/So0dtsJ/oyzvTrTl0D0yA9hO4+KS9
 kymFy0b8eVUFYhuzKJFLHTGcf+4dbjfJzTQLZiDJ0XwhO5FtfPzi864eI+gXjvcu5W0A
 2MwU02sqyx75K/Vp1Z7IfmD+bYuOjYNIbjr9ALDgkXEOawDMbNppQrVqzEeuXXKcUwjm
 0fY6X23gp+PQdKMg1DzskGUMHM/s/JmF3vv/YFfilXZnjghGS1csYkO3gUoVOqBWc9O7
 gV6/2b5FRr5l5g0BLrOLLYpbEEQB3sRTYwxfFzYLDh1p+oEQWZjjQp+V4Z1VBdrXa+SD
 rNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712048431; x=1712653231;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S7HP43l12eov1KUoh9mzxUyEYfgWNMnEq1EVajRpXoI=;
 b=sWOVvuLOYE1qI6qlkNA0QGfzntPYfBKIclrR7sapx0p2dDPx6SwAXKFFdJ51vT88M7
 vb6uCpV1X14rJ7uW271mM5lcAtAQwaWmrvDLFhApzaTMc68DZX8eCHAVFVIeT9AdFTBE
 fmOV0wcpkmIw3WUIp1qp8CdXNhdIQHC2KduwntNYFxUG8ElFT9Z0s4c61K1n9PhBkP64
 yweyg5OiRbDkqqDOqkYc4kgqhqtGUMkmh1Q8uDP9dY3y0+O+9mY+2w1PU0DWwR8i/UYj
 Q5KVLSlgD6DQrovfsKTXlhrO9McYa5ywaf+BJeTxe5Ehwbropr1GDHgfQ4HPOTeu9RKb
 WxTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Sg2MJHvueFFQhOWWoDux3hird57ULd7EF4lFkA1DM2YJdrwCSQcprdO3PZE7pONP1eBykVS62FuSJFNErxYTTiPMQjirOqomV6JKAyJfg6cRW5xPoE8BIKfnDy7BxgTzi48TiGBt5HeICih5tttQKsHszu/NhKZB0O3v5ZnpCNnCpO7997/55bSsnUj6vK0wDODfPI2uTLIroF4dtyArHinteRVQXWPi0Ox7FllTOImAaXoFSUBQTgp3jdQnN39YR5sPue9TMYZs2Jy9ag==
X-Gm-Message-State: AOJu0YyHaENh5Y1rrUpmmhiA+G9g94ceIjwc5INlWv7Fpc0phheApl79
 k5cVAZTEbjDvfVDYj9PIQWPJdkmJrguwFWXKxedeGqxu2zJFhF93
X-Google-Smtp-Source: AGHT+IG8frznok1aF9okpQQTY2pR3XWd8JzFp2tX7BIUva1VqLJJmQZ3+crxPhY7ojqin4XV81Hf4w==
X-Received: by 2002:a05:6000:1143:b0:33d:b2d6:b3a6 with SMTP id
 d3-20020a056000114300b0033db2d6b3a6mr7466595wrx.48.1712048430463; 
 Tue, 02 Apr 2024 02:00:30 -0700 (PDT)
Received: from localhost ([81.168.73.77]) by smtp.gmail.com with ESMTPSA id
 l2-20020adff482000000b0033ec312cd8asm13554997wro.33.2024.04.02.02.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 02:00:29 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:00:28 +0100
From: Martin Habets <habetsm.xilinx@gmail.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
 "open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
Message-ID: <20240402090028.GA1759653@gmail.com>
Mail-Followup-To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Edward Cree <ecree.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
 "open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-11-eahariha@linux.microsoft.com>
X-Mailman-Approved-At: Tue, 02 Apr 2024 11:39:04 +0000
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

On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>

> ---
>  drivers/net/ethernet/sfc/falcon/falcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
> index 7a1c9337081b..147e7c8e3c02 100644
> --- a/drivers/net/ethernet/sfc/falcon/falcon.c
> +++ b/drivers/net/ethernet/sfc/falcon/falcon.c
> @@ -367,7 +367,7 @@ static const struct i2c_algo_bit_data falcon_i2c_bit_operations = {
>  	.getsda		= falcon_getsda,
>  	.getscl		= falcon_getscl,
>  	.udelay		= 5,
> -	/* Wait up to 50 ms for slave to let us pull SCL high */
> +	/* Wait up to 50 ms for client to let us pull SCL high */
>  	.timeout	= DIV_ROUND_UP(HZ, 20),
>  };
>  
> -- 
> 2.34.1
> 
