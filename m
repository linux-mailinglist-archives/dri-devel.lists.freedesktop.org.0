Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEBACD5532
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA8710E4FA;
	Mon, 22 Dec 2025 09:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N2dxR9va";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316C810E4FA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:29:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59a10ef758aso3061488e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766395781; x=1767000581; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xZgttxRcFFeqB/7cl+AcA+CY6hyOItazptc70QLJmmE=;
 b=N2dxR9vaOaO0kvUmyulECO6DCS82vtsb4MBZkEnIDXSR9UNeiK1h7AHI6rMT3DqtkF
 fkHzHgQYEWBL/4xGVgwhqO3htjH8g0zSWGSueUO6BhPrLiiiAW23BmPHjc44tWhafFrE
 MqZcRSwa1DaN/2U97q8UEKEXJZd+guQ7McGFDv1IBRy160Y0IUdR5HPu4rWfKB72zEV0
 6wnbcAZm6uuS/fAgylN9elpdgnzZpCOu8p8jFirU9CQrykM0imwnuKcton30YJij9IxL
 1X3NS2zKXuUHwHSJUYlANAX+7mpLQc0zIigcUlh/Es02H3UZnzvh7hfH4k5LcUDCiey+
 BEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766395781; x=1767000581;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xZgttxRcFFeqB/7cl+AcA+CY6hyOItazptc70QLJmmE=;
 b=X2ekRVoYHqf/Xs78efeCTYlUq0JPN6pvWCHsr6+DbKUalF7WwAPrNVyNKeuCFga2BV
 /fXiW+55t5Bg89cqrMj6NARsigfTY9Fu2twrFQ63NBVzZK7adJkxqoZbv0pYp9K3vGGM
 38aLZXzGQv6A7Nd1DMIrP9j859PkFGwo2lYBr1n8ei52Zrs7DwM8W85U1YJ2bePqUPrd
 3QZOfQ1ZUITngUMsmXm8b92q/ZN0C6NAM42kYrhlA89mzZL84G9diFI3dOQIyegqiHSD
 gSS50nykbmPuRbgetewiJ5TJDVyhplychLzWf/G12pgWdIFYkANc/TGclbaFXc82jX8G
 5k2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUByZgjw9xDjVODm8GVCITkH0GBa762F2pcWzac7zFGRvUIHIjXRmoKvYC2C/k2JNwJ9U1h443Ey8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB+UGsvZ9OOOgSxvovFctx9C9lX4O/6xBH1fGRg6t4SfQlWik9
 g6pBPTfLJSU1lod59sIKOzqMWhZXmWBQGGFviooNvTvA3zlK5yHLhGo/gUOXums1CBo=
X-Gm-Gg: AY/fxX4YwvgLbr/J/12bYNirQAeYHqexe79wh6ebPDS/Qgzy/GEZg6CT/JJmR6Y2KMk
 GofnisbekxS4bvk6KX/dA75ug4oHlWFwQKqbR0COUDkkIFjCAcp05C4wd2wn2zWVzWpv1oFUINo
 a/arYtNDc6pHG756l3GOT5uxS7T08cSsGcj1US/dz1IdXMw8cFya7EtxTXjmkXTTsgGTlACG2Vl
 Ge8ZFS7735uWdp/NGzTjFszoReSs5TIThcqqZFo8gDRWnAfW9rcT9imHHphUbq63KGk4GIHEQjY
 1KpcUFoUiMIKYlgF5dTP1oA4DnJkPIUCdM6JFAF/ZMzeXwIQ9vQo6KLgX31h4L8rr/9/8jK75Xm
 JChyQ0J+qgpyefmsCooOBnahlA6CC3eSZJHSdFgpbHYL6+2rtYQ2FGSLPsPKzs8aQuRP8XJvCC7
 JJUIHA54WoIBePPRpZZ99zWbqBnny0Iqs2ZLzrS4w0PEsd
X-Google-Smtp-Source: AGHT+IHdz2Ykcd7v71aO+LxiD2YdRHpq1IyR3g8WLuuBK4cb2LhNWiokwxZAnx2kgNCjq6U0F+DU9w==
X-Received: by 2002:a05:6512:2313:b0:594:5545:b743 with SMTP id
 2adb3069b0e04-59a17d3c35fmr4130445e87.27.1766395781381; 
 Mon, 22 Dec 2025 01:29:41 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861ffe7sm2969593e87.87.2025.12.22.01.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 01:29:41 -0800 (PST)
Date: Mon, 22 Dec 2025 11:29:39 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mike Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 0/3] drm: zynqmp: Make the video plane primary
Message-ID: <aUkPg_VUxp0KrpWE@nuoska>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <36048dd7-796f-495d-b715-d8f65a7c2f98@suse.de>
 <24a9a9a2-ba7c-4619-96dc-4355d850561b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24a9a9a2-ba7c-4619-96dc-4355d850561b@linux.dev>
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

On Fri, Nov 14, 2025 at 10:35:10AM -0500, Sean Anderson wrote:
> On 11/14/25 02:42, Thomas Zimmermann wrote:
> > Am 13.11.25 um 21:37 schrieb Sean Anderson:
> >> The graphics plane does not support XRGB8888, which is the default mode
> >> X uses for 24-bit color. Because of this, X must be set to use 16-bit
> >> color, which has a measurable performance penalty. Make the video plane
> >> the primary plane as it natively supports XRGB8888. An alternative
> >> approach to add XRGB8888 to the graphics plane is discussed in [1], as
> >> well as in patch 2.
> > 
> > Did you try to set drm_device.mode_config.preferred_depth = 16, like at [1]?  IIRC user space looks at this value to auto-detect the color format.
> 
> I have not tried that. But I would rather use 24-bit color for the performance boost.

I have tested preferred_depth = 16 and it works. Proposed in
https://lists.freedesktop.org/archives/dri-devel/2025-December/540189.html
but I'm also fine with 24/32 bpp, or any default which draws pixels to HDMI
on AMD KV260 and X11 without manually changing the config.

This full series also works for me on AMD KV260 running Yocto genericarm64
machine config and core-image-sato image with Xorg.

Cheers,

-Mikko
