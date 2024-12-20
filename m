Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7159F8929
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02E510E2C5;
	Fri, 20 Dec 2024 01:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O2jH1/MG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2503A10E2C5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:05:59 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so15679131fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734656757; x=1735261557; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xy+s2CKKduaqyJIFqoaCm68yMCHXjZ7jACund/HVqKA=;
 b=O2jH1/MGnZ64QRD2FHbTPbifkQwtSGgtrOQXYm0DeZyTWIgIXAgxY1lbQ+EOISZx12
 2qpzj4ydD9Z8V1dLmkFACR4l1S6XRvjsQ6asq4Z/WUNrpcM7CflvHn+aS5JRk2Bv3fm5
 UUWNjVZl0M6YyJU4nM2WVYMFcE9xF+sJ2cmlN2bfqChj3evVVQCz79FhiZuCES13/Xrf
 Usm34mb07gYdNi2fQaWN8BlgMuFa97xNIELU2OjoIF7u6vzlDQb0l1hEM6FupxT0eVFY
 BPA3TeLtX1HtEQSYXOACJ4ZkG5lz/xwxPkrSB0p6DVg1yS0F+XlRsqazWO3qY6g3CYSK
 gL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734656757; x=1735261557;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xy+s2CKKduaqyJIFqoaCm68yMCHXjZ7jACund/HVqKA=;
 b=uKeNT3w+g1KR1miLBtx7nLrVeagzO//HtzuSH20bYnRSExx8vvraMdyel11Xm/fvwY
 MEYRZEiKywDlcH7d9l4u/XnRDqnTxqHHySZuxeJmr1lRSbX3UuNhISk1Sw2dotvCp7Tw
 /MXs1f4bWRmkWkWEWjDEQLS0zLQUwpR2qsyACbdGpsfwLtH0GEbwFcmpnaa3LCHVzEdc
 Objt5tWcjjVgmmbG+zuJd1aZ/+DRWkk8jLR2c/kbRIm3bl6SyTBc7w7Mtwq0R41RuStC
 J+5GeMHqyEjhjE82iD04htjEYAkX6It2TLjrgqvtj/HoztFLilaMHwtuQdkrO/EYRtjN
 geug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4PU+i1DZweMcyYYQDOUNqEzX3RFoEUg7ZDg83224c4FgvNfGcvYDB+T1KZ3v64wG+VkMU4SveuJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDYvwSsrt8eO7iOtM0lR/n0m6cMPn9t60CzvffL/gmDzhk9saP
 prJhNmDjWKRDBm8RpQ9Zd0oIGQ/U16YtvkQjuYKPOXzbCNn4x1PYQs6RQsq95aY=
X-Gm-Gg: ASbGncs3H6oYDLz6YCG35Iizmk6AkzSkMFnkFCnewCGtAws2LkqUVo4ElSBkaUYOLCE
 5zTSTR5DT7WC1450WvyjDrPW8oxfpqeAZWQxIS5YCtHDIwVMEF7obprEZKiDkVnk+UT/ltdSVxg
 RohizgXsnPVyAckIwHGEdNgZMbvmpwu8e88qmKkN+BtTnAm01j+WeLNNkpoGzOT4Cc+/0pxkwBt
 7BMI+DZZq9pdTJ7fXTJfkEe/6NUL3CIkGXMPkUC0VZx1yl9oQxS/Z9u/Jyzzmxj527wilpogvC6
 tnAj6jVNL/ndVNZsMzTHfgOccdMNHKMcMZ7i
X-Google-Smtp-Source: AGHT+IHahCRDbarxOAw+P0AF48/G29b13NHP7isnJGVIyrNOPv+oeKFnxBbEyGa0t6W2jWflTASjeA==
X-Received: by 2002:a05:651c:1501:b0:302:210d:3b44 with SMTP id
 38308e7fff4ca-3046861de70mr3018031fa.35.1734656757384; 
 Thu, 19 Dec 2024 17:05:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cad7sm3706691fa.9.2024.12.19.17.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:05:55 -0800 (PST)
Date: Fri, 20 Dec 2024 03:05:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/bridge-connector: Prioritize
 supported_formats over ycbcr_420_allowed
Message-ID: <7ct4feznensmvubaflaorqlw7uiuafwo5da5etsivogccrwdeh@r6jsztj4dsnh>
References: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
 <20241217-bridge-conn-fmt-prio-v3-1-3ecb3c8fc06f@collabora.com>
 <c36o6ro5qqfkqipltlecb3r22d5k3xiqdt46rtl2gdyha7xtmm@l2ovdfono7np>
 <b7e1c0e9-f8bc-4f93-a280-49cce1658baa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e1c0e9-f8bc-4f93-a280-49cce1658baa@collabora.com>
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

On Tue, Dec 17, 2024 at 02:38:55AM +0200, Cristian Ciocaltea wrote:
> On 12/17/24 1:27 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 17, 2024 at 12:54:07AM +0200, Cristian Ciocaltea wrote:
> >> Bridges having the DRM_BRIDGE_OP_HDMI flag set in drm_bridge->ops are
> >> supposed to rely on drm_bridge->supported_formats bitmask to advertise
> >> the supported colorspaces, including HDMI_COLORSPACE_YUV420.  Therefore,
> >> the newly introduced drm_bridge->ycbcr_420_allowed flag becomes
> >> redundant in this particular context.
> >>
> >> Moreover, when drm_bridge_connector gets initialised, only
> >> drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
> >> the equivalent property of the base drm_connector, which effectively
> >> discards the formats advertised by the HDMI bridge.
> >>
> >> Handle the inconsistency by overwriting drm_bridge->ycbcr_420_allowed
> >> for HDMI bridges according to drm_bridge->supported_formats, before
> >> adding them to the global bridge list.
> >>
> >> Additionally, ensure the YUV420 related bit is removed from the bitmask
> >> passed to drmm_connector_hdmi_init() when the final ycbcr_420_allowed
> >> flag for the connector ends up not being set (i.e. the case of having at
> >> least one non-HDMI bridge in the pipeline that didn't enable it).
> >>
> >> Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/display/drm_bridge_connector.c | 8 ++++++--
> >>  drivers/gpu/drm/drm_bridge.c                   | 4 ++++
> >>  2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > I think the second patch in the series is enough, it ensures that
> > connector's state is consistent, no matter if the drm_bridge_connector
> > is being used or a normal drm_connector.
> > 
> > Nevertheless, I'd leave the final decision to DRM maintainers.
> 
> This patch has 2 parts, maybe I should have put them into separate patches
> as they kind of relate to distinct problems.
> 
> The 1st part makes sure that drm_bridge->ycbcr_420_allowed is automatically
> set when HDMI_COLORSPACE_YUV420 is provided in drm_bridge->supported_formats, 
> to avoid the need of requiring redundant information on HDMI bridges 
> initialization.  This implicitly ensures the consistency needed to further 
> allow relying on ->ycbcr_420_allowed internally.
> 
> While the 1st part could be dropped (assuming redundancy & consistency is
> not really something we want/need to handle), the 2nd part I think is
> mandatory, i.e. we must adjust supported_formats before calling
> drmm_connector_hdmi_init() to ensure the presence of HDMI_COLORSPACE_YUV420
> reflects the status of the computed connector->ycbcr_420_allowed, which
> might end up being different than what the HDMI bridge advertised, i.e. the
> case of having an HDMI bridge in the pipeline advertising YUV420 via 
> supported_formats and a non-HDMI one that didn't enable ycbcr_420_allowed.

Please split it into two patches. I don't have a strong opinion upon the
first one (I'd change it to dev_warn() maybe), while the second one
(removing HDMI_COLORSPACE_YUV420 if connector->ycbcr_420_allowed is
false) is definitely a correct change.

> 
> Thanks,
> Cristian

-- 
With best wishes
Dmitry
