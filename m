Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F6AAB3A84
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BA810E197;
	Mon, 12 May 2025 14:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="GDMFg2tJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B5F10E197
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:26:36 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-400fa6b3012so3707545b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1747059995; x=1747664795;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6MHmHt5KrhGfVdCCVVSYk7zFa7SARfEF+PYfhH9l5pc=;
 b=GDMFg2tJzeKez0OQ9XmI5CFNBkrAj5j4h2AMw6jue5CPfdrq3EESFR3IaLKiojvCWS
 e11CBqV5QJSgMoiUBnNXsC7hYIx6/+TKg2gZyKWyeZ1rLcEHMBBWsrDDDzt3K0QmCfp6
 maIhXOsKPr3oaJkYRRKqifHUKFEukJm/6XYgwtWlhTo19d/LeTjGp2N2NcUgly5e+rs4
 k/UfGxyPD/CNf4EWfiasotwqA6kBrwRHWEdwU16pjSCMLqjF48oYWtkCHuoJvIPU2CBS
 vs+JKJJIVeIUboz5Sp1pD+sU7YW5l0kmpwnZIdgS+vCMxIg4o3uSwRR14jPbbdtjEUjO
 rmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747059995; x=1747664795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6MHmHt5KrhGfVdCCVVSYk7zFa7SARfEF+PYfhH9l5pc=;
 b=oDE0nrhl7okhHJ+qEE5mMGOABWV7pv0MDN/iBPVREztIkUXDAvVoieJfqghUkBnFvd
 DbMCdh4G3dt8QrPnLh+2VRg/tt5KAE4+2MyUi/qEpYWBt1qLRVgdjzsiSHfW6G/iBnFw
 l/mZUPBxIv/yDRQgTSHkcPPCFj+kovpvs6CbGrvDg7pHqR9vfWEWojAvZn0z9mDGFqcb
 WkQVfOZIu3KHJRhSzXEhlcnAqlRq/35h3ScNZ/Hc09uhlH5k29zD9ryb94KvA59cQonw
 n0UESPOvwb+Bq0q9P3tjGGx1WmTwfeXXPmiXxUQNwR4lWqY9fq02/nFxOnukrz4+Q/dS
 CF6g==
X-Gm-Message-State: AOJu0YysRgiw4BF6dB+MoHpltiLNDlYJcPzKjTo52rQAqXno1jxP3uSu
 O9g+OeI3XV8mzQx/NLeULxmRZkWe/qzJm8a1+0sVv6lYCEXOoeWfI7wLEi7yq/CFK0pRuGZyxW1
 lOtdMYCARYoVo00+hEQlYQBwZpG08jMZdW3ud9lt0RNnJaG9tDW0=
X-Gm-Gg: ASbGncvJ456DqAVv2cmobPLFN+B6VnoOjyh3LUzfWoQ6yZZESBOqkyKVyNpa9xYEROx
 4uOqefB84wFjmUUWYMFQw4r14/VL2GoYT01KjqKhmLyx3KVrYYFdADr4pSet4Ks8UXh8DKU1mi+
 3Zp2pQ1H3vfRsNxLEE9jinuz/J4Lasafg=
X-Google-Smtp-Source: AGHT+IH2fuOB8ReHzkp6on/K21sFkx/NVgIg4B4uKYyDj7XuJsTc37/iPS6pDLoDczJPW3TiLUEisxd4Pf6t9Y5/9rI=
X-Received: by 2002:a05:6214:2347:b0:6f2:b9f4:3843 with SMTP id
 6a1803df08f44-6f54bb50cfdmr294157146d6.22.1747059984510; Mon, 12 May 2025
 07:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250509133535.60330-1-robert.mader@collabora.com>
In-Reply-To: <20250509133535.60330-1-robert.mader@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 12 May 2025 15:26:12 +0100
X-Gm-Features: AX0GCFsz7xqAqhxMQN2gxiN4jcfMII-JZMRKkXxucf7GQES_oR2egsnzqeC_7NU
Message-ID: <CAPj87rONHCNJQ_aaWtA32uLZO1hxGMdb0cty8E-GvnyxpsoarA@mail.gmail.com>
Subject: Re: [PATCH v3] drm: drm_fourcc: add 10/12/16bit software decoder
 YCbCr formats
To: Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Rob,

On Fri, 9 May 2025 at 14:36, Robert Mader <robert.mader@collabora.com> wrote:
> This adds FOURCCs for 3-plane 10/12/16bit YCbCr formats used by software
> decoders like ffmpeg, dav1d and libvpx. The intended use-case is buffer
> sharing between decoders and GPUs by allocating buffers with e.g. udmabuf
> or dma-heaps, avoiding unnecessary copies and format conversions in
> various scenarios.
>
> Unlike formats typically used by hardware decoders the 10/12bit formats
> use a LSB alignment. In order to allow fast implementations in GL
> and Vulkan the padding must contain only zeros, so the float
> representation can be calculated by multiplying with 2^6=64 or 2^4=16
> respectively.
>
> MRs or branches for Mesa, Vulkan, Gstreamer, Weston and Mutter can be found at:
>  - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
>  - https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
>  - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540
>  - https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1753
>  - https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4348
>
> The naming scheme follows the 'P' and 'Q' formats. The 'S' stands for
> 'software' and was selected in order to make remembering easy.
>
> The 'Sx16' formats could as well be 'Qx16'. We stick with 'S' as 16bit software
> decoders are likely much more common than hardware ones for the foreseeable
> future. Note that these formats already have Vulkan equivalents:
>  - VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM
>  - VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM
>  - VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM

Thanks a lot for these - series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
