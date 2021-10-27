Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A4443CA73
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93E66E891;
	Wed, 27 Oct 2021 13:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0698E6E891
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635340781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmBW9ZsJpllmwuQ41q44efrPHGVrMnFkjaAV59vBkn8=;
 b=NmDChbNTXLZ5z1oHWuM+zW2s8g6UIunJGc7hSo9iG+13udCJ9nr3BdHXxkydO1kd5K2n+G
 2Ee6E006hlboUuRyC7jVuHUonq+00e1r26wt+r1AQ1Eb3cBUCtbUPrYEuM3OOT1LqUXjG9
 XHTErE6ldrHzABsEqLqpR4Ihl3ilLnM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-xYj5kRmxNGWMJNVKiiQDjA-1; Wed, 27 Oct 2021 09:19:37 -0400
X-MC-Unique: xYj5kRmxNGWMJNVKiiQDjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso1972928wml.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NmBW9ZsJpllmwuQ41q44efrPHGVrMnFkjaAV59vBkn8=;
 b=d8K2AvEXS+3Js8GUPGYDJiZhgvLqkc6ndIfg70fr6L2WsgjrET6E1vsqgQ2QvfYI+9
 5KBR+9FtWxySclGrjierHoeJvSAOjICqX600ET1pMG/2jRF/AsP0QBmLgFmJAOAt/n5v
 inBAYKyUSShNPxA6JUEtWZwjOUDOf1S8qOUHYWn5dSUn5VG5fbPqA6xAffXhXqthMCc4
 0kbFq6p2tXFcnHr8BNaYUsIwXVU1lVDNTyyKzYTcWD9wxEx+XBSkOvBqKCJCzO/k1CjD
 UEny1nB9782QRW4pV4nhBDyFVUrhUnUdPiRBeFM4sd5eYThzZC8FY+ieSaokeVZdHGYk
 6Vqg==
X-Gm-Message-State: AOAM5328KnbKduA60GYyGQSW6gRwTm2+TvPdHkiylSZnDv04t8IDWk+L
 tjoIXXzaS6UQ94i9DfL0uW5LSklOhE76VivTMN62grTfjZfFym0Bwwm/6k4+/16HfGrhDaFKnEM
 B9tEQg/ab1rfIxBAdpsAjWHJI077v
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr5937763wmj.98.1635340776734; 
 Wed, 27 Oct 2021 06:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGZ+C2x7YeFPeS66m8A33fG4z3y9tcXC+XOvNQf+SJwdpIXNQgevr3zC4K6F099z9lmcXR2A==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr5937727wmj.98.1635340776362; 
 Wed, 27 Oct 2021 06:19:36 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id x21sm3415372wmc.14.2021.10.27.06.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:19:35 -0700 (PDT)
Message-ID: <ca11cd15-3877-468b-c6b7-9022b6b11824@redhat.com>
Date: Wed, 27 Oct 2021 15:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
To: Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook> <YVXJLE8UqgcUNIKl@phenom.ffwll.local>
 <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/27/21 14:18, Arnd Bergmann wrote:

[snip]

> Right, how about this change on top?
> 
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -117,9 +117,8 @@ config DRM_DEBUG_MODESET_LOCK
> 
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
> -       depends on DRM
> -       depends on FB=y || FB=DRM
> -       select DRM_KMS_HELPER
> +       depends on DRM_KMS_HELPER
> +       depends on FB=y || FB=DRM_KMS_HELPER
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT
> 
> That would probably make it work for DRM=y, FB=m, DRM_KMS_HELPER=m,
> but it needs more randconfig testing, which I can help with.

Looks good to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

