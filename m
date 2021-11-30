Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A693A462E86
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133E76E422;
	Tue, 30 Nov 2021 08:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690966E422
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:29:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o20so82987377eds.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dZTgvqCQzOi5wu1nAoVViZPLi5UAdoebcJH3M9m3GC0=;
 b=ddwrF0dxczqHZgakxz5rz8UQKCG6saXHRXR6OnL2+gE532LXVQHEOvduF96Buqwm/9
 QxbMLLRopDDvyL+eOyN0g/iUp53icAjZNz4h+wijnCTHcl3gE4jtDvoZZIByZz/3pk9i
 P/+oiKTZ3/+ZK+1yqO9xTjgtDuelfgl3mmq0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dZTgvqCQzOi5wu1nAoVViZPLi5UAdoebcJH3M9m3GC0=;
 b=f22ggIe/MPJnmORZleF9i5yNJg9aKk6lYyZOaaWxLS9BIG4C0ovqCpoArogdiYAxwG
 yXX3TgKYv5b0dGoTZ+htcI5EhJDzrYtREy5FYympS26V1TqkdTw7zW219xmVQ+I8qzJq
 5plqGW4C70xqO0SopVuIC2lnBCE2Bc+HfN9sxP+PRKy2Y5i9oiYOcjjWeyPBI5fw8vME
 XtCZ9SLt50yd7m6Z6VmpdLfaaVo00H3Tp/gKKuxdniLsbSUIe5O2i/DsuJfjciqL+GK4
 AH/DwU8w/9u1e1kBhP/GkSNjBJ6ncEvSzQny65RI30JwpOsAEEVytVhiaD+aqWiTGW9N
 Ql9Q==
X-Gm-Message-State: AOAM533MAxiXVjxQSWdKSUWS8anMN9vg+L9BdhtsDu/z3CxwPr+YGBzu
 uwstxvGjL5uXA7Tiu1Q3IFnwnw==
X-Google-Smtp-Source: ABdhPJxcP+1jMl7JiZDWnbbxzqBTeKXkHqVZlBVm5/gq11nWAlJmHDzO0uvczDRrKMlcQpgUbbCQGw==
X-Received: by 2002:a17:907:7250:: with SMTP id
 ds16mr65695674ejc.54.1638260951986; 
 Tue, 30 Nov 2021 00:29:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cs12sm8667420ejc.15.2021.11.30.00.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:29:11 -0800 (PST)
Date: Tue, 30 Nov 2021 09:29:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Message-ID: <YaXg1ZsoS+aH3nB/@phenom.ffwll.local>
References: <20211118103814.524670-1-maxime@cerno.tech>
 <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
 <20211126154349.aksr4kjhvj3xueir@houat>
 <YaEVirocULCwNNnZ@phenom.ffwll.local>
 <20211129100741.pqxyvu5wcti7ntck@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129100741.pqxyvu5wcti7ntck@houat>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 11:07:41AM +0100, Maxime Ripard wrote:
> On Fri, Nov 26, 2021 at 06:12:42PM +0100, Daniel Vetter wrote:
> > On Fri, Nov 26, 2021 at 04:43:49PM +0100, Maxime Ripard wrote:
> > > Hi Daniel,
> > > 
> > > On Fri, Nov 19, 2021 at 05:01:14PM +0100, Daniel Vetter wrote:
> > > > On Thu, Nov 18, 2021 at 11:38:01AM +0100, Maxime Ripard wrote:
> > > > > This is a follow-up of the work to support the interactions between the hotplug
> > > > > and the scrambling support for vc4:
> > > > > 
> > > > > https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@cerno.tech/
> > > > > https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@cerno.tech/
> > > > > 
> > > > > Ville feedback was that the same discussion happened some time ago for i915,
> > > > > and resulted in a function to do an full disable/enable cycle on reconnection
> > > > > to avoid breaking the HDMI 2.0 spec.
> > > > > 
> > > > > This series improves the current scrambling support by adding generic helpers
> > > > > for usual scrambling-related operations, and builds upon them to provide a
> > > > > generic alternative to intel_hdmi_reset_link.
> > > > 
> > > > Out of curiosity, can we rebuild intel_hdmi_reset_link on top of these?
> > > > Always better to have two drivers to actually show the helpers help, than
> > > > just one.
> > > 
> > > Unfortunately, I don't have any Intel system I can test it on, and it
> > > looks like the changes wouldn't be trivial.
> > > 
> > > Maybe we can use dw-hdmi instead?
> > 
> > Hm I guess so, maybe Ville can be motivated. Just figured since this seems
> > at least inspired by i915 code.
> 
> It's not really the conversion to the new helper that I suspect would be
> hard to do, but rather the usage of the connector state that we do, and
> the scrambling computation, and how it's all tied together in i915.
> 
> It seems to be fairly different from drivers that just rely on the
> atomic helpers, and I'm not really confident about changing that. But
> yeah, I guess I can give it a try and rely on the CI.

Hm yeah if wiring through connector state to the right places is real work
then skip the conversion. But I thought i915 modeset code has also gone
through some of the state rollout that you've done for atomic helpers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
