Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FFA31AD5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 01:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4D710E066;
	Wed, 12 Feb 2025 00:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vk7d1tBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA16310E066
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:51:09 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30762598511so60477091fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739321468; x=1739926268; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+nLci9veCthHDubqv0cSUycI42m1FuOueczGHBi1MmQ=;
 b=Vk7d1tBcyiZCZBheYuir3NFyzsXfe0sLGJ9WuOAaNOD6xwdCNaYRQYDroBkS8iwBwO
 7UDNK1Vwhp30mF6TNTU5tdYsbGiBplKJwgj5RC7c78uWU5iGLEFbfee+uiMrgEHA6ZGg
 yFprJJ6eEznMZygk4s7KrIsebW6/0SGxFWvXL8sq/il4iHC2PXMuVAnJiTmrquFki9sX
 LWAs+51+l7fMsSD2yTNPw/qsJAAQLvENJazAHR/N3qd+cCYqeAcJ8a4pTG/93Sm72NlT
 jDr9Hbexrd+91V+76hzUPnVnbH/LZcys3fIbw5meo+GixkTD2B1kQdW5uqfrYCfXLZVU
 1KzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739321468; x=1739926268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nLci9veCthHDubqv0cSUycI42m1FuOueczGHBi1MmQ=;
 b=Z0NvZc+bhNndHb07832vTlSs73yeBVeI5F5c0mdNu3gNWfxgMpcWYzuGfWVCOrq7cu
 o4SmaN0VZIEQGw1l/LuGhJFOoIq6Krj7uf8paikRFkLOWnpFy0VyTst1C77CtYvaXO8D
 39AHDeSj+SjHXn9bHF56LugJOQPK1ocZhBoRm/r1Lmii4aFewDBcHclgRQBT+fB4lCOQ
 UvAy6aDNrf8J+Ec6HOYFbvUsZmoxAC1lk/Jx5AXar1aCIwQWi2FX5xC7Km0/zp6FfQcW
 oRsfvX2l/Zql1WLDNN0vMPrHgS+J6xUj+/B0mpZkTcPD802r3S3Ph+ol7FLbcTIVmRQL
 IXVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgEgwaMbYLCWbNFdTBo9BlSvKodqR0qBsS8E18rws/6QAgeS+3bj41DMq978f/UPtzOGaxdMh/dEc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZhYerGxcnRucmxq5NXpwu0ev+QnwD0YYTX74A56Aa4N56S7lv
 rHjFtiGSrjEUb/CS7ITqaGbg7VVExaStl9I0j4/RbpkpILYWZqVM9DRkPpCXcvI=
X-Gm-Gg: ASbGnctaVrfUac2kFr+uS+iktXyksgmjrya34vDsnmRoiwQrl6evhndjA4Kh5MbJAoH
 eDLFPmvhntKJzGPNkr3fyUduoai56WeW6oRoQFaOMdNe7M1rq36T8DJNVfCa1LB4V1Ok9xAOtls
 u7FiaH60cuEUG6YfsopYAGmfq77sRC91iEJAPLfGcNhfaudLlpBYT+uRWWZ30fTrM/08iyYFeOA
 /QQhAd9VSUOPRA9TK7KdzQ2nIFQy33ZTcnNPX9HBHgzGQyJuHXT1YMXJtv6UAwu53sNjKKriKh5
 SD5ENYnBjhdoGKTz1NRI0mGT3Qq5D1YF3yZnSWEyfJu2xuFm1QP+gMggbSJRLwng2ASr804=
X-Google-Smtp-Source: AGHT+IHrEVCtROhIx+YyYA4QRU91GByT1IhN/KKKBcdE8BrWoX2fAT7zlZDzAxjgWmcLyL1wGBtxPg==
X-Received: by 2002:a05:6512:33c9:b0:545:6fa:bf60 with SMTP id
 2adb3069b0e04-545180ef5famr301216e87.19.1739321468152; 
 Tue, 11 Feb 2025 16:51:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545067a7576sm1079063e87.198.2025.02.11.16.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:51:06 -0800 (PST)
Date: Wed, 12 Feb 2025 02:51:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 00/35] drm/bridge: Various quality of life improvements
Message-ID: <b5og5jvjq4jnq5rogyro5rtahayvsbroq4z3yrplioyb4itbak@3cepdouqxyny>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <yudkovtipwtnofr3o2qwqrmriwxlczrwploieh5i4ke3sx5zhk@5ktlrew7o6k2>
 <20250211-peculiar-misty-moose-639556@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-peculiar-misty-moose-639556@houat>
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

On Tue, Feb 11, 2025 at 02:17:30PM +0100, Maxime Ripard wrote:
> On Sun, Feb 09, 2025 at 05:27:01AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 03:57:28PM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > Here's a series of changes after to the KMS helpers and bridge API
> > > following a bunch of reviews I did.
> > > 
> > > It's mostly centered across providing an easier time to deal with bridge
> > > states, and a somewhat consistent with the other entities API.
> > > 
> > > It's build tested only, with arm64 allmodconfig.
> > > 
> > > Maxime
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > > Changes in v2:
> > > - Pass the full atomic state to bridge atomic hooks
> > > - Make attach take the encoder as a parameter
> > > - Mark bridge->encoder as deprecated
> > > - Rework the logic to detect if a bridge uses a state or not at
> > >   atomic_check time
> > > - Add lockdep assertion to drm_bridge_get_current_state()
> > > - Link to v1: https://lore.kernel.org/r/20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org
> > > 
> > > ---
> > > Maxime Ripard (35):
> > >       drm/atomic: Document history of drm_atomic_state
> > >       drm/bridge: Pass full state to atomic_pre_enable
> > >       drm/bridge: Pass full state to atomic_enable
> > >       drm/bridge: Pass full state to atomic_disable
> > >       drm/bridge: Pass full state to atomic_post_disable
> > >       drm/atomic-helper: Fix commit_tail state variable name
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_dependencies()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail_rpm()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_modeset_disables()
> > >       drm/atomic-helper: Change parameter name of disable_outputs()
> > >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_disable()
> > >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_post_disable()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_update_legacy_modeset_state()
> > >       drm/atomic-helper: Change parameter name of crtc_set_mode()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_planes()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_modeset_enables()
> > >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enable()
> > >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_enable()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_writebacks()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_fake_vblank()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_hw_done()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_vblanks()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_cleanup_planes()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_cleanup_done()
> > >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_flip_done()
> > 
> > I agree that use of the old_state can be confusing (and it has been
> > confusing to me for some time). The main question is, do we loose useful
> > memo 'this is the state after swap'. Most likely it is useless now, just
> > wanted to give it a second thought.
> 
> The drm_atomic_state doesn't change after a swap, only the
> plane/crtc/connector/private_obj (and their state) state pointer do. And
> if you meant that old_state mentions that the states have been swapped,
> it's still a terrible name and we should change it still :)

Ack, sounds good.

-- 
With best wishes
Dmitry
