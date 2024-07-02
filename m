Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90006923C64
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 13:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB98410E5BB;
	Tue,  2 Jul 2024 11:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hOqNDeLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ADA10E5BB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 11:30:38 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52cd80e55efso7172862e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 04:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719919837; x=1720524637; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bfcCA0rJ0Yu9FTkvYdW16QcSAQI7yAKlW1Qc5AVlW3U=;
 b=hOqNDeLDHpVO3+zR5Dnc6IV15CcAKzf8NSYnJKJhJBUayK+nupCTl1iWk5a9+dFTz5
 nqZ8Eikrk0AWH6UyL0PRGpuJwa+lNgiwhOcVnXsUo9prwLLH+PtxL6SxljcRUePUBMs3
 zkbPHftF7u9E/5Pt9HKHOxETqV1qAYxZJuPsxOCsdxY8syiUsReDonVrDoeABBlL4Z9V
 sP6W+m0Zxea6HRCRNXKL8eScUvHIIE2kp3AQQd822NWiPLOSgPORHX517NpYv5q9w9uK
 EZzsg2Z7If+pYBFeNsDU/pKd8TirL1ZPWGDKuDw0xhfjx3vf9eehjkmWouuMrIo+nNWy
 f98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719919837; x=1720524637;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfcCA0rJ0Yu9FTkvYdW16QcSAQI7yAKlW1Qc5AVlW3U=;
 b=Cnl9nuqqnRRuFHpkQtbG5zm5x0cHWTml5vDVopaMboowbB4j7hbC3Wx2OL039JOXUG
 wBtfICpAgchMjNTIqKf4OaVUyv7ADhgWvl9Y48abJHvu8jvOFmWsgnNJXydwWrkq7u0U
 wKJSsI7REFEW5g5wXXiW8h0I0qQt0XunDgWyCYqkHtmqhbk6A3F1CgNod7t1bd5f322g
 W0f3mqjsGf/7CeApOIgLKr/73hh0Lf3LPOnDd6tvNYP8gNgNgsVqOywXbqBrUlNMs+CX
 fTjoUGzgciKl+LZ8O1/ZAAdW9hUQ/LdYK+XQUly7bcPZlRmyj0EIzR1knUnXq9l8X8GA
 nwag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv9EZ7aUzTv6wqbe3ehHwVBSkDTQVYqx1KPABXRebzKr41CLx6igoMwpeUfEo7H/gXfaIiEhBQbGxyrSa/JpKr6YUVXUwj82mERB4x3B9b
X-Gm-Message-State: AOJu0YxHXGDnTj8zmMdoJ1p5mSIzOJ2k9lEZmTBlA7c5U9EAas33nbx6
 LpyEZ/Xb1GbUEiYk6EyiOj1AQqPpAETCq/ZTZCDcl6YuwW/A1zgnXB8zlZZ3I3UQ2xu0DeeQaPz
 3Mqg=
X-Google-Smtp-Source: AGHT+IGvzomEe6pk4+b5ukiwRKQ+iFhauj+aCe2WN15Uc2hBtyIpzqB4i5/D+SuowCWFltuBkJer2w==
X-Received: by 2002:a05:6512:2345:b0:52c:76ac:329b with SMTP id
 2adb3069b0e04-52e82687e21mr8065528e87.35.1719919836656; 
 Tue, 02 Jul 2024 04:30:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab0bb88sm1724140e87.56.2024.07.02.04.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:30:36 -0700 (PDT)
Date: Tue, 2 Jul 2024 14:30:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: John Watts <contact@jookia.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: How to specify panel bit order in driver?
Message-ID: <neiylzqexfz5saynoo5wgewwgmloy3a4jrng3ucizvrvyusidj@lyjdice5qs4r>
References: <Zn4z_OJJ07xg_xmh@titan> <87le2pbjdf.fsf@intel.com>
 <Zn7nNMti5pdX67DH@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn7nNMti5pdX67DH@titan>
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

On Sat, Jun 29, 2024 at 02:39:16AM GMT, John Watts wrote:
> Hi Jani,
> 
> On Fri, Jun 28, 2024 at 10:45:48AM +0300, Jani Nikula wrote:
> > Might be helpful to actually point at the source code or commits or
> > something.
> 
> The source code is here: drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> It's just a standard MIPI DBI panel. It reports using an RGB888 bus format.
> 
> > Maybe look at include/uapi/drm/drm_fourcc.h, and how the DRM_FORMAT_*
> > macros are used.
> > 
> > Can't help you with device tree, but maybe this gives you pointers to
> > other places for examples.
> 
> Currently it works like this:
> 
> - DRM uses 24-bit depth
> - CRTC puts out a 24-bit signal
> - This gets output over LCD pins
> - The PCB drops 2 bits per channel by wiring 6 pins to GND
> - The panel is told to only use 18 bits
> 
> Getting DRM to use MEDIA_BUS_FMT_RGB666_1X18 would be nice and allow the panel
> to auto-detect which bits to use. But the bus format is set in the panel :(
> 
> Where is the bus format usually set for cases where a board only supports a
> physical format?

This is usally the panel driver.

We have been discussing adding a proper atomic_* support to the
drm_panel. This should allow panel drivers to actually negotiate what is
going on. Marijn started looking at it, but the patches never hit the
ML.

So, if the static configuration fits you, then just set it in the panel
config. If not, you might have either to implement some hacks (like
having a DT property describing how the panel is actually wired).

> 
> > HTH,
> > Jani.
> > 
> > 
> > -- 
> > Jani Nikula, Intel
> 
> John.

-- 
With best wishes
Dmitry
