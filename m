Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F6851A08
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 17:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0372D10EE07;
	Mon, 12 Feb 2024 16:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RNn60uBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486D210EE0F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 16:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707756641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TIcanmJFh8OPOVmDOrpmbmUyTV3lXM89KPniWNZSbRk=;
 b=RNn60uBThYajkpzZ2h53Zfb1RkAmfmpVL0sZA0+dYBqrOfZ38SgF+RnHq8Ab/ILEewMdm5
 IeYyKQre2+DKmQr3AOFL7KNqMQrQ3AFqRgh+fPjBf6OzpRtgf1NXq5CWBQphu4Z7GK6qAu
 I9WpgEsr1xL8kmG/VpGicQ91M7N96s0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-C4UfDQIAN4Cnak9rzXm9Bw-1; Mon, 12 Feb 2024 11:50:39 -0500
X-MC-Unique: C4UfDQIAN4Cnak9rzXm9Bw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33b376cc518so2037720f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 08:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707756638; x=1708361438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIcanmJFh8OPOVmDOrpmbmUyTV3lXM89KPniWNZSbRk=;
 b=AFMMJC9sdYeIiiZi+f5icARJl82iwPZms1z3tvDRy8m6ylOt++YqGgruTBF5Hv5yH7
 /0HkdfblZ2NaC3RiD5YGDBf7VuYq+PKHOHPwnS/BNWF/LcKjyXoh0wWqvN/ntIKYU96M
 MkKMyTJTuymRXCl2pFBs84Rw9KPNBN4LltAuYBBoDFkuCx5+RSsxW1lsuGr+/4QXCvB/
 AbunnlqKjy4bph2kIkHNc0gCFgTxOBPFYuOkOGqWXZiuMMWr7+1DzkI+Qjm6tuMNxY/0
 AnDrIFJP4N9QfED3bWZtJzL2jz8I68CfmcJ/mNT2brc+A+L49ywYLawE7E6WmeRiwBic
 ZzKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVie0k09zhnL+WD1N9oMQC9DhZB1pQWiakLihuQ3wkjiQmUK6G2Rp9+aEJDR/YdT6QHrVhVUMF6sQLWgmRPEEhVQYyLRCr73fpYUaGO0lm8
X-Gm-Message-State: AOJu0YwEGq6w4bVLg03Un+d3oV/QhRsv9hNHL1qmuIEeK1zsxHpLGiLQ
 KLxHW2NU0p2t+y1Uf9AccbWP/quyg7PlKJ0jPd87CZ97Rqzni4TGceiYxdnC8gEnIkVRrlT0few
 4gGHP3nJHehB+LBVcSQk1TWFljbSzL2RnuG1JWgTgSdl3/YB57++yQtOEHkl8RuC51Q==
X-Received: by 2002:a05:6000:1746:b0:33b:61f7:1592 with SMTP id
 m6-20020a056000174600b0033b61f71592mr5026253wrf.30.1707756638686; 
 Mon, 12 Feb 2024 08:50:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+K4j8VHH2hEOjhBMNen2KFTaqfrQIxyk4SH8HpPhI0T5R3hY64+Fx6yWcDxeRPbyWbKxoeg==
X-Received: by 2002:a05:6000:1746:b0:33b:61f7:1592 with SMTP id
 m6-20020a056000174600b0033b61f71592mr5026244wrf.30.1707756638394; 
 Mon, 12 Feb 2024 08:50:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWH3UvyQWiMaLm3We5Afgl2NJvnMEBXjUTE7oG1EVGzbcqQ6fzc954KIWwYfZX5GE3SRg3ElObO4ED2inDorB6onZ+3W9RzYHENGDk++zYW/KzZBrHcCmeuM+QiIlzICj41U0DHvEqVyD0aW5Y3opTZw2U3LXk98MFEGXdtDKnwioqmNg==
Received: from toolbox ([2001:9e8:89a4:db00:6e8f:bfe4:6e0:1fe8])
 by smtp.gmail.com with ESMTPSA id
 en8-20020a056000420800b0033b17880eacsm7222918wrb.56.2024.02.12.08.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 08:50:37 -0800 (PST)
Date: Mon, 12 Feb 2024 17:50:36 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, contact@emersion.fr
Subject: Re: [PATCH] drm: document userspace expectations around the
 Colorspace connector property
Message-ID: <20240212165036.GA1370407@toolbox>
References: <20240209165307.29856-1-xaver.hugl@kde.org>
 <20240212111015.2d22f0fa@eldfell>
MIME-Version: 1.0
In-Reply-To: <20240212111015.2d22f0fa@eldfell>
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

On Mon, Feb 12, 2024 at 11:10:15AM +0200, Pekka Paalanen wrote:
> On Fri,  9 Feb 2024 17:53:07 +0100
> Xaver Hugl <xaver.hugl@kde.org> wrote:
> 
> > Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index b0516505f7ae..01e13984629b 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -2158,6 +2158,14 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
> >   *     one supported. Sink supported colorspaces should be retrieved by
> >   *     userspace from EDID and driver will not explicitly expose them.
> >   *
> > + *     As userspace can't currently know whether or not the output is using
> > + *     RGB or YCC signalling, the driver must translate properties to their
> > + *     relevant RGB or YCC counterparts, depending on the actually used
> > + *     signalling. Property values that are only valid for either YCC or RGB
> > + *     and have no equivalent for the other signalling type must not be
> > + *     exposed as supported, unless the driver can guarantee it never uses
> > + *     the signalling that doesn't match the property.
> > + *
> >   *     Basically the expectation from userspace is:
> >   *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> >   *        colorspace
> 
> While this addition is good, I have another question:
> 
> Does "Colorspace" property choose also the RGB->YCbCr matrix that the
> driver will use when it happens to use YCbCr signalling?
> 
> So far we have only been talking about the primaries and white point.

Uh, yeah, good point. The InfoFrames do affect both the YCbCr conversion
and the transfer characteristics that the sink expects. Drivers should
do the RGB to YCbCr conversion with the new matrix. I think (and very
much hope) that drivers don't rely on the TF for any internal processing
but if they did, they also should use the one the sink expects.

