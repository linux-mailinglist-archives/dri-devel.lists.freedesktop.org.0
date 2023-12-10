Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A64C80B8AB
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 04:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD4F10E31C;
	Sun, 10 Dec 2023 03:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4664210E31C;
 Sun, 10 Dec 2023 03:59:32 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-35d4e557c4bso15068595ab.0; 
 Sat, 09 Dec 2023 19:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702180771; x=1702785571; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=84cInsubYIer0iSHh7fFONzX0zWNfmSdIBRyKoPJTkI=;
 b=j9IzdOR1XWTC5odatYx2yDMp4Xl0sD4YMC88aGzDzDXgiQieYmWNBSJtygBhrfSaAM
 sYcSSFuSSWOJD+Hgf1bjqZJWwELehVKt/wB141gDcrMxtqwyeI9cXxdRRpL30LDAGHKR
 6Qlhe9dByUVuie7zxpX6nJ4mFmy5X4u7D31/Cso9ExYL65STLSq7sToGew7d7JxCdCV0
 rA2/i8JyrR2aB/w0+NIVufl6h0vBQBnI0erTmA8BNSZzrh1am4mn/3wTS3p//+RJVB7N
 64D1OFx7NN2qcSpAS9+MysiIoZnEnCfFYldnz3mN1EKTAiSo7oHkrkpc3X8kc65I12WP
 OaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702180771; x=1702785571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84cInsubYIer0iSHh7fFONzX0zWNfmSdIBRyKoPJTkI=;
 b=dqVAwWN9mYYYvMfvGf+U170ypb36661XQ+kZPlkQ7pSg/oIKhExBFWZGh7X8s996/q
 mcEN6iAZXbRMKcwPgWYabRtUkWVB63FrKpfSwA7qnlLSHNuEdCPZBbTRTij+7UVX458u
 URW1mDRpEBwSJum9cdPmEOYqabK2+8yIvJ4fvYo5Mf7t0xnARLDyrhF2TC9thQ+Hvaop
 6I14byR3UB2MlyfE9KzJFxhwVcpKOlIOZd8v3k2TwjPogYN0hNkbeF3z+C1LsMiBhjeK
 B94bnswNL5vCzOrX2jCFR0tnAPU/OI1UBUfzzQTgyU8B9I7tcKk0oEbyshTLu61SP1rN
 g9lA==
X-Gm-Message-State: AOJu0YwkK4Bhn/onc94bkyYIPsK8d+Q2GpsKO8bIna1EG1b7jjXmvMTb
 V/pQg9cFkwhvpsbVkT3UVWs=
X-Google-Smtp-Source: AGHT+IH9F5XvBInEJBWDJV2re58BWPH91w8i++zb8S4UYFPdHM7W/4ZmjNF8Wa+XCmRN3R3hwoJNSg==
X-Received: by 2002:a05:6e02:1845:b0:35d:5667:c42e with SMTP id
 b5-20020a056e02184500b0035d5667c42emr4576271ilv.2.1702180771158; 
 Sat, 09 Dec 2023 19:59:31 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9082:8aa4:377c:de99])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170902ed0600b001d060bb0582sm4129422pld.165.2023.12.09.19.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 19:59:30 -0800 (PST)
Date: Sat, 9 Dec 2023 19:59:26 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH v6 1/4] pwm: rename pwm_apply_state() to
 pwm_apply_might_sleep()
Message-ID: <ZXU3nsNoQxXKUF4F@google.com>
References: <cover.1701248996.git.sean@mess.org>
 <37090c1d8d8f42f1e12fa84942027d995189a99e.1701248996.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37090c1d8d8f42f1e12fa84942027d995189a99e.1701248996.git.sean@mess.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 09:13:34AM +0000, Sean Young wrote:
>  drivers/input/misc/da7280.c                   |  4 +--
>  drivers/input/misc/pwm-beeper.c               |  4 +--
>  drivers/input/misc/pwm-vibra.c                |  8 +++---

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
