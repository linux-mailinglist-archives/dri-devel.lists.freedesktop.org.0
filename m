Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3097E4D2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 04:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3A110E141;
	Mon, 23 Sep 2024 02:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZV+R05r1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164FC10E141
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 02:37:25 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7a99e8ad977so324569985a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 19:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727059044; x=1727663844; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VIqzX0FBqD/ZNeBFpuyexZ2T62Ip7J8jtfwLOqLZqmY=;
 b=ZV+R05r1Ni3VKvKU2zFlFs3o4Kk8bN0NeW1S8qVJBvpsXdyTHPq8rJ9eTb6WzjC9gJ
 7plLeP69U3ZUU6ehBL72wy9GkfPZ7zLirf5THVhfc2Ay6N6JrtrBWn3Y3zhtm24NJZlR
 HTfkmkm6q6vTpTnqLWF3VJT9Hlcr416SrgX6ZZcMVmtxBVdcnTCHhQcFEWP3NySYqAFk
 7kaKXu9EVu/GB9N6Y1kFRGTdE3BSjT7LOcpS7KQ8LgHOLIq1EyMAEBNCl5wSmJGqD+tj
 4N7bDJkH7p9BNMXRHamPJY2WWLh6E/BebxR0ryArQS+KYS56r6Xw0/OfvZtgs96olwrj
 Gt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727059044; x=1727663844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIqzX0FBqD/ZNeBFpuyexZ2T62Ip7J8jtfwLOqLZqmY=;
 b=BTimcBNnPxXIkphZVQg/jRifWTWXFkpt0U3+1sQeij242ikEi7ybcUYobBLXtoVrrO
 BPIKqZRpm3vdzWNDJnqkRHkVPY++IQkj9f7LmXS9WAxIKRH/U88FKNJ7vxhNFHyaUx2x
 qdNdXCAgNlfitEIvxSKjILlWdVfbp0PIvkCpztDgR6STJ790xwg455zAwdKYVDJ67P70
 HKT0FckoIikp1MuzeNkMGKPvNsT0cP4nY6ewBGAnonH54lMO142E/bh9vzV43nDKMhbD
 KV+Wb8TJYKek9qKlxE3LUPMZoVyA3bEts7M0QzOHOa5aj6G2dNVtLEcR6/t+AZAn3AaR
 kb1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4gGoKsVxjvph80+0onjj76VJdqRA4PxbXboIlVAXi9BVL0Q8Dv8DdnWtZnBdrqPAJcUpulCyOZ44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy4qnK+XEZgoisiaAYkNPvAsIOmDVn6fPIrL6t0ne7mnm/ioV8
 4YJNJuon1fl4ccPBTD0j4FwGAibanxU5uQPTnnUQhzaoj0Ap3IIp
X-Google-Smtp-Source: AGHT+IE+mYw96iWRcnEj8dIXoH9CWm44dytWYvziov5CUGy0gWmSkBVDokP8NrxBtb+/rO6CisPuug==
X-Received: by 2002:a05:6214:3904:b0:6c7:c81a:690f with SMTP id
 6a1803df08f44-6c7c81a6970mr133771536d6.7.1727059043749; 
 Sun, 22 Sep 2024 19:37:23 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c75e557a79sm42696686d6.76.2024.09.22.19.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 19:37:22 -0700 (PDT)
Date: Sun, 22 Sep 2024 22:37:19 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <mm52ohzvg6v2ggnlzin5i2bofuustwpmjhwtd23yyak3wv4ivt@z642uzexaumy>
References: <20240905124432.834831-3-lanzano.alex@gmail.com>
 <5brnhm3yqqbsnukllo4l53ohaeqmxum53mwq7dme74ny5dsnjq@shjoravp6beg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5brnhm3yqqbsnukllo4l53ohaeqmxum53mwq7dme74ny5dsnjq@shjoravp6beg>
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

On Sun, Sep 22, 2024 at 11:14:17PM GMT, Dmitry Baryshkov wrote:
> On Thu, Sep 05, 2024 at 08:44:00AM GMT, Alex Lanzano wrote:
> > Add support for the monochrome Sharp Memory LCDs.
> > 
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > ---
> >  MAINTAINERS                         |   6 +
> >  drivers/gpu/drm/tiny/Kconfig        |  20 +
> >  drivers/gpu/drm/tiny/Makefile       |   1 +
> >  drivers/gpu/drm/tiny/sharp-memory.c | 682 ++++++++++++++++++++++++++++
> >  4 files changed, 709 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Please sort out the review tags for dt bindings (either as a v7 or as a
> reply to the corresponding patch). Then the series can be applied.
> 

Will do! Thanks for the review!

Best regards,
Alex
