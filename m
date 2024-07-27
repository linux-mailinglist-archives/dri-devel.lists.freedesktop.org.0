Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A099793E0E9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 22:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCB410E0C1;
	Sat, 27 Jul 2024 20:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oRqdiTWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BF910E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 20:28:06 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2eecd2c6432so35481051fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722112085; x=1722716885; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a5TCSE5IQPZmg5+Co6Qb5Q76qkbbdisagHTdBaE0Lw8=;
 b=oRqdiTWyoj0zY6VmGrUGUv+wLd/kcpIKe7JXw1C1CRJDRmfdtjyyoqRbY6/JQr/zhr
 tV88UpVNbI8JoaR3Br7+tCFGBuGGn3gT9fUa1CAWiCgPo+pCJsQOTdw4let7XGfl1zTl
 OOOVKQVqdz6qxja1OrQH8tGP31PV8uRjFMDPgsXRtac0mhNqnPKIcMszfQknPTT/p3ky
 3YgAiQ7IS0rXrngmVSfj9Ae8A8uCEPdS9gHqe22lnzPh91sAxIFmRtToTkFfTLA3m7DM
 JkjhA6rnHt/wTVKqIdmcwP6fGzEI/t4h3gpgi7Arl3+mjlxPkfIrh1OEGNZJxjG2XRU+
 8sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722112085; x=1722716885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5TCSE5IQPZmg5+Co6Qb5Q76qkbbdisagHTdBaE0Lw8=;
 b=szaDDBMrncXRO5EDb6y5Jg1ADZWirihP4LiPiqUR/UDb0Uk2NfKNEG1XAf2A6oa+WJ
 3CJATMAIonK54+zjv5gTSPcQxd9OvSPywuiyzC3RXyQWvT96kdoXqSCfHfKrJwimK9n3
 vF11YvIJCi9hal2AZsD5Ap5MYkaqiXo/65anvLwQ7nTWT+hok2Q6S5llPbNFeasJirk8
 rvRn9Cg6h4hhAUNmdK0kWfacI1RnQ41W7jJ3OoSqKiSkAwtVXHhIvrkvK9XzphaqIcUl
 A1n69FvI1HzKKRuD71s8YFUScU6LEY7G9TDO4jCu1IhADOC+TtCXTnOudpQugXGT5Ohc
 SsGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjKa6FYVHuQ14CaVXztutxjXIcKp+1wLvE9QzEs+gG2wEU134DBqP5XX9EIPSOjBe5guCN4+8YWYwtYau0GnJmnVYYcM7m/yinAQq2CQTN
X-Gm-Message-State: AOJu0YxHsNw1q+yYI4FPB17M8eZeCIdnCkGQ2G21NP0NBaTS7qEaQFG3
 ybVq5z0queFJaO6l0XBesDgIJCOHO9EPclB5tmO3uMDu9tBh12E+9mHv//0bmYA=
X-Google-Smtp-Source: AGHT+IHk5AHyaj6Kn7pMIySWcR20lekDgoIkBhN1ucGkQo9nR7bUmFlDSzTzDXUXY1CP8lJJ++NOEg==
X-Received: by 2002:a2e:b5b1:0:b0:2ef:2555:e52d with SMTP id
 38308e7fff4ca-2f12ee6342bmr21991621fa.45.1722112084809; 
 Sat, 27 Jul 2024 13:28:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d074ea4sm7683151fa.116.2024.07.27.13.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 13:28:04 -0700 (PDT)
Date: Sat, 27 Jul 2024 23:28:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com
Subject: Re: [PATCH v3 00/19] Add Freescale i.MX8qxp Display Controller support
Message-ID: <zr2t6deyvwacawj7s36gols2vxu24fah25x6ofy7xpqyvc4s2d@luavybrlxpaf>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <wky3mjl7fn773myatyrdsea6oc2xebkvrgmigmmoj36eswgqry@2kox5ad5dynl>
 <aba35ecb-2357-4c4f-8366-08d14e40d436@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aba35ecb-2357-4c4f-8366-08d14e40d436@linux.dev>
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

On Sun, Jul 28, 2024 at 03:10:21AM GMT, Sui Jingfeng wrote:
> Hi,
> 
> On 7/28/24 00:39, Dmitry Baryshkov wrote:
> > > Hi,
> > > 
> > > This patch series aims to add Freescale i.MX8qxp Display Controller support.
> > > 
> > > The controller is comprised of three main components that include a blit
> > > engine for 2D graphics accelerations, display controller for display output
> > > processing, as well as a command sequencer.
> > > 
> > > Previous patch series attempts to do that can be found at:
> > > https://patchwork.freedesktop.org/series/84524/
> > > 
> > > This series addresses Maxime's comments on the previous one:
> > > a. Split the display controller into multiple internal devices.
> > >     1) List display engine, pixel engine, interrupt controller and more as the
> > >        controller's child devices.
> > >     2) List display engine and pixel engine's processing units as their child
> > >        devices.
> > > 
> > > b. Add minimal feature support.
> > >     Only support two display pipelines with primary planes with XR24 fb,
> > >     backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
> > >     when necessary).
> > > 
> > > c. Use drm_dev_{enter, exit}().
> > > 
> > > Since this series changes a lot comparing to the previous one, I choose to
> > > send it with a new patch series, not a new version.
> > I'm sorry, I have started reviewing v2 without noticing that there is a
> > v3 already.
> > 
> > Let me summarize my comments:
> > 
> > - You are using OF aliases. Are they documented and acked by DT
> >    maintainers?
> > 
> > - I generally feel that the use of so many small devices to declare
> >    functional blocks is an abuse of the DT. Please consider creating
> >    _small_ units from the driver code directly rather than going throught
> >    the components.
> 
> Well, I really don't think so. I don't agree.
> 
> I have checked the DTSpec[1] before type, the spec isn't define how
> many is considered to be "many", and the spec isn't define to what
> extent is think to be "small" as well.

Yeah. However _usually_ we are not defining DT devices for sub-device
components. So at least such decisions ought to be described and
explained in the cover letter.

> 
> [1]
> https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.4

-- 
With best wishes
Dmitry
