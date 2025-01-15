Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399CA12238
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 12:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BB210E5E3;
	Wed, 15 Jan 2025 11:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Thd6ruTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4592710E5E3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:13:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54298ec925bso4397909e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 03:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736939632; x=1737544432; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Av0rjEk4K1UrBkuc3slj27PyoP59w6tr+UnsldrkkKE=;
 b=Thd6ruTlNdJaS345Seb+TUPcklO1B5ZpQJMThWdKwZ0f1zAFDNR1oMzf9FeJ1CqNK8
 x7d5kZiBHCbdm2OMOnuouJmyyXtCqNsNHsGsRsMtLKzXFmov0pwRD0rNUH8USzJ0EXAs
 2MMahVrpPuTNhEszhJqpwnf3iltgqoqXbg66dZgEsZKdc/QrZasvoqjp2rMP4gHG3zTX
 HTECIra5+1bgdqTH2YtUDSmeDvhpIUNolSaRQap2RoLvstuOklYv8VVGgD56oDOatVkP
 MRCOowIIu+feoDjC52mcQvBJXqll1ooX86pLRd6FjxdTj2XQZEW2cuK6v6kmvO9Lrb7e
 TLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736939632; x=1737544432;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Av0rjEk4K1UrBkuc3slj27PyoP59w6tr+UnsldrkkKE=;
 b=hqtDifhzoctuk0yK9zYahB32FCch1R7LFuMnqPPb8KVwNDw+kXDcjetCSDKqjFMMbV
 g1Js3+2jx4Er/Dz5ZgfhP4BtEYbinzKX5vFPWbEh4Ogmd7l5DpNos0zuYYgJusD5KVOy
 46PDScXh3FZxzzweq6vxzD2TXKRuD7ph1WrVOXt6wjckStyv2qZejD2nrv4Y4pVjn0wZ
 dCr8jix8VI82GWJsp6453c/a9TQdqANS/BoJ1bSfi0nehPd+itZCd/UnJTQSGm1Qb2uu
 +WYVbBZLAZyo6Hl01JFDFA7DR5hyW1ml0uEpQwaPvb6lcWnJJN90Ff3oERjGtfV87Mif
 1RDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6COk1fSRNS4Qw48FfQASii35VOHr8K1nFxMn5UWzoVdEd5NZeBYZIe6VlMjADrnH6x97+MfZ5U2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLl6W+inwUDPXZeHZi+UqXqwEBMlMn3otIMhQ7WRGko+GcvOU5
 4EikVy4UnU0EHP1pLK3BtBu7SWX7f3KdtPw4WtED+Xm1aiq5LB5MW6zPXaq1gIM=
X-Gm-Gg: ASbGncu17bI4Pv6i9/5/bYn11UMwBpQ28nMCqgM5cEir2CICmJaEGb0SHv+ntUAf8GE
 QWR2DMaPmJnhjcxaxZwUl4foz86hselJwc76FQo1/wyR3CQYGeWY2HfteQXgZ0vIAIjX+qaH1d8
 YBa0Mm+xm8roZhILy+/LCNsAJnjO7nOJjfMFj0smmljPNgNjRuZGtFqvuR0aO6AppdIWcbK2q5+
 zkqQbdzjG72k7UhiobByNZD3tG2FFmsIUYT2Q9MrSyo0awPUQGecZBnYYiuGZMGyTKddz8/1bCF
 VKb/a8LxB4fbYLjmbweKU/SVXwVz5zxqHQgz
X-Google-Smtp-Source: AGHT+IH0d/mqqFG8l0nVwVIfYL0lorLg9/b/9Bo50ztfLEBMz3O/VEgCt0rLyvdS4QgL0qaCmUx0IQ==
X-Received: by 2002:a05:6512:3196:b0:540:357a:4aa3 with SMTP id
 2adb3069b0e04-542845d1878mr6129056e87.28.1736939632489; 
 Wed, 15 Jan 2025 03:13:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea669dsm2009355e87.164.2025.01.15.03.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 03:13:52 -0800 (PST)
Date: Wed, 15 Jan 2025 13:13:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH v2 00/10] drm: Add new pixel formats for Xilinx Zynqmp
Message-ID: <r6mwhzcrab75ireqdqm335ayzf6n6nqnytmdnpuhlgcqkiudz5@alqr5ep5ub7m>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
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

On Wed, Jan 15, 2025 at 11:03:29AM +0200, Tomi Valkeinen wrote:
> Add new DRM pixel formats and add support for those in the Xilinx zynqmp
> display driver.
> 
> All of these formats are already supported in upstream gstreamer, except
> in the gstreamer kmssink, which obviously cannot support the formats
> without kernel having the formats.
> 
> Xilinx has support for these formats in their BSP kernel, and Xilinx has
> a branch here, adding the support to gstreamer kmssink:
> 
> https://github.com/Xilinx/gst-plugins-bad.git xlnx-rebase-v1.18.5
> 
> New formats added:
> 
> DRM_FORMAT_Y8
> - 8-bit Y-only
> - fourcc: "GREY"
> - gstreamer: GRAY8
> 
> DRM_FORMAT_Y10_LE32
> - 10-bit Y-only
> - fourcc: "YPA4"
> - gstreamer: GRAY10_LE32
> 
> DRM_FORMAT_XV15
> - Like NV12, but with 10-bit components
> - fourcc: "XV15"
> - gstreamer: NV12_10LE32
> 
> DRM_FORMAT_XV20
> - Like NV16, but with 10-bit components
> - fourcc: "XV20"
> - gstreamer: NV16_10LE32
> 
> DRM_FORMAT_X403
> - 10-bit 4:4:4
> - fourcc: "X403"
> - gstreamer: Y444_10LE32

Could you possibly add support for those formats to the modetest util?

> 
> Some notes:
> 
> I know the 8-bit greyscale format has been discussed before, and the
> guidance was to use DRM_FORMAT_R8. While I'm not totally against that, I
> would argue that adding DRM_FORMAT_Y8 makes sense, as: 1) we can mark it
> as 'is_yuv' in the drm_format_info, 2) we can have the same fourcc as in
> v4l2, 3) it makes more sense for the user to use Y8/GREY format instead
> of R8.
> 
> Also, if we go with DRM_FORMAT_R8, then I think it would make sense to
> also add the 10-bit grayscale version as R10, instead of Y10, and it
> would also have to have 'is_yuv' false, and I feel that would just
> create even more confusion.
> 
> I have made some adjustments to the formats compared to the Xilinx's
> branch. E.g. The DRM_FORMAT_Y10_LE32 format in Xilinx's kmssink uses
> fourcc "Y10 ", and DRM_FORMAT_Y10. I didn't like those, as the format is
> a packed format, three 10-bit pixels in a 32-bit container, and I think
> Y10 means a 10-bit pixel in a 16-bit container.
> 
> Generally speaking, if someone has good ideas for the format define
> names or fourccs, speak up, as it's not easy to invent good names =).
> That said, keeping them the same as in the Xilinx trees will, of course,
> be slightly easier for the users of Xilinx platforms.
> 
> There's also a bit unrelated path on top, fixing the missing max dma
> seegment size in the zynqmp driver which I encountered while testing
> these.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - I noticed V4L2 already has fourcc Y10P, referring to MIPI-style packed
>   Y10 format. So I changed Y10_LE32 fourcc to YPA4. If logic has any
>   relevance here, P means packed, A means 10, 4 means "in 4 bytes".
> - Added tags to "Fix max dma segment size" patch
> - Updated description for "Add warning for bad bpp"
> - Link to v1: https://lore.kernel.org/r/20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com
> 
> ---
> Tomi Valkeinen (10):
>       drm/fourcc: Add warning for bad bpp
>       drm/fourcc: Add DRM_FORMAT_XV15/XV20
>       drm/fourcc: Add DRM_FORMAT_Y8
>       drm/fourcc: Add DRM_FORMAT_Y10_LE32
>       drm/fourcc: Add DRM_FORMAT_X403
>       drm: xlnx: zynqmp: Use drm helpers when calculating buffer sizes
>       drm: xlnx: zynqmp: Add support for XV15 & XV20
>       drm: xlnx: zynqmp: Add support for Y8 and Y10_LE32
>       drm: xlnx: zynqmp: Add support for X403
>       drm: xlnx: zynqmp: Fix max dma segment size
> 
>  drivers/gpu/drm/drm_fourcc.c        | 24 ++++++++++++++++++
>  drivers/gpu/drm/xlnx/zynqmp_disp.c  | 49 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c |  2 ++
>  include/uapi/drm/drm_fourcc.h       | 20 +++++++++++++++
>  4 files changed, 91 insertions(+), 4 deletions(-)
> ---
> base-commit: adc218676eef25575469234709c2d87185ca223a
> change-id: 20241120-xilinx-formats-f71901621833
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 

-- 
With best wishes
Dmitry
