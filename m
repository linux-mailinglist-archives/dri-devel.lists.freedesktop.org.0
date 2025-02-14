Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484CEA35F08
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B240C10E2DB;
	Fri, 14 Feb 2025 13:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YqpJTwbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED76D10E2DB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:28:09 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54298ec925bso2877155e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539688; x=1740144488; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FQxy+yN7dDezeAO1BEXInClcUYOsHYnJkVVioVQo5MU=;
 b=YqpJTwbOAHPrEMzCfE/lUpgC7LL5wrmjcWyvwI34xdlcF15+MeYbKJyK+pHrYxQdXx
 pyFqJmBPl84e8nhkA87pr/lwXj3yvHqD09dmI//OlPAaa6qSc/QI1crszLhLokxxXsrG
 zyQkQ+3E6SQiNs+m6u3MEIPZFeKuRhpghJ6YPNH+0d88Sh4Gh9FFud+YuuTlnoZ3iFtW
 AR67sYUo/hhVCQzzcIICoAih4wpmta8So9o+TpqGVFRgS0SaSHJRDQnaG5BVtt0O045B
 5i20QRygo5vnSbMcnmngxe0qe0LViuKzIIYA40oKIsWb84DS5WPFTuKrLtXnPhmF0/5y
 42lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539688; x=1740144488;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQxy+yN7dDezeAO1BEXInClcUYOsHYnJkVVioVQo5MU=;
 b=EfmXewhHYEZktdHBY4Q5o6FoYpUQNnsRN3DTF70Lsbu0m+zgF2sSxhuRZIZ6RyY3Xz
 722LU7k2LTfy7GhNoXGYcCx/V9eU566mxveANfPtnuynRyWi9hXo6DRbeoYk7lhEJa40
 6FB4oqIIQvRedClTfPVHg3fNP5H3F87Fez8PXn1OspYevpxUA56cMhS+PykqcqkHAHOl
 kAOeNI8gW368MGfVoQj7YqY6lgCG951oAIOKJl8shGl5cNfExBc3XSOcWXbNMQcrGQSi
 qgobAjCxTb85RQRYuFS5iSYbEK6rdeYY7vK6Td9YfT3PMbdnxcUMoPrw/XtPFz702sfy
 PQbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/tfsM4Zr5s9CQoT4UCDMuux1vf9LTQ43L7LS23CPPdLBALfOu3kv6H95XSGLTo9ppMWCaKpNNQ5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7ouYlJCw11vhE/mA1Edqfnih6V2PmvEONq0RgYO5UmBgQGfeb
 7CGqKcWezmxYefxMNklKfgCA8HjY3+kfariySEfXuZefe3UnGbGtWoFB3jD5pWE=
X-Gm-Gg: ASbGncsbIBsXjnbzCrHQXFUX+s5PRajh++MFaZm0n0kMsR4oA5z4+a1cXdHAXsJ4LtP
 JnjMQCs5Z6FkMIiJ2czW3VrriwnwrBLvdKvJSxBqDSmXSLxstckFRejoEw2VEqXnDE3Fod7cHCx
 awkLqjovu0yHlKTRskiNW43U1Oy9nFSBogdYYSmDH9r+PE8atGtlEniWl1mqlHP0lTvpP67rfoK
 rUQ5CILUI6rre0zbKPQzXXJKn55kAl4NokUdDrU0Zx0rMihWy49i/agzPt2d4C9o+OQpt2jo8dY
 a4EpYbQytNIC/vpXsWQX6MXhu7yJd9N0OH2oPdnpE/hOx7jmojHGCFdDtX9IYAmQPYTEpT4=
X-Google-Smtp-Source: AGHT+IE+/yVqkSlc/szw0oxVKt3XobQ/Da8KVl8Esh/I9HvZM5iaCR0ebQNJvarLi+5UvEJcAruV/w==
X-Received: by 2002:a05:6512:4026:b0:545:48c:6352 with SMTP id
 2adb3069b0e04-54518185a7bmr4330037e87.43.1739539688223; 
 Fri, 14 Feb 2025 05:28:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54526745abcsm282948e87.252.2025.02.14.05.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:28:06 -0800 (PST)
Date: Fri, 14 Feb 2025 15:28:04 +0200
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <h6nqaxoq5eohevpdlym4g24lqeeqhapzmbjdi2lyyjrhyu7wrj@omypjnlxniz2>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <gyfchljgrqamb26sot4c26gcwupbst2zuu5fw6el5wsl6gl5xp@ruqbpsn4lpvx>
 <20250214-evasive-eel-of-piety-d59e46@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-evasive-eel-of-piety-d59e46@houat>
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

On Fri, Feb 14, 2025 at 02:06:34PM +0100, Maxime Ripard wrote:
> On Thu, Feb 13, 2025 at 06:32:39PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
> > > Now that connectors are no longer necessarily created by the bridges
> > > drivers themselves but might be created by drm_bridge_connector, it's
> > > pretty hard for bridge drivers to retrieve pointers to the connector and
> > > CRTC they are attached to.
> > > 
> > > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > > encoder field, and then the drm_encoder crtc field, both of them being
> > > deprecated.
> > > 
> > > And for the connector, since we can have multiple connectors attached to
> > > a CRTC, we don't really have a reliable way to get it.
> > 
> > The same comment as for v2:
> > 
> > It's not very precise:
> > 
> >  connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> > 
> > Is that unreliable somehow?
> 
> Then I'm not sure what you want here (and in v2) either. Do you want me
> to drop this patch because it's redundant, drop it, something else?

No, basically to expand the commit message. It states that there was no
reliable way to get the connector, but there was one. I'd mention that
getting CRTC and connector via the state results in a boilerplate code
and complicates bridge drivers.

-- 
With best wishes
Dmitry
