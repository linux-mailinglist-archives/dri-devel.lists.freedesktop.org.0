Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0043C9D9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85B389DB5;
	Wed, 27 Oct 2021 12:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB3689DB5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635338345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drsID2TRJVUaimjxFLYNgX49ECeQkuI1bTTLrAYGzWs=;
 b=MsCDy8sAfCZo7DOGUUa7+/lDfY/Qw9gnE0t1WmzQdUvZwvrY9B2ZJTTbl80c80hO6nLHVi
 hf2Bd2dsYG+WEMKzpzVASuCCDE9bSMCQAT6YFr/FZ3S1UOERnds85Q4DbuanDgd3nQW+u0
 QMeNiy8pjJHJGlBq6DfNVPxsxAJ0pZA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-RClq8PUUMTaXs4ESuL8uMg-1; Wed, 27 Oct 2021 08:39:01 -0400
X-MC-Unique: RClq8PUUMTaXs4ESuL8uMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c6-20020adfe706000000b00168acf1bcd5so613586wrm.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 05:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=drsID2TRJVUaimjxFLYNgX49ECeQkuI1bTTLrAYGzWs=;
 b=tWJowKu1BgZFOBIRQACVaIMwvwBtIANLTVLZvWU1XP/e3X9RqPRFV/nl/Jegp0P0XJ
 OxiravpuEP3pH8us33bOwon46FB+32jTfMEBjED2+9KN4nnlRcCxSUyzasb48C50x0sc
 q71MJkubiL0leT+YlvaLOcwiKL4cXmwR30O4O9sSoFe8hTCboLAICYIEotwuu82UmIlu
 Lb24DnBejrhPIM1UDsW2oU66x5NdpOkgbvfhd3cQCMGwgXDR9msij2uV972YSd4h9qkq
 38bi0tSc5F8NHIyV1njSmQfdp2OFA/Td+FZceN0V/DWueIYodGOJ2DuOmjukSuSZwtea
 CcJg==
X-Gm-Message-State: AOAM532kwkuMA0drBOu9H1kgvMdw78c0BU/1HY2mZVsu2QizRXo3BQ06
 nqBK5mqJqNlQQzhcYtYBNL0pzdMLC8Lc+N+oNd/Wevu6tVMBTwKFXSrKXocD8Y4bPioRMiNMZ4x
 fwL/h24tbh0yNLeRDrz1KMlFJ9G3W
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr5435390wmq.21.1635338340730; 
 Wed, 27 Oct 2021 05:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyUJYUQHFPGEeeUWW5qt0iGapKxZCX79kADIwOLF8bb3nuqrjxlX05B8T42yC9cOdOmlpfFA==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr5435373wmq.21.1635338340545; 
 Wed, 27 Oct 2021 05:39:00 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id r10sm14579669wrl.92.2021.10.27.05.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 05:39:00 -0700 (PDT)
Message-ID: <3604fb90-f6c3-0fa2-c864-7f1795caee1e@redhat.com>
Date: Wed, 27 Oct 2021 14:38:58 +0200
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
> On Wed, Oct 27, 2021 at 1:47 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:

[snip]

>> drm_fb_helper.o is not part of drm.ko, it's part of
>> drm_kms_helper.ko. This adds some sort of indirect dependency via DRM
>> which might work, maybe by coincidence, maybe not - but it's certainly
>> not obvious.

Indeed, you are correct that's not semantically correct.

> 
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
>
>> The likely culprit is, again, the overuse of select, and in this case
>> select DRM_KMS_HELPER. And DRM_KMS_HELPER should depend on FB if
>> DRM_FBDEV_EMULATION=y. That's the problem.
> 
> This is something we can't easily express in Kconfig, as we can't add the
> dependency to a symbol that only gets selected by other drivers, which
> is why the dependency has to be in the user-visible symbol,
> in this case DRM_FBDEV_EMULATION.
> 

Why the dependency has to be in a user-visible symbol? What could be the
problem with having something like:

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index cea777ae7fb9..f80b404946ca 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -82,6 +82,7 @@ config DRM_DEBUG_SELFTEST
 config DRM_KMS_HELPER
        tristate
        depends on DRM
+       depends on (DRM_FBDEV_EMULATION && FB) || !DRM_FBDEV_EMULATION
        help
          CRTC helpers for KMS drivers.
 
@@ -104,7 +105,6 @@ config DRM_FBDEV_EMULATION
        bool "Enable legacy fbdev support for your modesetting driver"
        depends on DRM
        depends on FB
-       select DRM_KMS_HELPER
        select FB_CFB_FILLRECT
        select FB_CFB_COPYAREA
        select FB_CFB_IMAGEBLIT

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

