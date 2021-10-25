Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C55439223
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 11:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CDF89C1E;
	Mon, 25 Oct 2021 09:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC91089C1E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635153341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DbTPHXZh7hmSsNz6dj0m/G0TdT3KuxUl6JeSVpeNCM=;
 b=JAbQTuXbGXwefFUf/pf/tLto3RfqAy1NvcrJZiprp4K5kyk/02f2pzZgif2h/39rxEf15A
 aXWRjKn9YKsuCheXl/6buoZJRzg2743xhRD77yz4goyVxvhtmvI7H7SJc1mSgKNy0VwTpS
 QuY6pPAaNdo49+yPM8J321451GEIOzs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-kw6uFtbQNGiEjCnx61GEDw-1; Mon, 25 Oct 2021 05:15:37 -0400
X-MC-Unique: kw6uFtbQNGiEjCnx61GEDw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z1-20020a05640235c100b003dcf0fbfbd8so9281220edc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 02:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4DbTPHXZh7hmSsNz6dj0m/G0TdT3KuxUl6JeSVpeNCM=;
 b=w7vLaXg3PhGnw82YL2XntifInkoPERnRCZoGhnnG9R/1Wu+su7ENtv5GCJl8IGj2Jp
 ysrCIIu2SoUrE6HZWNpc19pniWYiONvBBx6OF8fB/Y7eJJvOBo8rypLiwZN/3WE6dotr
 drETr67ib1bXqIlOsdpurKvgOxNCUINS5aXNp84viukmV9xWSR0iZZXvhrnqRnw3qTAn
 RwlAS5bIpthPiLgdPL9sB/vm9RYw4prnduCCRMxqvAqjqJP4s+S4HnZuWrdJlzfzef4s
 bF/1EZVtJE8EPaDZW/DjARO0CBiFG1tJZyl6A0Iuaq5YYyXK9d2lF3D9PYAXo6lXwzUy
 lL8Q==
X-Gm-Message-State: AOAM532PW7IcDqO8c8ZczgN3a+lh2oifhmYo76YtqnIxJd3yi5BzRwr7
 1Yl9QSL55Z/fnXmZV51uU71HRZFx/vb1PF7ZT1qTfa+v82AhowVSePYUZ/gLihVJi1DirB7H4R9
 X10hkOMBUp0cIFo4OvmtD6w1RcLQE
X-Received: by 2002:aa7:d54e:: with SMTP id u14mr24610815edr.2.1635153336650; 
 Mon, 25 Oct 2021 02:15:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6yMjrKMvEwZQMbSSN2Di9+xbxJTdK2fh9mTmQfa0bA3ezw7I4Z6DA/Qk6R4vjzRAoYgARuA==
X-Received: by 2002:aa7:d54e:: with SMTP id u14mr24610776edr.2.1635153336367; 
 Mon, 25 Oct 2021 02:15:36 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
 by smtp.gmail.com with ESMTPSA id l10sm8746899edk.30.2021.10.25.02.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 02:15:36 -0700 (PDT)
Message-ID: <198d289d-3e97-b9da-a385-ce2ce4ee52f6@redhat.com>
Date: Mon, 25 Oct 2021 11:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915: Add NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>,
 "Deak, Imre" <imre.deak@intel.com>
References: <20211024155010.126275-1-hdegoede@redhat.com>
 <877de1lde9.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <877de1lde9.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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

Hi,

On 10/25/21 10:25, Jani Nikula wrote:
> On Sun, 24 Oct 2021, Hans de Goede <hdegoede@redhat.com> wrote:
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
>>
>> Force-enabling the dpio-common-bc powerwell as the i915 normal does at boot
>> appears to cause the P-Unit to hang. When booting with a serial-usb console
>> the following errors are logged before the system freezes:
>>
>>  i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fffff3ff)
>>  i915 0000:00:02.0: [drm] *ERROR* Display PHY 0 is not power up
>>  ------------[ cut here ]------------
>>  i915 0000:00:02.0: DPIO read pipe A reg 0x8170 == 0xffffffff
>>  WARNING: CPU: 3 PID: 258 at drivers/gpu/drm/i915/intel_sideband.c:257 vlv_dpio_read+0x95/0xb0 [i915]
>>  ...
>>  Call Trace:
>>   chv_dpio_cmn_power_well_enable+0xab/0x210 [i915]
>>   __intel_display_power_get_domain.part.0+0xa0/0xc0 [i915]
>>   intel_power_domains_init_hw+0x26d/0x760 [i915]
>>   intel_modeset_init_noirq+0x5d/0x270 [i915]
>>   i915_driver_probe+0x6b6/0xd10 [i915]
>>   ...
>>
>> If I disable the WARN about the register being 0xffffffff, so that the
>> system can log some more dmesg output over the serial console before
>> freezing, the following errors are also logged:
>>
>>  i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fcfff3ff)
>>  i915 0000:00:02.0: [drm] *ERROR* Display PHY 1 is not power up
>>
>> With this patch to disable the force-enabling of the PHY 0 / dpio-common-bc
>> powerwell in place, this error for PHY 1 goes away. So it seems that trying
>> the force-enabling of the PHY 0 / dpio-common-bc powerwell freezes the
>> P-Unit, causing the subsequent enabling of PHY 1 to also fail (and causing
>> the entire system to freeze within seconds).
>>
>> With this patch the PHY 1 error disappears and the entire system works.
>>
>> Note this change also moves the intel_init_quirks() call a bit up inside
>> intel_modeset_init_noirq() this is necessary so that the quirk is set
>> before the intel_power_domains_init_hw() call. This is harmless, all that
>> intel_init_quirks() does is set some bits in drm_i915_private.quirks and
>> make some drm_info() log calls.
>>
>> Reported-by: Tsuchiya Yuto <kitakar@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c     |  4 ++--
>>  .../gpu/drm/i915/display/intel_display_power.c   | 16 ++++++++++++++--
>>  drivers/gpu/drm/i915/display/intel_quirks.c      | 10 ++++++++++
>>  drivers/gpu/drm/i915/i915_drv.h                  |  1 +
>>  4 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 015854b5078c..1fb885cc86c9 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -12467,6 +12467,8 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
>>  	if (ret)
>>  		goto cleanup_bios;
>>  
>> +	intel_init_quirks(i915);
>> +
>>  	/* FIXME: completely on the wrong abstraction layer */
>>  	intel_power_domains_init_hw(i915, false);
>>  
>> @@ -12501,8 +12503,6 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
>>  	INIT_WORK(&i915->atomic_helper.free_work,
>>  		  intel_atomic_helper_free_state_worker);
>>  
>> -	intel_init_quirks(i915);
>> -
>>  	intel_fbc_init(i915);
>>  
>>  	return 0;
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
>> index cce1a926fcc1..eeaba3dc064b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
>> @@ -2090,8 +2090,14 @@ __intel_display_power_get_domain(struct drm_i915_private *dev_priv,
>>  	if (intel_display_power_grab_async_put_ref(dev_priv, domain))
>>  		return;
>>  
>> -	for_each_power_domain_well(dev_priv, power_well, BIT_ULL(domain))
>> +	for_each_power_domain_well(dev_priv, power_well, BIT_ULL(domain)) {
>> +		if (domain == POWER_DOMAIN_INIT &&
>> +		    (dev_priv->quirks & QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
>> +		    power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC)
>> +			continue;
>> +
>>  		intel_power_well_get(dev_priv, power_well);
>> +	}
> 
> Cc: Imre
> 
> There has got to be a way to hide this better. Having this here is
> unacceptable.

Thank you for your quick review.

For a first quick hack I just removed POWER_DOMAIN_INIT from
CHV_DPIO_CMN_BC_POWER_DOMAINS.

Some alternative ideas:

1. Mask out the POWER_DOMAIN_INIT bit from desc->domains
But that requires making the desc struct non const; Or storing a
copy of the domains field in struct i915_power_well and masking it
out in the copy (and make for_each_power_domain_well use the copy).

2. Have a separate desc without POWER_DOMAIN_INIT and patch up the
power_well->desc pointer in intel_power_domains_init().

I believe that 1. will be slightly cleaner (with the domains
mask copy added to struct i915_power_well).

If this sounds like it might be acceptable I can give 1. a shot
(or 2 if that is preferred). So does 1. sound acceptable ?

Regards,

Hans


>>  	power_domains->domain_use_count[domain]++;
>>  }
>> @@ -2184,8 +2190,14 @@ __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
>>  
>>  	power_domains->domain_use_count[domain]--;
>>  
>> -	for_each_power_domain_well_reverse(dev_priv, power_well, BIT_ULL(domain))
>> +	for_each_power_domain_well_reverse(dev_priv, power_well, BIT_ULL(domain)) {
>> +		if (domain == POWER_DOMAIN_INIT &&
>> +		    (dev_priv->quirks & QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
>> +		    power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC)
>> +			continue;
>> +
>>  		intel_power_well_put(dev_priv, power_well);
>> +	}
>>  }
>>  
>>  static void __intel_display_power_put(struct drm_i915_private *dev_priv,
>> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
>> index 8a52b7a16774..c377f515bbf4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
>> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
>> @@ -59,6 +59,13 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
>>  	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
>>  }
>>  
>> +/* The Xiaomi Mi Pad 2 CHT tablet hangs on enabling the dpio-common-bc well */
>> +static void quirk_no_vlv_disp_pw_dpio_cmn_bc_init(struct drm_i915_private *i915)
>> +{
>> +	i915->quirks |= QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT;
>> +	drm_info(&i915->drm, "Applying no dpio-common-bc powerwell init quirk\n");
>> +}
>> +
>>  struct intel_quirk {
>>  	int device;
>>  	int subsystem_vendor;
>> @@ -190,6 +197,9 @@ static struct intel_quirk intel_quirks[] = {
>>  	/* ASRock ITX*/
>>  	{ 0x3185, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
>>  	{ 0x3184, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
>> +
>> +	/* Xiaomi Mi Pad 2 */
>> +	{ 0x22b0, 0x1d72, 0x1502, quirk_no_vlv_disp_pw_dpio_cmn_bc_init },
>>  };
>>  
>>  void intel_init_quirks(struct drm_i915_private *i915)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 005b1cec7007..b907b49b4f0e 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -524,6 +524,7 @@ struct i915_drrs {
>>  #define QUIRK_INCREASE_T12_DELAY (1<<6)
>>  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
>>  #define QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK (1<<8)
>> +#define QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT (1<<9)
>>  
>>  struct intel_fbdev;
>>  struct intel_fbc_work;
> 

