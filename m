Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC966E59D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A8210E59C;
	Tue, 17 Jan 2023 18:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA7710E2FC;
 Tue, 17 Jan 2023 18:07:06 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1442977d77dso32824131fac.6; 
 Tue, 17 Jan 2023 10:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YH0tyjOraCEsXrTRPzVKAAAXeacUbo0t7ksEO6wukzo=;
 b=JmOyvINOTDS5c49Vm6ys7Qcnmb2ez8aIJDdJPlOi6H9Xy/oCNfHp6I4O7GDPBkkDsl
 ervAMVINSTGwc+gTd0wh9n+Ccc8meq8APiQ4M68eL88gKnLq0N8dcoVdmFL4oZqdXd5Z
 9NFHIh03sbkrSYWa04SYRFJgY3GDq5lH8weINQcwDE5bxN21dznr8JRKzqac8l7sufkm
 TRsCe+Y25XDAWoxtVQQhwHOMwSRTGklQ/NikPlOQnkL/qZidWeH9D0G2ZONAaTwOrv26
 6Zdgow2Vo3sdHc0qPvnqHgnEKIsaOaJrK3nSJ53xO+AleE+SntR0sN0D2zjxz/Xl4Kvp
 1FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YH0tyjOraCEsXrTRPzVKAAAXeacUbo0t7ksEO6wukzo=;
 b=hYVRaXt5MEwZ4BMiMa1gc5kFSFRX5WZ7qAWft+gHlNFIhi5iDlXvbgs426TGXVXS1h
 CI7zZjwvxhBLgWJ7bzOWWo43l5yvDl9ggfSHeaqk0nS9VmqaPsshY9bQ6Zud4a8sQm9S
 pBzNcDT/Ux5YVQpNb4Ch8UAMTUwtvEybFzZWbpVyz58v2H9o2zZJt98pT8qeQ6VUiSaO
 zXZQSC4urZjgQ96tXBZuv0PeThoWKKsLgv36A7Zrm54BX03g4FjPM2WjXcTCDcdKBZ/Q
 qDm/iR21pdFDvJ05U26F1ujs2G/EGQsY4fBGciBLd2ohJtXMBYD5vGq01eC/2MoJdPjf
 QeBA==
X-Gm-Message-State: AFqh2krmKpQtf0CPw9S9z9bf8sroMMlAf8UWxkmXBhQ/2OA9DYCzswNw
 ukypyVTiGf7h9sl0bf+VQ9/R7lFr9Fbqo5XFqgHLmNx5
X-Google-Smtp-Source: AMrXdXvAfwvqLHdouE5UEqVR8838wHy2DoFiH1+2lIIyCGtkJZp4YrjxlECOI3RBJoDIky9KDntRkhwgeAPm2uhBNz8=
X-Received: by 2002:a05:6871:4593:b0:150:d9aa:4011 with SMTP id
 nl19-20020a056871459300b00150d9aa4011mr340680oab.96.1673978825905; Tue, 17
 Jan 2023 10:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20230117180417.21066-1-nirmoy.das@intel.com>
 <20230117180417.21066-2-nirmoy.das@intel.com>
In-Reply-To: <20230117180417.21066-2-nirmoy.das@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Jan 2023 13:06:54 -0500
Message-ID: <CADnq5_NY9B4dtswNzowG_KrPuSSFdtpsonY_7wNhtzW0G7uJXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm_print: Remove deprecated
 DRM_DEBUG_KMS_RATELIMITED()
To: Nirmoy Das <nirmoy.das@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 1:05 PM Nirmoy Das <nirmoy.das@intel.com> wrote:
>
> There are no current users of DRM_DEBUG_KMS_RATELIMITED()
> so remove it.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Feel free to take the patches through whatever tree you want.

Alex

> ---
>  include/drm/drm_print.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a44fb7ef257f..c3753da97c4e 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -605,9 +605,6 @@ void __drm_err(const char *format, ...);
>  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>         __DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>
> -/* NOTE: this is deprecated in favor of drm_dbg_kms_ratelimited(NULL, ...). */
> -#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
> -
>  /*
>   * struct drm_device based WARNs
>   *
> --
> 2.39.0
>
