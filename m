Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4EA003B3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 06:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8B510E7EF;
	Fri,  3 Jan 2025 05:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l4TLfbq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E5310E430
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 05:42:52 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso1956822066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 21:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735882911; x=1736487711; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HUrhr336s+60zt23QDWZqcGTF0DZKHiNks6mhysqyVM=;
 b=l4TLfbq3RUR7HG7vGiZ0lP9VFyblpx3EpLjidgLeGxz5oqef6ToyYtBU7mEwbPfcWR
 I9QFCxaeQp/CovBNRLMot6+fsUSvk9ufseeRr2YZiUb+Ixn9SuzUoxLpReyjZNimwPpc
 RnoSXWoY3l0ksV2rVUn04KIKrx96OHNnkU07vmf9JvcVBx4Y+KdzYf5Ss7mCcxhrRs5s
 uL93tBj/cBu5RI/7aQTzNDAD1sUzOrSpYFt1QqTijUeOa85l8/7md8GGTIoA4KTIu5lV
 w5a2T7C41xPeHZlRnoXJ/Z8idXPPqKvZZTdUkxBV3Raiawd2Jj5lqJLsBqUjiMokJEeN
 5ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735882911; x=1736487711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUrhr336s+60zt23QDWZqcGTF0DZKHiNks6mhysqyVM=;
 b=NI3qIo6PjnD/ep+9q+YETWNCdB4OKtdCUM3o0yQn+AtZIv+c2tZZ94mQuHNL162LNd
 gMpLsj6CG5gOVFtgriHRh/vKRRMfvO5KmTfnDgMn/IaILY7ORBHoz7yL52C5NkOaP4Ju
 CMJE43QX0toxRyO9dMXaJgdekBCZL98mAywzvH8ZtI3PWlpNcAxuDaTU0x/3qf6EvgcW
 DZdHFjwSnGHqIz0K4NbDvoSnkbK1m72TY+8Pdhht9LeW9wTBrkWe1Uc/UbGNIjk1OtO5
 gjrznDIzg5a+Y7ch4idpiNwKyuMpWTLDPN49h5HD3h73Y5KGFuHe9XbvHZ6BX6RPyBvq
 26Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyMJfqlACfkCPwpfPAzfzP4zeqptJkkROb2UXTuGInggxHYDky+f9hrQguNCZAsxCz7A0HWPU5Ilk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWEuYVQRaIG5c4CupI7npsPSSmMYTYHZO7i5QKNge0wqlw/hNk
 Y6o1Fv5hGiHAGU7/frfOA6f60T6JY5cxBx4ciWMH+t9uLUEL4Y0N8u+kswmqGCplvgD3+18NMNe
 b
X-Gm-Gg: ASbGncsiCbiAKxm9YSt9KDdPthsxDTxoDuLFoWRYdZky8z3Bnotv/ODHvDzYv5a4v16
 Q/Ub58RfbvYxRBk58KUuFFmJSv/9hkFK6863ZVcWkj62nD0ytiJ7tei4WkoJ3QTslcZN9f71SEB
 6XAlL2DVvJI5xB7g9Pb1v4ziqvGIcwcLjLPHt7GCYrLHL2/uj72mKTOcxB2qzuoctzIuEdgJaiE
 RNTq/MeXsyqhK3+RoPyT15pKND9PWIR614yHZNV/L1F3SbeTM9uaW8UZCLIyaHJURO6WjiDsj+E
 a/uYagaQs/i/vjam7aiJ9q5jfspkNADp+KL7
X-Google-Smtp-Source: AGHT+IEsLjhbu2jSaiZPN8bLQCUM6NVU655VzJ0kcFZvInsNgvUMyCwvCcQ0/H8BekM4Tf47nmpS8w==
X-Received: by 2002:a05:6512:118e:b0:540:22e0:1f80 with SMTP id
 2adb3069b0e04-54229530295mr13502516e87.20.1735882422120; 
 Thu, 02 Jan 2025 21:33:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813595sm4103333e87.136.2025.01.02.21.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 21:33:41 -0800 (PST)
Date: Fri, 3 Jan 2025 07:33:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, 
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
Message-ID: <zijtpn55edeeepzfqiv6d5xv3vyaircloeaa2pbauwlxow7h3a@a5v6p37o3ppq>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
 <20250101223620.GA7206@pendragon.ideasonboard.com>
 <ac4kkjv2nmziu6pd6vkuxbllhkqaueu32snfetpemtu2l5s6ud@cvystps3734o>
 <20250102083038.GB14307@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102083038.GB14307@pendragon.ideasonboard.com>
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

On Thu, Jan 02, 2025 at 10:30:38AM +0200, Laurent Pinchart wrote:
> On Thu, Jan 02, 2025 at 05:26:50AM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 02, 2025 at 12:36:20AM +0200, Laurent Pinchart wrote:
> > > On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> > > > On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > > > > Hi Marek,
> > > > 
> > > > Hi,
> > > > 
> > > > > Thank you for the patch.
> > > > > 
> > > > > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> > > > >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> > > > >> HDMI but do not contain the HDMI connector node. This flag allows such
> > > > >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> > > > >> use this flag, do not proliferate this flag, please fix your DTs.
> > > > > 
> > > > > What's the rationale for this, what prevents fixing DT instead of using
> > > > > this flag ? Adding such a flag will most likely open the door to
> > > > > proliferation.
> > > > 
> > > > See the V2 series discussion, there are a few in-tree DTs which do not 
> > > > have the HDMI connector node. The rationale is there might be more and 
> > > > they might come from vendors, so this flag is necessary to work around 
> > > > those DTs.
> > > >
> > > > > If you can't fix the DT on particular boards, patching it could be an
> > > > > option. We had a similar problem on Renesas boards, which we fixed with
> > > > > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > > > > to create LVDS encoder nodes"). This made the workaround self-contained,
> > > > > and allowed dropping it several kernel versions later (in commit
> > > > > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > > > > compatibility").
> > > >
> > > > Frankly, I would much rather fix the few in-tree DTs and mandate the 
> > > > HDMI connector node in DT, which would keep the code simple, rather than 
> > > > maintain a backward compatibility workaround for problem which might not 
> > > > even exist.
> > > 
> > > The in-tree device tree sources should be converted as part of the
> > > series, I don't see a point trying to maintain backward compatibility
> > > for in-tree DT sources.
> > 
> > DT is an ABI. We are supposed to keep backwards compatibility with
> > existing device trees (at least for a while). I'm adding DT list and
> > maintainers to be able to provide comments on this topic.
> 
> Backward compatibility is about supporting old DT binaries with a newer
> kernel. There's no need to support old DT bindings in in-kernel DT
> sources. By definition, if someone compiles a DT from a newer kernel and
> installs it along with the newer kernel, there's no "backward"
> direction.

Hmm, nobody is asking to provide compatibility with old DT bindings.
However supporting DTs with no extra "display-connector" bridge after
the DW bridge is exactly "supporting old DT binaries" in my opinion.

> The backward compatibility requirements aim at ensuring no breakage when
> upgrading the kernel without upgrading the device tree. As I mentioned,
> there is no regression if nobody is affected in the first place. Proving
> there is no affected DT in the wild is difficult though.
> 
> > > For out-of-tree sources it depends on how likely the problem is. There's
> > > no regression if nobody is affected. I personally like restricting
> > > backward compatibility to the strict minimum, to ensure that all new DTs
> > > will use proper bindings. Making the backward compatibility code
> > > self-contained helps there, and we could also print a loud warning
> > > (WARN_ON() seems appropriate) and set a date for the removal of the
> > > workaround.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry
