Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E9A31AE1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 01:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1CC10E782;
	Wed, 12 Feb 2025 00:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="idniq6nR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824D810E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:55:16 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30738a717ffso55017221fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739321715; x=1739926515; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mUxNo4sdmWLVTWOH02xXE+iuTiw7pWWtDZzrPFzNKj4=;
 b=idniq6nRXysF37jbZLk79MoFJICAr2Tsq1TrLKlXb8BygiXIZwB0WpZAOE5GT5AXmz
 0t4vROh4+z2ssem8fVfRmOObYi22g5Ej+Alt61AhOl4gwJ2Ol8liQs7ZiqPqe07AsLI5
 DRJFannKfzJ5is18XvgGKhuNMSCwuFc+L2dY23qW/FI7o76SGIE6MK918GS2s0hYAIHM
 kbL+yM35UinsHcwbfpUIsD1VLWwuaYk466rkvD6ro1dVXGz+8BOKvNjLlJRsNLjIBTJU
 6c0K7WMw+Q8L3TaA2yjQR7RyyO+qWbkySAgKLBs7yjBwXQrkIN4xarNTTFC5kx+tctEy
 Smpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739321715; x=1739926515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUxNo4sdmWLVTWOH02xXE+iuTiw7pWWtDZzrPFzNKj4=;
 b=QFQHAC+KTvHHO+HnblQW89O0wjXcmoIv01CZSrx29qVftc9cCBeSW9iEqlVXdjCEDR
 EGY45sJbaMSM74SvmwG4QNa9Ruxqk/KYAFT81Zpe31uWBNgv+kszMNhPqPcD/lekhfNW
 giPoBpOpGJEZeyDi3wyohlhMZGE3ywXJ20ea3PvKBwGycuWOgng5S6FOfBT39kJdvGGZ
 va4urWX/yon0pFhYpPkI6GXRhjw8MUwvprGzGeEHoX5i0gDZSbKnyKuVqsXSZpkeXYkF
 diyuGmIzLUWpLNTkxP37IBLL3j03idJP6WYNe0ve4UrTw7FTUAnbagW3VKjQBOFmoX4Q
 ts9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvFs2JZw+a0LROkjpuuZRsTDQdC/ZYUEeFzh3JD9FI+AelHykxXk2lKL6arJws5SviaA7NG7DrGf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIlA4TRjjO+RprUgtXJjtWixInXFjAPxQrkJeHUxUiEqBZ17DN
 8nNoOpKz/q3Wa/zy+cxXXV+p+MuTvDOs6sqnwJoO7r8hRD949nmC8nr+24EWzA0=
X-Gm-Gg: ASbGnctYEtbnH+U5/yYP1sj8vlQxk5gNGogl8RU0fRbv05TuqVFN+1YvcQL3om+VXqL
 t4oO7eT1GJqFywgKM2EG7SYqPG9JtUI78r18NwIXVM/pU7jTybgmwjc/iJiL/w/7QYRsQDVmnNt
 JGuSBxT6mzYsML+oL6i1CLlI0PVnpMluqrscEMunYR8XU4476w6xa7jeRIYuuttW82xYCAgQm8E
 cwhlRO8mySdWlHk6bh5evAEcyJ8P88p/vmNKwhiAtpJSfGNQ0Xges9dyYWrqEgTUaFjaQ98IDzW
 C/qCet0wu8JG+u5UheLp2tnZrVVo9NPZy56ppkKZevGIr27BnJ/OYTXbYzo9Y77GewLkv3Q=
X-Google-Smtp-Source: AGHT+IGs0cV1u4iegcMKrjuoero2v6sW5UX43WNEwXp7nEN1CqXaDi6DN+1s0QUOAJhNgTLw4fuguQ==
X-Received: by 2002:a2e:a985:0:b0:308:e54d:61a6 with SMTP id
 38308e7fff4ca-309050be548mr1754521fa.34.1739321714727; 
 Tue, 11 Feb 2025 16:55:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308e95f67f1sm9534311fa.48.2025.02.11.16.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:55:13 -0800 (PST)
Date: Wed, 12 Feb 2025 02:55:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <i5q5zuymhn6sy4nou22zxbolztqbq6soef2cwrdq3ey63vfugj@z3rv7zh7xhle>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
 <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
 <20250211-venomous-dragon-of-competition-d76bf9@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-venomous-dragon-of-competition-d76bf9@houat>
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

On Tue, Feb 11, 2025 at 09:48:31AM +0100, Maxime Ripard wrote:
> On Tue, Feb 11, 2025 at 01:14:28AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> > > Hi Maxime, Dmitry
> > > 
> > > On Fri, 7 Feb 2025 21:54:06 +0200
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > 
> > > > > > +/* Internal function (for refcounted bridges) */
> > > > > > +void __drm_bridge_free(struct kref *kref)
> > > > > > +{
> > > > > > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > > > > > +	void *container = ((void *)bridge) - bridge->container_offset;
> > > > > > +
> > > > > > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);  
> > > > > 
> > > > > Pointers are not really useful to track here, since they are obfuscated
> > > > > most of the time. Using the bridge device name would probably be better
> > > > > (or removing the SHOUTING DEBUG entirely :))  
> > > > 
> > > > bridge device name or bridge funcs (I opted for the latter for the
> > > > debugfs file)
> > > 
> > > These DRM_DEBUG()s proved extremely useful exactly because of the
> > > pointer. This is because when using hotplug one normally has the same
> > > device added and removed multiple times, and so the device name or
> > > bridge funcs is always the same, preventing from understanding which
> > > instance is leaking, or being freed, get, put, etc.
> > > 
> > > Do you think this is a sufficient motivation to keep it?
> > 
> > Then it should be something like %px. I found that %p is mangled.
> > What about having both device name _and_ a pointer?
> 
> No, %px must not be used there. %p is mangled but should be consistent
> across calls. But yeah, it's kind of the reason I suggested to use the
> bridge device name instead.

Then we need to extend struct drm_bridge with struct device *dev (which
I would appreciate, it will solve whole hdmi_audio_dev / CEC device /
etc story).

-- 
With best wishes
Dmitry
