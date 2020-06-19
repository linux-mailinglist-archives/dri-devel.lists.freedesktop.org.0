Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B90200989
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 15:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CFF6ECA6;
	Fri, 19 Jun 2020 13:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C475E6ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 13:06:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a6so7675793wrm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 06:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6ZcsGijeFBjmFWeyCrYME8fKNYJdrkpJbfctPNEZWTM=;
 b=M3Voe848STIMHx22PtbPlsyjMRtGu7vwUDyCTxUf5RjyYaIQw6jwzXL5Ny+sVYsjna
 /PhoxB46c7yvxRufeZBzC38JB+0jkjl1eXKYRoc3/AlR9dODi6aROqG22I7ZF9tSIBOK
 PXwEY6LuGdlET+y+GyzDTwhSAR4NT1RY4r0CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6ZcsGijeFBjmFWeyCrYME8fKNYJdrkpJbfctPNEZWTM=;
 b=oOJ1b1q1U4zfCqxU6u7T4N6Hed64r3ioRqQpFO93As8cE0IjEEVmt9hCvFslAQTZFJ
 wPYdt0s5yeldxYxIW05CxYCufnN1CeY07+o+EQcpGhssuYu0Z7VkDnix5o8KQbU0ZaIC
 6Bm8M4lWrk2SfRrOSALaziJd2c2kiWgVPuWS6RsRTQ0Q7R85dtK0idctV5oIDx+zmcGs
 n8IbAc2MSzOocSXm2Cz+xykeepi1LHCS2VycuPrnqnlQNKWIq/q6C9v5QoMrpLLqwDWF
 CLTPsih9F/QEHQok/Ixb7RSok1aqRaVTmkLizOEuT2AFVJI2BqB79GIZfGoLMLiirUbO
 H6pg==
X-Gm-Message-State: AOAM533VqYtrpIO++WQj97Umicjx9v5kENjf9RyIDUWnXN5SOSWcFxt0
 cdGnfpOTlBVL/s1mVJnTd1aaDA==
X-Google-Smtp-Source: ABdhPJz0s+qIfPiYuc8Lb/5oTgaLOoIzxPjMvqf0zr4zeqAxjxDIqYXqcMBtiIrMcp62Jo53s0zktg==
X-Received: by 2002:adf:8b18:: with SMTP id n24mr4251611wra.372.1592572017564; 
 Fri, 19 Jun 2020 06:06:57 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id x5sm1585452wmg.2.2020.06.19.06.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 06:06:56 -0700 (PDT)
Date: Fri, 19 Jun 2020 13:06:55 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [libcamera-devel] [PATCH v2] drm/fourcc: Add bayer formats and
 modifiers
Message-ID: <20200619130655.GB241696@chromium.org>
References: <20200521235201.279642-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521235201.279642-1-niklas.soderlund@ragnatech.se>
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
Cc: libcamera-devel@lists.libcamera.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niklas,

On Fri, May 22, 2020 at 01:52:01AM +0200, Niklas S=F6derlund wrote:
> Bayer formats are used with cameras and contain green, red and blue
> components, with alternating lines of red and green, and blue and green
> pixels in different orders. For each block of 2x2 pixels there is one
> pixel with a red filter, two with a green filter, and one with a blue
> filter. The filters can be arranged in different patterns.
> =

> Add DRM fourcc formats to describe the most common Bayer formats. Also
> add a modifiers to describe the custom packing layouts used by the Intel
> IPU3 and in the MIPI (Mobile Industry Processor Interface) CSI-2
> specification.
> =

> Signed-off-by: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>
> ---
> * Changes since v1
> - Rename the defines from DRM_FORMAT_SRGGB8 to DRM_FORMAT_BAYER_RGGB8.
> - Update the fourcc codes passed to fourcc_code() to avoid a conflict.
> - Add diagrams for all Bayer formats memory layout.
> - Update documentation.
> ---
>  include/uapi/drm/drm_fourcc.h | 205 ++++++++++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> =

> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d80737..d07dd24b49bde6c1 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -285,6 +285,73 @@ extern "C" {
>  #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsamp=
led Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsamp=
led Cr (1) and Cb (2) planes */
>  =

> +/*
> + * Bayer formats
> + *
> + * Bayer formats contain green, red and blue components, with alternatin=
g lines
> + * of red and green, and blue and green pixels in different orders. For =
each
> + * block of 2x2 pixels there is one pixel with a red filter, two with a =
green
> + * filter, and one with a blue filter. The filters can be arranged in di=
fferent
> + * patterns.
> + *
> + * For example, RGGB:
> + *	row0: RGRGRGRG...
> + *	row1: GBGBGBGB...
> + *	row2: RGRGRGRG...
> + *	row3: GBGBGBGB...
> + *	...
> + *

I wonder if we're operating on the right level of abstraction within this
proposal.

The sensor itself transfers only sequential pixels, as read
out from its matrix. Whether a given pixel corresponds to a red, green
or blue color filter actually depends on the filter layer, which could
actually vary between integrations of the same sensor. (See Fujifilm
X-Trans, which uses regular Sony sensors with their own filter pattern
[1].)

Moreover, the sensor resolution is specified as the number of pixels
horizontally and the number of lines horizontally, without considering
the color pattern.

If we consider that, wouldn't the data stream coming from the sensor be
essentially DRM_FORMAT_R8/R10/R12/etc.?

Then, on top of that, we would have the packing, which I believe is
defined well in this document +/- being entangled with the Bayer
pattern.

What do you think?

[1] https://en.wikipedia.org/wiki/Fujifilm_X-Trans_sensor

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
