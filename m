Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41ECA130D7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928B710E549;
	Thu, 16 Jan 2025 01:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SJvt+P+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D88F10E549
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:38:17 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30229d5b229so4403831fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736991435; x=1737596235; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X6JVNMptwqfmUo8tWpx6+M2S/BUGYVkQzk4LkYjLkxM=;
 b=SJvt+P+SRXK+IC19Mc6E13TJm/1c8gLeLI+jMd9vt8NGHIiqBaTBEANSQnVrE6Ddnw
 u6E2rlGa5uqznhPxUiSQDbY0e0FK7f0FRs322lGno8daWa7vo/NCpFyVjCc10OocOASi
 p6nmk6GyPdMc7i7fH//bkVNGfM3XS/mv3rA56cp2egYeQ8y6W5x8tV4FLy5aQYJNTRRY
 7Lkgowe2c9L3UMp6/WJm3MfTK867RuOZ7ngy6fnXaMmJQaU0ZdPyhO2djled8fGmb6MK
 /bltIaJ/TNUJ+7DYrIAKx6c9fGZu+kPQ+eXLf/yuBURwpmlRhsntD0xy1KzU/2OcbY3E
 NslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736991435; x=1737596235;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6JVNMptwqfmUo8tWpx6+M2S/BUGYVkQzk4LkYjLkxM=;
 b=sqJ70Ai6uJHdOB4Oocnr/XaNvZx535s0mCikDMtCggvo9/an5wstmYEm9Qqz/7LRPp
 OxaKoGgSPc/Arj7aP+nNNZdR1/ojOKCv3SxkhY8vW0HvYzO2D1XEbq/YW5EfOciwRB4w
 Mzx+58uVHA7c+rZ0XCSanMG/IlUk+KPZ78yfD6qiOO0RTeOXgmd8eCTfL8AW/A7ZRRQJ
 ViN6fAQ6uoQ7WJsHWb/z3Dqv+ckDDXAhV+sgwV3eoc0b7pfTe31KUKi8Wtytg1o8lM/b
 93t+q3ff/7tPCraxpGaA2U3YnPKU+neEHL7P//ancpRlMey9AV/AtmJa4QafyDaZxHPO
 +eYg==
X-Gm-Message-State: AOJu0YxHQtEpJutgQkfwN9tVP+cAXvsoORdZZerhy5JhNycrNNUecWXO
 x3mzrNWriQ2i+ceza5UhdOCWLnvs3di9z84c8dlaN5dH+QE3BOCp13j0mn3VEBU=
X-Gm-Gg: ASbGncsPraC2Hx4p84GHT9w1Tt1QxKEQWr+d1TCWp0/MEYZHy6yHbgmWs4m6h5zRGxI
 KfHD0WD3L4RgeF0D1EbqxKclYilATN7l1DdycDMZH2pDGV6M9W8lenaEEgwwkDTJV0FbFxERnqh
 egoyeSv3wiVlKzepvXvwVkn9seAOCr/LWs6pfvmhX4Uq6PkMgt38kEoRZTj/PktMls5dgqa0TUc
 6hcJxqNg3wS+WGP5u6t02jtoOP5J28jKaPVSx+WoNoHoEaItFHhfrKd6ZclauM3PtBzlXx/q+pp
 2N0RpO03dqIp9xPGt6Cj3O+/qsJOZXYsI+vV
X-Google-Smtp-Source: AGHT+IGjfYuq+KNLYqRLVLFN8rZrdy6vBacFgOKSllEvZrfO/DkBY4VTnS4zf9+dbRULyoWcj+VAog==
X-Received: by 2002:a05:651c:556:b0:304:4e03:f9c7 with SMTP id
 38308e7fff4ca-305f463bbcdmr91695291fa.31.1736991435543; 
 Wed, 15 Jan 2025 17:37:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0e712dsm23490811fa.51.2025.01.15.17.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:37:14 -0800 (PST)
Date: Thu, 16 Jan 2025 03:37:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com, uma.shankar@intel.com,
 Importedfromf20241218-dpst-v7-0-81bfe7d08c2d@intel.com,
 20240705091333.328322-1-mohammed.thasleem@intel.com
Subject: Re: [PATCH v7 07/14] drm/xe: Add histogram support to Xe builds
Message-ID: <45k46w3ir4ytz3eqm5sapbqdzgfbkd7zyy5gl26a4ietlc32u2@c7brxhuuitru>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-7-605cb0271162@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-dpst-v7-7-605cb0271162@intel.com>
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

On Fri, Jan 10, 2025 at 01:15:35AM +0530, Arun R Murthy wrote:
> Histogram added as part of i915/display driver. Adding the same for xe
> as well.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Is building of the Xe driver broken between the previous commit and this
one? In such a case, it needs to be squashed into the previous commit.

> ---
>  drivers/gpu/drm/xe/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed7385616ecce3340ec74580f53a213e3..984def6077efb9b3fcedb2065414173691427e4a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -247,6 +247,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_hdcp.o \
>  	i915-display/intel_hdcp_gsc_message.o \
>  	i915-display/intel_hdmi.o \
> +	i915-display/intel_histogram.o \
>  	i915-display/intel_hotplug.o \
>  	i915-display/intel_hotplug_irq.o \
>  	i915-display/intel_hti.o \
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
