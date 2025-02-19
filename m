Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BCA3C011
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A3810E7F5;
	Wed, 19 Feb 2025 13:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Mepsuet4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3687F10E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:37:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso74075275e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739972229; x=1740577029; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QnaSCouzQmNuhqYTcZLJpNbPQUbz2vK2Oob4CBiaQYw=;
 b=Mepsuet406Iu4wfg6PrPU8AMLzihMJXnOp6NWHPYlhS9O1qEZkkTl4gw8OpawlF8Kh
 drJ9IzP1fLvhLOft+dqmjWfawywMBvkotHsee5IqkhMNFCK3hzP/UXDhcWEeZvfm6n6t
 S55u5L/3fghSMeM3mT5Lu4BpDuX0zEJpXXELI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972229; x=1740577029;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QnaSCouzQmNuhqYTcZLJpNbPQUbz2vK2Oob4CBiaQYw=;
 b=hbAcaBOao2aSsNjWz52NVSneaboSWBZbGTdmBym9TabInQwNpuCzNm0Dy4AgmSJ8Sk
 x9d4HRjtSyjoI1UOkfuapjdQex2me1jP4nppaMyS2MzG4SSDgqpvek0wdmu5mC/Ap4no
 6nBzXAyD/ZKwmlXgRlOg6pOwVhxK85dzhE03mS0wuu4yCdM2NpHJqh7CevfrGnodZhnb
 c+Jb3cQX5oZVeOhThVFDam3LJJMakwbnQkuwNQHZpEVLmQdJYEQjQatKZE3RQDZGtlR8
 MOgDnZd4CeVI3aIi6ZEffMABML70rtlkeVTmh68IrfHN1lubWDWY/fyvMtdBTZPloh8q
 xXIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZVSuzVi+uDNjZLMXfJwoTsI5RO4OgrT7Yl/CCMKoYMDrGNK9VsN4Djm3i9/eIHZbLSSFz7jTLqv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9dVnT9F0En+A+HSaeGVLRdR3WPuwqPeogayqVOFX3yUSZ6yUO
 Qpd6sJ6cXw7cndJurgpQMZdUUVApa/VvZkgb5IWj17ry485lg6TczSzX4LVMyxEIVM182V6jKJ0
 B
X-Gm-Gg: ASbGnct6l9vnXotG2KINxoP8Rgm6+dzrr5LCjkrldvpXgYJQLdr30pOOrCxe8K4JLq9
 giLGCdwPEifH3/sMKR1pQ/Bn9D+wkTPSKk3wBuzglK9cjAsIbW0iVfQzYd+mlT24NxPWUPNZH5O
 o2yKC6xA5YnTngqP5mNG8C/bR9AHYZS+5fJo52avKPMFoskFPWxWJEJLWgS8bjOG9AvTZzEiXaM
 13GY3qxvA4v+5GeCe/nXpzvWN3WaAhrAgBRwzdU9EzsxK+49ib02rOjtiO6MN19/ujpylzW6MEh
 x3r7HhGrZLo0Tj3I2BmCQr2fmfw=
X-Google-Smtp-Source: AGHT+IGGRfoQHCYTnobHX61n/c8lJyBUwM3cGLFfRiuWQzf+sYUfBk2z/yW3uYQI5OozES3QICOcIQ==
X-Received: by 2002:a05:600d:8:b0:439:86c4:a8ec with SMTP id
 5b1f17b1804b1-43986c4ac03mr121856395e9.15.1739972228743; 
 Wed, 19 Feb 2025 05:37:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7c7sm215410785e9.27.2025.02.19.05.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:37:08 -0800 (PST)
Date: Wed, 19 Feb 2025 14:37:06 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <Z7XegnwgIy8Xe9M6@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <Z7NmtF83adILfasi@phenom.ffwll.local>
 <padhzkj5astckiltvxkcs4xq335crrhf2m6bvii6cezyoyfypq@t535fgjwqzqg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <padhzkj5astckiltvxkcs4xq335crrhf2m6bvii6cezyoyfypq@t535fgjwqzqg>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Mon, Feb 17, 2025 at 09:36:35PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 17, 2025 at 05:41:24PM +0100, Simona Vetter wrote:
> > On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
> > > Now that connectors are no longer necessarily created by the bridges
> > > drivers themselves but might be created by drm_bridge_connector, it's
> > > pretty hard for bridge drivers to retrieve pointers to the connector and
> > > CRTC they are attached to.
> > > 
> > > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > > encoder field, and then the drm_encoder crtc field, both of them being
> > > deprecated.
> > 
> > Eh, this isn't quite how this works. So unless bridges have become very
> > dynamic and gained flexible routing the bridge(->bridge->...)->encoder
> > chain is static. And the crtc for an encoder you find by walking the
> > connector states in a drm_atomic_state, finding the right one that points
> > at your encoder, and then return the ->crtc pointer from that connector
> > state.
> > 
> > It's a bit bonkers, but I think it's better to compute this than adding
> > more pointers that potentially diverge. Unless there's a grand plan here,
> > but then I think we want some safety checks that all the pointers never
> > get out of sync here.
> 
> Luca is working on bridges hotplug, so connectors are dynamic now. And
> at least my humble opinion is that we'd better provide the corresponding
> pointers rather than having a lot of boilerplate code in the drivers.
> (there are enough drivers which look up connector and/or CRTC) and there
> are even more drivers (I think, I haven't actually checked the source
> tree) that could have benefited from thaving the connector or CRTC in
> the state. Instead they store a pointer to the connector or perform
> other fancy tricks.

Yeah definitely don't replicate this across drivers, it needs to be a
helper function. What I meant to say is that we have a way to do this
already, and it also works for dp mst drivers. So full blast fun of
dynamically selecting the right encoder _and_ hotplug/unplug of
connectors.

Unless bridge is very special, this should work for bridges too.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
