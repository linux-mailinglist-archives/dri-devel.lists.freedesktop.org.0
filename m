Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A063D71EF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FFF6E8BD;
	Tue, 27 Jul 2021 09:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1856E8BD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:26:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so1351441wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nYeP4FpOYw9BT0vmTMGJN7ENtIxQlIM9ePRZKfQrUQY=;
 b=CMc+4VYWS4MIxa6JJJVMznfOpeyd2GeU670+ejJTEHUiCyjOmVDBQfLJjrQWG6Ke9M
 +K0HZicH3fhvOa/PiOncyb81QxYrXC/cNMPsGBo4QrwNVfLTIMRQ9bIkNxkmIYE5DKjX
 jMtC43ArGoU7WYnphCIcxNXUGjyjwzYrapal8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nYeP4FpOYw9BT0vmTMGJN7ENtIxQlIM9ePRZKfQrUQY=;
 b=Nqu51sT6tcp34MUk5B2AookmSC6/GRwkUgnlcru/U1qWft7pihGQt3jt6rztxdBi/w
 WTTFZgx9yVlvE3vqyv02kL7SzRtbGZRR0p9cMckt3xBe7pZbAV5FPWFsrbvIR4pUVoze
 qq12U2IjPNOLGUX/02dCcc3N5u6lfhzzGZoXsdlWx04d748M5BeAvdrMfTpLDkX1pKIV
 A8jNyf8SZh0ccqTPFdbI3OtIGSGYBiSST/aQT9pgT3J0QgFUESILFn/X5YDaDnJItFAp
 u4Qe4/X5TfjirPdb54y7zWYW5B9qDmdcL4cXhtvyDayz+SvAVqudTLegS5V39fSgQJg6
 7wGw==
X-Gm-Message-State: AOAM530eBSSy0b2OXPd48sca/2QhaPlFCobDH1an7poEemZez5KHpFPj
 riZaSz4+dsmjUt94Qepmkky732FCGFWoTw==
X-Google-Smtp-Source: ABdhPJwp+U6QkH5EfAhL6vd31F+QcAQE5HjaB5OLTTmYclyvIWYLrrmct5gFTYCvA3jyhhprpp7ilg==
X-Received: by 2002:a05:600c:322a:: with SMTP id
 r42mr3205063wmp.153.1627377985488; 
 Tue, 27 Jul 2021 02:26:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n186sm2515929wme.40.2021.07.27.02.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:26:24 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:26:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_mode_get_property
Message-ID: <YP/RPqNowY2hS6m7@phenom.ffwll.local>
References: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
 <YPgHeJ4gcKI1YaUa@phenom.ffwll.local>
 <QjQOQBq4Tf992ih6qPcE1Rw5VNKcjiPbctKkIBBbwFgudHtGSlI8-sNjPVLBUBfNIEbjlQFUa_oab6AGMPmyrQ656Hc2HOdBxLef7QCf5bw=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <QjQOQBq4Tf992ih6qPcE1Rw5VNKcjiPbctKkIBBbwFgudHtGSlI8-sNjPVLBUBfNIEbjlQFUa_oab6AGMPmyrQ656Hc2HOdBxLef7QCf5bw=@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 08:34:14AM +0000, Simon Ser wrote:
> On Wednesday, July 21st, 2021 at 13:39, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > I think it would be really good to link to
> >
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#modeset-base-object-abstraction
> >
> > for all the property related ioctl. That entire class vs instance
> > confusion is pretty common I think, which is why I even made a nice
> > picture about it :-)
> 
> I cannot figure out how to link to that page after blindly trying a bunch of
> magical Sphinx invocations. I must say, links aren't RST's forte, inserting
> them is as intuitive as mud.
> 
> Does anyone know how to do it?


I think the least intrusive one is `Title Test`_ or so. There's also other
places where we use :ref: but that's more cumbersome to read in plain
text.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
