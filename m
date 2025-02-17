Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC816A38CD3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2400B10E5CF;
	Mon, 17 Feb 2025 19:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ajAS0DYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA20F10E5CF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:58:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5461b5281bcso1650640e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739822302; x=1740427102; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+eM01ELy6RFiGkjcxOpb1cojVzPpVE9t9t3LF3deNmc=;
 b=ajAS0DYmZytZiaFJ3gKnRPzR9JK48JT3FYjp7a84CQ5VMbShQLy27k/tijXgI4xu8V
 ol6CE/e3P48e7mBEMHwvj3HEmJRDaBWbv4Pjtjr7iZ3sNbBKQQF0mifVzz3sNzQNsw8J
 TvpvlhUQg0nXVbcrhYKWKOXMPWALP0mUaAP32Uyx3/zNR6dfJfZj3LLoZ+D7WKZ727ne
 ped/mhH5xycsraTouH73ay8CdPaqXuxPyiudAAR70/Agw2QtTqnJohqpAPXzWRLNAaxA
 lsRroE4tWa2LIKkaOocHFVGVrtPbY3lM9xhSjWnbWgK2s2r+mOH/v0uq7lI4JHcsOqIE
 YZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739822302; x=1740427102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eM01ELy6RFiGkjcxOpb1cojVzPpVE9t9t3LF3deNmc=;
 b=iKo98EffXXl8WGhJvXCqLzIa5QSL66CgKl9/VA33EcIlJgW4rxCqWVKfZwJ9rM7F8i
 tGNleYbSoiSSy6tR0ERbJsp1uA+RIHo3ktfCpamF1Z3O9byfeWwkSNIT1YnBrJwDRu5w
 Fee4ylvCfHdeFIJAPPdEINtcTX5A+RyoYqfRTHVPZUkpoLa8qE8B5sQsMbsRjBQQDwmw
 U9SscNp56U/Jl2jwJ3hjrtcAjq2j4dTcvuBpeOWp6rQ4aTK2waPmLD8PSffjrLTmqGS/
 XjToLdpcTN/a+JcTBndRveUs7E4UoiG7V5xBIXCf02drsWbEa/QyN1nKxQpOPsW7Dc6E
 V59Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXetO2lLfPNwnzQvVhtmcZMVQ19VlpPX+obDiOVughxDfu76tEb28So0/99xtGcRp6aqkZ2KsYAET8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycva8byOfQ1xv1rIA4hArLlQkgYLXLRdSHEYcLpuw51DBWnHBB
 QSzOaCCOU7IYeAcLS3WS5fa4BOPhYOs7yGTcHfpZrDE8rfQQWmDbLPwPupsrJGU=
X-Gm-Gg: ASbGncucC0xq7/2XuDd06I/VeBZsSvH0mZsuD91SMOSG/9FIHVBDuw7qTnvDfqvTXeq
 /zv/zIOQIgPK6XhFUR1PedLEDE+Llyeao0oxuiwaZYNj0WRKgoLSXR8f5AmNB2r/Ggw0G0oCuly
 ZNVz3PdbDCHUkmTOe509r3cKPwY7pJoFOAGgd8ancLy4MfuphX+nD/SRq8XCBl2fqYX5wtfnRCT
 pnOSeAYj9gKOobHyr3RHbcBdI3pXBvtKS3W35ydJU4myiTFlhrZ+iqEJLd7saqCN/mRNx3/J0cY
 dSpvRXMM0fEpf5Xsyc35+1LY0dzNod4+HSuylWYBklt/RfVsWJLZX9nHIhp9Lg/1u0B8RnQ=
X-Google-Smtp-Source: AGHT+IEbKDaSdPLHIMQ9eXv6L5J9v69avK8N05Xy7KhfzTpN1ljeSBVhl0WhGYyS/jPkWJgZWNtb/A==
X-Received: by 2002:a05:6512:2823:b0:545:4cb:b25d with SMTP id
 2adb3069b0e04-5452fe37326mr3210895e87.13.1739822302051; 
 Mon, 17 Feb 2025 11:58:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452b496aafsm1288648e87.29.2025.02.17.11.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:58:20 -0800 (PST)
Date: Mon, 17 Feb 2025 21:58:18 +0200
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
Subject: Re: [PATCH v3 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <lzzp5cgsh3qegxtctttys3tvtr2j2ciurm2jnmmm3d6cgjei5z@rzu4p5afxf6f>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-3-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-3-90d0fe106995@ideasonboard.com>
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

On Wed, Feb 12, 2025 at 04:56:07PM +0200, Tomi Valkeinen wrote:
> Add greyscale Y8 format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 1 +
>  include/uapi/drm/drm_fourcc.h | 3 +++
>  2 files changed, 4 insertions(+)

My 2c is that it's useful to have YUV (well, Y-only) grayscale formats.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
