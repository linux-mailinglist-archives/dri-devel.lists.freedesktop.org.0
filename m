Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341587843B8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 16:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6298E10E379;
	Tue, 22 Aug 2023 14:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FB910E382
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 14:16:12 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52a1c58ef30so163349a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1692713770; x=1693318570;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+SKjmXyjgW8f0jHgaxs5wpqMPdIa4R/pbZOYFHEPPA=;
 b=SpnoVaRonUjrgyDJXIvwvFu13QgmHtL/ixGxOgt80D1bodvpJetwRJQx4BWvNcGCq4
 aefsFgsXAIZlZ1QZIPoDATj2xL21rgM8MXxFxymaqAbFkJGEfAuWGg+IV5m6zOxhyD+c
 B+63hHB9SZHpsDpaFr7tiepBRRWAMnlkwGP6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692713770; x=1693318570;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+SKjmXyjgW8f0jHgaxs5wpqMPdIa4R/pbZOYFHEPPA=;
 b=U+Iq3Q9gVoxM9Xd5WGtXUDzXM/e6k8pEELY6NcJkgeOwnm1mlQf9KTZ69uHTzuV6dC
 ASCTqGMpttzsJTtHdw8q6aBfWzVhFZmIGK1/Msm+1F64IKipH8/eSnsKjob0DFKojAP2
 /IT8XK2cw0KYjZdScrcTS1GZ+uxfSvvVZ7KguMQye4VtkY9uWn35xangZd1o68NBdL6U
 J3qRyEKBvKdq9SL9I2s1EJ2Q7N3DPiekBL8e4Ne1RXTOsTnfcYb2Ytw8EUC6JkaKJUyu
 FMpksATzJpEywMB3K4kvz2PZBj9zaBri9rb6rFAp9ewni0Cuj/f0qtuKZy/fJ6Ah3cFi
 oBeQ==
X-Gm-Message-State: AOJu0Yz82g4kDRrjG9FeEdhhouDK0cDZ9NdQSN1yPr61MRm8amFEQe30
 KMYv/RGLDbRt0RI8ydb1uakeKg==
X-Google-Smtp-Source: AGHT+IFtzxGQWngpXbT1IIq1urWfPMwb8J4VPPTf913Ygr9DTCR03kQ4lnOqbph9Vi8HtttHNrZ3Qw==
X-Received: by 2002:a05:6402:518f:b0:523:4069:182c with SMTP id
 q15-20020a056402518f00b005234069182cmr6322721edd.2.1692713770660; 
 Tue, 22 Aug 2023 07:16:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q1-20020aa7da81000000b0052237dfa82fsm7627876eds.64.2023.08.22.07.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 07:16:10 -0700 (PDT)
Date: Tue, 22 Aug 2023 16:16:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC 00/13] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <ZOTDKHxn2bOg+Xmg@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Emma Anholt <emma@anholt.net>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 03:56:12PM +0200, Maxime Ripard wrote:
> Hi,
> 
> Here's a series that creates a subclass of drm_connector specifically
> targeted at HDMI controllers.
> 
> The idea behind this series came from a recent discussion on IRC during
> which we discussed infoframes generation of i915 vs everything else. 
> 
> Infoframes generation code still requires some decent boilerplate, with
> each driver doing some variation of it.
> 
> In parallel, while working on vc4, we ended up converting a lot of i915
> logic (mostly around format / bpc selection, and scrambler setup) to
> apply on top of a driver that relies only on helpers.
> 
> While currently sitting in the vc4 driver, none of that logic actually
> relies on any driver or hardware-specific behaviour.
> 
> The only missing piec to make it shareable are a bunch of extra
> variables stored in a state (current bpc, format, RGB range selection,
> etc.).
> 
> Thus, I decided to create some generic subclass of drm_connector to
> address HDMI connectors, with a bunch of helpers that will take care of
> all the "HDMI Spec" related code. Scrambler setup is missing at the
> moment but can easily be plugged in.
> 
> Last week, Hans Verkuil also expressed interest in retrieving the
> infoframes generated from userspace to create an infoframe-decode tool.
> This series thus leverages the infoframe generation code to expose it
> through debugfs.
> 
> This entire series is only build-tested at the moment. Let me know what
> you think,
> Maxime

I think the idea overall makes sense, we we probably need it to roll out
actual hdmi support to all the hdmi drivers we have. But there's the
eternal issue of "C sucks at multiple inheritance".

Which means if you have a driver that subclasses drm_connector already for
it's driver needs it defacto cannot, or only under some serious pains, use
this. Which is kinda why in practice we tend to not subclass, but stuff
subclass fields into a name sub-structure. So essentially struct
drm_connector.hdmi and struct drm_connector_state.hdmi instead of
drm_hdmi_connector and drm_hdmi_connector_state. The helper functions to
set it all up would all still be the same roughly. It's less typesafe but
I think the gain in practical use (like you could make i915 use the
helpers probably, which with this approach here is practically
impossible).

The only other nit is that we probably want to put some of the hdmi
properties into struct drm_mode_config because there's no reason to have
per-connector valid values.

Also, it might be really good if you can find a co-conspirator who also
wants to use this in their driver, then with some i915 extracting we'd
have three, which should ensure the helper api is solid.

Cheers, Sima


> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (13):
>       drm/connector: Introduce an HDMI connector
>       drm/connector: hdmi: Create a custom state
>       drm/connector: hdmi: Add Broadcast RGB property
>       drm/connector: hdmi: Add helper to get the RGB range
>       drm/connector: hdmi: Add output BPC to the connector state
>       drm/connector: hdmi: Add support for output format
>       drm/connector: hdmi: Calculate TMDS character rate
>       drm/connector: hdmi: Add custom hook to filter TMDS character rate
>       drm/connector: hdmi: Compute bpc and format automatically
>       drm/connector: hdmi: Add Infoframes generation
>       drm/connector: hdmi: Create Infoframe DebugFS entries
>       drm/vc4: hdmi: Create destroy state implementation
>       drm/vc4: hdmi: Switch to HDMI connector
> 
>  drivers/gpu/drm/Makefile             |    1 +
>  drivers/gpu/drm/drm_hdmi_connector.c | 1112 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c       |  720 ++++------------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h       |   37 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c   |    4 +-
>  include/drm/drm_connector.h          |  256 ++++++++
>  6 files changed, 1508 insertions(+), 622 deletions(-)
> ---
> base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
> change-id: 20230814-kms-hdmi-connector-state-616787e67927
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
