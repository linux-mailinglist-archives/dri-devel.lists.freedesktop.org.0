Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BFC85EB34
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CBB10E5AD;
	Wed, 21 Feb 2024 21:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NAVOE6ZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A8310E5AD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 21:46:39 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-36532b1892bso14256265ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708551999; x=1709156799;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7+QKepU2MbI4a/2CEG6x48g/5yOOaTqkeikoyN0HwE4=;
 b=NAVOE6ZWPR4mvQtfLY6TBVcTjeh5fsDlpegurGm4GI61gaMh3RGCUEeBZtKxvVfoGa
 4+bLdqlxhv08hpsCHrIMPLBZEoqDl2poRQ1r+Br8M0A5DmH5fY8NsOYOIc7dCiF+VTdT
 i06XxVfXm/mNS0BfJSvdeMDuHRE/G8XWyKsCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708551999; x=1709156799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+QKepU2MbI4a/2CEG6x48g/5yOOaTqkeikoyN0HwE4=;
 b=CbstHo3zlEdAl4zx8PQdgsLv2HQaDlhh2SRIAXd4EjyLgvsQohaiYsuyxFJC3v5KF/
 fwfsUDoNyP7YWs9Osu0GU1OYdw7gDW4IJ1ovMrBS1bVaEnacJXM6km+nE2SV63UyqHU/
 p3E7ih0asQH0QmJzaWTH8w9CFUHU0u+B8FzrKvD54tg1puNDgI+oesd9SvMo8dfN3b12
 ZBhnJL65r2p65xmVnlvgeZoB+T4E7jvZ2OUi4l0JkdBOiYzOrAMj8TkqSvE1qVKP4utr
 2xxutuwgppKlsa3IK5WdiL6CoEVBs7aqnUxBQ0zMI5WY+F0iUN/uuM/sVRsEaRdnwjdJ
 Roog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJsKGYG+FuAEgCduN0rXTU5hvwJ3uKTZIyiyj9FnAngISnK5n9P5mq2X2Bg+vgv8EnGOI20B78yKd0E5IhpMngSno/N1uxmnScIvjHjUAf
X-Gm-Message-State: AOJu0Yx8WSIks5vhYwRmmDBsNz++OwWghb3dBcbm4JTgcar0nr6KqJ7I
 nlkLp+tWGWs7gnJcljoObnvCNYFz49bQusB7qUQcmkvqJNMuUHiRokBtwKRehA==
X-Google-Smtp-Source: AGHT+IFBUZzWY7+Gyh4073StMQynW71O1XhzOlaNGslbtvVVdGagjjqiCcd5gNO5djx/h05+c4TUWg==
X-Received: by 2002:a05:6e02:c6f:b0:364:2406:992e with SMTP id
 f15-20020a056e020c6f00b003642406992emr20453456ilj.23.1708551998951; 
 Wed, 21 Feb 2024 13:46:38 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com.
 [35.222.220.147]) by smtp.gmail.com with UTF8SMTPSA id
 b11-20020a05663801ab00b00473e844f978sm456921jaq.32.2024.02.21.13.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:46:38 -0800 (PST)
Date: Wed, 21 Feb 2024 21:46:38 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Message-ID: <ZdZvPiEVKgciB-cg@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
 <ZdZcLOlSc3FScjLK@google.com>
 <503d9ea9-9812-498b-a5ee-2579ba8a7ecf@wolfvision.net>
 <ZdZokatitviYZ7rg@google.com>
 <6a4f1862-ccb1-4d6d-bab2-f22090a1a08b@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a4f1862-ccb1-4d6d-bab2-f22090a1a08b@wolfvision.net>
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

On Wed, Feb 21, 2024 at 10:33:53PM +0100, Javier Carrasco wrote:
> On 21.02.24 22:18, Matthias Kaehlcke wrote:
> >>>> +/*
> >>>> + * Fallback supply names for backwards compatibility. If the device requires
> >>>> + * more than the currently supported supplies, add a new one here, and if
> >>>> + * possible, the real name supplies to the device-specific data.
> >>>> + */
> >>>> +static const char * const generic_supply_names[] = {
> >>>> +	"vdd",
> >>>> +	"vdd2",
> >>>> +};
> >>>> +
> >>>> +#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)
> >>>
> >>> This will have to change when support for a device with more than 2 non-generic
> >>> supply names gets added. Please use a literal value for MAX_SUPPLIES instead of
> >>> ARRAY_SIZE. If the literal is 2 it would still need to change for future devices
> >>> with more supplies, but that change would be more straighforward.
> >>>
> >>
> >> I am not completely sure about this. Someone could increase MAX_SUPPLIES
> >> without adding a generic name.
> > 
> > That's perfectly fine and intended. MAX_SUPPLIES is a max, any list
> > shorther than that is valid. Any longer list will result in probe()
> > being aborted with a clear error message.
> > 
> >> Actually two modifications will be necessary for every addition (name
> >> and MAX_SUPPLIES). If ARRAY_SIZE is used, only new names are required,
> >> and MAX_SUPPLIES is automatically increased.
> > 
> > As per above it's not necessary to add a new name when MAX_SUPPLIES is
> > increased to support more non-generic names. It would only be necessary
> > if more generic names were added, my understanding is that this
> > should not happen because any newly supported onboard devices are
> > supposed to use device specific supply names. I don't like to idea of
> > adding unused pseudo supply names to the list, just for the sake of
> > using ARRAY_SIZE.
> > 
> >> I understand that the whole point of this is getting rid of the generic
> >> names, but we still have to provide generic names for every extra
> >> supply, at least for code consistency and to avoid size mismatches
> >> between real an generic supply names.
> > 
> > Please let me know if you still think the extra names are needed.
> 
> Not really, the only case I could come up is if an existing device that
> uses generic names might end up requiring a third supply, which would
> also be generic. But even such an unlikely event would be cover without
> ARRAY_SIZE.
> 
> Actually one could argue that every existing device could have "vdd" and
> "vdd2" as their supply names and remove checks and the generic array.

Sounds good to me. Another similar option would be to assign
'generic_supply_names' to '.supply_names'. I don't have a strong
preference.
