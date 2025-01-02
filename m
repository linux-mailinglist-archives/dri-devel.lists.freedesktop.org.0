Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4D9FF5C1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 04:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B212210E096;
	Thu,  2 Jan 2025 03:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Un7N5oD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6510E096
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 03:27:55 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so9958673e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2025 19:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735788414; x=1736393214; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5FmDRLFpz5VQYbAEJQmse1pMniexgMfpHZTjVy2AVGc=;
 b=Un7N5oD9/sxjMtCsw+GVrN2Elu/mUzYopij47V4Oa1JWJkfE/2SGljphMVwA/gWF6n
 HCNH2VA4WbZaVbFT7TELlOg9B+XdqY3dJbYhgzNIBDg0/QFule/NqL9G1u44BWafvitW
 evdaY1H/R7VogKTgA//qMUQ/v/CmtrJH/f1VC1emJ42sEuZHeB0hMSYlFuZ0aiEieDsx
 zQg6Swz8b9DMVHr2mznSbXHyt19qoiAKPJDBWP1YKu5R+tvUwLkRsG4tu/QVFNEZThkz
 wmjkycWN99pEbIbxtFRJ+QGOa4qRBFdjZgbna6h/QDQxIkioSaMBXdcQio91VcCdRn0Y
 G1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735788414; x=1736393214;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FmDRLFpz5VQYbAEJQmse1pMniexgMfpHZTjVy2AVGc=;
 b=EN5VibkwsAOWNbOOeoC8Z+wGuYkz0aUEwqUQu4O0Cx2ZZBerMYkStBSS/vtsYCllaW
 xURBNVoXbYTWE3/0a2JAdpxs6AyRfRBfz6cu90TSXtLvcv0VBtq7C/xc8Qf0ivEGD/5Y
 fprYcoGVA/SZ95cMuhhJlrowtTRb7uSMboVOocb5KI/Utn9Nhvv0DNjPVRXLZFkYUx21
 kJ+QLt0k4GNxGI8vx7v8jbCW6C5qpNQ9JC/Gy9jSH123rE3vxcRZrPeMHETAwua6EvQE
 gKAzCC11L6h2awM8dCyNu140iaKX+vuHyXDRX6gNdJyHJxgZ03pP7X+xgOCYHz1yTFST
 Ax9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzrsggNgYyFjGGbufpY5gPblk8HWKdqFijpZ65y5T3vBVCxbxo3Et6Gu9qRJwSyIpG1S7JDj6OisE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3Jw/ADEcQWiR0GYa7gXUDJ9r4MKT5CND+kPJGGkN0riWvAMjz
 1SHVqjLH+m3zo+aSuuKXVCoIW9z/8UXMPaLMrrNqLZgFFDzHXXRa/bUWRjeWtng=
X-Gm-Gg: ASbGncsTJDWEiBsZIJUskcQT8FnnafSeyyB4MSpKOyN7cSJ4e1570hZ6IbGo21NF8gD
 rDOSFrTwxikhYFwbmImwfr8tb9p2kVgxtZYmmL8LFosaM90psnYU09YyBZc1Xp7nK9J0nM7qRDa
 WcAvY/bVoB+Ybg8TjT5lXtx2IzTpIFPXs6UpEPwsA4BmF8vWjgBlGrdTS/H2HSArXu4dfAfCwNh
 q5IFA4io8DrcnNEfWYojhAUKi/wVvgxSq6uFGwD9uk6u1YcbKaw//ogNEUF1K9hW+z7CoElmp3G
 z6mU0uZWxn9WaUknhlaWsbV0ddlXTvMXd6HG
X-Google-Smtp-Source: AGHT+IH7I7RcNKZb9xeKgk2U2YJlaxlN65glovYfr8zNiCQJ9pCqdsXeeY1ES71gZQ0js0Fb7YH1MQ==
X-Received: by 2002:a05:6512:3f0c:b0:53e:3a7d:a1df with SMTP id
 2adb3069b0e04-542295619ecmr13281012e87.45.1735788413995; 
 Wed, 01 Jan 2025 19:26:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cae6sm41978011fa.23.2025.01.01.19.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 19:26:52 -0800 (PST)
Date: Thu, 2 Jan 2025 05:26:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <ac4kkjv2nmziu6pd6vkuxbllhkqaueu32snfetpemtu2l5s6ud@cvystps3734o>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
 <20250101223620.GA7206@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250101223620.GA7206@pendragon.ideasonboard.com>
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

On Thu, Jan 02, 2025 at 12:36:20AM +0200, Laurent Pinchart wrote:
> On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> > On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > > Hi Marek,
> > 
> > Hi,
> > 
> > > Thank you for the patch.
> > > 
> > > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> > >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> > >> HDMI but do not contain the HDMI connector node. This flag allows such
> > >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> > >> use this flag, do not proliferate this flag, please fix your DTs.
> > > 
> > > What's the rationale for this, what prevents fixing DT instead of using
> > > this flag ? Adding such a flag will most likely open the door to
> > > proliferation.
> > 
> > See the V2 series discussion, there are a few in-tree DTs which do not 
> > have the HDMI connector node. The rationale is there might be more and 
> > they might come from vendors, so this flag is necessary to work around 
> > those DTs.
> >
> > > If you can't fix the DT on particular boards, patching it could be an
> > > option. We had a similar problem on Renesas boards, which we fixed with
> > > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > > to create LVDS encoder nodes"). This made the workaround self-contained,
> > > and allowed dropping it several kernel versions later (in commit
> > > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > > compatibility").
> >
> > Frankly, I would much rather fix the few in-tree DTs and mandate the 
> > HDMI connector node in DT, which would keep the code simple, rather than 
> > maintain a backward compatibility workaround for problem which might not 
> > even exist.
> 
> The in-tree device tree sources should be converted as part of the
> series, I don't see a point trying to maintain backward compatibility
> for in-tree DT sources.

DT is an ABI. We are supposed to keep backwards compatibility with
existing device trees (at least for a while). I'm adding DT list and
maintainers to be able to provide comments on this topic.

> For out-of-tree sources it depends on how likely the problem is. There's
> no regression if nobody is affected. I personally like restricting
> backward compatibility to the strict minimum, to ensure that all new DTs
> will use proper bindings. Making the backward compatibility code
> self-contained helps there, and we could also print a loud warning
> (WARN_ON() seems appropriate) and set a date for the removal of the
> workaround.

-- 
With best wishes
Dmitry
