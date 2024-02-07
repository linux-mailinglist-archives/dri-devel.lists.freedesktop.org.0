Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106884C8CA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 11:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF58310EFCD;
	Wed,  7 Feb 2024 10:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fIBLdam4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE7410EFCD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 10:39:52 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc6af9a988eso322270276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707302391; x=1707907191; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GvY+WSiS1zI1+PqrE+k4bBcggoEtuFvZaH+5w24QDOs=;
 b=fIBLdam4AAE6gEu2HxbmkXFSZyMW/ox7UZZu0vmR1uhsBTcxE6KprOrUjCH6dQpyKn
 exhOuL6qhBb/lMzN5eUE2TRFowbWH9KsjPXiezJ564oeFHXugXdRnyy8kGzdmy2HNKGv
 0jliNXO5brjcoPguwEVWBt3HfxvdgwSKu7j9InnCoh55j3LtDieKcQLaP6ZRVzZk4NPp
 BAznZ+ylRjQ4EvUlgzLuqjXf7MjbmZ6ASgCO3GEkPJ2JU0a5BPjQFTUnEqtywpNk69Ka
 Op0t7c/ShwBTqrBV50HOLCqsy6yBJdVF5vCWapogBV8NLj38Qz9M4RyLFoF8ssttt9FQ
 njTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707302391; x=1707907191;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GvY+WSiS1zI1+PqrE+k4bBcggoEtuFvZaH+5w24QDOs=;
 b=Y/XnBuB6QEKC1N5KFPMFZaJRWDva0jNM/RcvCtkMYy0pw9oIDjHe/MveznApE/WXsm
 M1EbMrvaPzoJv5iftvgNomV1CZYRyYKa5+kCYx1wfiYLRy3N7Hh3T1m9/hnYmsvEoaZ0
 Xl+5zzqRn2E6g9QXQiRSsApsT1ENORywH6ZsVsduDq/0JWxninsh497TstbB2Mz99GUo
 E2xQv2mK0hWZF/FnULInLZrTWxNFunqL50v4KqLNijeGNRW/eaM0htXPp8d15Hxi2UGH
 OGhNrRPi0nQiy+Bi8Z0gyRLt4jMHp+ZDQolg4lctdNwU3fKccRVuYzzcijJOaulMWxEz
 SB5g==
X-Gm-Message-State: AOJu0Yy2wRcO9qwjb43VtoyMOC90aXTEznOdd4SSJVsI2CYWNPno3k7A
 6LH+JZZ91PnNaUfNgTUt4hTd7lY1qUtcBXzU9X4bDHsixncAXaz3tI1n+t05lKTtrLIEo6TuoEm
 nCQNKA3VXF6hzFJIkDA0AgSNo3v+0ePuQdtb8Cg==
X-Google-Smtp-Source: AGHT+IFHtFKOIhSveVFD/TROCOxd/QHma4B7KzpMcCU9j8LUGg8Tqu/tNwIMsfwXilDzhbXzrjZZBZEpZ33fvT7mMq4=
X-Received: by 2002:a25:ab50:0:b0:dc6:f90f:e376 with SMTP id
 u74-20020a25ab50000000b00dc6f90fe376mr3978312ybi.45.1707302391434; Wed, 07
 Feb 2024 02:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
 <20240203-bus_cleanup-gpu-v1-1-1b6ecdb5f941@marliere.net>
 <CAA8EJpqYH3CM8exv68S7KU-CK5r=jM81UPjiW09qOiqrg1ThKg@mail.gmail.com>
 <ZcJKSCbAwm7SYx4v@phenom.ffwll.local>
In-Reply-To: <ZcJKSCbAwm7SYx4v@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 12:39:40 +0200
Message-ID: <CAA8EJpoiAad1Sgjgt-gxKf4YxEQ8T9LcC=DQQy8vn82KAf5USw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: display: make dp_aux_bus_type const
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 6 Feb 2024 at 17:03, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Feb 04, 2024 at 10:24:46AM +0100, Dmitry Baryshkov wrote:
> > On Sat, 3 Feb 2024 at 22:20, Ricardo B. Marliere <ricardo@marliere.net> wrote:
> > >
> > > Now that the driver core can properly handle constant struct bus_type,
> > > move the dp_aux_bus_type variable to be a constant structure as well,
> > > placing it into read-only memory which can not be modified at runtime.
> > >
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Just to make sure this doesn't fall through cracks, I'm assuming you'll
> push this to drm-misc-next too, right?

I was out at FOSDEM, now done.

-- 
With best wishes
Dmitry
