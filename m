Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136C6AE7E4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 18:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDAD10E02D;
	Tue,  7 Mar 2023 17:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3110E02D;
 Tue,  7 Mar 2023 17:05:28 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bp19so10133513oib.4;
 Tue, 07 Mar 2023 09:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678208727;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7CGKDVh+i2FWK5xtLi5YTbqdfVgBlYik8IPEIqJIDI8=;
 b=nm4RCIJ/gCqHmbYXZN2vshBQoyjG98GJ3jGZwatgLhL34hz8VOYvD6HUMpv3+Zipd5
 sEl04mmqQ1kBqv4em/4KuSEvX6WMNYF1aDriyLyfXcyLI0b2dCd5agcl8spEisWmlzEh
 vxnF5B/qqt+TYEFUD30D+ymWCnr95wmJu+wOIvglIVD7JUOU9plQlk7YMlYWzFQYfz85
 mHIfSrq9Ep9uJFCy/zCQmhTIFaLXKkuhfum1hy3Dpv6oqk8vzf46zznKMqKZjEL0bCum
 75rNxEcG3YDK6VvHC4thmmotMniIgoAsfSHsARo3Pzzx7I+qHeEn4C8DT52GU7gaz9Nq
 xL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208727;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7CGKDVh+i2FWK5xtLi5YTbqdfVgBlYik8IPEIqJIDI8=;
 b=PdQo14IjNY3M2RGi5sG8F9WKmRJjmb1B71YgXuhj18/HqhM6dY2K8j6sHNlKOpryv5
 I3bNnZbSS4+aY51N++WiJ5c1d66RFgsLa+1hw6MdejzlWoambhm7zS1+8Pgh+kGZAz/Y
 Z06OG5mSm80sxOOwpiywNkJYZJ0u4dxU6yMBBCQqOtf/q5SwHr1V2AmNCzuWqcQJUGni
 4j8x2Yetg40Aedxz68GBAmaC4cudLYYt4d9zToDLxYwW7z7IbcZudl4gA/S6s07PXQjz
 rKCdnY8cAK3xlHSblly1RxS6Ye02fkeS6prHycj3FU64YsVazIWEAO+nZwSfnr3PCoTM
 Ycpg==
X-Gm-Message-State: AO0yUKXB9/n9+lI93sd9XYLCVBBkQRBSCGqqG4by8Nk7QaMT2xTX99//
 IuR+keU9MpyK19Qy0G+dWXmoxeKlRedr1sXbuWI=
X-Google-Smtp-Source: AK7set9P+LkBZjYXpbWONua/huz3ObjaqzCrqRNBF/SlUCUA6CRljg2SrXgBRc4MloOheTNXSvYjZU09Y3lmPspTfxY=
X-Received: by 2002:a05:6808:994:b0:37f:a0a1:bda1 with SMTP id
 a20-20020a056808099400b0037fa0a1bda1mr4943210oic.3.1678208727262; Tue, 07 Mar
 2023 09:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20230305212411.25727-1-husain@alshehhi.io>
In-Reply-To: <20230305212411.25727-1-husain@alshehhi.io>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Mar 2023 12:05:15 -0500
Message-ID: <CADnq5_NCCNYLnSkQaZPXC+9hkNsMdzLh9bSw9Ybg2FmWaYFDFQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/gpu: fix typo in comment
To: Husain Alshehhi <husain@alshehhi.io>
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
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Mar 5, 2023 at 5:22 PM Husain Alshehhi <husain@alshehhi.io> wrote:
>
> Replace "isntance" with "instance".
>
> Signed-off-by: Husain Alshehhi <husain@alshehhi.io>
> ---
>  .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> index 007d6bdc3e39..734b34902fa7 100644
> --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> @@ -1971,7 +1971,7 @@ struct dmub_cmd_psr_copy_settings_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2029,7 +2029,7 @@ struct dmub_cmd_psr_set_level_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2056,7 +2056,7 @@ struct dmub_rb_cmd_psr_enable_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2100,7 +2100,7 @@ struct dmub_cmd_psr_set_version_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2131,7 +2131,7 @@ struct dmub_cmd_psr_force_static_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2206,7 +2206,7 @@ struct dmub_cmd_update_dirty_rect_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2344,7 +2344,7 @@ struct dmub_cmd_update_cursor_payload0 {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2391,7 +2391,7 @@ struct dmub_cmd_psr_set_vtotal_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> @@ -2429,7 +2429,7 @@ struct dmub_cmd_psr_set_power_opt_data {
>         uint8_t cmd_version;
>         /**
>          * Panel Instance.
> -        * Panel isntance to identify which psr_state to use
> +        * Panel instance to identify which psr_state to use
>          * Currently the support is only for 0 or 1
>          */
>         uint8_t panel_inst;
> --
> 2.39.2
>
>
