Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05E4894580
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 21:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A768410E450;
	Mon,  1 Apr 2024 19:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jqdRDK/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7648510E450
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 19:33:49 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-60a3c48e70fso43334467b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712000028; x=1712604828; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+LHCIkXc5kFczmKalYbrfTJscdj4j7KddNDmuRCIrvk=;
 b=jqdRDK/WcrkE40zhRo6w0Mh+qDFU6KyqN5Gq08dw6RP9gaVuyfb8uyRYCDP1Zl0nQB
 F4UxVoEy1isp9FfIUA4fn9/7W9SLZo5uCJe9VvNhDHsAODRBSRd9iYA1QNfxl5vUFd9z
 GICKlN+0fqiDRVDOAn8I/13hpVoFMo/wsMiXi4qsprPHH7L159c2/RS4W8K0GOTsDxiG
 WuVrAjK6MzxO6AxdGO0V3q8zFNLgU0h1x8/hS3PAzyV84nkDvqYGTHpsKBb6cexPFn4G
 sJOBJk7A0UARD91bOxaREeLHXEG0rKTU0YmpO8YmcRbb2e3xu2/7OnBrb9SiaYXBfoDl
 ksww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712000028; x=1712604828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+LHCIkXc5kFczmKalYbrfTJscdj4j7KddNDmuRCIrvk=;
 b=ACQOrxN2uQr+/BpJZ66grMfxElyQ45dd350bkzpeztjtyu8WaGORwGw4e54utvZrLl
 99nsfq0CJYxt/OVdLQ0+oHvHMz+xOtas6FXDYBwuwLWTcDRGpLU0n53Igsvqk2uBZDeX
 VgHebGvAaS/4b+BNXcyHPtH1iiqG8weOY2JbNRVwYltYY9jcUY7+6x6C867uqIvKhPLy
 +cCVAqiE7ueiAWgKK0lWcuLpPsTk9oGCGub6IPsgw2tB5UZqB4DRVJiBgSK0B1Lhk2fv
 4bvSksAFzazNFHzO5q04cRh7nXGNLeknK6qs7l6/CRJ2HdnezAjxDK1PMRde1djdI0HN
 jP+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXruoTFALPohcYIn6ZsuBll2+B9O9IFJagjTHECjHmpgXKahXP7tYlAK7q1DHjL7cfAISYuiKoU1xMXYjbQYmXi0suiGzs4kJDXhoodCvBN
X-Gm-Message-State: AOJu0YznZsY3XuQ+8sI9EKGFNKguJIFhfZkSl34U2bLD3efn0iui8FQk
 d+s2VJSjjT4SSJ0mh6wbfYPTrrcdoCUgQjA5yiTAJtqFsT7QeRka77kHdfHqSNBbfQ009gEmZxX
 GIJlzXYP21cgeuWxfeY1CkweaMSOrb/RQtljQlA==
X-Google-Smtp-Source: AGHT+IHSl9m2kJnaPCQ0YzssVwbmthydWbARdb9jv81G11vj01HVeVU4SQc3rn2c4q+JQjFkfM1C/4FcBpa1iC6qBg8=
X-Received: by 2002:a25:a83:0:b0:dcd:5e5d:4584 with SMTP id
 125-20020a250a83000000b00dcd5e5d4584mr8131109ybk.34.1712000028409; Mon, 01
 Apr 2024 12:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240119102215.201474-1-oleksandr@natalenko.name>
In-Reply-To: <20240119102215.201474-1-oleksandr@natalenko.name>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 1 Apr 2024 22:33:37 +0300
Message-ID: <CAA8EJpopbgOs29RTzKf=qOFdX9WFzAxEumY2WOC2B76tVgxH-w@mail.gmail.com>
Subject: Re: [PATCH] drm/display: fix typo
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
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

On Fri, 19 Jan 2024 at 12:31, Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
>
> While studying the code I've bumped into a small typo within the
> kernel-doc for two functions, apparently, due to copy-paste.
>
> This commit fixes "sizo" word to be "size".
>
> Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> ---
>  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Fixes: b3daa5ef52c2 ("drm: Add helper for DP++ adaptors")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> index bd61e20770a5b..14a2a8473682b 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -52,7 +52,7 @@
>   * @adapter: I2C adapter for the DDC bus
>   * @offset: register offset
>   * @buffer: buffer for return data
> - * @size: sizo of the buffer
> + * @size: size of the buffer
>   *
>   * Reads @size bytes from the DP dual mode adaptor registers
>   * starting at @offset.
> @@ -116,7 +116,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_read);
>   * @adapter: I2C adapter for the DDC bus
>   * @offset: register offset
>   * @buffer: buffer for write data
> - * @size: sizo of the buffer
> + * @size: size of the buffer
>   *
>   * Writes @size bytes to the DP dual mode adaptor registers
>   * starting at @offset.
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
