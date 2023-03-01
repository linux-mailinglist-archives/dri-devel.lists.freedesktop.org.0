Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09D6A69E7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 10:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717A10E09E;
	Wed,  1 Mar 2023 09:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4767310E09E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663536; x=1709199536;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mwzi1nOCe5KSvSMHkgAMvU654fpFvrxwhFKDR1Q+JbA=;
 b=MfbuSmiAJaL/b9h58I1uxtJuidY9VCToiRcqWhZYhqJ91FoEzofZtlyJ
 4ulndwG+tN5FWerakcH2/IWKaX9nZd4kPy5mLJ4M6yclc5wSMCNxMt9At
 RiPBa/l5HQiwQPCCLB0xv8WV4uvlt7UgJQm/QR9KCy5ZnD43jQqStfPkK
 cOoQBVVp4JaKkRq/WJMwkGMGtfcx9vj+yLogWUMIBsAIwKS1MQmgxRtrj
 6d5Dy+R8QtCoLpmonop96j1pu/LYZFoSktJDSZpMNru4Uvz1nD7AOEHPx
 Xu3pbgQ3X1fuN6MVupmx+jMIx0PJQvmhm9laBZIi8tK9B9IpngNnSxaf8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="322627025"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="322627025"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:38:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="624418784"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="624418784"
Received: from dsvarnas-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.249])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:38:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pavel Machek <pavel@ucw.cz>, Martin Kurbanov
 <mmkurbanov@sberdevices.ru>, ojeda@kernel.org
Subject: Re: AUXdisplay for LED arrays, keyboards with per-key LEDs -- was
 Re: [PATCH v2 2/2] leds: add aw20xx driver
In-Reply-To: <Y/50tKxpNVZO4Hfb@duo.ucw.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228211046.109693-1-mmkurbanov@sberdevices.ru>
 <20230228211046.109693-3-mmkurbanov@sberdevices.ru>
 <Y/5xBGFC3b9Chdtb@duo.ucw.cz> <Y/50tKxpNVZO4Hfb@duo.ucw.cz>
Date: Wed, 01 Mar 2023 11:38:49 +0200
Message-ID: <87h6v4x13q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, kernel@sberdevices.ru, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > +config LEDS_AW200XX
>> > +	tristate "LED support for Awinic AW20036/AW20054/AW20072"
>> > +	depends on LEDS_CLASS
>> > +	depends on I2C
>> > +	help
>> > +	  This option enables support for the AW20036/AW20054/AW20072 LED driver.
>> > +	  It is a 3x12/6x9/6x12 matrix LED driver programmed via
>> > +	  an I2C interface, up to 36/54/72 LEDs or 12/18/24 RGBs,
>> > +	  3 pattern controllers for auto breathing or group dimming control.
>> 
>> I'm afraid this should be handled as a display, not as an array of
>> individual LEDs.
>
> You probably want to see
>
> AUXILIARY DISPLAY DRIVERS
> M:      Miguel Ojeda <ojeda@kernel.org>
> S:      Maintained
> F:      Documentation/devicetree/bindings/auxdisplay/
> F:      drivers/auxdisplay/
> F:      include/linux/cfag12864b.h
>
> And this brings another question...
>
> ...sooner or later we'll see LED displays with around 100 pixels in
> almost rectangular grid. Minority of the pixels will have funny
> shapes. How will we handle those? Pretend it is regular display with
> some pixels missing? How do we handle cellphone displays with rounded
> corners and holes for front camera?
>
> And yes, such crazy displays are being manufactured -- it is called
> keyboard with per-key backlight... 
>
> https://www.reddit.com/r/MechanicalKeyboards/comments/8dtvgo/keyboard_with_individually_programmable_leds/

But... is that a display or a HID?

Only half-joking, really. This somewhat reminds me of using input system
force feedback stuff for touch screen vibrations.

Cc: Dmitry & linux-input.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
