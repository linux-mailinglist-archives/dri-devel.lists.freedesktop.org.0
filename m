Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37E7844F3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9416810E38E;
	Tue, 22 Aug 2023 15:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C4D10E38E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 15:05:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-529c706ba0aso1023871a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1692716708; x=1693321508;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6aw1h5ltJY1xekDMwEa/K9T9lzVExgD9NzCephvXT7Q=;
 b=OrIw82ZxO05jS6YdzGOPgw0TxbG/69fheBkmjShD1KLKpUpUYqdJk0mFn7KnzgIioa
 VsaUvVaNm9QGi2zxPzk45Z7Xqva4xTNpgp59QR926dgrsK3+rOseu1IB/j9EOJbb4obp
 ux7PXJXTiDQA9HE+L/XuXPX5TrYwocM+pDHfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692716708; x=1693321508;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aw1h5ltJY1xekDMwEa/K9T9lzVExgD9NzCephvXT7Q=;
 b=YbDySGacNKsg5S0o2ddnmL+43W9YZ+wwbMUB7ZIBvTicZAF/gIu0MwD2qKOtie6Qe/
 KfLEwFRpMHfWpvyvy5N/+jKDVFz+Nz8iEPGj91RcjaikgQXdLkbU6oafweAoPDQPEgE0
 Nh1Yx7vS4DevXWQqsKrukOVLC4OMvLWA1wiourmeB9OXq3oeB8f1lLvTnKsqpfwT4f/F
 mUtu8F7Q2SCB1h4ThIhAXTldArs+xRFkWwi0hdt3SC6NRwVHcgVcKwITfrsdFrEda/EL
 QDE3Uar+enqbQOAX9tgnnUg7edp6YS7hGYaT1d8/YW0iAPyeO/WQKoyN7IqRqgBqN0Do
 rPyg==
X-Gm-Message-State: AOJu0Yyj5VJZsGdi/L+NCh9w+lr65WMYCZqK5gEG5/Cv8SiyomN+yy74
 WetQ8m7jzfL8BlHCDq7WMl5Rag==
X-Google-Smtp-Source: AGHT+IHKUPeWelpuX45Y7jiCCZzspAkZ8+9vFiWM5y0dmpuiiz/NkCIJmz7A6LWRi7SXKrRyoxMRQg==
X-Received: by 2002:a05:6402:268e:b0:523:2e64:122b with SMTP id
 w14-20020a056402268e00b005232e64122bmr7600966edd.3.1692716708186; 
 Tue, 22 Aug 2023 08:05:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g21-20020aa7c855000000b005255f5735adsm7747597edt.24.2023.08.22.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 08:05:07 -0700 (PDT)
Date: Tue, 22 Aug 2023 17:05:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH RFC 00/13] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <ZOTOoSATcVk9vaPn@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Emma Anholt <emma@anholt.net>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
 <ZOTDKHxn2bOg+Xmg@phenom.ffwll.local>
 <sh3f7nuks7cww43ajz2iwrgzkxbqpk7752iu4pj4vtwaiv76x4@itnf6f2mnbgn>
 <87pm3f5dvo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm3f5dvo.fsf@intel.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 05:51:39PM +0300, Jani Nikula wrote:
> On Tue, 22 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > Hi,
> >
> > On Tue, Aug 22, 2023 at 04:16:08PM +0200, Daniel Vetter wrote:
> >> On Mon, Aug 14, 2023 at 03:56:12PM +0200, Maxime Ripard wrote:
> >> > Here's a series that creates a subclass of drm_connector specifically
> >> > targeted at HDMI controllers.
> >> > 
> >> > The idea behind this series came from a recent discussion on IRC during
> >> > which we discussed infoframes generation of i915 vs everything else. 
> >> > 
> >> > Infoframes generation code still requires some decent boilerplate, with
> >> > each driver doing some variation of it.
> >> > 
> >> > In parallel, while working on vc4, we ended up converting a lot of i915
> >> > logic (mostly around format / bpc selection, and scrambler setup) to
> >> > apply on top of a driver that relies only on helpers.
> >> > 
> >> > While currently sitting in the vc4 driver, none of that logic actually
> >> > relies on any driver or hardware-specific behaviour.
> >> > 
> >> > The only missing piec to make it shareable are a bunch of extra
> >> > variables stored in a state (current bpc, format, RGB range selection,
> >> > etc.).
> >> > 
> >> > Thus, I decided to create some generic subclass of drm_connector to
> >> > address HDMI connectors, with a bunch of helpers that will take care of
> >> > all the "HDMI Spec" related code. Scrambler setup is missing at the
> >> > moment but can easily be plugged in.
> >> > 
> >> > Last week, Hans Verkuil also expressed interest in retrieving the
> >> > infoframes generated from userspace to create an infoframe-decode tool.
> >> > This series thus leverages the infoframe generation code to expose it
> >> > through debugfs.
> >> > 
> >> > This entire series is only build-tested at the moment. Let me know what
> >> > you think,
> >>
> >> I think the idea overall makes sense, we we probably need it to roll out
> >> actual hdmi support to all the hdmi drivers we have. But there's the
> >> eternal issue of "C sucks at multiple inheritance".
> >> 
> >> Which means if you have a driver that subclasses drm_connector already for
> >> it's driver needs it defacto cannot, or only under some serious pains, use
> >> this.
> >
> > That's what vc4 is doing, and it went fine I think? it was mostly a
> > matter of subclassing drm_hdmi_connector instead of drm_connector, and
> > adjusting the various pointers and accessors here and there.
> >
> > It does create a fairly big diffstat, but nothing too painful.
> 
> The main pain point is not the diffstat per se, but that *all* casts to
> subclass need to check what the connector type is before doing
> so. You'll also get fun NULL conditions that you need to check and
> handle if the type isn't what you'd like it to be.
> 
> Currently i915 can just assume all drm_connectors it encounters are
> intel_connectors that it created, always.
> 
> Basically this has blocked the writeback connector stuff for a few years
> now in i915, because writeback forces a different subclassing, and what
> should be a small change in i915 turns into huge churn.

Yeah after the writeback experience I'm heavily leaning towards "this was
a mistake".

For writeback we could refactor it I think by just moving it all (which I
hope isn't too much churn), and then removing the then empty types (which
is where the big churn kicks in, so maybe just add that to gpu/todo.rst).

Cheers, Sima

> 
> BR,
> Jani.
> 
> 
> >
> >> Which is kinda why in practice we tend to not subclass, but stuff
> >> subclass fields into a name sub-structure. So essentially struct
> >> drm_connector.hdmi and struct drm_connector_state.hdmi instead of
> >> drm_hdmi_connector and drm_hdmi_connector_state. The helper functions to
> >> set it all up would all still be the same roughly. It's less typesafe but
> >> I think the gain in practical use (like you could make i915 use the
> >> helpers probably, which with this approach here is practically
> >> impossible).
> >
> > Ack.
> >
> >> The only other nit is that we probably want to put some of the hdmi
> >> properties into struct drm_mode_config because there's no reason to have
> >> per-connector valid values.
> >
> > What property would you want to move?
> >
> >> Also, it might be really good if you can find a co-conspirator who also
> >> wants to use this in their driver, then with some i915 extracting we'd
> >> have three, which should ensure the helper api is solid.
> >
> > I can convert sunxi (old) HDMI driver if needed. I'm not sure how
> > helpful it would be since it doesn't support bpc > 8, but it could be a
> > nice showcase still for "simple" HDMI controllers.
> >
> > Maxime
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
