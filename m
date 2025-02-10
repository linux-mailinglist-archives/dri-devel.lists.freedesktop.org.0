Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA98A2FE39
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B72A10E20E;
	Mon, 10 Feb 2025 23:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fvewnKhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A44F10E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 23:14:33 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30615661f98so53700371fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739229271; x=1739834071; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=;
 b=fvewnKhKfktT8ZHTMKkaOA19eqqIroKBRmETVKSzxcpvOmomBDw7G4annCIEMqvAii
 vadqgv7NkoxUME4/lYFclipOvdj87YOMdo92O9CHb4XliJMF/9HcS71uu7qFk7UbMkdG
 iB7L3LqNdY8HbjOb7K4rQ+ieXB8nfWKKPPDbmdns/GKIqUTAHWTYDRwZTpzLboV3idpX
 laM7zPeakkVBYk5BJGAVmusj8agMJRJSr4mBbXUJY0xs/YivB50hhRzkDGivIXqG3IWc
 Ob5IbWIigbQD2Ih9BcDGA09ddZ1DJNtXDB5sdCzBqLsZihVjifSul+WhLqZvsfIHaGpF
 7rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739229271; x=1739834071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=;
 b=Sape+RGuKr6oLX9pnnaZ52NLEnSq0rFpvCdShVozn0kR0UP5S2345lv9+sFu8O2bbJ
 JO4McKxPoAWDSnc4pQEWp7OVfMcPHZy5t+L0agLjKTOvEoal9R2YyZGlUA3rEBtNI/4C
 /WSzzNdkyk8+RyvUW+7GCYffvJ0/yn45CPMiWvfX5PlIdtr7n1hDwuWf4pRyVcDFjUfg
 ldMohGk5Jj5Y+hNCsD/SzM0dj6Esb3et13PI5Edtjs1CMkidw36endrWq1kVrmciEPPX
 xavmYT+t3pMQGFvDdw+BAmDXz5kMFcHrWPW4ZrDqqUdDIrb7pNRJ2LMMNqIuvWMJByNf
 F1kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSrxaPcagOsxfJ+rt1SjxwPTwdCMAlAylrvnvNaZGJ+Ji9Rhw3t6yBHIuVAvWt5BBjSbQPM0zEask=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7JnceHCYAbTIA7U6Cie9dPN4REoqqieZ3qfkv105MZbfEvS72
 7jIKX9BCb28LKc8VbVfgrQE34v6prBBv19lkujIBOqgELbKV9aj+T+ovgnc2yRA=
X-Gm-Gg: ASbGnctWIsJHSTsew38bNDCvtBuB7GyiuRqRtMsZdQZOZwrIPLq27hersyBeN7bzVly
 aqk9ESseZIFwALmz8LBjumxMJ0q2HWeDn6hsNB7xKRbgKjhMi0BwBNDaEQO4b0xP9RlxMa/xmr8
 T8QncMh7f2+1bIXMcV2q6TZ1Gw069hXIT1WHrwpbN/xyL/DQL49RBc9HN/0AjnP6QiqbFTqcela
 25gAzINQ2+cYx5bc6lOZMRIdX+cfUAnGM2N9wZjN9P540oG78QioonSsMVpQEf3MqwE+QKdkTlY
 hO0s7ds9lzrGTw/nNj7XDQgnPbiJDr+zQwVl1tAf71qhP9VrfbkLxynD6IeMA9lcxeMfnKM=
X-Google-Smtp-Source: AGHT+IEiYA4ZdHNW0MIRhlYTkHA5cjZMO3XRsBNobQiwPDauCXQyDb35RHo4o7SlxDmsaMRxsdJWGw==
X-Received: by 2002:a2e:b8c2:0:b0:2ff:d2e4:8dd9 with SMTP id
 38308e7fff4ca-307e5a779a5mr54736081fa.32.1739229271515; 
 Mon, 10 Feb 2025 15:14:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2baaf7sm13653451fa.81.2025.02.10.15.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 15:14:30 -0800 (PST)
Date: Tue, 11 Feb 2025 01:14:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
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
Message-ID: <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210181244.0e3e9189@booty>
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

On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> Hi Maxime, Dmitry
> 
> On Fri, 7 Feb 2025 21:54:06 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > > > +/* Internal function (for refcounted bridges) */
> > > > +void __drm_bridge_free(struct kref *kref)
> > > > +{
> > > > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > > > +	void *container = ((void *)bridge) - bridge->container_offset;
> > > > +
> > > > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);  
> > > 
> > > Pointers are not really useful to track here, since they are obfuscated
> > > most of the time. Using the bridge device name would probably be better
> > > (or removing the SHOUTING DEBUG entirely :))  
> > 
> > bridge device name or bridge funcs (I opted for the latter for the
> > debugfs file)
> 
> These DRM_DEBUG()s proved extremely useful exactly because of the
> pointer. This is because when using hotplug one normally has the same
> device added and removed multiple times, and so the device name or
> bridge funcs is always the same, preventing from understanding which
> instance is leaking, or being freed, get, put, etc.
> 
> Do you think this is a sufficient motivation to keep it?

Then it should be something like %px. I found that %p is mangled.
What about having both device name _and_ a pointer?

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
