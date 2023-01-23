Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D96787CE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A5610E55C;
	Mon, 23 Jan 2023 20:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A8510E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674505865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uvUFT3kV4hOrH8BWbPQYPcqX1gmhS+oL3sA9caAYEgg=;
 b=fsGRtFfjsYBCjZ8yXGxT2tPXWNvgr4kzskld2s3hhv3/xqY/hbFmwNoFCcbjiVcJ33XSit
 rFpdwaR31R3CU868gHmR/blzCDSjADV/GQ664+h18i5W84mOKi/Vhrdq4s/1U5qiVBFvSv
 7OLtn7UUeU+katLBUyRLFFUzWDVJUh4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-Allql66zN6Wcnvmjl26e0A-1; Mon, 23 Jan 2023 15:30:58 -0500
X-MC-Unique: Allql66zN6Wcnvmjl26e0A-1
Received: by mail-lf1-f70.google.com with SMTP id
 n6-20020a0565120ac600b004d5a68b0f94so4202334lfu.14
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvUFT3kV4hOrH8BWbPQYPcqX1gmhS+oL3sA9caAYEgg=;
 b=hzbxt88+QqWNQm/lptuYD0Ltzx6CzlsBXcxYLbEOEh8AQWTmWMWZuX0pD8hSUZyAyk
 hAXULE8+xzG7t2QTPyhAy83dMenMAyC4XzVK7/W+QGHG98VIQcBwkWmqj564oWhaW7FZ
 dFLcLGtLUnFqQoNctqaK/KYdsflXwZiyDhbeoEKB+jivYfjBkuViUqj2kBL0wAMRz+fB
 CZr5kZJJsZwtr08P/oPF+qMls8aT8WYfNyUZLGvrlt/6pEq19FBGGOtPlyMYXQYrW7Is
 2dzv/aogd6oBwdicX1uTeH1PNW+YZiJIthCk9NUmbjlA+RPmHBVmsL6YA7tUVX+2/Kg6
 ewew==
X-Gm-Message-State: AFqh2koZyxufambcunWXOO79jnJF/EnfknMmfsal6UawvcXfFWA3KR4F
 xi+eT/xwhNN1P0jR6uV6ObbrKlOfmlav62wW+UcRnaFIKwGnFrrOGdz3qfF1WTthK6OAJsWzoiw
 OYrUn4qaIX6BJfCWAX12g93BpfPFtxPXuScbu6P67bNC7
X-Received: by 2002:ac2:5451:0:b0:4cc:971c:b3f6 with SMTP id
 d17-20020ac25451000000b004cc971cb3f6mr2729379lfn.77.1674505856608; 
 Mon, 23 Jan 2023 12:30:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsFYBYAL9y60IeorNFy250ZZasB8/QgVaF6tMPDxWwgf8FxW/qYJrUCfop49dKr4nz/GHs7XtNBQms1GfDA7DM=
X-Received: by 2002:ac2:5451:0:b0:4cc:971c:b3f6 with SMTP id
 d17-20020ac25451000000b004cc971cb3f6mr2729373lfn.77.1674505856429; Mon, 23
 Jan 2023 12:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-19-harry.wentland@amd.com>
In-Reply-To: <20230113162428.33874-19-harry.wentland@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Mon, 23 Jan 2023 21:30:45 +0100
Message-ID: <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the
 pixel encoding is not RGB
To: Harry Wentland <harry.wentland@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Joshua Ashton <joshua@froggi.es>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A new property to control YCC and subsampling would be the more
complete path here. If we actually want to fix this in the short-term
though, we should handle the YCC and RGB Colorspace values as
equivalent, everywhere. Technically we're breaking the user space API
here so it should be documented on the KMS property and other drivers
must be adjusted accordingly as well.

On Fri, Jan 13, 2023 at 5:26 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> From: Joshua Ashton <joshua@froggi.es>
>
> Userspace might not aware whether we're sending RGB or YCbCr
> data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
> requested but the output encoding is YCbCr we should
> send COLOR_SPACE_2020_YCBCR.
>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f74b125af31f..16940ea61b59 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
>                 color_space = COLOR_SPACE_ADOBERGB;
>                 break;
>         case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -               color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
> +               if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
> +                       color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
> +               else
> +                       color_space = COLOR_SPACE_2020_YCBCR;
>                 break;
>         case DRM_MODE_COLORIMETRY_BT2020_YCC:
>                 color_space = COLOR_SPACE_2020_YCBCR;
> --
> 2.39.0
>

