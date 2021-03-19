Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6C342127
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 16:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5A06EA44;
	Fri, 19 Mar 2021 15:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7196E0E4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616168736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LK0n/jg/OwPro8VFqa34gdHN9jLmsy9oeDxC6+deOw=;
 b=haTRpCucqxSZ+fVdMlD0tDYPFnHaLosNxoCZdTp8ttxxc09cWun0p4yayWN4/Zg3n9hDbM
 WlsN5pWw6/atnHMxGUj1AB0LmhUXAdfqrkCXUAu2gx+OqUBw1mQtm/v8ejw7DHiAw/X/Eu
 Seynyp529Uz58xiFVsbl1DP+gy9FwNY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-XTPid1tLPsOKVok1P9FeNw-1; Fri, 19 Mar 2021 11:45:35 -0400
X-MC-Unique: XTPid1tLPsOKVok1P9FeNw-1
Received: by mail-ej1-f70.google.com with SMTP id e7so10512799ejx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5LK0n/jg/OwPro8VFqa34gdHN9jLmsy9oeDxC6+deOw=;
 b=k47CpbcE+VvcptXur6QHe1c907gefRrRJZfjiHS5bVqSjxv5cZsm/Nq0aXfm3v7/Mw
 B3rscDQCLrRIRfNXZwR99zJuLh2t7Ch0335fF3w70KnXp+JM3Hzvk2B+BhetAGaQoxoK
 AAC+txVnbdaHqpNeykikhZpXKHWeMnfdasAGi1kTrfSJnuYUvQLL9Fo31cjpml31yY/l
 WW9vEtFu6jBWl6EcVoUEYU6/uX/9sYgOTDhl0x2j6eOVweJYfHMahg2CMl9Oqi8AEu4e
 TUe4lBpG1saabJqbzulTmPMa1JNAMeoBDuXhM1bJNdQK7ogwolZMCi3/9mfm96yu7EZe
 WEwQ==
X-Gm-Message-State: AOAM531u8GyzrQrWDd2n5NT4Z5NEvxBb+jICNJobNBvOHeOmL+wzELlD
 Aa8L8P5RFf8K2UXkX3b5fSkMDtWGaiYzzbYx35s6t9CK1ZTbvCFRIBSdK4mFfLP3AYIysodLbiD
 Qt0NSTvlfQ7A40pX8T7Fa4kL9W4hfsRe0KPsyM96hPLowTMW9kPdYG/mzVvJCEQO2teU2AqSY9g
 7V5WW7
X-Received: by 2002:a17:906:dbd0:: with SMTP id
 yc16mr5121248ejb.71.1616168733550; 
 Fri, 19 Mar 2021 08:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6FBmTDA5Jn6DpRh+OCexUQqHVf1umdhwQmaJLzB1rlUzanz9bkJXJLuLjFXTjfMz6EBB6uQ==
X-Received: by 2002:a17:906:dbd0:: with SMTP id
 yc16mr5121222ejb.71.1616168733341; 
 Fri, 19 Mar 2021 08:45:33 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r19sm3793916ejr.55.2021.03.19.08.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 08:45:32 -0700 (PDT)
Subject: Re: [PATCH] drm/i915/display/vlv_dsi: Do no shut down displays on
 reboot if a DSI panel is used
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
Date: Fri, 19 Mar 2021 16:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301154347.50052-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/1/21 4:43 PM, Hans de Goede wrote:
> After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
> displays gracefully on reboot"), the DSI panel on a Cherry Trail based
> Predia Basic tablet would no longer properly light up after reboot.
> 
> The backlight still turns back on after reboot, but the LCD shows an
> all black display. The display is also all black during the time that
> EFI / the GOP is managing it, so e.g. the grub menu also is not visible.
> 
> In this scenario the panel is initialized so that it appears to be working
> and the fastboot code skips doing a modeset. Forcing a modeset by doing a
> chvt to a text-console over ssh followed by echo-ing 1 and then 0 to
> /sys/class/graphics/fb0/blank causes the panel to work again.
> 
> Add a QUIRK_SKIP_SHUTDOWN quirk which turns i915_driver_shutdown() into
> a no-op when set; and set this on vlv/chv devices when a DSI panel is
> detected, to work around this.
> 
> Admittedly this is a bit of a big hammer, but these platforms have been
> around for quite some time now and they have always worked fine without
> the new behavior to shutdown everything on shutdown/reboot. This approach
> simply disables the recently introduced new shutdown behavior in this
> specific case where it is known to cause problems. Which is a nice and
> simple way to deal with this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Ping? Since sending this patch I've been seeing the issue addressed by
this on variour other CHT based devices too.

So we have various devices suffering from a black screen after reboot
now. This is pretty serious usability regression.

As such it would be good to get this reviewed, or another fix proposed.

Regards,

Hans



> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 3 +++
>  drivers/gpu/drm/i915/i915_drv.c        | 3 +++
>  drivers/gpu/drm/i915/i915_drv.h        | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index f94025ec603a..792ef868b6af 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1949,6 +1949,9 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  
>  	vlv_dsi_add_properties(intel_connector);
>  
> +	/* Some BIOS-es fail to re-init the DSI panel on reboot if we turn it off */
> +	dev_priv->quirks |= QUIRK_SKIP_SHUTDOWN;
> +
>  	return;
>  
>  err_cleanup_connector:
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 8e9cb44e66e5..92f2af55af6d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1048,6 +1048,9 @@ static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
>  
>  void i915_driver_shutdown(struct drm_i915_private *i915)
>  {
> +	if (i915->quirks & QUIRK_SKIP_SHUTDOWN)
> +		return;
> +
>  	disable_rpm_wakeref_asserts(&i915->runtime_pm);
>  
>  	i915_gem_suspend(i915);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 26d69d06aa6d..272cd7cb22d4 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -517,6 +517,7 @@ struct i915_psr {
>  #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
>  #define QUIRK_INCREASE_T12_DELAY (1<<6)
>  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
> +#define QUIRK_SKIP_SHUTDOWN (1<<8)
>  
>  struct intel_fbdev;
>  struct intel_fbc_work;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
