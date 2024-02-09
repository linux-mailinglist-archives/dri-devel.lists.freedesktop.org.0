Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27AF84FDA2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 21:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DC410E93D;
	Fri,  9 Feb 2024 20:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HqWqpM9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F51C10E93D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 20:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707510880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2wWnG4c9flOTNWJ6O8wnfxhMZrHV7GwnwMrXW3f8A8=;
 b=HqWqpM9AZiaTePbJd2qdRTOIN/0UnuyADdnZpRFYdZR2gMb+o632vufDUmY1eSkPd9TeBm
 leFEhLUd1oeZch84S/ZdfhIQpRnYAPMBrwAVpfX9GBtzJjXJ1xv5+SObyj5JVYhIdR+uxG
 ZN878sEDKBSfS3GDnOyXW8LVrn5zGw8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-CZX3Pj_bOjyJGByqQ_VuYQ-1; Fri, 09 Feb 2024 15:34:39 -0500
X-MC-Unique: CZX3Pj_bOjyJGByqQ_VuYQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41005484bf3so9343525e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 12:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707510878; x=1708115678;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j2wWnG4c9flOTNWJ6O8wnfxhMZrHV7GwnwMrXW3f8A8=;
 b=WB/1JiJ3iD53KxcdrK81tnu+ZvXHF60YZrB2BRw//zR7b3SaFL24w7ytV5RYevjHRc
 g8g4QAYHyChUfFG+jQy4QVJDefVjq9cvxUl977lyN57+1ESZB4BlLQ/vxrrgP/UCDWVt
 H22NKfgb/KthQoDlgft1kPhq7asiCBSkyKX4bk4iKhKkUGrcpPh4nPn9eQgAR8syPWVE
 amkZfK+JXfeSpgKMYUGrNJHtpIQuWbTE5mlY3nM1F0Q1hb8o2qJy6G+vbxsnx+/w1HJJ
 OxlYpg/yPTplLWfqY3oO/TSnU0evG8PhLWSRoM2bPljGcJGEgtMmr26VFq82JFx3eP5Z
 4Yqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0t0/YNUx5NBdbp4vS4nyMqsrvc1EVLP/OgrW3ftsuxzO5enKPA9ed8MOkDViHC36LuGfb2bPfICgJNSlniuiDcCZSFYp8cEhDWhWllRDF
X-Gm-Message-State: AOJu0YwusZtw2S098VF2jGCDvbUkYF/63ac4s5bxFym2HOy3KqNfk9lU
 KDYFd1XnI7e/2BY7/p26XpSvok+zQvXRZ1l09IdAFtZin/PnVzysD4/ZWTNkqhIt8Zu4bChgVpk
 NvdqE/JjihYbYEJWkngjfA6kSlqG+NIK+GKMNPTD6VM30bIV5p08XlJLIhS8Nc9wzpQ==
X-Received: by 2002:a05:600c:1da0:b0:410:67c7:4aec with SMTP id
 p32-20020a05600c1da000b0041067c74aecmr360331wms.2.1707510878045; 
 Fri, 09 Feb 2024 12:34:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF13pfF52uklm5dhWcBcvNdikZJOPXaH04X4IAFneBMKzMG8gczhKEBhOer9kGWxz4bpMboiA==
X-Received: by 2002:a05:600c:1da0:b0:410:67c7:4aec with SMTP id
 p32-20020a05600c1da000b0041067c74aecmr360309wms.2.1707510877712; 
 Fri, 09 Feb 2024 12:34:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTFIpsyOPGLuOIRqyqojYZLXShV7fMVG8lKMKh8RWmrfILG4wVCf8gLUYnmxYZ6GojncTWgKEfP5koXhwu+L8mW7OdvkwtZN0qrjcaqiHaZqA7TU3roMpuu6JlMFFn+4qCBNlcejLlIfxt7yTqAQw44eq+2Gt3YvBKnODhx8UY004UIxjjJmMD1qB8k6iA5fh1kaHrSuUy+P8HziuYc5LiaFqmAu6pVpkvLeEb2evFtiqUaryp00KXCh/C+JzQZfr8YsNSQzKLSVIflmMGGpSXjhNZz7cEqPFNSPjqXXehfees138vEzAxsGDxWT/4m4Kb+BvL/VwHZf7h55cfdzPilGIWTQfjIlqsRLmTFjyNer9tvYV+fHP5NIvBrWkMuwK4zw081lC9wBo9G6v4Lqk9xFPzRi8ziXvrhzNkJGbvi8TR/Z2Bgw/uoru6FUJCpZZJRqb7Ak7PPwX2n1rGOXJPLjAI40lx4ryIIzK0+gPD5GtLOxedGKUhcKBzmmJYY3EPUoCscwHprrNUxAOqFjsFt9Dfx9HtZzehHYRn9fzQ/33OGqc6nEBUZ8In8El5X3dvcPBxG9zUrq9xbcPP0dphQoN8skR0FjYoQt0mIrjjraq/ahk149YTxa6askU6srquoL4TIMYWmij5nI37tV9iVNaet/SQt/58ZLbUrl60mQ==
Received: from toolbox ([2001:9e8:898e:7200:1f00:29c:19b0:2997])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a056000014200b0033b4acb999dsm115375wrx.98.2024.02.09.12.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 12:34:37 -0800 (PST)
Date: Fri, 9 Feb 2024 21:34:35 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast
 RGB property
Message-ID: <20240209203435.GB996172@toolbox>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
MIME-Version: 1.0
In-Reply-To: <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
> > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > Hi,
> > > > > 
> > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > >  /**
> > > > > > > >   * DOC: HDMI connector properties
> > > > > > > >   *
> > > > > > > > + * Broadcast RGB
> > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > + *
> > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > + *
> > > > > > > > + *      Automatic:
> > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > + *
> > > > > > > > + *      Full:
> > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > + *
> > > > > > > > + *      Limited 16:235:
> > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > + *
> > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > + *
> > > > > > > 
> > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > different things being affected:
> > > > > > > 
> > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > 2. The color pipeline processing
> > > > > > > 
> > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > 
> > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > 
> > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > signalling, what happens?
> > > > > > 
> > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > YCbCr?
> > > > > 
> > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > vc4 will follow the value of the property.
> > > > 
> > > > The property is literally called "Broadcast *RGB*".
> > > > That should explain why it's only affecting RGB.
> > > 
> > > Right. And the limited range option is called "Limited 16:235" despite
> > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > to make names inconsistent too, that's fine and not an argument in
> > > itself.
> > > 
> > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > to enable it.
> > > 
> > > vc4 supports it.
> > 
> > Someone implemented it incorrectly then.
> 
> Incorrectly according to what documentation / specification? I'm sorry,
> but I find it super ironic that i915 gets to do its own thing, not
> document any of it, and when people try to clean things up they get told
> that we got it all wrong.

FWIW, this was an i915 property and if another driver uses the same
property name it must have the same behavior. Yes, it isn't standardized
and yes, it's not documented (hence this effort here) but it's still on
vc4 to make the property compatible.

Trying to make the property handle YCbCr is very much in the "let's try
to fix the property" territory that I want to avoid, so I'm in favor of
adjusting vc4.

> > > > Eg. with DP it only became possible with the introduction of the VSC
> > > > SDP (and I don't recall if there's additional capability checks that
> > > > are also required). With DP MSA signalling full range YCbCr is not
> > > > possible at all.
> > > 
> > > This is for HDMI only.
> > > 
> > > > I don't recall right now what the HDMI requirements are.
> > > 
> > > HDMI has supported it for a while, and it's defined (for example) in the
> > > HDMI 1.4 spec in Section 6.6 - Video Quantization Ranges. It supports
> > > limited and full range on both RGB and YCbCr, as long as the EDIDs state
> > > so and the Infoframes signal it.
> > 
> > I think a good reason for not using a simple boolean like this 
> > YCbCr is that it doesn't cover the color encoding part at all,
> > which is probably more important than the quantization range.
> > So we need a new property anyway.
> 
> This isn't what is being discussed here, and as I've shown you, is
> completely orthogonal as far as HDMI is concerned.
> 
> Maxime


