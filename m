Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330789029E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6088B112483;
	Thu, 28 Mar 2024 15:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BtXeiTNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592BC112497
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:05:56 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso1106998276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711638355; x=1712243155; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r7bGdWeyTZE+v/hiYTWzmpOp2yG8N9TrrPpWA0TuJjs=;
 b=BtXeiTNV1S3LoQIZ8g1sw4LXql7UU+ej6uQ4bPLEhJoDdddMRhxJuslKSG1DDXyHAH
 CHMu1M4SN2uhDtBF3tj6C/3qCBEANEbZ+ejf0bx3vbAbj7jwr6wygDm+O+Pb04jGkxxa
 rtbNK43cewcm8mqdMgAPNlMI6slo+f6RgMNuRi2LZQVxNNP6GlMMCnyH2A02eFGpz6gp
 ddOqTjMI7MypJvBnF9L83BKde2XwsR8Y/DG8ZW5bsQmEv9RQ7W+OeuTO2g+EQHevn0wt
 9qaQ0p9Wel7Vxo/LBd+QlrkMr+lk8DhPj1hQDoS+V7IU+/xFYm+h8glgFQ4E9safUmGN
 iVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711638355; x=1712243155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7bGdWeyTZE+v/hiYTWzmpOp2yG8N9TrrPpWA0TuJjs=;
 b=NQ9nCfD9CCwI0PEbRoktXSHnEH3vaUqqpRFYQQ2qLE+WF45tmnCXThmMDYbNVtP5na
 oBlZQdPSnFtg4I3KFEAdkMzgWoUgMJN+CPYxFgqRosaz+9ItryOoIEvY6mba4gCpFXsf
 FvuU0Wr5kfXCGpKizcQsk3MkWdPpdrioF02aavrSoYTN5X68CWHst/6st0dtcxXLv76V
 xYHdTszKNH/4nHEkkBnyFbNn9A5V/8YDF0Y8BnU0OAwfdtdgdAMxkRB2Qn/wdB1zN5lq
 NAJ9zIOrBmSFVbfdpXu5qqEQJOo+IHHwC8JpdMaiifvzx+j9le5FJ3jaEs6WNZ15C91K
 Kv8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnEyb/BPTmMk+ZSlrNlnqRtI56ooVVoyV15Ez3qo4BkLSbXMZoF+j/PNmbnJjsrptClVshwYc+yo46QTRhjSnIpukJ2s/tot9gUZjO7EYG
X-Gm-Message-State: AOJu0Yy9TTl28D40ngPF9ioNQQfc5LffocCSUms4pcC8gevzs1S3t8wO
 FQlENExSdyGkE/TzLCraiv52sxda1EU9ltRO0o6YhyXc5EYSc2WfBAwJj57Psbs1q6DxGbnwi56
 dHnJL+ScibL0qJk46xNHVIFymm80HiZchk5pM0Q==
X-Google-Smtp-Source: AGHT+IH9C5vQfo3ufXXbIVDu00aw0luf0LefmXXZ7b6/7UeeM/iumG2KxhxjceuYvQ2XVMBExs8k315o2JGSuTOkAN8=
X-Received: by 2002:a25:8e0e:0:b0:dc6:54c5:285c with SMTP id
 p14-20020a258e0e000000b00dc654c5285cmr2609083ybl.0.1711638355232; Thu, 28 Mar
 2024 08:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org>
 <20240328111158.2074351-2-jun.nie@linaro.org>
In-Reply-To: <20240328111158.2074351-2-jun.nie@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:05:44 +0200
Message-ID: <CAA8EJpqHyg0vnKR3Ty0z-uwsPD_Bdgnn1YsTs6Lkbn4j0Q0QAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: visionox,vtdr6130: Add
 mode property
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 marijn.suijten@somainline.org, sean@poorly.run
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

On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add DSI mode property and compression mode property
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/visionox,vtdr6130.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> index d5a8295106c1..36ae94fa96ec 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> @@ -26,6 +26,14 @@ properties:
>    port: true
>    reset-gpios: true
>
> +  enforce-cmd-mode:
> +    type: boolean
> +    description: Set DSI as command mode. Video mode by default.
> +
> +  enable-dsc:
> +    type: boolean
> +    description: Enable display stream compression
> +

Bindings describe the hardware, so this is a no-go.

>  additionalProperties: false
>
>  required:
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
