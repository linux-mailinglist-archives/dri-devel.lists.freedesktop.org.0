Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74FD9EA403
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC1910E09B;
	Tue, 10 Dec 2024 01:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YsmAXDNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01CC10E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 01:01:43 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso506203e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 17:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733792502; x=1734397302; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L3LcvQjrTDMU2Xstb8PTcViDl9lW1bNhQu6ciqVQKbE=;
 b=YsmAXDNs2J/aXeFSwt8bLThlbpiFqgp50zdNBNbguUsrcwN9Cw1UMxBQ/1O+Uo4ypw
 6XyLdhtePfO04/5KX/eVHew3kj6Sv/n8iY/23pckHqRFYHuiootDb5Mgj1mB4JckHTxZ
 o0oCSIM5EHmhUXptAS/VDvu2Tqh2yjXdvx9APbbA93gTNrzZmcwfOtiBAZadhx32DabK
 N7jrDB1lEckxhegBYXzxxlheVk+oqEuA2xg+CkpctRloLdX3PoeWTw29eSzWClsWRPLB
 dGJomKUzY2z09PgRegvUlo08+qf8LRK1JzknuFGIQ3IvryWLHbp9vh/qm9WvshZOdePR
 n78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733792502; x=1734397302;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3LcvQjrTDMU2Xstb8PTcViDl9lW1bNhQu6ciqVQKbE=;
 b=oHht0F3aloJgXPQhYryrnj5XyyaGEmlT4kOFxsu3kz5jYMDi9WT2MT5jra+CZPsIzi
 EIINkY/tEpLo+XM+eHn9x4QEV2VmZb7ZtwuYbyQkrgMBKh69r4h7j4TieFLWhLy6faaZ
 kiY9oMBiB64A2APa9+uGfjDbWX6utRhk9OMuf0m6MRbM4deGvmz1GXslcxC1WBvRwmfK
 NxOTryNTSZW0Sb++qJTCGPLJN3zKB+SYfs4gtio9LHLE0KhRDFK3NKmBlj9afop7w8hS
 BPlL710RdUuGj8+tLCx/bqI3ofDJaTpnSITefo9WuPJQRKnu8f4zjKDS1KC9aNYSuGd8
 ICBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS2M+LFkMEuEx1qp+3dz4nIPmSdWnzDrYUhjQuCj09P/O+LhzhvPTWCLJ4gl7gGEnXY2y/Og7h5hs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxobTt5K6e72nsHDOb+h2r6Vk/ZVJ2sOnpDxpAz9zlK+6a0807b
 amFa13LnRqiZKWz7RseKfSPdeyGhqbpaKlnqa2dx2xYopYQMKKQx1xbOZGY544Y=
X-Gm-Gg: ASbGncsADX9AYQ/0Xrbk8FzD0v36urRXkdRrvN+dniUZcbMOv3xuSjeJBxV2SdAlzA1
 D29PYm9zaAyutRG7p8AOIF98E8vY5tAtO35siS729/EFDTFLdsCMwY/fCOlrZNiaXY2Hi4UdELN
 36jwC+jL5oUv8yNJj6pM/dh9pQN0StM6N+CsNYXNAQE5BJ6QW8cvQ971rCjttwwj717dn9d7hCs
 M0Lpz1g6BoCgUS+D40uyqvqzk/b0GIwf+lA9veHzaka2o93QL1T9e6Le9rjgNePjOMbjI8Oq9vG
 kGRIdJ/Y6UHZnfI5ugi0hJWslgP3YoXEGg==
X-Google-Smtp-Source: AGHT+IGILM694LFfCANVTXh/z3425jGIXUHVbOTTzyrGuCY/MpJfTZw0o+GZqr4bkrlnIoLzl3nnUg==
X-Received: by 2002:a05:6512:3b89:b0:53e:239b:6097 with SMTP id
 2adb3069b0e04-54024115ffdmr968809e87.50.1733792501835; 
 Mon, 09 Dec 2024 17:01:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3ab8dd61sm919009e87.44.2024.12.09.17.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 17:01:40 -0800 (PST)
Date: Tue, 10 Dec 2024 03:01:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Daniel Semkowicz <dse@thaumatec.com>, Diederik de Haas <didi.debian@cknow.org>,
 andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, 
 quentin.schulz@cherry.de, rfoss@kernel.org, robh@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
Message-ID: <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org> <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
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

On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> 
> 
> Hi,
> 
> At 2024-12-10 07:12:26, "Heiko Stübner" <heiko@sntech.de> wrote:
> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> >> Hi,
> >> 
> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> > > This series adds a bridge and glue driver for the DSI2 controller found
> >> > > in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> >> > > 
> >> >
> >> > I did more tests with different LVDS displays. I tested following
> >> > configurations with DSI/LVDS bridge:
> >> > - 1024x600@60.01
> >> > - 1024x768@60.02
> >> > - 1280x800@60.07
> >> > - 1366x768@60.06
> >> >
> >> > All of them worked without issues, except 1366x768.
> >> > With this resolution, video is blurry, and offset incorrectly
> >> > to the left. There are also repeating errors on the console:
> >> >
> >> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp3
> >> >
> >> > In correct operation with other resolutions, there is no error.
> >> > I am not sure if this is a problem in your series or rather in VOP2
> >> > driver.
> >
> >This really sounds like something is wrong on the vop side.
> >The interrupt is part of the vop, the divisable by 4 things likely too.
> 
> This is a hardware limitation on vop side:
> The horizontal resolution must be 4 pixel aligned.

Then mode_valid() and atomic_check() must reject modes that don't fit.

> 
> 
> 

-- 
With best wishes
Dmitry
