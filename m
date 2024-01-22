Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD2835FD5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 11:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E616810ECB7;
	Mon, 22 Jan 2024 10:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A26610ECB7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 10:36:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso36846235e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 02:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705919733; x=1706524533; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rUhedLANF6aIr3k765vrW+w3JqNpXJgjjbnL4/TWAKI=;
 b=zwuN3KhNGnKpP/s9X0Jmu/h6+5mHQvI5smkD/cnoZk/WEwqlzpPQGJWUPkRaQoBTjU
 pOKV0H5UfY5beCaApBZuSs6MRbEtXDksKnU27Wmww+ZkyvL22Ym0hZf6Q5OJTf+BQGv8
 s/ILx7VrwvrMPGAbFUdHBHGJzkg/aKEq1OJPkVlctiFLCYgabUfcqd0IpMgR4pEbhkEN
 luXy+O/Sn2VqejITSCf+lGXPEGEjUP81CWUKS1Qq0/yclkj9zmwWohKOnuIc2cdGHqPP
 oc4FS17xLTBPkxo4p1SKX10MneTyqbskiAJalpqtg1hOVCQQDBQ8roNP5q8WZTEgNfjr
 3Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705919733; x=1706524533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUhedLANF6aIr3k765vrW+w3JqNpXJgjjbnL4/TWAKI=;
 b=TWF/0cFlL0P/NpPnqEzL15YodhbX82i6cCGgh71m6xi7G4zla73+M5FF7K/BBaEblj
 iJ8OlGRqH8Lw4RsR/ESIdvBXFxYMNu7G/CmyTGkwJvD9/0jelKIjOidTuv1s9TaKOkK+
 EdBonri0D8Xxkb5o6svg1RQ2A6Y/ahJmFZEDJbevlPJqybq1D0bo8d/+f5TxAJXmUNtP
 dl7aRdWE/aBctXBEMoZAxflTF5qE5+WHY1YU2HthpbD5O7UVPO6pa7MoVu7GZm6bZvm+
 CBgksT4WG7m1lXMrJQqxH2BG+qRMzzsOawxJ5ySpGujY6uv/9m55V+M6+ROw9/LfFfOz
 9V1w==
X-Gm-Message-State: AOJu0YyVABR45qti+Jn5DN0voju2uTfJLokdUJ8iQcXCtRr61m9R/dyD
 T2+p7BkswoIMHqpewuCtLhhQ3xxiHVxtM9uO257D8TcHxrjqoS46/0brY7klBlI=
X-Google-Smtp-Source: AGHT+IFo4uYcYhEMgaOqtoirV3HNE4KGl6mvkTyKH6pc8vp05HpIszygaGV8C/JBWJqaJ8OjRn6KTQ==
X-Received: by 2002:a05:600c:2182:b0:40e:6b84:ee71 with SMTP id
 e2-20020a05600c218200b0040e6b84ee71mr1168765wme.336.1705919732646; 
 Mon, 22 Jan 2024 02:35:32 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c155200b0040d87100733sm38828236wmg.39.2024.01.22.02.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 02:35:32 -0800 (PST)
Date: Mon, 22 Jan 2024 10:35:30 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] backlight: hx8357: Make use of device properties
Message-ID: <20240122103530.GC8596@aspen.lan>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-2-andriy.shevchenko@linux.intel.com>
 <87bk9novmp.fsf@minerva.mail-host-address-is-not-set>
 <Za0glbPfzeTjdZjn@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Za0glbPfzeTjdZjn@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 21, 2024 at 03:48:05PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 15, 2024 at 09:20:46AM +0100, Javier Martinez Canillas wrote:
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>
> ...
>
> > > +typedef int (*hx8357_init)(struct lcd_device *);
> >
> > This kind of typedef usage is frowned upon in the Linux coding style [0]
> > (per my understanding at least) and indeed in my opinion it makes harder
> > to grep.
> >
> > [0] https://www.kernel.org/doc/Documentation/process/coding-style.rst
>
> Thanks for pointing this out. However, this piece does _not_ clarify typedef:s
> for function pointers which I personally find a good to have.
>
> ...
>
> > > -	ret = ((int (*)(struct lcd_device *))match->data)(lcdev);
> >
> > This is what I mean, before it was clear what was stored in match->data.
> > But after you changes, what is returned by the device_get_match_data()
> > function is opaque and you need to look at the typedef hx8357_init to
> > figure that out.
>
> The above is so ugly in my opinion, that justifies using typedef:s even
> if you are quite skeptical about them.

FWIW I was pretty skeptical about it to. Largely because the three
touchs (typedef, variable initialization, use) spread things
around a bit too much.

Can we at least name the type to make it obvious that it is a function
pointer? Something like hx8357_init_fn .


Daniel.
