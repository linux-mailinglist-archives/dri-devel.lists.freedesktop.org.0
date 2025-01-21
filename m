Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0EA17B4A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4043C10E0FF;
	Tue, 21 Jan 2025 10:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lmt07IJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9AF10E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:20:21 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30613037309so54581921fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737454760; x=1738059560; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3/qaLUYM5W2ReOu65r8NH2ZtbeyUGdu5Hko/s0uLTdc=;
 b=Lmt07IJeDB0cqdcJ7nvfbmPZsH8CuwE3D7vrNMJcrMt4F8CW/xosaaBOnKIGAqHWSV
 hrNeLYYMa9muh5pYzm0OkhNJkYQMKuG632FPnsUIbXAXSsLONLfvQp2m3iaDVMjcYXLF
 EDhAac4OUybyMPYsXcZoEEimnT5eMEK4mYaSmPotRG3e3nIn92kBlZRBC53/zB0tc0LF
 5ElnioZP56NuzH89eVqHOgQgmiYsH1kQzwIhksBVaD2mvg141OxY7USbIjsrLiQvv6QF
 EuCG0KqBA9qEAi3VoMfM2rMvqvsB2eeMH+HRytxwZUmxg1GMGowAG3n1LWlI7o+ltLgW
 yUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737454760; x=1738059560;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/qaLUYM5W2ReOu65r8NH2ZtbeyUGdu5Hko/s0uLTdc=;
 b=cz0B8URBOemThzdsRERQ0TWxrSGUCRhMBYvnI3jIvylcniKGufyN01Op8IAoB4wunL
 +XDhvQSVZsIqoWaOSwqBXXZWXdbVDZvUsuy4dYXAKKm6A7hqMou/xgIWi+oe6S3fWFul
 613Qt5k1vXjt1+Dj08yTBWXd+VP4NZ4MGx8+el8hbD7jIlWzOs0wFbR1uPOoUSKZMQHz
 ob2HdsUCElKIWGeUR/CKqDHNz5oongsLxX0A2/9FXo4Be/9fUkxfUN/jMiYE/hG9Tm50
 FfR+dNzfcWwtIl7sZih21NhtnZTmAKl7rY7PxS02JZHgynTDqm1IXNXXhGsLXvSyjy5/
 ZuqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6XVefPny13flbRrAe9YefMH1koSS4Epmqz5V1/NAvAADwfr1L4jbtNEOvjWIS9+F3CtFhL3YN/JA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNF7cDZRAhnmi7fhsckMmJxROLVpzgEaDsCVsuK8blEJ0I70d/
 fCO3Fki1+dgKtoF13TJ4iqS1Za4Wf6XG6s7A/GGseJZHfPLZriGt/Sy+rxVzL+s=
X-Gm-Gg: ASbGncvBWS/aIHNMUN7njUSAfQ1+6/oUqSL824gNWdUCIRhWWDCR+POidsFkIU0nH6I
 JlEBBSKElr6Im7AsYgtxMnADr1L9R2Lk6vNXRq0ihTkmcaCQuxaauospa/dsArr5rMjKTlZJV64
 KN2nGWqfV23CrnBXkIk9LWYU1ekko85h1ykc2iHp325mMBFkMCdat6pGPV/EDY0dYj3H0GSGQ8v
 Isp+499HpQHn039vYwSzpqK/QPFaEIJKf+d6msRsx1smpKlea5UMHW1ngUET6uDsgkLlfC/DxD7
 d4dxCwmA1GtIC2+U0YZgSDZWYBgFKEsvUOMrPZb+Yoxm+Mqx1g==
X-Google-Smtp-Source: AGHT+IHbpuYbo/rRVHr6skXc36uO5urtDr+Ptg3xD28ohJ+fhGLGO5gl4k0ctXCi9cUtkIGx/m8g1A==
X-Received: by 2002:a2e:a609:0:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-3072caa0b1emr46140591fa.17.1737454759693; 
 Tue, 21 Jan 2025 02:19:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed48bsm21006431fa.78.2025.01.21.02.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:19:19 -0800 (PST)
Date: Tue, 21 Jan 2025 12:19:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org
Subject: Re: [PATCH v4] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Message-ID: <tswyabtwiwrytijwpf77bn4qdwvdez253ulil3u3pk3i3gstl7@zucrguwdouyi>
References: <20250121-fix-hdcp-v-comp-v4-1-185f45c728dc@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-fix-hdcp-v-comp-v4-1-185f45c728dc@ite.com.tw>
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

On Tue, Jan 21, 2025 at 03:01:51PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Fix a typo where V compare incorrectly compares av[] with av[] itself,
> which can result in HDCP failure.
> 
> The loop of V compare is expected to iterate for 5 times
> which compare V array form av[0][] to av[4][].
> It should check loop counter reach the last statement "i == 5"
> before return true
> 
> Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Changes in v4:
> - Fix a typo where V compare incorrectly compares av[] with av[] itself
> - Link to v3: https://lore.kernel.org/r/20250109-fix-hdcp-v-comp-v3-1-1258edb249ab@ite.com.tw
> 
> Changes in v3:
> - The V value compare loop from i = 0 to i = 4 and shall exit with i == 5 
>   if all V element matches
> - Link to v2: https://lore.kernel.org/r/20250109-fix-hdcp-v-comp-v2-1-7dce0a59523f@ite.com.tw
> 
> Changes in v2:
> - pull the check of statment "i" out of V value check loop 
> - Link to v1: https://lore.kernel.org/r/20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
