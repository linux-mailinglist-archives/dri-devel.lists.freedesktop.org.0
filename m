Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D30A0086A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 12:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C23610E878;
	Fri,  3 Jan 2025 11:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WYuXDz/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334610E0E6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 11:15:27 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3035210e2d1so111508181fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 03:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735902866; x=1736507666; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W/HnUfny5d435SGNdPuoKeuQ77NeJJYm5sL6+xVD0KA=;
 b=WYuXDz/3qrek6HGdWsr/szeoJQZCpLDXybI3GeaaemPISuWdJ7EhjOHj3SrsjfXRTi
 6+8jSTqU3nzuZOUo0QndCM+TB3vciw69d1FkZ/4YkMU6Mj8AnuXX7e19J6qoPgfUI+8k
 J8i2+ZbJqiHOFE+Voy2w3oT1uxtIZkpb6bJyI5nOyMR41Y+/NTEGhjHB+3NzvS/UXLFf
 A57+dFHPEpDkPabO3ETfHJRzXaePT97pHc+G1nz/kmofnm3JOTS6FftiepIFYtMCDbEG
 L3JSe2zvK4C3r/Khk3hV6+EnznRcZHRmWZzDGjOgDPbjKoIy3dCjICPDmPHiZh4IblFR
 Z+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735902866; x=1736507666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/HnUfny5d435SGNdPuoKeuQ77NeJJYm5sL6+xVD0KA=;
 b=jMZjQ08A1OSa54toJSNvw611ehs3qRYRJUzGQSFDRoOshR7awF+LDgYecVSZU8hA1D
 lkUokyCJt42UGJBq8G7Vs39JyAmIGYq1StIQbXeThqtRHnwittH3tc+QynzvpQDsNmZO
 lizqA8zj2ztUlNfHesG1udCqlw4RiydffZyOgDlZJyIR/vLz4sg7mxPvRjvLAZttgMuh
 F5HJMlHC/Z9hlC2Hr4fafsX3FxQorKhmZ//Ymke3ezE9uYgbl3RYOgqww8+BI9mK2jWV
 PpCBbY+1O9QkJNGq1ncZ5N2Wmy8hvz+5ac3dhJQdvPnyWHOoGzVLi0S+luv5O3STg7PO
 cCfg==
X-Gm-Message-State: AOJu0Yxd1iCtXx9hU5xPOEO5IYfAXQMnov4pIQqRm65qo+aJXNLUVv3s
 pMgMxPqnBrjfDD5T4nx7d0YHNWp48tPpmU56neqJmIcCVm8Jr1e3CrDVvCoEi+bnIwesg+ts9VZ
 E
X-Gm-Gg: ASbGnct4f5dxr8yL8tcfKYbVXaURboj2158MTmX8bU4ipYXbH8YNcxs5mmQbnJp0PUU
 nzULfgW4FPMCIBu1NCHDAylvPWsDYHl6ZUanSljxYyNYe2stb2ft6E79tMQDF1yVAz8DHpg7JH8
 2WcrSk3qLJyS5hHjdMi4WVMTb7CLqGHpDdS4o+WjJUDA16HTQk3JShAqf5XO1LRxXp62X+Q7o6w
 WhEZ+ZhEesazm8zHg2B6Q16GC15zUCqopyrlIUKjmlHTakSgF55PSow1IkWik3n6mNq/6WogtMm
 6qNNeFOQ4RNo6FmjkTDB4jqYSs9GKzcm8rdv
X-Google-Smtp-Source: AGHT+IGAqbkvSRx/h4yrykLQ5HEl1FLUETMdB5GHCbRDjRB6VqfbWbehK+Cn9SbsdoPS5x+qvJ4Bhw==
X-Received: by 2002:a05:6512:282a:b0:540:22e0:1f63 with SMTP id
 2adb3069b0e04-54229533ae2mr12292644e87.19.1735902395509; 
 Fri, 03 Jan 2025 03:06:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5425f295305sm834356e87.46.2025.01.03.03.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 03:06:34 -0800 (PST)
Date: Fri, 3 Jan 2025 13:06:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jesse Van Gavere <jesse.vangavere@scioteq.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: ADV7511/13 implementing atomic ops and bus formats
Message-ID: <u3mciz2pjwgw5nrrkittkyqfcvrwa2hog5aueo23irvmgaty2p@vcggz5nodvwg>
References: <PASP264MB52976B917B5F002234D72DDEFC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
 <rh4xzo2cxciakrmaiw6bm4hfx6qwf4zj7bqwdzzdovt7rp4wrl@ir34ydimkp25>
 <PASP264MB5297BCB83AB9AC42FFB8F4F5FC142@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PASP264MB5297BCB83AB9AC42FFB8F4F5FC142@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
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

On Thu, Jan 02, 2025 at 09:04:47AM +0000, Jesse Van Gavere wrote:
> Hello Dmitry,
> 
> ...
> 
> > The atomic_check() function verifies if the passed set of changes (in the form of drm_*_state) is valid from the driver's point of view. If you have nothing to check, it's fine to skip the function.
> 
> ...
> 
> Perhaps one last question on the use of atomic_check, this function is
> needed for TIDSS so I got to implement something either way.

How is it so? I don't see any specific requirements on the TIDSS side.

> Currently I just have an empty function returning 0 there.
> So I looked for something better and stumbled upon your usage of the drm_atomic_helper_connector_hdmi_check function
> in this commit: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/bridge/lontium-lt9611.c?id=ac4627c304e7a09068d0e2dba34d21e492649f8d
> 
> Would this be a good candidate for the atomic_check in adv7511 as well
> if I pair it with implementing the additional necessary bridge funcs
> (char rate valid, infoframe R/W)?

I think that's a separate topic. Bridge drivers don't have to implement
atomic_check. In fact, if you check the latest LT9611 driver, it has
dropped the .atomic_check() completely, as the corresponding HDMI-state
check function is supposed to be called by the connector code (e.g.
drm_bridge_connector_atomic_check() calls it).

Regarding the conversion of the adv7511 driver to using HDMI callbacks.
This has been on my todo list, but I'd rather land HDMI Codec and
generic CEC patches first.

> Thank you for your help.
> 
> Best regards,
> Jesse

-- 
With best wishes
Dmitry
