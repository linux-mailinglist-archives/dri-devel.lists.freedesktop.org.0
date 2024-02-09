Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963384FD93
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 21:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD9C10FCAF;
	Fri,  9 Feb 2024 20:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WGotYMr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C32C10FCAF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707510650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8J/XbEGW4rTV6z/EaKBWgEwgI/IDyi1WgmOXHA89nc=;
 b=WGotYMr27pT+36i5HUsHVbr/Xhh9iblbhNbOX6ARY4C/mxDfg+L/vnbTpKBW1VsbKSgmup
 s2zSl166kd1JSfwjnZZ5vHW9J/OVKhY6kP6vU/lPqTck7UknCio5KGKUe2uOzR+lv+e1yT
 2pIz7LgfzH1zUKQE3tP9DLOGu5IQ3u4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-uFzDNAURPh-DMV5e8azEGA-1; Fri, 09 Feb 2024 15:30:49 -0500
X-MC-Unique: uFzDNAURPh-DMV5e8azEGA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40ff7e36f34so9493035e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 12:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707510648; x=1708115448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8J/XbEGW4rTV6z/EaKBWgEwgI/IDyi1WgmOXHA89nc=;
 b=eUPwkVJYaRN3ZLOseRHITdGvLwSu8JyMK4/buGlt0J6rD9lOhMkSdrRfoG240YaRQZ
 /50Gxs1LYfIhcCGNzPFs5iRE38TPRmtPi157UtlbSWFWpY/dFx0ypfFZ+WvWcizF8ylV
 ynUwxgBC3QKWBWKdsM3zl7jKt4BGZizvZbBWvF5gechI9lsbwS2yfdlpf0cBc87PARTK
 /toKe+Sg30fjqtACLKPicX3MA7uJ4/bcT9tnveThjdJo8RqepHoxd/hNsIfrq0cX/1Qr
 Aj+wtyon7CAOWmpIEW0jbRHfS80veTkS1C4W/iD6nR0kN61Zf/gyJU+wlva8jUqNUTt0
 KNVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1QLtg0OfuwgfNww2oH4JNLZ/ufBacBCkJN8NNp+MjRsgRBAYcBYr3s76nkBmMVmOe7YbUJlgXC46waPJjtI482UXWX35IvBN4qHpPIHup
X-Gm-Message-State: AOJu0YyPL7XG8YI27Q8MclSIgd+i41P+7vswAyTdWJ+RRyvxcKT9JPII
 Fnoc2fMhjI8bbAuB/ttncoyXglRNLfLPX30mn4jj576NK3uB415As5uNjegAEzFmjRyI0Ez7NgB
 mc/z1DzHVNtDeYE/sowqT2GRDvXLlFvXIHAAhI0uHuH4MF7XFny3Fvv8VTEAJuuN+hQ==
X-Received: by 2002:a05:600c:5248:b0:40e:f2d6:9dc with SMTP id
 fc8-20020a05600c524800b0040ef2d609dcmr299012wmb.33.1707510648627; 
 Fri, 09 Feb 2024 12:30:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn7tTpFP36Rfj//rT72qd9+jvGx2yenpz6/LSui/V8HYLJ/ywcOwSHhBf9szBB3acqUagp1Q==
X-Received: by 2002:a05:600c:5248:b0:40e:f2d6:9dc with SMTP id
 fc8-20020a05600c524800b0040ef2d609dcmr298995wmb.33.1707510648315; 
 Fri, 09 Feb 2024 12:30:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVcq9h0v46XkBbkpGmGw7p+gvFjC5M5dM9Vxo8+153Wr+2lSmDerGeFt0bQGagJ3AqQ62L9bMcfNAhyGp2EErv/jeUfhwoqxnFqHWXQmWyIufisWQ5NN+QWQZlhqNzGtg3ymkuvzMX62LPzGS7cu5QPu8iSUMsQ7o6o8mDsv/1PeyApbtC7c0tr4rM19hySOPuvNxflS+MbsX7T4dcy51FG4nTDSJDOHg2oTilImEUjF9D97lu6EPkSvViSU5ywMA6djQ5iy8zI6i8Z1CgH9ADUR4hIYgyTZ5dnpM5e3m41u/AzGTlyFFLd1f8XUHyiMrA2TbDmPUp5WspO/0kN3M4DJfVZl1bznOif8MLeUNZ6JMJUffSu4bpqe4e3RjzORPF4lNXqSILT96MQe6qWSLLYaiRE9viR3LceZoFPgmqQ4SLwrk5+FfsTiZKXV4pGD77JBdQi4X+LMuG+3Y6kX6rHBO1SJC2XaPIdkIlpeCi4v+S7sSmgEXReM8iiCvemxFkRuc3WnHLe1Fa0/cXLvqaT9xfK6QfieDTCNEXIlIWWWNaoUpH0eAyFuxH2qyqMoSV10vmbY//bU6qpp6m8rb//wF90dZGrVCRNumEXcMHCB/ll6EBPUktzLtXGDl4=
Received: from toolbox ([2001:9e8:898e:7200:1f00:29c:19b0:2997])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b003392206c808sm109606wrv.105.2024.02.09.12.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 12:30:47 -0800 (PST)
Date: Fri, 9 Feb 2024 21:30:46 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <20240209203046.GA996172@toolbox>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox>
 <niqn7eql5neyfp5ficdfisdpmlwrprovqn5g7lgcfwoe74ds23@7fr4yv2miqe7>
MIME-Version: 1.0
In-Reply-To: <niqn7eql5neyfp5ficdfisdpmlwrprovqn5g7lgcfwoe74ds23@7fr4yv2miqe7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Feb 02, 2024 at 04:49:04PM +0100, Maxime Ripard wrote:
> Hi Sebastian,
> 
> On Mon, Jan 15, 2024 at 03:33:08PM +0100, Sebastian Wick wrote:
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB
> > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > + *      Infoframes will be generated according to that value.
> > > + *
> > > + *      The value of this property can be one of the following:
> > > + *
> > > + *      Automatic:
> > > + *              RGB Range is selected automatically based on the mode
> > > + *              according to the HDMI specifications.
> > > + *
> > > + *      Full:
> > > + *              Full RGB Range is forced.
> > > + *
> > > + *      Limited 16:235:
> > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > + *              this works for any number of bits-per-component.
> > > + *
> > > + *      Drivers can set up this property by calling
> > > + *      drm_connector_attach_broadcast_rgb_property().
> > > + *
> > 
> > This is a good time to document this in more detail. There might be two
> > different things being affected:
> > 
> > 1. The signalling (InfoFrame/SDP/...)
> > 2. The color pipeline processing
> > 
> > All values of Broadcast RGB always affect the color pipeline processing
> > such that a full-range input to the CRTC is converted to either full- or
> > limited-range, depending on what the monitor is supposed to accept.
> > 
> > When automatic is selected, does that mean that there is no signalling,
> > or that the signalling matches what the monitor is supposed to accept
> > according to the spec? Also, is this really HDMI specific?
> > 
> > When full or limited is selected and the monitor doesn't support the
> > signalling, what happens?
> 
> Leaving the YCbCr vs RGB discussion aside, would this be better ?

Yes, it is. Thanks.

We do have to resolve the YCbCr vs RGB issue though.

>  * Broadcast RGB (HDMI specific)
>  *      Indicates the Quantization Range (Full vs Limited) used. The color
>  *      processing pipeline will be adjusted to match the value of the

Ah, another thing no note here is that the CRTC as configured by user
space must always produce full range pixels.

>  *      property, and the Infoframes will be generated and sent accordingly.
>  *
>  *      The value of this property can be one of the following:
>  *
>  *      Automatic:
>  *              The quantization range is selected automatically based on the
>  *              mode according to the HDMI specifications (HDMI 1.4b - Section
>  *              6.6 - Video Quantization Ranges).
>  *
>  *      Full:
>  *              Full quantization range is forced.
>  *
>  *      Limited 16:235:
>  *              Limited quantization range is forced. Unlike the name suggests,
>  *              this works for any number of bits-per-component.
>  *
>  *      Property values other than Automatic can result in colors being off (if
>  *      limited is selected but the display expects full), or a black screen
>  *      (if full is selected but the display expects limited).
>  *
>  *      Drivers can set up this property by calling
>  *      drm_connector_attach_broadcast_rgb_property().
> 
> Thanks!
> Maxime


