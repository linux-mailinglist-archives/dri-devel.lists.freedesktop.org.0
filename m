Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD2597E5C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 08:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ECD12A5AF;
	Thu, 18 Aug 2022 06:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538D90DB3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 06:06:39 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id a15so451270qko.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=cT4f2XhjXBJBHTSJpC4pdUChqVFRK77ChBprqcQ+BVU=;
 b=bq60LqMxqmmufCyuH6E8yRgzSpa0YgzrXIQoeCjJyytvS1FVdZNZidQ7JY6qWrcEm+
 Aec8EbmTohoEYZdrL/KXEuBb9ei088WCipMorbwpAlwCOx+yT+hYnVFKcWDV0Uox9IBa
 eAk/QIIB7ypgUuMjQPcl3mgUEOQhVQ2AUbHgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=cT4f2XhjXBJBHTSJpC4pdUChqVFRK77ChBprqcQ+BVU=;
 b=pzZOczkp2Xm8m2mgmJBiWeQqze5qHJeAdPyoHg9nrjDHVM76avPkmgeth7yu2KlEOd
 e487BHhyjEcWts/0/eRfDGTdzBeJCqvx/f3CDb8DNiHOlPvxCYWLE9ATSA3BSpwctb6T
 uE2EhIu1OIPY8HITWeAA4iNP249bNYH68CPpLfYyvmtfA/Nv+SU4xMHexmNgl2X7b/+H
 fk3zSR5MjE8hD/cnIRykoJkPsHX+1gbKFcunjcS/8M5MX5PAbsC024I2HdbGQJMeyH40
 Sq6e/o+MOx31bBimufpfOMMMMRDbgsyBI3jGudguHbxnqDDfjlMSTm9x0+cm8JCFfGPb
 9t/w==
X-Gm-Message-State: ACgBeo3cC4SHayXqQx6d/jKdSBzKtZ0uEgW34Zt3CYqRpXGU15owWZFO
 gbBLH+WcsQqzDInO+8dbzhY58Kc0b26tEYAU
X-Google-Smtp-Source: AA6agR7BQCAxe+xMomP2t0WkoCLc+MXUZfdqzQ683+BBnHA5VwLHvSMdlKQNkP7fBC/GGqpe3/5cHQ==
X-Received: by 2002:a05:620a:b97:b0:6bb:581c:a9fc with SMTP id
 k23-20020a05620a0b9700b006bb581ca9fcmr1006300qkh.737.1660802798220; 
 Wed, 17 Aug 2022 23:06:38 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 w42-20020a05622a192a00b0031f287f58b4sm401461qtc.51.2022.08.17.23.06.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 23:06:37 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-32a09b909f6so16048917b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:06:36 -0700 (PDT)
X-Received: by 2002:a25:a0c3:0:b0:68f:69c2:99ba with SMTP id
 i3-20020a25a0c3000000b0068f69c299bamr1428785ybm.575.1660802796196; Wed, 17
 Aug 2022 23:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
In-Reply-To: <20220808162750.828001-3-randy.li@synaptics.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Aug 2022 15:06:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
Message-ID: <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
To: Hsia-Jun Li <randy.li@synaptics.com>
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
Cc: linux-arm-kernel@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>
> The most of detail has been written in the drm.
> Please notice that the tiled formats here request
> one more plane for storing the motion vector metadata.
> This buffer won't be compressed, so you can't append
> it to luma or chroma plane.

Does the motion vector buffer need to be exposed to userspace? Is the
decoder stateless (requires userspace to specify the reference frames)
or stateful (manages the entire decoding process internally)?

Best regards,
Tomasz

>
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
>  include/uapi/linux/videodev2.h        | 2 ++
>  3 files changed, 5 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index e0fbe6ba4b6c..f645278b3055 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>                 { .format = V4L2_PIX_FMT_SGBRG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_SGRBG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_SRGGB12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +               { .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
>         };
>         unsigned int i;
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e6fd355a2e92..8f65964aff08 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>                 case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
>                 case V4L2_PIX_FMT_QC08C:        descr = "QCOM Compressed 8-bit Format"; break;
>                 case V4L2_PIX_FMT_QC10C:        descr = "QCOM Compressed 10-bit Format"; break;
> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr = "Synaptics Compressed 8-bit tiled Format";break;
> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr = "Synaptics Compressed 10-bit tiled Format";break;
>                 default:
>                         if (fmt->description[0])
>                                 return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 01e630f2ec78..7e928cb69e7c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>  #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>  #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
>
>  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
>  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
> --
> 2.17.1
>
