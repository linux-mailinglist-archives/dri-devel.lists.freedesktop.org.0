Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3FD90C9BB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12AA10E196;
	Tue, 18 Jun 2024 11:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Z92I5hYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE15510E196
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:37:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4217990f8baso47753295e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718710636; x=1719315436;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MNFhFsMuCR3JzVpbfDPPfZyD9hhD06jT8f7Cvk9VHLU=;
 b=Z92I5hYekHBZjfgidqZspDP7rOUr140Ilx4hmf1IR5mEnr+2T+57uWdSVy1QNbNlb4
 Z4mUyhvDVXYYtFEl7livAZUM7mOfAtvA49a2d+FNELWnUNoEdZFw7sqREZVmEdNZ8ffg
 X/odRp1DNPhgWBTLAsc9I4QC7oZ2EOWa7okwuAgN9/dDCLJ0cOBJtGg3dg+2p6pctdSb
 GuWHpTJ2F2nCnk4JUv+IU5A2mQQyNKVaXsKXV66dvnP93/iCJqapLCzA2rqUeNb7fOjS
 z4Gv8rvN5EjMOXjT8NDnJBPEY/wIHRC5yAMdZzpiuDZYO/1aYx0fWsmAJsAMEFLkWJab
 CVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718710636; x=1719315436;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNFhFsMuCR3JzVpbfDPPfZyD9hhD06jT8f7Cvk9VHLU=;
 b=dNKnqzTau0XRJxNmxnZXPpyTMAFd27WqfO4sebpidBouZXTI0AFUA3pRzRod6hlSj0
 mV2xl+QcQBHDipLVdx/1Z/BaVcdDAvEBmlwRQrfEgJRPBFqtffwt4CAhLKy07LMCS+4Y
 48kWri6fzIv2BIivYrKFhWaNsSRXziOIQk04FmoBO/gH1KmaxfNyEIhyM6ey9NoSmZVi
 0eD+HAbyVCm/nYCZMRgwlyH3DnVb/1QwsHCnyZu8egt9zzLF5b+AYKgZrfIDqWIH4wrT
 IHkNCtC9+Sy4SOmfJ84T4J03reZpB3cC5PyQihqDwUO+bQr40c+8sVE05W1y1Ep9vrlw
 Jezg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7M01OUeFu4khovvY985dS6BkfMmT/NUGYoUf1Bagheg8/3Rmswn/yaYkTNovdWtJAxE9eBo4NRJsRsva0TdxWT//fiDuAj5PaAVZHuhL5
X-Gm-Message-State: AOJu0YxI4BZDHOBz6sEXsDzFgAyzl71qFCO/57uaK0apij8lcNT8yC1G
 7vAyTdeDgdSGEKUZ+/381Y/Es9H084G4GPB9rb/53xCT2BdfJG0ieUOQIlamIIs=
X-Google-Smtp-Source: AGHT+IEkKPX6JB+CVD4NP2W7dGUx1o04BJP6SVB5Vk6qEZ79NuxuyGaMjWKm/C/X6sMP5ctfytwVVw==
X-Received: by 2002:a05:600c:4706:b0:422:384e:4365 with SMTP id
 5b1f17b1804b1-42304821335mr101579035e9.2.1718710636358; 
 Tue, 18 Jun 2024 04:37:16 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6127c1esm185260555e9.23.2024.06.18.04.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:37:15 -0700 (PDT)
Message-ID: <82c982ad-20ae-4f36-8797-440828317d32@freebox.fr>
Date: Tue, 18 Jun 2024 13:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm: bridge: simple-bridge: use only devm* in probe
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-3-df98ef7dec6d@freebox.fr>
 <deirqqoap7ta3iwmmvg6uxzalfe22yirjp6et2a74ffh5ybi64@vekr6l7sl22c>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <deirqqoap7ta3iwmmvg6uxzalfe22yirjp6et2a74ffh5ybi64@vekr6l7sl22c>
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

On 18/06/2024 00:28, Dmitry Baryshkov wrote:

> On Mon, Jun 17, 2024 at 06:03:01PM GMT, Marc Gonzalez wrote:
>
>> Once probe uses only devm functions, remove() becomes unnecessary.
> 
> Breves vibrantesque sententiae
> 
> With the hope of getting an expanded commit message:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'm not quite sure what else to say.

Using only devm* functions in probe, the remove() callback is
no longer needed, since devm unwind will free all resources.

Is that better?

NB: this patch is not *required* but I thought "might as well
change it while I'm in the code".

Regards

