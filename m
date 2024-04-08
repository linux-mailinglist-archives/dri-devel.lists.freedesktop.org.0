Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6389BA65
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AFD112299;
	Mon,  8 Apr 2024 08:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7g+Hq4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE71112298;
 Mon,  8 Apr 2024 08:35:26 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41673509e8eso4476755e9.3; 
 Mon, 08 Apr 2024 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712565325; x=1713170125; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYeAXyuKGODULO+FbNEaQzDLowkIhH9uCziDxOY+3pM=;
 b=I7g+Hq4j88PUIh8k+YMVjBTi8sHVgzKAX2XlQUaftSC/eMMQL0tD/zwdFE+UPDSg3o
 VutdjDmVOCKYGPZ8cU4UG8xR0kjJBT+Fdv/tb1Q+JeeXS0qJen1ggnQkTKKhk04JfkYT
 igT2qrhe364bSVrdpMdtiESpraXE/u0nLYqa9EpTvipP+H75F6qFNEcCqfzcXab7Ss8u
 qqn42N+6J5Bvn1G9SGuY6fdj753QG52yXG8rhnl3F4Ay7WZV/9OSj2sfoldOuCf/tfns
 B6iBpU6616j3L98kvUqF0Ofsa///AjsrVJgcc3hcBiBwvNqZl+AfMtzwhq6WgJGiPh4H
 W4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712565325; x=1713170125;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uYeAXyuKGODULO+FbNEaQzDLowkIhH9uCziDxOY+3pM=;
 b=M6KIBh32Xyc75UOgjFXeu3XEMHSAXh5qlFCovdBQeokZ5BA7/HMyYNfjqvTKmAO/Gh
 /GUCjwGZZa+WNjLYriP377d11/J9uv5QXKH4j3RHplPm4KPj6RRTimw4RS1RI7BxwIKz
 E9aezXcpcEZ+HoBAYrt5cHvpyDemsVdi6ADZ0znliuLKixV5VhfJPlh2VbYykveLVcPO
 Rs9e0tRjWo00vEQILECf2MX+WrWJth9Z3sNIkbHmQz4X3wsGuqf5c7MXjE7623mnFpWv
 weYpZXoBn38yANmqJb3oWg90SlBJbxX2EZKPj+BXRTZLncRCR3BcePpk2tjs8NqtVFZa
 bJRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1F+0IfJRU1ixjth72LzrRjdA7FO3c9Kv/Q8daAqNS1V/eR6hpmFXKUX3ReT9ws4s5690ycDcTIiwKquTqJAFMciMzO2woZrdWuXoc9TIKIq2X9neOHOTwIP1kV+tFXmOOlaIxLCvWUoWGKW7PMEuzGOrJgQTeTUJkFb2PQMffE+vK1mMtAFdOxeHTTcxLYcJj1nyUCGU1o7EVoEQwxxjkyF5jyHqxqz4Gq+R0hC6O68Hag1CPtEknO6wK2WspmUO+3qBlUXa41VTLdya6UA==
X-Gm-Message-State: AOJu0YylXKRLXHzpT2pzRFTUB/g2OBgSD7TgdAufaEuGEnmfd+pGPl0r
 iC6piY1kh9I17tnGDEFmxCV+nvN4kkaonMyZs0vWOA6e5JI8WV1X
X-Google-Smtp-Source: AGHT+IHU5k1SefaWsJ4Dm8FLb/xA0Oa19OOVbWsUeKtS2E4eDYDTEpvWcL36P791FhCHmqL0tKsDyA==
X-Received: by 2002:a05:600c:468b:b0:415:6dae:7759 with SMTP id
 p11-20020a05600c468b00b004156dae7759mr5328190wmo.19.1712565324886; 
 Mon, 08 Apr 2024 01:35:24 -0700 (PDT)
Received: from localhost ([185.57.101.252]) by smtp.gmail.com with ESMTPSA id
 be9-20020a05600c1e8900b004163ee3922csm7570545wmb.38.2024.04.08.01.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:35:24 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:35:23 +0100
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
Message-ID: <20240408083523.GA5341@gmail.com>
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
 <20240402090028.GA1759653@gmail.com>
 <0c6ff90d-0709-4fc5-951e-1b0f0b1273dc@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c6ff90d-0709-4fc5-951e-1b0f0b1273dc@linux.microsoft.com>
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

On Thu, Apr 04, 2024 at 12:18:06PM -0700, Easwar Hariharan wrote:
> On 4/2/2024 2:00 AM, Martin Habets wrote:
> > On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> >> with more appropriate terms. Inspired by and following on to Wolfram's
> >> series to fix drivers/i2c/[1], fix the terminology for users of
> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> >> in the specification.
> >>
> >> Compile tested, no functionality changes intended
> >>
> >> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> >>
> >> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > 
> > Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
> > 
> 
> Thank you, Martin, for reviewing. I believe that we are settling on controller/target
> terminology from feedback on the other drivers in this series. Would you want to re-review
> v1 with that change, or should I add your R-B in v1 despite the change?

You can add in my Reviewed-by.

Martin

> Thanks,
> Easwar
> 
