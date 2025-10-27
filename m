Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D929C0CE67
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3D10E010;
	Mon, 27 Oct 2025 10:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HGNFwWIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1D10E010
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:14:16 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b6d5e04e0d3so701018966b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 03:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761560054; x=1762164854; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aTqsNz7aSAEuO3Qu/0965qQzJTzUJ1fOn9AY/UKGfhc=;
 b=HGNFwWIhIXj8UAXEuZSGjEORU0ZEdVS/SGlewPi3yl/doliVhvA0V5asj5mH+Pt043
 ZeA3VjOGaQ5NtzVh3EdIzEX0mShRRKkpB1yYrN+ll1PgYqvPejHoukEyNWGg32I+PbrZ
 Tfm86NA6Gz2YOY6HgEOUdGykb1QuZj7tC2YfxNBg5G6qgpX0nGgCfCeczAlNtemvrtXw
 gR5FIiuYblp8WgJMiRW/wxUDnMAyEmo0VYEgghlnZheHe4Q9+JZ8lXhVi5v9wllyQO0E
 8OHBlj3fiq2h52zG3FHtVxkEKyTLXm35+UuvEUAjt2GE5bKVPZJaHZRUh5GlbeGKySPi
 tJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761560055; x=1762164855;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTqsNz7aSAEuO3Qu/0965qQzJTzUJ1fOn9AY/UKGfhc=;
 b=TOd5EaTe9rFXXlZ3SPiPTUwQF73q4PBRpOqpIO0pb/syqP6WYAlHGm3vN8ZXGslRIH
 QzunJpk9yxtaRGwaLDJwx3sci3A/4zF3Iup7RK7yT/4ss/pMwlF5Tno94Qi20Dy4qgmG
 PQibNMkPqCiRSA60FxyjNz+zidVgpMnkKmvXWzbc4hXVUIczwmxwvtWoaN9MInTv+hxU
 HnjOAV1ybrAnL4XDQ+D8a7XZl/+2HrBUrJkkX5821ASXQW1rSh5gPh4A0xVSJSOYn7TI
 e7CqRK/nNTE2RvM79h7VZs7NDj/9sY/SCJn8iy15VJiFLLlsUyC3I+Gcrl839esQfI+q
 81bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyPROHAHAlukfAdq3e1zK0Wf9jFy8W/P9ZhBUlNWiTOySJ8MyyuI/qdSLJi2pnNtz9Hf004exPFas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdG1xefgGQN3/pLflP2YQIV1JLtFLD1LwRfeZYKA6q04wf9bun
 K8YehhzOnmQqxtGSg1i1PA4RZ20J2nkWcmFxUsyR/khgzoW+UCwiqdpH
X-Gm-Gg: ASbGncu9eAOo69Sq6xSgzcb1A2mjrg/pRVaA3TYHkY9+bP03z9bIF1Cu96lVjAi55fo
 ghMSxeQcSsFEbfUdzy2sYhriP0DDNW8QObgXnoJ82Rjk2iqL6rdduDTAJZTKE1Sp1evc2jga2X2
 r1QHUJ3Ceu753PswkMbrY+Q/oE47vLCn74BT4VZSpEGf6KocCOt3XebjzCDRya3kJEp1RqrRkRJ
 PJKWb97dMsHuPNwWqMtglHHeNyA81OQaX6OHQJXW5e403BxJ4WvT+TUeEdchJXxTYe5l1n+1GCW
 eNUzxx5AnnFG2YU8D40GvDEHfeu/x4QQDJU6iMBR6VkNdCS6HrGQejVw+BPvmhGt5BKP+5BOaH9
 pW0RMPw5kOR51jqi8UdIVrtGLiPx5eQhf1/nNo5DvhneXI+12uhsbO0+Xpn5nFLZ4EZAxC06xPM
 JOudvtSuFOf8M40gsaW0in1APNpA7zbOdYx8hDGmnK0oJF9uA60w/n1oPMh0t3SFUKB8Q=
X-Google-Smtp-Source: AGHT+IHuypx/1E4ZSbA9a3TW5kaMs8g53ODTMc8NURVmeWR0+FhA3IWWamFa9Wtwow5u6cxfiIDvDA==
X-Received: by 2002:a17:907:7e8e:b0:b41:4e72:309f with SMTP id
 a640c23a62f3a-b6473f4543fmr4207388166b.50.1761560054349; 
 Mon, 27 Oct 2025 03:14:14 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch.
 [83.173.201.248]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853696aesm725747766b.30.2025.10.27.03.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 03:14:13 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:14:12 +0100
From: Max Krummenacher <max.oss.09@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: lontium-lt8912b: Do not generate HFP
Message-ID: <aP9F9ETIipU55zI6@toolbox>
References: <20250728150059.2642055-1-max.oss.09@gmail.com>
 <20250911153453.GA80715@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911153453.GA80715@francesco-nb>
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

On Thu, Sep 11, 2025 at 05:34:53PM +0200, Francesco Dolcini wrote:
> Hello all,
> 
> On Mon, Jul 28, 2025 at 05:00:50PM +0200, max.oss.09@gmail.com wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> > 
> > The datasheet of lontium-lt8912b doesn't require blanking during
> > the HFP period. Thus use LP during HFP.
> > 
> > Tested with a samsung-dsim (i.MX8 MM) and a tc358768 DPI to DSI bridge
> > as the DSI host.
> > 
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Just a gently ping on this

Any opinion on this?
Max

> 
> Francesco
