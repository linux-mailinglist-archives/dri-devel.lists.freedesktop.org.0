Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C93A3914A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 04:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C788710E0C2;
	Tue, 18 Feb 2025 03:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lYZd8Aux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736210E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 03:27:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5461cb12e39so1889169e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739849218; x=1740454018; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YSCxueoLHB/txHVHiuPd/+UkwH+GSWwoHHKB59+DFlU=;
 b=lYZd8AuxYoPNhux9K011zCrGyNEwTI5drFB9jwOIWQyYL/HPo9U48dFY0Ctg99et4T
 kFMtsAbBF0BA+3h9GKkYIK9VxoKS7uXQlGyycHohF9jMjeJxMCPAemOwtX2WEyY/Daq8
 su2fnl4XvBCFx8msvtzQV47LqwrHxggqxFIzagjhnVw2Xqa/IwgaUciOmhXRtzyT5Qur
 yx+JevQVrSYdYOdKJcz2KKAmOS2s6kV4N1/2ofkY6moa4XAurAjrdj7o5iM9q33I9Oub
 YqpSV38RfwQcOd73oX4MD+nP8vX2Z9/a/SnttL+Sa9mhx00v/BrKZ965TYFBVtw7DcQi
 9qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739849218; x=1740454018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSCxueoLHB/txHVHiuPd/+UkwH+GSWwoHHKB59+DFlU=;
 b=TAbpyoxk+a4Gs/IH3Vb7SNoCCeNUlQdiiaYCTZWXuuJyb45P4kbulrnpaaS7aPhTzK
 iMhc12d5b0A+mrIXW7mdBdwsB0bkPYZefRVtnKSCgrSSs9L4JJLcin/QN8oOw6BhIO6I
 tSpVUenkiIb2quiiW6StFCXvBecI/euURgDk75ue4J8g/2yK0yRjJgLGDP9ThUceokLZ
 hnPsivTiyPkNV6CMJLK6PB+Z+ar/L0R1e2JdFFbbl9O1CLtfqJZgkocyDj4lQVhPhZc2
 DTRDt1k7m2I4du9/jzrA7SMqFjaC2FKjDgJuxVRLaRlNoCxpv6lD/Dhn6hxvFbXP305Z
 E/kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfQTzlTHygHtsLOgXBhjVmwY0ssPD3U+TVI/j/n92d/IqbXeNTAEDrUNtlFWEHrdcysLRV3Uz/hQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsTa+iWhI60nHIeT3DQoIHUXS6tN/629p8vYMI+f/X+ShQvoiJ
 nFU9McLuisCajTuvx2dnWXmPREjwtpkF69xH4sjDNVt56I7aiuM6/Em8HKWfM9Y=
X-Gm-Gg: ASbGnctkfsMvbtX1lvDTSSaN/eu14bUSBvDKBJDu9FkcPIEjBSTs3aiuM8l5D6SU6vN
 MStRZQhf/u7ciPkXntaoP0huDYn2KOcKRv3jcj4EfiC24/XeuLF3pR9rzNsrxF24P2J3eq6iQGd
 nQN1dKhNq6NPo8rf6IYrWbFspEc10uvlwjff2ZFnegB12M+vkigZpuxoOOzoOSeQHAe905AZJ/0
 rAvWKceAyc5SSoeGpdWjA42fBMYDfIkQXoX4ZNhW8M1Xxa0GryCJhXOdqjR++3VStVvE0K6JZiw
 SUJPA/KvEc8unTMW356BAZj5RXvFNTkiY2Dd72iZll8dH49FfAdoAnb+ZtXWTrXYztwZPSE=
X-Google-Smtp-Source: AGHT+IEuXEdpqn4is6TUxaE/+JLqNClWKujDuBTB2tz6Yn1fQEc4M1pLzGsmXbDamEwCBtvEsM8kFA==
X-Received: by 2002:a05:6512:2342:b0:545:f4b:ed58 with SMTP id
 2adb3069b0e04-5452fe47777mr4001491e87.18.1739849218533; 
 Mon, 17 Feb 2025 19:26:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54595e38064sm980129e87.126.2025.02.17.19.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 19:26:57 -0800 (PST)
Date: Tue, 18 Feb 2025 05:26:54 +0200
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
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <naw67daoyb2lfmq4jovlwanz5niaolptwnug3c3kkrtlfoh6dd@trkctqyzvtb5>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
 <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
 <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
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

On Mon, Feb 17, 2025 at 10:27:56PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/02/2025 22:15, Dmitry Baryshkov wrote:
> > On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> > > Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> > > container.
> > 
> > Is there a more common name for this format? Otherwise googling for it
> > reveals only your series.
> 
> In the cover letter I mention the gstreamer names where available (this
> particular format is not in gstreamer). AMD has these in their zynqmp
> documentation (https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Video-Packer-Format).
> 
> XVUY2101010 is YUV444_10BPC in AMD docs.
> 
> X403 is Y444_10LE32 in gstreamer, and YV24_10BPC in AMD docs.
> 
> I'm not sure you'll have much more luck googling with those names, though
> =).

I'm asking, because include/uapi/drm/drm_fourcc.h has a pretty explicit
waiver: GL, Vulkan or other open standards. Otherwise normal
requirements apply and it's required to have an open-source usespace
implementation, etc.

-- 
With best wishes
Dmitry
