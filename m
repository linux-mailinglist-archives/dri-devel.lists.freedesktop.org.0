Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF843D0E9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 20:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6146E7E2;
	Wed, 27 Oct 2021 18:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEF86E48F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635360004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtC9muSvtFZbIBY5Q/BKNUlkNxdMOdjCXKm+yqcvYU4=;
 b=WTmAnOhxNkH9K36pupJDYsRtX51Ci7vUZYnc2N0pUzVoVlVkFFHeA7bxA/smSwjBKfRemP
 5DKxX3QFgLsPLR19p/tV2KMLg/U8KS5xxmQ6tpTqaA+O6aBAi7d/lXnpTzgmRHBrOBLbc7
 TpR006sw5UQMIUsVWIk0AxYWBesQkdo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-1wuR3QvXNVqJCjZcMq_rNg-1; Wed, 27 Oct 2021 14:40:01 -0400
X-MC-Unique: 1wuR3QvXNVqJCjZcMq_rNg-1
Received: by mail-ed1-f70.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so3204164edj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 11:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FtC9muSvtFZbIBY5Q/BKNUlkNxdMOdjCXKm+yqcvYU4=;
 b=K76qXPUVLNp2kNUcg7ifjMP5tV88NwmRUxcNT/jvndscjZQnzvQIdvw8nPZv9c9aD1
 rXbFD2VdEQOZYCk70zdFEXOMN3rR3rJuJdhtgGcNymM3p4K/s6ZlsY9z0/1ocQc5oUwx
 6p7PRIMR62h4+vhHONtyDKyiCNP0xWRAUjpnJUTJyEqKIidCUrd6mqItJZzMojaD6uOu
 ZfN70DF35cIzVtUffyZa1f0dnW7nl54QbF53YdKtnz8aLxbfsH5nlCg2IrtnK5tNVwni
 5fsLbnPCWR9Az4T4poAEO9ykdACoBZEwheN6PplpBNoxyiED6xhZNdYoQyhnO0xSFFhy
 Y88Q==
X-Gm-Message-State: AOAM533I/LTuB0DWbSISs4LeX1uOHrRHi1JRlYtrbFw0qyfSrsEqeeCw
 UYoLD9rOkKnUC6Ah3LLKnudVgNTJKL/DythWeFTUjOo/zfAp/hkNWY9aPX9UZmjBbw5CAbpLV30
 bb1a28Tb/gYjCifg7T0+1Y4xb9891
X-Received: by 2002:a05:6402:2372:: with SMTP id
 a18mr42469262eda.241.1635359999390; 
 Wed, 27 Oct 2021 11:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKfqb8LE4EDNjPwQrlZu+bbNrmFL/fsoX9RGg8JCm5OwvyqawL/zWMYRuD6Pefl/QutpaHBw==
X-Received: by 2002:a05:6402:2372:: with SMTP id
 a18mr42469172eda.241.1635359998390; 
 Wed, 27 Oct 2021 11:39:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id d10sm478114edp.21.2021.10.27.11.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 11:39:58 -0700 (PDT)
Message-ID: <7e74d851-b575-0f7b-34be-b389bd6323ca@redhat.com>
Date: Wed, 27 Oct 2021 20:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915: Add NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
References: <20211024155010.126275-1-hdegoede@redhat.com>
 <YXlWVtnaTUEJ6yQs@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YXlWVtnaTUEJ6yQs@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 10/27/21 15:38, Ville Syrjälä wrote:
> On Sun, Oct 24, 2021 at 05:50:10PM +0200, Hans de Goede wrote:
>> Add a NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk to fix i915 not working on
>> the Xiaomi Mi Pad 2 (with CHT x5-Z8500 SoC).
>>
>> The Xiaomi Mi Pad 2 uses quite an unusual hardware-design for a Cherry
>> Trail tablet. It deviates from the typical reference design based tablets
>> in many ways.
>>
>> The Mi Pad 2 does not have any DisplayPort or HDMI outouts. I suspect that
>> as part of its unusual design it also has some supply rail which is only
>> used for DisplayPort or HDMI not connected.
> 
> Do we have the VBT somewhere (preferable attached to a bug report)?
> Maybe we can avoid an ugly quirk.

I agree that solving this in a way where we can avoid the quirk would be great.

I've filed an issue for this here now:

https://gitlab.freedesktop.org/drm/intel/-/issues/4385

This has a dump of /sys/kernel/debug/dri/0/i915_vbt as well as
dmesg output from a boot with drm.debug=0x1e attached (from a boot
with this patch, since otherwise the system hangs).

>>
>> Force-enabling the dpio-common-bc powerwell as the i915 normal does at boot
>> appears to cause the P-Unit to hang. When booting with a serial-usb console
>> the following errors are logged before the system freezes:
>>
>>  i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fffff3ff)
>>  i915 0000:00:02.0: [drm] *ERROR* Display PHY 0 is not power up
> 
> Hmm. I wonder if we're missing a clock or something...
> 
> Either of these do anything different?
> 
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -1419,6 +1419,10 @@ static void vlv_display_power_well_init(struct drm_i915_private *dev_priv)
>  	for_each_pipe(dev_priv, pipe) {
>  		u32 val = intel_de_read(dev_priv, DPLL(pipe));
>  
> +		val |= DPLL_SSC_REF_CLK_CHV;
> 		or
> +		val &= ~DPLL_SSC_REF_CLK_CHV;
> 
>  		val |= DPLL_REF_CLK_ENABLE_VLV | DPLL_VGA_MODE_DIS;
>  		if (pipe != PIPE_A)
>  			val |= DPLL_INTEGRATED_CRI_CLK_VLV;
> 

The hang gets triggered from chv_dpio_cmn_power_well_enable() which does not
call vlv_display_power_well_init() at all, it directly calls vlv_set_power_well()
without first calling vlv_display_power_well_init() .

Note the same goes for vlv_dpio_cmn_power_well_enable(). Only the
vlv_display_power_well_enable() / chv_pipe_power_well_enable() call
vlv_display_power_well_init().

Note I can still give the suggested change a try if you want,
the "display" powerwell is listed first and has DOMAIN_INIT set,
so assuming for_each_power_domain_well() goes through the domains in
the order they are listed, then vlv_display_power_well_init() will
still run first. But it would seem to be wrong if enabling one domain
depends on things setup by another domain ?

Regards,

Hans

